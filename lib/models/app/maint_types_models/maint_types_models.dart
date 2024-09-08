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
    MaintTypes(
        name: 'Oil Change',
        description:
            'Regularly changing the engine oil to ensure smooth engine performance and longevity.'),
    MaintTypes(
        name: 'Tire Rotation',
        description:
            'Rotating the tires to ensure even tire wear and extend their lifespan.'),
    MaintTypes(
        name: 'Brake Inspection',
        description:
            'Thoroughly inspecting the brake system to ensure safety and optimal performance.'),
    MaintTypes(
        name: 'Battery Replacement',
        description:
            'Replacing the car battery to ensure reliable starting and electrical system performance.'),
    MaintTypes(
        name: 'Air Filter Replacement',
        description:
            'Replacing the air filter to maintain clean airflow to the engine and improve fuel efficiency.'),
    // MaintTypes(name: 'Coolant Flush', description: 'Flushing the coolant system to remove old coolant and contaminants, ensuring the engine runs at the correct temperature.'),
    MaintTypes(name: 'Other', description: ''),
  ];
}
