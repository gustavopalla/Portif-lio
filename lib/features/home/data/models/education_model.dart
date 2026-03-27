import '../../domain/entities/education.dart';

class EducationModel extends Education {
  EducationModel({
    required super.id,
    required super.institution,
    required super.degree,
    required super.status,
    required super.period,
  });

  factory EducationModel.fromJson(Map<String, dynamic> json) {
    return EducationModel(
      id: json['id'] as String,
      institution: json['institution'] as String,
      degree: json['degree'] as String,
      status: json['status'] as String,
      period: json['period'] as String,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'institution': institution,
      'degree': degree,
      'status': status,
      'period': period,
    };
  }
}
