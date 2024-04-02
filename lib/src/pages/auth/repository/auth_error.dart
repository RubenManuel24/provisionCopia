String authErrosString(int? code) {
  switch (code) {
    case 401:
      return "número e/ou senha invalidos";
    default:
      return "Internet desconectada";  }
}
