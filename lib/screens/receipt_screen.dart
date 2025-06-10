import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class ReceiptScreen extends StatelessWidget {
  final List<Map<String, dynamic>> items;
  final double totalAmount;
  final String invoiceNumber;

  const ReceiptScreen({
    Key? key,
    required this.items,
    required this.totalAmount,
    required this.invoiceNumber,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final formatter = NumberFormat("#,###", "id_ID");
    final now = DateTime.now();

    return Scaffold(
      appBar: AppBar(
        title: const Text('Nota Pembelian'),
        elevation: 0,
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            // Header Nota
            Container(
              width: double.infinity,
              padding: const EdgeInsets.all(16),
              color: Colors.pink.shade50,
              child: Column(
                children: [
                  const Text(
                    'Cardigan Collection',
                    style: TextStyle(
                      fontSize: 24,
                      fontWeight: FontWeight.bold,
                      color: Colors.pink,
                    ),
                  ),
                  const SizedBox(height: 8),
                  const Text(
                    'Jl. Soekarno-Hatta',
                    style: TextStyle(fontSize: 16),
                  ),
                  const Text(
                    'Cisaranten Kulon',
                    style: TextStyle(fontSize: 16),
                  ),
                  const Text(
                    'Tel: 08234567890',
                    style: TextStyle(fontSize: 16),
                  ),
                  const Text(
                    'Email: info@cardigancollection.com',
                    style: TextStyle(fontSize: 16),
                  ),
                ],
              ),
            ),
            
            // Informasi Transaksi
            Container(
              padding: const EdgeInsets.all(16),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        'No: $invoiceNumber',
                        style: const TextStyle(
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      Text(
                        DateFormat('dd/MM/yyyy HH:mm').format(now),
                        style: const TextStyle(
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ],
                  ),
                  const Divider(thickness: 2),
                  
                  // Daftar Item
                  const Text(
                    'Item yang dibeli:',
                    style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(height: 8),
                  ListView.builder(
                    shrinkWrap: true,
                    physics: const NeverScrollableScrollPhysics(),
                    itemCount: items.length,
                    itemBuilder: (context, index) {
                      final item = items[index];
                      final itemTotal = item['quantity'] * 
                          int.parse(item['price'].toString().replaceAll(RegExp(r'[^0-9]'), ''));
                      
                      return Padding(
                        padding: const EdgeInsets.symmetric(vertical: 4),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              item['name'],
                              style: const TextStyle(fontWeight: FontWeight.bold),
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text('${item['quantity']} x ${item['price']}'),
                                Text('Rp ${formatter.format(itemTotal)}'),
                              ],
                            ),
                            const Divider(),
                          ],
                        ),
                      );
                    },
                  ),
                  
                  // Total dan Informasi Pembayaran
                  const SizedBox(height: 16),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      const Text(
                        'Total Pembayaran:',
                        style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      Text(
                        'Rp ${formatter.format(totalAmount)}',
                        style: const TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                          color: Colors.green,
                        ),
                      ),
                    ],
                  ),
                  
                  // Informasi Tambahan
                  const SizedBox(height: 24),
                  const Center(
                    child: Column(
                      children: [
                        Text(
                          'Terima kasih telah berbelanja',
                          style: TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        SizedBox(height: 8),
                        Text(
                          'Barang yang sudah dibeli tidak dapat ditukar/dikembalikan',
                          style: TextStyle(
                            fontSize: 14,
                            color: Colors.grey,
                          ),
                        ),
                        SizedBox(height: 4),
                        Text(
                          'Simpan nota ini sebagai bukti pembelian',
                          style: TextStyle(
                            fontSize: 14,
                            color: Colors.grey,
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
      bottomNavigationBar: Container(
        padding: const EdgeInsets.all(16),
        child: Row(
          children: [
            Expanded(
              child: ElevatedButton.icon(
                onPressed: () {
                  // TODO: Implement print functionality
                  ScaffoldMessenger.of(context).showSnackBar(
                    const SnackBar(
                      content: Text('Fitur cetak nota akan segera hadir'),
                    ),
                  );
                },
                icon: const Icon(Icons.print),
                label: const Text('Cetak Nota'),
                style: ElevatedButton.styleFrom(
                  padding: const EdgeInsets.symmetric(vertical: 16),
                ),
              ),
            ),
            const SizedBox(width: 16),
            Expanded(
              child: ElevatedButton.icon(
                onPressed: () {
                  Navigator.of(context).popUntil((route) => route.isFirst);
                },
                icon: const Icon(Icons.home),
                label: const Text('Kembali'),
                style: ElevatedButton.styleFrom(
                  padding: const EdgeInsets.symmetric(vertical: 16),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
} 