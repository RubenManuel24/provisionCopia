import 'package:get/get.dart';

String? emailValidator(String? email) {
  if (email == null || email.isEmpty) {
    return "Digite o seu email";
  }

  if (!email.isEmail) {
    return "Digite um email válido";
  }

  return null;
}

String? passWordValidator(String? passWord) {
  if (passWord == null || passWord.isEmpty) {
    return "Digite um password";
  }

  if (passWord.length <= 7) {
    return "Digite um password com mais de 7 caracteres!";
  }

  return null;
}

 
 String? nameValidator(String? name){

  if (name == null || name.isEmpty) {
    return "Digite um nome";
  }
  
  final listName = name.split(' ');

  if(listName.length == 1){

    return "Digite o nome e sobre-nome";

  }

  return null;

 }


 String? numberEmployeeValidator(String? number){

  if (number == null || number.isEmpty) {
    return "Digite o número do trabalhador";
  }

  return null;

 }


 String? numberSerieValidator(String? number){

  if (number == null || number.isEmpty) {
    return "Digite o número de série do equipamento";
  }

  return null;

 }


 String? numberCenterValidator(String? number){

  if (number == null || number.isEmpty) {
    return "Digite o centro de custo do equipamento";
  }

  return null;

 }


 String? nameEquipmentValidator(String? name){

  if (name == null || name.isEmpty) {
    return "Digite o nome do equipamento";
  }

  return null;

 }


String? phoneValidator(String? phone){
  if ( phone == null ||  phone.isEmpty) {
    return "Digite um número de telefone";
  }

  if(phone.length < 7 || !phone.isPhoneNumber){
     
     return "Dgite um número de telefone válido";
  }

  return null;

}


 String? cpfValidator(String? cpf){

    if(cpf == null || cpf.isEmpty){
       return "Digite um CPF";
    }

    if(!cpf.isCpf){
      return "Dgite um CPF válido";
    }

    return null;
    
  }
