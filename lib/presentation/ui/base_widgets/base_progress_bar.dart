part of presentation;

class BaseProgressBar extends StatefulWidget {
  final double height;
  final Duration duration;
  final Duration frequency;

  const BaseProgressBar({
    Key? key,
    this.height = 4,
    this.duration = kAppLoadingDelay,
    this.frequency = kAppProgressBarUpdateFrequency,
  }) : super(key: key);

  @override
  State<BaseProgressBar> createState() => _BaseProgressBarState();
}

class _BaseProgressBarState extends State<BaseProgressBar> {
  late final Timer timer;
  late final int totalTicks;

  int value = 0;

  @override
  void initState() {
    totalTicks =
        (widget.duration.inMilliseconds / widget.frequency.inMilliseconds)
            .ceil();

    timer = Timer.periodic(
      widget.frequency,
      onTimerUpdate,
    );

    super.initState();
  }

  @override
  void dispose() {
    timer.cancel();

    super.dispose();
  }

  void onTimerUpdate(Timer timer) {
    setState(() {
      value = min(100, ((timer.tick / totalTicks) * 100).round());
    });
  }

  @override
  Widget build(BuildContext context) => Container(
        height: widget.height,
        decoration: ShapeDecoration(
          color: AppColors.white,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(widget.height / 2),
          ),
        ),
        child: Row(
          children: [
            Expanded(
              flex: value,
              child: Container(
                decoration: ShapeDecoration(
                  color: AppColors.red,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(widget.height / 2),
                  ),
                ),
              ),
            ),
            if (value < 100)
              Spacer(
                flex: 100 - value,
              ),
          ],
        ),
      );
}
