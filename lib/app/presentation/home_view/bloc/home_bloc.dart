import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:vinnovate/app/data/product_model.dart';
import 'package:vinnovate/app/repos/home_repo/home_repo.dart';

part 'home_event.dart';
part 'home_state.dart';

class HomeBloc extends Bloc<HomeEvent, HomeState> {
  HomeBloc() : super(HomeInitialState()) {
    on<LoadProducts>((event, emit) async {
      emit(HomeLoadingState());
      final result = await HomeRepo().getProductList();
      if (result.isSuccess) {
        emit(HomeLoadedState(products: result.successResponse));
      } else {
        emit(HomeLoadingFailState(message: result.toString()));
      }
    });
  }
}
