import 'dart:io';

void main() {
  print("_" * 30);
  print("Курс валюты на сегодня");
  print("_" * 30);
  USD usd = USD(price: 87);
  EUR eur = EUR(price: 110);
  RUB rub = RUB(price: 0.9);
  KZT kzt = KZT(price: 0.21);
  print("Доллар: ${usd.price}");
  print("Евро: ${eur.price}");

  print("Рубли: ${rub.price}");
  print("Тенге: ${kzt.price}");
  print("_" * 30);
  print("1: другую валюту в сомы?");
  print("2: сомы в другую валюту? ");

  final String? answer = stdin.readLineSync();

  if (answer == "1") {
    print(
        "Выберите валюту, которую хотите перевести в сомы: \n1) USD\n2) EUR\n3) RUB\n4) KZT");
    print("_" * 30);

    final String? value = stdin.readLineSync();

    print("Ввод: ");

    if (value == "USD" || value == "EUR" || value == "RUB" || value == "KZT") {
      int amount = int.tryParse(stdin.readLineSync()!) ?? 0;
      print("_" * 30);
      if (value == "USD") {
        print("$amount USD = ${usd.buy(amount)} som");
      } else if (value == "EUR") {
        print("Введите евро: $amount EUR == ${eur.buy(amount)} som");
      } else if (value == "RUB") {
        print("$amount RUB == ${rub.buy(amount)} som");
      } else if (value == "KZT") {
        print("$amount KZT == ${kzt.buy(amount)} som");
      } else {
        print("Error");
      }
    }
  }

  if (answer == "2") {
    print(
        "Выберите какую валюту, вы хотите купить на сомы:\nUSD\nEUR\nRUB\nKZT");
    print("_" * 30);
    final String? value = stdin.readLineSync();
    print("Введите сомы: ");

    final int amount = int.tryParse(stdin.readLineSync()!) ?? 0;
    print("_" * 30);
    if (value == "USD") {
      print("$amount SOM = ${usd.sell(amount)} usd");
    } else if (value == "EUR") {
      print("$amount SOM = ${eur.sell(amount)} eur");
    } else if (value == "RUB") {
      print("$amount SOM = ${rub.sell(amount)} rub");
    } else if (value == "KZT") {
      print("$amount SOM = ${kzt.sell(amount)} kzt");
    } else {
      print("Error");
    }
  }
}

abstract class Money {
  double price = 0;
  Money({
    required this.price,
  });

  double buy(int amount) {
    return price * amount;
  }

  double sell(int amount) {
    return amount / price;
  }
}

class USD extends Money {
  USD({required super.price});
}

class EUR extends Money {
  EUR({required super.price});
}

class RUB extends Money {
  RUB({required super.price});
}

class KZT extends Money {
  KZT({required super.price});
}
