## Tugas 7
1. Widget tree pada Flutter adalah representasi hierarki dari seluruh elemen antarmuka pengguna (UI) dalam aplikasi. Setiap elemen di Flutter merupakan sebuah widget, dan semua widget tersusun dalam bentuk pohon, di mana setiap node memiliki hubungan induk (parent) dan anak (child). Hubungan parent-child ini memungkinkan Flutter membangun UI secara deklaratif, di mana setiap perubahan pada state akan menyebabkan rebuild hanya pada bagian pohon yang terpengaruh.
    - Parent widget berperan sebagai wadah (container) yang dapat mengatur tata letak dan perilaku dari child widget di dalamnya.
    - Child widget menerima konfigurasi dari parent-nya dan menggambar dirinya di layar sesuai instruksi tersebut.

2. Widget digunakan untuk menyusun tampilan aplikasi.
    - MaterialApp : Widget utama yang membungkus seluruh aplikasi dan menyediakan tema serta navigasi.
    - Scaffold : Menyediakan struktur dasar halaman seperti AppBar, Body, FloatingActionButton
    - AppBar : Menampilkan bilah atas (top bar) dengan judul, ikon, atau tombol aksi.
    - Text : Menampilkan teks di layar.
    - Center : Menempatkan child widget tepat di tengah layar.
    - Column / Row : Menyusun widget secara vertikal (Column) atau horizontal (Row).
    - Container : Wadah fleksibel yang bisa diberi padding, margin, warna, dan ukuran.
    - ElevatedButton : Tombol dengan efek bayangan yang bisa ditekan untuk menjalankan aksi.

3. Widget MaterialApp dalam aplikasi Flutter berfungsi sebagai kerangka utama berbasis Material Design. Dijadikan sebagai widget root karena menyediakan berbagai fitur penting seperti pengaturan tema global aplikasi (warna dan font), sistem navigasi antarhalaman melalui Navigator, dan kemampuan untuk menentukan halaman utama dengan properti home. Selain itu, MaterialApp juga menangani pengaturan arah teks dan mendukung sistem localization, sehingga memudahkan pengembang dalam membuat aplikasi yang konsisten dan terintegrasi dengan gaya Android modern.

4. StatelessWidget adalah widget yang tidak memiliki state atau kondisi internal. Widget jenis ini bersifat statis yang artinya tampilannya hanya bergantung pada data eksternal dan tidak berubah setelah dibangun. Sedangkan, StatefulWidget memiliki state yang bisa berubah selama aplikasi berjalan. Widget ini digunakan untuk elemen dinamis seperti input form, penghitung angka, atau tampilan yang berubah akibat interaksi pengguna. Menggunakan StatelessWidget untuk elemen yang tidak berubah, dan StatefulWidget jika widget perlu memperbarui tampilannya berdasarkan interaksi atau perubahan data.

5. BuildContext adalah objek penting dalam Flutter yang digunakan untuk menjelaskan posisi suatu widget di dalam struktur widget tree. Setiap kali Flutter membangun antarmuka, objek BuildContext akan dikirimkan sebagai argumen ke metode build(). Objek ini memungkinkan widget untuk mengakses informasi tentang hierarki di atasnya. BuildContext mempunyai beberapa tugas sendiri, yaiut: mengakses tema global melalui Theme.of(context) agar tampilan sesuai dengan pengaturan MaterialApp, mengakses fungsi navigasi melalui Navigator.of(context) untuk berpindah antar halaman, menampilkan pesan atau notifikasi seperti SnackBar menggunakan ScaffoldMessenger.of(context).

