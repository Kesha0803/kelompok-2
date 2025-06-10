import 'package:flutter/material.dart';
import '../consts/consts.dart';
import 'product_detail_screen.dart';
import 'cart_screen.dart';

class ProductListScreen extends StatefulWidget {
  const ProductListScreen({Key? key}) : super(key: key);

  @override
  State<ProductListScreen> createState() => _ProductListScreenState();
}

class _ProductListScreenState extends State<ProductListScreen> {
  final TextEditingController _searchController = TextEditingController();
  String _searchKeyword = '';
  String _selectedCategory = 'Semua'; // Default category

  final List<String> categories = ['Semua', 'Custom Cardigan', 'Karakter Cardigan', 'Rajut Cardigan', 'Pastel Cardigan', 'Cardigan Pria'];

  final List<Map<String, dynamic>> products = [
    // Custom Cardigan
    {
      'name': 'Custom Cardigan "Kesha" - Baby Blue',
      'price': 'Rp 250.000',
      'image': 'assets/images/custom_cardigan1.jpg',
      'description': 'Dengan latar biru muda, cardigan ini dipenuhi karakter dan warna yang lembut serta menggemaskan. Nama KESHA muncul dalam huruf besar berwarna pink di bagian atas kiri. Di sekitarnya terdapat gambar kelinci pink, beruang kuning, jamur merah, dan awan kecil tersenyum. Gaya ini cocok untuk seseorang yang menyukai estetika kawaii atau imut serta suasana ceria.',
      'category': 'Custom Cardigan',
    },
    {
      'name': 'Custom Cardigan "Rike" - Lavender',
      'price': 'Rp 250.000',
      'image': 'assets/images/custom_cardigan2.jpg',
      'description': 'Cardigan ungu muda ini bertemakan bunga-bunga ceria. Terdapat lima bunga dengan wajah tersenyum dalam berbagai warna pastel seperti pink, kuning, biru, dan ungu. Nama RIKE ditulis dalam huruf besar berwarna pink cerah. Gaya ini menonjolkan keceriaan, kehangatan, dan keindahan alam, sangat cocok untuk tampilan yang feminin dan positif.',
      'category': 'Custom Cardigan',
    },
    {
      'name': 'Custom Cardigan "Deris" - Brown',
      'price': 'Rp 250.000',
      'image': 'assets/images/custom_cardigan3.jpg',
      'description': 'Cardigan ini berwarna cokelat muda dengan tema yang menyenangkan dan personal. Di bagian depannya terdapat gambar katak hijau, sepotong pizza dengan topping pepperoni, serta stik game biru yang menunjukkan minat terhadap dunia gaming dan makanan cepat saji. Nama DERIS ditampilkan jelas dalam huruf besar berwarna ungu muda. Cardigan ini cocok bagi seseorang yang menyukai gaya fun, kasual, dan penuh karakter.',
      'category': 'Custom Cardigan',
    },
    {
      'name': 'Custom Cardigan "Deris" - Yellow',
      'price': 'Rp 250.000',
      'image': 'assets/images/custom_cardigan4.jpg',
      'description': 'Tampil stylish dan nyaman dengan cardigan rajut berwarna kuning mustard yang cerah dan hangat ini. Didesain dengan model V-neck klasik, lengkap dengan kancing hitam elegan di bagian depan. Bagian dada kiri dihiasi bordir tulisan "DERIS" berwarna biru tua yang memberikan kesan vintage dan sporty.',
      'category': 'Custom Cardigan',
    },

    // Karakter Cardigan
    {
      'name': 'Pet Lovers Cardigan - Cozy Brown',
      'price': 'Rp 270.000',
      'image': 'assets/images/char_cardigan1.jpg',
      'description': 'Cardigan ini juga memiliki warna dasar cokelat muda, namun dengan tema berbeda: hewan peliharaan. Terdapat ilustrasi kucing oranye, anjing putih dengan telinga cokelat, serta beberapa jejak kaki berwarna hitam. Sebuah kaleng makanan hewan dengan gambar ikan menambah nuansa realistis yang lucu. Desain ini menggambarkan kasih sayang terhadap binatang dan cocok untuk pecinta hewan.',
      'category': 'Karakter Cardigan',
    },
    {
      'name': 'Bunny Pattern Cardigan - Peach',
      'price': 'Rp 270.000',
      'image': 'assets/images/char_cardigan2.jpg',
      'description': 'Warna oranye cerah dan motif kelinci putih yang menggemaskan menjadikan cardigan ini pilihan sempurna untuk kamu yang menyukai gaya cute dan fun. Detail bordir pada motif kelinci menambah kesan handmade dan unik. Cocok digunakan untuk aktivitas kasual atau jadi outfit spesial untuk photoshoot bergaya aesthetic atau dreamy.',
      'category': 'Karakter Cardigan',
    },
    {
      'name': 'Daisy Garden Cardigan - Pink',
      'price': 'Rp 270.000',
      'image': 'assets/images/char_cardigan5.jpg',
      'description': 'Berwarna pink pastel lembut, cardigan ini dihiasi dengan motif bunga putih besar di bagian depan yang mencuri perhatian. Kombinasi ini menciptakan tampilan feminim dan romantis, cocok untuk pecinta gaya girly dan vintage. Cardigan ini cocok dipadukan dengan rok mini atau celana putih untuk tampilan clean dan anggun.',
      'category': 'Karakter Cardigan',
    },
    {
      'name': 'Hearts & Daisies Cardigan - Lilac',
      'price': 'Rp 270.000',
      'image': 'assets/images/char_cardigan6.jpg',
      'description': 'Cardigan dengan warna ungu muda ini memadukan dua elemen desain lucu: motif hati berwarna senada dan bunga putih. Potongan simpel dengan detail manis ini cocok untuk kamu yang suka tampil manis, lembut, dan estetik. Ideal untuk gaya Korean look, casual date outfit, atau sekadar tampil modis saat ngopi santai.',
      'category': 'Karakter Cardigan',
    },
    {
      'name': 'Starry Sky Cardigan - Baby Blue',
      'price': 'Rp 270.000',
      'image': 'assets/images/char_cardigan4.jpg',
      'description': 'Cardigan ini tampil sangat dreamy dengan warna dasar biru langit yang tenang, dihiasi motif awan putih dan bintang kuning. Desainnya cocok untuk pecinta langit, mimpi, dan hal-hal whimsical. Gaya ini cocok dipakai untuk photoshoot bertema celestial, OOTD Tumblr-style, atau jadi outfit spesial untuk mood yang dreamy dan kreatif.',
      'category': 'Karakter Cardigan',
    },
    {
      'name': 'Teddy Bear Cardigan - Warm Orange',
      'price': 'Rp 270.000',
      'image': 'assets/images/char_cardigan3.jpg',
      'description': 'Mengusung warna oranye bata yang hangat, cardigan ini memiliki daya tarik utama pada motif kepala beruang kartun besar di bagian depan. Motif ini memberikan nuansa lucu, friendly, dan kekinian, cocok untuk kamu yang ingin tampil beda dengan sentuhan playful. Cardigan ini sangat cocok dipakai saat hangout santai atau foto-foto bergaya kawaii.',
      'category': 'Karakter Cardigan',
    },

    // Rajut Cardigan
    {
      'name': 'Diamond Knit Cardigan - Butter Yellow',
      'price': 'Rp 300.000',
      'image': 'assets/images/knit_cardigan1.jpg',
      'description': 'Cardigan berwarna kuning mustard ini tampil standout dengan motif rajut pola berlian timbul yang klasik dan unik. Desain rajutannya memberi kesan retro dan tebal, cocok untuk cuaca dingin atau gaya semi-formal yang tetap santai. Kancing besar senada memperkuat tampilan vintage-nya. Cocok dipadukan dengan celana bahan atau rok denim untuk look kasual-retro yang effortless.',
      'category': 'Rajut Cardigan',
    },
    {
      'name': 'Lattice Pattern Cardigan - Mint Green',
      'price': 'Rp 300.000',
      'image': 'assets/images/knit_cardigan2.jpg',
      'description': 'Dengan warna hijau mint yang lembut dan menenangkan, cardigan ini hadir dengan rajutan tekstur halus yang memberi kesan estetik dan minimalis. Gaya Korean style sangat terasa dari potongan simpel dan pilihan warnanya. Kancing depan warna senada membuat tampilan semakin clean. Cardigan ini cocok untuk kamu yang menyukai gaya feminim, manis, dan kekinian.',
      'category': 'Rajut Cardigan',
    },
    {
      'name': 'Cable Knit Cardigan - Ivory White',
      'price': 'Rp 300.000',
      'image': 'assets/images/knit_cardigan3.jpg',
      'description': 'Cardigan rajut tebal ini menggunakan teknik cable knit klasik yang populer di gaya Eropa. Warna krem netral memberi nuansa hangat dan elegan, sangat versatile untuk berbagai warna outfit. Cocok dipakai saat musim hujan atau dingin, dan bisa dipadukan dengan jeans, rok panjang, atau sepatu boots untuk tampilan cozy ala Pinterest girl.',
      'category': 'Rajut Cardigan',
    },

    // Pastel Cardigan
    {
      'name': 'Rainbow Stripes Cardigan - Sweet Pink',
      'price': 'Rp 320.000',
      'image': 'assets/images/pastel_cardigan1.jpg',
      'description': 'Cardigan ini menampilkan kombinasi garis-garis horizontal dengan warna pastel lembut seperti pink muda, kuning, dan biru. Desainnya ceria, cocok untuk kamu yang ingin tampil menyenangkan dan positif. Gaya ini memberi kesan youthful dan cocok digunakan saat piknik, hangout, atau untuk tampilan Instagramable yang cerah dan colorful.',
      'category': 'Pastel Cardigan',
    },
    {
      'name': 'Color Block Cardigan - Pastel Dream',
      'price': 'Rp 320.000',
      'image': 'assets/images/pastel_cardigan2.jpg',
      'description': 'Cardigan ini memadukan berbagai warna pastel—pink, biru langit, ungu, dan hijau mint—dalam desain color block yang trendi. Potongannya simple namun playful, cocok untuk kamu yang suka tampil beda dan ceria. Style ini sangat populer di kalangan remaja dan cocok untuk gaya kasual harian, terutama dipadukan dengan sneakers dan sling bag mini.',
      'category': 'Pastel Cardigan',
    },

    // Cardigan Pria
    {
      'name': 'Classic Green Cardigan',
      'price': 'Rp 400.000',
      'image': 'assets/images/men_cardigan1.jpg',
      'description': 'Cardigan klasik berwarna hijau forest yang elegan dengan potongan slim fit modern. Terbuat dari bahan wool premium yang nyaman dan hangat, dilengkapi dengan kancing hitam yang kontras dan dua saku fungsional. Cocok untuk gaya smart casual di kantor atau acara semi formal.',
      'category': 'Cardigan Pria',
    },
    {
      'name': 'Soccer Spirit Cardigan - Navy',
      'price': 'Rp 400.000',
      'image': 'assets/images/men_cardigan2.jpg',
      'description': 'Cardigan sporty berwarna biru navy dengan patch bola sepak yang ikonik di bagian dada. Desain yang menggabungkan gaya kasual dan semangat olahraga, sempurna untuk penggemar sepak bola. Material katun premium memberikan kenyamanan maksimal untuk aktivitas sehari-hari.',
      'category': 'Cardigan Pria',
    },
    {
      'name': 'Ivory Striped Cardigan',
      'price': 'Rp 420.000',
      'image': 'assets/images/men_cardigan3.jpg',
      'description': 'Cardigan bergaris horizontal dengan warna dasar krem yang timeless. Pattern bergaris halus menciptakan ilusi yang menarik dan elegan. Potongan regular fit yang nyaman dengan ribbing di bagian lengan dan pinggang. Ideal untuk gaya preppy atau smart casual yang sophisticated.',
      'category': 'Cardigan Pria',
    },
    {
      'name': 'Skull Pattern Cardigan - Orange',
      'price': 'Rp 465.000',
      'image': 'assets/images/men_cardigan4.jpg',
      'description': 'Cardigan statement dengan warna oranye terang dan motif tengkorak yang edgy. Desain berani yang sempurna untuk pria yang ingin tampil beda dan ekspresif. Material premium dengan tekstur rajut yang nyaman, cocok untuk gaya street style atau casual yang eye-catching.',
      'category': 'Cardigan Pria',
    },
    {
      'name': 'Brown Monogram Cardigan',
      'price': 'Rp 500.000',
      'image': 'assets/images/men_cardigan5.jpg',
      'description': 'Cardigan mewah berwarna cokelat dengan pattern monogram yang elegan. Desain yang terinspirasi dari fashion rumah mode terkenal, memberikan kesan luxury dan sophisticated. Material wool blend premium dengan finishing sempurna, ideal untuk acara formal atau semi-formal.',
      'category': 'Cardigan Pria',
    },
    {
      'name': 'Mint Fresh Cardigan',
      'price': 'Rp 400.000',
      'image': 'assets/images/men_cardigan6.jpg',
      'description': 'Cardigan minimalis berwarna mint yang segar dan modern. Potongan slim fit dengan desain clean cut yang versatile. Material katun premium yang breathable dan nyaman, sempurna untuk gaya casual chic atau smart casual yang trendy.',
      'category': 'Cardigan Pria',
    },
    {
      'name': 'Monogram D Pattern Cardigan - Brown',
      'price': 'Rp 465.000',
      'image': 'assets/images/men_cardigan7.jpg',
      'description': 'Cardigan mewah dengan pattern monogram "D" yang elegan di seluruh bagian. Warna coklat yang sophisticated dengan tekstur rajut premium menciptakan tampilan yang luxurious. Dilengkapi dengan kancing hitam yang kontras dan dua saku fungsional. Sempurna untuk acara formal atau semi-formal, memberikan kesan high-end dan berkelas.',
      'category': 'Cardigan Pria',
    },
    {
      'name': 'Checkered Grid Cardigan - Dusty Rose',
      'price': 'Rp 450.000',
      'image': 'assets/images/men_cardigan8.jpg',
      'description': 'Cardigan modern dengan pola grid biru yang kontras di atas warna dasar dusty rose yang trendy. Potongan slim fit yang sempurna dengan detail rajutan yang halus pada bagian lengan dan pinggang. Desain contemporary ini menawarkan tampilan yang sophisticated namun tetap kasual, ideal untuk smart casual meeting atau dinner date.',
      'category': 'Cardigan Pria',
    },
    {
      'name': 'Floral Pattern Cardigan - Butter Yellow',
      'price': 'Rp 500.000',
      'image': 'assets/images/men_cardigan9.jpg',
      'description': 'Cardigan statement dengan motif floral hijau yang artistic di atas warna dasar kuning mentega yang cerah. Desain yang berani namun tetap elegan, menciptakan focal point yang menarik. Material premium dengan tekstur yang lembut dan nyaman dipakai. Perfect untuk pria yang berani tampil beda dan mengapresiasi detail fashion yang unik.',
      'category': 'Cardigan Pria',
    },
  ];

