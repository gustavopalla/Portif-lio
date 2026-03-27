class Experience {
  final String id;
  final String role;
  final String company;
  final String description;
  final DateTime startDate;
  final DateTime? endDate;
  final bool isCurrent;

  Experience({
    required this.id,
    required this.role,
    required this.company,
    required this.description,
    required this.startDate,
    this.endDate,
    required this.isCurrent,
  });
}
