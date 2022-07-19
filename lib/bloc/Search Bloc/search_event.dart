// ignore_for_file: public_member_api_docs, sort_constructors_first
part of 'search_bloc.dart';

abstract class SearchEvent extends Equatable {
  SearchEvent();
}

class GetSearchQuerytEvent extends SearchEvent {
  @override
  // TODO: implement props
  List<Object?> get props => [];
}

class SearchProductEvent extends SearchEvent {
  String searchQuery;
  SearchProductEvent({
    required this.searchQuery,
  });

  @override
  // TODO: implement props
  List<Object?> get props => [];
}
