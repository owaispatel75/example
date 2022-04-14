

import 'profile.dart';

import 'Oshipment.dart';
import 'adderess.dart';
import 'contact.dart';
import 'invoices.dart';
import 'orders.dart';

class User {
  profile userProfile;
  Contactapi? userContact;
  address? userAddresses;
  orderapi? userOrder;
  Userinvoices? userinvoices;
  Shipment? userShipment;

  User(
      {required this.userProfile,
      this.userContact,
      this.userAddresses,
      this.userOrder,
      this.userinvoices,
      this.userShipment,
      });

  factory User.fromJson(dynamic json) {
    return User(
        userProfile: profile.fromJson(json["profile"]),
        userContact: Contactapi.fromJson(json["contacts"]),
        userAddresses: address.fromJson(json["addresses"]),
        userOrder: orderapi.fromJson(json["orders"]),
        userinvoices: Userinvoices.fromJson(json["invoices"]),
        userShipment: Shipment.fromJson(json["O_Shipment"])
        );
  }
}
