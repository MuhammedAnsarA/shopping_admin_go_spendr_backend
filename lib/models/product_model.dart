import 'dart:convert';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:equatable/equatable.dart';

// ignore: must_be_immutable
class Product extends Equatable {
  final String? id;
  final String name;
  final String category;
  final String description;
  final String imageUrl;
  final bool isRecommended;
  final bool isPopular;
  num price;
  num quantity;
  Product({
    this.id,
    required this.name,
    required this.category,
    required this.description,
    required this.imageUrl,
    required this.isRecommended,
    required this.isPopular,
    this.price = 0,
    this.quantity = 0,
  });
  @override
  List<Object?> get props {
    return [
      id,
      name,
      category,
      description,
      imageUrl,
      isRecommended,
      isPopular,
      price,
      quantity,
    ];
  }

  Product copyWith({
    String? id,
    String? name,
    String? category,
    String? description,
    String? imageUrl,
    bool? isRecommended,
    bool? isPopular,
    num? price,
    num? quantity,
  }) {
    return Product(
      id: id ?? this.id,
      name: name ?? this.name,
      category: category ?? this.category,
      description: description ?? this.description,
      imageUrl: imageUrl ?? this.imageUrl,
      isRecommended: isRecommended ?? this.isRecommended,
      isPopular: isPopular ?? this.isPopular,
      price: price ?? this.price,
      quantity: quantity ?? this.quantity,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'name': name,
      'category': category,
      'description': description,
      'imageUrl': imageUrl,
      'isRecommended': isRecommended,
      'isPopular': isPopular,
      'price': price,
      'quantity': quantity,
    };
  }

  factory Product.fromSnapshot(DocumentSnapshot snap) {
    return Product(
      id: snap.id,
      name: snap['name'] as String,
      category: snap['category'] as String,
      description: snap['description'] as String,
      imageUrl: snap['imageUrl'] as String,
      isRecommended: snap['isRecommended'] as bool,
      isPopular: snap['isPopular'] as bool,
      price: snap['price'] as num,
      quantity: snap['quantity'] as num,
    );
  }

  String toJson() => json.encode(toMap());

  @override
  bool get stringify => true;

  static List<Product> products = [
    Product(
        id: "1",
        name: "Coca Cola",
        description:
            "Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged.",
        category: "Soft Drinks",
        imageUrl:
            "https://images.unsplash.com/photo-1622483767028-3f66f32aef97?ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxzZWFyY2h8MTZ8fGNvY2ElMjBjb2xhfGVufDB8fDB8fHww&auto=format&fit=crop&w=600&q=60",
        price: 130,
        quantity: 10,
        isRecommended: true,
        isPopular: false),
    Product(
      id: "2",
      name: "Red Bull",
      description:
          "Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged.",
      category: "Soft Drinks",
      imageUrl:
          "https://images.unsplash.com/photo-1613218222876-954978a4404e?ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxzZWFyY2h8NHx8cmVkJTIwYnVsbHxlbnwwfHwwfHx8MA%3D%3D&auto=format&fit=crop&w=600&q=60",
      price: 140,
      quantity: 10,
      isRecommended: false,
      isPopular: true,
    ),
    Product(
      id: "3",
      name: "Monster",
      description:
          "Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged.",
      category: "Shoes",
      imageUrl:
          "https://images.unsplash.com/photo-1622543925917-763c34d1a86e?ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxzZWFyY2h8Mnx8bW9uc3RlciUyMGRyaW5rfGVufDB8fDB8fHww&auto=format&fit=crop&w=600&q=60",
      price: 60,
      quantity: 10,
      isRecommended: true,
      isPopular: false,
    ),
    Product(
      id: "4",
      name: "Pepsi",
      description:
          "Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged.",
      category: "Soft Drinks",
      imageUrl:
          "https://images.unsplash.com/photo-1629203849820-fdd70d49c38e?ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxzZWFyY2h8MXx8cGVwc2l8ZW58MHx8MHx8fDA%3D&auto=format&fit=crop&w=600&q=60",
      price: 40,
      quantity: 10,
      isRecommended: true,
      isPopular: false,
    ),
    Product(
      id: "5",
      name: "Dragon Smoothie",
      description:
          "Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged.",
      category: "Smoothies",
      imageUrl:
          "https://images.unsplash.com/photo-1483918793747-5adbf82956c4?ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxzZWFyY2h8OXx8U21vb3RoaWVzfGVufDB8fDB8fHww&auto=format&fit=crop&w=600&q=60",
      price: 80,
      quantity: 10,
      isRecommended: false,
      isPopular: true,
    ),
    Product(
      id: "6",
      name: "Vegetable Smoothie",
      description:
          "Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged.",
      category: "Smoothies",
      imageUrl:
          "https://images.unsplash.com/photo-1610970881699-44a5587cabec?ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxzZWFyY2h8Mnx8U21vb3RoaWVzfGVufDB8fDB8fHww&auto=format&fit=crop&w=600&q=60",
      price: 40,
      quantity: 10,
      isRecommended: true,
      isPopular: false,
    ),
  ];
}
