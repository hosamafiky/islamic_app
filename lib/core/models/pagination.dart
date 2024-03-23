// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:equatable/equatable.dart';

class Pagination extends Equatable {
  final int currentPage;
  final int pageSize;
  final int totalPages;

  const Pagination({
    this.currentPage = 1,
    this.pageSize = 10,
    this.totalPages = 2,
  });

  Pagination copyWith({
    int? currentPage,
    int? pageSize,
    int? totalPages,
  }) {
    return Pagination(
      currentPage: currentPage ?? this.currentPage,
      pageSize: pageSize ?? this.pageSize,
      totalPages: totalPages ?? this.totalPages,
    );
  }

  @override
  bool get stringify => true;

  @override
  List<Object> get props => [currentPage, pageSize, totalPages];
}
