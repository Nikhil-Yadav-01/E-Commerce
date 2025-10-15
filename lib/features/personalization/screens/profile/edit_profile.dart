import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';

import '../../../../utils/constants/colors.dart';
import '../../../../utils/constants/sizes.dart';
import '../../../../utils/helpers/helper_functions.dart';

class EditProfileScreen extends StatefulWidget {
  const EditProfileScreen({super.key});

  @override
  State<EditProfileScreen> createState() => _EditProfileScreenState();
}

class _EditProfileScreenState extends State<EditProfileScreen> {
  final _formKey = GlobalKey<FormState>();
  final _nameController = TextEditingController(text: 'John Doe');
  final _phoneController = TextEditingController(text: '+1 234 567 8900');
  final _dobController = TextEditingController(text: 'Jan 15, 1990');
  final _emailController = TextEditingController(text: 'john.doe@example.com');
  final _addressController = TextEditingController(text: '123 Main St, New York, NY');
  String _selectedGender = 'Male';

  @override
  void dispose() {
    _nameController.dispose();
    _phoneController.dispose();
    _dobController.dispose();
    _emailController.dispose();
    _addressController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final isDark = RHelperFunctions.isDarkMode(context);

    return Scaffold(
      appBar: AppBar(title: const Text('Edit Profile')),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(RSizes.defaultSpace),
        child: Form(
          key: _formKey,
          child: Column(
            children: [
              Center(
                child: Stack(
                  children: [
                    Container(
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        gradient: RColors.primaryGradient,
                        boxShadow: [
                          BoxShadow(
                            color: RColors.primaryLight.withValues(alpha: 0.3),
                            blurRadius: 20,
                            offset: const Offset(0, 8),
                          ),
                        ],
                      ),
                      child: const CircleAvatar(
                        radius: 60,
                        backgroundColor: Colors.transparent,
                        child: Icon(Iconsax.user, size: 60, color: Colors.white),
                      ),
                    ),
                    Positioned(
                      bottom: 0,
                      right: 0,
                      child: GestureDetector(
                        onTap: () {},
                        child: Container(
                          padding: const EdgeInsets.all(RSizes.sm),
                          decoration: BoxDecoration(
                            color: RColors.primaryLight,
                            shape: BoxShape.circle,
                            border: Border.all(color: isDark ? RColors.backgroundDark : RColors.backgroundLight, width: 3),
                          ),
                          child: const Icon(Iconsax.camera, size: 20, color: Colors.white),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(height: RSizes.spaceBtwSections),
              _buildTextField(isDark, _nameController, 'Full Name', Iconsax.user),
              _buildTextField(isDark, _phoneController, 'Phone', Iconsax.call),
              _buildTextField(isDark, _dobController, 'Date of Birth', Iconsax.calendar, readOnly: true, onTap: () => _selectDate(context)),
              _buildGenderDropdown(isDark),
              _buildTextField(isDark, _emailController, 'Email', Iconsax.sms),
              _buildTextField(isDark, _addressController, 'Address', Iconsax.location, maxLines: 2),
              const SizedBox(height: RSizes.spaceBtwSections),
              SizedBox(
                width: double.infinity,
                height: 50,
                child: ElevatedButton(
                  onPressed: () {
                    if (_formKey.currentState!.validate()) {
                      Navigator.pop(context);
                      ScaffoldMessenger.of(context).showSnackBar(
                        const SnackBar(content: Text('Profile updated successfully')),
                      );
                    }
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: RColors.primaryLight,
                    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(RSizes.cardRadiusMd)),
                  ),
                  child: const Text('Save Changes', style: TextStyle(color: Colors.white, fontSize: 16)),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildTextField(bool isDark, TextEditingController controller, String label, IconData icon, {bool readOnly = false, VoidCallback? onTap, int maxLines = 1}) {
    return Padding(
      padding: const EdgeInsets.only(bottom: RSizes.spaceBtwItems),
      child: TextFormField(
        controller: controller,
        readOnly: readOnly,
        onTap: onTap,
        maxLines: maxLines,
        decoration: InputDecoration(
          labelText: label,
          prefixIcon: Icon(icon, color: RColors.primaryLight),
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(RSizes.cardRadiusMd),
            borderSide: BorderSide(color: isDark ? RColors.borderDark : RColors.borderLight),
          ),
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(RSizes.cardRadiusMd),
            borderSide: BorderSide(color: isDark ? RColors.borderDark : RColors.borderLight),
          ),
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(RSizes.cardRadiusMd),
            borderSide: const BorderSide(color: RColors.primaryLight, width: 2),
          ),
        ),
        validator: (value) => value?.isEmpty ?? true ? 'Please enter $label' : null,
      ),
    );
  }

  Widget _buildGenderDropdown(bool isDark) {
    return Padding(
      padding: const EdgeInsets.only(bottom: RSizes.spaceBtwItems),
      child: DropdownButtonFormField<String>(
        value: _selectedGender,
        decoration: InputDecoration(
          labelText: 'Gender',
          prefixIcon: const Icon(Iconsax.man, color: RColors.primaryLight),
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(RSizes.cardRadiusMd),
            borderSide: BorderSide(color: isDark ? RColors.borderDark : RColors.borderLight),
          ),
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(RSizes.cardRadiusMd),
            borderSide: BorderSide(color: isDark ? RColors.borderDark : RColors.borderLight),
          ),
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(RSizes.cardRadiusMd),
            borderSide: const BorderSide(color: RColors.primaryLight, width: 2),
          ),
        ),
        items: ['Male', 'Female', 'Other'].map((gender) => DropdownMenuItem(value: gender, child: Text(gender))).toList(),
        onChanged: (value) => setState(() => _selectedGender = value!),
      ),
    );
  }

  Future<void> _selectDate(BuildContext context) async {
    final picked = await showDatePicker(
      context: context,
      initialDate: DateTime(1990, 1, 15),
      firstDate: DateTime(1900),
      lastDate: DateTime.now(),
    );
    if (picked != null) {
      setState(() => _dobController.text = '${picked.month}/${picked.day}/${picked.year}');
    }
  }
}
