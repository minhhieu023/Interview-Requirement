class Order {
  int id;
  String cusName;
  String cusPhone;
  String cusAddress;
  String model;
  String employeeId;
  String orderDate;
  Order(
      {this.id,
      this.cusName,
      this.cusPhone,
      this.cusAddress,
      this.model,
      this.employeeId,
      this.orderDate});

  Order.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    cusName = json['cusName'];
    cusPhone = json['cusPhone'];
    cusAddress = json['cusAddress'];
    model = json['model'];
    employeeId = json['employeeId'];
    orderDate = json['orderDate'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['cusName'] = this.cusName;
    data['cusPhone'] = this.cusPhone;
    data['cusAddress'] = this.cusAddress;
    data['model'] = this.model;
    data['employeeId'] = this.employeeId;
    data['orderDate'] = this.orderDate;
    return data;
  }
}
