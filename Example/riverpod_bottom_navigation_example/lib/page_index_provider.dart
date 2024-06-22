import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'page_index_provider.g.dart';

@riverpod
class PageIndex extends _$PageIndex {
  @override
  int build() {
    return 0;
  }

  void update(int index) {
    state = index;
  }
}
