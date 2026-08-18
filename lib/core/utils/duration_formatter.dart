/// Formatting helpers shared by the call UI.
extension DurationFormatting on Duration {
  String get asCallTimer {
    final String seconds = inSeconds
        .remainder(Duration.secondsPerMinute)
        .toString()
        .padLeft(2, '0');
    if (inHours == 0) {
      return '$inMinutes:$seconds';
    }
    final String minutes = inMinutes
        .remainder(Duration.minutesPerHour)
        .toString()
        .padLeft(2, '0');
    return '$inHours:$minutes:$seconds';
  }
}
