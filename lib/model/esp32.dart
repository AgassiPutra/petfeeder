class ESP32 {
  final int id;
  final String nama;

  ESP32({required this.id, required this.nama});

  factory ESP32.fromJson(Map<String, dynamic> json) {
    return ESP32(
      id: json['id_device'],
      nama: json['nama_device'],
    );
  }

  Map<String, dynamic> toJson() => {
        'nama_device': nama,
      };
}
