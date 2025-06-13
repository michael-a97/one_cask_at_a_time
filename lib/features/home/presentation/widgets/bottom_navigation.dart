part of 'home_view.dart';

class BottomNavigation extends StatelessWidget {
  const BottomNavigation({super.key});

  @override
  Widget build(BuildContext context) {
    return ColoredBox(
      color: theme.primaryColorDark,
      child: Padding(
        padding: const EdgeInsets.all(Spacing.md),
        child: SafeArea(
          child: Row(
            children: [
              _BottomNavItem(icon: Assets.svgs.scan, label: 'Scan'),
              _BottomNavItem(
                icon: Assets.svgs.collection,
                label: 'Collection',
                active: true,
              ),
              _BottomNavItem(icon: Assets.svgs.bottle, label: 'Shop'),
              _BottomNavItem(icon: Assets.svgs.settings, label: 'Settings'),
            ],
          ),
        ),
      ),
    );
  }
}

class _BottomNavItem extends StatelessWidget {
  final String icon;
  final String label;
  final bool active;

  const _BottomNavItem({
    required this.icon,
    required this.label,
    this.active = false,
  });

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          SvgPicture.asset(icon, height: 32),
          const Gap(Spacing.xs),
          Text(
            label,
            style: Theme.of(context).textTheme.bodySmall?.copyWith(
              color: active ? Colors.white : const Color(0xFF899194),
            ),
          ),
        ],
      ),
    );
  }
}
