import 'package:equatable/equatable.dart';

class CastEntity extends Equatable {
  final String creditId;
  final String name;
  final String character;
  final String profilePath;

  const CastEntity({
    required this.creditId,
    required this.name,
    required this.character,
    required this.profilePath,
  });

  @override
  List<Object?> get props => [creditId, name];
}
