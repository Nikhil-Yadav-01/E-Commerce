import 'package:flutter/material.dart';
import 'package:e_commerce/utils/constants/colors.dart';
import 'package:e_commerce/utils/constants/sizes.dart';
import 'package:e_commerce/utils/helpers/helper_functions.dart';

class AddNewAddressScreen extends StatefulWidget {
  const AddNewAddressScreen({super.key});

  @override
  State<AddNewAddressScreen> createState() => _AddNewAddressScreenState();
}

class _AddNewAddressScreenState extends State<AddNewAddressScreen> {
  final _formKey = GlobalKey<FormState>();

  final _nameController = TextEditingController();
  final _phoneController = TextEditingController();
  final _addressController = TextEditingController();
  final _cityController = TextEditingController();
  final _stateController = TextEditingController();
  final _countryController = TextEditingController();
  final _zipController = TextEditingController();

  bool _isSaving = false;

  @override
  void dispose() {
    _nameController.dispose();
    _phoneController.dispose();
    _addressController.dispose();
    _cityController.dispose();
    _stateController.dispose();
    _countryController.dispose();
    _zipController.dispose();
    super.dispose();
  }

  Future<void> _saveAddress() async {
    if (!_formKey.currentState!.validate()) return;

    setState(() => _isSaving = true);

    // Simulate network delay (replace with API or Firebase integration)
    await Future.delayed(const Duration(seconds: 2));

    setState(() => _isSaving = false);

    if (mounted) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text("Address saved successfully!")),
      );
      Navigator.pop(context, true);
    }
  }

  @override
  Widget build(BuildContext context) {
    final bool isDark = RHelperFunctions.isDarkMode(context);
    final Color bgColor =
    isDark ? RColors.backgroundDark : RColors.backgroundLight;

    return Scaffold(
      appBar: AppBar(
        title: const Text("Add New Address"),
        centerTitle: true,
        backgroundColor: bgColor,
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.all(RSizes.md),
          child: Form(
            key: _formKey,
            child: Column(
              children: [
                _buildTextField(
                  label: "Full Name",
                  controller: _nameController,
                  validator: (val) =>
                  val == null || val.isEmpty ? "Enter full name" : null,
                  textInputType: TextInputType.name,
                ),
                const SizedBox(height: RSizes.spaceBtwItems),
                _buildTextField(
                  label: "Phone Number",
                  controller: _phoneController,
                  validator: (val) =>
                  val == null || val.isEmpty ? "Enter phone number" : null,
                  textInputType: TextInputType.phone,
                ),
                const SizedBox(height: RSizes.spaceBtwItems),
                _buildTextField(
                  label: "Address Line",
                  controller: _addressController,
                  validator: (val) =>
                  val == null || val.isEmpty ? "Enter address" : null,
                ),
                const SizedBox(height: RSizes.spaceBtwItems),
                Row(
                  children: [
                    Expanded(
                      child: _buildTextField(
                        label: "City",
                        controller: _cityController,
                        validator: (val) =>
                        val == null || val.isEmpty ? "Enter city" : null,
                      ),
                    ),
                    const SizedBox(width: RSizes.spaceBtwItems),
                    Expanded(
                      child: _buildTextField(
                        label: "State",
                        controller: _stateController,
                        validator: (val) =>
                        val == null || val.isEmpty ? "Enter state" : null,
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: RSizes.spaceBtwItems),
                Row(
                  children: [
                    Expanded(
                      child: _buildTextField(
                        label: "Country",
                        controller: _countryController,
                        validator: (val) =>
                        val == null || val.isEmpty ? "Enter country" : null,
                      ),
                    ),
                    const SizedBox(width: RSizes.spaceBtwItems),
                    Expanded(
                      child: _buildTextField(
                        label: "ZIP / Postal Code",
                        controller: _zipController,
                        validator: (val) =>
                        val == null || val.isEmpty ? "Enter ZIP" : null,
                        textInputType: TextInputType.number,
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: RSizes.spaceBtwSections * 1.2),

                /// Save Button
                SizedBox(
                  width: double.infinity,
                  child: FilledButton.icon(
                    icon: _isSaving
                        ? const SizedBox(
                      width: 18,
                      height: 18,
                      child: CircularProgressIndicator(strokeWidth: 2),
                    )
                        : Icon(
                        Icons.save_rounded,
                        color: isDark ? RColors.onPrimaryDark : RColors.onPrimaryLight
                    ),
                    label: Text(
                        _isSaving ? "Saving..." : "Save Address",
                      style: Theme.of(context).textTheme.titleMedium!.apply(
                          color: isDark ? RColors.onPrimaryDark : RColors.onPrimaryLight
                      )
                    ),
                    onPressed: _isSaving ? null : _saveAddress,
                    style: FilledButton.styleFrom(
                      padding: const EdgeInsets.symmetric(
                          vertical: RSizes.buttonHeight / 3),
                      backgroundColor: isDark
                          ? RColors.primaryDark.withValues(alpha: 0.9)
                          : RColors.primaryLight.withValues(alpha: 0.9),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  /// 🧩 Reusable Text Field Builder
  Widget _buildTextField({
    required String label,
    required TextEditingController controller,
    String? Function(String?)? validator,
    TextInputType textInputType = TextInputType.text,
  }) {
    return TextFormField(
      controller: controller,
      validator: validator,
      keyboardType: textInputType,
      decoration: InputDecoration(
        labelText: label,
        filled: true,
        fillColor: Theme.of(context)
            .colorScheme
            .surfaceContainerHighest
            .withValues(alpha: 0.4),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(RSizes.md),
        ),
      ),
    );
  }
}
