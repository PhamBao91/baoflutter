import 'dart:io';
void inDaySo()
{
  dynamic list = List ();
  int tong = 0;
  var string, num ;
  do {
    print ("Nhập số trong khoảng từ 1- 10!");
    // Nhập số từ bàn phím
    try {
      string = stdin.readLineSync();
      // Chuyển đổi sang kiểu int
      num = int.parse(string);
      // nhập số vào list
      list.add(num);
      // tính tổng
      tong+= num;
    }
    catch (e)
  {
    print('Bạn đã gặp lỗi khi nhập, Xin mời nhập lại');
  }

  }while (tong < 20);
  // in dãy số đó
  print ("Tổng đã vượt quá 20 , Dãy số vừa nhập là: ");
 for (int x in list)
  {
    print (x.toString());
  }

}