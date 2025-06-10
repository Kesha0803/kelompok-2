import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'receipt_screen.dart';

class InvoiceScreen extends StatelessWidget {
  final List<Map<String, dynamic>> items;
  final double totalAmount;

  const InvoiceScreen({
    Key? key,
    required this.items,
    required this.totalAmount,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final formatter = NumberFormat("#,###", "id_ID");
    final now = DateTime.now();
    final invoiceNumber = 'INV/${now.year}${now.month.toString().padLeft(2, '0')}${now.day.toString().padLeft(2, '0')}/${now.hour}${now.minute}';

    return Scaffold(
      appBar: AppBar(
        title: const Text('Invoice Pembelian'),
        elevation: 0,
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Header Invoice
              Card(
                elevation: 2,
                child: Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
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
                      Text(
                        'Nomor Invoice: $invoiceNumber',
                        style: const TextStyle(
                          fontSize: 16,
                          color: Colors.grey,
                        ),
                      ),
                      Text(
                        'Tanggal: ${DateFormat('dd MMMM yyyy, HH:mm').format(now)}',
                        style: const TextStyle(
                          fontSize: 16,
                          color: Colors.grey,
                        ),
                      ),
                      const Divider(height: 32),
                      const Text(
                        'Rincian Pembelian:',
                        style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              const SizedBox(height: 16),

              // Daftar Item
              Card(
                elevation: 2,
                child: ListView.builder(
                  shrinkWrap: true,
                  physics: const NeverScrollableScrollPhysics(),
                  itemCount: items.length,
                  itemBuilder: (context, index) {
                    final item = items[index];
                    final itemTotal = item['quantity'] * int.parse(item['price'].toString().replaceAll(RegExp(r'[^0-9]'), ''));
                    
                    return Column(
                      children: [
                        Padding(
                          padding: const EdgeInsets.all(16.0),
                          child: Row(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              // Gambar Produk
                              ClipRRect(
                                borderRadius: BorderRadius.circular(8),
                                child: Image.asset(
                                  item['image'],
                                  width: 80,
                                  height: 80,
                                  fit: BoxFit.cover,
                                ),
                              ),
                              const SizedBox(width: 16),
                              // Info Produk
                              Expanded(
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      item['name'],
                                      style: const TextStyle(
                                        fontSize: 16,
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),
                                    const SizedBox(height: 4),
                                    Text(
                                      item['price'],
                                      style: const TextStyle(
                                        color: Colors.green,
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),
                                    const SizedBox(height: 4),
                                    Text(
                                      'Jumlah: ${item['quantity']}',
                                      style: TextStyle(
                                        color: Colors.grey[600],
                                      ),
                                    ),
                                    const SizedBox(height: 4),
                                    Text(
                                      'Subtotal: Rp ${formatter.format(itemTotal)}',
                                      style: const TextStyle(
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          ),
                        ),
                        if (index < items.length - 1)
                          const Divider(height: 1),
                      ],
                    );
                  },
                ),
              ),
              const SizedBox(height: 16),

              // Total
              Card(
                elevation: 2,
                child: Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Column(
                    children: [
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
                    ],
                  ),
                ),
              ),
              const SizedBox(height: 24),
            ],
          ),
        ),
      ),
      bottomNavigationBar: Container(
        padding: const EdgeInsets.all(16),
        child: Row(
          children: [
            Expanded(
              child: ElevatedButton.icon(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => ReceiptScreen(
                        items: items,
                        totalAmount: totalAmount,
                        invoiceNumber: invoiceNumber,
                      ),
                    ),
                  );
                },
                icon: const Icon(Icons.receipt_long),
                label: const Text('Lihat Nota'),
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
                label: const Text('Selesai'),
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