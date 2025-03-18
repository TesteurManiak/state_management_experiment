import 'package:state_management/state_management.dart';

class ViewModelLocator<T, V extends ViewModel<T>> extends Locator<V> {
  ViewModelLocator(super._create) : super(onDispose: (vm) => vm.dispose());
}
