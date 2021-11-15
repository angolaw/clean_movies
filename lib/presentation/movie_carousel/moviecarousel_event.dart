part of 'moviecarousel_bloc.dart';

abstract class MoviecarouselEvent extends Equatable {
  final int defaultIndex;
  const MoviecarouselEvent({required this.defaultIndex});

  @override
  List<Object> get props => [defaultIndex];
}
