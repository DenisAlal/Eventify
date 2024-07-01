import 'package:flutter/cupertino.dart';

import '../../../presentation.dart';
import '../../base_widgets/action_button.dart';

class LogoutBottomSheet extends StatelessWidget {

  final Function() action;

  const LogoutBottomSheet(this.action, {super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 330,
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 18, vertical: 18),
        child: Column(
          children: [
            Text(
              'Вы точно хотите выйти \nиз профиля?',
              textAlign: TextAlign.center,
              style: AppTextStyles.header(),
            ),
            const SizedBox(height: 24),
            ActionButton(
              style: ActionButtonStyle.accent,
              height: 60,
              item: const Padding(
                padding: EdgeInsets.symmetric(horizontal: 32),
                child: Center(
                  child: Text(
                    'Выйти',
                    style: TextStyle(
                      color: AppColors.blackBrown,
                      fontSize: 18,
                      fontWeight: FontWeight.w700,
                    ),
                  ),
                ),
              ),
              onTap: () {
                action();
                Navigator.of(context).pop();
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
              onTap: () {
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