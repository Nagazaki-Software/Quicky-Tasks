import 'dart:convert';
import 'dart:math' as math;

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';
import 'package:timeago/timeago.dart' as timeago;
import 'lat_lng.dart';
import 'place.dart';
import 'uploaded_file.dart';
import '/backend/backend.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import '/backend/schema/structs/index.dart';
import '/auth/firebase_auth/auth_util.dart';

Color escolhaacordasnotificacoes(String? icon) {
  // verifique se icon é igual a mensagem e retorne a cor vermelha, e verifique se icon é igual sistema e retorne a cor azul
  if (icon == 'mensagem') {
    return Colors.red;
  } else if (icon == 'sistema') {
    return Colors.blue;
  } else {
    return Colors.black;
  }
}

int valoresrecomendadosMinimo(String categoria) {
  // Verifique os valores mínimos permitidos para cada categoria
  if (categoria == "Personal & Dorms") {
    return 10; // Retorna o valor mínimo recomendado para a categoria
  } else if (categoria == "Food Delivery & Shopping") {
    return 5; // Retorna o valor mínimo recomendado para a categoria
  } else if (categoria == "Academic Help") {
    return 20; // Retorna o valor mínimo recomendado para a categoria
  } else if (categoria == "Tech Support") {
    return 10; // Retorna o valor mínimo recomendado para a categoria
  } else if (categoria == "Transportation & Deliveries") {
    return 20; // Retorna o valor mínimo recomendado para a categoria
  } else if (categoria == "Health & Wellbeing") {
    return 5; // Retorna o valor mínimo recomendado para a categoria
  } else if (categoria == "Event & Social Support") {
    return 20; // Retorna o valor mínimo recomendado para a categoria
  } else if (categoria == "Moving & Organizing") {
    return 10; // Retorna o valor mínimo recomendado para a categoria
  } else if (categoria == "Maintenance & Repairs") {
    return 20; // Retorna o valor mínimo recomendado para a categoria
  } else if (categoria == "Pet Care") {
    return 10; // Retorna o valor mínimo recomendado para a categoria
  } else if (categoria == "Creative Services & Media") {
    return 20; // Retorna o valor mínimo recomendado para a categoria
  }

  return 0; // Retorna 0 se a categoria não for reconhecida
}

String convertStringInListComVirgula() {
  // Lista com itens separados por vírgula
  return 'Assistência Pessoal & Dormitório, Alimentação & Compras, Suporte Acadêmico, Tecnologia & Eletrônicos, Lavagem e dobra de roupas, Limpeza e organização do quarto, Remoção de lixo e reciclagem, Arrumação de cama e troca de lençóis, Organização de armário, Reorganização de móveis, Ajuda com armazenamento (empacotar/desempacotar para recessos), Entrega de comida de restaurantes fora do campus, Compras e entrega de supermercado, Assistência na preparação de refeições, Corridas para lanches e café, Retirada de refeições no refeitório, Aulas particulares para matérias específicas, Ajuda com dever de casa e estudos, Assistência para anotações, Ajuda com pesquisas para trabalhos, Revisão e edição de redações, Lembretes de aula e organização, Solução de problemas em celulares ou laptops, Instalação e configuração de software, Impressão e digitalização de documentos, Configuração de roteadores Wi-Fi ou impressoras, Ajuda com tarefas de programação, Transporte & Serviços, Eventos & Assistência Social, Saúde & Bem-estar, Manutenção & Reparos, Mudanças & Armazenamento, Carona dentro do campus e arredores, Transporte para aeroporto ou estação de ônibus, Retirada e entrega de pacotes, Devolução de livros na biblioteca, Execução de tarefas diversas, Montagem e limpeza de festas, Movimentação de móveis para eventos, Decoração de dormitórios ou eventos, Fotografia e filmagem de eventos, Organização de atividades de clubes estudantis, Companhia na academia ou parceiro de treino, Planejamento de refeições e dicas de dieta, Orientação para meditação ou yoga, Retirada de medicamentos ou farmácia, Pequenos reparos no dormitório (troca de lâmpadas, pequenos ajustes), Montagem de móveis, Fixação de quadros ou decorações, Reparos e manutenção de bicicletas, Ajuda com mudança de dormitório ou apartamento, Empacotamento e desempacotamento, Transporte de itens pesados, Armazenamento de pertences durante recessos, Cuidado com Animais, Serviços Criativos & Mídia, Pedidos Especiais & Únicos, Terceira Interface: Criar Nova Tarefa, A próxima tarefa principal será adicionar uma página de criação de tarefas; este será o ícone central e principal no meio da seleção de páginas na barra inferior, semelhante à estrela do Tinder, Design: A aparência deve ser semelhante à página de configuração de perfil no Tinder, O que deve estar disponível para o usuário incluir: Informações Obrigatórias da Tarefa (Preenchidas Automaticamente ou Selecionadas pelo Usuário), Detalhes Básicos da Tarefa, Passeio com cães, Alimentação e cuidados com animais, Limpeza de gaiolas ou aquários, Design gráfico para cartazes ou panfletos, Edição de vídeos para projetos, Sessões fotográficas para LinkedIn ou currículos, Ficar na fila para eventos, Teste de produtos ou compras misteriosas, Ajuda com pedidos personalizados';
}

