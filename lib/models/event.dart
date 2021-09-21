// To parse this JSON data, do
//
//     final event = eventFromJson(jsonString);

import 'dart:convert';

List<Event> eventsFromJson(String str) =>
    List<Event>.from(json.decode(str).map((x) => Event.fromJson(x)));

String eventsToJson(List<Event> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class Event {
  Event({
    this.id,
    this.eventId,
    this.eventName,
    this.eventCategory,
    this.eventDesc,
    this.eventStart,
    this.eventEnd,
    this.location,
    this.eventStatus,
    this.ticketing,
    this.v,
    this.eventImage,
  });

  String? id;
  String? eventId;
  String? eventName;
  String? eventCategory;
  String? eventDesc;
  DateTime? eventStart;
  DateTime? eventEnd;
  String? location;
  String? eventStatus;
  List<Ticketing?>? ticketing;
  int? v;
  String? eventImage;

  factory Event.fromJson(Map<String, dynamic> json) => Event(
        id: json["_id"],
        eventId: json["event_id"],
        eventName: json["event_name"],
        eventCategory: json["event_category"],
        eventDesc: json["event_desc"],
        eventStart: DateTime.parse(json["event_start"]),
        eventEnd: DateTime.parse(json["event_end"]),
        location: json["location"],
        eventStatus: json["event_status"],
        ticketing: List<Ticketing>.from(
            json["ticketing"].map((x) => Ticketing.fromJson(x))),
        v: json["__v"],
        eventImage: json["event_image"] == null ? null : json["event_image"],
      );

  Map<String, dynamic> toJson() => {
        "_id": id,
        "event_id": eventId,
        "event_name": eventName,
        "event_category": eventCategory,
        "event_desc": eventDesc,
        "event_start": eventStart!.toIso8601String(),
        "event_end": eventEnd!.toIso8601String(),
        "location": location,
        "event_status": eventStatus,
        "ticketing": List<dynamic>.from(ticketing!.map((x) => x!.toJson())),
        "__v": v,
        "event_image": eventImage == null ? null : eventImage,
      };
}

class Ticketing {
  Ticketing({
    this.ticketName,
    this.ticketDesc,
    this.price,
    this.quantity,
    this.salesStart,
    this.salesEnd,
    this.id,
    this.ticketStatus,
  });

  String? ticketName;
  String? ticketDesc;
  int? price;
  int? quantity;
  DateTime? salesStart;
  DateTime? salesEnd;
  String? id;
  String? ticketStatus;

  factory Ticketing.fromJson(Map<String, dynamic> json) => Ticketing(
        ticketName: json["ticket_name"],
        ticketDesc: json["ticket_desc"],
        price: json["price"],
        quantity: json["quantity"],
        salesStart: DateTime.parse(json["sales_start"]),
        salesEnd: DateTime.parse(json["sales_end"]),
        id: json["_id"],
        ticketStatus:
            json["ticket_status"] == null ? null : json["ticket_status"],
      );

  Map<String, dynamic> toJson() => {
        "ticket_name": ticketName,
        "ticket_desc": ticketDesc,
        "price": price,
        "quantity": quantity,
        "sales_start": salesStart!.toIso8601String(),
        "sales_end": salesEnd!.toIso8601String(),
        "_id": id,
        "ticket_status": ticketStatus == null ? null : ticketStatus,
      };
}
