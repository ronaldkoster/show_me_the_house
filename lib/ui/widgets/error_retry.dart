import 'package:flutter/material.dart';

typedef RetryPressedCallback = void Function();

class ErrorRetry extends StatelessWidget {
  final RetryPressedCallback _listener;
  final String? _message;

  const ErrorRetry({
    required RetryPressedCallback retryPressedCallback,
    final Key? key,
    final String? message,
  })  : _message = message,
        _listener = retryPressedCallback,
        super(key: key);

  @override
  Widget build(final BuildContext context) => Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(
              _message ?? "Oeps er is iets fout gegaan",
              style: Theme.of(context).textTheme.headline4,
              textAlign: TextAlign.center,
            ),
            ElevatedButton(
              onPressed: _listener,
              child: const Icon(
                Icons.refresh,
                color: Colors.white,
              ),
            )
          ],
        ),
      );
}
