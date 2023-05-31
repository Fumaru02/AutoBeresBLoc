abstract class HomePageEvents {
  const HomePageEvents();
}

class HomePageDots extends HomePageEvents {
  final int index;
  HomePageDots(this.index);
}

class ImageURLEvent extends HomePageEvents {
  final String imageURL;
  const ImageURLEvent(this.imageURL);
}

class SelectedPathEvent extends HomePageEvents {
  final String selectedImagePath;
  const SelectedPathEvent(this.selectedImagePath);
}
