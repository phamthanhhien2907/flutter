class Plant {
  //  dinh nghia moda(kieu du lieu)
  final int id;
  final String plantName;
  final String plantType;
  final String imageUrl;
  final double price;
  final String description;
  Plant({
    required this.id,
    required this.plantName,
    required this.plantType,
    required this.imageUrl,
    required this.price,
    required this.description,
  });
}
// custom data

List<Plant> samplePlants = [
  Plant(
    id: 1,
    plantName: 'Sage',
    plantType: 'Scenes',
    imageUrl: 'assets/images/tree1.png',
    price: 25.99,
    description:
        'Lemon Balm is a 50cm to 80cm high perennial herb with a four-edged, branching, sparsely-haired stalk. The opposed leaves, whose stalked stems vary in length, are broadly oval to heart-shaped and have an irregular crenate (rounded teeth) or serrate (small, sharp teeth) edge.',
  ),
  Plant(
    id: 2,
    plantName: 'Basil',
    plantType: 'Herbs',
    imageUrl: 'assets/images/tree2.png',
    price: 35.49,
    description:
        'Lemon Balm is a 50cm to 80cm high perennial herb with a four-edged, branching, sparsely-haired stalk. The opposed leaves, whose stalked stems vary in length, are broadly oval to heart-shaped and have an irregular crenate (rounded teeth) or serrate (small, sharp teeth) edge.',
  ),
  Plant(
    id: 3,
    plantName: 'Oregano',
    plantType: 'Herbs',
    imageUrl: 'assets/images/tree3.png',
    price: 19.99,
    description:
        'Lemon Balm is a 50cm to 80cm high perennial herb with a four-edged, branching, sparsely-haired stalk. The opposed leaves, whose stalked stems vary in length, are broadly oval to heart-shaped and have an irregular crenate (rounded teeth) or serrate (small, sharp teeth) edge.',
  ),
  Plant(
    id: 4,
    plantName: 'Lavender',
    plantType: 'Scenes',
    imageUrl: 'assets/images/tree4.png',
    price: 22.99,
    description:
        'Lemon Balm is a 50cm to 80cm high perennial herb with a four-edged, branching, sparsely-haired stalk. The opposed leaves, whose stalked stems vary in length, are broadly oval to heart-shaped and have an irregular crenate (rounded teeth) or serrate (small, sharp teeth) edge.',
  ),
];
