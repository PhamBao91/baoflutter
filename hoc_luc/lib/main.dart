import 'package:flutter/material.dart';

void main () => runApp(MyApp());

class MyApp extends StatefulWidget{

  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return _MyAppState();
  }
}

class _MyAppState extends State<MyApp>
{
  Map<String, double> mapDiem = Map();
  String ketLuan = "Học lực";
  String diemTrungBinh= "Điểm trung bình";


  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text("Kiểm Tra Học Lực"),
        ),
        body: Center(
            child: Container (
              color: Colors.lightBlue,
              height: 300,
              width: 400,
              child: Column(
                children: <Widget>[
                  Expanded (
                   child: nhapDiem('Điểm Toán'),
                  ),
                  Expanded (
                    child: nhapDiem('Điểm Văn'),
                  ),
                  Expanded (
                    child: nhapDiem('Điểm Tiếng Anh'),
                  ),
                  SizedBox(height: 20,),
                  Expanded (
                    child: hienThiKetQua("Điểm Trung Bình", diemTrungBinh),
                  ),

                  //SizedBox(height: 20,),
                  Expanded (
                    child:  hienThiKetQua("Kết Luận", ketLuan),
                  ),

                 //SizedBox(height: 20,),
                  Expanded (
                    child:  buttonKetLuan()
                  ),
                  SizedBox(height: 20,),


                ],
              ),
            )
        ),
      ),
    );
  }

  Widget hienThiKetQua(String loaiKetQua, String ketQua)
  {
    return SizedBox(
      width: 400,
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Text(loaiKetQua + " : "),
          Text(ketQua)
        ],
      ),
    );



  }

  Widget nhapDiem(String tenMonHoc)
  {
    return Container(
      width: 300,

      child: Row(
        children: <Widget>[
          Expanded(
            child: Text(tenMonHoc + " : ",
            style: TextStyle(
              color: Colors.white
            ),),
          ),

          Expanded(
            child: TextField(
              maxLines: 1,
              style: TextStyle(
                color: Colors.white
              ),
              autofocus: true,
              decoration: new InputDecoration.collapsed(
                hintText: tenMonHoc,
                ),
              onChanged: (value)
              {
                setState(() {
                  mapDiem[tenMonHoc] = double.parse(value);
                });
              },
            )
          )
        ],
      ),
    );
  }



  String ketLuanHocLuc(String diemTB)
  {
    double diem = double.parse(diemTB);
    if (diem < 5) return "Học lực yếu !";
    else if(diem< 6.5) return "Học lực Trung Bình !";
    else if (diem < 8.5) return "Học lực Khá !";
    else return "Học lực Giỏi !";

  }

  Widget buttonKetLuan()
  {

        return SizedBox(

          width: 200,
          child: RaisedButton(
            color: Colors.redAccent,
              child: Text("Kết luận",
              style: TextStyle(
                color: Colors.white
              ),
              ),
              onPressed:  () {
                if ((mapDiem["Điểm Toán"] != null) &&
                    (mapDiem["Điểm Văn"] != null) &&
                    (mapDiem["Điểm Tiếng Anh"] != null)) {
                  setState(() {
                    var diemTB =  ((mapDiem["Điểm Toán"] + mapDiem["Điểm Văn"] +
                            mapDiem["Điểm Tiếng Anh"]) / 3);
                    // làm tròn điểm
                    this.diemTrungBinh = ((diemTB * 100).round()/ 100).toString();
                    this.ketLuan = ketLuanHocLuc(diemTrungBinh);
                  });
                }
              }

          ),
        );


}


}