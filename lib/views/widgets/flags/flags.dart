import 'package:country_calling_code_picker/picker.dart';
import 'package:flutter/material.dart';

class flags extends StatefulWidget {
  @override
  _flagsState createState() => _flagsState();
}

class _flagsState extends State<flags> {
  Country? _selectedCountry;
  @override
  void initState() {
    initCountry();
    super.initState();
  }

  void initCountry() async {
    final country = await getDefaultCountry(context);
    setState(() {
      _selectedCountry = country;
    });
  }

  @override
  Widget build(BuildContext context) {
    final country = _selectedCountry;
    return Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            country == null
                ? Container()
                : Column(
              children: <Widget>[
                IconButton(
                  icon: Image.asset(
                    country.flag,
                    package: countryCodePackageName,
                    width: 100,
                  ),
                  iconSize: 34,
                  onPressed:_onPressedShowDialog,
                ),

                // SizedBox(
                //   height: 0,
                // ),
                // Padding(
                //   padding: const EdgeInsets.only(left: 3.0),
                //   child: Text(
                //     ' ${country.name} (${country.countryCode})',
                //     textAlign: TextAlign.center,
                //     style: TextStyle(fontSize: 13),
                //   ),
                // ),
              ],
            ),
            // SizedBox(
            //   height: 100,
            // ),
            // MaterialButton(
            //   child: Text('Select Country using dialog'),
            //   color: Colors.deepOrangeAccent,
            //   onPressed: _onPressedShowDialog,
            // ),
          ],
        ),
      );

  }
  void _onPressed() async {
    final country =
    await Navigator.push(context, new MaterialPageRoute(builder: (context) {
      return PickerPage();
    }));
    if (country != null) {
      setState(() {
        _selectedCountry = country;
      });
    }
  }
  void _onPressedShowDialog() async {
    final country = await showCountryPickerDialog(
      context,
    );
    if (country != null) {
      setState(() {
        _selectedCountry = country;
      });
    }
  }
  void _onPressedShowBottomSheet() async {
    final country = await showCountryPickerSheet(
      context,
    );
    if (country != null) {
      setState(() {
        _selectedCountry = country;
      });
    }
  }

}


class PickerPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Select Country'),
      ),
      body: Container(
        child: CountryPickerWidget(
          onSelected: (country) => Navigator.pop(context, country),
        ),
      ),
    );
  }
}


