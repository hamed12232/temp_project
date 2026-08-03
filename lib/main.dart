import 'dart:developer' as developer;

import 'package:flutter/material.dart';
import 'package:temp_project/core/di/injection.dart';

import 'core/network/models/api_result.dart';
import 'features/auth/domain/usecases/login_usecase.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await configureDependencies();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Network Test App',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const NetworkTestScreen(),
    );
  }
}

class NetworkTestScreen extends StatefulWidget {
  const NetworkTestScreen({super.key});

  @override
  State<NetworkTestScreen> createState() => _NetworkTestScreenState();
}

class _NetworkTestScreenState extends State<NetworkTestScreen> {
  late final LoginUseCase _loginUseCase;

  bool _isLoading = false;
  String _resultMessage = 'Press button or launch to test API';
  bool _isSuccess = false;

  @override
  void initState() {
    super.initState();
    _loginUseCase = sl<LoginUseCase>();
    _testApiCall();
  }

  Future<void> _testApiCall() async {
    setState(() {
      _isLoading = true;
      _resultMessage = 'Dispatching request via LoginUseCase...';
    });

    final result = await _loginUseCase(
      const LoginParams(phone: '011432904484', countryCode: '+20'),
    );

    result.when(
      success: (authResponse) {
        developer.log('✅ API Success: ${authResponse.accessToken}');
        setState(() {
          _isLoading = false;
          _isSuccess = true;
          _resultMessage = 'Success Token: ${authResponse.accessToken}';
        });
      },
      failure: (failure) {
        developer.log('❌ API Failure: ${failure.message}');
        setState(() {
          _isLoading = false;
          _isSuccess = false;
          _resultMessage =
              'Error Code: ${failure.statusCode ?? 'N/A'}\nMessage: ${failure.message}';
        });
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Network Layer Test'),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Card(
              elevation: 4,
              child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: Column(
                  children: [
                    Icon(
                      _isSuccess ? Icons.check_circle : Icons.error_outline,
                      color: _isSuccess ? Colors.green : Colors.red,
                      size: 48,
                    ),
                    const SizedBox(height: 12),
                    Text(
                      _isLoading ? 'Sending Request...' : _resultMessage,
                      textAlign: TextAlign.center,
                      style: const TextStyle(fontSize: 16),
                    ),
                  ],
                ),
              ),
            ),
            const SizedBox(height: 24),
            ElevatedButton.icon(
              onPressed: _isLoading ? null : _testApiCall,
              icon: _isLoading
                  ? const SizedBox(
                      width: 20,
                      height: 20,
                      child: CircularProgressIndicator(strokeWidth: 2),
                    )
                  : const Icon(Icons.refresh),
              label: const Text('Test API Call Again'),
            ),
          ],
        ),
      ),
    );
  }
}
