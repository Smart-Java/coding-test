import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';

part 'home_txn_model.g.dart';

@JsonSerializable()
class HomeTxnModel extends Equatable {
  const HomeTxnModel({
    required this.title,
    required this.distribution,
    required this.isItActive,
  });

  final String title;
  final String distribution;
  final bool isItActive;

  @override
  List<Object?> get props => [
        title,
        distribution,
        isItActive,
      ];

  factory HomeTxnModel.fromJson(Map<String, dynamic> json) {
    return _$HomeTxnModelFromJson(json);
  }

  Map<String, dynamic> toJson() {
    return _$HomeTxnModelToJson(this);
  }
}
