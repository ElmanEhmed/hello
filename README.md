










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