double fastPass(
  String porcentagem,
  double valortotal,
) {
  // retorne somente o calculo da porcentagem do valor total tipo (35% do valor total = $3,35 dol)
  double percent = double.parse(porcentagem.replaceAll('%', '')) / 100;
  return valortotal * percent;
}

String latlngsemespaco(LatLng location) {
  // retorne o latlng assim: "-42.98777,-18.32132"
  return '${location.latitude},${location.longitude}';
}

int formatStringInter(String texto) {
  // converta a string em inteiro
  return int.tryParse(texto) ?? 0;
}

List<TasksRecord>? tasksRatingForIndexs(
  List<TasksRecord>? tasks,
  int acaodemudanca,
) {
  // preciso q esse codigo aparece 1 da lista e depois na acao de mudança(int) mudar o index q ele esta (0,1,2,3,4)
  if (tasks == null || tasks.isEmpty) return null;

  // Ensure the index is within bounds
  int index = acaodemudanca.clamp(0, tasks.length - 1);

  // Return the task at the specified index
  return [tasks[index]];
}

int valoresrecomendadosMaximo(String categoria) {
  // Verifique os valores máximos permitidos para cada categoria
  if (categoria == "Personal & Dorms") {
    return 35; // Retorna o valor máximo recomendado para a categoria
  } else if (categoria == "Food Delivery & Shopping") {
    return 13; // Retorna o valor máximo recomendado para a categoria
  } else if (categoria == "Academic Help") {
    return 50; // Retorna o valor máximo recomendado para a categoria
  } else if (categoria == "Tech Support") {
    return 30; // Retorna o valor máximo recomendado para a categoria
  } else if (categoria == "Transportation & Deliveries") {
    return 56; // Retorna o valor máximo recomendado para a categoria
  } else if (categoria == "Health & Wellbeing") {
    return 13; // Retorna o valor máximo recomendado para a categoria
  } else if (categoria == "Event & Social Support") {
    return 50; // Retorna o valor máximo recomendado para a categoria
  } else if (categoria == "Moving & Organizing") {
    return 30; // Retorna o valor máximo recomendado para a categoria
  } else if (categoria == "Maintenance & Repairs") {
    return 56; // Retorna o valor máximo recomendado para a categoria
  } else if (categoria == "Pet Care") {
    return 30; // Retorna o valor máximo recomendado para a categoria
  } else if (categoria == "Creative Services & Media") {
    return 56; // Retorna o valor máximo recomendado para a categoria
  }

  return 0; // Retorna 0 se a categoria não for reconhecida
}

double progressBar(
  int stepsParaFinalizar,
  int? stepsFinalizadas,
) {
  // para o progessBar precisa retornar de 0 a 1 quero q se basee nas stepsParafinalizar  e finalizada e retorne
  if (stepsParaFinalizar <= 0) return 0.0; // Prevent division by zero
  return (stepsFinalizadas ?? 0) / stepsParaFinalizar; // Calculate progress
}

DateTime dateTimeCombine(
  DateTime hora,
  DateTime dia,
) {
  // combine as datas
  return DateTime(
    dia.year,
    dia.month,
    dia.day,
    hora.hour,
    hora.minute,
    hora.second,
    hora.millisecond,
    hora.microsecond,
  );
}

DateTime retornedaquia6horas(DateTime horarioatual) {
  // retorne 6 horas depois do horario atual
  return horarioatual.add(Duration(hours: 6));
}

