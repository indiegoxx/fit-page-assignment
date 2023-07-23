class DataModel {
  num? id;
  String? name;
  String? tag;
  String? color;
  List<Criteria>? criteria;

  DataModel({this.id, this.name, this.tag, this.color, this.criteria});

  DataModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    tag = json['tag'];
    color = json['color'];
    if (json['criteria'] != null) {
      criteria = <Criteria>[];
      json['criteria'].forEach((v) {
        criteria!.add(Criteria.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['name'] = name;
    data['tag'] = tag;
    data['color'] = color;
    if (criteria != null) {
      data['criteria'] = criteria!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Criteria {
  String? type;
  String? text;
  Map<String, dynamic>? variable;

  Criteria({this.type, this.text});

  Criteria.fromJson(Map<String, dynamic> json) {
    type = json['type'];
    text = json['text'];
    variable = json['variable'] != null
        ? json['variable'].cast<String, dynamic>()
        : {};
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['type'] = type;
    data['text'] = text;
    data['variable'] = variable;
    return data;
  }
}

class Variable {
  String? type;
  String? studyType;
  String? parameterName;
  num? minValue;
  num? maxValue;
  num? defaultValue;
  List<num?>? values;

  Variable(
      {this.type,
      this.studyType,
      this.parameterName,
      this.minValue,
      this.maxValue,
      this.defaultValue,
      this.values});

  Variable.fromJson(Map<String, dynamic> json) {
    type = json['type'];
    studyType = json['study_type'];
    parameterName = json['parameter_name'];
    minValue = json['min_value'];
    maxValue = json['max_value'];
    defaultValue = json['default_value'];
    values = json['values'] != null ? json['values'].cast<num?>() : [];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['type'] = type;
    data['study_type'] = studyType;
    data['parameter_name'] = parameterName;
    data['min_value'] = minValue;
    data['max_value'] = maxValue;
    data['default_value'] = defaultValue;
    data['values'] = values;
    return data;
  }
}
