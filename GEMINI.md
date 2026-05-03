## **1\. High-Level App Architecture**

The app follows a standard layered architecture using BLoC for state management, Repositories for data abstraction, and SQLite for local persistence.  
graph TD  
    subgraph Presentation Layer  
        UI\[Flutter UI Widgets\]  
        UI\_Log\[Log Exercise Dialog\]  
        UI\_Dash\[Main Dashboard Screen\]  
    end

    subgraph State Management Layer  
        DashBloc\[DashboardBloc\]  
        LogBloc\[LogExerciseBloc\]  
    end

    subgraph Domain Layer  
        Models\[Data Models\]  
        WorkoutRepo\[WorkoutRepository\]  
        MoveRepo\[MovementRepository\]  
    end

    subgraph Data Layer  
        DBHelper\[DatabaseHelper / sqflite\]  
        StaticData\[StaticExerciseData\]  
    end

    %% Connections  
    UI\_Dash \--\>|Events| DashBloc  
    UI\_Log \--\>|Events| LogBloc  
    DashBloc \--\>|States| UI\_Dash  
    LogBloc \--\>|States| UI\_Log  
      
    DashBloc \--\>|Fetch Logs| WorkoutRepo  
    LogBloc \--\>|Save Log| WorkoutRepo  
    LogBloc \--\>|Fetch Movements| MoveRepo  
      
    WorkoutRepo \--\>|SQL Queries| DBHelper  
    MoveRepo \--\>|SQL Queries| DBHelper  
    MoveRepo \-.-\>|Initial Seed| StaticData  
      
    DBHelper \--\>|Raw Data| WorkoutRepo  
    WorkoutRepo \--\>|Models| DashBloc

## **2\. Database Entity-Relationship (ER) Diagram**

The SQLite database is structured relationally to link exercises to their specific muscle groups, alongside the actual workout logs, utilizing many-to-many relationships for flexibility.

