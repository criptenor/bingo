import 'dart:convert';
import 'dart:math' as math;

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';
import 'package:timeago/timeago.dart' as timeago;
import 'lat_lng.dart';
import 'place.dart';
import 'uploaded_file.dart';
import '/backend/schema/structs/index.dart';
import '/backend/supabase/supabase.dart';
import '/auth/supabase_auth/auth_util.dart';

bool? newCustomFunction2(List<int>? modalidades) {
  // se tiver 4 itens ou mais na lista return true se não false
  if (modalidades != null && modalidades.length >= 4) {
    return true;
  } else {
    return false;
  }
}

bool? terceiroItem(List<int>? modalidades) {
  // se tiver na lista 3 itens ou mais return true se não return false
// se tiver 3 itens ou mais na lista return true se não false
  if (modalidades != null && modalidades.length >= 3) {
    return true;
  } else {
    return false;
  }
}

bool? segundoItem(List<int>? modalidades) {
  // se tiver dois itens ou mais return true caso contrario return false
// se tiver na lista 2 itens ou mais return true se não return false
  if (modalidades != null && modalidades.length >= 2) {
    return true;
  } else {
    return false;
  }
}

double? returnNegativo(double? positivo) {
  // recebera um numero positivo e transformara em negativo na mesma hora
  if (positivo != null && positivo > 0) {
    return -positivo;
  } else {
    return null;
  }
}

bool? iguala0(double? numero) {
  // inverte se for igual a 0 true caso contrario False
// se o número de entrada for igual a 0, retorne true, caso contrário, retorne false
  if (numero == 0) {
    return true;
  } else {
    return false;
  }
}

bool auxiliar(
  int? auxliar,
  List<int>? listTotal,
) {
  // se quantidade que tem na lista for o mesmo valor de auxiliar return True caso contrario return false
  if (listTotal != null && auxliar != null && listTotal.length == auxliar) {
    return true;
  } else {
    return false;
  }
}

bool? numeroDeItensMenorEQueContador(
  List<int>? numerodeIds,
  int? contador,
) {
  // numero de ids é menor que contador true ou false
// se o número de ids for menor que o contador, retorne true, caso contrário, retorne false
  if (numerodeIds != null &&
      contador != null &&
      numerodeIds.length > contador) {
    return true;
  } else {
    return false;
  }
}

double? newCustomFunction(int? quantidade) {
  // compre um ganhe 2 ou seja a cada 2 retorne 1, se for impar arredondar para o par posterior
  if (quantidade == null) {
    return 1;
  }
  int ganhos = quantidade ~/ 2;
  if (quantidade % 2 == 1) {
    ganhos++;
  }
  return ganhos.toDouble();
}

String? selectFotoCartela(String? dorpdownCartela) {
  //  entrada  "Cartela Snap Bingo" , "Cartela do Bingo Oficial da Rô" ,"Cartela Glorioso" url diferente
  switch (dorpdownCartela) {
    case 'Cartela Snap Bingo':
      return 'https://ausehpwspqkmkvvksvpr.supabase.co/storage/v1/object/sign/img/Dupla%20Quina%20Vertical%20(2).png?token=eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ1cmwiOiJpbWcvRHVwbGEgUXVpbmEgVmVydGljYWwgKDIpLnBuZyIsImlhdCI6MTY5MDkzMTM1NSwiZXhwIjoxNzIyNDY3MzU1fQ.X9SFO477UCwUrhDtH7pX_8pbqsyHQrJwfVtCVODO8JE&t=2023-08-01T23%3A09%3A17.639Z';
    case 'Cartela do Bingo Oficial da Rô':
      return 'https://ausehpwspqkmkvvksvpr.supabase.co/storage/v1/object/sign/img/BINGO.png?token=eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ1cmwiOiJpbWcvQklOR08ucG5nIiwiaWF0IjoxNjkwOTMxMzkyLCJleHAiOjE3MjI0NjczOTJ9.8x35w-GM6PUpt6qLv0G0VSeplXzoxRWNKzeMhajMX9k&t=2023-08-01T23%3A09%3A54.527Z';
    case 'Cartela Glorioso':
      return 'https://ausehpwspqkmkvvksvpr.supabase.co/storage/v1/object/sign/img/snapbingo.png?token=eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ1cmwiOiJpbWcvc25hcGJpbmdvLnBuZyIsImlhdCI6MTY5MDkzMTM3MCwiZXhwIjoxNzIyNDY3MzcwfQ.7eCzaZ0jJDVf7KPk0yfbATwrKIAi3s5pRXaxlNV5z6c&t=2023-08-01T23%3A09%3A32.447Z';
    default:
      return null;
  }
}

