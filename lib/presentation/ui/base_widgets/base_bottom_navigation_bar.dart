part of presentation;

class AppBottomNavigationBar extends StatelessWidget {
  final int selectedIndex;
  final ValueChanged<int> onDestinationSelected;

  const AppBottomNavigationBar({
    super.key,
    required this.selectedIndex,
    required this.onDestinationSelected,
  });

  @override
  Widget build(BuildContext context) => Padding(
        padding: const EdgeInsets.symmetric(vertical: 8),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            const TabData(
              index: 0,
              label: "Главная",
              icon: AppTextIcons.home,
            ),
            const TabData(
              index: 1,
              label: "Профиль",
              icon: AppTextIcons.profile,
            ),
            const TabData(
              index: 2,
              label: "Поддержка",
              icon: AppTextIcons.support,
            ),
          ]
              .map(
                (tab) => Builder(
                  builder: (context) {
                    final selected = selectedIndex == tab.index;

                    return GestureDetector(
                      onTap: () => onDestinationSelected(tab.index),
                      behavior: HitTestBehavior.opaque,
                      child: BaseIconBackground.smallest(
                        style: selected ? BaseIconBackgroundStyle.violet : null,
                        child: BaseTextIcon(
                          icon: tab.icon,
                          fontSize: 20,
                          color:
                              selected ? AppColors.white : AppColors.darkGray2,
                        ),
                      ),
                    );
                  },
                ),
              )
              .toList(),
        ),
      );
}

class TabData {
  final int index;
  final String label;
  final String icon;

  const TabData({
    required this.index,
    required this.label,
    required this.icon,
  });
}

