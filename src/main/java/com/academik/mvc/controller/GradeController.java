package com.academik.mvc.controller;


import com.academik.mvc.dao.GradeDAO;
import com.academik.mvc.model.Grade;
import java.io.IOException;
import java.util.List;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 *
 * @author drk_j
 */
@WebServlet("/grades/*")
public class GradeController extends HttpServlet {
    
    GradeDAO dao = new GradeDAO();

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        String complement = req.getPathInfo();
        if (complement == null)
            complement="";
        System.err.println(complement);
        String redirectPage = "";
        switch (complement) {
            case "/create":
                redirectPage = "grade-create.jsp";
                break;
            case "/view":
                Integer idToView = Integer.parseInt(req.getParameter("id"));
                Grade sToView = dao.findById(idToView);
                req.setAttribute("single_course", sToView);
                redirectPage = "course-view.jsp";
                break;
            default:
                resp.sendRedirect(req.getContextPath() + "/grades" );
                return;
        }
        
        RequestDispatcher rd = req.getRequestDispatcher(
                "/views" + redirectPage
        );
        
        rd.forward(req, resp);
    }

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        
        if("PUT".equals(req.getParameter("_method"))){
            doPut(req, resp);
            return;
        }
        if("DELETE".equals(req.getParameter("_method"))){
            doDelete(req, resp);
            return;
        }
        
        System.out.println("creating a new course");
        
        Grade nab = new Grade();
        
        Integer a = Integer.parseInt(req.getParameter("s_fullname"));
        nab.setStudentCode(a);
        Integer b = Integer.parseInt(req.getParameter("c_name"));
        nab.setCourseCode(b);
        double c = Double.parseDouble(req.getParameter("g_grade"));
        nab.setGrade(c);
        
        dao.create(nab);
        resp.sendRedirect(req.getContextPath() + "/grades");
    
        
    }

    @Override
    protected void doDelete(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        System.err.println("Deleting student....");
        long id = Long.parseLong(req.getParameter("code"));
        dao.delete(id);
        resp.sendRedirect(req.getContextPath() + "/grades");
    } 
}
