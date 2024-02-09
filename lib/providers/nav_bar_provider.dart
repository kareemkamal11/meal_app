import 'package:flutter_riverpod/flutter_riverpod.dart';

// create a provider class like be filter provider

class NavBarProvider extends StateNotifier<int> {
  NavBarProvider() : super(0);

  void updateIndex(int index) {
    state = index;
  }
}

final navBarProvider = StateNotifierProvider<NavBarProvider,int>((ref) {
  return NavBarProvider();
} );
