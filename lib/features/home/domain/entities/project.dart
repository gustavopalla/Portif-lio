class Project {
  final String id;
  final String title;
  final String description;
  final String? imageUrl;
  final List<String> tags;
  final String? githubUrl;
  final String? liveUrl;
  final DateTime createdAt;

  Project({
    required this.id,
    required this.title,
    required this.description,
    this.imageUrl,
    required this.tags,
    this.githubUrl,
    this.liveUrl,
    required this.createdAt,
  });
}
