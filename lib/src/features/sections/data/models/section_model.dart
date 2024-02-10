import 'package:g_machines/src/features/sections/domain/entities/section.dart';

class SectionModel extends SectionEntity{
  SectionModel({
    required String section_name,
    required int section_number,
    int? id,
  }) : super(
    section_name: section_name,
    section_number: section_number,
    id: id,
  );

  factory SectionModel.fromJson(Map<String, dynamic> json) {
    return SectionModel(
      section_name: json['section_name'],
      section_number: json['section_number'],
      id: json['id'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'section_name': section_name,
      'section_number': section_number,
      'id': id,
    };
  }

  SectionEntity toEntity(){
    return SectionEntity(
      section_name: section_name,
      section_number: section_number,
      id: id,
    );
  }
}