List<String> allRegions() {
  // all regions supported stripe of world (US, BR, FR...)
  return [
    'US', // United States
    'BR', // Brazil
    'FR', // France
    'DE', // Germany
    'IT', // Italy
    'GB', // United Kingdom
    'CA', // Canada
    'AU', // Australia
    'IN', // India
    'JP', // Japan
    'CN', // China
    'MX', // Mexico
    'ES', // Spain
    'NL', // Netherlands
    'SE', // Sweden
    'NO', // Norway
    'FI', // Finland
    'DK', // Denmark
    'IE', // Ireland
    'SG', // Singapore
    'HK', // Hong Kong
    'NZ', // New Zealand
    'ZA', // South Africa
    'RU', // Russia
    'AT', // Austria
    'CH', // Switzerland
    'BE', // Belgium
    'PT', // Portugal
    'GR', // Greece
    'IL', // Israel
    'PH', // Philippines
    'TH', // Thailand
    'MY', // Malaysia
    'VN', // Vietnam
    'AR', // Argentina
    'CL', // Chile
    'CO', // Colombia
    'PE', // Peru
    'EG', // Egypt
    'AE', // United Arab Emirates
    'KW', // Kuwait
    'QA', // Qatar
    'SA', // Saudi Arabia
    'TR', // Turkey
    'BG', // Bulgaria
    'CZ', // Czech Republic
    'HU', // Hungary
    'SK', // Slovakia
    'RO', // Romania
    'SI', // Slovenia
    'LT', // Lithuania
    'LV', // Latvia
    'EE', // Estonia
    'IS', // Iceland
    'MT', // Malta
    'CY', // Cyprus
    'MD', // Moldova
    'BY', // Belarus
    'UA', // Ukraine
    'KZ', // Kazakhstan
    'UZ', // Uzbekistan
    'AM', // Armenia
    'GE', // Georgia
    'AZ', // Azerbaijan
    'MN', // Mongolia
    'LK', // Sri Lanka
    'BD', // Bangladesh
    'NP', // Nepal
    'KH', // Cambodia
    'LA', // Laos
    'MM', // Myanmar
    'KH', // Cambodia
    'TG', // Togo
    'GH', // Ghana
    'NG', // Nigeria
    'KE', // Kenya
    'TZ', // Tanzania
    'UG', // Uganda
    'ZM', // Zambia
    'ZW', // Zimbabwe
  ];
}

List<TasksRecord>? buscarRegiao(
  List<TasksRecord> task,
  LatLng localizacaoDoUsuario,
  double? localizacaoMaxima,
  List<LatLng> locationComunity,
  double? precoMaximo,
  String? categoriaDesejada,
) {
  List<TasksRecord> placesList = [];

  // Verifique se o valor de localizacaoMaxima está sendo passado corretamente
  print("Valor de localizacaoMaxima recebido: $localizacaoMaxima");

  // Se localizacaoMaxima for null ou 0, usa 30.0 km como padrão
  double maxDistancia = (localizacaoMaxima != null && localizacaoMaxima > 0)
      ? localizacaoMaxima
      : 30.0;

  print(
      "Valor de maxDistancia após verificação: $maxDistancia km"); // Debug: Verificando o valor de maxDistancia

  bool usuarioDentroDeAlgumaComunidade = false;

  // Calculando a distância para verificar se o usuário está dentro da área permitida
  for (LatLng pontoComunitario in locationComunity) {
    double lat1 = localizacaoDoUsuario.latitude;
    double lon1 = localizacaoDoUsuario.longitude;
    double lat2 = pontoComunitario.latitude;
    double lon2 = pontoComunitario.longitude;

    // Fórmula de Haversine para calcular a distância entre as coordenadas
    const double raioTerra = 6371; // Raio da Terra em km
    double dLat = (lat2 - lat1) * math.pi / 180;
    double dLon = (lon2 - lon1) * math.pi / 180;

    double a = math.sin(dLat / 2) * math.sin(dLat / 2) +
        math.cos(lat1 * math.pi / 180) *
            math.cos(lat2 * math.pi / 180) *
            math.sin(dLon / 2) *
            math.sin(dLon / 2);

    double c = 2 * math.atan2(math.sqrt(a), math.sqrt(1 - a));
    double distancia = raioTerra * c;

    // Debug: Imprimir a distância calculada
    print("Distância do usuário até ponto comunitário: $distancia km");

    // Verificando se a distância está dentro do limite permitido
    if (distancia <= maxDistancia) {
      print(
          "Usuário dentro da área permitida."); // Debug: Verificando a condição
      usuarioDentroDeAlgumaComunidade = true;
      break; // Sai do loop se o usuário estiver dentro de uma comunidade
    }
  }

  // Se o usuário estiver fora da área permitida, retorna vazio
  if (!usuarioDentroDeAlgumaComunidade) {
    print("Usuário fora da área permitida.");
    return [];
  }

  // Filtra as tarefas conforme as condições fornecidas
  for (var t in task) {
    if (t.location == null) continue;

    // Verifica se a categoria corresponde, se fornecida
    if (categoriaDesejada != null &&
        categoriaDesejada.isNotEmpty &&
        t.titulo != categoriaDesejada) {
      print("Categoria não bate: ${t.categoria} != $categoriaDesejada");
      continue;
    }

    // Verifica o preço máximo se fornecido e não for zero
    if (precoMaximo != null && precoMaximo > 0) {
      String valorRaw = t.valor ?? '';
      String valorSemSimbolo = valorRaw.replaceAll(RegExp(r'[^0-9.]'), '');
      double? valorDouble = double.tryParse(valorSemSimbolo);

      if (valorDouble == null || valorDouble > precoMaximo) {
        print(
            "Valor da tarefa ($valorDouble) excede o preço máximo ($precoMaximo)");
        continue;
      }
    }

    // Adiciona a tarefa à lista se passar todas as condições
    placesList.add(t);
  }

  return placesList;
}

int valorcomporcentagem(String value) {
  // retorne a somatoria do valor com uma porcentagem de 12%
  int valor = int.parse(value);
  double porcentagem = valor * 0.12;
  return (valor + porcentagem).round();
}

