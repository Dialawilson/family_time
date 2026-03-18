import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';

class TaskCard extends StatelessWidget {
 final String title;
 final IconData leadingIcon;
 final String subtitle;
 final double progress;
  final VoidCallback onSkip;
  final VoidCallback onEnd;
  final VoidCallback onView;
  final VoidCallback onDone;

  const TaskCard({
    super.key,
    required this.title,
    required this.leadingIcon,
    required this.subtitle,
    required this.progress,
    required this.onSkip,
    required this.onEnd,
    required this.onView,
    required this.onDone,
  });

  @override
  Widget build(BuildContext context) {
    return Slidable(
      endActionPane: ActionPane(
        motion: const DrawerMotion(),
        
        children: [
         
    
          SlidableAction(
            onPressed: (context) => onView(),
            backgroundColor: Colors.blue,
            borderRadius: BorderRadius.only(topLeft: Radius.circular(8), bottomLeft: Radius.circular(8)),
            foregroundColor: Colors.white,
            icon: Icons.visibility,
            label: 'View',
          ),
          SlidableAction(
            onPressed: (context) => onDone(),
            backgroundColor: Colors.green,
            foregroundColor: Colors.white,
            borderRadius: BorderRadius.only(topRight: Radius.circular(8), bottomRight: Radius.circular(8)),
            icon: Icons.check,
            label: 'Done',
          ),
        ],
      ),
      startActionPane: ActionPane(
        motion: const DrawerMotion(),
        children: [
          SlidableAction(
            onPressed: (context) => onSkip(),
            backgroundColor: Colors.orange,
            foregroundColor: Colors.white,
            icon: Icons.skip_next,
            label: 'Skip',
          ),
          SlidableAction(
            onPressed: (context) => onEnd(),
            backgroundColor: Colors.red,
            foregroundColor: Colors.white,
            icon: Icons.stop,
            label: 'End',
          ),
        ],
      ),
      // child: ListTile(
      //   leading: Icon(leadingIcon, size: 10),
      //   title: Text(title, style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
      //   subtitle: Column(
      //     crossAxisAlignment: CrossAxisAlignment.start,
      //     children: [
      //       Text(subtitle),
      //       SizedBox(height: 8),
      //       LinearProgressIndicator(value: progress),
      //     ],
      //   ),
      // ),
      child: SizedBox(
        width: 300,
        height: 70,
        child: GestureDetector(
          
          onTap: () => onView(),
          child: Container(
            padding: const EdgeInsets.all(6),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(8),
              boxShadow: [
                BoxShadow(
                  color: Colors.black12,
                  blurRadius: 4,
                  offset: Offset(0, 2),
                ),
              ],
            ),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                SizedBox(
                  child: Stack(
                    alignment: Alignment.center,
                    children: [
                      CircularProgressIndicator(
                        value: progress,
                        strokeWidth: 2.5,
                        backgroundColor: Colors.grey[200],
                        valueColor: AlwaysStoppedAnimation<Color>(Colors.blue),
                        strokeCap: StrokeCap.round,
                      ),
                      Container(
                        width: 30,
                        height: 30,
                        decoration: BoxDecoration(
                          // color: Colors.white,
                          shape: BoxShape.circle,
                        ),
                        child: Icon(leadingIcon, size: 18, color: Colors.blue),
                      ),
                    ],
                  ),
                ),
                SizedBox(width: 5),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(title, 
                      overflow: TextOverflow.ellipsis,
                      style: TextStyle(fontSize: 15, fontWeight: FontWeight.bold)),
                      SizedBox(height: 8),
                      Text(subtitle),
                      SizedBox(height: 8),
                      // LinearProgressIndicator(value: progress),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      )
    );
  }
}