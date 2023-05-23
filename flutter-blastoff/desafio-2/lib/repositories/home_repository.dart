import 'package:projeto_2/models/post_model.dart';

abstract class HomeRepository {
  Future<List<PostModel>> getList();
}
