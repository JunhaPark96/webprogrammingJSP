package jsp_8_3;

import jakarta.annotation.PostConstruct;
import jakarta.annotation.PreDestroy;
import jakarta.servlet.ServletConfig;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebListener;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.io.IOException;

@WebListener
public class ListenerTest extends HttpServlet {
    private static final long serialVersionUID = 1L;

    public ListenerTest() {
        super();
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        response.setContentType("text/html; charset=utf-8");
        response.getWriter().append("ListenerTest Served at: ").append(request.getContextPath());
        System.out.println("doGet");
        
    }

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        // TODO Auto-generated method stub
        doGet(request, response);
    }
    
    @Override
    public void init(ServletConfig config) throws ServletException {
    	super.init(config);
    	System.out.println("init");
    }
    
    @Override
    public void destroy() {
    	super.destroy();
    	System.out.println("destroy");
    }
    
    @PostConstruct
	public void postConstruct() {
		System.out.println("Postconstruct");
	}
	
	@PreDestroy
	public void preDestroy() {
		System.out.println("PreDestroy");
	}
}