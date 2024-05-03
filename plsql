

https://docs.google.com/spreadsheets/d/1Mx7KtB5hVFKSQ-ONpMvmIbGAOhMMYUvJr_ehO9bmYiA/edit?usp=drivesdk



Bank sistemi müxtəlif funksiyaları və prosesləri dəstəkləmək üçün bir çox cədvəldən istifadə edir. PL/SQL ilə SQL verilənlər bazasında qurula biləcək cədvəllərin bir hissəsini aşağıda sadalamışam. Bu cədvəllər bankçılığın müxtəlif aspektlərini əhatə edir və məlumatların effektiv idarə olunmasını təmin edir:

### Müştərilərə Aid Cədvəllər
1. **Müştəri**:
   - Müştəri ID, Ad, Soyad, Doğum Tarixi, Ünvan, Əlaqə Nömrəsi və s.

2. **Müştəri Hesabları**:
   - Hesab ID, Müştəri ID, Hesab Tipi (Saxlama, Yığım, Çəkiliş və s.), Balans və s.

### Hesab və Maliyyə Cədvəlləri
3. **Əməliyyatlar**:
   - Əməliyyat ID, Hesab ID, Əməliyyat Tipi (Yatırma, Çəkiliş, Transfer), Məbləğ, Tarix və s.

4. **Kreditlər**:
   - Kredit ID, Müştəri ID, Kredit Məbləği, Kredit Faizi, Başlama Tarixi, Ödəniş Planı və s.

5. **Depozitlər**:
   - Depozit ID, Müştəri ID, Depozit Tipi, Məbləğ, Faiz, Başlama Tarixi və s.

### Kartlara Aid Cədvəllər
6. **Kredit Kartları**:
   - Kart ID, Müştəri ID, Kart Nömrəsi, Kredit Limit, Balans, Son İstifadə Tarixi və s.

7. **Debet Kartları**:
   - Kart ID, Müştəri ID, Kart Nömrəsi, Balans, Son İstifadə Tarixi və s.

### Kadr və İşçilər Cədvəlləri
8. **İşçilər**:
   - İşçi ID, Ad, Vəzifə, Əmək Haqqı, İcazə Günü, Şöbə və s.

9. **Şöbələr**:
   - Şöbə ID, Ad, Məkan və s.

### Digər Cədvəllər
10. **Avtomatlaşdırılmış Pul Köçürmələri (ATM)**:
    - ATM ID, Məkan, Xidmət Etdiyi Hesablar, Nəğd Pul Miqdarı və s.

11. **Borc Cədvəli**:
    - Borc ID, Müştəri ID, Borcun Növü, Məbləğ, Son Ödəniş Tarixi və s.

12. **Risk İdarəçiliyi**:
    - Risk ID, Risk Növü, Riskin Təhlili, Tədbirlər və s.

### Cədvəl Əlaqələri və İndekslər
- Müştəri ilə Müştəri Hesabları, Müştəri ilə Kredit Kartları, Hesablarla Əməliyyatlar kimi əlaqələri qurmaq üçün **xarici açarları** və **indeksləri** nəzərə almalısınız.

### Digər Cədvəllər
Bunlar bank sistemində ümumi cədvəllərdir, lakin hər bir bankın spesifik ehtiyaclarına uyğun fərqli və əlavə cədvəllər də ola bilər. Dəqiq strukturlar layihənin tələblərindən və biznes ehtiyaclarından asılı olaraq dəyişə bilər.





PL/SQL kullanarak kapsamlı bir banka projesi oluşturmak, çeşitli bileşenlerin dikkatle planlanmasını ve uygulanmasını gerektirir. Aşağıda, bir banka projesinde bulunması gereken temel PL/SQL bileşenlerinin bir listesi verilmiştir. Her bir bileşen, bankacılık operasyonlarının belirli bir yönünü kapsar.

### Tablolar (Tables)
1. **Müşteriler (Customers)**
   - Müşteri bilgilerini saklar (ad, soyad, adres, telefon, e-posta, doğum tarihi, kayıt tarihi).
   
