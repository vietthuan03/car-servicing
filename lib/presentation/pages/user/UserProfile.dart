import 'package:car_servicing/constants.dart';
import 'package:car_servicing/presentation/pages/user/EditUserProfile.dart';
import 'package:car_servicing/presentation/widgets/button_widget.dart';
import 'package:car_servicing/services/auth_service.dart';
import 'package:flutter/material.dart';

class UserProfile extends StatefulWidget {
  const UserProfile({super.key});
  static const String id = 'user_profile_screen';

 @override
  _UserProfileState createState() => _UserProfileState();
}
class _UserProfileState extends  State<UserProfile>  {
  final _auth = AuthService();

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
          backgroundColor: kBackgroundColor,
          appBar: AppBar(
            backgroundColor:kAppBarColor,
            leading: IconButton(
                icon: const Icon(Icons.arrow_back),
                onPressed: () {
                  // print("click arrow back");
                },
              ),
              title: const Text('Profile'),
            ),
          body: SingleChildScrollView(
            child: Container(
              margin: const EdgeInsets.all(16),
              child: SafeArea(
                child: 
                Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const SizedBox(height: 16),
                     const CircleAvatar(
                      radius: 50,
                      backgroundImage: AssetImage('images/dao.jpg'),
                    ),
                    const SizedBox(height: 16),
                     const Text('DaoTq',style: TextStyle(fontFamily: '',fontSize: 24,color: kTextColor, fontWeight: FontWeight.bold)),
                     const SizedBox(
                      height: 24,
                      width: 160,
                      child: Divider(color: kTextColor,),
                    ),
                    const SizedBox(height: 16),
                    buildInfoCard(icon: Icons.email,text:"truongquangdao102@gmail.com"),
                    const SizedBox(height: 16),
                    buildInfoCard(icon: Icons.phone,text:"+84 343 600 292"),
                    const SizedBox(height: 16),
                    buildInfoCard(icon: Icons.house,text:"Phu Thien, Gia Lai"),
                    const SizedBox(height: 16),
                CustomButton(label: "EDIT PROFILE",onPressed: (){
                  Navigator.pushNamed(context, EditUserProfile.id);
                },),
                const SizedBox(height: 16,),
                  ],
                )
              ),
            ),
          ),
          
        ),
        // debugShowCheckedModeBanner: false,
    );
     
  }
  
 Widget buildInfoCard({required IconData icon,required String text}) {
  return Card(
    color: Colors.white,
      // margin: const EdgeInsets.all(16),
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: ListTile(
          leading: Icon(icon, size: 24, color: Colors.black),
          title: Text(
            text,
            overflow: TextOverflow.fade,
            maxLines: 1,
            softWrap: false,
            style: const TextStyle(
                color: kTextColor, fontFamily: 'Arial', fontSize: 22 ),
          ))));
 }


}

