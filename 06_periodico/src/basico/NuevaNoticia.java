package basico;

import java.io.IOException;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;



/**
 * Servlet implementation class NuevaNoticia
 */
@WebServlet("/NuevaNoticia")
public class NuevaNoticia extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public NuevaNoticia() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		
		String mail = request.getParameter("email");
		String categorias = request.getParameter("categorias");
		String titulo = request.getParameter("titulo");
		String contenido = request.getParameter("contenido");
		
		try {
			Class.forName("com.mysql.jdbc.Driver");
			Connection conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/periodico", "root", "");
			Statement st = conn.createStatement();
			PreparedStatement ps = conn.prepareStatement("INSERT INTO noticias VALUES (NULL,?,?,?,?,NULL)");
			
			ps.setString(1, mail);
			ps.setNString(2, categorias);
			ps.setNString(3, titulo);
			ps.setNString(4, contenido);
			
			ps.executeUpdate();
			response.sendRedirect("Consultar");
			
		} catch (ClassNotFoundException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}

}
