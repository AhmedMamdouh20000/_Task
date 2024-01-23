import 'package:dio/dio.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:task/Features/home-feature/cubit/home-state.dart';
import 'package:url_launcher/url_launcher.dart';
import '../../../core/dio-helper.dart';
import '../model/post-model.dart';

class HomeCubit extends Cubit<HomeStates> {
  HomeCubit() : super(Homeinial());

  static HomeCubit get(context) => BlocProvider.of(context);

  List<PostModel> posts = [];
  int pageNumber = 1;
  int limit = 7;


  Future<List<PostModel>> getPost() async {
    emit(HomeLoading());
    try {
      Response response = await DioHelper.getData(
        url: "https://dummyjson.com/posts?post=$posts&page=$pageNumber&limit=$limit",
        data: {},
      );
      print("+++++++++++++response++++++++++++++");
      print(response.data);
      limit= limit + 3 ;
      if (response.data['posts'] != null && response.data['posts'] is List) {
        posts = (response.data['posts'] as List).map((json) =>
            PostModel.fromJson(json)).toList();
        print("+++++++++++++productsList++++++++++++++");
        print(posts.length);
        print('lenttttttttttttttttttttttttttttttttt');
        emit(HomeSuccess());
        return posts;
      } else {
        print('Error: Response data does not contain a valid posts list');
        emit(HomeErorr());
        return [];
      }
    } on DioError catch (e) {
      emit(HomeErorr());
      print('DioError: $e');
      return [];
    } catch (e) {
      emit(HomeErorr());
      print('Error: $e');
      return [];
    }
  }
}
