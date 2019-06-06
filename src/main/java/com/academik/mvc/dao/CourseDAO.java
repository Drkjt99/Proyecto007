package com.academik.mvc.dao;

import com.academik.mvc.model.Course;
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
public class CourseDAO implements GeneralDAO<Course> {
    
    public List<Course> queryAll(){
        List<Course> temp = new ArrayList<>();
        try {
            Connection conn = CONN_WRAPPER.getConnection();
            Statement stmnt = conn.createStatement();
            ResultSet result = stmnt.executeQuery("SELECT code, name_course, description, credits FROM courses");
            while (result.next()){
                Course c = new Course();
                c.setCode(result.getLong("code"));
                c.setName(result.getString("name_course"));
                c.setDescription(result.getString("description"));
                c.setCredits(result.getString("credits"));
                temp.add(c);
            }
        } catch (ClassNotFoundException | SQLException ex) {
            ex.printStackTrace();
        }
        return temp;    
    }

    @Override
    public Course findById(long id) {
        Course c = null;
        try{
            Connection conn = CONN_WRAPPER.getConnection();
            PreparedStatement stmnt = conn.prepareStatement("SELECT code, name_course, description,credits FROM courses WHERE code = ?");
            stmnt.setLong(1, id); 
            
            ResultSet result = stmnt.executeQuery();
            if (result.next()){
                c = new Course();
                c.setCode(result.getLong("code"));
                c.setName(result.getString("name_course"));
                c.setDescription(result.getString("description"));
                c.setCredits(result.getString("credits"));
                
            }            
        }catch (ClassNotFoundException | SQLException ex){
            ex.printStackTrace();
        }
        return c;
        
    }

    @Override
    public void create(Course element) {
        try {
            Connection conn = CONN_WRAPPER.getConnection();
            PreparedStatement stmnt = conn.prepareStatement(
                    "INSERT INTO courses"
                    +" (name_course, description, credits)"
                    +" VALUES (?, ?, ?)"
            );
            stmnt.setString(1, element.getName());
            stmnt.setString(2, element.getDescription());
            stmnt.setString(3, element.getCredits());
            stmnt.execute();
        }catch (ClassNotFoundException | SQLException ex){
            ex.printStackTrace();
        }
    }

    @Override
    public void edit(long id, Course edited) {
        try {
            Connection conn = CONN_WRAPPER.getConnection();
            PreparedStatement stmnt = conn.prepareStatement(
                "UPDATE courses SET "
              + " name_course = ?,"
              + " description = ?,"
              + " credits = ?,"
            );
            stmnt.setString(1, edited.getName());
            stmnt.setString(2, edited.getDescription());
            stmnt.setString(3, edited.getCredits());
        }catch(ClassNotFoundException | SQLException ex){
            ex.printStackTrace();
        }    
    }

    @Override
    public void delete(long id) {
        try {
            Connection conn = CONN_WRAPPER.getConnection();
            
            PreparedStatement stmnt = conn.prepareStatement(
                    "DELETE FROM courses WHERE code = ?"
            );
            stmnt.setLong(1, id);
            stmnt.executeUpdate();
        } catch(ClassNotFoundException | SQLException ex) {
            ex.printStackTrace();
        }
    }

    }
    

