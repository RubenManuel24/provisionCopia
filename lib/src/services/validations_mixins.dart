mixin ValidationsMixin{
    String? isNotEmpty(String? value, [String? message])
    {
      if (value!.isEmpty) return message ?? "Esse campo é obrigatírio";

      return null;
    }

    String? hasFiveChars(String? value, [String? message])
    {
      if (value!.length<=9) return message ?? "Você tem que usar pelo menos 9 caracteres!";

      return null;
    }

}