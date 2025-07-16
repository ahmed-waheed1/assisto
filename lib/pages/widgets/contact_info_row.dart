import 'package:flutter/material.dart';

class ContactInfoRow extends StatelessWidget {
  final IconData icon;
  final String text;
  final String label;

  const ContactInfoRow({
    super.key,
    required this.icon,
    required this.text,
    required this.label,
  });

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return Container(
      padding: const EdgeInsets.all(12),
      decoration: BoxDecoration(
        color: theme.brightness == Brightness.dark
            ? Colors.grey.shade800
            : Colors.white,
        borderRadius: BorderRadius.circular(12),
        border: Border.all(
          color: theme.brightness == Brightness.dark
              ? Colors.grey.shade600
              : Colors.grey.shade200,
        ),
      ),
      child: Row(
        children: [
          Container(
            padding: const EdgeInsets.all(12),
            decoration: BoxDecoration(
              gradient: LinearGradient(
                colors: theme.brightness == Brightness.dark
                    ? [Colors.deepPurple.shade300, Colors.deepPurple.shade400]
                    : [Colors.deepPurple.shade100, Colors.deepPurple.shade200],
              ),
              borderRadius: BorderRadius.circular(12),
            ),
            child: Icon(
              icon,
              color: theme.brightness == Brightness.dark
                  ? Colors.white
                  : Colors.deepPurple.shade700,
              size: 24,
            ),
          ),
          const SizedBox(width: 16),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  label,
                  style: TextStyle(
                    fontSize: 12,
                    color: theme.brightness == Brightness.dark
                        ? Colors.grey.shade400
                        : Colors.grey.shade600,
                    fontWeight: FontWeight.w500,
                    letterSpacing: 0.5,
                  ),
                ),
                const SizedBox(height: 4),
                Text(
                  text,
                  style: TextStyle(
                    fontSize: 16,
                    color: theme.brightness == Brightness.dark
                        ? Colors.white
                        : Colors.black87,
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ],
            ),
          ),
          Container(
            padding: const EdgeInsets.all(8),
            decoration: BoxDecoration(
              color: theme.brightness == Brightness.dark
                  ? Colors.green.shade800
                  : Colors.green.shade50,
              borderRadius: BorderRadius.circular(8),
            ),
            child: Icon(
              Icons.copy_rounded,
              color: theme.brightness == Brightness.dark
                  ? Colors.green.shade300
                  : Colors.green.shade600,
              size: 16,
            ),
          ),
        ],
      ),
    );
  }
}