6. Digunakan untuk memperbarui aplikasi tanpa perlu menghentikan proses kompilasi sepenuhnya.
    - Hot Reload memperbarui kode dan langsung menampilkan perubahan pada aplikasi yang sedang berjalan tanpa menghapus state. Untuk memperbarui antarmuka pengguna secara cepat, misalnya ketika mengubah warna tema, menambahkan teks, atau memperbaiki tata letak. Karena tidak menghapus state, data yang sudah dimasukkan sebelumnya tetap tersimpan.
    - Hot Restart menjalankan ulang seluruh aplikasi dari awal dan menghapus semua state. Proses ini memastikan bahwa seluruh variabel dan data terinisialisasi ulang seperti saat aplikasi baru dijalankan. Hot Restart biasanya digunakan ketika terjadi perubahan besar pada struktur kode atau logika bisnis yang tidak dapat diperbarui melalui Hot Reload.

## Tugas 8
1. 
    - push() menambahkan halaman baru di atas stack. Pengguna bisa tekan Back untuk kembali ke halaman sebelumnya. Cocok untuk alur “buka form dari menu lalu kembali ke menu”. Contoh: tombol Create Product → Form memakai push() agar setelah submit kamu bisa kembali ke menu. 
    - pushReplacement() mengganti halaman aktif dengan halaman baru (menghapus halaman lama dari stack). Pengguna tidak bisa kembali. Cocok untuk alur “pindah lewat Drawer” agar tidak menumpuk riwayat halaman. Contoh: Drawer: Tambah Produk dari Halaman Utama pakai pushReplacement() supaya Back tidak memantul ke halaman lama.

2. AppBar memberi identitas halaman (judul “Football Shop” atau “Tambah Produk”) sekaligus tempat aksi global. Drawer berfungsi sebagai navigasi tingkat atas yang selalu muncul dengan gaya yang sama di semua halaman; setiap item menu men-trigger pushReplacement() agar perpindahan antarlaman terasa “bersih” tanpa back-stack berlapis. Dengan pola ini, pengguna merasakan antarmuka yang stabil: posisi AppBar konsisten, Drawer identik, dan konten spesifik cukup kamu ganti di body.

3. Kelebihan Padding, SingleChildScrollView, dan ListView untuk form
Padding membuat form ada jarak antar elemen rapi sehingga label, input, dan tombol mudah dipindai. SingleChildScrollView memastikan form tetap bisa di-scroll saat keyboard muncul atau di layar kecil. tidak ada field yang kwepotong di bawah layar. ListView (atau Column di dalam SingleChildScrollView) menyusun field secara vertikal teratur, memudahkan penambahan field baru tanpa repot mengatur tinggi konten. Di halaman Tambah Produk, kamu menempatkan Form sebagai induk, lalu membungkus isinya dengan SingleChildScrollView berpadding, dan menyusun TextFormField (name, price, description), DropdownButtonFormField category, hingga tombol Save dalam kolom/daftar. Validasi tiap field dijalankan lewat FormState.validate(), dan setelah validasi sukses akan menampilkan AlertDialog untuk periksa data.

4. Mengatur tema warna secara global lewat ThemeData di MaterialApp, bukan dengan memberi warna satu per satu pada setiap widget. Langkah ini memastikan seluruh tampilan—mulai dari AppBar, tombol, form input, hingga snackbar—mengikuti palet warna yang sama. Pendekatan ini secara otomatis menghasilkan kombinasi warna harmonis yang dipakai di seluruh aplikasi.

Dengan menetapkan colorScheme, tidak perlu lagi menulis backgroundColor: Colors.blue di setiap widget. Warna dari tema akan langsung diterapkan pada tombol, border input, dan teks. Bisa menyesuaikan gaya AppBarTheme, ElevatedButtonTheme, serta InputDecorationTheme agar tampilan semua halaman seragam. Contohnya, AppBar di setiap halaman akan memiliki warna dan gaya teks yang sama, tombol “Save” di form tampil konsisten dengan tombol lain di beranda, dan seluruh form memiliki gaya border yang identik.

## Tugas 9
1. untuk mengubah data mentah berupa JSON (yang tidak terstruktur dan bertipe data dinamis) menjadi objek Dart yang terstruktur dan memiliki tipe data yang jelas (strongly-typed).

