part of 'moviecarousel_bloc.dart';

abstract class MovieCarouselEvent extends Equatable {}

class CarouselLoadEvent extends MovieCarouselEvent {
  final int defaultIndex;
  CarouselLoadEvent({required this.defaultIndex});

  @override
  List<Object> get props => [defaultIndex];
}