String? returnImagePath(String? imgpath) {
  // "Cartela bingo Oficial da Rô", "Cartela SnapBingo", "Cartela do Grandioso" retornar links diferentes
  switch (imgpath) {
    case 'Cartela bingo Oficial da Rô':
      return 'https://ausehpwspqkmkvvksvpr.supabase.co/storage/v1/object/sign/img/BINGO.png?token=eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ1cmwiOiJpbWcvQklOR08ucG5nIiwiaWF0IjoxNjkwOTMxNjQ2LCJleHAiOjE3MjI0Njc2NDZ9.a6CoRKuppnKLoomQNTKiPNkB7LJ4_TlS3AFETEMRfmE&t=2023-08-01T23%3A14%3A07.967Z';
    case 'Cartela SnapBingo':
      return 'https://ausehpwspqkmkvvksvpr.supabase.co/storage/v1/object/sign/img/snapbingo.png?token=eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ1cmwiOiJpbWcvc25hcGJpbmdvLnBuZyIsImlhdCI6MTY5MDkzMTYxNCwiZXhwIjoxNzIyNDY3NjE0fQ.GQPdQGYwk6ll3HOMb0wUwsKSKZ27ElfqcrVcZC9t_FA&t=2023-08-01T23%3A13%3A35.921Z';
    case 'Cartela do Grandioso':
      return 'https://ausehpwspqkmkvvksvpr.supabase.co/storage/v1/object/sign/img/Dupla%20Quina%20Vertical%20(2).png?token=eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ1cmwiOiJpbWcvRHVwbGEgUXVpbmEgVmVydGljYWwgKDIpLnBuZyIsImlhdCI6MTY5MDkzMTY2MywiZXhwIjoxNzIyNDY3NjYzfQ.cnrZeoI8alKykQMQiOTX9N5qs4LeXX8cxPIdq23Ig1A&t=2023-08-01T23%3A14%3A25.006Z';
    default:
      return null;
  }
}

bool? eGrandioso(String? nomeCartela) {
  // se na string tiver "Grandioso" return true else return false
  if (nomeCartela != null && nomeCartela.contains('Grandioso')) {
    return true;
  } else {
    return false;
  }
}

bool? snapbingo(String inputDrop) {
  // se tiver "snap" em qualquer lugar da str return true
  if (inputDrop.toLowerCase().contains('snap')) {
    return true;
  } else {
    return false;
  }
}

bool? eSnapBingo(String? dropdown) {
  // if "snap" in string return true else return false
  if (dropdown != null && dropdown.contains('Snap')) {
    return true;
  } else {
    return false;
  }
}

List<int> gerarB() {
  // faça um código que retorne 5 numeros aleatorios de 1 a 15
  List<int> numeros = [];
  for (int i = 0; i < 5; i++) {
    int num = math.Random().nextInt(15) + 1;
    numeros.add(num);
  }
  return numeros;
}

List<int> gerarI() {
  // gerar uma lista com 5 numeros aleatorioa de 16a 30
  List<int> numeros = [];
  for (int i = 0; i < 5; i++) {
    int num = math.Random().nextInt(15) + 16;
    numeros.add(num);
  }
  return numeros;
}

List<String> gerarN() {
  // 5 numeros aleatorios entre 31 a 45  sendo a posição central um " " substituindo o numero na lista
  List<int> numeros =
      List.generate(5, (index) => math.Random().nextInt(15) + 31);
  numeros.insert(2, 0);
  return numeros
      .map((numero) => numero == 0 ? " " : numero.toString())
      .toList();
}

List<String> gerarG() {
  // gerar 5 numeros aleatorios de 46 a 60
  List<String> numeros = [];
  for (int i = 0; i < 5; i++) {
    int num = math.Random().nextInt(15) + 46;
    numeros.add(num.toString());
  }
  return numeros;
}

List<String> gerarO() {
  // gerar 5 numeros aleatorios entre 61 e 75
  List<String> numeros = [];
  for (int i = 0; i < 5; i++) {
    int num = math.Random().nextInt(15) + 61;
    numeros.add(num.toString());
  }
  return numeros;
}

List<int> newCustomFunction3(int? qtdCartela) {
  // return uma lista com o tamanho igual ao parametro
  return List.generate(qtdCartela ?? 0, (index) => index + 1);
}

bool? maiorQCinco(List<int> listModalidades) {
  // if len(list)<=5 return true else return false
  if (listModalidades != null && listModalidades.length < 5) {
    return true;
  } else {
    return false;
  }
}

bool? podeInserir(List<int> listmodalidade) {
  // if len(listmodalidade) >=6 return true else return false
  if (listmodalidade.length < 5) {
    return true;
  } else {
    return false;
  }
}

