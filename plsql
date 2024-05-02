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
