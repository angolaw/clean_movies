import 'package:equatable/equatable.dart';

class CastEntity extends Equatable {
  final String creditId;
  final String name;
  final String character;
  final String posterPath;

  const CastEntity({
    required this.creditId,
    required this.name,
    required this.character,
    required this.posterPath,
  });

  @override
  List<Object?> get props => [creditId, name];
}
