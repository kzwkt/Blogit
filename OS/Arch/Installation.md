
## Before start..
1. تمام مطالبی که در این آموزش ذکر میشن صرفا تجربه های شخصی خودم و باقی دوستانم از نصب آرچ بودند(و هستند). برای دریافت صحیح ترین شیوه نصب همواره میتونید به صفحات زیر در ویکی ها(ی انگلیسی و فارسی)مراجعه کنید:
1.  [url=https://wiki.archlinux.org/index.php/installation_guide]installation_guide[/url]
2. [url=http://wiki.archusers.ir/index.php/%D8%B1%D8%A7%D9%87%D9%86%D9%85%D8%A7%DB%8C_%D8%AA%D8%A7%D8%B2%D9%87%E2%80%8C%DA%A9%D8%A7%D8%B1%D8%A7%D9%86]راهنمای تازه کاران [/url]
2. در صورتی که نیاز به نصب آرچ به صورت  Dual Boot و در کنار ویندوز دارید، حتماً و حتماً[url=https://wiki.archlinux.org/index.php/Dual_boot_with_Windows] این صفحه [/url]رو مطالعه بفرمایید.
3. طبق [url=https://www.archlinux.org/news/the-end-of-i686-support/]این خبر [/url] توزیع آرچ از این به بعد از سیستم های 32 بیتی پشتیبانی نخواهد کرد.( هر چند [url=https://archlinux32.org/]تلاش هایی[/url] در این زمینه صورت گرفته اما محل بحث ما در این آموزش نخواهد بود.) پس تمامی مفروضاتِ بعدی این آموزش بر این خواهد بود که سیستم شما 64 بیتی ست.

## 0 [Get Arch-ISO](https://wiki.archlinux.org/index.php/Category:Getting_and_installing_Arch)
ابتدا به [url=https://www.archlinux.org/download/]صفحه رسمی دانلود آرچ-لینوکس[/url] رفته و ایزوی مربوط به آخرین نسخه را دانلود کنید.توجه کنید سه روش مختلف دانلود در اختیار شما قرار دارد:
۱-دانلود ایزو از طریق تورنت(توصیه سایت رسمی و خود من استفاده از این روش هست..به یه کلاینت تورنت مثل utorrent یا deluge نیاز دارید.)
۲-روش Netboot
۳-دانلود مستقیم فایل ایزو از میرور های رسمی
[color=blue]مرحله اوّل:([url=https://wiki.archlinux.org/index.php/USB_flash_installation_media#Using_USBwriter]بوتیبل سازی ایزو[/url])[/color]
پس از نصب باید فایل ایزوی خود را اصطلاحا بوتیبل کنید.تا هنگام راه اندازی مجدد،سیستم تون قادر باشه به نصاب آرچ رجوع کنه و فرآیند نصب رو در اختیارتون قرار دهد. برای بوتیبل کردن فایل های ایزو،راه های زیادی وجود دارد،از جمله:
در لینوکس با نرم افزار unetbootin و در ویندوز با نرم افزارهای   unetbootin و Rufus می توانید ایزوی بوتیبل تهیه کنید.(من با هر سه این نرم افزارها کارکردم..توصیه من به شما استفاده از نرم افزار مولتی پلتفرم UnetBootin هست..اون دوتای دیگه بعضی وقتها میشد که فایل ایزویی که بهشون میدادم رو درست بوتیبل نمیکردن.)و به توصیه ویکی آرچ،می تونید از USBwriter هم استفاده کنید.
[color=blue]مرحله دوم(ورود به محیط نصب آرچ)[/color]
سپس در تنظیمات بایوس خود،امکان بوت از طریق فلش یا دی وی دی را  فعال کرده و ریبوت کنید.
حال وارد صفحه خوش آمد گویی آرچ شده اید.
[url=http://uupload.ir/][img]http://uupload.ir/files/58ej_1.png[/img][/url]
گزینه (Boot Arch Linux(x86-64 رو انتخاب کنید و به مرحله بعد برید. پس از چند ثانیه مکث تنظیمات اولیه توسط ایزو جهت ورود به محیط نصب انجام و به صفحه ای هم چون صفحه زیر هدایت خواهید شد:
[url=http://uupload.ir/][img]http://uupload.ir/files/k8c3_2.png[/img][/url]
[color=blue]مرحله سوم(چک کردن اتصال به اینترنت)[/color]
برای نصب بسته ها پس از chroot زدن نیاز دارید که به اینترنت متصل باشید. دو حالت کلی رو با هم بررسی میکنیم:
1. اتصال بیسیم: در این حالت ابتدا سه بسته زیر را نصب کنید:
[code]
pacman -S iw wpa_supplicant dialog
[/code]
سپس دستور wifi-menu رو صادر کنید. صفحه ای با پس زمینه آبی رنگ براتون ظاهر خواهد شد که تمام شبکه های اطراف رو نشونتون میده. شبکه خودتون رو انتخاب و پسورد رو وارد کنید. و پس ازچند ثانیه میتونید یه سایت رو به صورت دلخواه چک(ping) کنید.(این کار جهت اطمینان از برقراری اتصال اینترنتی هست.)
2. اتصال باسیم: سرویس dhcpcd رو فعال و استارت کنید.
[color=blue]مرحله چهارم(اطلاع از نوع پارتیشن تیبل)[/color]
قبل از شروع بکار لازمه که از نوع پارتیشن تیبل([url=https://wiki.archlinux.org/index.php/partitioning]partition table[/url]) هارد خودتون اطلاع حاصل کنید. دو پارتیشین تیبل معروف و مهم[url=https://en.wikipedia.org/wiki/GUID_Partition_Table] GPT [/url]و [url=https://en.wikipedia.org/wiki/Master_boot_record] MBR [/url] هستند.(برای مشاهده تفاوت این دو،[url=http://www.datisnetwork.com/mbr-or-gpt.html] اینجا [/url]را ببینید.)اگر در لینوکس هستید برنامه gdisk را نصب کنید و این کارها رو انجام بدید:
[code]sudo gdisk -l /dev/sda[/code]
اگر در خروجی به این پیغام برخوردید:
[code]
Partition table scan:
  MBR: MBR only
  BSD: not present
  APM: not present
  GPT: not present
[/code]
و اگه با نتیجه ای هم چون زیر مواجه شدید:
[code]
Partition table scan:
MBR: protective
BSD: not present
APM: not present
GPT: present
[/code]
 اگر در ویندوز هستید به cmd رفته و ابتدا diskpart را اجرا کنید و سپس دستور list disk را بزنید.اگر تیک ستون gpt خورده باشد بدین معناست که پارتیشن تیبل هاردتون gpt هست.در غیر این صورت mbr هست.
در صورتی که پارتیشن تیبل تون GPT هست و گراب به هر دلیلی روش نصب نمیشه دو راه میتونید انجام بدید:
۱-وقتی برنامه cfdisk را اجرا میکنید بهتون میگه کدوم پارتیشن تیبل رو میخواید و شما هم msdos رو انتخاب می کنید(از این به بعد پارتیشن تیبل هاردتون mbr میشه.)
۲-با استفاده از برنامه gdisk می تونید GPT رو به MBR تغییر بدید.([url=http://www.ehow.com/how_12119053_convert-gpt-mbr-linux.html]اینجا [/url]رو ببینید.)
۳-از gparted یا cgdisk به جای cfdisk استفاده کنید.
[color=blue]مرحله پنجم(پارتیشن بندی هارددیسک)[/color]
خوب تو مرحله بعد،باید پارتیشن بندی سیستم تون رو انجام بدین.قبل از هر چیز بگم که اگه ویندوز دارین و تازه دارین به آرچ مهاجرت میکنید، قبل از هرکاری، حتماً حتماً حداقل 50 گیگ از هاردتونو خالی کنید.(فرمتش کنید بدون هیچ نوعی)تو مراحل بعد میگم که چکار کنیم که هم درایوهای ویندوزی رو داشته باشیم هم یه پارتیشین بندی شیک و سر راست واسه آرچ و هر نوع توزیعِ گنو/لینوکسی دیگه.
شمای کلی کار اینکه که ما باید چهار تا پارتیشن با این مشخصات درست کنیم:(وجود Root و Swap الزامی ست.توصیه میشه در کنار اینها یه پارتیشن var هم داشته باشید که کش پکمن مصون بمونه از تغییرات.)
۱-Boot: با حجم ۵۰۰ مگ(توصیه ویکی ۱۰۰ مگ هست ولی ما محض احتیات ۵۰۰ مگ درنظر میگیریم که با توجه به حجم کرنل ها بسیار زیاد هم هست)
*نکته:پارتیشن بوت فقط زمانی "اجباری" ست که پارتیشن تیبل هاردتون از نوع GPT باشه.
۲-Swap:با حجم نصف مقدار رمتون(*توصیه بزرگان:بهتره فضایی که برای SWAP تون در نظر میگیرین "ترجیحا" نصف مقدار رم تون باشه و حداکثر 8 گیگ.حتی اگه رم شما بیش از ۱۶ گیگ باشه(مثلا ۳۲ یا ۶۴ گیگ)البته بر حسب تجربه من، نصفِ نصفِ نصفش هم زیاده شه :) من که رمم هشت هست اینو گذاشتم 500 مگ.دیگه خود دانید.)
۳-Root:با حجم تقریبی 45 گیگ:برای مصارف معمولی بسه به نظرم.(اگه فضای هاردتون کم بود، حداقل 20 گیگ بهش اختصاص بدید.با توجه به رولینگ بودن آرچ و پر شدن کش پکمن، وجود فضای نسبتا زیاد برای این پارتیشن توصیه میشه.هر چند، هر موقع احساس کردید روت تون داره پر میشه میتونید از پارتیشن های دیگه قرض بگیرید و اکستندش کنید.)
۴-Home:باقی فضای خالی از هارد درایوتون.(45 گیگ بسّهشه!)
بالاتر گفتم 50 گیگ..دیگه بستگی به خودتون داره..میتونید کم و زیادش کنید..البته حداقل 46 گیگ باید داشته باشین واسه اون سه تای اول..بقیه هاردتون رو هم میتونید درایورهای ویندوزتون باشه با هر فرمتی مثلا nfts یا ... که دیگه تو این مرحله برامون مهم نیستن این جزئیات.

برای پارتیشن بندی، بسته به نوع پارتیشن تیبل خودتون (که از مرحله 0 ام باید مشخص شده باشه براتون) باید یه ابزار پارتیشن بندی انتخاب کنید. از اونجایی که پارتیشن تیبل من MBR هست از برنامه ی محبوب cfdisk استفاده میکنم.(هر چند از lsblk هم میتونید استفاده کنید.اختیاری هست این موضوع)اما قبلش برای اینکه بدونم رو هاردم چند تا پارتیشن و با چه نوع هایی وجود دارن یه fdisk -l میگیریم ببینم اوضاع از چه قراره.خروجی ش چیزی شبیه اینه:
[url=http://uupload.ir/][img]http://uupload.ir/files/1a6_3.png[/img][/url]
البته این واسه زمانیه که من پارتیشن بندی هامو کامل انجام دادم..شما باید با خروجی سبک تری مواجه بشین.
خوب تو مرحله بعد باید شروع کنیم از اون جایی که میگه free، دونه دونه پارتیشن هایی که بالا توضیحاتشو دادم براتون، جدا کنیم و به اصطلاح عملیات پارتیشن بندی رو انجام بدیم.برای اینکه بتونیم پارتیشن بندی کنیم دستور cfdisk -l رو میزنیم.با چیزی شبیه تصویر زیر باید مواجه بشیم:
[url=http://uupload.ir/][img]http://uupload.ir/files/nq85_4.png[/img][/url]
که البته میگم چون من پارتیشن بندی کردم قبلا اینجا همه پارتیشن هامو میاره.دقت کنید یه بخشی هست تو عکس به نام free spcae.واسه اینکه بخواین پارتیشن های جدید بسازین باید دونه دونه از اون پارتیشن جدا کنید.(البته با مقدار حجمی که بهش میدین)
من طبق سناریوی بالا میخام چهار تا پارتیشن داشته باشم:۱-boot با حجم 500 مگ.-swap با حجم 500مگ .3-Root با حجم 45 گیگ.۴-Home با حجم دلخواه.
خوب شروع میکنیم.روی freespace می ریم.گزینه های پایین صفحه اینجوری باید تغییر کنن:
[url=http://uupload.ir/][img]http://uupload.ir/files/92x_5.png[/img][/url]
رو دکمه new کلیک میکنیم.بهش مقدار 500M رو میدیم و سپس اینتر میزنیم.بعد همون نوار پایینی باید به چیزی شبیه نوار زیر تبدیل شده باشه:
[url=http://uupload.ir/][img]http://uupload.ir/files/9k0c_6.png[/img][/url]
میریم رو گزینه type ش و اینتر میزنیم.یه لیست، مشابهِ لیست زیر باید بهتون نشون داده بشه. دقت کنید که میخوایم واسه پارتیشن هامون "نوع" تعریف کنیم.(مثلا یادتونه تو ویندوز داشتیم ntfs یا fat32? این همونه..منتهی گنو/لینوکس فایل سیستم های متنوع تری داره :))
[url=http://uupload.ir/][img]http://uupload.ir/files/y9u0_7.png[/img][/url]
خوب یه نکته بگم:واسه سه پارتیشن boot,Root,Home نوع پارتیشن هامون باید همین linux با شماره 83 باشه.فقط واسه پارتیشن swap نوعشو میذاریم رو:Linux swap / Solaris با شماره 82.[color=#FF0000]
***نکته خیلی مهم:پارتیشن Boot رو حتما بوتیبل کنید. در صورتی که پارتیشن بوت رو نساختید، پارتیشن روت رو بوتیبل کنید.(این کار الزامیست و گرنه سیستمتون بوت نمیشه!)به نحوی که تیک ستارهی بغلِ پارتشین باید دیده بشه.[/color]
بعد از اینکه پارتیشن هامونو ساختیم دکمه write رو میزنیم و از برنامه cfdisk خارج میشیم.
[color=blue]مرحله ششم(فرمت کردن پارتیشن ها):[/color]
[color=#FF0000]***نکته خیلی مهم***: بهیچ عنوان از  این مرحله برای chroot زدن به سیستم جاریتون استفاده نکنید. خودم به شخصه یه روز حواسم نبود و کل روت رو فرمت کردم. بعلت حساسیت موضوع در پی نوشت، روش صحیح chroot زدن رو خدمت تون عرض میکنم.[/color]
پارتیشن هایی که ساختیم هنوز شناخته شده نیستند..باید اونها رو فرمت کنیم تا قابلیت مانت شدن داشته باشند. فرمت کردن پارتیشن ها به سادگی صورت میگیره. فقط کافی ست دستورات زیر را بزنید:
[code]
mkfs.ext4 /dev/sda1
mkswap /dev/sda2
mkfs.ext4 /dev/sda3
mkfs.ext4 /dev/sda4[/code]
[color=blue]مرحله هفتم(مانت کردنِ پارتیشنهای فرمت شده):[/color]
سپس پارتیشن های فرمت شده رو سوار(مانت) میکنیم:
[code]
mount /dev/sda3 /mnt
mkdir /mnt/boot
mount /dev/sda1 /mnt/boot
swapon /dev/sda2
mkdir /mnt/home
mount /dev/sda4 /mnt/home
[/code]
[color=blue]مرحله هشتم(رَنک کردن میرورها):[/color]-
قبل از شروع به نصب بسته های ضروری لازم است آینه ها بر اساس بیشترین سرعت به روزرسانی شوند. مراحل زیر را طی کنید:
[code]
mv /etc/pacman.d/mirrorlist /etc/pacman.d/mirrorlist.bak
rankmirrors -n 10 /etc/pacman.d/mirrorlist.bak > /etc/pacman.d/mirrorlist
[/code]
[color=blue]مرحله نهم(نصب بسته های base,base-devel)[/color]
حالا همه چیز مهیاست برای نصب آرچ. این توزیع به خودیِ خود هیچ بسته ای روی سیستم مقصد نصب نمیکنه. (برخلاف اکثر توزیع ها و سیستم عامل های دیگه!)این شما هستید که تعیین میکنید چه بسته ای نصب بشه. برای اینکه شالوده ي سیستم ساخته بشه نیاز دارید که دو گروه بسته ی:base و  base-devel رو نصب کنید:
[code]
pacstrap -i /mnt base base-devel
[/code]
[color=#5ccc5c]*نکته*: سوییچ i باعث میشه قبل از نصب از شما اجازه گرفته بشه و بتونید بسته های اولیه رو تغییر بدید یا کم و زیادشون کنید. (مثلا میتونید به جای کرنل معمولی کرنل lts رو نصب کنید.)[/color]
حالا پس از مدتی(که البته این زمان به سرعت اینترنت شما هم بستگی دارد)بسته های اصلی و کور نصب میشوند.(در 29 بهمن ماه سال 1396 شمسی تعداد این بسته ها 151 و حجمی حدود 250 مگابایت داشتند.این مدت زمان را میتوانید به گوشه ای تکیه داده و تخمه بخورید یا یه دست limbo با گوشیتون بازی کنید! D:)
[color=blue]مرحله دهم(بررسی فایل fstab)[/color]
سپس باید فایل [url=https://wiki.archlinux.org/index.php/fstab]fstab [/url] را که حاوی مشخصات پارتیشن های ماست بسازیم:
[code]
genfstab -p /mnt >> /mnt/etc/fstab
[/code]
[color=blue]مرحله یازدهم([url=https://wiki.archlinux.org/index.php/change_root]تغییر ریشه یاchroot[/url]) [/color]
حالا نوبت به تغییر ریشه می رسد تا باقی عملیات را به کمک chroot انجام دهیم:
[code]
arch-chroot /mnt
[/code]
[color=blue]مرحله دوازدهم(ست کردن منطقه زمانی و زبان سیستم)[/color]
ابتدا فایل زیر رو باز کنید:
[code]
nano /etc/locale.gen
[/code]
و سپس خطوط زیر را آن-کامنت کنید:
[code]
en_US.UTF-8 UTF-8 
fa_IR UTF-8  
[/code]
و در نهایت دستورات زیر رو وارد کنید:
[code]
locale-gen
echo LANG=en_US.UTF-8 > /etc/locale.conf
export LANG=en_US.UTF-8
[/code]
و برای منطقه زمانی:
[code]
ln -s /usr/share/zoneinfo/Asia/Tehran /etc/localtime
[/code]
ساعت سیستم:
[code]
hwclock --systohc --utc
[/code]
[color=blue]مرحله سیزدهم(انتخاب کردن نام سیستم)[/color]
میتونید واسه سیستم تون یه اسم انتخاب کنید:
[code]
echo sys_name > /etc/hostname
[/code]
[color=blue]مرحله چهاردهم(پیکره بندی مخازن و بروزرسانی سیستم)[/color]
این مرحله جز مراحلی هست که به شخصه خیلی دوسش دارم. چون مربوط به پکمن میشه. طبق نکته سوم که در دیباچه ذکر شد، مطمئنا دیگه نیازی به مخزن multilib نخواهیم داشت.(این مخزن بسته های 32 بیتی رو برای سیستم های 64بیتی مهیّا میکرد.)
ابتدا فایل تنظیمات پکمن رو با ویرایشگری دلخواه باز کنید.
[code]
nano /etc/pacman.conf
[/code]
برای فعالسازی مخازن AUR خطوط زیر رو به انتهای این فایل اضافه کنید:
[code]
[archlinuxfr]
SigLevel = Never
Server = http://repo.archlinux.fr/$arch
[/code]
 و همین طور جهت دسترسی به مخازن چین(مخزنی هست که بسته های باینریِ موجود در AUR رو در خودش نگهداری میکنه و به شدت توصیه میکنم ازش استفاده کنید.):
[code]
[archlinuxcn]
SigLevel = Never
Server = http://repo.archlinuxcn.org/$arch
[/code]
[color=#5ccc5c]*نکات تکمیلی*: (در صورت که خطوط یاد شده وجود ندارند خودتون به صورت دستی تایپ شون کنید.)
1.برای فعالسازی [url=https://wiki.archlinux.org/index.php/Deltup] مخازن دلتا[/url] خط زیر رو از حالت کامنت درش بیارید:(برای آشنایی بیشتر و کانفیگ مخازن دلتا، [url=http://planet.sito.ir/%D8%A2%D9%BE%D8%AF%DB%8C%D8%AA-%D8%A7%D8%B2-%D8%B7%D8%B1%DB%8C%D9%82-%D8%A8%D8%B3%D8%AA%D9%87%E2%80%8C%D9%87%D8%A7%DB%8C-%D8%AF%D9%84%D8%AA%D8%A7-%D8%AF%D8%B1-%D8%A2%D8%B1%DA%86-%D9%84%DB%8C%D9%86/] اینجا [/url]را ببینید.[/color]
[code]UseDelta = 0.7[/code]
[color=#5ccc5c]2.ILoveCandy: نمایشِ پکمن هنگام به روزرسانی یا نصب نرم افزارها.
3. Color: پکمنِ رنگی رنگی.
4. TotalDownload: نمایش حجم کلی دانلود دربه روزرسانیها یا نصب نرمافزارها.
[/color]
و سپس سیستم را به روزرسانی کنید تا تغییرات اعمال گردند:
[code]
pacman -Syu
[/code]
[color=blue]مرحله پانزدهم(ست کردن پسورد کاربر روت)[/color]
[code]
passwd
[/code]
[color=#FF0000]***نکته خیلی مهم***:  هنگام کارکردن با آرچ سعی کنید از طریق یوزر روت لاگین نکنید..معمولا رسم بر این هست که یوزری با دسترسی های محدود تر میسازن و هر موقع نیاز به دسترسی روت بود با sudo این کارو میکنن.[/color]
[color=blue]مرحله شانزدهم(ساخت کاربر معمولی)[/color]
[code]
useradd -m -g users -G wheel -s /bin/bash USERNAME
[/code]
[color=blue]مرحله هفدهم(ست کردن پسورد کاربر معمولی)[/color]
[code]
passwd USERNAME
[/code]
[color=blue]مرحله هجدهم(ویرایشِ فایلِ visudo)[/color]
[code]
EDITOR=nano visudo
[/code]
مقدار زیر را آن-کامنت کنید و اگر وجود نداشت ایجادش کنید:
[code]
%wheel ALL=(ALL) ALL
[/code]
[color=blue]مرحله نوزدهم(نصب برنامه autocomplete)[/color]
برای اینکه موقع نوشتنِ دستورات در بش بتوانید از دکمه ی تب برای کامل کردن دستورات بهره ببرید، بسته زیر رو باید نصب کنید:
[code]
pacman -S bash-completion
[/code]
[color=blue]مرحله بیستُم(نصب بوت لودر)[/color]
اگر مایلید آرچ رو در کنار سیستم عاملها یا توزیع های دیگه استفاده کنید لازمه که [url=https://en.wikipedia.org/wiki/Booting#BOOT-LOADER]بوت لودر[/url] نصب کنید. حالا دستورات زیر رو بزنید:
[code]
pacman -S os-prober
pacman -S grub
grub-install --recheck /dev/sda
grub-mkconfig -o /boot/grub/grub.cfg           
[/code]
نکته: اگر به خطای زیر برخورد کردید:
[code]
Warning: Failed to connect to lvmetad. Falling back to device scanning.
[/code]
بسته linux رو مجددا نصب کنید تا کرنل و متعلقاتش دوباره ساخته بشن. سپس مراحل بالا رو از نو طی کنید.
[color=blue]مرحله بیست و یکم(مهیا کردن سیستم پس از بوت)[/color]
قبل از اینکه از محیط chroot خارج شویم باید از آماده بودن اینترنت خود مطمین شویم. در صورتی که از شبکه بیسیم استفاده میکنید غیر فعال کردن سرویس dhcpcd و صدور فرمان wifi-menu کافی خواهد بود(مطمین باشید هیچ سرویس دیگری در حالت استفاده از اینترفیس بیسیم شما نیست. مثلا اگر سهواً سرویسِ NetworkManager رو فعال کردید، حتما غیرفعالش کنید.) در غیر این صورت نام شبکه خود را توسط دستور زیر می یابیم:(اگر از LAN استفاده میکنید دنبال مدخلی با شروع شونده L باشید در غیر این صورت دنبال مدخلی با شروع شونده W باشید.)
[code]
ip link
[/code]
حالا کافی ست سرویس مربوطه را فعال سازی کنید:
[code]
systemctl enable dhcpcd@SERVICENAME.service
[/code]
حالا بایستی از chroot خارج شوید و البته تمامی پارتیشن ها را هم آن-مانت کرده و سپس ریبوت کنید:
[code]
exit
umount -R /mnt
reboot
[/code]
تبریک...به مرحله پسا-chroot خوش آمدید! D:
الان وقتشه که با کاربری که تو مرحله 12 ساختین لاگین کنید و آجر به آجر سیستم تون رو طبق سلیقه و البته نیاز خودتون رو هم بچینید:(مرحله اول بایستی سرور گرافیکی X رو نصب کنید)
[color=blue]مرحله بیست و دوم(نصب سرور گرافیکی X و ملحقاتش)[/color]
[code]
pacman -S xorg-server xorg-xinit xorg-server-common
[/code]
[color=blue]مرحله بیست و سوم(نصب درایور کارت گرافیکی)[/color]
سپس بسته به کارت گرافیک خودتون یکی از بسته های زیر رو نصب کنید:
Intel:
[code]
sudo pacman -S xf86-video-intel
[/code]
nVidia:
[code]
sudo pacman -S xf86-video-nouveau
[/code]
ATI:
[code]
sudo pacman -S xf86-video-ati
[/code]
سیستم را یک بار ریبوت کنید تا درایورهای گرافیک تون فیکس بشن.
[color=blue]مرحله بیست و چهارم(نصب درایور تاچ پد)[/color]
اگه با لپتاب کار میکنید احتمالا احتیاج پیدا میکنید که تاچ پدتونو به کار بگیرید:
[code]
pacman -S xorg-xinput xf86-input-libinput 
[/code]
[color=blue]مرحله بیست و پنجم(نصب میزکار یا مدیرپنجره)[/color]
حالا به مرحله جذاب نصب میزکار رسیدیم..جایی که معمولا افراد سعی میکنن با توجه به نیاز خودشون و البته سلیقه و علاقه ای که به محیط کاری خاصی دارن یه میز کار رو انتخاب کنن.ما اینجا سعی می کنیم شیوه نصب یه میزکارو خدمت تون شرح بدیم و برای باقی میزکارهای معروف لینک هاشونو برای مطالعه در اختیارتون میذاریم:
Cinnamon: میزکار محبوب خودم که معمولا با لاگین منیجرِ [url=https://wiki.archlinux.org/index.php/SDDM]SDDM [/url]ترکیبش میکنم:
[code]
pacman -S cinnamon sddm
[/code]
کاری که معمولا پس از نصب هر لاگین منیجر باید انجام بدین اینه که سرویسشو فعال کنید تا با هر بار ریستارت شدنِ سیستم بتونید با اون لاگین منیجر خاص لاگین کنید.اینجوری:
[code]
systemctl enable sddm.service
[/code]
باقی میزکارهای معروف:
1. [url=https://wiki.archlinux.org/index.php/GNOME]گنوم[/url]
 2. [url=https://wiki.archlinux.org/index.php/KDE]KDE Plasma[/url]
3. [url=https://wiki.archlinux.org/index.php/xfce]XFCE[/url]
4. [url=https://wiki.archlinux.org/index.php/Deepin_Desktop_Environment]Deepin[/url]
مدیر پنجره ها:
1. [url=https://wiki.archlinux.org/index.php/openbox]OpenBox[/url]
2. [url=https://wiki.archlinux.org/index.php/i3]i3[/url]
[color=blue]مرحله بیست و ششم(مدیریت شبکه و اینترنت پس از نصب)[/color]
برای اینکه بعد نصب میزکار ها بتونید شبکه و وای فای خودتون رو به نحو مطلوبی مدیریت کنید دو بسته پیشنهادی زیر رو نصب کنید:
[code]
sudo pacman –S networkmanager network-manager-applet net-tools 
[/code]
و حالا سرویس dhcpdc تون رو غیر فعال کنید:
[code]
sudo systemctl stop dhcpcd.service
sudo systemctl disable dhcpcd.service
[/code]
و روند اجرای مدیریت شبکه و اینترنت را به دستان پر توان نتورک-منیجر بسپارید:
[code]
sudo systemctl enable NetworkManager
sudo systemctl start NetworkManager
[/code]
[color=blue]مرحله بیست و هفتم(نصب یک AUR-Helper)[/color]
[url=https://wiki.archlinux.org/index.php/AUR_helpers]Aur-Helper [/url] ها برنامه هایی غیر رسمی اند که جهت دریافت بسته ها از مخزن AUR مورد استفاده قرار میگیرند. اگرچه پیشنهادِ اکید بنده این هست که قبل از کار با این ابزارها حداقل یک بار به صورت دستی سورس ها رو از این مخزن دریافت و [url=https://wiki.archlinux.org/index.php/Arch_User_Repository#Installing_packages]خودتون شروع به میک کردنشون کنید.[/url]
 اما خوب در بسیاری موارد، AUR-Helper ها میتونن به این روند سرعت ببخشند. هلپری که من دارم ازش استفاده میکنم yaourt هست. بدین صورت می تونید نصبش کنید:
[code]
sudo pacman -S yaourt
[/code]

[color=blue]مرحله سی اُم(مانت کردن خودکار پارتیشن های NTFS)[/color]
اگر شما هم مثل من از درایوهای NTFS ای بصورت مشترک بین ویندوز و آرچ تون استفاده میکنید احتمالا دلتون نمیخواد هر سری که لاگین میکنید برای مانت شدن پسورد وارد کنید. پس بیاید فرايند مانت شدن این پارتیشن ها رو به کمک  [url=https://wiki.archlinux.org/index.php/NTFS-3G]NTFS-3G[/url]خودکار کنیم. ابتدا بسته nfts-3g رو نصب کنید:
[code]
sudo pacman -S ntfs-3g 
[/code]
بعد باید محتویات فایل fstab رو جوری تغییر بدیم که با هر بار لاگین بتونه این پارتیشن ها رو مانت کنه. محتوای فعلی fstab من بدین شکله:
[code]
# <file system> <dir> <type> <options> <dump> <pass>
# UUID=7e9d3053-e053-48a5-b30b-34ae06d799dc
/dev/sda8               /               ext4            rw,relatime,data=ordered        0 1

# UUID=6f0d1bfe-0fdf-44b1-9c7e-8b63decd82df
/dev/sda6               /boot           ext4            rw,relatime,data=ordered        0 2

# UUID=4aa7c810-059c-4004-80cc-9e2a20455195
/dev/sda9               /home           ext4            rw,relatime,data=ordered        0 2

# UUID=86652314-2b19-4f27-a0aa-02a4d5305e01
/dev/sda7               none            swap            defaults,pri=-2 0 0
[/code]
که همون طور که مشاهده میکنید به ترتیب root, boot, home , swap رو داره مانت میکنه. من دو تا درایو ntfs ای به نام های C , D هم دارم و میخوام اونا رو به این فایل اضافه کنم.
ابتدا با دستور زیر UUID شونو پیدا میکنم:
[code]
sudo blkid 
[/code]
و بعد خطوط زیر رو به انتهای فایل fstab اضافه میکنم:
[code]
# <file system> <dir> <type> <options> <dump> <pass>
# /dev/sda2 --> C
UUID=5C0A0E930A0E6A7A  /mnt/C       ntfs-3g         uid=linarcx,gid=users    0 0

# /dev/sda5 --> D
UUID=D2405DAE405D99D5  /mnt/D      ntfs-3g         uid=linarcx,gid=users    0 0
[/code]
*نکته 1*: ملاحظه میکنید که <dir>  رو یک مسیر دلخواه دادم.(mnt/)
*نکته 2*: برای اینکه این پارتیشن ها فقط توسط یوزر خاصی قابل دسترسی و نوشتن باشن میتونید در بخش <options>  مقادیر مد نظرتونو بهش انتساب کنید.
حالا هر موقع که سیستم رو ریستارت کنید ملاحظه میکنید که در مرحله بوت این پارتیشن ها هم بصورت خودکار مانت میشن.
[color=blue]مرحله بیست و هشتم(نصب بسته ها و کدک های صوتی-تصویری)[/color]
صوت:
[code]
sudo pacman -S pulseaudio pulseaudio-alsa pavucontrol alsa-utils alsa-oss alsa-plugins
[/code]
تصویر:
[code]
pacman -S mesa
[/code]
کدک های صوتی-تصویری:
[code]
sudo pacman -S a52dec faac faad2 flac jasper lame libdca libdv libmad libmpeg2 libtheora libvorbis libxv wavpack x264 xvidcore gstreamer0.10-plugins
[/code]
[color=blue]مرحله بیست و نهم(تنظیم فونت و نصب بسته های اختیاری فونت)[/color]
*تذکر: این مرحله به بعد اختیاری هستند. با توجه به کارکردی که از سیستم توقع دارید، می تونید سناریوهای دیگه ای رو طی کنید.
دو بسته فونتِ فارسی زیر رو از Aur میتونید نصب کنید:
[code]
sudo yaourt -S persian-fonts ttf-x2
[/code]
و همینطور فونت های غیرفارسی:
[code]
sudo pacman -S dina-font gnu-free-fonts ttf-croscore ttf-dejavu ttf-droid ttf-freefont ttf-liberation
[/code]
[color=blue]مرحله بیست و نهم(تغییر اپلیکیشن های پیش فرض)[/color]
در اوایل کار پس از نصب تو هر میزکاری که باشین ممکنه با مشکل بازشدن فایل ها مثلا با ادیتور مواجه بشین. یا انتظار داشته باشین یه فایل تکست با ویم باز شه اما این اتفاق نیفته. یه سری کانفیگ-فایل ها هستن که میتونن بهمون کمک کنن ابزارهای پیش فرض رو برای اجرای اکستنشن های مخصوص، سِت کنیم. فایل زیر رو باز کنید:
[code]
sudo vim /usr/share/applications/mimeinfo.cache
[/code]
برای مثال میخوام دایرکتوری هام با نمو باز بشن. این تیکه خط کد رو باید اضافه کنم به این فایل:
[code]
inode/directory=nemo.desktop;
[/code]
یا مثلا میخوام هر چی فایل تکست دارم با vscode باز بشه:
[code]
text/plain=visual-studio-code.desktop;
[/code]
برای کسب اطلاعات بیشتر به [url=https://wiki.archlinux.org/index.php/default_applications]ویکی [/url]مراجعه کنید.
[color=blue]مرحله بیست و نهم(نصب آیکونپک و تم-پیشنهادی)[/color]
نصب تم و آیکون های زیبا میتونه روحیه کاربر رو هنگام کار روزانه با سیستم بسیار شاد کنه. هرازگاهی یه سری سایتا میان و[url=https://www.devpy.me/10-of-the-best-linux-icon-themes-compared/] لیست هایی [/url]
ایجاد میکنن که بهترین و زیباترین تم ها و آیکون پک ها رو به کاربرا پیشنهاد میکنن. چندتا شونو نصب میکنیم:
تم ها:
[code]
sudo pacman -S arc-solid-gtk-theme 
yaourt -S osx-arc-shadow  osx-arc-darker
[/code]
آیکون ها:
[code]
sudo pacman -S papirus-icon-theme deepin-gtk-theme
yaourt -S paper-icon-theme-git arc-icon-theme-git moka-icon-theme la-capitaine-icon-theme-git obsidian-icon-theme-git compass-icon-theme macos-icon-theme flat-remix-git xenlism-wildfire-icon-theme-git
[/code]
[color=blue]مرحله سی اُم(گلچین کردن و نصب بسته های ضروری و منتخب)[/color]
[code]
sudo pacman -S unzip unrar p7zip gnome-system-monitor 
[/code]
برای مشاهده لیست بلند بالایی از نرم افزارهای کاربردی لطفا [url=https://wiki.archlinux.org/index.php/List_of_applications]اینجا [/url]راببینید.
[url=http://bbs.archusers.ir/viewtopic.php?id=1005] یه تاپیک [/url]هم راه انداختیم که به اپلیکیشن های منتخب از دید کاربرانِ همین انجمن می پردازه. می تونید حاصل تجربیاتِ کاربران رو درطی سالیان مختلف کار با آرچ و نرم افزارهای آزاد ببینید.

خوب. "تقریبا" تموم شد.. البته کارمون به عنوان آلیس تازه شروع شده و سرزمین عجایبی به نام آرچ که تازه بناش کردیم و قراره روز به روز شخصی تر و منحصر به فردتر بشه..دوست دارین بازم توش غرق بشیم؟!
پس واسه یه مسافرتِ هیجان انگیز، کمربند هاتونو ببندید...

سایر منابع و مآخذ:
1. [url=http://nutshell.ir/?p=14/]http://nutshell.ir[/url]