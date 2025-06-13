import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:toggle_switch/toggle_switch.dart';

import '../../../../config/theme/theme.dart';
import '../../../../core/core.dart';
import '../../../../gen/assets.gen.dart';
import '../../../features.dart';

part 'details_widget.dart';

part 'testing_notes_widget.dart';

part 'history_widget.dart';

class ProductDetailsView extends StatefulWidget {
  final Product product;

  const ProductDetailsView({super.key, required this.product});

  @override
  State<ProductDetailsView> createState() => _ProductDetailsViewState();
}

class _ProductDetailsViewState extends State<ProductDetailsView>
    with SingleTickerProviderStateMixin {
  final ValueNotifier<int> selectedIndex = ValueNotifier(0);

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        leading: IconButton(
          onPressed: () {
            context.router.pop();
          },
          icon: const Icon(Icons.arrow_back_sharp),
        ),
      ),
      body: DecoratedBackground(
        child: ListView(
          padding: const EdgeInsets.only(bottom: Spacing.xxxl + Spacing.xxxl),
          children: [
            Hero(
              tag: 'product_${widget.product.id}',
              child: Image.asset(Assets.images.product.path),
            ),
            Card(
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(4),
              ),
              margin: const EdgeInsets.all(Spacing.lg),
              child: Padding(
                padding: const EdgeInsets.all(Spacing.lg),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text('Bottle 135/184', style: theme.textTheme.bodySmall),
                    const Gap(Spacing.sm),
                    Row(
                      children: [
                        Text(
                          widget.product.name,
                          style: theme.textTheme.displayMedium,
                        ),
                        const Gap(Spacing.lg),
                        Text(
                          widget.product.ageStatement,
                          style: theme.textTheme.displayMedium?.copyWith(
                            color: theme.colorScheme.secondary,
                            fontWeight: FontWeight.w300,
                          ),
                        ),
                      ],
                    ),
                    Text(
                      widget.product.caskNumber,
                      style: theme.textTheme.displayMedium,
                    ),
                    const Gap(Spacing.lg),
                    SizedBox(
                      width: double.infinity,
                      child: ToggleSwitch(
                        activeBgColor: [
                          Theme.of(context).colorScheme.secondary,
                        ],
                        initialLabelIndex: selectedIndex.value,
                        activeFgColor: Theme.of(context).colorScheme.primary,
                        inactiveBgColor: Theme.of(context).primaryColorDark,
                        totalSwitches: 3,
                        states: const [true, true, true],
                        dividerColor: Theme.of(context).primaryColorDark,
                        labels: const ['Details', 'Testing notes', 'History'],
                        minWidth: double.infinity,
                        onToggle: (index) {
                          setState(() {
                            if (index != null) {
                              selectedIndex.value = index;
                            }
                          });
                        },
                      ),
                    ),
                    const Gap(Spacing.lg),
                    if (selectedIndex.value == 0) ...[
                      DetailsWidget(product: widget.product),
                    ] else if (selectedIndex.value == 1) ...[
                      const TestingNotesWidget(),
                    ] else if (selectedIndex.value == 2) ...[
                      const HistoryWidget(),
                    ],
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
      floatingActionButton: ElevatedButton(
        onPressed: () {},
        child: const Padding(
          padding: EdgeInsets.symmetric(horizontal: Spacing.lg),
          child: Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              Icon(Icons.add),
              Gap(Spacing.lg),
              Text('Add to my collection'),
            ],
          ),
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
    );
  }
}
