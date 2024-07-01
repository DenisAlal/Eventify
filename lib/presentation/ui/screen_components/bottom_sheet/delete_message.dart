import 'package:flutter/cupertino.dart';

import '../../../presentation.dart';
import '../../base_widgets/action_button.dart';

enum DeleteMessageType { comment, message }

class DeleteMessageBottomSheet extends StatelessWidget {

  final Function() action;

  final DeleteMessageType type;

  const DeleteMessageBottomSheet(this.action, this.type, {super.key});

  @override
  Widget build(BuildContext context) {
    String typeString = '';
    switch (type) {
      case DeleteMessageType.comment:
        typeString = 'комментарий';
      case DeleteMessageType.message:
        typeString = 'сообщение';
    }
    return SizedBox(
      height: 330,
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 18, vertical: 18),
        child: Column(
          children: [
            Text(
              'Вы точно хотите удалить $typeString?',
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
                    'Удалить',
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