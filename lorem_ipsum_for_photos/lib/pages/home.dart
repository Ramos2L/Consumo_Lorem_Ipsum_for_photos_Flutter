import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:lorem_ipsum_for_photos/cubit/photos_cubit.dart';

class Home extends StatelessWidget {
  const Home({ Key? key }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(  
        title: const Text('Lorem Ipsum for Photos'),
      ),
      body: Container(
        padding: const EdgeInsets.all(20),
        alignment: Alignment.center,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Resposta(),
            const SizedBox( height: 10,),
            ElevatedButton(
              onPressed: () {
                final randomPhotos = context.read<PhotosCubit>();
                randomPhotos.photosRandom();
              }, 
              child: const Text('Next'),
              style: ElevatedButton.styleFrom(
                primary: Colors.blue,
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class Resposta extends StatelessWidget {
  const Resposta({ Key? key }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<PhotosCubit, PhotosState>(
      builder: (context, state) {
        if ( state is PhotosSucess ){
          return Expanded(child: Center(child: Image.network(state.data)),);
        }
        if ( state is PhotosLoaded ){
          return const Expanded(child: Center( child: CircularProgressIndicator.adaptive(),));
        }
        if ( state is PhotosError ){
          return Text(state.message);
        }
        return const Text('...');
      },
    );
  }
}