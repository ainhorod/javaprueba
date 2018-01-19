package basico;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.sun.crypto.provider.RSACipher;



/**
 * Servlet implementation class Consultar
 */
@WebServlet("/Consultar")
public class Consultar extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public Consultar() {
        super();
               // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		response.getWriter().append("Served at: ").append(request.getContextPath());
		
		/* getServletConfig().getServletContext().getRequestDispatcher("/leer.jsp").forward(arg0, arg1); */
		
		try {
			
			PrintWriter respuesta = response.getWriter();
			Class.forName("com.mysql.jdbc.Driver");
			Connection conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/periodico", "root", "");
			Statement st = conn.createStatement();
			ResultSet rs = st.executeQuery("SELECT * FROM noticias");
				
			String resultado="";
			
			resultado+="<table class=\"striped\">";
			
				resultado+="<th>id noticia</th>";
				resultado+="<th>mail</th>";
				resultado+="<th>id categoria</th>";
				resultado+="<th>titulo</th>";
				resultado+="<th>contenido</th>";
				resultado+="<th>fecha publicacion</th>";
				
					while(rs.next()) {
						
						
						resultado+= "<tr>";
						
						/*respuesta.println(rs.getString(2)); */
						
						resultado+="<td>"+rs.getString(1)+"</td>";
						resultado+="<td>"+rs.getString(2)+"</td>";
						resultado+="<td>"+rs.getString(3)+"</td>";
						resultado+="<td>"+rs.getString(4)+"</td>";
						resultado+="<td>"+rs.getString(5)+"</td>";
						resultado+="<td>"+rs.getString(6)+"</td>";
						
						
						
						resultado+="</tr>";
					
					}
					
					resultado+="</table>";
					request.getSession().setAttribute("servletMsg", resultado);
				
					
					response.sendRedirect("Leer.jsp");
		} catch (ClassNotFoundException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
	}

}
