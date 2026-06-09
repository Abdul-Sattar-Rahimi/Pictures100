-- ── مرحله ۱: Storage bucket policy ──────────────────────────────
-- این رو در SQL Editor اجرا کن

-- Policy: هر کاربر فقط فایل‌های پوشه خودش رو آپلود کنه
CREATE POLICY "Users upload own folder"
ON storage.objects FOR INSERT
WITH CHECK (bucket_id = 'snapshots');

-- Policy: فایل‌ها به صورت عمومی قابل خواندن باشن (برای نمایش عکس)
CREATE POLICY "Public read snapshots"
ON storage.objects FOR SELECT
USING (bucket_id = 'snapshots');

-- ── مرحله ۲: مطمئن شو bucket وجود داره ──────────────────────────
-- اگه از داشبورد Storage ساختی، این دستور لازم نیست
-- INSERT INTO storage.buckets (id, name, public) VALUES ('snapshots', 'snapshots', true);
