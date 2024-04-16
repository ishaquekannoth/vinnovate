import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:vinnovate/app/presentation/home_view/bloc/home_bloc.dart';
import 'package:vinnovate/app/presentation/home_view/widgets/product_card.dart';

class HomeView extends StatelessWidget {
  const HomeView({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
            appBar: AppBar(
              automaticallyImplyLeading: true,
              title: Text(
                "Academy",
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16.h),
              ),
              centerTitle: true,
            ),
            body: BlocBuilder<HomeBloc, HomeState>(
              builder: (context, state) {
                return switch (state) {
                  HomeInitialState() => Center(
                      child: GestureDetector(
                          onTap: () {
                            context.read<HomeBloc>().add(LoadProducts());
                          },
                          child: const Center(
                              child: Text("Hold on...Initialising")))),
                  HomeLoadingState() => const Center(
                      child: CircularProgressIndicator(),
                    ),
                  HomeLoadedState() => SingleChildScrollView(
                      physics: const BouncingScrollPhysics(),
                      child: Column(children: [
                        Container(
                          margin: EdgeInsets.only(left: 16.w),
                          width: ScreenUtil().screenWidth,
                          child: Text(
                            "Showing ${state.products.length} Products",
                            textAlign: TextAlign.start,
                            style: TextStyle(
                                fontWeight: FontWeight.w600,
                                fontSize: 14.h,
                                color: Colors.purple),
                            overflow: TextOverflow.ellipsis,
                          ),
                        ),
                        SizedBox(
                          height: 20.h,
                        ),
                        ...List.generate(
                            state.products.length,
                            (index) =>
                                ProductCard(product: state.products[index]))
                      ]),
                    ),
                  HomeLoadingFailState() => Center(child: Text(state.message)),
                };
              },
            )));
  }
}
