import 'package:hive_flutter/hive_flutter.dart';

part 'search_repo_model.g.dart';

@HiveType(typeId: 0)
class SearchRepoModel extends HiveObject {
  @HiveField(0)
  final int id;

  @HiveField(1)
  final String name;

  @HiveField(2)
  bool isSelected;

  SearchRepoModel({
    required this.id,
    required this.name,
    this.isSelected = false,
  });

  SearchRepoModel copyWith({
    int? id,
    String? name,
    bool? isSelected,
  }) {
    return SearchRepoModel(
      id: id ?? this.id,
      name: name ?? this.name,
      isSelected: isSelected ?? this.isSelected,
    );
  }
}