int chequeurgencia(String choicechip) {
// retorne uma taxa em inteiro baseado na urgencia em low, medium, high, urgency
  switch (choicechip) {
    case 'Low':
      return 2;
    case 'Medium':
      return 3;
    case 'High':
      return 5;
    case 'Urgent':
      return 6;
    default:
      return 0;
  }
}

List<int> retorneMaisImagens(String choiceChips) {
  // se o choiceChips retornar (1 Step, 2 Steps, 3 Steps, 4 +, 5,6,7,8 desse jeito mesmo) retorne o numero
  switch (choiceChips) {
    case '1 Step':
      return [1];
    case '2 Steps':
      return [2];
    case '3 Steps':
      return [3];
    case '4 +':
      return [4];
    case '5':
      return [5];
    case '6':
      return [6];
    case '7':
      return [7];
    case '8':
      return [8];
    default:
      return [];
  }
}

double? somatoriaPorcetagem(
  String number1,
  String? number2,
) {
  // calcule o valor do numer1 + number2  e retorne-os somente o valor do calculo de 8%
  double num1 = double.tryParse(number1) ?? 0.0;
  double num2 = double.tryParse(number2 ?? '0') ?? 0.0;
  double total = num1 + num2;
  return total * 0.08; // Retorna 8% do total
}

double somatoriaSimples(
  String? number,
  String? number2,
  String? number3,
  String? number4,
) {
  // faça a somatoria dos valores (NUMBER 4 É PORCENTAGEM SOMENTE)
  double num1 = double.tryParse(number ?? '0') ?? 0;
  double num2 = double.tryParse(number2 ?? '0') ?? 0;
  double num3 = double.tryParse(number3 ?? '0') ?? 0;
  double percentage = double.tryParse(number4 ?? '0') ?? 0;

  double total = num1 + num2 + num3;
  double percentageValue = (total * percentage) / 100;

  return total + percentageValue;
}

String retorneAstringmaisadicionada(List<String> mostOrded) {
  // retorne a string mais adicionada
  Map<String, int> frequencyMap = {};
  for (var item in mostOrded) {
    frequencyMap[item] = (frequencyMap[item] ?? 0) + 1;
  }

  String mostAddedString =
      frequencyMap.entries.reduce((a, b) => a.value > b.value ? a : b).key;
  return mostAddedString;
}

LatLng newCustomFunction(
  LatLng locationUser,
  List<LatLng> comunnityLocation,
) {
  const double earthRadius = 6371;
  LatLng closestLocation = locationUser;
  double closestDistance = double.infinity;

  for (LatLng community in comunnityLocation) {
    double dLat = (community.latitude - locationUser.latitude) * math.pi / 180;
    double dLon =
        (community.longitude - locationUser.longitude) * math.pi / 180;
    double a = math.sin(dLat / 2) * math.sin(dLat / 2) +
        math.cos(locationUser.latitude * math.pi / 180) *
            math.cos(community.latitude * math.pi / 180) *
            math.sin(dLon / 2) *
            math.sin(dLon / 2);
    double c = 2 * math.atan2(math.sqrt(a), math.sqrt(1 - a));
    double distance = earthRadius * c;

    if (distance < 30 && distance < closestDistance) {
      closestDistance = distance;
      closestLocation = community;
    }
  }

  return closestLocation;
}

List<String> separarTexto(String texto) {
  // separe o texto por espaço
  return texto.split(' '); // Separa o texto por espaço
}

dynamic formatStringToJson(String task) {
// formate treino para json, exclua tudo que não seja em json, ou tudo antes e depois do {}
  // Find the start and end index of the JSON object
  int startIndex = task.indexOf('{');
  int endIndex = task.lastIndexOf('}');

  // Extract the JSON object from the string
  String jsonStr = task.substring(startIndex, endIndex + 1);

  // Parse the JSON string to a dynamic object
  dynamic jsonData = json.decode(jsonStr);

  return jsonData;
}

