import 'package:flutter/material.dart';

/// Form validation utility class
/// Provides reusable validators for common form fields
class FormValidators {
  FormValidators._();

  /// Validate required fields
  static String? Function(String?) required(
    BuildContext context, {
    String? message,
  }) {
    return (String? value) {
      if (value?.trim().isEmpty ?? true) {
        return message ?? 'هذا الحقل مطلوب';
      }
      return null;
    };
  }

  /// Validate email format
  static String? Function(String?) email(
    BuildContext context, {
    String? message,
  }) {
    return (String? value) {
      if (value?.trim().isEmpty ?? true) {
        return 'هذا الحقل مطلوب';
      }

      final emailRegex = RegExp(
        r'^[a-zA-Z0-9._%+-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,}$',
      );

      if (!emailRegex.hasMatch(value!)) {
        return message ?? 'البريد الإلكتروني غير صحيح';
      }
      return null;
    };
  }

  /// Validate phone number
  static String? Function(String?) phone(
    BuildContext context, {
    String? message,
  }) {
    return (String? value) {
      if (value?.trim().isEmpty ?? true) {
        return 'هذا الحقل مطلوب';
      }

      final phoneRegex = RegExp(r'^[0-9]{10,}$');

      if (!phoneRegex.hasMatch(value!.replaceAll(RegExp(r'[\s-]'), ''))) {
        return message ?? 'رقم الهاتف غير صحيح';
      }
      return null;
    };
  }

  /// Validate minimum length
  static String? Function(String?) minLength(
    BuildContext context,
    int min, {
    String? message,
  }) {
    return (String? value) {
      if (value?.trim().isEmpty ?? true) {
        return 'هذا الحقل مطلوب';
      }

      if (value!.trim().length < min) {
        return message ?? 'يجب أن يكون النص $min أحرف على الأقل';
      }
      return null;
    };
  }

  /// Validate maximum length
  static String? Function(String?) maxLength(
    BuildContext context,
    int max, {
    String? message,
  }) {
    return (String? value) {
      if (value != null && value.trim().length > max) {
        return message ?? 'يجب أن لا يتجاوز النص $max حرف';
      }
      return null;
    };
  }

  /// Validate number (integer or decimal)
  static String? Function(String?) number(
    BuildContext context, {
    String? message,
  }) {
    return (String? value) {
      if (value?.trim().isEmpty ?? true) {
        return 'هذا الحقل مطلوب';
      }

      if (double.tryParse(value!) == null) {
        return message ?? 'يجب إدخال رقم صحيح';
      }
      return null;
    };
  }

  /// Validate positive number
  static String? Function(String?) positiveNumber(
    BuildContext context, {
    String? message,
  }) {
    return (String? value) {
      if (value?.trim().isEmpty ?? true) {
        return 'هذا الحقل مطلوب';
      }

      final number = double.tryParse(value!);
      if (number == null || number <= 0) {
        return message ?? 'يجب إدخال رقم أكبر من صفر';
      }
      return null;
    };
  }

  /// Validate price (positive decimal with max 2 decimal places)
  static String? Function(String?) price(
    BuildContext context, {
    String? message,
    String? requiredMessage,
  }) {
    return (String? value) {
      if (value?.trim().isEmpty ?? true) {
        return requiredMessage ?? 'هذا الحقل مطلوب';
      }

      final price = double.tryParse(value!);
      if (price == null || price <= 0) {
        return message ?? 'السعر غير صحيح';
      }
      return null;
    };
  }

  /// Validate URL format
  static String? Function(String?) url(
    BuildContext context, {
    String? message,
  }) {
    return (String? value) {
      if (value?.trim().isEmpty ?? true) {
        return 'هذا الحقل مطلوب';
      }

      final urlRegex = RegExp(
        r'^https?:\/\/(www\.)?[-a-zA-Z0-9@:%._\+~#=]{1,256}\.[a-zA-Z0-9()]{1,6}\b([-a-zA-Z0-9()@:%_\+.~#?&//=]*)$',
      );

      if (!urlRegex.hasMatch(value!)) {
        return message ?? 'الرابط غير صحيح';
      }
      return null;
    };
  }

  /// Validate password strength
  static String? Function(String?) password(
    BuildContext context, {
    int minLength = 8,
    String? message,
  }) {
    return (String? value) {
      if (value?.trim().isEmpty ?? true) {
        return 'هذا الحقل مطلوب';
      }

      if (value!.length < minLength) {
        return message ?? 'كلمة المرور يجب أن تكون $minLength أحرف على الأقل';
      }
      return null;
    };
  }

  /// Validate confirm password matches password
  static String? Function(String?) confirmPassword(
    BuildContext context,
    String password, {
    String? message,
  }) {
    return (String? value) {
      if (value?.trim().isEmpty ?? true) {
        return 'هذا الحقل مطلوب';
      }

      if (value != password) {
        return message ?? 'كلمة المرور غير متطابقة';
      }
      return null;
    };
  }

  /// Compose multiple validators
  static String? Function(String?) compose(
    List<String? Function(String?)> validators,
  ) {
    return (String? value) {
      for (final validator in validators) {
        final result = validator(value);
        if (result != null) {
          return result;
        }
      }
      return null;
    };
  }
}