bool diferenteDeFalse(int? idSorteio) {
  // if false return false else return true
  if (idSorteio == null || idSorteio == 0) {
    return false;
  } else {
    return true;
  }
}

int usuariosNaListaTratada(int? numer) {
  // return entrada -3, se resultado menor que 0 então é igual a 0
  int entrada = numer ?? 0;
  int resultado = entrada - 3;
  if (resultado < 0) {
    resultado = 0;
  }
  return resultado;
}

bool variavelENulo(int? intId) {
  // if null return true else return false
  if (intId == null) {
    return true;
  } else {
    return false;
  }
}

List<int> umanoventa() {
  // retorne os números de 1 a 90 em ordem crescente
  List<int> numbers = [];
  for (int i = 1; i <= 90; i++) {
    numbers.add(i);
  }
  return numbers;
}

String? countdown(DateTime? datahora) {
  // entrada uma data e hora retorno contagem regressiva em hora:minuto:segundo
  if (datahora == null) {
    return null;
  }

  final now = DateTime.now();
  final difference = datahora.difference(now);

  if (difference.isNegative) {
    return '00:00:00';
  }

  final hours = difference.inHours.remainder(24);
  final minutes = difference.inMinutes % 60;
  final seconds = difference.inSeconds % 60;

  return '${hours.toString().padLeft(2, '0')}:${minutes.toString().padLeft(2, '0')}:${seconds.toString().padLeft(2, '0')}';
}

List<String>? list1a15() {
  // lista de numeros inteiros de 1 a 15
  List<String> numbers = [];
  for (int i = 1; i <= 15; i++) {
    numbers.add(i.toString());
  }
  return numbers;
}

int? entradamais16(int index) {
  // entrada mais 15
  int? entrada;
  try {
    entrada = index + 16;
  } catch (e) {
    print('Invalid input');
  }
  return entrada;
}

String? list16a30() {
  // faça uma lista com os numeros 16 até 30
  List<int> numbers = [
    16,
    17,
    18,
    19,
    20,
    21,
    22,
    23,
    24,
    25,
    26,
    27,
    28,
    29,
    30
  ];
  return numbers.toString();
}

String? lista16a30() {
  // return list range 16 á 30
  List<int> range = List.generate(15, (index) => index + 16);
  return range.join(', ');
}

int? entrada(int? numero) {
  // return entrada +31
  if (numero == null) {
    return null;
  } else {
    return numero + 31;
  }
}

int? entradamais31(int? entradaInt) {
  // entrada int + 31
  return entradaInt != null ? entradaInt + 31 : null;
}

int? entradamais46(int? entrada) {
  // return entrada +46
  if (entrada == null) {
    return null;
  } else {
    return entrada + 46;
  }
}

int? entradamais61(int? entrada) {
  // return entrada + 61
  return entrada != null ? entrada + 61 : null;
}

bool eCartelaPapel(String nomeDaCartela) {
  // if "Cartela de Papel" in NomeCartela return True
  return nomeDaCartela.contains('Cartela de Papel');
}

int encotrarNumeroExatoNaCartelaJson(
  int linha,
  int coluna,
  String json,
) {
  // Convert the string to a JSON object.
  var jsonObject = jsonDecode(json);

  // Get the card values array.
  var cardValues = jsonObject['card_values'];

  // Check if the value at the specified row and column exists.
  if (cardValues[linha][coluna] != null) {
    // Return the value.
    return cardValues[linha][coluna];
  } else {
    // Return -1.
    return -1;
  }
}

int entradaMaisUm(int? entrada) {
  // return etrada + 1
  if (entrada == null) {
    return 1;
  } else {
    return entrada + 1;
  }
}

bool? dormir(int? timeSleep) {
  // espere os segundos passados no time sleep return true
  if (timeSleep != null) {
    Future.delayed(Duration(seconds: timeSleep)).then((value) => true);
    return null;
  } else {
    return null;
  }
}

int numeroMenosUm(int entradaInteiro) {
  // entrada - 1
  return entradaInteiro - 1;
}

List<double> valoresNaLista(
  String? textfild1,
  String? textfild2,
  String? textfild3,
  String? textfild4,
  String? textfild5,
) {
  // converter de string para para duble se tiver "," replace para "." retone lista com todos
  List<String?> lista = [textfild1, textfild2, textfild3, textfild4, textfild5];
  List<double> valores = [];

  for (String? item in lista) {
    if (item != null && item != '0') {
      item = item.replaceAll(',', '.');
      valores.add(double.parse(item));
    }
  }

  return valores;
}

