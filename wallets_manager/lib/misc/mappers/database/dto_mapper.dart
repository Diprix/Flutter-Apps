import 'package:wallets_manager/dto/dto.dart';

abstract class DTOMapper<M> {
  M toModel(Map<String, dynamic> object); //Conterte DTO in model

  Map<String, dynamic> toDTO(M object);
}