class Joke {
  final String imageUrl;
  final String joke;

  const Joke({
    this.imageUrl = '',
    this.joke = '',
  });

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
          (other is Joke &&
              runtimeType == other.runtimeType &&
              imageUrl == other.imageUrl &&
              joke == other.joke);

  @override
  int get hashCode => imageUrl.hashCode ^ joke.hashCode;

  @override
  String toString() {
    return 'Joke{imageUrl: $imageUrl,joke: $joke}';
  }

  Joke copyWith({
    String? imageUrl,
    String? joke,
  }) {
    return Joke(
      imageUrl: imageUrl ?? this.imageUrl,
      joke: joke ?? this.joke,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'imageUrl': imageUrl,
      'joke': joke,
    };
  }

  factory Joke.fromMap(Map<String, dynamic> map) {
    return Joke(
      imageUrl: map['imageUrl'] as String,
      joke: map['joke'] as String,
    );
  }
}