import '../core/errors/app_exception.dart';
import 'api_service.dart';

class LanguageApi {
  /// Get user language preference
  static Future<String> getLanguagePreference(String userId) async {
    try {
      final result = await ApiService.get('/languages/user/$userId');
      return result['language'] as String? ?? 'en';
    } catch (e) {
      throw AppException('Failed to fetch language preference: ${e.toString()}');
    }
  }

  /// Update user language preference
  static Future<void> setLanguagePreference({
    required String userId,
    required String languageCode,
  }) async {
    try {
      await ApiService.patch(
        '/languages/user/$userId',
        data: {'language': languageCode},
      );
    } catch (e) {
      throw AppException('Failed to update language preference: ${e.toString()}');
    }
  }

  /// Get available languages
  static Future<List<Map<String, dynamic>>> getAvailableLanguages() async {
    try {
      final result = await ApiService.get('/languages');
      final languages = result['languages'] as List;
      return languages.map((e) => e as Map<String, dynamic>).toList();
    } catch (e) {
      throw AppException('Failed to fetch available languages: ${e.toString()}');
    }
  }

  /// Get translations for a language
  static Future<Map<String, dynamic>> getTranslations(String languageCode) async {
    try {
      final result = await ApiService.get('/languages/$languageCode/translations');
      return result as Map<String, dynamic>;
    } catch (e) {
      throw AppException('Failed to fetch translations: ${e.toString()}');
    }
  }
}