bool valoresrecomendados(
  String categoria,
  int? valor,
) {
// Verifique se qual categoria e se for um valor abaixo ou maior que o permitido retorne true para bloquear
  if (categoria == "Personal & Dorms") {
    // Valor ideal entre $15 e $35
    if (valor! < 10 || valor > 35) {
      return true;
    }
  } else if (categoria == "Food Delivery & Shopping") {
    // Valor ideal entre $5 e $13
    if (valor! < 5 || valor > 13) {
      return true;
    }
  } else if (categoria == "Academic Help") {
    // Valor ideal entre $20 e $50
    if (valor! < 20 || valor > 50) {
      return true;
    }
  } else if (categoria == "Tech Support") {
    // Valor ideal entre $10 e $30
    if (valor! < 10 || valor > 30) {
      return true;
    }
  } else if (categoria == "Transportation & Deliveries") {
    // Valor ideal entre $20 e $56
    if (valor! < 20 || valor > 56) {
      return true;
    }
  } else if (categoria == "Health & Wellbeing") {
    // Valor ideal entre $5 e $13
    if (valor! < 5 || valor > 13) {
      return true;
    }
  } else if (categoria == "Event & Social Support") {
    // Valor ideal entre $20 e $50
    if (valor! < 20 || valor > 50) {
      return true;
    }
  } else if (categoria == "Moving & Organizing") {
    // Valor ideal entre $10 e $30
    if (valor! < 10 || valor > 30) {
      return true;
    }
  } else if (categoria == "Maintenance & Repairs") {
    // Valor ideal entre $20 e $56
    if (valor! < 20 || valor > 56) {
      return true;
    }
  } else if (categoria == "Pet Care") {
    // Valor ideal entre $10 e $30
    if (valor! < 10 || valor > 30) {
      return true;
    }
  } else if (categoria == "Creative Services & Media") {
    // Valor ideal entre $20 e $56
    if (valor! < 20 || valor > 56) {
      return true;
    }
  }
  return false;
}

int indexList1(String indexList) {
  // faça q quando o indexlist retornar 0 no front end ser 1 e etc
  int index =
      int.tryParse(indexList) ?? 0; // Convert string to int, default to 0
  return index + 1; // Increment index by 1
}

int formateInteiroEmDouble(double doble) {
  // formate double em inteiro
  return doble.toInt();
}

String verifiqueQualCartao(String cardNumber) {
  // retorne o nome da bandeira do cartão baseada em: Visa: Começa com o número 4, Mastercard: Começa com os números 51 a 55, ou ainda com a faixa de 2221 a 2720, American Express: Começa com 34 ou 37, Discover: Começa com 6011, 65, ou com a faixa de 644 a 649, Elo: Pode começar com vários intervalos, incluindo 4011, 4312, 4389, entre outros, Hipercard: Geralmente começa com 6062
  if (cardNumber.startsWith('4')) {
    return 'Visa';
  } else if ((cardNumber.startsWith('51') ||
          cardNumber.startsWith('52') ||
          cardNumber.startsWith('53') ||
          cardNumber.startsWith('54') ||
          cardNumber.startsWith('55')) ||
      (int.parse(cardNumber) >= 2221 && int.parse(cardNumber) <= 2720)) {
    return 'Mastercard';
  } else if (cardNumber.startsWith('34') || cardNumber.startsWith('37')) {
    return 'American Express';
  } else if (cardNumber.startsWith('6011') ||
      cardNumber.startsWith('65') ||
      (int.parse(cardNumber) >= 644 && int.parse(cardNumber) <= 649)) {
    return 'Discover';
  } else if (cardNumber.startsWith('4011') ||
      cardNumber.startsWith('4312') ||
      cardNumber.startsWith('4389')) {
    return 'Elo';
  } else if (cardNumber.startsWith('6062')) {
    return 'Hipercard';
  } else {
    return 'Desconhecido';
  }
}

String esconderCartaoDeCredito(String cardNumber) {
  // esconda o cartão de credito mostrando somente os ultimos 4 numeros (exemplo: **** **** **** 3425) com espaços
  if (cardNumber.length < 4) {
    return cardNumber;
  }

  String lastFourDigits = cardNumber.substring(cardNumber.length - 4);
  String hiddenDigits = '';
  for (int i = 0; i < cardNumber.length - 4; i++) {
    if (cardNumber[i] == ' ') {
      hiddenDigits += ' ';
    } else {
      hiddenDigits += '*';
    }
  }

  return '$hiddenDigits $lastFourDigits';
}

int mediadevalorestasks(List<TasksRecord> valores) {
  // valores.valor(valor é string tira tudo que nao seja numero dentro pra retornar somente o numero) sendo as medias de valores
  int total = 0;
  int count = 0;

  for (var valor in valores) {
    String numericString = valor.valor.replaceAll(RegExp(r'[^0-9]'), '');
    if (numericString.isNotEmpty) {
      total += int.parse(numericString);
      count++;
    }
  }

  return count > 0
      ? (total ~/ count)
      : 0; // Return average or 0 if no valid values
}

List<ChatRecord> retorneBaseadoNahora(
  DateTime horario,
  List<ChatRecord> chatList,
) {
  return chatList.where((chat) {
    final chatTime = chat.ultimaMsg;
    if (chatTime == null) return false;

    return chatTime.isAfter(horario.subtract(Duration(hours: 1))) &&
        chatTime.isBefore(horario.add(Duration(hours: 1)));
  }).toList();
}

int calcularRatings(List<AvaliacoesStruct>? avaliacoes) {
  // calcule a media de ratings baseado em avaliacoes.rating sendo inteiro
  if (avaliacoes == null || avaliacoes.isEmpty) {
    return 5; // Retorna 0 se a lista estiver vazia ou nula
  }

  int totalRatings = 0;
  for (var avaliacao in avaliacoes) {
    totalRatings += avaliacao.rating; // Soma as avaliações
  }

  return (totalRatings ~/ avaliacoes.length); // Calcula a média
}

