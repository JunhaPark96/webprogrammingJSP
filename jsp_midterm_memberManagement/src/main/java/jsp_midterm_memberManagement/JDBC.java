package jsp_midterm_memberManagement;

import java.sql.Connection;
import java.sql.SQLException;

import javax.naming.Context;
import javax.naming.InitialContext;
import javax.sql.DataSource;


public class JDBC {
	// 유일한 인스턴스를 저장할 private static 변수를 선언
	private static JDBC instance = null;
	private Connection conn = null;
	private DataSource ds;
	
	// 생성자를 private으로 선언하여 외부에서 인스턴스를 생성불가
	private JDBC() {
		try {
//			선언한 data source를 얻기 위해 InitialContext 객체를 생성하고, 
//			lookup 메소드에 JNDI 이름을 넘겨 해당하는 resource 반환
			Context ctx = new InitialContext(); // context.xml 설정을 통해 불러오기
			ds = (DataSource)ctx.lookup("java:comp/env/jdbc/Oracle19c");
		} catch (Exception e) {
			e.printStackTrace();
		}
	}
	// 유일한 인스턴스를 반환하는 static 메서드를 정의
    public static JDBC getInstance() {
        if (instance == null) {
            instance = new JDBC();
        }
        return instance;
    }
    public Connection getConnection() {
    	try {
            // Connection을 DataSource로부터 가져오고 반환
            if (conn == null || conn.isClosed()) {
                conn = ds.getConnection();
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return conn;
    }
    
    // Connection 종료
    public void closeConnection() {
        try {
            conn.close();
            
        } catch (SQLException e) {
            e.printStackTrace();
        }
    }
    
    // Connection이 정상적으로 종료되었는지 확인
    public void isClosed() {
        try {
            if (conn.isClosed()) {
                System.out.println("JDBC 연결 해제 성공");
            } else {
                System.out.println("JDBC 연결 해제 실패");
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
    }
}
