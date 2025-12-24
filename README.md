# Roblox Respawn All Players (Private Server)

## Deskripsi
GUI tombol untuk me-respawn semua player di satu server.
Digunakan untuk testing / private server.

## Struktur Roblox
- ServerScriptService
  - RespawnAll_Server.server.lua
- StarterGui
  - RespawnGui
    - RespawnButton (TextButton)
      - LocalScript
- ReplicatedStorage
  - RespawnAllEvent (RemoteEvent)

## Cara Pakai
1. Buat RemoteEvent `RespawnAllEvent` di ReplicatedStorage
2. Taruh server script ke ServerScriptService
3. Buat GUI + LocalScript di StarterGui
4. Ganti UserId admin di server script
5. Test via Start Server + Start Player

## Catatan
Jangan gunakan di server publik tanpa proteksi.