int quantasNaLista(List<String> lista) {
  // retorne o numero do ultimo index
  return lista.length - 1;
}

int diferencaPorcentagem(String value) {
  // calcule a diferença de valor em 12%
  double valor = double.parse(value);
  double diferenca = valor * 0.12;
  return diferenca.toInt();
}

List<String> convertStringInList(String gemini) {
  // retorne o gemini em lista
  return gemini.split('');
}

List<TasksRecord>? filterAllTask(
  double? price,
  double? distance,
  String? category,
  List<TasksRecord>? tasks,
  LatLng userLocation,
) {
  if (tasks == null) return null;

  return tasks.where((task) {
    // Converter task.valor (String) para double
    final parsedPrice = double.tryParse(task.valor ?? '');
    if (parsedPrice == null) {
      print('Valor inválido: ${task.valor}');
      return false;
    }

    // Filtro de preço
    bool matchesPrice = price == null || parsedPrice <= price;
    print('Preço da task: $parsedPrice, Filtro de preço: $matchesPrice');

    // Filtro de categoria
    bool matchesCategory = category == null || task.categoria == category;
    print(
        'Categoria da task: ${task.categoria}, Filtro de categoria: $matchesCategory');

    // Verifica se task.location é válida
    if (task.location == null) {
      print('Localização inválida');
      return false;
    }

    // Cálculo de distância (sem função auxiliar)
    const earthRadius = 6371.0; // km
    final dLat =
        (task.location!.latitude - userLocation.latitude) * (math.pi / 180.0);
    final dLon =
        (task.location!.longitude - userLocation.longitude) * (math.pi / 180.0);

    final lat1Rad = userLocation.latitude * (math.pi / 180.0);
    final lat2Rad = task.location!.latitude * (math.pi / 180.0);

    final a = math.sin(dLat / 2) * math.sin(dLat / 2) +
        math.cos(lat1Rad) *
            math.cos(lat2Rad) *
            math.sin(dLon / 2) *
            math.sin(dLon / 2);

    final c = 2 * math.atan2(math.sqrt(a), math.sqrt(1 - a));
    double taskDistance = earthRadius * c;

    // Filtro de distância
    bool matchesDistance = distance == null || taskDistance <= distance;
    print(
        'Distância da task: $taskDistance km, Filtro de distância: $matchesDistance');

    return matchesPrice && matchesCategory && matchesDistance;
  }).toList();
}

List<String> naoretorneigual(List<String> categoriasList) {
  // Se tiver repetido, retorne somente 1 deles
  return categoriasList
      .toSet()
      .toList(); // Remove duplicates by converting to a Set and then back to a List
}

double formatStringToDouble(String text) {
  // format string to double
  return double.tryParse(text) ??
      0.0; // Convert string to double, return 0.0 if parsing fails
}

