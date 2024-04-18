part of 'home_bloc.dart';

sealed class HomeState extends Equatable {
  const HomeState();

  @override
  List<Object> get props => [];
}

final class HomeInitialState extends HomeState {}

final class HomeLoadingState extends HomeState {}

final class HomeLoadedState extends HomeState {
  @override
  List<Object> get props => [];
  final List<ProductModel> products;
  const HomeLoadedState({required this.products}) : super();
}

final class HomeLoadingFailState extends HomeState {
  final String message;
  const HomeLoadingFailState({required this.message}) : super();
}
