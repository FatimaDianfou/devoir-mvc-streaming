class Diffusion {
  final String jour;
  final int heure;
  final int minute;

  const Diffusion({
    required this.jour,
    required this.heure,
    required this.minute,
  });

  String get libelle => 'Diffusion du $jour';

  String get heureFormatee {
    final minuteStr = minute.toString().padLeft(2, '0');
    return '${heure}h$minuteStr';
  }
}
