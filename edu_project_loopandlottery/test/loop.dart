void main() {
  List<String> rainbow = ['빨', '주', '노', '초', '파', '남', '보'];

  for (String x in rainbow) {
    print(x);
  } // in loop

  List<String> carMaker = ['BMW, Benz, Audi, Jaguqar'];

  carMaker.forEach((element) {
    print(element);
  });// each loop
}
