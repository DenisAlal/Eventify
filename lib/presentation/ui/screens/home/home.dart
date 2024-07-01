part of presentation;

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  HomeScreenState createState() => HomeScreenState();
}

class HomeScreenState extends State<HomeScreen> with TickerProviderStateMixin {
  final ScrollController scrollController = ScrollController();
  final TextEditingController textController = TextEditingController();
  bool isLoading = false;

  @override
  void initState() {
    // scrollController.addListener(pagination);
    super.initState();
  }

  @override
  void dispose() {
    //scrollController.removeListener(pagination);
    super.dispose();
  }

  void scrollToTop() {
    if (scrollController.hasClients) {
      scrollController.jumpTo(0);
    }
  }

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async {
        return false;
      },
      child: BaseScaffold(
        backgroundColor: AppColors.anthraciteGray,
        resizeToAvoidBottomInset: false,
        body: Column(
          children: [
            Container(
              height: 105,
              alignment: Alignment.bottomCenter,
              decoration: const BoxDecoration(
                color: AppColors.blackBrown,
                borderRadius: BorderRadius.only(
                    bottomLeft: Radius.circular(20),
                    bottomRight: Radius.circular(20)),
              ),
              child: Padding(
                padding: const EdgeInsets.only(bottom: 18),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    SvgPicture.asset(
                      AppAssets.home,
                      width: 24,
                      height: 24,
                    ),
                    const SizedBox(width: 14),
                    Text('Главная', style: AppTextStyles.header()),
                  ],
                ),
              ),
            ),
            Expanded(
              child: BlocConsumer<HomeBloc, HomeState>(
                listener: (context, state) {
                  isLoading = state.isLoading;
                  if (state.searchString != null) {
                    setState(() {
                      textController.text = state.searchString!;
                      //searchValue = state.searchString!;
                      // FocusScope.of(context).unfocus();
                      FocusScope.of(context).requestFocus(FocusNode());
                    });
                  }
                },
                builder: (context, state) {
                  return CustomScrollView(
                    controller: scrollController,
                    physics: const AlwaysScrollableScrollPhysics(),
                    slivers: [
                      const SliverPadding(
                        padding: EdgeInsets.only(
                          top: 16,
                        ),
                      ),
                      // SliverPadding(
                      //   padding: const EdgeInsets.fromLTRB(16, 8, 16, 0),
                      //   sliver: SliverGrid(
                      //     gridDelegate:
                      //         SliverGridDelegateWithFixedCrossAxisCount(
                      //             crossAxisCount: 2,
                      //             crossAxisSpacing: 11,
                      //             mainAxisSpacing: 11,
                      //             childAspectRatio:
                      //                 ((MediaQuery.of(context).size.width -
                      //                             43) *
                      //                         0.5) /
                      //                     (MediaQuery.of(context).size.height *
                      //                         0.298)
                      //             // childAspectRatio: 173 / 254,
                      //             ),
                      //     delegate: SliverChildListDelegate(state.cars.map((e) {
                      //       return InkWell(
                      //           onTap: () {
                      //             //context.read<HomeBloc>().add(HomeEvent.openCar(car: e));
                      //           },
                      //           child: Text(e.number));
                      //     }).toList()),
                      //   ),
                      // ),
                      SliverToBoxAdapter(
                        child: Padding(
                          padding: const EdgeInsets.symmetric(
                              vertical: 8, horizontal: 16),
                          child: Text(
                            'Добавить расходы',
                            textAlign: TextAlign.start,
                            style: AppTextStyles.header(),
                          ),
                        ),
                      ),
                      SliverToBoxAdapter(
                        child: Padding(
                          padding: const EdgeInsets.symmetric(
                              horizontal: 10, vertical: 10),
                          child: BasicInputField(
                            hintText: 'Введите сумму расходов',
                            height: 59,
                            labelText: null,
                            inputFormatters: [
                              //UpperCaseTextFormatter()
                            ],
                            controller: textController,
                            onChange: (value) {
                              setState(() {
                                scrollToTop();
                              });
                            },
                            prefixIcon: SvgPicture.asset(AppAssets.walletAdd),

                            // errorText:
                          ),
                        ),
                      ),
                      SliverToBoxAdapter(
                        child: Padding(
                          padding: const EdgeInsets.symmetric(
                              vertical: 8, horizontal: 16),
                          child: Text(
                            'Выберите категорию расходов',
                            textAlign: TextAlign.start,
                            style: AppTextStyles.homePageSubtitle(),
                          ),
                        ),
                      ),

                      SliverToBoxAdapter(
                        child: Padding(
                          padding: const EdgeInsets.symmetric(
                              vertical: 8, horizontal: 10),
                          child: AppDropdown(
                            items: ['One', 'Two', 'Three'],
                            selectedItem: 'One',
                            onChanged: (value) {
                              print('Selected: $value');
                            },
                            dropdownColor: AppColors.anthraciteGray,
                            height: 59,
                          ),
                        ),
                      ),
                      SliverToBoxAdapter(
                        child: Padding(
                          padding: const EdgeInsets.symmetric(
                              vertical: 8, horizontal: 10),
                          child: ActionButton(
                            style: ActionButtonStyle.transparent,
                            height: 60,
                            item: const Padding(
                              padding: EdgeInsets.symmetric(horizontal: 32),
                              child: Center(
                                child: Text(
                                  'Сохранить',
                                  style: TextStyle(
                                    color: AppColors.white,
                                    fontSize: 18,
                                    fontWeight: FontWeight.w700,
                                  ),
                                ),
                              ),
                            ),
                            onTap: () {},
                          ),
                        ),
                      ),
                      SliverToBoxAdapter(
                        child: Padding(
                          padding: const EdgeInsets.symmetric(
                              vertical: 8, horizontal: 16),
                          child: Text(
                            'Список последних расходов',
                            textAlign: TextAlign.start,
                            style: AppTextStyles.header(),
                          ),
                        ),
                      ),
                      SliverPadding(
                        padding: const EdgeInsets.fromLTRB(16, 8, 16, 0),
                        sliver: SliverGrid(
                          gridDelegate:
                              SliverGridDelegateWithFixedCrossAxisCount(
                            crossAxisCount: 1,
                            crossAxisSpacing: 11,
                            mainAxisSpacing: 11,
                            //childAspectRatio: ((MediaQuery.of(context).size.width - 43) * 0.5) /
                            // (MediaQuery.of(context).size.height * 0.298)
                            childAspectRatio:
                                MediaQuery.of(context).size.width / 110,
                          ),
                          delegate: SliverChildListDelegate(state.cars.map((e) {
                            return InkWell(
                                onTap: () {},
                                // child: Text(e.number)
                                child: CarListCell(
                                  data: e,
                                  haveUser: state.haveUser,
                                ));
                          }).toList()),
                        ),
                      ),
                      const SliverToBoxAdapter(
                        child: SizedBox(height: 20),
                      )
                    ],
                  );
                },
              ),
            ),
            KeyboardVisibilityBuilder(
              builder: (context, isKeyboardVisible) {
                if (isKeyboardVisible) {
                  return SizedBox(
                      height: MediaQuery.of(context).viewInsets.bottom);
                } else {
                  return const SizedBox(height: 65);
                }
              },
            )
          ],
        ),
      ),
    );
  }
}

