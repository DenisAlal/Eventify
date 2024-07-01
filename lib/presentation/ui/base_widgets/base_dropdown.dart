part of presentation;

class AppDropdown extends StatelessWidget {
  final List<String> items;
  final String selectedItem;
  final ValueChanged<String?>? onChanged;
  final Color? dropdownColor;
  final Color? borderColor;
  final double? borderRadius;
  final double? width;
  final double? height;
  final TextStyle? style;

  const AppDropdown({
    super.key,
    required this.items,
    required this.selectedItem,
    this.onChanged,
    this.dropdownColor,
    this.borderColor,
    this.borderRadius,
    this.width,
    this.height,
    this.style,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: width,
      height: height,
      padding: const EdgeInsets.symmetric(horizontal: 10),
      decoration: BoxDecoration(
        color: dropdownColor ?? Colors.transparent,
        borderRadius: BorderRadius.circular(borderRadius ?? 10),
        border:
            Border.all(color: borderColor ?? AppColors.darkOrchid, width: 2),
      ),
      child: DropdownButtonHideUnderline(
        child: DropdownButton<String>(
          dropdownColor: AppColors.anthraciteGray,
          value: selectedItem,
          borderRadius: BorderRadius.circular(borderRadius ?? 10),
          items: items.map<DropdownMenuItem<String>>(
            (String value) {
              return DropdownMenuItem<String>(
                value: value,
                child: Text(
                  value,
                  style: style ?? AppTextStyles.appIconLabel( color: AppColors.white),
                ),
              );
            },
          ).toList(),
          onChanged: onChanged,
          isExpanded: true,
        ),
      ),
    );
  }
}
