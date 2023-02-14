package servlet;

import java.io.IOException;

import javax.servlet.ServletContext;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import membership.MemberDAO;
import membership.MemberDTO;

public class MemberAuth extends HttpServlet {
	MemberDAO dao;

	@Override
	protected void service(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		String admin_id = this.getInitParameter("admin_id");

		String id = req.getParameter("id");
		String pass = req.getParameter("pass");

		MemberDTO memberDTO = dao.getMemberDTO(id, pass);

		String memberName = memberDTO.getName();

		if (memberName != null) {
			req.setAttribute("authMessage", memberName + "반갑다.");
		} else {
			if (admin_id.equals(id))
				req.setAttribute("authMessage", admin_id + "는 최고");
			else
				req.setAttribute("authMessage", "회원이 아닙니다.");
		}
		req.getRequestDispatcher("/13Servlet/MemberAuth.jsp").forward(req, resp);
	}

	@Override
	public void destroy() {
		dao.close();
	}

	@Override
	public void init() throws ServletException {
		ServletContext application = this.getServletContext();

		String driver = application.getInitParameter("OracleDriver");
		String connectUrl = application.getInitParameter("OracleURL");
		String oId = application.getInitParameter("OracleId");
		String oPass = application.getInitParameter("OraclePwd");

		dao = new MemberDAO(driver, connectUrl, oId, oPass);
	}

}
