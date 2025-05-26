import 'package:flutter/material.dart';
import 'package:flutter_project/providers/favortie_provider.dart';
import 'package:flutter_project/widgets/product_card.dart';
import 'package:flutter_slidable/flutter_slidable.dart';

class Favorite extends StatefulWidget {
  const Favorite({super.key});

  @override
  State<Favorite> createState() => _FavoriteState();
}

class _FavoriteState extends State<Favorite> {
  @override
  Widget build(BuildContext context) {
    final provider = FavortieProvider.of(context);
    final favList = provider.getFavortie;
    return Scaffold(
      body: Center(
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(20.0),
              child: Row(
                children: [
                  Text(
                    'Favorite',
                    style: TextStyle(fontSize: 27, fontWeight: FontWeight.bold),
                  ),
                ],
              ),
            ),
            Expanded(
              child: ListView.builder(
                itemCount: favList.length,
                itemBuilder:
                    (context, index) => Padding(
                      padding: const EdgeInsets.all(13.0),
                      child: Slidable(
                        endActionPane: ActionPane(
                          motion: ScrollMotion(),
                          children: [
                            SlidableAction(
                              onPressed: (context) {
                                favList.removeAt(index);
                                setState(() {});
                              },
                              backgroundColor: Colors.red,
                              foregroundColor: Colors.white,
                              label: 'Delete',
                              icon: Icons.delete,
                            ),
                          ],
                        ),
                        child: ListTile(
                          tileColor: Colors.white,
                          title: Text(
                            favList[index].name,
                            style: TextStyle(
                              fontSize: 20,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          subtitle: Text(
                            favList[index].description,
                            overflow: TextOverflow.ellipsis,
                          ),
                          leading: CircleAvatar(
                            radius: 30,
                            backgroundImage: AssetImage(favList[index].image),
                          ),
                          trailing: Text(
                            "\$ ${favList[index].price}",
                            style: TextStyle(
                              fontSize: 20,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                      ),
                    ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