double somarValoresDaLista(List<double> listPercent) {
  // some valores da lista
  double sum = 0.0;
  for (double value in listPercent) {
    sum += value;
  }
  return sum;
}

bool isNumeric(int? number) {
  // se for numero return true else false
  if (number == null) {
    return false;
  } else {
    return true;
  }
}

String encontrarPosicaoJsonPelonumero(
  int inteiro,
  dynamic json,
) {
  // Verifica se 'card-values' existe e não é nulo no JSON
  if (json.containsKey('card_values') && json['card_values'] != null) {
    for (int i = 0; i < json['card_values'].length; i++) {
      if (json['card_values'][i] != null) {
        for (int j = 0; j < json['card_values'][i].length; j++) {
          if (inteiro == json['card_values'][i][j]) {
            return [i, j]
                .toString(); // Retorna a posição no formato "[linha, coluna]"
          }
        }
      }
    }
  }

  // Se o número não for encontrado ou 'card-values' for nulo, retorne um espaço vazio
  return "  ";
}

String funcaoJsonPath(dynamic json) {
  List<int?> bingoNumbers = [];

  if (json.containsKey("card_values")) {
    List<List<int?>> cardValues = List<List<int?>>.from(json["card_values"]);

    for (var sublist in cardValues) {
      for (var value in sublist) {
        bingoNumbers.add(value);
      }
    }
  } else {
    print("Warning: 'card_values' key not found in JSON.");
  }

  String result = bingoNumbers
      .map((value) => value == null ? " " : value.toString())
      .join(",");
  return result;
}

List<String> entradaEmLista(String texto) {
  // entrada string saida lista, separando cada item pelas ", "
  List<String> lista = texto.split(", ");
  return lista;
}

String encontrarNumeroNojson(
  dynamic json,
  int inteiro,
) {
  List<List<int?>> cardValues = List<List<int?>>.from(json['card_values']);

  if (inteiro < 0 || inteiro >= cardValues.length * cardValues[0].length) {
    return "Índice fora dos limites!";
  }

  int rowIndex = inteiro ~/ cardValues[0].length;
  int colIndex = inteiro % cardValues[0].length;

  int? value = cardValues[rowIndex][colIndex]; // Nullable int value

  return value != null ? value.toString() : " ";
}

String jsonDinamic(dynamic json) {
  List<List<int?>> cardValues = List<List<int?>>.from(json['card_values']);

  String result = "";

  for (var row in cardValues) {
    for (var value in row) {
      result += value != null ? value.toString() + "," : " ,";
    }
  }

  return result.substring(0, result.length - 1);
}

double somaList(List<double> listFloat) {
  // somar listFloat return DUble
  double sum = 0.0;
  for (double num in listFloat) {
    sum += num;
  }
  return sum;
}

String? textoEmpe(int? numero) {
  // coloque cada caracter do numero em uma linha devolva a sting letras uma em baixo da outra
  if (numero == null) {
    return null;
  }
  final digits = numero.toString().split('');
  return digits.join('\n');
}

int formasDeGanhar(
  dynamic cartela,
  List<bool> markCartela,
) {
  int verificarMarcados(List<int?> numeros) {
    for (int? numero in numeros) {
      if (numero == null || (numero != -1 && !markCartela[numero - 1])) {
        return 0;
      }
    }
    return 1;
  }

  if (cartela != null && cartela['card_values'] != null) {
    List<List<int?>> cardValues = (cartela['card_values'] as List)
        .map((item) => (item as List).cast<int?>())
        .toList();

    for (var numeros in cardValues) {
      if (verificarMarcados(numeros) == 0) {
        return 0;
      }
    }

    return 1;
  }

  return 0;
}

List<bool> retunList25Bool() {
  // return list 25 false
  return List.generate(25, (index) => false);
}

List<dynamic> acusarGanhador(
  List<dynamic> json,
  List<int> modalidades,
  List<bool> markCartela,
) {
  bool modalidadeCheiaDisponivel = modalidades.contains(1);

  List<dynamic> cartelas = List<dynamic>.from(json);
  List<dynamic> cartelasVencedoras = [];

  for (var cartela in cartelas) {
    List<List<int?>> cardValues = List<List<int?>>.from(cartela['card_values'])
        .map((row) => row.toList())
        .toList();
    bool ganhouCheia = true;

    for (var row in cardValues) {
      for (var num in row) {
        if ((num == null || num == 0) && !markCartela[num ?? 0]) {
          ganhouCheia = false;
          break;
        }
      }
      if (!ganhouCheia) {
        break;
      }
    }

    if (ganhouCheia && modalidadeCheiaDisponivel) {
      cartela['ganhou'] = true;
      cartelasVencedoras.add(cartela);
    }
  }

  return cartelasVencedoras;
}

