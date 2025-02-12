import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:ict_final/core/functions/show_msg.dart';
import 'package:ict_final/features/common/auth_cubit_states.dart';
import 'package:ict_final/features/common/widgets/custom_button.dart';
import 'package:ict_final/features/common/widgets/custom_text_button.dart';
import 'package:ict_final/features/common/widgets/custom_text_form_field.dart';
import 'package:ict_final/features/home_nav/screens/home_nav_screen.dart';
import 'package:ict_final/features/register/register_cubit/register_cubit.dart';

class RegisterScreen extends StatefulWidget {
  const RegisterScreen({super.key});

  @override
  State<RegisterScreen> createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
  GlobalKey<FormState> formKey = GlobalKey<FormState>();
  final TextEditingController nameController = TextEditingController();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => RegisterCubit(),
      child: GestureDetector(
        onTap: () => FocusManager.instance.primaryFocus?.unfocus(),
        child: BlocConsumer<RegisterCubit, AuthStates>(
          listener: (context, state) {
            if (state is RegisterSuccessState) {
              Navigator.pushReplacement(
                context,
                MaterialPageRoute(
                  builder: (context) => BottomNavLayout(),
                ),
              );
            }
            if (state is RegisterErrorState) {
              showMsg(context, state.errMsg);
            }
          },
          builder: (context, state) {
            return BlocBuilder<RegisterCubit, AuthStates>(
              builder: (context, state) {
                RegisterCubit authCubit = context.read<RegisterCubit>();

                return Scaffold(
                  backgroundColor: Colors.white,
                  body: Form(
                    key: formKey,
                    child: state is RegisterLoadingState
                        ? Center(child: CircularProgressIndicator())
                        : SingleChildScrollView(
                            child: Column(
                              children: [
                                Stack(
                                  children: [
                                    Container(
                                      height:
                                          MediaQuery.sizeOf(context).height *
                                              0.3,
                                      width: MediaQuery.sizeOf(context).width,
                                      padding: EdgeInsets.all(16),
                                      decoration: BoxDecoration(
                                          color: Color(0xff152534)),
                                      child: Column(
                                        mainAxisAlignment:
                                            MainAxisAlignment.end,
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          Text(
                                            "Register",
                                            style: TextStyle(
                                              color: Colors.white,
                                              fontSize: 36,
                                              fontWeight: FontWeight.bold,
                                            ),
                                          ),
                                          Text(
                                            "Create Your Account",
                                            style: TextStyle(
                                              color: Colors.white,
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                    Positioned(
                                      top: 45,
                                      left: 10,
                                      child: IconButton(
                                        onPressed: () => Navigator.pop(context),
                                        icon: Icon(
                                          Icons.arrow_back_sharp,
                                          size: 30,
                                          color: Colors.white,
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                                Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: Column(
                                    children: [
                                      SizedBox(
                                        height: 20,
                                      ),
                                      CustomTextForm(
                                        controller: nameController,
                                        labelText: "name",
                                        prefIcon: Icons.person,
                                        keyboardType: TextInputType.name,
                                      ),
                                      SizedBox(
                                        height: 20,
                                      ),
                                      CustomTextForm(
                                        controller: emailController,
                                        labelText: "Email",
                                        prefIcon: Icons.email,
                                        keyboardType:
                                            TextInputType.emailAddress,
                                      ),
                                      SizedBox(
                                        height: 20,
                                      ),
                                      CustomTextForm(
                                        controller: passwordController,
                                        labelText: "password",
                                        prefIcon: Icons.lock,
                                        keyboardType:
                                            TextInputType.visiblePassword,
                                        isHidden: authCubit.isHidden,
                                        suffixIcon: IconButton(
                                            onPressed: () {
                                              authCubit
                                                  .changePasswordVisibility();
                                            },
                                            icon: authCubit.isHidden
                                                ? Icon(Icons.visibility_off)
                                                : Icon(Icons.remove_red_eye)),
                                      ),
                                      SizedBox(
                                        height: 20,
                                      ),
                                      SizedBox(
                                        height: 20,
                                      ),
                                      CustomButton(
                                        onPressed: () {
                                          if (formKey.currentState!
                                              .validate()) {
                                            authCubit.register(
                                              data: {
                                                "email": emailController.text,
                                                "password":
                                                    passwordController.text,
                                                "data": {
                                                  "user_name":
                                                      nameController.text
                                                }
                                              },
                                            );
                                          }
                                        },
                                        text: "Register",
                                      ),
                                      SizedBox(
                                        height: 20,
                                      ),
                                      SizedBox(
                                        height: 30,
                                      ),
                                      Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.center,
                                        children: [
                                          Text("Already have an account?"),
                                          SizedBox(
                                            width: 5,
                                          ),
                                          CustomTextButton(
                                            text: "Login",
                                            onPressed: () =>
                                                Navigator.pop(context),
                                          ),
                                        ],
                                      )
                                    ],
                                  ),
                                ),
                              ],
                            ),
                          ),
                  ),
                );
              },
            );
          },
        ),
      ),
    );
  }

  @override
  void dispose() {
    nameController.dispose();
    emailController.dispose();
    passwordController.dispose();
    super.dispose();
  }
}
