import 'package:flutter/material.dart';

class AdditionalInfoForm extends StatelessWidget {
  final TextEditingController bioController;
  final String selectedGender;
  final double age;
  final bool acceptTerms;
  final ValueChanged<String?> onGenderChanged;
  final ValueChanged<double> onAgeChanged;
  final ValueChanged<bool?> onTermsChanged;

  const AdditionalInfoForm({
    super.key,
    required this.bioController,
    required this.selectedGender,
    required this.age,
    required this.acceptTerms,
    required this.onGenderChanged,
    required this.onAgeChanged,
    required this.onTermsChanged,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 4,
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Información adicional',
              style: Theme.of(context).textTheme.titleLarge,
            ),
            const SizedBox(height: 16),
            const Text('Género:'),
            RadioListTile(
              title: const Text('Masculino'),
              value: 'M',
              groupValue: selectedGender,
              onChanged: onGenderChanged,
            ),
            RadioListTile(
              title: const Text('Femenino'),
              value: 'F',
              groupValue: selectedGender,
              onChanged: onGenderChanged,
            ),
            RadioListTile(
              title: const Text('Otro'),
              value: 'O',
              groupValue: selectedGender,
              onChanged: onGenderChanged,
            ),
            const Text('Edad:'),
            Slider(
              value: age,
              min: 18,
              max: 100,
              divisions: 82,
              label: age.round().toString(),
              onChanged: onAgeChanged,
            ),
            TextFormField(
              controller: bioController,
              maxLines: 3,
              decoration: const InputDecoration(
                labelText: 'Biografía',
                alignLabelWithHint: true,
                border: OutlineInputBorder(),
              ),
            ),
            const SizedBox(height: 16),
            CheckboxListTile(
              title: const Text('Acepto los términos y condiciones'),
              value: acceptTerms,
              onChanged: onTermsChanged,
            ),
          ],
        ),
      ),
    );
  }
}