import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:first_project_flutter/data/grocery_data.dart';
import 'package:first_project_flutter/home/model/product_data_model.dart';
import 'package:meta/meta.dart';

part 'home_event.dart';
part 'home_state.dart';

class HomeBloc extends Bloc<HomeEvent, HomeState> {
  HomeBloc() : super(HomeInitial()) {
    on<HomeInitialEvent>(homeInitialEvent);
    on<HomeProductWishListButtonClickedEvent>(
        homeProductWishListButtonClickedEvent);
    on<HomeProductCartButtonClickedEvent>(homeProductCartButtonClickedEvent);
    on<HomeWishListButtonNevigateEvent>(homeWishListButtonNevigateEvent);
    on<HomeCartButtonNevigateEvent>(homeCartButtonNevigateEvent);
  }
  FutureOr<void> homeInitialEvent(
      HomeInitialEvent event, Emitter<HomeState> emit) async {
    emit(HomeLoadingState());
    await Future.delayed(Duration(seconds: 3));
    emit(HomeLoadedSuccessState(
        products: GroceryData.groceryProducts.map((e) => ProductDataModel(
            id: e['id'],
            name: e['name'],
            category: e['category'],
            price: e['price'],
            brand: e['brand'],
            quantity: e['quantity'])).toList()));
  }

  FutureOr<void> homeProductWishListButtonClickedEvent(
      HomeProductWishListButtonClickedEvent event, Emitter<HomeState> emit) {
    print("wish button clicked");
  }

  FutureOr<void> homeProductCartButtonClickedEvent(
      HomeProductCartButtonClickedEvent event, Emitter<HomeState> emit) {
    print("cart button clicked");
  }

  FutureOr<void> homeWishListButtonNevigateEvent(
      HomeWishListButtonNevigateEvent event, Emitter<HomeState> emit) {
    print("wish navigate button clicked");
    emit(HomeNavigateToWishListPageActionState());
  }

  FutureOr<void> homeCartButtonNevigateEvent(
      HomeCartButtonNevigateEvent event, Emitter<HomeState> emit) {
    print("cart navigate button clicked");
    emit(HomeNavigateToCartPageActionState());
  }
}
