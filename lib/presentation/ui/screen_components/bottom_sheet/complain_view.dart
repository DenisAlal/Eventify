import 'package:flutter/cupertino.dart';

import '../../../presentation.dart';
import '../../base_widgets/action_button.dart';

class ComplainBottomSheet extends StatelessWidget {

  final Function() action;
  final String actionName;

  const ComplainBottomSheet(this.action, this.actionName, {super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 330,
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 18, vertical: 18),
        child: Column(
          children: [
            Text(
              'Выберите действие',
              textAlign: TextAlign.center,
              style: AppTextStyles.header(),
            ),
            const SizedBox(height: 24),
            ActionButton(
              style: ActionButtonStyle.accent,
              height: 60,
              item: Padding(
                padding: EdgeInsets.symmetric(horizontal: 32),
                child: Center(
                  child: Text(
                    actionName,
                    textAlign: TextAlign.center,
                    style: const TextStyle(
                      color: AppColors.blackBrown,
                      fontSize: 18,
                      fontWeight: FontWeight.w700,
                    ),
                  ),
                ),
              ),
              onTap: () async {
                Navigator.of(context).pop();
                action();
              },
            ),
            const SizedBox(height: 16),
            ActionButton(
              style: ActionButtonStyle.transparent,
              height: 60,
              item: const Padding(
                padding: EdgeInsets.symmetric(horizontal: 32),
                child: Center(
                  child: Text(
                    'Отмена',
                    style: TextStyle(
                      color: AppColors.white,
                      fontSize: 18,
                      fontWeight: FontWeight.w700,
                    ),
                  ),
                ),
              ),
              onTap: () async {
                Navigator.of(context).pop();
              },
            ),
            const SizedBox(height: 30),
          ],
        ),
      ),
    );
  }

}