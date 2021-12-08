part of 'joke_bloc.dart';

@immutable
abstract class JokeEvent {
  const JokeEvent();
}

class LoadJokeEvent extends JokeEvent {
  const LoadJokeEvent();
}