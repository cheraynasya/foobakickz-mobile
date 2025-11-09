# foobakickz_mobile

## Pertanyaan Tugas 7

1. Jelaskan apa itu widget tree pada Flutter dan bagaimana hubungan parent-child (induk-anak) bekerja antar widget. 
   
   Widget tree adalah struktur hierarkis dari seluruh widget yang membentuk antarmuka aplikasi flutter. 
   Hubungan parent-child (induk-anak) dalam struktur ini adalah widget induk (parent) bertugas menyusun dan mengatur tata letak widget anak (child). Setiap widget hanya punya satu induk, tetapi bisa memiliki satu child atau beberapa children. Saat ada data atau state yang berubah, flutter melakukan rebuild pada bagian yang relevan sehingga tampilan ikut terbarui.

2. Sebutkan semua widget yang kamu gunakan dalam proyek ini dan jelaskan fungsinya.
   
   Dalam proyek ini saya menggunakan beberapa widget untuk membangun antarmuka: MaterialApp sebagai wadah utama untuk tema dan routing; Scaffold sebagai kerangka halaman yang menyediakan AppBar, body, dan area snackbar; serta AppBar untuk judul dan navigasi atas. Untuk konten digunakan Text dan Icon, sementara Padding, SizedBox, dan Container dipakai untuk pengaturan ruang dan ukuran. Tata letak disusun dengan Row, Column, dan Center, dan koleksi item ditampilkan menggunakan GridView.count. Untuk menonjolkan elemen dipakai Card dan Material, serta InkWell agar area tersebut responsif terhadap ketukan dengan efek ripple. Interaksi dan notifikasi singkat ditangani dengan ScaffoldMessenger.of(context) yang menampilkan SnackBar, sedangkan Theme.of(context) dan MediaQuery.of(context) dipakai untuk mengambil konfigurasi tema serta informasi ukuran layar. Selain itu ada komponen kustom InfoCard dan ItemCard sebagai reusable widgets, serta model ItemHomepage untuk menyimpan data nama dan ikon tiap tombol.

3. Apa fungsi dari widget MaterialApp? Jelaskan mengapa widget ini sering digunakan sebagai widget root.
   
   MaterialApp berfungsi untuk mengatur konfigurasi aplikasi tingkat atas seperti tema, navigasi (routes), dan setting Material Design lainnya.
   Widget ini sering digunakan sebagai widget root karena banyak widget Material (seperti Scaffold, AppBar) sangat bergantung pada konfigurasi ini. Dengan meletakkan MaterialApp di paling atas, seluruh sub-tree dapat mengakses layanan global dan tema secara konsisten di seluruh aplikasi.

4. Jelaskan perbedaan antara StatelessWidget dan StatefulWidget. Kapan kamu memilih salah satunya?
   
   Perbedaan mendasar terletak pada kemampuan untuk mengelola data yang berubah (state).
   - StatelessWidget: tidak menyimpan state internal yang berubah, tampilannya tetap selama properti tidak diubah dari parent. Cocok untuk komponen yang hanya menampilkan data statis (seperti InfoCard, ItemCard). 
   - StatefulWidget: memiliki objek state yang bisa berubah selama lifecycle, perubahan state memicu setState() sehingga widget di-rebuild. Cocok untuk menampung interaksi atau data yang berubah (seperti form, counter, data dinamis).

5. Apa itu BuildContext dan mengapa penting di Flutter? Bagaimana penggunaannya di metode build?
   
   BuildContext adalah sebuah referensi yang menunjuk ke lokasi widget dalam widget tree.
   Dengan context, widget dapat mengakses layanan dan data dari ancestor, seperti Theme.of(context), MediaQuery.of(context), atau ScaffoldMessenger.of(context). Oleh karena itu BuildContext selalu menjadi parameter pada build(BuildContext context) dan penting untuk berinteraksi dengan lingkungan widget.

6. Jelaskan konsep "hot reload" di Flutter dan bagaimana bedanya dengan "hot restart".
   - Hot reload: Perubahan kode dart diterapkan pada proses aplikasi yang sedang berjalan sehingga UI segera ter-refresh, sementara status runtime tetap dipertahankan. Cocok untuk iterasi cepat pada tampilan atau perubahan logika ringan. 
   - Hot restart: Proses aplikasi dan VM di-reset lalu aplikasi dijalankan ulang dari nol, sehingga semua state runtime terhapus. Digunakan saat perubahan memengaruhi inisialisasi atau struktur aplikasi yang memerlukan restart penuh, umumnya memakan waktu lebih lama dibanding hot reload.

