class SizeDto {
  String id;
  double multiplier;
  String size;

  SizeDto({
    required this.id,
    required this.multiplier,
    required this.size,
  });

  factory SizeDto.fromJson(Map<String, dynamic> json) {
    return SizeDto(
      id: json['id'],
      multiplier: json['multiplier'],
      size: json['size'],
    );
  }
}
