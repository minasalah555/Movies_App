import 'package:get_it/get_it.dart';
import 'package:movies_app/Features/Home/data/repos/home_repo_impl.dart';
import 'package:movies_app/core/utils/api_services.dart';

final getIt = GetIt.instance;
void setup() {
  getIt.registerSingleton<ApiServices>(ApiServices());
  getIt.registerSingleton<HomeRepoImpl>(HomeRepoImpl(getIt.get<ApiServices>()));
}
