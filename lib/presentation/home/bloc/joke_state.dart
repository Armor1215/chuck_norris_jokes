part of 'joke_bloc.dart';

enum JokeStatus { loading, success, failure }

class JokeState extends Equatable {
  const JokeState._({
    this.status = JokeStatus.loading,
    this.joke = const Joke(),
  });

  const JokeState.loading() : this._(status: JokeStatus.loading);

  const JokeState.failure() : this._(status: JokeStatus.failure);

  const JokeState.success(
      Joke joke,
      ) : this._(
    status: JokeStatus.success,
    joke: joke,
  );

  final JokeStatus status;
  final Joke joke;

  @override
  List<Object?> get props => [status, joke];
}