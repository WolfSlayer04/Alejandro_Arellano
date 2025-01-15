import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'widgets/personal_info_form.dart';
import 'widgets/additional_info_form.dart';
import 'widgets/form_buttons.dart';

class FormsPage extends StatefulWidget {
  const FormsPage({super.key});

  @override
  State<FormsPage> createState() => _FormsPageState();
}

class _FormsPageState extends State<FormsPage> {
  final _formKey = GlobalKey<FormState>();
  final _nameController = TextEditingController();
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();
  final _bioController = TextEditingController();
  bool _obscurePassword = true;
  String _selectedGender = '';
  bool _acceptTerms = false;
  double _age = 18;

  @override
  void dispose() {
    _nameController.dispose();
    _emailController.dispose();
    _passwordController.dispose();
    _bioController.dispose();
    super.dispose();
  }

  void _handleSubmit() {
    if (_formKey.currentState!.validate() && _acceptTerms) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: const Text('Formulario enviado con éxito'),
          backgroundColor: Colors.green,
          behavior: SnackBarBehavior.floating,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10),
          ),
        ),
      );
    } else if (!_acceptTerms) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text('Debe aceptar los términos y condiciones'),
          backgroundColor: Colors.red,
        ),
      );
    }
  }

  void _handleReset() {
    _formKey.currentState?.reset();
    _nameController.clear();
    _emailController.clear();
    _passwordController.clear();
    _bioController.clear();
    setState(() {
      _selectedGender = '';
      _age = 18;
      _acceptTerms = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Formularios Mejorados',
          style: GoogleFonts.poppins(fontWeight: FontWeight.bold),
        ),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16),
        child: Form(
          key: _formKey,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              PersonalInfoForm(
                nameController: _nameController,
                emailController: _emailController,
                passwordController: _passwordController,
                obscurePassword: _obscurePassword,
                onTogglePassword: () {
                  setState(() {
                    _obscurePassword = !_obscurePassword;
                  });
                },
              ),
              const SizedBox(height: 16),
              AdditionalInfoForm(
                bioController: _bioController,
                selectedGender: _selectedGender,
                age: _age,
                acceptTerms: _acceptTerms,
                onGenderChanged: (value) {
                  setState(() {
                    _selectedGender = value ?? '';
                  });
                },
                onAgeChanged: (value) {
                  setState(() {
                    _age = value;
                  });
                },
                onTermsChanged: (value) {
                  setState(() {
                    _acceptTerms = value ?? false;
                  });
                },
              ),
              const SizedBox(height: 16),
              FormButtons(
                onSubmit: _handleSubmit,
                onReset: _handleReset,
              ),
            ],
          ),
        ),
      ),
    );
  }
}