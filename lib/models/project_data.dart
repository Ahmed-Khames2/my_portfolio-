class ProjectModel {
  final String title,fullDesc;
  final String description;
  final String downloadUrl;
  final List<String> images;
  final String imagesBackGround; // مسار صورة الخلفية

  const ProjectModel({
    required this.title,
    required this.description,
    required this.downloadUrl,
    required this.images,
    required this.imagesBackGround,
        required this.fullDesc,

  });
}
