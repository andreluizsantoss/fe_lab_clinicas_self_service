import 'dart:developer';

import 'package:dio/dio.dart';
import 'package:fe_lab_clinicas_core/fe_lab_clinicas_core.dart';
import 'package:fe_lab_clinicas_self_service/src/model/patient_model.dart';
import 'package:fe_lab_clinicas_self_service/src/model/self_service_model.dart';

import './information_form_repository.dart';

class InformationFormRepositoryImpl implements InformationFormRepository {
  final RestClient restClient;

  InformationFormRepositoryImpl({required this.restClient});

  @override
  Future<Either<RepositoryException, Unit>> register(
      SelfServiceModel model) async {
    try {
      final SelfServiceModel(
        :firstName!,
        :lastName!,
        patient: PatientModel(id: patientId)!,
        documents: {
          DocumentType.healthInsuranceCard: List(first: healthInsuranceCardDoc),
          DocumentType.medicalOrder: medicalOrdersDocs,
        }!
      ) = model;

      await restClient.auth.post(
        '/patientInformationForm',
        data: {
          'patient': patientId,
          'health_insurance_card': healthInsuranceCardDoc,
          'medical_order': medicalOrdersDocs,
          'password': '$firstName $lastName',
          'date_created': DateTime.now().toIso8601String(),
          'status': 'Waiting',
          'test': []
        },
      );

      return Right(unit);
    } on DioException catch (e, s) {
      log('Erro ao finalizar formulário de auto atendimento',
          error: e, stackTrace: s);
      return Left(RepositoryException());
    }
  }
}