List<String> allEtinias() {
  // Todas as etinias do mundo em ingles
  return [
    'Afghanistan',
    'Albania',
    'Algeria',
    'Andorra',
    'Angola',
    'Antigua and Barbuda',
    'Argentina',
    'Armenia',
    'Australia',
    'Austria',
    'Azerbaijan',
    'Bahamas',
    'Bahrain',
    'Bangladesh',
    'Barbados',
    'Belarus',
    'Belgium',
    'Belize',
    'Benin',
    'Bhutan',
    'Bolivia',
    'Bosnia and Herzegovina',
    'Botswana',
    'Brazil',
    'Brunei',
    'Bulgaria',
    'Burkina Faso',
    'Burundi',
    'Cabo Verde',
    'Cambodia',
    'Cameroon',
    'Canada',
    'Central African Republic',
    'Chad',
    'Chile',
    'China',
    'Colombia',
    'Comoros',
    'Congo',
    'Costa Rica',
    'Croatia',
    'Cuba',
    'Cyprus',
    'Czech Republic',
    'Democratic Republic of the Congo',
    'Denmark',
    'Djibouti',
    'Dominica',
    'Dominican Republic',
    'Ecuador',
    'Egypt',
    'El Salvador',
    'Equatorial Guinea',
    'Eritrea',
    'Estonia',
    'Eswatini',
    'Ethiopia',
    'Fiji',
    'Finland',
    'France',
    'Gabon',
    'Gambia',
    'Georgia',
    'Germany',
    'Ghana',
    'Greece',
    'Grenada',
    'Guatemala',
    'Guinea',
    'Guinea-Bissau',
    'Guyana',
    'Haiti',
    'Honduras',
    'Hungary',
    'Iceland',
    'India',
    'Indonesia',
    'Iran',
    'Iraq',
    'Ireland',
    'Israel',
    'Italy',
    'Jamaica',
    'Japan',
    'Jordan',
    'Kazakhstan',
    'Kenya',
    'Kiribati',
    'Korea, North',
    'Korea, South',
    'Kuwait',
    'Kyrgyzstan',
    'Laos',
    'Latvia',
    'Lebanon',
    'Lesotho',
    'Liberia',
    'Libya',
    'Liechtenstein',
    'Lithuania',
    'Luxembourg',
    'Madagascar',
    'Malawi',
    'Malaysia',
    'Maldives',
    'Mali',
    'Malta',
    'Marshall Islands',
    'Mauritania',
    'Mauritius',
    'Mexico',
    'Micronesia',
    'Moldova',
    'Monaco',
    'Mongolia',
    'Montenegro',
    'Morocco',
    'Mozambique',
    'Myanmar',
    'Namibia',
    'Nauru',
    'Nepal',
    'Netherlands',
    'New Zealand',
    'Nicaragua',
    'Niger',
    'Nigeria',
    'North Macedonia',
    'Norway',
    'Oman',
    'Pakistan',
    'Palau',
    'Palestine',
    'Panama',
    'Papua New Guinea',
    'Paraguay',
    'Peru',
    'Philippines',
    'Poland',
    'Portugal',
    'Qatar',
    'Romania',
    'Russia',
    'Rwanda',
    'Saint Kitts and Nevis',
    'Saint Lucia',
    'Saint Vincent and the Grenadines',
    'Samoa',
    'San Marino',
    'Sao Tome and Principe',
    'Saudi Arabia',
    'Senegal',
    'Serbia',
    'Seychelles',
    'Sierra Leone',
    'Singapore',
    'Slovakia',
    'Slovenia',
    'Solomon Islands',
    'Somalia',
    'South Africa',
    'South Sudan',
    'Spain',
    'Sri Lanka',
    'Sudan',
    'Suriname',
    'Sweden',
    'Switzerland',
    'Syria',
    'Taiwan',
    'Tajikistan',
    'Tanzania',
    'Thailand',
    'Togo',
    'Tonga',
    'Trinidad and Tobago',
    'Tunisia',
    'Turkey',
    'Turkmenistan',
    'Tuvalu',
    'Uganda',
    'Ukraine',
    'United Arab Emirates',
    'United Kingdom',
    'United States',
    'Uruguay',
    'Uzbekistan',
    'Vanuatu',
    'Vatican City',
  ];
}

int? quantosanosapessoatem(DateTime? datadenascimento) {
  // Se a data de nascimento for null, retorna null
  if (datadenascimento == null) {
    return 0;
  }

  // baseado na data de nascimento do usuário retorne quantos anos ele tem
  DateTime hoje = DateTime.now();
  int idade = hoje.year - datadenascimento.year;
  if (hoje.month < datadenascimento.month ||
      (hoje.month == datadenascimento.month &&
          hoje.day < datadenascimento.day)) {
    idade--;
  }
  return idade;
}

String? retornequalaparecemais(List<String>? categorislist) {
  // Se a lista for null ou vazia, retorna null
  if (categorislist == null || categorislist.isEmpty) {
    return "none"; // Agora isso é válido
  }

  // retorne qual aparece mais
  Map<String, int> frequencyMap = {};
  for (String category in categorislist) {
    frequencyMap[category] = (frequencyMap[category] ?? 0) + 1;
  }

  String mostFrequent = '';
  int maxCount = 0;

  frequencyMap.forEach((key, value) {
    if (value > maxCount) {
      maxCount = value;
      mostFrequent = key;
    }
  });

  return mostFrequent;
}

String separartextoeescolherposicao(
  String txt,
  int posicao,
) {
  // separar texto e escolher qual posicao pegar
  List<String> partes = txt.split(' '); // Separar o texto em partes
  if (posicao < 0 || posicao >= partes.length) {
    return ''; // Retornar string vazia se a posição for inválida
  }
  return partes[posicao]; // Retornar a parte na posição especificada
}

double mostrarMenos15porcent(double value) {
  // mostre o valor com -15% que é a taxa
  return value * 0.85; // Calcula 15% a menos do valor
}

double quantodetokentem(double? value) {
  // baseando-se que cada token é 2.5 e 4 tokens é $10, 10 é $25, 20 é $50 e 50 é $125 retorne os tokens baseado no valor mas tem q ser o exato baseado q cada token é 2.5
  if (value == null || value < 2.5) {
    return 0;
  }
  return (value / 2.5).floorToDouble();
}

double quantodetokentemCopy(double? value) {
  // baseando-se que cada token é 2.5 e 4 tokens é $10, 10 é $25, 20 é $50 e 50 é $125 retorne os tokens baseado no valor mas tem q ser o exato baseado q cada token é 2.5, retire 1.5 dos token
  if (value == null || value < 0)
    return 0.0; // Return 0 for null or negative values
  double tokens = value / 2.5; // Calculate the number of tokens
  tokens -= 1.5; // Subtract 1.5 from the total tokens
  return tokens < 0 ? 0 : tokens; // Ensure tokens don't go below 0
}

