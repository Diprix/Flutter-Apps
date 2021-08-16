import 'package:wallets_manager/dto/dto.dart';

abstract class DTOMapper<D extends DTO, M> {
  M toModel(D object); //Conterte DTO in model

  D toDTO(M object);
}