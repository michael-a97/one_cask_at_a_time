import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:gap/gap.dart';

import '../../../../config/config.dart';
import '../../../../core/core.dart';
import '../../../../gen/assets.gen.dart';
import '../../../features.dart';
import '../../../shared/application/connectivity_cubit.dart';
import '../../../shared/presentation/progress_indicator_widget.dart';

part 'product_loaded_widget.dart';

part 'product_loading_widget.dart';

part 'product_failure_widget.dart';

part 'bottom_navigation.dart';

class HomeView extends StatefulWidget {
  const HomeView({super.key});

  @override
  State<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  @override
  void initState() {
    super.initState();
    context.read<ProductsCubit>().load();
    context.read<ConnectivityCubit>().listen();
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        title: Text('My collection', style: theme.textTheme.displayMedium),
        centerTitle: false,
        actions: [SvgPicture.asset(Assets.svgs.notification)],
      ),

      bottomNavigationBar: const BottomNavigation(),
      body: BlocBuilder<ConnectivityCubit, ConnectivityState>(
        builder: (context, state) {
          if (state.status.isDisconnected) {
            return const ProductFailureWidget(
              message:
                  'Could not load list of products, please check your internet '
                  'connection',
            );
          }
          return SafeArea(
            child: BlocBuilder<ProductsCubit, ProductsState>(
              builder: (context, state) {
                if (state is ProductsLoaded) {
                  return ProductLoadedWidget(products: state.products);
                } else if (state is ProductsLoading) {
                  return const ProductLoadingWidget();
                } else if (state is ProductsFailure) {
                  return const ProductFailureWidget();
                } else {
                  return const SizedBox();
                }
              },
            ),
          );
        },
      ),
    );
  }
}