int encontrarJsoniList(
  List<dynamic> listJson,
  dynamic json,
) {
  // encontrar index de json em listjson +1
  for (int i = 0; i < listJson.length; i++) {
    if (jsonEncode(listJson[i]) == jsonEncode(json)) {
      return i + 1;
    }
  }
  return -1;
}

String? dinheiro(int? entradaPar) {
  // entrada / 2 com= X saida em reais: R$X,00
  if (entradaPar == null) {
    return null;
  }

  return 'R\$$entradaPar,00';
}

String? gerarImagemPorLinkQRCode(String? link) {
  // gerar qrcode pelo link de pagamento
// Check if link is null or empty
  if (link == null || link.isEmpty) {
    return null;
  }

  // Generate QR code image using the link
  String qrCodeUrl =
      'https://api.qrserver.com/v1/create-qr-code/?size=150x150&data=$link';
  return qrCodeUrl;
}

double? dinheiroquesobrou(
  String? total,
  String? percentComVirgula,
  List<double> listaDeValores,
) {
  // str to double, if  ',' replace for '.'  (total/100)*percentComVirgula-soma listValores
  double? totalDouble = double.tryParse(total?.replaceAll(',', '.') ?? '');
  double? percentDouble =
      double.tryParse(percentComVirgula?.replaceAll(',', '.') ?? '');

  if (totalDouble == null || percentDouble == null) {
    return null;
  }

  double somaValores = listaDeValores.fold(0, (a, b) => a + b);
  double valorDesconto = (totalDouble / 100) * percentDouble;

  return valorDesconto - somaValores;
}

double valorPorModalidaNosorteio(
  double total,
  double comissao,
  double caixinha,
  double porcentagemAcumulado,
  double porcentagemDinheiro,
) {
  double valor = total - (total * (comissao / 100));

  // Passo 2: Subtrair a porcentagem acumulada em porcentagem do valor resultante da etapa 1
  valor -= valor * (porcentagemAcumulado / 100);

  // Passo 3: Subtrair a caixinha em porcentagem do valor resultante da etapa 2
  valor -= valor * (caixinha / 100);

  // Passo 4: Subtrair a porcentagem em dinheiro do valor resultante da etapa 3
  valor = (valor / 100) * porcentagemDinheiro;

  return valor;
}

double totalTratado(
  double total,
  double comissao,
  double caixinha,
  double porcentAcmu,
) {
  double valor = total - (total * (comissao / 100));
  valor = valor - (total * (caixinha / 100));

  return valor;
}

String? saidaEmReais(double? entrada) {
  // return "R$" entrada ",XX"
  if (entrada == null) {
    return null;
  } else {
    final formatter = NumberFormat.currency(locale: 'pt_BR', symbol: 'R\$');
    return formatter.format(entrada);
  }
}

List<int> emOrdemCrescente(List<int>? listInt) {
  // return listint em ordem crescente
  List<int> sortedList = [];
  if (listInt != null) {
    sortedList = List.from(listInt)..sort();
  }
  return sortedList;
}

double? valorNoSupabaseMaisPagamento(
  double? valorPagamento,
  double? valorTotal,
) {
  // Valor Pagamento mais Valor Total
  if (valorPagamento == null || valorTotal == null) {
    return null;
  }
  return valorPagamento + valorTotal;
}

bool? inList(
  int? numero,
  List<int>? list,
) {
  // numero está na lista ? null é false
  if (numero == null || list == null) {
    return false;
  }
  return list.contains(numero);
}

List<int> listnumeros(int? inicial) {
  // contador de inicial +15 devolver list de 15 numeros ex: entrada 0 saida lista de 0 a 14
  List<int> numeros = [];
  for (int i = inicial ?? 0; i < (inicial ?? 0) + 15; i++) {
    numeros.add(i);
  }
  return numeros;
}

double somenteDuasCasas(double? float) {
  // arredondar para duas casas decimas
  if (float == null) {
    return 1;
  } else {
    return double.parse(float.toStringAsFixed(2));
  }
}

String listUserWhatss(
  List<String> usuarios,
  List<double>? valores,
) {
  // para cada usuario e valor index ,  coloque : "usuario valor [emoji coracao] valor"
  String result =
      '''\n🏆🏆🏆🏆🏆🏆🏆🏆🏆\n🍀 BINGO OFICIAL DA RÔ 🍀\n🏆🏆🏆🏆🏆🏆🏆🏆🏆\n\nLISTA DE PARTICIPANTES''';
  for (int i = 0; i < usuarios.length; i++) {
    result +=
        '\n👤${usuarios[i]} ${valores?[i] ?? 0.0} ❤️ ${valores?[i] ?? 0.0}\n';
  }
  return result +=
      '''\n🏆🏆🏆🏆🏆🏆🏆🏆🏆\nCONFERE SE SEU NOME ESTÁ NA LISTA,CASO NAO ESTEJA NÃO RECEBERÁ O PREMIO\n\n🏆🏆🏆🏆🏆🏆🏆🏆🏆''';
}

