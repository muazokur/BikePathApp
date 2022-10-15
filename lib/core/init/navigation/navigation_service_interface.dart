abstract class INavigationService {
  Future<void> navigedToPage({String? path, Object? data});
  Future<void> navigedToPageClear({String? path, Object? data});
}
