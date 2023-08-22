import 'package:bloc/bloc.dart';

void main() {
  // Bloc.observer = SimpleBlocObserver();
  CounterBloc()
    ..add(CounterIncrementPressed())
    ..close();
}

sealed class CounterEvent {}

final class CounterIncrementPressed extends CounterEvent {}



final class CounterBloc extends Bloc<CounterEvent, int> {
  
  CounterBloc() : super(0) {
    on<CounterIncrementPressed>(onCounterPressed);
  }

  void onCounterPressed(CounterIncrementPressed event, Emitter<int> emit) {
    // addError(Exception('increment error!'), StackTrace.current);
    emit(state + 1);
  }

  @override
  void onChange(Change<int> change) {
    super.onChange(change);
    print(change);
  }

  @override
  void onError(Object error, StackTrace stackTrace) {
    print('$error,$stackTrace');
    super.onError(error, stackTrace);
  }

  @override
  void onEvent(CounterEvent event) {
    super.onEvent(event);
    print(event.toString());
  }

  @override
  void onTransition(Transition<CounterEvent, int> transition) {
    super.onTransition(transition);
    print(transition);
  }
}
