library person;

import 'package:json_annotation/json_annotation.dart';

part 'Person.g.dart';



@JsonSerializable()
class Person{
  String name;


  Person(this.name);

  factory Person.fromJson(Map<String, dynamic> json) => _$PersonFromJson(json);

     Map<String, dynamic> toJson(Person instance) => _$PersonToJson(instance);


}