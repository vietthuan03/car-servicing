import 'package:car_servicing/constants.dart';
import 'package:car_servicing/presentation/widgets/button_widget.dart';
import 'package:car_servicing/services/auth_service.dart';
import 'package:car_servicing/viewModel/Auth_viewmodel.dart';
import 'package:flutter/material.dart';

class Settings extends StatefulWidget {
  const Settings({super.key});
  static const String id = 'setting_screen';

  @override
  State<Settings> createState() => _SettingsState();
}

class _SettingsState extends State<Settings> {
  final validation = UserAuthenticationViewmodel();
  final _auth = AuthService();
  @override
  Widget build(BuildContext context) {
    return  SafeArea(
        child: Scaffold(
          backgroundColor: kBackgroundColor,
          appBar: AppBar(
            backgroundColor: kAppBarColor,
            leading: IconButton(
                icon: const Icon(Icons.arrow_back),
                onPressed: () {
                  // Navigator.pushNamed(context, DetailsCarScreen.id);
                },
              ),
              title: const Text('Settings'),
            ),
          body: SingleChildScrollView(
            child: Container(
              margin: const EdgeInsets.all(16),
              child: SafeArea(
                child: 
                Column(
                  // mainAxisAlignment: MainAxisAlignment.start,
                  // mainAxisSize: MainAxisSize.max,
                  children: [
                     buildFieldRow(icon: Icons.privacy_tip,text: "Privacy Poilicy"),
                     const SizedBox(height: 16,),
                    buildFieldRow(icon: Icons.notifications_active,text: "Notification Settings"),
                     const SizedBox(height: 16,),
                     buildFieldRow(icon: Icons.draw,text: "App Theme"),
                     const SizedBox(height: 16,),
                    buildFieldRow(icon: Icons.note_alt_outlined,text: "Feedback"),
                     const SizedBox(height: 16,),
                    buildFieldRow(icon: Icons.delete_forever,text: "Delete Account"),
                     const SizedBox(height: 16,),
                     CustomButton(
                      label: "Sign Out",
                      onPressed: () async{
                        await _auth.signout();
                        validation.goToHome(context);
                      },
                    )
                  ],
                )
              ),
            ),
          ),
          
        ),
        // debugShowCheckedModeBanner: false,
    );
     
  }
  
  
  
}

  Widget buildFieldRow({required IconData icon,required String text}) {
  return Container(
    padding:  const EdgeInsets.all(8),
    decoration: const BoxDecoration(
      border: Border(
        bottom: BorderSide(
          color: kTextColor,
          width: 1
        )
      )
    ),
    width: double.maxFinite,
    child: SizedBox(
      height: 40,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Icon(icon),
          Padding(padding: const EdgeInsets.only(left: 8),
          child: Text(text,style: const TextStyle(
                  color: kTextColor,  fontSize: 16)),),
          const Spacer(),
          const Icon(Icons.arrow_forward_ios)
        ],
      ),
    ),
  );
 }