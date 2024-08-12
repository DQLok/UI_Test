class PointCorner {
  double dx;
  double dy;
  bool selectFirst;
  bool selectSeconds;
  PointCorner({
    required this.dx,
    required this.dy,
    required this.selectFirst,
    required this.selectSeconds,
  });

  void selectChange(bool check) {
    if (check) {
      selectFirst = true;
      selectSeconds = false;
    } else {
      selectFirst = false;
      selectSeconds = true;
    }
  }

  @override
  String toString() {
    return "($dx - $dy)";
  }
}
