class SizeDto {
  String id;
  String sizeName;
  int orderNum;

  SizeDto({
    required this.id,
    required this.sizeName,
    required this.orderNum,
  });

  factory SizeDto.fromJson(Map<String, dynamic> json) {
    return SizeDto(
      id: json['id'],
      sizeName: json['size_name'],
      orderNum: json['orderNum'],
    );
  }
}
