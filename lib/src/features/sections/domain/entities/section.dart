class SectionEntity{
  final int? id;
  final String? section_name;
  final int? section_number;

  SectionEntity({
    this.id,
    required this.section_name,
    required this.section_number,
  });

  @override
  String toString() {
    return 'SectionEntity(id: $id, section_name: $section_name, section_number: $section_number)';
  }
}