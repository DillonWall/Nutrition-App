import 'package:equatable/equatable.dart';

class CategoryEntity extends Equatable {
  final int? id;
  final String? name;
  final String? thumbnailUrl;
  final String? description;

  const CategoryEntity(
    this.id,
    this.name,
    this.thumbnailUrl,
    this.description,
  );

  @override
  List<Object?> get props {
    return [
      id,
      name,
      thumbnailUrl,
      description,
    ];
  }
}
