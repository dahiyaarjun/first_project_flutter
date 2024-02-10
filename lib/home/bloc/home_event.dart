part of 'home_bloc.dart';

@immutable
sealed class HomeEvent {}

class HomeInitialEvent extends HomeEvent{
  
}

class HomeProductWishListButtonClickedEvent extends HomeEvent {}

class HomeProductCartButtonClickedEvent extends HomeEvent {}

class HomeWishListButtonNevigateEvent extends HomeEvent {}

class HomeCartButtonNevigateEvent extends HomeEvent {}
