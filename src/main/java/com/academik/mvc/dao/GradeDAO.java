package com.academik.mvc.dao;


import com.academik.mvc.model.Grade;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;

/**
 *
 * @author drk_j
 */
public class GradeDAO implements GeneralDAO<Grade> {
    
    @Override
    public List<Grade> queryAll(){
        List<Grade> temp = new ArrayList<>();
        try {
            Connection conn = CONN_WRAPPER.getConnection();
            Statement stmnt = conn.createStatement();
            ResultSet result = stmnt.executeQuery("SELECT students_code, course_code, grade FROM grades");
            while (result.next()){
                Grade g = new Grade();
                
                g.setStudentCode(result.getInt("students_code"));
                g.setCourseCode(result.getInt("course_code"));
                g.setGrade(result.getDouble("grade"));                
                temp.add(g);
            }
        } catch (ClassNotFoundException | SQLException ex) {
            ex.printStackTrace();
        }
        return temp;    
    }

    @Override
    public Grade findById(long id) {
        Grade g = null;
        try{
            Connection conn = CONN_WRAPPER.getConnection();
            PreparedStatement stmnt = conn.prepareStatement("SELECT students_code, course_code, grade FROM grades WHERE code = ?");
            stmnt.setLong(1, id); 
            
            ResultSet result = stmnt.executeQuery();
            if (result.next()){
                g = new Grade();
                g.setStudentCode(result.getInt("students_code"));
                g.setCourseCode(result.getInt("name_course"));
                g.setGrade(result.getDouble("description"));
                
                
            }            
        }catch (ClassNotFoundException | SQLException ex){
            ex.printStackTrace();
        }
        return g;
        
    }

    @Override
    public void create(Grade element) {
        try {
            Connection conn = CONN_WRAPPER.getConnection();
            PreparedStatement stmnt = conn.prepareStatement(
                    "INSERT INTO grades"
                    +" (students_code, course_code, grade)"
                    +" VALUES (?, ?, ?)"
            );
            stmnt.setInt(1, element.getStudentCode());
            stmnt.setInt(2, element.getCourseCode());
            stmnt.setDouble(3, element.getGrade());
            stmnt.execute();
        }catch (ClassNotFoundException | SQLException ex){
            ex.printStackTrace();
        }
    }

    @Override
    public void edit(long id, Grade edited) {
        try {
            Connection conn = CONN_WRAPPER.getConnection();
            PreparedStatement stmnt = conn.prepareStatement(
                "UPDATE grades SET "
              + " students_code = ?,"
              + " course_code = ?,"
              + " grade = ?,"
            );
            stmnt.setInt(1, edited.getStudentCode());
            stmnt.setInt(2, edited.getCourseCode());
            stmnt.setDouble(3, edited.getGrade());
        }catch(ClassNotFoundException | SQLException ex){
            ex.printStackTrace();
        }    
    }

    @Override
    public void delete(long id) {
        try {
            Connection conn = CONN_WRAPPER.getConnection();
            
            PreparedStatement stmnt = conn.prepareStatement(
                    "DELETE FROM grades WHERE students_code = ?"
            );
            stmnt.setLong(1, id);
            stmnt.executeUpdate();
        } catch(ClassNotFoundException | SQLException ex) {
            ex.printStackTrace();
        }
    }
}
