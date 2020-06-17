import 'dart:convert';

List<Order> listOrderFromJson(String str) =>
    List<Order>.from(json.decode(str).map((x) => Order.fromJson(x)));

String listOrderToJson(List<Order> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

Order orderFromJson(String str) => Order.fromJson(json.decode(str));

String orderToJson(Order data) => json.encode(data.toJson());

class Order {
  Order({
    this.id,
    this.status,
    this.date,
    this.customer,
    this.distance,
    this.total,
    this.product,
  });

  int id;
  String status;
  String date;
  String customer;
  double distance;
  int total;
  String product;

  factory Order.fromJson(Map<String, dynamic> json) => Order(
        id: json["id"],
        status: json["status"],
        date: json["date"],
        customer: json["customer"],
        distance: json["distance"].toDouble(),
        total: json["total"],
        product: json["product"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "status": status,
        "date": date,
        "customer": customer,
        "distance": distance,
        "total": total,
        "product": product,
      };
}
