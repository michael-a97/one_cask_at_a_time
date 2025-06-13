part of 'product_details_view.dart';

class TestingNotesWidget extends StatelessWidget {
  const TestingNotesWidget({super.key});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        AspectRatio(
          aspectRatio: 16 / 10,
          child: ColoredBox(
            color: theme.primaryColorDark,
            child: const Center(child: Icon(Icons.play_arrow, size: 48)),
          ),
        ),

        const Gap(Spacing.lg),
        const Gap(Spacing.lg),
        Text('Testing Notes', style: theme.textTheme.displayMedium),
        Text(
          'by Charles MacLean MBE',
          style: theme.textTheme.bodyMedium?.copyWith(
            color: Colors.white,
            fontWeight: FontWeight.bold,
          ),
        ),
        const Gap(Spacing.lg),
        Container(
          width: double.infinity,
          color: theme.primaryColorDark,
          padding: const EdgeInsets.all(Spacing.lg),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Nose',
                style: theme.textTheme.displayMedium?.copyWith(
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const Gap(Spacing.sm),
              const Text('Description'),
              const Text('Description'),
            ],
          ),
        ),
        const Gap(Spacing.lg),
        Container(
          width: double.infinity,
          color: theme.primaryColorDark,
          padding: const EdgeInsets.all(Spacing.lg),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Palate',
                style: theme.textTheme.displayMedium?.copyWith(
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const Gap(Spacing.sm),
              const Text('Description'),
              const Text('Description'),
            ],
          ),
        ),
        const Gap(Spacing.lg),
        Container(
          width: double.infinity,
          color: theme.primaryColorDark,
          padding: const EdgeInsets.all(Spacing.lg),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Finish',
                style: theme.textTheme.displayMedium?.copyWith(
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const Gap(Spacing.sm),
              const Text('Description'),
              const Text('Description'),
            ],
          ),
        ),
        Padding(
          padding: const EdgeInsets.symmetric(
            horizontal: Spacing.xs,
            vertical: Spacing.xl,
          ),
          child: Row(
            children: [
              Text(
                'Your Notes',
                style: theme.textTheme.displayMedium?.copyWith(
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const Spacer(),
              const Icon(Icons.arrow_back),
            ],
          ),
        ),
        const Gap(Spacing.lg),
        Container(
          width: double.infinity,
          color: theme.primaryColorDark,
          padding: const EdgeInsets.all(Spacing.lg),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Nose',
                style: theme.textTheme.displayMedium?.copyWith(
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const Gap(Spacing.sm),
              const Text('Description'),
              const Text('Description'),
            ],
          ),
        ),
        const Gap(Spacing.lg),
        Container(
          width: double.infinity,
          color: theme.primaryColorDark,
          padding: const EdgeInsets.all(Spacing.lg),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Palate',
                style: theme.textTheme.displayMedium?.copyWith(
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const Gap(Spacing.sm),
              const Text('Description'),
              const Text('Description'),
            ],
          ),
        ),
        const Gap(Spacing.lg),
        Container(
          width: double.infinity,
          color: theme.primaryColorDark,
          padding: const EdgeInsets.all(Spacing.lg),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Finish',
                style: theme.textTheme.displayMedium?.copyWith(
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const Gap(Spacing.sm),
              const Text('Description'),
              const Text('Description'),
            ],
          ),
        ),
      ],
    );
  }
}
