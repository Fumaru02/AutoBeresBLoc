class HomePageStates {
  const HomePageStates({
    this.imageURL = '',
    this.selectedImagePath = '',
    this.index = 0,
  });
  final int index;
  final String imageURL;
  final String selectedImagePath;
  HomePageStates copyWith({
    int? index,
    String? imageURL = '',
    String? selectedImagePath = '',
  }) {
    return HomePageStates(
      index: index ?? this.index,
      imageURL: imageURL ?? this.imageURL,
      selectedImagePath: selectedImagePath ?? this.selectedImagePath,
    );
  }
}
