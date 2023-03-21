import 'dart:convert';
import 'package:flutter/widgets.dart';

class Cases {
  final int? id;
  final String caseStatus;
  final int clientId;
  final String caseName;
  final String caseNumber;
  final String caseDate;
  final String caseRemarks;
  final String caseType;
  final String caseFee;
  final String caseCharges;
  final String casePetitioner;
  final String caseResponder;
  final String caseDescription;
  final String opponentName;
  final String opponentLawyer;
  final String opponentContact;
  final String courtName;
  final String lawyer;
  final String courtCity;
  final String lawFirm;
  final String judgeName;


  Cases({
    this.id,
   required this.caseStatus,
    required this.clientId,
    required this.caseName,
    required this.caseNumber,
    required this.caseDate,
    required this.caseRemarks,
    required this.caseType,
    required this.caseFee,
    required this.caseCharges,
    required this.casePetitioner,
    required this.caseResponder,
    required this.caseDescription,
    required this.opponentName,
    required this.opponentLawyer,
    required this.opponentContact,
    required this.courtName,
    required this.lawyer,
    required this.lawFirm,
    required this.courtCity,
    required this.judgeName,
  });

  // Convert a Dog into a Map. The keys must correspond to the names of the
  // columns in the database.
  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'status':caseStatus,
      'clientId': clientId,
      'caseName':caseName,
      'caseNumber': caseNumber,
      'caseDate':caseDate,
      'caseRemarks': caseRemarks,
      'caseType':caseType,
      'caseFee': caseFee,
      'caseCharges':caseCharges,
      'casePetitioner': casePetitioner,
      'caseResponder':caseResponder,
      'caseDescription': caseDescription,
      'opponentName':opponentName,
      'opponentLawyer': opponentLawyer,
      'opponentContact':opponentContact,
      'courtName': courtName,
      'clientLawyer': lawyer,
      'lawFirm': lawFirm,
      'courtCity':courtCity,
      'judgeName': judgeName,
    };
  }

  factory Cases.fromMap(Map<String, dynamic> map) {
    return Cases(
      id: map['id']?.toInt() ?? 0,
      caseStatus: map['status'] ?? '',
      clientId: map['clientId']?.toInt() ?? 0,
      caseName: map['caseName'] ?? '',
      caseNumber: map['caseNumber'] ?? '',
      caseDate: map['caseDate'] ?? '',
      caseRemarks: map['caseRemarks'] ?? '',
      caseType: map['caseType'] ?? '',
      caseFee: map['caseFee'] ?? '',
      caseCharges: map['caseCharges'] ?? '',
      casePetitioner: map['casePetitioner'] ?? '',
      caseResponder: map['caseResponder'] ?? '',
      caseDescription: map['caseDescription'] ?? '',
      opponentName: map['opponentName'] ?? '',
      opponentLawyer: map['opponentLawyer'] ?? '',
      opponentContact: map['opponentContact'] ?? '',
      courtName: map['courtName'] ?? '',
      lawyer: map['courtName'] ?? '',
      lawFirm: map['lawFirm'] ?? '',
      courtCity: map['courtCity'] ?? '',
      judgeName: map['judgeName'] ?? '',
    );
  }

  String toJson() => json.encode(toMap());

  factory Cases.fromJson(String source) => Cases.fromMap(json.decode(source));

  // Implement toString to make it easier to see information about
  // each dog when using the print statement.
  @override
  String toString() {
    return 'Case(id: $id, caseStatus: $caseStatus, clientId: $clientId, caseName: $caseName, caseNumber: $caseNumber,'
        'caseDate:$caseDate, caseRemarks:$caseRemarks,caseType:$caseType,caseFee:$caseFee,caseCharges:$caseCharges, '
        'casePetitioner:$casePetitioner, caseResponder:$caseResponder,caseDescription:$caseDescription,opponentName:$opponentName,'
        'opponentLawyer:$opponentLawyer,opponentContact:$opponentContact,courtName:$courtName,lawyer:$lawyer, lawFirm:$lawFirm,courtCity:$courtCity,judgeName:$judgeName)';
  }
}
