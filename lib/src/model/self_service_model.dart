import 'package:flutter/widgets.dart';
import 'package:fe_lab_clinicas_self_service/src/model/patient_model.dart';

enum DocumentType {
  healthInsuranceCard,
  medicalOrder,
}

class SelfServiceModel {
  final String? firstName;
  final String? lastName;
  final PatientModel? patient;
  final Map<DocumentType, List<String>>? documents;

  const SelfServiceModel({
    this.firstName,
    this.lastName,
    this.patient,
    this.documents,
  });

  SelfServiceModel clear() {
    return copyWith(
      firstName: () => null,
      lastName: () => null,
      patient: () => null,
      documents: () => null,
    );
  }

  SelfServiceModel copyWith({
    ValueGetter<String?>? firstName,
    ValueGetter<String?>? lastName,
    ValueGetter<PatientModel?>? patient,
    ValueGetter<Map<DocumentType, List<String>>?>? documents,
  }) {
    return SelfServiceModel(
      firstName: firstName != null ? firstName() : this.firstName,
      lastName: lastName != null ? lastName() : this.lastName,
      patient: patient != null ? patient() : this.patient,
      documents: documents != null ? documents() : this.documents,
    );
  }
}
