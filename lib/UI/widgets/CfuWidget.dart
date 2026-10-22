import 'package:flutter/material.dart';

class CfuCard extends StatefulWidget {
  final int cfu; 
  final double media;
  final int proiezione;
  
  const CfuCard({
    super.key,
    required this.cfu,
    required this.media,
    required this.proiezione,
  });

  @override
  State<CfuCard> createState() => _CfuCardState();
}

class _CfuCardState extends State<CfuCard> with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> _animation;

  @override
  void initState() {
    super.initState();
    
    _controller = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 1200),
    );

    double targetValue = widget.cfu / 180;

    _animation = Tween<double>(begin: 0.0, end: targetValue).animate(
      CurvedAnimation(parent: _controller, curve: Curves.easeInOutCubic),
    );

    _controller.forward();
  }

  @override
  void dispose() {
    _controller.dispose(); 
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Center( 
      child: Container(
        constraints: const BoxConstraints(maxWidth: 600), 
        padding: const EdgeInsets.symmetric(horizontal: 32, vertical: 24),
        decoration: BoxDecoration(
          color: Theme.of(context).colorScheme.surface, 
          borderRadius: BorderRadius.circular(24), 
          border: Border.all(
            color: const Color(0xFF00E5FF).withValues(alpha: 0.2), 
            width: 1.5,
          ),
        ),
        child: Row(
          mainAxisSize: MainAxisSize.min, 
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Text(
                  'CFU Ottenuti',
                  style: TextStyle(
                    color: Theme.of(context).colorScheme.onSurface.withValues(alpha: 0.6),
                    fontSize: 13,
                    fontWeight: FontWeight.w600,
                  ),
                ),
                const SizedBox(height: 12),
                Stack(
                  alignment: Alignment.center,
                  children: [
                    SizedBox(
                      width: 95,
                      height: 95,
                      child: AnimatedBuilder(
                        animation: _animation,
                        builder: (context, child) {
                          return CircularProgressIndicator(
                            value: _animation.value, 
                            strokeWidth: 9,
                            backgroundColor: Theme.of(context).colorScheme.onSurface.withValues(alpha: 0.1), 
                            color: const Color(0xFF00E5FF),
                            strokeCap: StrokeCap.round, 
                          );
                        },
                      ),
                    ),
                    Text(
                      widget.cfu.toString(),
                      style: TextStyle(
                        fontSize: 26, 
                        fontWeight: FontWeight.bold, 
                        color: Theme.of(context).colorScheme.onSurface,
                      ),
                    ),
                  ],
                ),
              ],
            ),

            const SizedBox(width: 48),

            Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                _buildMetricItem(
                  context, 
                  title: 'CFU', 
                  value: '${widget.cfu}/180',
                  icon: Icons.school_outlined,
                ),
                const SizedBox(width: 32),
                _buildMetricItem(
                  context, 
                  title: 'Media', 
                  value: widget.media.toStringAsFixed(2),
                  icon: Icons.star_outline_rounded,
                ),
                const SizedBox(width: 32),
                _buildMetricItem(
                  context, 
                  title: 'Proiezione', 
                  value: widget.proiezione.toString(),
                  icon: Icons.trending_up_rounded,
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildMetricItem(BuildContext context, {required String title, required String value, required IconData icon}) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        Icon(
          icon, 
          size: 22, 
          color: const Color(0xFF00E5FF).withValues(alpha: 0.85),
        ),
        const SizedBox(height: 8),
        Text(
          title,
          style: TextStyle(
            fontSize: 12,
            fontWeight: FontWeight.w500,
            color: Theme.of(context).colorScheme.onSurface.withValues(alpha: 0.6),
          ),
        ),
        const SizedBox(height: 4),
        Text(
          value,
          style: TextStyle(
            fontSize: 17,
            fontWeight: FontWeight.bold,
            color: Theme.of(context).colorScheme.onSurface,
          ),
        ),
      ],
    );
  }
}