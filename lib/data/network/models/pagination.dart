class PaginationApiRequestResult<T> {
  final List<T> data;
  final int currentPage;
  final int totalPages;
  final int totalCount;

  PaginationApiRequestResult(
      {required this.data, required this.currentPage, required this.totalPages, required this.totalCount});
}
