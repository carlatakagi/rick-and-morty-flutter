import 'package:dio/dio.dart';

abstract class CharacterService {
  Future<void> getCharacters([int page = 1]);
}

class CharacterServiceImplementation implements CharacterService {
  const CharacterServiceImplementation(this._client);

  final Dio _client; // _ atributo privado

  @override
  Future<void> getCharacters([int page = 1]) async {
    final response = await _client.get(
      'api/character',
      queryParameters: {
        'page': '$page',
      },
    );

    print('response: ${response.data}');
  }
}
