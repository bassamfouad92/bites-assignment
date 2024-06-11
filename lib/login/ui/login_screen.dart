import 'package:bites_assignment/common/helper/assets_helper.dart';
import 'package:bites_assignment/common/theme/app_styles.dart';
import 'package:bites_assignment/common/theme/theme.dart';
import 'package:bites_assignment/common/widgets/textfield/textfield_widget.dart';
import 'package:bites_assignment/login/di/login_provider.dart';
import 'package:bites_assignment/login/router/login_router.dart';
import 'package:bites_assignment/login/ui/login_state.dart';
import 'package:bites_assignment/login/ui/login_view_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class LoginScreen extends ConsumerStatefulWidget {
  // ignore: use_key_in_widget_constructors
  const LoginScreen();

  @override
  ConsumerState<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends ConsumerState<LoginScreen> {
  late TextEditingController emailController = TextEditingController();
  late TextEditingController passwordController = TextEditingController();
  final loginRouter = LoginRouter();
  var hidePassword = true;

  @override
  void dispose() {
    super.dispose();
    emailController.dispose();
    passwordController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final loginState = ref.watch(loginViewModelProvider);
    final loginViewModelNotifier = ref.read(loginViewModelProvider.notifier);

    return Scaffold(
        body: SingleChildScrollView(
      child: Container(
        decoration: const BoxDecoration(gradient: gradientBackgroundLogin),
        padding: const EdgeInsets.all(24.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.end,
          children: <Widget>[
            const SizedBox(height: 94),
            Center(
                child: Image.asset(
              AssetsHelper.bitesLogo, // Adjust the path to your logo image
              height: 150.0,
            )),
            Insets.gapH60,
            _buildGoogleSignInButton(context),
            Insets.gapH16,
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Expanded(child: Container(height: 0.5, color: kGreyColor)),
                const Padding(
                  padding: EdgeInsets.symmetric(horizontal: 16.0),
                  child: Text('أو'),
                ),
                Expanded(child: Container(height: 0.5, color: kGreyColor)),
              ],
            ),
            Insets.gapH16,
            _buildEmailTextField(loginViewModelNotifier),
            Insets.gapH10,
            _buildPasswordTextField(loginViewModelNotifier),
            Insets.gapH16,
            GestureDetector(
              child: Text(
                'نسيت كلمة المرور؟',
                style: Textify.heading3(context).copyWith(color: kPrimaryColor),
              ),
            ),
            Insets.gapH30,
            _buildLoginButton(context, loginState, loginViewModelNotifier),
            Insets.gapH15,
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              textDirection: TextDirection.rtl, // Set text direction to RTL
              children: [
                const Text('ليس لديك حساب؟',
                    style: TextStyle(color: kGreyColor)),
                const SizedBox(
                  width: 5,
                ),
                InkWell(
                  child: Text(
                    'إنشاء حساب',
                    style: Textify.heading2(context).copyWith(
                        color: kPrimaryColor,
                        fontWeight: FontWeight.bold,
                        decoration: TextDecoration.underline),
                  ),
                )
              ],
            ),
          ],
        ),
      ),
    ));
  }

  Widget _buildGoogleSignInButton(BuildContext context) {
    return Card(
      elevation: 2.5,
      color: Colors.white,
      shadowColor: kShadowGrey,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(12.0),
      ),
      child: InkWell(
        onTap: () {
          // Handle Google sign-in action
        },
        child: Container(
          height: 50,
          padding: const EdgeInsets.all(10.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Image.asset(
                AssetsHelper
                    .googleLogo, // Adjust the path to your Google logo image
                height: 24.0,
              ),
              const SizedBox(width: 10.0),
              Text(
                'استخدام ',
                style: Textify.heading3(context),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildEmailTextField(LoginViewModel viewModel) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.end,
      children: [
        Text('البريد الإلكتروني',
            style: Textify.heading3(context).copyWith(color: kGreyColor)),
        Insets.gapH5,
        BitesTextField(
            myKey: const Key("signInEmailField"),
            controller: emailController,
            onTextChanged: (email) => viewModel.inputEmail(email))
      ],
    );
  }

  Widget _buildPasswordTextField(LoginViewModel viewModel) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.end,
      children: [
        Text('كلمة المرور',
            style: Textify.heading3(context).copyWith(color: kGreyColor)),
        Insets.gapH5,
        BitesTextField(
            myKey: const Key("signInPasswordField"),
            controller: passwordController,
            showPassword: hidePassword,
            onTextChanged: (password) => viewModel.inputPassword(password),
            rightIcon: GestureDetector(
              key: const Key("showHidePasswordButton"),
              onTap: () {
                setState(() {
                  hidePassword = !hidePassword;
                });
              },
              child: Icon(hidePassword
                  ? Icons.visibility_off_outlined
                  : Icons.visibility_outlined),
            ))
      ],
    );
  }

  Widget _buildLoginButton(
      BuildContext context, LoginState state, LoginViewModel viewModel) {
    return SizedBox(
        width: UiUtils.getScreenWidth(context),
        height: 54,
        child: MaterialButton(
          key: const Key('signInSaveButton'),
          onPressed: () async {
            if (!state.canSubmit) {
              return;
            }
            EasyLoading.show(
                status: 'Loading..',
                maskType: EasyLoadingMaskType.black,
                dismissOnTap: false);
            await viewModel.loginUser().then((state) {
              if (state.state == LoginConcreteState.loaded) {
                EasyLoading.dismiss();
                loginRouter.routeTo(LoginRoutes.home, context);
              } else {
                EasyLoading.showError('Invalid login credentials');
              }
            });
          },
          child: Text(
            'تسجيل الدخول',
            style: Textify.heading1(context).copyWith(color: Colors.white),
          ),
          color:
              state.canSubmit ? kPrimaryColor : kPrimaryColor.withOpacity(0.6),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(12.0),
          ),
        ));
  }
}
