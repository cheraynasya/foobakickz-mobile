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

## Pertanyaan Tugas 9

1. Jelaskan mengapa kita perlu membuat model Dart saat mengambil/mengirim data JSON? Apa konsekuensinya jika langsung memetakan Map<String, dynamic> tanpa model (terkait validasi tipe, null-safety, maintainability)?

   Model Dart (Data Class) perlu dibuat agar data JSON agar API yang tidak terstruktur (Map<String, dynamic>) dapat diubah menjadi objek yang terstruktur dan tipe aman. Model menyediakan method eksplisit seperti fromJson, yang memastikan setiap field memiliki tipe data yang diharapkan (misalnya, int, String, atau DateTime). Kalau langsung mengandalkan Map<String, dynamic> tanpa model, validasi tipe menjadi lemah, autocompletion di IDE hilang, dan risiko runtime error naik saat struktur API berubah atau ada nilai null. Hal ini secara drastis menurunkan maintainability karena refactoring sulit dilakukan, dan menghilangkan manfaat null-safety serta autocompletion dari IDE.

2. Apa fungsi package http dan CookieRequest dalam tugas ini? Jelaskan perbedaan peran http vs CookieRequest.

   Package http berfungsi sebagai library dasar untuk mengirim HTTP request (GET, POST, dll.). Sementara itu, CookieRequest (dari pbp_django_auth) adalah wrapper di atas http yang memiliki peran tambahan dan sangat penting, yaitu mengelola Session Cookie dan CSRF Token. Setelah login berhasil, CookieRequest secara otomatis menangkap cookie sesi yang dikirim oleh Django dan menyimpannya. Untuk setiap permintaan API berikutnya yang memerlukan otentikasi, CookieRequest secara otomatis menyertakan cookie yang tersimpan ini, menjamin bahwa sesi user tetap diakui oleh Django.

3. Jelaskan mengapa instance CookieRequest perlu untuk dibagikan ke semua komponen di aplikasi Flutter.

   Instance CookieRequest perlu dibagikan ke seluruh komponen aplikasi Flutter melalui State Management (menggunakan Provider) karena status otentikasi (session cookie) adalah status global aplikasi. Semua widget yang melakukan operasi terotentikasi (misalnya, menampilkan My Products atau membuat produk) harus menggunakan instance CookieRequest yang sama. Jika setiap widget membuat instance baru, cookie sesi akan hilang, dan Django akan menolak permintaan karena sesi user tidak dikenali, menyebabkan kegagalan otentikasi berulang.

4. Jelaskan konfigurasi konektivitas yang diperlukan agar Flutter dapat berkomunikasi dengan Django. Mengapa kita perlu menambahkan 10.0.2.2 pada ALLOWED_HOSTS, mengaktifkan CORS dan pengaturan SameSite/cookie, dan menambahkan izin akses internet di Android? Apa yang akan terjadi jika konfigurasi tersebut tidak dilakukan dengan benar?

   Agar Flutter dapat berkomunikasi dengan Django, diperlukan beberapa konfigurasi untuk mengatasi hambatan jaringan dan keamanan. Alamat 10.0.2.2 harus ditambahkan ke ALLOWED_HOSTS Django karena ini adalah alamat IP khusus yang digunakan oleh Android Emulator untuk merujuk ke host komputer Anda. CORS diaktifkan (dengan CORS_ALLOW_CREDENTIALS=True) untuk mengizinkan permintaan lintas origin dari Flutter Web/Emulator. Pengaturan SameSite/cookie disesuaikan agar Session ID dan CSRF Token dapat dikirimkan dan diterima dengan benar di lingkungan cross-site. Terakhir, izin akses internet di Android harus ditambahkan di AndroidManifest.xml karena aplikasi seluler secara default tidak memiliki akses jaringan. Jika konfigurasi ini tidak dilakukan, koneksi akan gagal total (network error), atau permintaan akan ditolak oleh Django (Bad Request 400), atau otentikasi akan gagal karena cookie tidak terkirim.

5. Jelaskan mekanisme pengiriman data mulai dari input hingga dapat ditampilkan pada Flutter.

   Mekanisme pengiriman data dimulai ketika user memasukkan data di Flutter (misalnya, ProductFormPage). Data ini kemudian di-serialize (dijadikan format JSON atau form-data) dan dikirim via CookieRequest.post() ke endpoint Django. Di backend, fungsi view Django menerima data, melakukan validasi, dan menyimpannya ke database. Sebaliknya, untuk menampilkan data, Flutter memanggil CookieRequest.get() ke endpoint JSON Django. Django memproses permintaan ini, menarik data dari database, men-serialize menjadi JSON list melalui fungsi helper seperti _serialize_product, dan mengirimkannya. Flutter menerima JSON ini, men-deserialize menjadi Model Dart (misalnya, Product.fromJson), dan menggunakan list Model Dart tersebut untuk membangun widget di UI (misalnya, ListView.builder menampilkan ProductCard).

6. Jelaskan mekanisme autentikasi dari login, register, hingga logout. Mulai dari input data akun pada Flutter ke Django hingga selesainya proses autentikasi oleh Django dan tampilnya menu pada Flutter.

   Mekanisme otentikasi didasarkan pada Session Cookie Django. Saat Register, Flutter mengirim data akun, Django membuat user di database, dan merespons sukses. Saat Login, Flutter mengirim kredensial, dan jika valid, Django mengirimkan header set-cookie yang berisi Session ID dan CSRF Token. CookieRequest di Flutter secara otomatis menangkap dan menyimpan cookie ini di memori, menandakan sesi telah dimulai. Setelah itu, setiap permintaan terotentikasi secara otomatis menyertakan cookie ini. Terakhir, saat Logout, Flutter memanggil request.logout(), yang memicu view Django menghapus Session ID dari database (auth_logout), dan CookieRequest di Flutter menghapus cookie yang tersimpan, mengakhiri sesi, dan mengarahkan user ke halaman login.

7. Jelaskan bagaimana cara kamu mengimplementasikan checklist di atas secara step-by-step! (bukan hanya sekadar mengikuti tutorial).

   Implementasi yang saya lakukan dimulai dengan :
      1) Mengkonfigurasi koneksi di Django (settings.py, CORS, URLs) dan Flutter (AndroidManifest.xml, pbp_django_auth). 
      2) Melakukan Setup State Management dengan menginisialisasi satu instance CookieRequest di main.dart dan sediakan via Provider agar dapat diakses oleh seluruh widget.
      3) Mengimplementasikan Model Dart (Product.dart) dan views Django (_serialize_product) agar komunikasi data menjadi terstruktur. 
      4) Mengimplementasikan Auth Views (login, register) di Django yang mengirim JsonResponse. 
      5) Mengimplementasikan UI Auth di Flutter (LoginPage, RegisterPage) yang menggunakan request.login(). 
      6) Mengimplementasikan Halaman Produk (ProductListPage) dengan FutureBuilder yang memanggil endpoint JSON Django, termasuk endpoint filter /json/user/. 
      7) Mengintegrasikan Menu, membuat MyHomePage dan LeftDrawer dengan logika onTap yang tepat untuk navigasi, dan menambahkan tombol Logout yang memanggil request.logout() untuk mengakhiri sesi.