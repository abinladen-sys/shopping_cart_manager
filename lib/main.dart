import 'dart:io';

void main() {
  List<Product> products = [];

  while (true) {
    print('Welcome to the Product Management System!');
    print("=====Shopping Cart=====");
    print(
      "===== Shopping Cart =====\n1. Add Product\n2. Show Products\n3. Calculate Total\n4. Exit\nEnter your choice: ",
    );

    int? choice = int.tryParse(stdin.readLineSync() ?? '');
    if (choice == null) {
      print("Invalid choice");
      continue;
    }
    if (choice == 1) {
      print("product name:");
      String productName = stdin.readLineSync() ?? '';
      if (productName.trim().isEmpty ||
          num.tryParse(productName.trim()) != null) {
        print("Product name cannot be empty or number.");
        continue;
      }

      print("product price:");
      double? productPrice = double.tryParse(stdin.readLineSync() ?? '');
      if (productPrice == null) {
        print("Invalid price");
        continue;
      }
      print("product quantity:");
      int? productQuantity = int.tryParse(stdin.readLineSync() ?? '');
      if (productQuantity == null) {
        print("Invalid quantity");
        continue;
      }
      if (productPrice > 0 && productQuantity > 0) {
        products.add(Product(productName, productPrice, productQuantity));
        print("Product added successfully!");
      } else {
        print("Price and quantity must be greater than zero.");
      }
    } else if (choice == 2) {
      if (products.isEmpty) {
        print("No products available.");
      } else {
        for (var product in products) {
          product.displayInfo();
        }
      }
    } else if (choice == 3) {
      double total = calculateTotal(products);
      print("--------------------------");
      print("Total Price: \$${total.toStringAsFixed(2)}");
      print("--------------------------");
    } else if (choice == 4) {
      print("Exiting the program. Goodbye!");
      break;
    } else {
      print("Invalid choice. Please try again.");
    }
  }
}

class Product {
  String name;
  double price;
  int quantity;
  Product(this.name, this.price, this.quantity);
  displayInfo() {
    print('Product Name: $name');
    print('Price: \$${price.toStringAsFixed(2)}');
    print('Quantity: $quantity');
    print('-------------------------');
  }
}

double calculateTotal(List<Product> products) {
  double total = 0;
  for (var product in products) {
    total += product.price * product.quantity;
  }
  return total;
}