erDiagram
    MOVEMENT ||--o{ MOVEMENT_MUSCLES : has
    MUSCLE_GROUP ||--o{ MOVEMENT_MUSCLES : associated_with
    MOVEMENT ||--o{ MOVEMENT_VARIATIONS : supports
    VARIATIONS ||--o{ MOVEMENT_VARIATIONS : linked_to
    WORKOUTS ||--o{ WORKOUT_VARIATIONS : records
    VARIATIONS ||--o{ WORKOUT_VARIATIONS : applied_to
    MOVEMENT ||--o{ WORKOUTS : performed

    MUSCLE_GROUP {
        int id PK
        string name "e.g., Chest, Back, Legs"
    }

    MOVEMENT {
        int id PK
        string name "e.g., Bench Press"
    }

    MOVEMENT_MUSCLES {
        int movement_id FK
        int muscle_id FK
        int is_primary "Boolean"
    }

    VARIATIONS {
        int id PK
        string name "e.g., Incline, Dumbbell"
    }

    MOVEMENT_VARIATIONS {
        int movement_id FK
        int variation_id FK
    }

    WORKOUTS {
        int id PK
        int timestamp "Unix Epoch"
        int movement_id FK
        real weight
        int reps
        int pain_felt "Boolean"
    }

    WORKOUT_VARIATIONS {
        int workout_id FK
        int variation_id FK
    }

    SETTINGS {
        string key PK
        string value
    }

## **3\. Sequence Flow: Logging a New Exercise**

This sequence diagram illustrates the lifecycle of a user interacting with the app to log a new workout.  
sequenceDiagram  
    actor User  
    participant UI as Dashboard Screen  
    participant Dialog as LogExerciseDialog (Carousel)  
    participant LogBloc as LogExerciseBloc  
    participant Repo as WorkoutRepository  
    participant DB as SQLite DB  
    participant DashBloc as DashboardBloc

    User-\>\>UI: Tap (+) FAB to Log Exercise  
    UI-\>\>Dialog: Open Carousel Dialog  
    Dialog-\>\>LogBloc: Event: LoadMuscleGroups  
    LogBloc--\>\>Dialog: State: MuscleGroupsLoaded  
    User-\>\>Dialog: Select Muscle Group & Swipe Next  
    Dialog-\>\>LogBloc: Event: LoadMovements(muscleGroupId)  
    LogBloc--\>\>Dialog: State: MovementsLoaded  
    User-\>\>Dialog: Select Movement & Enter Weight/Reps  
    User-\>\>Dialog: Tap "Save Workout"  
    Dialog-\>\>LogBloc: Event: SaveWorkout(workoutLog)  
    LogBloc-\>\>Repo: insertLog(workoutLog)  
    Repo-\>\>DB: INSERT INTO workout\_logs...  
    DB--\>\>Repo: success (row id)  
    Repo--\>\>LogBloc: success  
    LogBloc--\>\>Dialog: State: SaveSuccess  
    Dialog--\>\>UI: Close Dialog & Show Toast  
      
    %% Dashboard Refresh Trigger  
    UI-\>\>DashBloc: Event: FetchRecentWorkouts  
    DashBloc-\>\>Repo: getRecentWorkouts()  
    Repo--\>\>DashBloc: List\<WorkoutLog\>  
    DashBloc--\>\>UI: State: DashboardLoaded(logs)  
    UI--\>\>User: Updated UI with new log

## **4\. State Management (BLoC) Lifecycles**

### **Dashboard BLoC State Machine**

stateDiagram-v2  
    \[\*\] \--\> DashboardInitial  
    DashboardInitial \--\> DashboardLoading : FetchDashboardData Event  
    DashboardLoading \--\> DashboardLoaded : Data fetched successfully  
    DashboardLoading \--\> DashboardError : Exception thrown during fetch  
    DashboardLoaded \--\> DashboardLoading : Pull to refresh / Log added  
    DashboardError \--\> DashboardLoading : Retry

### **Log Exercise BLoC State Machine (Carousel Flow)**

stateDiagram-v2  
    \[\*\] \--\> LogExerciseInitial  
    LogExerciseInitial \--\> LoadingMuscleGroups : Open Dialog  
    LoadingMuscleGroups \--\> MuscleGroupsLoaded : Display Step 1  
    MuscleGroupsLoaded \--\> LoadingMovements : User selects Muscle Group  
    LoadingMovements \--\> MovementsLoaded : Display Step 2  
    MovementsLoaded \--\> ReadyToLog : User selects Movement  
    ReadyToLog \--\> SavingWorkout : User taps Save  
    SavingWorkout \--\> SaveSuccess : DB Insert Success  
    SavingWorkout \--\> SaveError : DB Insert Failed  
    SaveSuccess \--\> \[\*\] : Close Dialog

## **5\. Directory Structure Mapping**

To better understand how these flows translate to the codebase:  
mindmap  
  root((Frictionless Improvement Tracker))  
    lib/  
      core/  
        database/  
            (DatabaseHelper)  
        di/  
            (ServiceLocator \- GetIt)  
      data/  
        models/  
            (WorkoutLog, MuscleGroup, etc.)  
        repositories/  
            (WorkoutRepository, MovementRepository)  
        sources/  
            (StaticExerciseData)  
      features/  
        dashboard/  
            views/  
            viewmodels/ (DashboardBloc)  
            widgets/  
        exercise\_logging/  
            views/ (LogExerciseDialog, CarouselSlides)  
            viewmodels/ (LogExerciseBloc)

## **6\. Architecture Guidelines: MVVM & BLoC Pattern**

To maintain a clean, scalable, and testable codebase, all new features and modifications must strictly adhere to the **MVVM (Model-View-ViewModel)** architecture, utilizing the **BLoC (Business Logic Component)** pattern as the ViewModel layer.

### **Core Maintenance Principles:**

1. **View (UI Layer / Presentation)**:  
   * **Scope:** Consists of Flutter Widgets (found in views/ and widgets/ directories).  
   * **Constraint:** Must remain completely "dumb". Views should solely be responsible for listening to BLoC states to render UI and dispatching user events back to the BLoC.  
   * **Rule:** Absolutely no business logic, data formatting, or direct repository access should occur in the UI layer.  
2. **ViewModel (BLoC Layer)**:  
   * **Scope:** Consists of BLoC classes (found in viewmodels/ directories).  
   * **Constraint:** Acts as the strict intermediary. It processes events from the View, communicates with Repositories/Services, and emits immutable states back to the View.  
   * **Rule:** BLoCs must remain platform-agnostic and should *never* depend on Flutter UI elements (e.g., BuildContext, TextEditingController).  
3. **Model (Data & Domain Layer)**:  
   * **Scope:** Consists of Data Models, Repositories, and underlying Data Sources (found in the data/ directory).  
   * **Constraint:** Handles all data retrieval, storage (SQLite via DatabaseHelper), and business rules.  
   * **Rule:** Completely independent of BLoC and UI layers. Changes here should propagate upwards via Repository interfaces.

### **Strict Unidirectional Data Flow**

Any changes to state or data must follow this unidirectional loop. Do not bypass the BLoC to read directly from or write directly to a repository from a Widget.  
graph LR  
    A\[View Widget\] \-- Dispatches Event \--\> B(BLoC / ViewModel)  
    B \-- Requests/Mutates Data \--\> C{Repository}  
    C \-- Returns Result \--\> B  
    B \-- Emits Immutable State \--\> A  
      
    classDef view fill:\#bbdefb,stroke:\#1565c0,stroke-width:2px;  
    classDef bloc fill:\#c8e6c9,stroke:\#2e7d32,stroke-width:2px;  
    classDef repo fill:\#ffe0b2,stroke:\#ef6c00,stroke-width:2px;  
      
    class A view;  
    class B bloc;  
    class C repo;  
