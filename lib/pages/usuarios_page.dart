import 'package:chat_app/models/usuario.dart';
import 'package:flutter/material.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';

class UsuariosPage extends StatefulWidget {
  const UsuariosPage({super.key});

  @override
  State<UsuariosPage> createState() => _UsuariosPageState();
}

class _UsuariosPageState extends State<UsuariosPage> {

  final _refreshController = RefreshController(initialLoadStatus: LoadStatus.canLoading);
  
  final usuarios = [
    Usuario(online: true, email: 'maria@gmail.com', nombre: 'Maria', uid: '1'),
    Usuario(online: true, email: 'melisa@gmail.com', nombre: 'Melisa', uid: '2'),
    Usuario(online: false, email: 'alan@gmail.com', nombre: 'Alan', uid: '3'),
  ];

  _loadUsers() async {
    await Future.delayed(const Duration(milliseconds: 1000));
    _refreshController.refreshCompleted();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Mi nombre', style: TextStyle(color: Colors.black54),),
        elevation: 1,
        backgroundColor: Colors.white,
        leading: IconButton(
          onPressed: () {
            
          },
          icon: const Icon(Icons.exit_to_app, color: Colors.black54,)
        ),
        actions: [
          Container(
            margin: const EdgeInsets.only(right: 10),
            // child: Icon(Icons.check_circle, color: Colors.blue[400],),
            child: const Icon(Icons.offline_bolt, color: Colors.red,),
          )
        ],
      ),
      body: SmartRefresher(
        controller: _refreshController,
        enablePullDown: true,
        onRefresh: _loadUsers,
        header: WaterDropHeader(
          complete: Icon(Icons.check, color: Colors.blue[400],),
          waterDropColor: Colors.blue,
        ),
        child: ListViewUsuarios(usuarios: usuarios),
      ),
    );
  }
}

class ListViewUsuarios extends StatelessWidget {
  const ListViewUsuarios({
    super.key,
    required this.usuarios,
  });

  final List<Usuario> usuarios;

  @override
  Widget build(BuildContext context) {
    return ListView.separated(
      physics: const BouncingScrollPhysics(),
      itemBuilder: (context, index) => UsuarioListTile(usuario: usuarios[index]),
      separatorBuilder: (context, index) => const Divider(),
      itemCount: usuarios.length,
    );
  }
}

class UsuarioListTile extends StatelessWidget {
  const UsuarioListTile({
    super.key,
    required this.usuario,
  });

  final Usuario usuario;

  @override
  Widget build(BuildContext context) {
    return ListTile(
      title: Text(usuario.nombre),
      subtitle: Text(usuario.email),
      leading: CircleAvatar(
        backgroundColor: Colors.blue[100],
        child: Text(usuario.nombre.substring(0,2)),
      ),
      trailing: Container(
        width: 10,
        height: 10,
        decoration: BoxDecoration(
          color: usuario.online ? Colors.green[300] : Colors.red,
          borderRadius: BorderRadius.circular(100),
        ),
      ),
    );
  }
}