Konsekuensi jika tidak menggunakan model (langsung Map<String, dynamic>):
    - Validasi Tipe (Type Safety): akan kehilangan fitur pengecekan tipe data oleh kompiler. Misalnya, bisa tidak sengaja memasukkan String ke variabel yang seharusnya int, yang baru akan ketahuan saat aplikasi crash ketika dijalankan (runtime error).
    - Null-Safety: Sangat sulit untuk menjamin apakah suatu field ada atau bernilai null. Dengan model, bisa mendefinisikan field mana yang required atau nullable (tanda ?), sehingga Dart bisa memperingatkan jika ada potensi error null.
    - Maintainability & Readability: Kode menjadi sulit dibaca dan dirawat. harus menghafal "kunci string" (seperti data['fields']['name']) di seluruh kode. Jika nama field di backend berubah, harus mencari dan mengganti teks string tersebut satu per satu di seluruh aplikasi, yang sangat rawan typo. Dengan model, cukup mengubah di satu file model saja

2. package http: library dasar untuk melakukan permintaan jaringan (HTTP Request) seperti GET, POST, PUT, DELETE ke server. Namun, library ini bersifat stateless, artinya tidak menyimpan informasi sesi (session/cookies) antar permintaan secara otomatis.

CookieRequest (dari pbp_django_auth): wrapper atau pembungkus di atas library http yang dirancang khusus untuk menangani manajemen sesi (cookies).

Perbedaannya: Ketika Login menggunakan Django, server memberikan "Session ID" dalam bentuk Cookie. http biasa akan melupakan cookie ini pada request berikutnya, sehingga server menganggap belum login. Sebaliknya, CookieRequest menyimpan cookie tersebut dan menyertakannya secara otomatis di setiap request berikutnya (seperti GET list product atau POST create product), sehingga status login pengguna tetap terjaga.

3. nstance CookieRequest perlu dibagikan agar state login konsisten di seluruh aplikasi.

Cookie (penanda bahwa user sudah login) disimpan di dalam variabel instance CookieRequest. Jika membuat instance baru (CookieRequest request = CookieRequest()) di setiap halaman (Login Page punya sendiri, Home Page punya sendiri), maka:
- Saat user Login di halaman Login, cookie tersimpan di Instance A.
- Saat user pindah ke Home Page dan membuat Instance B, Instance B masih kosong (tidak punya cookie).
- Akibatnya, saat Home Page meminta data ke Django, Django akan menolak karena menganggap user belum login.

Dengan membagikan satu instance yang sama menggunakan Provider di root (main.dart), semua halaman mengakses "kantong cookie" yang sama.

4. 
- 10.0.2.2 pada ALLOWED_HOSTS: Emulator Android menggunakan alamat IP khusus 10.0.2.2 untuk berkomunikasi dengan localhost tempat server Django berjalan. Django secara default memblokir request dari host yang tidak dikenal demi keamanan. Perlu menambahkan IP ini agar Django mau menerima request dari emulator.

- CORS : Diperlukan terutama jika menjalankan Flutter di Web (Chrome). Browser memblokir request antar domain yang berbeda (Flutter di port sembarang, Django di 8000) kecuali server mengizinkannya lewat header CORS.

- SameSite/Cookie: Pengaturan ini diperlukan agar cookie sesi dapat dikirimkan dengan aman, terutama dalam konteks cross-site atau saat pengembangan lokal.

- Izin Internet Android: Android secara default mematikan akses internet aplikasi demi privasi. Harus menambahkan <uses-permission android:name="android.permission.INTERNET"/> di AndroidManifest.xml agar aplikasi boleh mengirim request keluar

Aplikasi akan mengalami error koneksi (seperti SocketException, Connection Refused, atau 403 Forbidden), data tidak akan muncul, dan login akan gagal.

