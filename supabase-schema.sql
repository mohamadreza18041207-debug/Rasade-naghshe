-- ============================================
-- سامانه رصد نقشه پیشرفت - اسکیمای سوپابیس
-- این فایل را در Supabase > SQL Editor > New Query پیست و Run کنید
-- ============================================

-- 1) جدول کاربران (کد + رمز)
create table if not exists app_users (
  id uuid primary key default gen_random_uuid(),
  code text unique not null, -- کد پرسنلی / کد کاربری (مثل 101 یا admin) - با حروف کوچک ذخیره می‌شود
  display_name text not null,
  password_hash text not null,
  role text not null default 'user' check (role in ('admin','user')),
  created_at timestamp with time zone default now()
);

-- 2) جدول داده اصلی (همه چیز در یک ردیف - ساده و کافی برای این پروژه)
-- هر بار کل اپ یک JSON را اینجا upsert می‌کند. برای شروع همین کافیست.
-- اگر خواستید بعداً به جدول‌های جدا (tasks, notes ...) تبدیل کنید، می‌توانید.
create table if not exists app_data (
  id int primary key, -- همیشه 1
  data jsonb not null,
  updated_at timestamp with time zone default now(),
  updated_by uuid references app_users(id)
);

-- 3) RLS را فعلاً خاموش می‌گذاریم چون احراز هویت را خود Node با JWT انجام می‌دهد
-- اگر RLS روشن باشد، با anon key نمی‌توانید بخوانید
alter table app_users disable row level security;
alter table app_data disable row level security;

-- 4) ایندکس برای سرعت
create index if not exists idx_app_users_code on app_users (code);

-- 5) داده اولیه: یک ردیف خالی برای app_data
insert into app_data (id, data) values (1, '{"tasks":[],"notes":[],"owners":[],"pmActivities":[],"pmCounties":[],"pmProgress":{},"pmMeta":null}'::jsonb)
on conflict (id) do nothing;

-- نکته: کاربر admin را خود سرور Node در اولین اجرا می‌سازد (از ADMIN_CODE / ADMIN_PASSWORD در .env)
-- اگر خواستید دستی بسازید:
-- insert into app_users (code, display_name, password_hash, role) values ('admin','مدیر','...hash...','admin');
