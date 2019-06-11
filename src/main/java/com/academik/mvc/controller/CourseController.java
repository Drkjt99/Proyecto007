package com.academik.mvc.controller;

import com.academik.mvc.dao.CourseDAO;
import com.academik.mvc.model.Course;
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
@WebServlet("/courses/*")
public class CourseController extends HttpServlet {
    
    CourseDAO dao = new CourseDAO();

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        String complement = req.getPathInfo();
        if (complement == null)
            complement="";
        System.err.println(complement);
        String redirectPage = "";
        switch (complement) {
            case "/create":
                redirectPage = "course-create.jsp";
                break;
            case "/view":
                Long idToView = Long.parseLong(req.getParameter("id"));
                Course sToView = dao.findById(idToView);
                req.setAttribute("single_course", sToView);
                redirectPage = "course-view.jsp";
                break;
            case "/edit":
                Long idToEdit = Long.parseLong(req.getParameter("id"));
                Course sToEdit = dao.findById(idToEdit);
                req.setAttribute("single_course", sToEdit);
                redirectPage = "course-edit.jsp";
                break;
            case "/list":
                break;
            case "/":
            case "":
                List<Course> allStudents = dao.queryAll();
                req.setAttribute("list_of_courses", allStudents);
                redirectPage = "course-list.jsp";
                break;
            default:
                resp.sendRedirect(req.getContextPath() + "/courses" );
                return;
        }
        
        RequestDispatcher rd = req.getRequestDispatcher(
                "/views/" + redirectPage
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
        
        Course naab = new Course();
        
        naab.setName(req.getParameter("c_name"));
        naab.setDescription(req.getParameter("c_description"));
        naab.setCredits(req.getParameter("c_credits"));
        
        dao.create(naab);
        resp.sendRedirect(req.getContextPath() + "/courses");
    
        
    }

    @Override
    protected void doPut(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        System.out.println("editing course");
        
        Course edited = new Course();
        
        edited.setName(req.getParameter("c_name"));
        edited.setDescription(req.getParameter("c_description"));
        edited.setCredits(req.getParameter("c_credits"));
        
        dao.edit(Integer.parseInt(req.getParameter("course_code")), edited);
        resp.sendRedirect(req.getContextPath() + "/courses" );
        
    }

    @Override
    protected void doDelete(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        System.err.println("Deleting student....");
        long id = Long.parseLong(req.getParameter("course_code"));
        dao.delete(id);
        resp.sendRedirect(req.getContextPath() + "/courses");
    } 
        
}







