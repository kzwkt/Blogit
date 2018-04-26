<h1 align="center">
	<img width="200" src="Aur.svg" alt="Aur">
	<br>
	<br>
</h1>


## Publish packages in AUR

### Install openssh
`sudo pacman -s openssh`

<div dir="rtl">
برای آپلود بسته به AUR باید اول یه حساب کاربری داشته باشید. بعد از اون باید یه جفت کلید ssh برای اتصال به AUR بسازید:
</div>

```
$ ssh-keygen
```

<div dir="rtl">
و کلید عمومی رو داخل تنظیمات حساب کاربری خودتون در AUR وارد کنید. برای اینکار محتوای فایل:
</div>

```
~/.ssh/id_rsa.pub
```

<div dir="rtl">
رو در قسمت SSH Public Key حساب کاربری خود در AUR وارد کنید و ذخیره کنید.
کل فرآیند آپلود از طریق git انجام میشه برای همین باید یه مقدار با git هم آشنایی داشته باشید. برای ساخت بسته جدید مثلاً با نام package_name از دستور زیر استفاده می کنید:
</div>

```
$ git clone git+ssh://aur@aur.archlinux.org/package_name.git
```

<div dir="rtl">
بعد داخل پوشه ای که ساخته میشه فایل PKGBUILD و هر فایل کمکی دیگه ای که همراهش هست رو قرار می دید. برای آپلود علاوه بر این فایلها به یک فایل .SRCINFO هم نیاز دارید که اونو با دستور زیر داخل پوشه می سازید:
</div>

```
$ makepkg --printsrcinfo > .SRCINFO
```

<div dir="rtl">
بعد با دستور git add تمام فایلها شامل PKGBUILD و .SRCINFO رو به گیت اضافه می کنید:
</div>

```
$ git add PKGBUILD .SRCINFO
```

<div dir="rtl">
و با دستور git commit به همراه یک توضیح مناسب این فایلها رو commit می کنید:
</div>

```
$ git commit -m "useful commit message"
```

<div dir="rtl">
و در نهایت هم با دستور git push فایلها رو آپلود می کنید:
</div>

```
$ git push
```

<div dir="rtl">
این خلاصه ای از کارهایی بود که باید انجام بدید ولی حتماً صفحات ویکی زیر رو کامل بخونید:
</div>


<img alt="مجوز کریتیو کامنز" style="border-width:0" src="https://i.creativecommons.org/l/by-sa/4.0/88x31.png">
</p>
