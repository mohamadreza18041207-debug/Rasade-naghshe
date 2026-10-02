# 📊 سامانه رصد — نسخه تک‌جایی (فقط سوپابیس)

**بدون لیارا، بدون سرور Node — فقط 1 جا: سوپابیس + GitHub Pages**

---

## 🚀 نصب در 3 دقیقه

### 1) سوپابیس
1. `https://supabase.com` → `New Project` → نام `rasad` → `Create` (1 دقیقه)
2. `SQL Editor` → `New Query` → محتوای فایل `supabase-schema.sql` را Paste → `Run`

### 2) گیت‌هاب
```bash
git init
git add .
git commit -m "rasad static"
git branch -M main
git remote add origin https://github.com/YOUR_NAME/rasad.git
git push -u origin main
```

### 3) GitHub Pages (هاست رایگان)
1. در گیت‌هاب برو `Settings` → `Pages`
2. `Build and deployment` → `Source: Deploy from a branch`
3. `Branch: main` + `/(root)` → `Save`
4. بعد 1 دقیقه لینک می‌گیری: `https://YOUR_NAME.github.io/rasad/`

### 4) اولین ورود
1. لینک را باز کن → صفحه **«اتصال به سوپابیس»** می‌آید
2. از `Supabase → Settings → API` بگیر:
   - `Project URL` → بگذار در `SUPABASE_URL`
   - `anon public` → `SUPABASE_ANON_KEY`
3. `ذخیره و ادامه` → صفحه لاگین می‌آید
4. **ورود:** کد `admin` / رمز `Admin@123` (بار اول خودکار ساخته می‌شود)

تمام! از این به بعد هر تغییری در **نگاشت** خودکار در **گانت** می‌آید.

---

## 🔑 مدیریت کاربران

- **ساخت کاربر:** تب `☁️ همگام‌سازی` → `👥 مدیریت کاربران` → `کد: 101` + `نام` + `رمز` → `ایجاد`
- **تغییر رمز خودت:** همان کارت → `رمز فعلی` + `رمز جدید`
- **ریست رمز دیگران (مدیر):** کنار هر کاربر → `رمز جدید` → `ریست`

رمزها با `bcrypt` در مرورگر هش و در `app_users` ذخیره می‌شود.

---

## 📂 ساختار
```
/
├── index.html           # اپ اصلی (100% استاتیک)
├── docmap.html          # پنل نگاشت (هم استاتیک، داخل iframe)
├── supabase-schema.sql  # اسکیما را اینجا بگیر
└── README.md
```

## ❓ چرا تک‌جایی؟
- نسخه قبلی (Node+Supabase) 2 جا می‌خواست: سوپابیس (دیتابیس) + لیارا (سرور)
- این نسخه سرور را حذف کرد — همه چیز مستقیم با سوپابیس حرف می‌زند، پس فقط **سوپابیس** را مدیریت می‌کنی + هاستِ فایل‌ها که **GitHub Pages** رایگان و همیشگی است.

---

## 🛠️ اگر خواستی دوباره سرور داشته باشی
همین کد با `server.js` هم کار می‌کند — فقط `npm start` بزن. ولی برای آنلاین بودن نیازی نیست.
