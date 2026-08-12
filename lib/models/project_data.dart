class ProjectModel {
  final String title, fullDesc;
  final String description;
  final String downloadUrl;
  final String? demoUrl; // Optional live demo link (e.g. Appetize.io)
  final List<String> images;
  final String imagesBackGround;

  const ProjectModel({
    required this.title,
    required this.description,
    required this.downloadUrl,
    required this.images,
    required this.imagesBackGround,
    required this.fullDesc,
    this.demoUrl,
  });
}