double quantodetokentemCopyCopy(double? value) {
  // baseando-se que cada token é 2.5 e 4 tokens é $10, 10 é $25, 20 é $50 e 50 é $125 retorne os tokens baseado no valor mas tem q ser o exato baseado q cada token é 2.5, retire 1.5 dos token e 12.5%
  if (value == null || value <= 0) {
    return 0;
  }

  double netValue = value - (value * 0.125); // Subtract 12.5%
  double tokens = netValue / 2.5; // Each token is 2.5
  return tokens.floorToDouble(); // Return the exact number of tokens
}

double somatoriaDaLIsta(List<double>? valores) {
  // manda a somatoria da lista
  if (valores == null) return 0.0; // Retorna 0 se a lista for nula
  return valores.reduce((a, b) => a + b); // Soma todos os elementos da lista
}

double tokentovalor(int? token) {
  // baseando-se que 4 tokens é $10, 10 é $25, 20 é $50 e 50 é $125 retorne a media dos tokens em valor tipo o usuario pode ter mais que essas informações entao tem q aparecer
  if (token == null || token <= 0) {
    return 0.0;
  }

  if (token <= 4) {
    return (token / 4) * 10.0;
  } else if (token <= 10) {
    return 10.0 +
        ((token - 4) / 6) * 15.0; // $10 for 4 tokens, $25 for 10 tokens
  } else if (token <= 20) {
    return 25.0 +
        ((token - 10) / 10) * 25.0; // $25 for 10 tokens, $50 for 20 tokens
  } else if (token <= 50) {
    return 50.0 +
        ((token - 20) / 30) * 75.0; // $50 for 20 tokens, $125 for 50 tokens
  } else {
    return 125.0 +
        ((token - 50) / (token - 50)) *
            0.0; // Beyond 50 tokens, no additional value
  }
}

LatLng convertlatlangemlatlang2(LatLng latngs) {
  // converta o latlng em latlong2: ^0.9.1
  return LatLng(latngs.latitude, latngs.longitude);
}

List<EventsRecord> newCustomFunction2(
  List<EventsRecord> eventDoc,
  DateTime daySelecionado,
  DocumentReference userRef,
) {
  DateTime startOfDay(DateTime date) {
    return DateTime(date.year, date.month, date.day);
  }

  return eventDoc.where((event) {
    // Se event.horario for um Timestamp, converte para DateTime. Caso contrário, usa diretamente.
    DateTime eventDate;
    if (event.horario is Timestamp) {
      eventDate = (event.horario as Timestamp)
          .toDate(); // Converte Timestamp para DateTime
    } else {
      eventDate =
          event.horario ?? DateTime.now(); // Se for DateTime, usa diretamente
    }

    // Verifica se a data do evento é o mesmo dia que daySelecionado
    bool isSameDay =
        startOfDay(eventDate).isAtSameMomentAs(startOfDay(daySelecionado));

    // Verifica se o usuário está interessado ou registrado
    bool isUserInterested = event.interesseUsers.contains(userRef);
    bool isUserRegistered = event.usersRegistration.contains(userRef);

    // Retorna se for o mesmo dia e o usuário estiver interessado ou registrado
    return isSameDay && (isUserInterested || isUserRegistered);
  }).toList();
}

List<EventsRecord> newCustomFunction2Copy(
  List<EventsRecord> eventDoc,
  DateTime daySelecionado,
  DocumentReference userRef,
) {
  DateTime startOfDay(DateTime date) {
    return DateTime(date.year, date.month, date.day);
  }

  return eventDoc.where((event) {
    // Se event.horario for um Timestamp, converte para DateTime. Caso contrário, usa diretamente.
    DateTime eventDate;
    if (event.horario is Timestamp) {
      eventDate = (event.horario as Timestamp)
          .toDate(); // Converte Timestamp para DateTime
    } else {
      eventDate =
          event.horario ?? DateTime.now(); // Se for DateTime, usa diretamente
    }

    // Verifica se a data do evento é o mesmo dia que daySelecionado
    bool isSameDay =
        startOfDay(eventDate).isAtSameMomentAs(startOfDay(daySelecionado));

    // Verifica se o usuário está interessado ou registrado
    bool isUserInterested = event.performers.contains(userRef);
    bool isUserRegistered = event.instrutorAccept.contains(userRef);

    // Retorna se for o mesmo dia e o usuário estiver interessado ou registrado
    return isSameDay && (isUserInterested || isUserRegistered);
  }).toList();
}

String? retirepartesdadata(
  String data,
  String? qual,
) {
  if (data.isEmpty || !data.contains('/')) {
    return null;
  }

  final partes = data.split('/');
  if (partes.length < 2) {
    return null;
  }

  if (qual == 'month') {
    return partes[0];
  } else if (qual == 'year') {
    return partes[1];
  }

  return null;
}
