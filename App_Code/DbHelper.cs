using System;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;

public static class DbHelper
{
    private static readonly string ConnectionString =
        ConfigurationManager.ConnectionStrings["BankDB"].ConnectionString;

    public static SqlConnection GetConnection()
    {
        return new SqlConnection(ConnectionString);
    }

    public static object ExecuteScalar(string query, params SqlParameter[] parameters)
    {
        using (SqlConnection con = GetConnection())
        using (SqlCommand cmd = new SqlCommand(query, con))
        {
            if (parameters != null && parameters.Length > 0)
            {
                cmd.Parameters.AddRange(parameters);
            }

            con.Open();
            return cmd.ExecuteScalar();
        }
    }

    public static int ExecuteNonQuery(string query, params SqlParameter[] parameters)
    {
        using (SqlConnection con = GetConnection())
        using (SqlCommand cmd = new SqlCommand(query, con))
        {
            if (parameters != null && parameters.Length > 0)
            {
                cmd.Parameters.AddRange(parameters);
            }

            con.Open();
            return cmd.ExecuteNonQuery();
        }
    }

    public static DataTable GetDataTable(string query, params SqlParameter[] parameters)
    {
        using (SqlConnection con = GetConnection())
        using (SqlCommand cmd = new SqlCommand(query, con))
        using (SqlDataAdapter da = new SqlDataAdapter(cmd))
        {
            if (parameters != null && parameters.Length > 0)
            {
                cmd.Parameters.AddRange(parameters);
            }

            DataTable dt = new DataTable();
            da.Fill(dt);
            return dt;
        }
    }
}
