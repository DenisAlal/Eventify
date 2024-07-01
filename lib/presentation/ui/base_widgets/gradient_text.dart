part of presentation;

class GradientMask extends StatelessWidget {
  const GradientMask({
    super.key,
    required this.gradient,
    this.child,
  });

  final Gradient gradient;
  final Widget? child;

  @override
  Widget build(BuildContext context) => ShaderMask(
        blendMode: BlendMode.srcIn,
        shaderCallback: (bounds) => gradient.createShader(
          Rect.fromLTWH(0, 0, bounds.width, bounds.height),
        ),
        child: child,
      );
}
