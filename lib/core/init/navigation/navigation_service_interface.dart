abstract class INavigationService {
  Future<void> navigedToPage({required String path, required Object data});
  Future<void> navigedToPageClear({required String path, required Object data});
}
