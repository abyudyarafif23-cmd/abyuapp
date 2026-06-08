appabyu
======

Minimal Jetpack Compose Android sample for the final project scaffold.

Features included:
- Single-activity Jetpack Compose setup
- Navigation between Login / Register / Home
- `AuthViewModel` with in-memory auth and sample CRUD
- `SupabaseService` stub for optional integration
- Image loading via Coil

How to open:
1. Open this folder in Android Studio
2. Let Gradle sync; adjust Android Gradle Plugin / Kotlin versions if needed
3. Run the `app` module on an Android device or emulator

To integrate Supabase, add your `SUPABASE_URL` and `SUPABASE_ANON_KEY` into [app/src/main/java/com/example/appabyu/data/SupabaseService.kt](app/src/main/java/com/example/appabyu/data/SupabaseService.kt#L1).

Quick steps:
 - Create a Supabase project at https://supabase.com
 - Create a table named `items` with columns: `id` (int, primary key), `title` (text), `description` (text), `imageUrl` (text)
 - In Project Settings -> API copy the `anon` key and paste into `SUPABASE_ANON_KEY`
 - Optional: configure storage bucket and use the `uploadImage` method in `SupabaseRepository`

Image upload and picking
- Use the "Pick image" button on the `Home` screen to choose an image from device (sets the item image URL to the content URI). To upload to Supabase storage, call `SupabaseRepository.uploadImage` with the file bytes and a path.

Session & tokens
- After successful login/register the scaffold stores the Supabase `access_token` in memory (`AuthViewModel.authToken`). This token is used for CRUD calls. It's not persisted across app restarts in this scaffold; add secure storage if you need persistence.
 - After successful login/register the scaffold stores the Supabase `access_token` in memory and persists it securely using `EncryptedSharedPreferences` so session survives app restarts.

Notes:
 - The scaffold will fallback to in-memory auth and CRUD if Supabase keys are not configured.
 - Endpoints implemented in `SupabaseRepository` use basic REST; adapt RLS policies as needed.

Final notes
- The scaffold uses a `public` bucket path by default for uploaded images. Change the bucket name in `SupabaseRepository.uploadImageAndGetUrl` calls if needed.
- For production, secure tokens properly, implement refresh tokens, and harden RLS/storage policies on Supabase.
- Consider adding tests and CI; this scaffold focuses on core features for the final project.
