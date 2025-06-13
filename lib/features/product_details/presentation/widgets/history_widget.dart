part of 'product_details_view.dart';

class HistoryWidget extends StatelessWidget {
  const HistoryWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: Spacing.xxl),
      child: Card(
        color: Theme.of(context).scaffoldBackgroundColor,
        child: const Padding(
          padding: EdgeInsets.all(Spacing.lg),
          child: Column(
            children: [
              _HistoryListItem(),
              _HistoryListItem(),
              _HistoryListItem(),
            ],
          ),
        ),
      ),
    );
  }
}

class _HistoryListItem extends StatelessWidget {
  const _HistoryListItem();

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Icon(Icons.circle),
        const Gap(Spacing.lg),
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text('Label', style: theme.textTheme.bodySmall),
              const Gap(Spacing.md),
              Text('Title', style: theme.textTheme.displayMedium),
              const Gap(Spacing.lg),
              const Text('Description'),
              const Text('Description'),
              const Gap(Spacing.xxl),
              ColoredBox(
                color: theme.primaryColorDark,

                child: Column(
                  children: [
                    const Gap(Spacing.lg),
                    const Padding(
                      padding: EdgeInsets.symmetric(horizontal: Spacing.lg),
                      child: Row(
                        children: [
                          Icon(Icons.attach_file_outlined),
                          Gap(Spacing.lg),
                          Text('Attachments'),
                        ],
                      ),
                    ),
                    const Gap(Spacing.lg),
                    SizedBox(
                      height: 100,
                      child: Padding(
                        padding: const EdgeInsets.only(bottom: Spacing.lg),
                        child: ListView(
                          scrollDirection: Axis.horizontal,
                          children: [
                            const Gap(Spacing.lg),
                            Container(
                              height: 80,
                              width: 80,
                              color: Colors.grey.shade300,
                              child: const SizedBox(),
                            ),
                            const Gap(Spacing.lg),
                            Container(
                              height: 80,
                              width: 80,
                              color: Colors.grey.shade300,
                              child: const SizedBox(),
                            ),
                            const Gap(Spacing.lg),
                            Container(
                              height: 80,
                              width: 80,
                              color: Colors.grey.shade300,
                              child: const SizedBox(),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ),

              const Gap(Spacing.xxl),
            ],
          ),
        ),
      ],
    );
  }
}
