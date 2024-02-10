class ProductDataModel {
  final String id;
  final String name;
  final String category;
  final double price;
  final String brand;
  final int quantity;

  ProductDataModel({
    required this.id, 
    required this.name, 
    required this.category, 
    required this.price, 
    required this.brand, 
    required this.quantity
    });
}

// {
//   "products": [
//     {
//       "id": "001",
//       "name": "Organic Apples",
//       "category": "Fruits",
//       "price": 2.99,
//       "quantity": 50,
//       "brand": "Organic Farms"
//     },
//     {
//       "id": "002",
//       "name": "Whole Grain Bread",
//       "category": "Bakery",
//       "price": 3.49,
//       "quantity": 30,
//       "brand": "Healthy Breads Inc."
//     },
//     {
//       "id": "003",
//       "name": "Free Range Eggs",
//       "category": "Dairy",
//       "price": 4.99,
//       "quantity": 20,
//       "brand": "Happy Hens Farm"
//     },
//     {
//       "id": "004",
//       "name": "Organic Spinach",
//       "category": "Vegetables",
//       "price": 1.99,
//       "quantity": 40,
//       "brand": "Green Leaf Farms"
//     }
//   ]
// }
