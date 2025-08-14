import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:home_widget/home_widget.dart';

class QuickyHomeWidgetService {
  static const _provider = 'QuickyWidgetProvider';

  static Future<void> update() async {
    final user = FirebaseAuth.instance.currentUser;
    if (user == null) return;

    final doc = await FirebaseFirestore.instance.collection('users').doc(user.uid).get();
    final data = doc.data();
    if (data == null) return;

    await HomeWidget.saveWidgetData<String>('display_name', data['display_name'] ?? '');
    await HomeWidget.saveWidgetData<String>('photo_url', data['photo_url'] ?? '');
    await HomeWidget.saveWidgetData<String>('saldo', (data['saldo'] ?? '').toString());
    await HomeWidget.saveWidgetData<String>('nexttask', (data['nexttask'] ?? '').toString());
    await HomeWidget.saveWidgetData<String>('rating', (data['rating'] ?? '').toString());
    await HomeWidget.updateWidget(name: _provider, iOSName: 'Quicky_Widget');
    await HomeWidget.updateWidget(name: _provider, iOSName: 'Quicky_Widget');
    await HomeWidget.updateWidget(name: _provider);
  }
}