String? dataeHora(DateTime? dateTime) {
  //  faça a diferença entre agora entrada dateTime e transforme em Hora:minuto:segundo - 1 segundo
  if (dateTime == null) {
    return "A data e hora fornecidas são inválidas.";
  }

  DateTime agora = DateTime.now();
  DateTime dataAlvo = dateTime;

  if (dataAlvo.isBefore(agora)) {
    return "A data e hora fornecidas já passaram.";
  }

  Duration tempoRestante = dataAlvo.difference(agora);

  int horas = tempoRestante.inHours;
  int minutos = tempoRestante.inMinutes.remainder(60);
  int segundos = tempoRestante.inSeconds.remainder(60);

  String resultado =
      "$horas:${minutos.toString().padLeft(2, '0')}:${segundos.toString().padLeft(2, '0')}";

  return resultado;
}

String listpagWhats(
  double total,
  double comissao,
  double percentAcumulado,
  List<String> listAcumuladosNomes,
  List<double> listValoresAcumulados,
  double caixinha,
) {
// criar str e retornar total - 19%
  final double finalTotal = total;
  final double total_2 = total - ((finalTotal / 100) * comissao);
  final double caixinha_2 = ((total_2 / 100) * caixinha);
  final double total_acumulado = ((total_2 / 100) * percentAcumulado);
  String lista_wpp =
      "💰 ${finalTotal.toStringAsFixed(2)} - ${comissao.toStringAsFixed(2)}%\n💰 ${total_2.toStringAsFixed(2)}\n💰 Acumulado:${total_acumulado.toStringAsFixed(2)}\n\n";
  for (var acumulado in listAcumuladosNomes) {
    lista_wpp += "\n💰- ${acumulado}";
  }
  lista_wpp += "\n\n\n 💲 💲 💲 Valores Total Do Acumulado 💲 💲 💲";
  for (var acumulado in listAcumuladosNomes) {
    int index_ac = listAcumuladosNomes.indexOf(acumulado);
    lista_wpp += "\n💰- ${acumulado}\n ${listValoresAcumulados[index_ac]}";
  }
  lista_wpp += "\n\n💰Caixinha\n  ${caixinha_2}";
  return lista_wpp;
}

double strparadouble(String? entrada) {
  // entrada str saida double if entrada null então saida 0
  if (entrada == null) {
    return 0.0;
  } else {
    return double.parse(entrada);
  }
}

double? stringDoubleDuasCasas(String entada) {
  // entrada converte para double e retorne arrendodado duas casas decimais
  try {
    double parsed = double.parse(entada);
    return double.parse(parsed.toStringAsFixed(2));
  } catch (e) {
    return null;
  }
}

bool? inListString(
  String? str,
  List<String>? liststr,
) {
  // if str in liststr return true else return false
  if (str == null || liststr == null) {
    return null;
  }
  return liststr.contains(str);
}

double subtrair(
  double num1,
  double num2,
) {
  // return num1-num2 subtrção
  return num1 - num2;
}

List<double>? listaCom5Zeros() {
  // retornar lista com 5 valores 0
  return [0.0, 0.0, 0.0, 0.0, 0.0];
}

List<int> listComumValor(int valor) {
  // retornar lista com o valor na posição 0
  return [valor];
}

int numeroAleatorio() {
  // retorne numero aleatorio com 10 caracter
  var random = math.Random();
  var num = '';
  for (var i = 0; i < 10; i++) {
    num += random.nextInt(10).toString();
  }
  return int.parse(num);
}

List<bool> lista75False() {
  // saida uma lista cm 75 false
  return List.generate(75, (index) => false);
}

double contagemRegressivaPorcentagem(DateTime dataEhoraDoInicio) {
  DateTime agora = DateTime.now();

  // Calcula a diferença de tempo em minutos
  int diferencaEmMinutos = agora.difference(dataEhoraDoInicio).inMinutes;

  // Define o tempo máximo como 5 minutos
  int tempoMaximoEmMinutos = 5;

  // Calcula a porcentagem de tempo decorrido
  double porcentagem = (diferencaEmMinutos / tempoMaximoEmMinutos);

  // Limita a porcentagem entre 0 e 1
  porcentagem = porcentagem.clamp(0, 1);

  // Retorna a porcentagem como um valor decimal
  return porcentagem;
}

