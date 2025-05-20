import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:formz/formz.dart';
import 'package:movie_app/app_core/app_core.dart';
import 'package:movie_app/features/login/views/login_page.dart';
import 'package:movie_app/features/login/widgets/widgets.dart';
import 'package:movie_app/features/sign_up/cubit/sign_up_cubit.dart';
import 'package:movie_app/shared/shared.dart';

/// SignUpForm widget
/// This widget is used to display the sign up form
/// It uses the SignUpCubit to manage the sign up state
/// and the AuthenticationRepository to authenticate the user
class SignUpForm extends StatelessWidget {
  /// Creates an instance of [SignUpForm].
  /// The [key] parameter is used to identify the widget in the widget tree.
  const SignUpForm({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocListener<SignUpCubit, SignUpState>(
      listener: (context, state) {
        if (state.status.isSuccess) {
          Navigator.of(context).pop();
        } else if (state.status.isFailure) {
          ScaffoldMessenger.of(context)
            ..hideCurrentSnackBar()
            ..showSnackBar(
              SnackBar(content: Text(state.errorMessage ?? 'Sign Up Failure')),
            );
        }
      },
      child: SafeArea(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: AppDimens.p10),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              _SingUpHeader(),
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
                            const SizedBox(height: 20),
                            _ConfirmPasswordInput(),
                            const SizedBox(height: 10),
                            _PrivacyPolicyText(),
                            const SizedBox(height: 30),
                            _SignUpButton(),
                            const SizedBox(height: 20),
                            _OrDivider(),
                            const SizedBox(height: 20),
                            _OtherLoginOptions(),
                          ],
                        ),
                      ),
                      _SignInTextAndButton(),
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

class _PageTitle extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Text(
          'Sign Up',
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

class _EmailInput extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final displayError = context.select(
      (SignUpCubit cubit) => cubit.state.email.displayError,
    );

    return TextInputWidget(
      key: const Key('signUpForm_emailInput_textField'),
      onChange: (email) => context.read<SignUpCubit>().emailChanged(email),
      isEmail: true,
      hintText: 'E-mail',
      errorText: displayError != null ? 'invalid email' : null,
    );
  }
}

class _SingUpHeader extends StatelessWidget {
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

class _PasswordInput extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final displayError = context.select(
      (SignUpCubit cubit) => cubit.state.password.displayError,
    );

    return TextInputWidget(
      key: const Key('signUpForm_passwordInput_textField'),
      onChange: (password) =>
          context.read<SignUpCubit>().passwordChanged(password),
      isPassword: true,
      hintText: 'Password',
      errorText: displayError != null ? 'invalid password' : null,
    );
  }
}

class _PrivacyPolicyText extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return RichText(
      text: TextSpan(
        text: 'By clicking the “sign up” button, you accept the terms of the  ',
        style: AppTextStyles.bodySmall.copyWith(
          color: AppColors.white.withAlpha(200),
          fontSize: AppDimens.p14,
          fontWeight: FontWeight.w400,
        ),
        children: [
          TextSpan(
            text: 'Privacy Policy',
            style: AppTextStyles.bodySmall.copyWith(
              color: AppColors.white,
              fontSize: AppDimens.p14,
              fontWeight: FontWeight.w500,
            ),
            recognizer: TapGestureRecognizer()
              ..onTap = () {
                Navigator.of(context).push<void>(LoginPage.route());
              },
          ),
        ],
      ),
    );
  }
}

class _ConfirmPasswordInput extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final displayError = context.select(
      (SignUpCubit cubit) => cubit.state.confirmedPassword.displayError,
    );

    return TextInputWidget(
      key: const Key('signUpForm_confirmedPasswordInput_textField'),
      onChange: (confirmPassword) =>
          context.read<SignUpCubit>().confirmedPasswordChanged(confirmPassword),
      isPassword: true,
      hintText: 'Confirm Password',
      errorText: displayError != null ? 'passwords do not match' : null,
    );
  }
}

class _SignUpButton extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final isInProgress = context.select(
      (SignUpCubit cubit) => cubit.state.status.isInProgress,
    );

    if (isInProgress) {
      return const SizedBox(
        width: 30,
        height: 30,
        child: CircularProgressIndicator(),
      );
    }

    final isValid = context.select(
      (SignUpCubit cubit) => cubit.state.isValid,
    );

    return PrimaryButtonWidget(
      key: const Key('signUpForm_continue_raisedButton'),
      onPressed: isValid
          ? () => context.read<SignUpCubit>().signUpFormSubmitted()
          : null,
      text: 'Sign Up',
      isDisabled: !isValid,
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
            onPressed: () => context.read<SignUpCubit>().logInWithGoogle(),
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

class _SignInTextAndButton extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.bottomCenter,
      child: RichText(
        key: const Key('loginForm_signUp_flatButton'),
        text: TextSpan(
          text: 'ALready have an account? ',
          style: AppTextStyles.bodyMedium
              .copyWith(color: AppColors.white, fontSize: AppDimens.p16),
          children: [
            TextSpan(
              text: 'Sign In',
              style: AppTextStyles.bodyMedium.copyWith(
                color: AppColors.primaryDark,
                fontSize: AppDimens.p16,
                fontWeight: FontWeight.w600,
              ),
              recognizer: TapGestureRecognizer()
                ..onTap = () {
                  Navigator.of(context).push<void>(LoginPage.route());
                },
            ),
          ],
        ),
      ),
    );
  }
}
