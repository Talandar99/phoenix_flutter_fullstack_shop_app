import 'dart:convert';
import 'package:get_it/get_it.dart';
import '../../../host_ip.dart';
import '../../../persistant_storage/persistant_storage.dart';
import '../../dto/size_dto.dart';
import '../api_service.dart';

class SizesConncetionService {
  final ApiService apiService = GetIt.I<ApiService>();
  final PersistentStorage persistentStorage = GetIt.I<PersistentStorage>();

  Future<SizeDto> getAllIngredients() async {
    var response = await apiService.makeApiGetRequest(
      '$apiHost/api/sizes',
    );
    if (response.statusCode == 200) {
      var decodedBody = json.decode(response.body);
      return SizeDto.fromJson(decodedBody);
    } else {
      throw Exception();
    }
  }
}
