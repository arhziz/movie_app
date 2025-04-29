import 'package:equatable/equatable.dart';

///@template_start response_item
///This is a response class that should be inherited by the list of object to
///be fetched
///@template_end
class Response extends Equatable {
  ///@macro response_item
  const Response({this.page = 0, this.totalPages = 0, this.totalResults = 0});

  ///the current page
  final int page;

  ///the number of total available pages
  final int totalPages;

  ///the number o total items in the page response
  final int totalResults;

  @override
  List<Object?> get props => throw UnimplementedError();
}
