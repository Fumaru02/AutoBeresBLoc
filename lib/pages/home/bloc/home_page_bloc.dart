import 'package:bloc/bloc.dart';
import 'package:bloc_flutter/pages/home/bloc/home_page_events.dart';
import 'package:bloc_flutter/pages/home/bloc/home_page_states.dart';

class HomePageBloc extends Bloc<HomePageEvents, HomePageStates> {
  HomePageBloc() : super(const HomePageStates()) {
    on<HomePageDots>(_homePageDots);
    on<ImageURLEvent>(_imageURLEvent);
    on<SelectedPathEvent>(_selectedPathEvent);
  }

  void _homePageDots(HomePageDots event, Emitter<HomePageStates> emit) {
    emit(state.copyWith(index: event.index));
  }

  void _imageURLEvent(ImageURLEvent event, Emitter<HomePageStates> emit) {
    emit(state.copyWith(imageURL: event.imageURL));
  }

  void _selectedPathEvent(
      SelectedPathEvent event, Emitter<HomePageStates> emit) {
    emit(state.copyWith(selectedImagePath: event.selectedImagePath));
  }
}
