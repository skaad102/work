// ******
// Home()-> friends()
// Vista donde el usuario verá la lista de amigos o contactos
// ******
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:graphql_flutter/graphql_flutter.dart';

class FriendsPage extends StatefulWidget {
  @override
  _FriendsPageState createState() => _FriendsPageState();
}

class _FriendsPageState extends State<FriendsPage> {
  @override
  Widget build(BuildContext context) {
    final HttpLink uri = HttpLink(
      'https://graphqlzero.almansi.me/api',
    );

    final getPerson = """
      query user{
        users{
          data{
            id
            name
            email
            albums(options:{
              paginate:{
                limit : 1
                page: 1
              }
            }){
              data{
                title
              }
            }
          }
        }
      }
    """;

    ValueNotifier<GraphQLClient> client = ValueNotifier(
      GraphQLClient(
        link: uri,
        cache: GraphQLCache(store: HiveStore()),
      ),
    );

    return GraphQLProvider(
      client: client,
      child: Column(
        children: [
          _titulo(context),
          Expanded(
            child: Query(
                options: QueryOptions(
                  document: gql(getPerson),
                  // pollInterval: Duration(seconds: 10),
                ),
                builder: (QueryResult result,
                    {VoidCallback refetch, FetchMore fetchMore}) {
                  // errores
                  if (result.hasException) {
                    return Text(result.exception.toString());
                  }
                  // cargando
                  if (result.isLoading) {
                    return Center(child: CircularProgressIndicator());
                  }
                  // ok
                  List personas = result.data["users"]["data"];
                  return _personas(context, personas);
                }),
          )
        ],
      ),
    );
  }

  Widget _titulo(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 30, vertical: 25),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          fontfuntion(context, 'Contactos', Colors.black, 22, FontWeight.bold),
        ],
      ),
    );
  }

  Widget _personas(BuildContext context, List personas) {
    return Scrollbar(
      thickness: 8,
      isAlwaysShown: true,
      child: ListView.builder(
        itemCount: personas.length,
        itemBuilder: (_, i) {
          final persona = personas[i];
          return _persona(context, persona);
        },
      ),
    );
  }

  Widget _persona(BuildContext context, dynamic persona) {
    // leading imagen
    final image = Container(
      decoration: BoxDecoration(borderRadius: BorderRadius.circular(30)),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(10),
        child: FadeInImage(
          image: NetworkImage(
              'https://r1.abcimg.es/resizer/resizer.php?imagen=https%3A%2F%2Fstatic2.abc.es%2Fmedia%2Fseries%2F000%2F002%2F515%2Fjorge-el-curioso-2.jpg&nuevoancho=620&medio=abc'),
          fit: BoxFit.none,
          fadeInDuration: Duration(milliseconds: 300),
          // height: 1000,
          fadeInCurve: Curves.bounceIn,
          placeholder: AssetImage('assets/loading.gif'),
        ),
      ),
    );

    // nombre de la persona
    final nombre = fontfuntion(
        context, persona['name'], Colors.black, 15, FontWeight.bold);
    final subtitulo = fontfuntion(
        context, persona['email'], Colors.black54, 12, FontWeight.normal);

    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20),
        color: Color.fromRGBO(255, 244, 214, 0.9),
        boxShadow: [
          BoxShadow(blurRadius: 5, spreadRadius: 1.5, color: Colors.black12)
        ],
      ),
      margin: EdgeInsets.symmetric(vertical: 10, horizontal: 20),
      child: ListTile(
        leading: image,
        title: nombre,
        subtitle: subtitulo,
        trailing: Icon(
          Icons.arrow_forward_ios,
          color: Color.fromRGBO(254, 221, 124, 1),
          size: 30,
        ),
        onTap: () => {},
      ),
    );
  }

  Widget fontfuntion(BuildContext context, String txt, Color color, double tam,
      FontWeight fontWeight) {
    return Text(
      txt,
      style: GoogleFonts.montserrat(
        textStyle: Theme.of(context).textTheme.headline4,
        fontSize: tam,
        fontWeight: fontWeight,
        fontStyle: FontStyle.normal,
        color: color,
      ),
      textAlign: TextAlign.start,
    );
  }
}
