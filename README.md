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