## Pertanyaan Tugas 8

1. Jelaskan perbedaan antara Navigator.push() dan Navigator.pushReplacement() pada Flutter. Dalam kasus apa sebaiknya masing-masing digunakan pada aplikasi Football Shop kamu?

   Perbedaan utama terletak pada bagaimana halaman baru ditempatkan dalam stack navigasi (tumpukan riwayat halaman). 
   - Navigator.push(), menambahkan halaman baru ke atas stack navigasi. Halaman sebelumnya tetap ada, sehingga pengguna dapat kembali dengan menekan tombol back.
     - Penggunaan pada Football Shop: Cocok ketika pengguna perlu kembali ke halaman sebelumnya, seperti kembali dari halaman detail produk ke halaman daftar produk.
   - Navigator.pushReplacement(), menggantikan halaman yang sedang aktif saat ini di tumpukan dengan halaman yang baru. Halaman sebelumnya dihapus dari stack, sehingga pengguna tidak dapat kembali ke halaman yang telah diganti. 
     - Penggunaan pada Football Shop: Cocok untuk navigasi melalui drawer antar halaman utama (misalnya dari home ke halaman tambah produk). Untuk mencegah penumpukan halaman yang tidak perlu dan menjaga perilaku tombol back tetap sesuai (keluar aplikasi, bukan kembali ke halaman lama).

2. Bagaimana kamu memanfaatkan hierarchy widget seperti Scaffold, AppBar, dan Drawer untuk membangun struktur halaman yang konsisten di seluruh aplikasi? 

   Struktur halaman dibangun menggunakan kombinasi Scaffold, AppBar, dan Drawer:
   - Scaffold, digunakan sebagai kerangka dasar setiap halaman untuk menyediakan area tampilan utama. Setiap halaman penting (seperti MyHomePage dan ProductFormPage) menggunakan Scaffold untuk menyediakan area standar untuk AppBar dan Body.
   - AppBar, ditempatkan di dalam Scaffold. AppBar memberikan judul aplikasi yang konsisten di bagian atas setiap halaman dan secara otomatis menampilkan ikon hamburger untuk membuka drawer.
   - Drawer, dibuat terpisah sebagai widget reusable (LeftDrawer) dan dipasang pada semua halaman utama, sehingga menu navigasi tetap seragam di seluruh aplikasi.

3. Dalam konteks desain antarmuka, apa kelebihan menggunakan layout widget seperti Padding, SingleChildScrollView, dan ListView saat menampilkan elemen-elemen form? Berikan contoh penggunaannya dari aplikasi kamu.

   Layout widget sangat penting untuk memastikan formulir (seperti di ProductFormPage) mudah digunakan dan tampil baik di berbagai perangkat.
   - SingleChildScrollView, kelebihan utamanya adalah mencegah overflow error (konten berlebih) yang sering terjadi saat keyboard virtual muncul di layar. Dengan membungkus semua elemen form, pengguna selalu bisa menggulir untuk melihat semua input field, termasuk tombol Save di bagian bawah.
   - Padding, digunakan untuk memberikan jarak antar elemen agar tampilan lebih rapi dan mudah dibaca, mencegah input field menempel ke tepi layar atau menumpuk satu sama lain.
   - Column atau ListView, digunakan untuk menyusun elemen-elemen form secara vertikal dan teratur, yang merupakan standar dalam desain antarmuka formulir.

4. Bagaimana kamu menyesuaikan warna tema agar aplikasi Football Shop memiliki identitas visual yang konsisten dengan brand toko?

   Penyesuaian warna tema dilakukan di dua tempat untuk mencapai konsistensi sekaligus memberikan identitas visual yang unik pada halaman form:
   - Pada main.dart, warna utama aplikasi ditetapkan pada file main.dart menggunakan primarySwatch: Colors.blue. Warna ini menentukan warna default untuk elemen-elemen seperti AppBar di halaman utama (MyHomePage), membangun identitas visual biru untuk Foobakickz.
   - Pada product_form_page.dart, Warna di halaman form diubah menjadi warna lain untuk AppBar dan tombol Save. Hal ini dilakukan untuk memberi pembeda visual sekaligus memperkuat identitas toko.