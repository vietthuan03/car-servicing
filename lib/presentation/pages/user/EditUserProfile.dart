import 'package:car_servicing/constants.dart';
import 'package:car_servicing/presentation/pages/user/UserProfile.dart';
import 'package:car_servicing/presentation/widgets/button_widget.dart';
import 'package:flutter/material.dart';

class EditUserProfile extends StatefulWidget {
  const EditUserProfile({super.key});
  static const String id = 'edit_user_profile_screen';



 @override
  _EditUserProfileState createState() => _EditUserProfileState();
}
class _EditUserProfileState extends  State<EditUserProfile>  {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
          backgroundColor: kBackgroundColor,
          appBar: AppBar(
            backgroundColor: kAppBarColor,
            leading: IconButton(
                icon: const Icon(Icons.arrow_back),
                onPressed: () {
                  Navigator.pushNamed(context, UserProfile.id);
                },
              ),
              title: const Text('Edit Profile'),
            ),
          body: SingleChildScrollView(
            child: Container(
              margin: const EdgeInsets.all(16),
              child: SafeArea(
                child: 
                Column(
                  // mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    const SizedBox(height: 16),
                     const CircleAvatar(
                      radius: 50,
                      backgroundImage: AssetImage('images/dao.jpg'),
                    ),
                     const SizedBox(height: 16),
                    buildProfileField(
                      label: "Name",
                      hintText: 'Daotq',
                      onChanged: (value) {
                        // Handle name input change
                      },
                    ),
                    buildProfileField(
                      label: "Email",
                      hintText: 'truongquangdao102@gmail.com',
                      onChanged: (value) {
                        // Handle email input change
                      },
                    ),
                    buildProfileField(
                      label: "Phone number",
                      hintText: '+84 343 600 292',
                      onChanged: (value) {
                        // Handle phone input change
                      },
                    ),
                    buildProfileField(
                      label: "Address",
                      hintText: 'Phu Thien, Gia Lai',
                      onChanged: (value) {
                        // Handle address input change
                      },
                      ),
                    const SizedBox(height: 16),
                    CustomButton(label: "SAVE",onPressed: (){
                      // Navigator.pushNamed(context, EditUserProfile.id);
                    },)
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

  // Reusable widget for profile input fields
  Widget buildProfileField({
    required String label,
    required String hintText,
    required Function(String) onChanged,
  }) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          label,
          style: const TextStyle(
            color: kTextColor,
            fontSize: 22,
            fontWeight: FontWeight.bold,
          ),
        ),
        const SizedBox(height: 8),
        SizedBox(
          height: 60,
          child: TextField(
            onChanged: onChanged,
            decoration: kTextFieldDecoration.copyWith(hintText: hintText),
          ),
        ),
        const SizedBox(height: 8),
      ],
    );
  }
