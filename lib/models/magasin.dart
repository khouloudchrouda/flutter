class Magasin {
  Location location;
  String statut;
  String createdAt;
  String sId;
  String nameMagasin;
  String nameResponsable;
  String email;
  String phone;
  String password;
  int counter;
  String username;
  String category;
  int codeTVA;
  int numeroSeriet;
  String abonnement;
  String partenaire;
  int iV;
  num distance;

  Magasin(
      {this.location,
        this.statut,
        this.createdAt,
        this.sId,
        this.nameMagasin,
        this.nameResponsable,
        this.email,
        this.phone,
        this.password,
        this.counter,
        this.username,
        this.category,
        this.codeTVA,
        this.numeroSeriet,
        this.abonnement,
        this.partenaire,
        this.iV,
        this.distance});

  Magasin.fromJson(Map<String, dynamic> json) {
    location = json['location'] != null
        ? new Location.fromJson(json['location'])
        : null;
    statut = json['statut'];
    createdAt = json['createdAt'];
    sId = json['_id'];
    nameMagasin = json['nameMagasin'];
    nameResponsable = json['nameResponsable'];
    email = json['email'];
    phone = json['phone'];
    password = json['password'];
    counter = json['counter'];
    username = json['username'];
    category = json['category'];
    codeTVA = json['codeTVA'];
    numeroSeriet = json['numeroSeriet'];
    abonnement = json['abonnement'];
    partenaire = json['Partenaire'];
    iV = json['__v'];
    distance = json['distance'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.location != null) {
      data['location'] = this.location.toJson();
    }
    data['statut'] = this.statut;
    data['createdAt'] = this.createdAt;
    data['_id'] = this.sId;
    data['nameMagasin'] = this.nameMagasin;
    data['nameResponsable'] = this.nameResponsable;
    data['email'] = this.email;
    data['phone'] = this.phone;
    data['password'] = this.password;
    data['counter'] = this.counter;
    data['username'] = this.username;
    data['category'] = this.category;
    data['codeTVA'] = this.codeTVA;
    data['numeroSeriet'] = this.numeroSeriet;
    data['abonnement'] = this.abonnement;
    data['Partenaire'] = this.partenaire;
    data['__v'] = this.iV;
    data['distance'] = this.distance;
    return data;
  }
}

class Location {
  String address;
  double longitude;
  double latitude;
  String city;
  String governorate;

  Location(
      {this.address,
        this.longitude,
        this.latitude,
        this.city,
        this.governorate});

  Location.fromJson(Map<String, dynamic> json) {
    address = json['address'];
    longitude = json['longitude'];
    latitude = json['latitude'];
    city = json['city'];
    governorate = json['governorate'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['address'] = this.address;
    data['longitude'] = this.longitude;
    data['latitude'] = this.latitude;
    data['city'] = this.city;
    data['governorate'] = this.governorate;
    return data;
  }
}