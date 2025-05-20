import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:formz/formz.dart';
import 'package:movie_app/app_core/app_core.dart';
import 'package:movie_app/features/login/cubit/login_cubit.dart';
import 'package:movie_app/features/login/widgets/widgets.dart';
import 'package:movie_app/features/sign_up/views/sign_up_page.dart';
import 'package:movie_app/shared/shared.dart';

/// @title LoginForm
/// @description This widget is used to display the login form.
/// It contains the email and password input fields, as well as the login
/// button.
/// It uses the LoginCubit to manage the login state and the
/// AuthenticationRepository to authenticate the user.
class LoginForm extends StatelessWidget {
  /// Creates an instance of [LoginForm].
  const LoginForm({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocListener<LoginCubit, LoginState>(
      listener: (context, state) {
        if (state.status.isFailure) {
          ScaffoldMessenger.of(context)
            ..hideCurrentSnackBar()
            ..showSnackBar(
              SnackBar(
                content: Text(state.errorMessage ?? 'Authentication Failure'),
              ),
            );
        }
      },
      child: SafeArea(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: AppDimens.p10),
          child: Column(
            children: [
              _LoginHeader(),
              Expanded(
                child: SingleChildScrollView(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      SizedBox(
                        height: context.sizeHeight * 0.8,
                        child: Column(
                          children: [
                            const SizedBox(height: 40),
                            _PageTitle(),
                            const SizedBox(height: 20),
                            _EmailInput(),
                            const SizedBox(height: 20),
                            _PasswordInput(),
                            const SizedBox(height: 5),
                            _ForgotPasswordButton(),
                            const SizedBox(height: 30),
                            _LoginButton(),
                            const SizedBox(height: 20),
                            _OrDivider(),
                            const SizedBox(height: 20),
                            _OtherLoginOptions(),
                          ],
                        ),
                      ),
                      _SignUpTextAndButton(),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class _LoginHeader extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return const Row(
      mainAxisAlignment: MainAxisAlignment.end,
      children: [
        TextButtonWidget(
          text: 'Skip',
        ),
      ],
    );
  }
}

class _PageTitle extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Text(
          'Sign In',
          style: AppTextStyles.bodySmall.copyWith(
            fontSize: AppDimens.p26,
            fontWeight: FontWeight.w600,
            color: AppColors.white,
          ),
        ),
      ],
    );
  }
}

class _ForgotPasswordButton extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.end,
      children: [
        TextButton(
          key: const Key('loginForm_forgotPassword_flatButton'),
          onPressed: () {},
          child: Text(
            'Forgot Password?',
            style: AppTextStyles.bodyLarge
                .copyWith(color: AppColors.white, fontWeight: FontWeight.w600),
          ),
        ),
      ],
    );
  }
}

class _EmailInput extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final displayError = context.select(
      (LoginCubit cubit) => cubit.state.email.displayError,
    );

    return TextInputWidget(
      key: const Key('loginForm_emailInput_textField'),
      onChange: (email) => context.read<LoginCubit>().emailChanged(email),
      isEmail: true,
      hintText: 'E-mail',
      errorText: displayError != null ? 'invalid email' : null,
    );
  }
}

class _PasswordInput extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final displayError = context.select(
      (LoginCubit cubit) => cubit.state.password.displayError,
    );

    return TextInputWidget(
      key: const Key('loginForm_passwordInput_textField'),
      onChange: (password) =>
          context.read<LoginCubit>().passwordChanged(password),
      isPassword: true,
      hintText: 'Password',
      errorText: displayError != null ? 'invalid password' : null,
    );
  }
}

class _LoginButton extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final isInProgress = context.select(
      (LoginCubit cubit) => cubit.state.status.isInProgress,
    );

    if (isInProgress) {
      return const SizedBox(
        width: 30,
        height: 30,
        child: CircularProgressIndicator(),
      );
    }

    final isValid = context.select(
      (LoginCubit cubit) => cubit.state.isValid,
    );

    return PrimaryButtonWidget(
      key: const Key('loginForm_continue_raisedButton'),
      text: 'Sign In',
      isDisabled: !isValid,
      onPressed: isValid
          ? () => context.read<LoginCubit>().logInWithCredentials()
          : null,
    );
  }
}

class _OrDivider extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        const Expanded(
          child: Divider(
            color: AppColors.lineDark,
            height: 1,
          ),
        ),
        Padding(
          padding: EdgeInsets.symmetric(horizontal: AppDimens.p10),
          child: Text(
            'or',
            style: AppTextStyles.bodySmall
                .copyWith(color: AppColors.white, fontSize: AppDimens.p14),
          ),
        ),
        const Expanded(
          child: Divider(
            color: AppColors.lineDark,
            height: 1,
          ),
        ),
      ],
    );
  }
}

class _OtherLoginOptions extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Expanded(
          child: IconButtonWidget(
            icon: AppAssets.iconFacebook,
            onPressed: () {},
          ),
        ),
        const SizedBox(width: 10),
        Expanded(
          child: IconButtonWidget(
            icon: AppAssets.iconGoogle,
            onPressed: () => context.read<LoginCubit>().logInWithGoogle(),
          ),
        ),
        const SizedBox(width: 10),
        Expanded(
          child: IconButtonWidget(
            icon: AppAssets.iconApple,
            onPressed: () {},
          ),
        ),
      ],
    );
  }
}

// class _GoogleLoginButton extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     final theme = Theme.of(context);
//     return ElevatedButton.icon(
//       key: const Key('loginForm_googleLogin_raisedButton'),
//       label: const Text(
//         'SIGN IN WITH GOOGLE',
//         style: TextStyle(color: Colors.white),
//       ),
//       style: ElevatedButton.styleFrom(
//         shape: RoundedRectangleBorder(
//           borderRadius: BorderRadius.circular(30),
//         ),
//         backgroundColor: theme.colorScheme.secondary,
//       ),
//       onPressed: () => context.read<LoginCubit>().logInWithGoogle(),
//     );
//   }
// }

class _SignUpTextAndButton extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.bottomCenter,
      child: RichText(
        key: const Key('loginForm_signUp_flatButton'),
        text: TextSpan(
          text: "Don't have an account? ",
          style: AppTextStyles.bodyMedium
              .copyWith(color: AppColors.white, fontSize: AppDimens.p16),
          children: [
            TextSpan(
              text: 'Sign Up',
              style: AppTextStyles.bodyMedium.copyWith(
                color: AppColors.primaryDark,
                fontSize: AppDimens.p16,
                fontWeight: FontWeight.w600,
              ),
              recognizer: TapGestureRecognizer()
                ..onTap = () {
                  Navigator.of(context).push<void>(SignUpPage.route());
                },
            ),
          ],
        ),
      ),
    );
  }
}
