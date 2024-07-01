part of presentation;

class SplashScreen extends StatefulWidget {
  const SplashScreen({
    super.key,
  });

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.anthraciteGray,
      body: BlocBuilder<SplashBloc, SplashState>(
        builder: (context, state) {
          return Container(
            decoration: const BoxDecoration(
              gradient: LinearGradient(
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
                colors: [
                  AppColors.deepDarkOrchid,
                  AppColors.blackBrown,
                  AppColors.blackBrown
                ],
                stops: [0.0, 0.3, 1.0],
              ),
            ),
            child: Stack(
              children: [
                Scaffold(
                  backgroundColor: Colors.transparent,
                  body: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 18),
                    child: Column(
                      children: [
                        const SizedBox(height: 70),
                        Image.asset(
                          AppAssets.appLogo,
                          height: 80,
                          fit: BoxFit.fitHeight,
                        ),
                        const Spacer(),
                        Image.asset(
                          AppAssets.appIcon,
                          width: MediaQuery.of(context).size.width * 0.5,
                          height: MediaQuery.of(context).size.width * 0.5,
                          fit: BoxFit.contain,
                        ),
                        const Spacer(),
                        TweenAnimationBuilder<double>(
                          duration: const Duration(milliseconds: 3000),
                          curve: Curves.easeInOut,
                          tween: Tween<double>(
                            begin: 0,
                            end: 1,
                          ),
                          onEnd: () {
                            context.read<SplashBloc>().add(const SplashEvent.done());
                          },
                          builder: (context, value, _) {
                            return Padding(
                              padding: const EdgeInsets.only(bottom: 100),
                              child: Center(
                                  child: SizedBox(
                                width: MediaQuery.of(context).size.width * 0.4,
                                child: ClipRRect(
                                  borderRadius: const BorderRadius.all(
                                      Radius.circular(10)),
                                  child: LinearProgressIndicator(
                                    minHeight: 4,
                                    backgroundColor: AppColors.white,
                                    color: AppColors.darkOrchid,
                                    value: value,
                                  ),
                                ),
                              )),
                            );
                          },
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}
