class OneRepMaxCalculator {
  /// Calculates the 1 Repetition Maximum using the Epley Formula.
  /// 1RM = Weight * (1 + Reps / 30)
  /// Note: The Epley formula is most accurate for 1-10 reps.
  static double calculate1RM(double weight, int reps) {
    if (reps <= 0) return 0.0;
    if (reps == 1) return weight;
    return weight * (1 + (reps / 30.0));
  }

  /// Returns a map of percentages of the given 1RM.
  /// e.g. [1.0, 0.9, 0.85, 0.8, 0.75, 0.7]
  static Map<int, double> getPercentages(double oneRepMax) {
    return {
      100: oneRepMax,
      95: oneRepMax * 0.95,
      90: oneRepMax * 0.90,
      85: oneRepMax * 0.85,
      80: oneRepMax * 0.80,
      75: oneRepMax * 0.75,
      70: oneRepMax * 0.70,
      65: oneRepMax * 0.65,
    };
  }

  /// Calculates the estimated number of reps for a given percentage of 1RM
  /// using the reverse Epley formula.
  static int getEstimatedReps(double percentageFraction) {
    if (percentageFraction >= 1.0) return 1;
    return (30 * ((1.0 / percentageFraction) - 1)).round();
  }
}
