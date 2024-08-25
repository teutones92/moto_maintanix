class MaintTypes {
  String name;
  String description;

  MaintTypes({required this.name, required this.description});

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['name'] = name;
    data['description'] = description;
    return data;
  }

  static List<MaintTypes> maintTypesList = [
    MaintTypes(name: 'Oil Change', description: 'Changing the engine oil'),
    MaintTypes(name: 'Tire Rotation', description: 'Rotating the tires'),
    MaintTypes(
        name: 'Brake Inspection', description: 'Inspecting the brake system'),
    MaintTypes(
        name: 'Battery replacement', description: 'Replacing the battery'),
    MaintTypes(
        name: 'Air Filter Replacement',
        description: 'Replacing the air filter'),
    MaintTypes(
        name: 'Coolant Flush', description: 'Flushing the coolant system'),
    MaintTypes(name: 'Other', description: ''),
  ];
}