  @override
  void dispose() {
    _searchController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    // Filter produk berdasarkan kata kunci pencarian dan kategori
    final filteredProducts = products.where((product) {
      final name = product['name'].toString().toLowerCase();
      final desc = product['description'].toString().toLowerCase();
      final keyword = _searchKeyword.toLowerCase();
      final category = product['category'].toString();
      
      bool matchesSearch = name.contains(keyword) || desc.contains(keyword);
      bool matchesCategory = _selectedCategory == 'Semua' || category == _selectedCategory;
      
      return matchesSearch && matchesCategory;
    }).toList();

    return Scaffold(
      appBar: AppBar(
        title: const Text("Daftar Produk"),
        elevation: 0,
        actions: [
          IconButton(
            icon: const Icon(Icons.shopping_cart),
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => const CartScreen(),
                ),
              );
            },
          ),
        ],
      ),
      body: Column(
        children: [
          // Search Bar
          Padding(
            padding: const EdgeInsets.fromLTRB(16, 16, 16, 0),
            child: TextField(
              controller: _searchController,
              decoration: InputDecoration(
                hintText: 'Cari produk...',
                prefixIcon: const Icon(Icons.search, color: Colors.pink),
                filled: true,
                fillColor: Colors.pink.withOpacity(0.08),
                contentPadding: const EdgeInsets.symmetric(vertical: 0, horizontal: 16),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(12),
                  borderSide: BorderSide.none,
                ),
              ),
              onChanged: (value) {
                setState(() {
                  _searchKeyword = value;
                });
              },
            ),
          ),
          
          // Category Filter
          Container(
            height: 50,
            margin: const EdgeInsets.symmetric(vertical: 16),
            child: ListView.builder(
              scrollDirection: Axis.horizontal,
              padding: const EdgeInsets.symmetric(horizontal: 16),
              itemCount: categories.length,
              itemBuilder: (context, index) {
                final category = categories[index];
                final isSelected = category == _selectedCategory;
                return Padding(
                  padding: const EdgeInsets.only(right: 8),
                  child: FilterChip(
                    label: Text(category),
                    selected: isSelected,
                    onSelected: (selected) {
                      setState(() {
                        _selectedCategory = category;
                      });
                    },
                    backgroundColor: Colors.grey[200],
                    selectedColor: Colors.pink[100],
                    checkmarkColor: Colors.pink,
                    labelStyle: TextStyle(
                      color: isSelected ? Colors.pink : Colors.black87,
                      fontWeight: isSelected ? FontWeight.bold : FontWeight.normal,
                    ),
                  ),
                );
              },
            ),
          ),

          // Grid Produk
          Expanded(
            child: filteredProducts.isEmpty
                ? const Center(
                    child: Text(
                      'Produk tidak ditemukan',
                      style: TextStyle(
                        fontSize: 18,
                        color: Colors.pink,
                      ),
                    ),
                  )
                : GridView.builder(
                    padding: const EdgeInsets.all(16),
                    gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 2,
                      childAspectRatio: 0.75,
                      crossAxisSpacing: 16,
                      mainAxisSpacing: 16,
                    ),
                    itemCount: filteredProducts.length,
                    itemBuilder: (context, index) {
                      final product = filteredProducts[index];
                      return GestureDetector(
                        onTap: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => ProductDetailScreen(
                                product: product,
                              ),
                            ),
                          );
                        },
                        child: Card(
                          elevation: 2,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(12),
                          ),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              // Gambar Produk
                              Expanded(
                                child: ClipRRect(
                                  borderRadius: const BorderRadius.vertical(
                                    top: Radius.circular(12),
                                  ),
                                  child: Image.asset(
                                    product['image'],
                                    fit: BoxFit.cover,
                                    width: double.infinity,
                                    errorBuilder: (context, error, stackTrace) {
                                      return Container(
                                        color: Colors.grey[200],
                                        child: const Center(
                                          child: Icon(
                                            Icons.error_outline,
                                            color: Colors.grey,
                                          ),
                                        ),
                                      );
                                    },
                                  ),
                                ),
                              ),
                              // Info Produk
                              Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      product['name'],
                                      style: const TextStyle(
                                        fontSize: 16,
                                        fontWeight: FontWeight.bold,
                                      ),
                                      maxLines: 2,
                                      overflow: TextOverflow.ellipsis,
                                    ),
                                    const SizedBox(height: 4),
                                    Text(
                                      product['price'],
                                      style: const TextStyle(
                                        fontSize: 14,
                                        color: Colors.green,
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),
                                    const SizedBox(height: 4),
                                    Text(
                                      product['category'],
                                      style: TextStyle(
                                        fontSize: 12,
                                        color: Colors.grey[600],
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          ),
                        ),
                      );
                    },
                  ),
          ),
        ],
      ),
    );
  }
} 