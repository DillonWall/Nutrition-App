import 'package:equatable/equatable.dart';

class RecipeEntity extends Equatable {
  final int? id;
  final String? name;
  final String? category;
  final String? area;
  final String? instructions;
  final String? thumbnailUrl;
  final String? tags;
  final String? youtubeUrl;
  final List<String>? ingredients;
  final List<String>? measurements;

  const RecipeEntity({
    this.id,
    this.name,
    this.category,
    this.area,
    this.instructions,
    this.thumbnailUrl,
    this.tags,
    this.youtubeUrl,
    this.ingredients,
    this.measurements,
  });

  @override
  List<Object?> get props {
    return [
      id,
      name,
      category,
      area,
      instructions,
      thumbnailUrl,
      tags,
      youtubeUrl,
      ingredients,
      measurements,
    ];
  }
}
