""
$banner="            ###############
############### WinEnum ############
            ###############"

"$banner"

""
$b="########################## Kimim ##########################"
"$b"
Get-Item env:\username #kullanici
""

$pc="###################### Bilgisayar Adı ############################"
Get-Item env:\Computername #bilgisayar adı
""

$kullaniciDizin="###################### Kullanici Dizin ########################"
Get-ChildItem env:\userprofile
""
$sistemi="########################## Sistem Bilgileri ##########################"
"$sistemi"
 Get-CimInstance Win32_OperatingSystem | Select-Object  Caption, InstallDate, ServicePackMajorVersion, OSArchitecture, BootDevice,  BuildNumber, CSName | FL
 #işletim sistemi hakkında bilgiler

""

$domain="###################### Domain ########################"
"$domain"
get-wmiobject win32_computersystem | findstr.exe Domain

""
$a="########################## IP Adresi ##########################"
"$a"
Get-NetAdapter | ? status -eq ‘up’ | Get-NetIPAddress -ea 0 | ft ipaddress, interfacealias, prefixorigin -a
#ipconfig | findstr "IPv4"  # ipv4 versiyonu öğreniliyor
""

""
$g="########################## Nslookup ile Bulunan IP Adresi ##########################"
nslookup . ifcfg.me | Select-String "Address"
#basit ip adres tespiti
""

$o="########################## Gelişmiş Dış Ağ Bilgileri ##########################"
"$o"
Invoke-RestMethod http://ipinfo.io/json
#lokasyon dahil ip adresini ifcfg.me de sorguluyor
""




$c="########################## Ağdaki Yazıcılar ##########################"
"$c"
Get-Printer #yazıcılar bulunuyor
""


$d="########################## Tüm Log Kayıtları (Görmek için kaynak kodda edit yapınız) ##########################"
"$d"
#Get-WinEvent -listlog * #Tüm log kayitları bulunuyor
""


$kurulum="########################## Sistem Kurulum Zamanı ##########################"
"$kurulum"
gcim Win32_OperatingSystem | select Version, InstallDate 
#sistemi kurulum zamanı

""
$cron="########################## Zamanlanmış Görevler ##########################"
"$cron"
Get-ScheduledTask
#zamanlanmış görevlerin tamamı

""

$servisler="########################## Çalışan İşlemler ##########################"
"$servisler"
Get-Process | Format-Table -Property Id,Handles,CPU,Name
#çalışan işlemler
""

$ag="########################## Ağ Bağlantıları ##########################"
netstat -a
#bağlantılar
""



$uptime="########################## Uptime Zamanı ##########################"
"$uptime"

Get-CimInstance -ClassName win32_operatingsystem | select csname, lastbootuptime
#sistemin çalışma zamanı

""

 $kullanicilar="########################## Kullanıcıların Bilgileri/Durumları ##########################"
 "$kullanicilar"
 query user /server:$SERVER | format-table
 #kullanıcıların durumları