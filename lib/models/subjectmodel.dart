class subjectmodel {
  int id;
  String className;
  String subjectName;
  String? branch;
  DateTime? createdAt;
  DateTime? updatedAt;

  // Constructor
  subjectmodel({
    required this.id,
    required this.className,
    required this.subjectName,
    this.branch,
    this.createdAt,
    this.updatedAt,
  });

  // Factory constructor to create a subjectmodel instance from JSON
  factory subjectmodel.fromJson(Map<String, dynamic> json) {
    return subjectmodel(
       id: json['id'] as int,
      className: json['class'] as String,
      subjectName: json['subject'] as String,
      branch: json['branch'] as String?,
      createdAt: json['created_at'] as DateTime?, 
      updatedAt: json['updated_at'] as DateTime?,
    );
  }

  // Method to convert subjectmodel instance to JSON map
  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'class': className,
      'subject': subjectName,
      'branch': branch,
      'created_at': createdAt,
      'updated_at': updatedAt,
    };
  }
}
