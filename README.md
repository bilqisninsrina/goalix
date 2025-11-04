## Tugas 6
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