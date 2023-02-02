import 'size_dto.dart';

class SizesDto {
  List<SizeDto> sizes;

  SizesDto({
    required this.sizes,
  });

  factory SizesDto.fromJson(Map<String, dynamic> json) {
    return SizesDto(
      sizes: json['data'] != null
          ? json['data']
              .map<SizeDto>(
                (json) => SizeDto.fromJson(json),
              )
              .toList()
          : [],
    );
  }
}
