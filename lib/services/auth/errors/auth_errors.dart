
String getCustomErrorMsgFromCode(String code){
  switch (code) {
    case "user-not-found":
      return "Cet utilisateur n'existe pas";
    case "wrong-password":
      return "Mot de passe incorrect";
    case "too-many-requests":
      return "IP bloqué (votre activité est suspecte)";
      
    default:
    return "Une erreur inattendue est survenue";
  }
}