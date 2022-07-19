// import 'dart:async';

// import 'package:burgerhub/bloc/Search%20Bloc/search_bloc.dart';
// import 'package:burgerhub/models/product_model.dart';
// import 'package:burgerhub/view/product/services/product_services.dart';

// class RepositoryClass {
//   ProductServices productServices = ProductServices();

//   Stream<SearchState> getSearchedProducts(SearchEvent event) async* {
//     late StreamSubscription searchProductSubscription;

//     if (event is SearchProductEvent) {
//       searchProductSubscription =
//           productServices.searchItem(event.searchItem).listen(
//                 (snapshots) => add(
//                   SearchLoaded(snapshot: snapshots),
//                 ),
//               );
//     }
//   }
// }