2. **Hesaplar (Accounts)**
   - Banka hesaplarının detaylarını içerir (hesap türü, bakiye, açılış tarihi, müşteri kimliği).

3. **İşlemler (Transactions)**
   - Banka hesaplarıyla ilgili tüm işlemleri kaydeder (işlem türü, miktar, tarih, hesap kimliği).
   
4. **Krediler (Loans)**
   - Müşterilere verilen kredileri saklar (kredi miktarı, faiz oranı, kredi süresi, başlangıç tarihi).

5. **Çalışanlar (Employees)**
   - Banka personelinin bilgilerini içerir (ad, soyad, pozisyon, maaş).

### Saklı Yordamlar (Stored Procedures)
6. **Para Yatırma (Deposit)**
   - Bir hesaba para yatırmak için saklı yordam.
   
7. **Para Çekme (Withdraw)**
   - Bir hesaptan para çekmek için saklı yordam.
   
8. **Kredi Verme (IssueLoan)**
   - Müşterilere kredi vermek için saklı yordam.
   
9. **Para Transferi (TransferMoney)**
   - İki hesap arasında para transferi için saklı yordam.

### Fonksiyonlar (Functions)
10. **Kredi Taksiti Hesaplayıcı (CalculateLoanInstallment)**
    - Bir kredinin aylık taksitini hesaplar (kredi miktarı, faiz oranı, kredi süresi).
    
11. **Hesap Bakiye Kontrolü (CheckAccountBalance)**
    - Belirli bir hesabın bakiye kontrolü için fonksiyon.

### Tetikleyiciler (Triggers)
12. **Düşük Bakiye Uyarısı (LowBalanceAlert)**
    - Bir hesap bakiyesi belirli bir seviyenin altına düştüğünde uyarı tetikleyicisi.
    
13. **İşlem Günlüğü (TransactionLog)**
    - İşlemleri kaydetmek için tetikleyici.
    
14. **Müşteri Kayıt Tetikleyicisi (CustomerRegistrationTrigger)**
    - Yeni müşteri kayıtlarında çalışan tetikleyici.

### Diğer Güvenlik ve Yönetim Unsurları
15. **Rol Tabanlı Erişim Kontrolü (Role-Based Access Control)**
    - Kullanıcı erişim yetkilerini rollerle düzenleyin (örneğin, müşteri hizmetleri, yönetici, kasiyer).
    
16. **SQL Injection'a Karşı Koruma (SQL Injection Protection)**
    - Kullanıcı girdilerini kaçırarak SQL injection'a karşı koruma sağlama.
    
17. **Veri Şifreleme (Data Encryption)**
    - Hassas verileri şifreleyerek güvenliği artırın.
    
18. **Düzenli Yedekleme ve Kurtarma (Regular Backup and Recovery)**
    - Veritabanının düzenli yedeklenmesi ve felaket kurtarma planının hazırlanması.
    
19. **Denetim ve İzleme (Audit and Monitoring)**
    - Kimin veritabanına eriştiğini ve hangi işlemleri yaptığını izleyin.
    
20. **Şifre Güvenliği (Password Security)**
    - Güçlü şifre politikaları uygulayın ve çok faktörlü kimlik doğrulama sağlayın.

### Sonuç
Bu liste, PL/SQL kullanılarak bir banka projesi oluşturmak için gerekli bileşenleri kapsar. Her bir bileşen, bankacılık operasyonlarının belirli bir yönünü desteklemek için tasarlanmıştır. Proje geliştirme sürecinde, işlevselliği, performansı ve güvenliği sağlamak için bu bileşenleri dikkatlice uygulamak ve test etmek önemlidir.


ALTER TABLE Orders
ADD CONSTRAINT fk_customer
FOREIGN KEY (customer_id)
REFERENCES Customers(customer_id)
ON DELETE CASCADE; -- Referans alınan müşteri silinirse, ilişkili siparişler de silinir.
