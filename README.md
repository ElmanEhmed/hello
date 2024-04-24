



CREATE PROCEDURE SignUpUser
    @Username NVARCHAR(50),
    @Email NVARCHAR(100),
    @PasswordHash VARBINARY(64)
AS
BEGIN
    IF EXISTS (SELECT 1 FROM Users WHERE Username = @Username OR Email = @Email)
    BEGIN
        THROW 51000, 'Username or Email already exists', 1;
    END

    INSERT INTO Users (Username, Email, PasswordHash) VALUES (@Username, @Email, @PasswordHash);
END;



CREATE PROCEDURE SignInUser
    @Username NVARCHAR(50),
    @PasswordHash VARBINARY(64)
AS
BEGIN
    SELECT * FROM Users WHERE Username = @Username AND PasswordHash = @PasswordHash;
END;



using System;
using System.Data;
using System.Data.SqlClient;
using System.Security.Cryptography;
using System.Text;

public bool SignUp(string username, string email, string password)
{
    // Parolu SHA-256 ilə hash edirik
    byte[] passwordHash = HashPassword(password);

    string connectionString = "YOUR_CONNECTION_STRING";
    using (SqlConnection connection = new SqlConnection(connectionString))
    {
        SqlCommand command = new SqlCommand("SignUpUser", connection);
        command.CommandType = CommandType.StoredProcedure;
        command.Parameters.AddWithValue("@Username", username);
        command.Parameters.AddWithValue("@Email", email);
        command.Parameters.AddWithValue("@PasswordHash", passwordHash);

        try
        {
            connection.Open();
            command.ExecuteNonQuery();
            return true;
        }
        catch (SqlException ex)
        {
            // Əgər istifadəçi adı və ya e-poçt artıq mövcuddursa, xətanı idarə edin
            Console.WriteLine(ex.Message);
            return false;
        }
    }
}








public bool SignIn(string username, string password)
{
    byte[] passwordHash = HashPassword(password);

    string connectionString = "YOUR_CONNECTION_STRING";
    using (SqlConnection connection = new SqlConnection(connectionString))
    {
        SqlCommand command = new SqlCommand("SignInUser", connection);
        command.CommandType = CommandType.StoredProcedure;
        command.Parameters.AddWithValue("@Username", username);
        command.Parameters.AddWithValue("@PasswordHash", passwordHash);

        connection.Open();
        using (SqlDataReader reader = command.ExecuteReader())
        {
            return reader.HasRows; // Əgər uyğun istifadəçi varsa, true qaytarır
        }
    }
}


public byte[] HashPassword(string password)
{
    using (SHA256 sha256 = SHA256.Create())
    {
        return sha256.ComputeHash(Encoding.UTF8.GetBytes(password));
    }
}























CREATE TABLE Users (
    UserID INT PRIMARY KEY IDENTITY,
    Username NVARCHAR(50) UNIQUE,
    Email NVARCHAR(100) UNIQUE,
    PasswordHash VARBINARY(64)
);

using System.Security.Cryptography;
using System.Text;

public byte[] HashPassword(string password)
{
    using (SHA256 sha256 = SHA256.Create())
    {
        return sha256.ComputeHash(Encoding.UTF8.GetBytes(password));
    }
}





using System;
using System.Data.SqlClient;

public bool SignUp(string username, string email, string password)
{
    byte[] passwordHash = HashPassword(password);

    string connectionString = "YOUR_CONNECTION_STRING";
    using (SqlConnection conn = new SqlConnection(connectionString))
    {
        conn.Open();
        string query = "INSERT INTO Users (Username, Email, PasswordHash) VALUES (@Username, @Email, @PasswordHash)";

        using (SqlCommand cmd = new SqlCommand(query, conn))
        {
            cmd.Parameters.AddWithValue("@Username", username);
            cmd.Parameters.AddWithValue("@Email", email);
            cmd.Parameters.AddWithValue("@PasswordHash", passwordHash);

            try
            {
                cmd.ExecuteNonQuery();
                return true;
            }
            catch (SqlException)
            {
                return false;
            }
        }
    }
}




public bool SignIn(string username, string password)
{
    byte[] passwordHash = HashPassword(password);

    string connectionString = "YOUR_CONNECTION_STRING";
    using (SqlConnection conn = new SqlConnection(connectionString))
    {
        conn.Open();
        string query = "SELECT PasswordHash FROM Users WHERE Username = @Username";

        using (SqlCommand cmd = new SqlCommand(query, conn))
        {
            cmd.Parameters.AddWithValue("@Username", username);

            using (SqlDataReader reader = cmd.ExecuteReader())
            {
                if (reader.Read())
                {
                    byte[] storedHash = (byte[])reader["PasswordHash"];
                    return storedHash.SequenceEqual(passwordHash);
                }
            }
        }
    }

    return false;
}






CREATE TABLE Roles (
    RoleID INT PRIMARY KEY,
    RoleName NVARCHAR(50)
);


CREATE TABLE Users (
    UserID INT PRIMARY KEY IDENTITY,
    Username NVARCHAR(50) UNIQUE,
    Email NVARCHAR(100) UNIQUE,
    PasswordHash VARBINARY(64),
    RoleID INT,
    CONSTRAINT FK_Users_Roles FOREIGN KEY (RoleID) REFERENCES Roles (RoleID)
);

INSERT INTO Roles (RoleID, RoleName) VALUES (1, 'Admin');
INSERT INTO Roles (RoleID, RoleName) VALUES (2, 'User');


INSERT INTO Users (Username, Email, PasswordHash, RoleID) 
VALUES ('johndoe', 'johndoe@example.com', 0x0123456789ABCDEF, 2);
