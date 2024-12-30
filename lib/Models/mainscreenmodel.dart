class PokemonResult {
  final String name;
  final String url;

  PokemonResult({required this.name, required this.url});

  factory PokemonResult.fromJson(Map<String, dynamic> json) {
    return PokemonResult(
      name: json['name'],
      url: json['url'],
    );
  }

  // Method to convert the object to a Map
  Map<String, dynamic> toMap() {
    return {
      'name': name,
      'url': url,
    };
  }

  @override
  String toString() {
    return '{name: $name, url: $url}';
  }
}

class PokemonDetails {
  final String abilityname1;

  PokemonDetails({required this.abilityname1});

  factory PokemonDetails.fromJson(Map<String, dynamic> json) {
    return PokemonDetails(

      abilityname1: json["ability"]["name"],
    );
  }

  // Method to convert the object to a Map
  Map<String, dynamic> toMap() {
    return {
      'abilityname1': abilityname1,
    };
  }

  @override
  String toString() {
    return '{abilityname1: $abilityname1}';
  }
}
