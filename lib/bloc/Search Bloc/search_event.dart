// ignore_for_file: public_member_api_docs, sort_constructors_first
part of 'search_bloc.dart';

abstract class SearchEvent extends Equatable {
  SearchEvent();
  @override
  // TODO: implement props
  List<Object?> get props => [];
}

class GetSearchQuerytEvent extends SearchEvent {}

class SearchProductEvent extends SearchEvent {
  String searchQuery;
  SearchProductEvent({
    required this.searchQuery,
  });
}

class ShowAllProductsEvent extends SearchEvent {}
