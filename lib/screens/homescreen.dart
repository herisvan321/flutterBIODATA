import 'package:flutter/material.dart';

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final _formKey = GlobalKey<FormState>();
  TextEditingController _nama_depan = new TextEditingController();
  TextEditingController _nama_belakang = new TextEditingController();
  TextEditingController _tmp_lahir = new TextEditingController();
  TextEditingController _tgl_lahir = new TextEditingController();
  TextEditingController _matkul = new TextEditingController();
  TextEditingController _nilai = new TextEditingController();
  TextEditingController _nohp = new TextEditingController();
  TextEditingController _alamat = new TextEditingController();

  void simpan(){

    setState(() {
      var nilai = int.parse(_nilai.text);
      var nilaiHuruf = "";

      if(nilai > 80){
        nilaiHuruf = "A";
      }
      showDialog(context: context, builder: (context){
        return AlertDialog(
          title: Text(
                  "========Biodata========\n" +
                  "Nama : " + _nama_depan.text +" "+_nama_belakang.text + "\n" +
                  "Tempat/Tanggal lahir : " + _tmp_lahir.text +"/"+ _tgl_lahir.text + "\n" +
                  "Matakuliah saat Ini : " + _matkul.text +"\n"+
                  "Nilai : " + _nilai.text +"\n"+
                  "Nilai Huruf : " + nilaiHuruf +"\n"+
                  "Nomor Hp : " + _nohp.text +"\n"+
                  "Alamat : " + _alamat.text
          ),
          actions: [
            TextButton(
                onPressed: (){
                  Navigator.of(context).pop(context);
                },
                child: Text(
                    "Yes"
                )
            )
          ],
        );
      });
    });
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Biodata Mahasiswa"
        ),
      ),
      body: ListView(
        padding: EdgeInsets.all(10),
        children: [
          Form(
            key: _formKey,
            child: Column(
              children: [
                Container(
                  padding: EdgeInsets.only(top: 10),
                  child: Text(
                    "Biodata Mahasiswa",
                    style: TextStyle(
                      fontSize: 20,
                      color: Colors.red,
                      fontWeight: FontWeight.bold
                    ),
                  ),
                ),
                Container(
                  padding: EdgeInsets.only(top: 10),
                  child: TextFormField(
                    controller: _nama_depan,
                    decoration: InputDecoration(
                      border: OutlineInputBorder(),
                      hintText: "Enter Nama Depan",
                      labelText: "Nama Depan"
                    ),
                    validator: (value){
                      if(value.isEmpty){
                        return "Nama depan tidak boleh kosong";
                      }
                      return null;
                    },
                  ),
                ),
                Container(
                  padding: EdgeInsets.only(top:10),
                  child: TextFormField(
                    controller: _nama_belakang,
                    decoration: InputDecoration(
                      labelText: "Nama Belakang",
                      hintText: "Enter Nama Belakang",
                      border: OutlineInputBorder()
                    ),
                    validator: (value){
                      if(value.isEmpty){
                        return "Nama belakang tidak boleh kosong";
                      }
                      return null;
                    },
                  ),
                ),
                Container(
                  padding: EdgeInsets.only(top:10),
                  child: TextFormField(
                    controller: _tmp_lahir,
                    decoration: InputDecoration(
                        labelText: "Tempat Lahir",
                        hintText: "Enter Tempat Lahir",
                        border: OutlineInputBorder()
                    ),
                    validator: (value){
                      if(value.isEmpty){
                        return "Tempat lahir tidak boleh kosong";
                      }
                      return null;
                    },
                  ),
                ),
                Container(
                  padding: EdgeInsets.only(top:10),
                  child: TextFormField(
                    controller: _tgl_lahir,
                    decoration: InputDecoration(
                        labelText: "Tanggal Lahir",
                        hintText: "Enter Tanggal Lahir",
                        border: OutlineInputBorder()
                    ),
                    validator: (value){
                      if(value.isEmpty){
                        return "Tanggal lahir tidak boleh kosong";
                      }
                      return null;
                    },
                  ),
                ),
                Container(
                  padding: EdgeInsets.only(top:10),
                  child: TextFormField(
                    controller: _matkul,
                    decoration: InputDecoration(
                        labelText: "Mata kuliah saat ini",
                        hintText: "Enter Mata kuliah saat ini",
                        border: OutlineInputBorder()
                    ),
                    validator: (value){
                      if(value.isEmpty){
                        return "Mata kuliah saat ini tidak boleh kosong";
                      }
                      return null;
                    },
                  ),
                ),
                Container(
                  padding: EdgeInsets.only(top:10),
                  child: TextFormField(
                    controller: _nilai,
                    keyboardType: TextInputType.number,
                    decoration: InputDecoration(
                        labelText: "Nilai ",
                        hintText: "Enter Nilai",
                        border: OutlineInputBorder()
                    ),
                    validator: (value){
                      if(value.isEmpty){
                        return "Nilai tidak boleh kosong";
                      }
                      return null;
                    },
                  ),
                ),
                Container(
                  padding: EdgeInsets.only(top:10),
                  child: TextFormField(
                    controller: _nohp,
                    keyboardType: TextInputType.number,
                    decoration: InputDecoration(
                        labelText: "Nomor Hp",
                        hintText: "Enter Nomor Hp",
                        border: OutlineInputBorder()
                    ),
                    validator: (value){
                      if(value.isEmpty){
                        return "Nomor Hp tidak boleh kosong";
                      }
                      return null;
                    },
                  ),
                ),
                Container(
                  padding: EdgeInsets.only(top:10),
                  child: TextFormField(
                    controller: _alamat,
                    keyboardType: TextInputType.multiline,
                    textInputAction: TextInputAction.newline,
                    minLines: 1,
                    maxLines: 5,
                    decoration: InputDecoration(
                        labelText: "Alamat",
                        hintText: "Enter Alamat",
                        border: OutlineInputBorder()
                    ),
                    validator: (value){
                      if(value.isEmpty){
                        return "Alamat tidak boleh kosong";
                      }
                      return null;
                    },
                  ),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    MaterialButton(
                        child: Text(
                          "Simpan",
                          style: TextStyle(
                            color: Colors.white
                          ),
                        ),
                        color: Colors.red,
                        onPressed: (){
                          if(_formKey.currentState.validate()){

                          }
                          simpan();
                        }
                    )
                  ],
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}
