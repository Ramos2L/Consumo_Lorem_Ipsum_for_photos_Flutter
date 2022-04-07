import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:lorem_ipsum_for_photos/cubit/photos_cubit.dart';
import 'package:lorem_ipsum_for_photos/pages/home.dart';
import 'package:lorem_ipsum_for_photos/pages/home_blur.dart';
import 'package:lorem_ipsum_for_photos/pages/home_grey.dart';

class DrawerTile extends StatelessWidget {
  const DrawerTile({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        padding: EdgeInsets.zero,
        children: <Widget>[
          const DrawerHeader(
            decoration: BoxDecoration(
              color: Colors.blue,
            ),
            child: Text('Choose your photo style choice',
              style: TextStyle(fontSize: 20, color: Colors.white),
            ),
          ),        
          ListTile(
            leading: const Icon(Icons.home_outlined, color: Colors.blue),
            title: const Text('Home Photos'),
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) =>
                    BlocProvider<PhotosCubit>(
                      create: (context) => PhotosCubit(), 
                      child: const Home()
                    )
                ),
              );
            }
          ),
          ListTile(
            leading: const Icon(Icons.photo, color: Colors.blue),
            title: const Text('Photos Grey'),
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) =>
                    BlocProvider<PhotosCubit>(
                      create: (context) => PhotosCubit(), 
                      child: const HomeGrey()
                    )
                ),
              );
            }
          ),
          ListTile(
            leading: const Icon(Icons.photo_album, color: Colors.blue),
            title: const Text('Photos Blur'),
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) =>
                    BlocProvider<PhotosCubit>(
                      create: (context) => PhotosCubit(), 
                      child: const HomeBlur()
                    )
                ),
              );
            }
          ),
        
        ],
      ),
    );
  }
}
