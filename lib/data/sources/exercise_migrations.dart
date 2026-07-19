// Data migrations applied to the user's database before syncing bundled
// exercises. All entries must stay idempotent: syncs run on every launch.

/// Bundled movements that were deleted in favor of a named variation of
/// another movement. Logs are moved to the replacement movement and gain
/// the listed variation keys so history keeps its meaning.
const Map<String, Map<String, dynamic>> deprecatedMovements = {
  // Romanian Deadlift -> Deadlift + romanian
  "9aea77cf-1fc2-4758-96e5-e894112778a8": {
    "replacementPk": "ba2387cd-2192-42d5-8895-4c8ad78b3607",
    "addVariations": ["romanian"],
  },
};

/// movement pk -> {old variation key: new variation key}.
/// Applied to stored movements (keys and exclusion lists) and to logs.
const Map<String, Map<String, String>> renamedVariationKeys = {
  // Deadlift: fix historical misspelling.
  "ba2387cd-2192-42d5-8895-4c8ad78b3607": {"romainian": "romanian"},
};

/// movement pk -> variation keys dropped from the bundled data because a
/// standalone movement covers them (e.g. Rack Pull). Removed from stored
/// movements only; logs keep the key so old history still reads correctly.
const Map<String, List<String>> removedVariationKeys = {
  // Deadlift: rack-pull -> Rack Pull movement
  "ba2387cd-2192-42d5-8895-4c8ad78b3607": ["rack-pull"],
  // Overhead Press: Arnold -> Arnold Press movement
  "a3f7c812-1d45-4b89-93c0-7e2d4f6a1b85": ["Arnold"],
  // Shoulder Press: Arnold -> Arnold Press movement
  "64c75731-36c2-45ae-b8c1-c8b481f34144": ["Arnold"],
  // Clean: power -> Power Clean movement
  "f0a93b0e-1c2d-4f74-e5a0-2b7d8f1e4c96": ["power"],
  // Leg Curl: nordic -> Nordic Curl movement
  "a3b26c39-4d5e-4a07-f8b3-5c0e1a4f7d29": ["nordic"],
  // Row: chest-supported -> Chest-Supported Row movement
  "a40205d6-396c-4c0b-a4b9-8ffbef49ed32": ["chest-supported"],
  // Leg Raise: knee-raise -> Knee Raise movement
  "cbbdaae8-7600-456f-b025-12d2050b3765": ["knee-raise"],
  // Back Extension: reverse -> Reverse Hyperextension movement
  "328b8330-4a04-4f43-a255-f17cba659635": ["reverse"],
};
