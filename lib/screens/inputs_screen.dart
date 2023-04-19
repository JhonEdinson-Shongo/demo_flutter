import 'package:flutter/material.dart';
import 'package:flutter_application_1/widgets/widgets.dart';

class InputsScreen extends StatelessWidget {
  const InputsScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final GlobalKey<FormState> myFormKey = GlobalKey<FormState>();

    final Map<String, String> formValues = {
      'nombre': '',
      'apellido': '',
      'email': '',
      'password': '',
      'rol': '',
    };

    return Scaffold(
      appBar: AppBar(
        title: Text('Inputs y forms'),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.symmetric(
            horizontal: 20,
            vertical: 10,
          ),
          child: Form(
            key: myFormKey,
            child: Column(
              children: [
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: CustomInputWidget(
                    labelText: 'Nombres',
                    hintText: 'Nombres de usuario',
                    iconR: Icons.supervised_user_circle_outlined,
                    formProperty: 'nombre',
                    formValues: formValues,
                  ),
                ),
                SizedBox(height: 20),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: CustomInputWidget(
                    labelText: 'Apellidos',
                    hintText: 'Apellidos de usuario',
                    iconR: Icons.supervised_user_circle_outlined,
                    formProperty: 'apellido',
                    formValues: formValues,
                  ),
                ),
                SizedBox(height: 20),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: CustomInputWidget(
                    labelText: 'Correo',
                    hintText: 'Correo de usuario',
                    iconR: Icons.mark_email_unread_outlined,
                    inputType: TextInputType.emailAddress,
                    formProperty: 'email',
                    formValues: formValues,
                  ),
                ),
                SizedBox(height: 20),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: CustomInputWidget(
                    labelText: 'Contraseña',
                    iconR: Icons.password,
                    formProperty: 'password',
                    formValues: formValues,
                    obscureText: true,
                  ),
                ),
                SizedBox(height: 20),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: DropdownButtonFormField<String>(
                    items: [
                      DropdownMenuItem(
                        value: 'admin',
                        child: Text('Admin'),
                      ),
                      DropdownMenuItem(
                        value: 'user',
                        child: Text('Usuario'),
                      ),
                      DropdownMenuItem(
                        value: 'client',
                        child: Text('Cliente'),
                      ),
                      DropdownMenuItem(
                        value: 'employee',
                        child: Text('Empleado'),
                      ),
                    ],
                    onChanged: (value) {
                      print(value);
                      formValues['role'] = value ?? 'admin';
                    },
                  ),
                ),
                SizedBox(height: 30),
                ElevatedButton(
                  onPressed: () {
                    FocusScope.of(context).requestFocus(FocusNode());

                    if (!myFormKey.currentState!.validate()) {
                      print('Formulario no valido!');
                      return;
                    }
                    //TODO: imprimir valores de formulario.
                    print(formValues);
                  },
                  child: SizedBox(
                    width: double.infinity,
                    child: Center(child: Text('Guardar')),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
