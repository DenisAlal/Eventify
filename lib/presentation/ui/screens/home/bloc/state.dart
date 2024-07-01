part of home_bloc;
enum HomeScreenState { search, data }

class HomeState {
  final HomeScreenState state;
  final bool isLoading;
  final bool haveUser;
  final List<CarScreenModel> cars;
  final String? searchString;

  HomeState({
    required this.state,
    required this.isLoading,
    required this.haveUser,
    required this.cars,
    required this.searchString,
  });

  HomeState copyWith({
    HomeScreenState? state,
    bool? isLoading,
    bool? haveUser,
    List<CarScreenModel>? cars,
    String? searchString,
  }) =>
      HomeState(
        state: state ?? this.state,
        isLoading: isLoading ?? this.isLoading,
        haveUser: haveUser ?? this.haveUser,
        cars: cars ?? this.cars,
        searchString: searchString,
      );
}
