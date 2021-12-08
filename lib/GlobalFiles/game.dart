class Game {
  final String name;
  final Duration timeWhite;
  final Duration timeBlack;
  final Duration incrementWhite;
  final Duration incrementBlack;

  const Game(
      {
        required this.name,
      required this.timeWhite,
      required this.timeBlack,
      required this.incrementWhite,
      required this.incrementBlack
      });
}
