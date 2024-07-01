
import '../../../presentation/presentation.dart';
import '../../../presentation/ui/screens/home/bloc/models.dart';

abstract class HomeUseCase {
  // Future<List<CarScreenModel>?> getCars(String searchValue);
  //
  // Future<List<CarScreenModel>?> getNextPage(String searchValue);
}

@Injectable(as: HomeUseCase)
class HomeUseCaseImpl extends HomeUseCase {
  int paginationIndex = 1;
  int totalPaginationPages = 2;

  String searchValue = '';


  HomeUseCaseImpl();




  @override
  Future<UserUIModel?> getUser() async {

    return null;
  }


}
