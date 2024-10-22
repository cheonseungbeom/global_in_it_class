import 'dart:math';

List<int> lottoNumber() {
  var random = Random();
  List<int> lottoList = [];
  var num;

  for (int i = 0; i < 6; i++) {
    num = random.nextInt(45) + 1;
    lottoList.add(num);
  }

  print('당첨번호');
  print(lottoList);

  return lottoList;
}

List<int> myNumber() {
  var random = Random();
  List<int> myList = [];
  var num;

  for (int i = 0; i < 6; i++) {
    num = random.nextInt(45) + 1;
    myList.add(num);
  }

  print('내 추첨 번호');
  print(myList);

  return myList;
}

void checkNumber(lottoList, myList) {
  int match = 0;

  for (int lotto in lottoList) {
    for (int myNum in myList) {
      if (lotto == myNum) {
        print('로또번호 = $lotto');
        print('내추첨번호 = $myNum');
        match++;
      }
    }
  }
  print(match);
}

void main() {
  List<int> lottoFinal = lottoNumber();
  List<int> myFinal = myNumber();

  checkNumber(lottoFinal, myFinal);
}