double tresCasasDecimais(double decimal) {
  return double.parse(decimal.toStringAsFixed(3));
}

String? contagemRegre(String dateTime) {
  DateTime now = DateTime.now();
  DateTime futureTime = DateTime.parse(dateTime);
  Duration difference = futureTime.toUtc().difference(now.toUtc());

  if (difference.isNegative) {
    return 'Bingo em Andamento';
  } else {
    int hours = difference.inHours;
    int minutes = (difference.inMinutes % 60);
    int seconds = (difference.inSeconds % 60);

    String hoursString = (hours % 24).toString().padLeft(2, '0');
    String minutesString = minutes.toString().padLeft(2, '0');
    String secondsString = seconds.toString().padLeft(2, '0');

    return '$hoursString:$minutesString:$secondsString';
  }
}

int diferencaNaLista(List<int> listCont) {
  if (listCont.isEmpty) {
    return 0;
  }

  // Ordenar a lista em ordem crescente
  listCont.sort();

  // Calcular a diferença entre o maior e o menor número
  int diff = listCont.last - listCont.first;

  // Se a entrada for 1, acrescentar 1 à diferença
  if (listCont.contains(1)) {
    diff += 1;
  }

  return diff;
}

int qualBingo(String bingo) {
  switch (bingo.toLowerCase()) {
    case 'bbsorte':
      return 1;
    case 'arbingo':
      return 2;
    case 'snap':
      return 3;
    case 'grandioso':
      return 4;
    case 'appq':
      return 5;
    default:
      return -1; // Valor padrão se o bingo não for reconhecido
  }
}

String nomedoBingo(int inteiroCartela) {
  final bingoMap = {
    1: 'BBSorte',
    2: 'AR Bingo',
    3: 'SNAP Bingo',
    4: 'Grandioso',
    5: 'App Qualquer',
  };

  return bingoMap[inteiroCartela] ?? 'Desconhecido';
}

bool? newCustomFunction4(
  List<int> registroAtual,
  List<int> registroBD,
) {
  return registroAtual[0] <= registroBD[1] && registroAtual[1] >= registroBD[0];
}

bool intervaloSobreposto(
  List<int> cadastro,
  List<UsuarioNoSorteioRow>? registro,
) {
  if (registro == null || registro.isEmpty) {
    return false;
  }

  for (final row in registro) {
    final intervalo = row.intervalo;
    if (intervalo == null || intervalo.isEmpty) {
      continue;
    }

    // Verificar se há qualquer sobreposição entre o intervalo do registro e o cadastro
    for (final num in intervalo) {
      if (num >= cadastro[0] && num <= cadastro[1]) {
        return true;
      }
    }

    // Verificar se o intervalo do registro cobre completamente o cadastro
    if (intervalo[0] <= cadastro[0] && intervalo[1] >= cadastro[1]) {
      return true;
    }

    // Verificar se o intervalo do cadastro cobre completamente o registro
    if (cadastro[0] <= intervalo[0] && cadastro[1] >= intervalo[1]) {
      return true;
    }
  }

  return false;
}

