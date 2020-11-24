import 'category.dart';
import 'magasin.dart';
class Product {
  String createdAt;
  List<Magasin> magasin;
  String sId;
  String title;
  String category;
  String photo;
  String quantity;
  String delai;
  int prixBase;
  int prixPromo;
  String promotion;
  int iV;
  Magasin nearByMagasin;

  Product(
      {this.createdAt,
        this.magasin,
        this.sId,
        this.title,
        this.category,
        this.photo,
        this.quantity,
        this.delai,
        this.prixBase,
        this.prixPromo,
        this.promotion,
        this.iV,
        this.nearByMagasin});

  Product.fromJson(Map<String, dynamic> json) {
    createdAt = json['createdAt'];
    if (json['magasin'] != null) {
      magasin = new List<Magasin>();
      json['magasin'].forEach((v) {
        magasin.add(new Magasin.fromJson(v));
      });
    }
    sId = json['_id'];
    title = json['title'];
    photo = json['photo'];
    quantity = json['quantity'];
    delai = json['delai'];
    prixBase = json['prixBase'];
    prixPromo = json['prixPromo'];
    promotion = json['promotion'];
    iV = json['__v'];
    nearByMagasin = json['near_by_magasin'] != null
        ? new Magasin.fromJson(json['near_by_magasin'])
        : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['createdAt'] = this.createdAt;
    if (this.magasin != null) {
      data['magasin'] = this.magasin.map((v) => v.toJson()).toList();
    }
    data['_id'] = this.sId;
    data['title'] = this.title;
    data['category'] = this.category;
    data['photo'] = this.photo;
    data['quantity'] = this.quantity;
    data['delai'] = this.delai;
    data['prixBase'] = this.prixBase;
    data['prixPromo'] = this.prixPromo;
    data['promotion'] = this.promotion;
    data['__v'] = this.iV;
    if (this.nearByMagasin != null) {
      data['near_by_magasin'] = this.nearByMagasin.toJson();
    }
    return data;
  }
}