class CarListCell extends StatefulWidget {
  final CarScreenModel data;
  final bool haveUser;

  const CarListCell({super.key, required this.data, required this.haveUser});

  @override
  State<CarListCell> createState() => _CarListCellState();
}

class _CarListCellState extends State<CarListCell> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    var height = MediaQuery.of(context).size.height * 0.298;
    var width = (MediaQuery.of(context).size.width - 43) * 0.5;

    return Stack(
      children: [
        Container(
          decoration: BoxDecoration(
            color: AppColors.blackBrown,
            borderRadius: BorderRadius.circular(10),
          ),
          child: Padding(
            padding: EdgeInsets.symmetric(vertical: width * 0.05),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: width * 0.06),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        widget.data.number.formatCarNumber(),
                        textAlign: TextAlign.start,
                        style: AppTextStyles.body1(),
                      ),
                      Padding(
                          padding: EdgeInsets.only(),
                          child: ActionButton(
                              width: width * 0.42,
                              height: height * 0.115,
                              onTap: () {},
                              style: widget.data.isDisliked
                                  ? ActionButtonStyle.like
                                  : ActionButtonStyle.transparent,
                              borderColor: widget.data.isDisliked
                                  ? null
                                  : AppColors.stroke,
                              borderWidth: 1,
                              item: Padding(
                                padding: EdgeInsets.all(height * 0.02),
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Text(
                                      widget.data.dislikesCount.roundThousand(),
                                      style: AppTextStyles.carCardButtonLabel(
                                          color: widget.data.isDisliked
                                              ? AppColors.darkOrchid
                                              : AppColors.white),
                                    ),
                                    const SizedBox(width: 3),
                                    SvgPicture.asset(
                                      AppAssets.dislike,
                                      width: width * 0.092,
                                      height: width * 0.092,
                                      colorFilter: ColorFilter.mode(
                                          widget.data.isDisliked
                                              ? AppColors.darkOrchid
                                              : AppColors.white,
                                          BlendMode.srcIn),
                                    ),
                                  ],
                                ),
                              )))
                    ],
                  ),
                ),
                const Spacer(),
                if (widget.data.createTime != null)
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: width * 0.057),
                    child: Text(
                      widget.data.createTime!.howLongAgo,
                      style: AppTextStyles.body2(color: AppColors.text),
                    ),
                  ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
