const String baseUrl = "https://provision-07c1.onrender.com/api/v1";
abstract class Endpoints {
  
  static const String signin = "$baseUrl/userAuth/signIn";
  static const String companuSite = "$baseUrl/companySite/?size=500";
  static const String company = "$baseUrl/company/?size=500";
  static const String sendMessage = "https://provision-07c1.onrender.com/api/v1/chat/send/";
  static const String getAllMessage = "https://provision-07c1.onrender.com/api/v1/chat/";
  static const String task = "$baseUrl/task";
  static const String companySiteId = "$baseUrl/companySite/";
  static const String sendData = "$baseUrl/supervision/create/";
  static const String equipment = "$baseUrl/equipment/?size=500";
  static const String history = "$baseUrl/historic/?size=500";
  static const String supervision = "$baseUrl/supervision/";
  static const String occurence = "$baseUrl/occurrence/create/";
  static const String geoLocation = "$baseUrl/geoLocation/create/";
  static const String updateLocatiom = "$baseUrl/companySite/addLocation/";
}
/*
  rota dos sites
    retorno lista de sites
      lista de sites filtra pelo id do user logado
        lista filtrada vais chamar a rota das empresas\
          filtrar pelo idDas empresas que se enconrtra na lista anterior e assim vai gerar uma nova lista 

*/