String listaFinalParaCopiar(
  List<UsuarioNoSorteioRow> usuariosNoSorteio,
  SorteioRow sorteio,
) {
  String quantidadeParaEmoji(int quantidade) {
    // Mapa de correspondência de número para emoji
    Map<int, String> emojis = {
      0: '0️⃣',
      1: '1️⃣',
      2: '2️⃣',
      3: '3️⃣',
      4: '4️⃣',
      5: '5️⃣',
      6: '6️⃣',
      7: '7️⃣',
      8: '8️⃣',
      9: '9️⃣'
    };

    String quantidadeEmEmoji = '';

    // Convertendo a quantidade para emojis
    quantidade.toString().runes.forEach((rune) {
      quantidadeEmEmoji += emojis[int.parse(String.fromCharCode(rune))] ?? '';
    });

    return quantidadeEmEmoji;
  }

  String textoFinal =
      '🍀 BINGO DA RÔ 🍀\n🏆🏆🏆🏆🏆🏆🏆🏆🏆\n\nLISTA DE PARTICIPANTE\n\nNORMAL';

  for (var usuario in usuariosNoSorteio) {
    if (usuario.aplicativoDaCartela == 5) {
      textoFinal += '\n ${usuario.nome}';
    }
    // Adicione outros campos conforme necessário
  }

  textoFinal += '\n\nAPLICATIVOS ( GRANDIOSO, BBSORTE, ARBINGO )';
  for (var usuario in usuariosNoSorteio) {
    if (usuario.aplicativoDaCartela != 5) {
      int nome_bingo = usuario.aplicativoDaCartela ?? 0;
      List<String> apl_cart = [
        '',
        'BB Sorte',
        'AR Bingo',
        'SNAP Bingo',
        'Grandioso',
        'APP Qualquer'
      ];
      // Convertendo a quantidade de cartelas compradas em emojis
      // Calculando a quantidade de cartelas compradas e convertendo para emoji
      String quantidadeEmojisRepetida = '';
      int quantidade =
          (((usuario.intervalo[1] ?? 0) - (usuario.intervalo[0] ?? 0)) ~/
                  (sorteio.multiplicador ?? 1)) ??
              0;
      for (int i = 0; i < (sorteio.multiplicador ?? 1); i++) {
        quantidadeEmojisRepetida += quantidadeParaEmoji(quantidade) + ' ☘️ ';
      }

      textoFinal +=
          '\n *${usuario.nome}* \t ${quantidadeEmojisRepetida} \n ${usuario.intervalo[0]} / ${usuario.intervalo[1]}\t ${apl_cart[nome_bingo]}';
    }
    // Adicione outros campos conforme necessário
  }
  textoFinal +=
      '\n\n🏆🏆🏆🏆🏆🏆🏆🏆🏆🏆\nCONFERE SE SEU NOME ESTÁ NA LISTA,CASO NAO ESTEJA NÃO RECEBERÁ O PREMIO\n🏆🏆🏆🏆🏆🏆🏆🏆🏆🏆\n';
  // Soma dos intervalos
  int totalIntervalos = 0;

  // Verifica se o multiplicador é nulo
  if (sorteio.multiplicador != null) {
    // Percorrendo os usuários e somando seus intervalos
    for (var usuario in usuariosNoSorteio) {
      int inicioIntervalo = usuario.intervalo[0];
      int fimIntervalo = usuario.intervalo[1];
      totalIntervalos += (fimIntervalo - inicioIntervalo) + 1;
    }

    // Divisão pelo multiplicador do sorteio
    int qtdVendidas = totalIntervalos ~/
        (sorteio.multiplicador ?? 1); // Convertendo nulo para 1

    // Adicionando informações sobre a quantidade vendida
    textoFinal +=
        '\n\n \t 🏆🏆🏆 *R\$ ${qtdVendidas.toStringAsFixed(2)}* 🏆🏆🏆\n';
  } else {
    // Caso o multiplicador seja nulo, adiciona uma mensagem indicando isso
    textoFinal += '\n\nO multiplicador do sorteio é nulo.\n';
  }

  return textoFinal;
}

List<double> taxa(
  List<CarrinhoStruct> carrinho,
  SorteioRow sorteio,
) {
  int somaIntervalos = 0;
  for (var item in carrinho) {
    if (item.intervalo.length >= 2) {
      somaIntervalos += (item.intervalo[1] - item.intervalo[0]) + 1;
    }
  }

  // Valor total é a soma dos intervalos
  double valorTotal = somaIntervalos.toDouble();

  // Taxa 1: 0.99% do valor total dividido pelo multiplicador de sorteio
  double taxa1 = 0.99 * (valorTotal / (sorteio.multiplicador ?? 1)) / 100;

  // Taxa 2: Valor total dividido pelo multiplicador de sorteio
  double taxa2 = valorTotal / (sorteio.multiplicador ?? 1);

  // Taxa 3: Soma da taxa 1 com a soma dos intervalos dividido pelo multiplicador de sorteio
  double taxa3 = taxa1 + (somaIntervalos / (sorteio.multiplicador ?? 1));

  return [taxa1, taxa2, taxa3];
}

int strparaint(String entrada) {
  // entrada string saida int
  return int.parse(entrada);
}

DateTime datetimenull(DateTime? datetime) {
  // se entrada null retorne data e hora atual se nao retorne o prorio
  if (datetime == null) {
    return DateTime.now();
  } else {
    return datetime;
  }
}

List<int> retorneListaCorreta(
  List<CarrinhoStruct> cartelas,
  int index,
) {
  // return o intervalo de carrinho com o index na lista de index
  return cartelas[index].intervalo ?? [];
}

List<UsuarioNoSorteioRow>? cartelasComIds(
  List<UsuarioNoSorteioRow>? usuarios,
  List<int>? ids,
) {
  // pegar registros onde aplicativo_da_cartela estiver em ids
  if (usuarios == null || ids == null) {
    return null;
  }

  return usuarios
      .where((usuario) => ids.contains(usuario.aplicativoDaCartela))
      .toList();
}
