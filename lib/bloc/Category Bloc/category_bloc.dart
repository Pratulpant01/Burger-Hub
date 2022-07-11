import 'package:bloc/bloc.dart';
import 'package:burgerhub/services/category_services.dart';
import 'package:meta/meta.dart';

part 'category_event.dart';
part 'category_state.dart';

class CategoryBloc extends Bloc<CategoryEvent, CategoryState> {
  CategoryServices categoryServices;
  CategoryBloc(this.categoryServices) : super(CategoryInitial()) {
    on<getProductsByCategoryEvent>((event, emit) async {});
  }
}
