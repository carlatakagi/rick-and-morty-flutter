import 'package:http/http.dart';

abstract class CharacterService {
  Future<void> getCharacters([int page = 1]);
}

class CharacterServiceImplementation implements CharacterService {
  const CharacterServiceImplementation(this._client);

  final Client _client; // _ atributo privado

  @override
  Future<void> getCharacters([int page = 1]) async {
    final response = await _client.get(
      Uri.https('rickandmortyapi.com', '/api/character', {
        'page': '$page', // page.toString()
      }),
    );

    print('response: ${response.body}');
  }
}
