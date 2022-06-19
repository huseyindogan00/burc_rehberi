class ZodiacSign {
  final String name;
  final String date;
  final String detail;
  final String littlePicture;
  final String bigPicture;

  ZodiacSign({
    required this.name,
    required this.date,
    required this.detail,
    required this.littlePicture,
    required this.bigPicture,
  });

  @override
  String toString() {
    return '$name - $littlePicture';
  }
}
