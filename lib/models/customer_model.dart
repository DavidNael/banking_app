const String customerTable = "customers";

class CustomerFields {
  static const String id = '_id';
  static const String name = 'name';
  static const String address = 'address';
  static const String phone = 'phone';
  static const String email = 'email';
  static const String balance = 'balance';
  static const String image = 'image';
  static final List<String> values = [id, name, address, phone, email,balance, image];
}

class CustomerModel {
  int? id;
  String name;
  String address;
  String phone;
  String email;
  double balance;
  String image;
  CustomerModel({
    this.id,
    required this.name,
    required this.address,
    required this.phone,
    required this.email,
    required this.balance,
    required this.image,
  });

  static CustomerModel fromJson(Map<String, Object?> json) => CustomerModel(
        id: json[CustomerFields.id] as int?,
        name: json[CustomerFields.name] as String,
        address: json[CustomerFields.address] as String,
        phone: json[CustomerFields.phone] as String,
        email: json[CustomerFields.email] as String,
        balance: json[CustomerFields.balance] as double,
        image: json[CustomerFields.image] as String,
      );
  Map<String, Object?> toJson() => {
        CustomerFields.id: id,
        CustomerFields.name: name,
        CustomerFields.address: address,
        CustomerFields.phone: phone,
        CustomerFields.email: email,
        CustomerFields.balance: balance,
        CustomerFields.image: image,
      };

  CustomerModel copyWith({
    int? id,
    String? name,
    String? address,
    String? phone,
    String? email,
    double? balance,
    String? image,
  }) =>
      CustomerModel(
        id: id ?? this.id,
        name: name ?? this.name,
        address: address ?? this.address,
        phone: phone ?? this.phone,
        email: email ?? this.email,
        balance: balance ?? this.balance,
        image: image ?? this.image,
      );
}
