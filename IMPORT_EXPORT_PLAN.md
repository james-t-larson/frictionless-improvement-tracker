# Implementation Plan: Import/Export Functionality

This plan outlines the steps to implement a full data Import/Export system for movements and workout logs, accessible via a new sidebar.

## 1. Environment & Dependencies
Add the following packages to `pubspec.yaml` to handle file picking, sharing, and CSV parsing:
- `file_picker`: To select CSV/SQL files for import.
- `share_plus`: To share/save exported files.
- `csv`: To parse and generate CSV content.

## 2. UI/UX Changes

### Dashboard Enhancements
- **Hamburger Menu:** Add a hamburger icon button to the right of the search bar in `SearchAndActionBar`.
- **Sidebar (EndDrawer):** Implement an `endDrawer` in `MainDashboardScreen` that opens when the hamburger icon is tapped.

### Sidebar Content (`AppSidebar`)
- **Export/Import Accordion:** Replicate the accordion (collapsible) behavior from the home page (`_GroupedWorkoutLogRow` logic) to contain the following actions:
  - **Export CSV:** Triggers a full export of movements and logs to a CSV file.
  - **Export SQL:** Triggers a full export of the database state to a SQL script file.
  - **Import:** Opens a file picker to select a `.csv` or `.sql` file for data restoration.
- **Safety Dialogs:** Implement a high-friction confirmation dialog for SQL imports (Full Restore) requiring the user to confirm data loss.

## 3. Data Management Layer

### CSV Output Format & Merging Logic
To provide a human-readable and portable format, the CSV export will flatten the relational database into a single historical log.

**CSV Structure:**
| Column | Source Table | Description |
| :--- | :--- | :--- |
| **Date** | `workouts.timestamp` | ISO8601 formatted date string. |
| **Movement** | `movements.name` | The name of the exercise (e.g., "Bench Press"). |
| **Muscle Group** | `muscle_groups.name` | The primary muscle group associated with the movement. |
| **Variations** | `variations.name` | A pipe-separated list (e.g., "Incline|Dumbbell") of variations applied to the set. |
| **Weight** | `workouts.weight` | Numeric weight value. |
| **Reps** | `workouts.reps` | Number of repetitions performed. |
| **Pain** | `workouts.pain_felt` | Boolean (1 for true, 0 for false). |

**Merging Logic:**
The export engine will perform a complex join to aggregate this data:
1. **Base:** Start with the `workouts` table.
2. **Join Movements:** `LEFT JOIN` the `movements` table on `movement_id`.
3. **Join Muscles:** `LEFT JOIN` the `movement_muscles` and `muscle_groups` tables to find the entry marked as `is_primary = 1`.
4. **Aggregate Variations:** `LEFT JOIN` the `workout_variations` and `variations` tables. Use **`GROUP_CONCAT(variations.name, '|')`** to aggregate multiple variations into a single string to maintain a single row per set.

### `DataRepository` (New)
A new repository to handle the technical details of serialization:
- `exportToSql()`: Query all tables and generate a complete `.sql` script with `INSERT` statements.
- `exportToCsv()`: Execute the merged query described above to generate the flattened CSV file.

### Import Behavior & Data Integrity

#### 1. SQL Import (Full Restore)
- **Strategy:** Clean & Restore.
- **Process:** 
  1. Open a **transaction**.
  2. Disable foreign key constraints temporarily.
  3. Clear all 8 existing tables.
  4. Execute the `INSERT` statements from the file using `db.batch()`.
  5. Re-enable constraints and commit.
- **Safety:** Must be preceded by a "Destructive Action" confirmation dialog in the UI.

#### 2. CSV Import (Smart Merge)
- **Strategy:** Upsert, Auto-Create & Idempotency Check.
- **Process:** 
  - **Background Processing:** Use a background **Isolate** to parse the CSV file to keep the UI responsive.
  - **Relationship Reconstruction:** Dynamically find or create Muscle Groups, Movements, and Variations.
  - **Idempotency Check:** Before inserting a workout log, check for an existing record with identical `timestamp`, `movement_id`, `weight`, and `reps` to prevent duplicates on repeated imports.
  - **Batch Insertion:** Use `db.batch()` to insert all reconstructed logs efficiently.
- **Duplicate Prevention:** Case-insensitive lookup by name for all entities (Movements, Variations, Muscle Groups).

## 4. Business Logic

### `DataManagementBloc` (New)
A dedicated BLoC to handle the states of data operations:
- **Events:** `ExportRequested(format)`, `ImportRequested()`.
- **States:** `DataOperationInitial`, `DataOperationInProgress`, `DataOperationSuccess`, `DataOperationFailure`.

## 5. Implementation Steps

1. **Step 1: UI Shell & Documentation**
   - **Update `GEMINI.md`** to reflect the current 8-table database schema.
   - Add hamburger icon to `SearchAndActionBar`.
   - Add `endDrawer` to `MainDashboardScreen`.
   - Create a reusable `AppAccordion` widget.

2. **Step 2: Data Handling Logic**
   - Implement the `DataRepository` with SQL, CSV, and Isolate logic.
   - Implement the Idempotency Check for CSV imports.
   - Ensure imports are wrapped in database transactions/batches for safety and performance.

3. **Step 3: State Management**
   - Create `DataManagementBloc`.
   - Integrate with the Sidebar UI and implement confirmation dialogs.

## 6. Comprehensive Test Plan

### Unit Tests (`DataRepository`)
- **CSV Serialization:** Verify `GROUP_CONCAT` logic correctly flattens multiple variations.
- **SQL Serialization:** Verify correct order of `INSERT` statements for all 8 tables.
- **CSV Parsing:** Verify pipe-separated variation mapping and **background isolate** offloading.
- **Idempotency Logic:** Verify that identical logs are skipped during CSV import.
- **Name Normalization:** Verify case-insensitive entity matching.

### Integration Tests (Database & Logic)
- **Round-Trip Consistency (SQL):** Seed -> Export -> Clear -> Import -> Assert (All 8 tables).
- **Round-Trip Consistency (CSV):** Seed -> Export -> Clear -> Import -> Assert.
- **Merge Logic (CSV):** Verify appending new movements to an existing library.
- **Transaction Rollback:** Verify data integrity on partial import failures.

### BLoC & UI Tests
- **State Flow:** `InProgress` -> `Success` during export.
- **Safety Confirmation:** Verify that the SQL import doesn't start without user confirmation.
- **Error Handling:** Emit `DataOperationFailure` on corrupt files or parsing errors.

### Specific Edge Case Scenarios
- **Large Dataset:** Import 2000+ logs to ensure no UI blocking and stable memory usage.
- **Special Characters:** CSV escaping for names with commas/quotes.
- **Missing Optional Data:** Graceful handling of missing variations or muscle groups in CSV rows.