5. 
- Input: Pengguna mengisi form (Nama, Harga, Deskripsi) di Flutter (ProductFormPage).
- Serialisasi: Data dari form dikonversi menjadi format JSON menggunakan jsonEncode.
- Request POST: Flutter mengirim HTTP POST request ke endpoint Django (/create-flutter/) menggunakan CookieRequest.
- Django menerima request.
- View create_product_flutter mem-parsing JSON body.
- Django membuat objek Product baru dan menyimpannya ke database.
- Django mengembalikan respons JSON {"status": "success"}.
- Feedback: Flutter menerima respons sukses, menutup form, dan menampilkan SnackBar.
- Halaman daftar produk (ProductListPage) memanggil endpoint JSON (/json/).
- Django mengambil semua data dari database, mengubahnya ke JSON (serialisasi), dan mengirimnya balik.
- Deserialisasi & Render: Flutter menerima JSON, mengubahnya kembali menjadi list objek Product (model Dart), dan menampilkannya menggunakan ListView .

6. 
- Login:
    - User input username & password di Flutter.
    - Flutter mengirim POST ke /auth/login/.
    - Django memverifikasi kredensial. Jika benar, Django membuat Session di server dan mengirimkan Session ID lewat header Set-Cookie ke Flutter.
    - CookieRequest di Flutter menangkap dan menyimpan cookie tersebut.

- Register:
    - User input data registrasi.
    - Flutter mengirim POST ke /auth/register/.
    - Django membuat User baru di database menggunakan User.objects.create_user.

- Logout:
    - Flutter mengirim request ke /auth/logout/ membawa cookie session yang sedang aktif.
    - Django menghapus sesi tersebut di server (invalidasi).
    - CookieRequest di Flutter menghapus cookie yang disimpannya, sehingga status user kembali menjadi logged out.

7. 
- Menginstal django-cors-headers dan menambahkannya ke INSTALLED_APPS serta MIDDLEWARE di settings.py untuk mengizinkan akses dari Flutter.
- Menambahkan 10.0.2.2, 127.0.0.1, dan localhost ke ALLOWED_HOSTS agar bisa diakses Emulator dan Browser.
- Membuat endpoint API khusus Flutter di views.py yang mengembalikan JSON (bukan HTML):
    - login_user_ajax: Untuk login tanpa CSRF token.
    - register_ajax: Untuk pendaftaran akun baru.
    - logout_flutter: Untuk logout dan return JSON status sukses.
    - create_product_flutter: Menerima payload JSON untuk membuat produk baru.
    - show_json (Modifikasi): Menambahkan logika filter ?filter_user=true untuk menampilkan produk milik user saja.
- Mendaftarkan semua path URL tersebut di urls.py.
- Menjalankan flutter pub add provider pbp_django_auth untuk menginstal library yang dibutuhkan.
- Memodifikasi main.dart untuk membungkus aplikasi dengan Provider yang menyediakan satu instance CookieRequest ke seluruh widget tree.
- Membuat model Product di lib/models/product.dart menggunakan situs Quicktype berdasarkan struktur JSON dari Django.
- Membuat login.dart dan register.dart.
- Menggunakan CookieRequest.login() dan post() untuk menghubungi endpoint Django.
- Menambahkan logika kIsWeb untuk membedakan URL (localhost untuk Web, 10.0.2.2 untuk Android).
- Membuat list_product.dart yang menggunakan FutureBuilder untuk mengambil data dari endpoint /json/.
- Menambahkan logika filter: Jika tombol "My Products" ditekan, URL yang dipanggil ditambahkan parameter ?filter_user=true.
- Membuat product_detail.dart untuk menampilkan detail lengkap atribut model Product saat kartu diklik.
- Memperbarui product_form.dart agar mengirim data menggunakan request.postJson ke endpoint /create-flutter/.
- Memperbarui left_drawer.dart dan menu.dart agar memiliki tombol navigasi ke halaman-halaman di atas.
- Mengimplementasikan tombol Logout di drawer yang memanggil endpoint /auth/logout/ dan menghapus sesi lokal.