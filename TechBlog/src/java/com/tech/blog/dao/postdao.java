/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.tech.blog.dao;

import com.tech.blog.entities.categories;
import com.tech.blog.entities.post;
import java.sql.*;
import java.util.ArrayList;
import java.util.List;
public class postdao {
Connection con;

    public postdao(Connection con) {
        this.con = con;
    }
    
    public ArrayList<categories> getAllCategories(){
        
        ArrayList<categories> list=new ArrayList<>();
        try {
            String q="select * from categories";
            Statement st=this.con.createStatement();
            ResultSet rs=st.executeQuery(q);
            while(rs.next()){
                int cid=rs.getInt("cid");
                String name=rs.getString("name");
                String description=rs.getString("description");
                categories c=new categories(cid,name,description);
                list.add(c);
                
            }
        } catch (Exception e) {
        e.printStackTrace();
        }
        
        return list;
    }
    
    
    public boolean savePost(post p){
        boolean f=false;
        
        try {
            
            String q="insert into post(pTitle,pContent,pCode,pPic,catId,userId) values(?,?,?,?,?,?)";
            PreparedStatement pstmt=con.prepareStatement(q);
            pstmt.setString(1, p.getpTitle());
//            System.out.println(p.getpContent());
            pstmt.setString(2, p.getpContent());
            pstmt.setString(3, p.getpCode());
            pstmt.setString(4, p.getpPic());
            pstmt.setInt(5, p.getCatId());
            pstmt.setInt(6, p.getUserId());
            pstmt.executeUpdate();
            f=true;
            
            
            
            
        } catch (Exception e) {
        e.printStackTrace();
        }
        
        return f;
        
    }
    
    
//    delete a post
    public boolean deletePost(post p){
        boolean f=false;
        
        try {
            
            String q="delete from post where pId=? ";
            PreparedStatement pstmt=con.prepareStatement(q);
            pstmt.setInt(1, p.getPid());
            pstmt.executeUpdate();
            f=true;
            
            
            
            
        } catch (Exception e) {
        e.printStackTrace();
        }
        
        return f;
        
    }
    
    
    
//    get all the posts
    public List<post> getAllPosts(){
        List<post> list=new ArrayList<>();
        
        //fetch all the posts
        try {
            PreparedStatement pstmt=con.prepareStatement("select * from post order by pid desc" );
            
            ResultSet set=pstmt.executeQuery();
            while(set.next()){
                int pid=set.getInt("pid");
                String pTitle=set.getString("pTitle");
                String pContent=set.getString("pContent");
                String pCode=set.getString("pCode");
                String pPic=set.getString("pPic");
                Timestamp date=set.getTimestamp("pDate");
                int catId=set.getInt("catId");
                int userId=set.getInt("userId");
                post p=new post(pid, pTitle, pContent, pCode, pPic, date, catId, userId);
                list.add(p);
            }
            
            
            
        } catch (Exception e) {
        e.printStackTrace();
        }
        
        
        return list;
    }
    
    public List<post> getPostByCatId(int catId){
        List<post> list=new ArrayList<>();
        
        //fetch all the posts by id
        try {
            PreparedStatement pstmt=con.prepareStatement("select * from post where catId=?");
            pstmt.setInt(1, catId);
            ResultSet set=pstmt.executeQuery();
            while(set.next()){
                int pid=set.getInt("pId");
                String pTitle=set.getString("pTitle");
                String pContent=set.getString("pContent");
                String pCode=set.getString("pCode");
                String pPic=set.getString("pPic");
                Timestamp date=set.getTimestamp("pDate");
                
                int userId=set.getInt("userId");
                post p=new post(pid, pTitle, pContent, pCode, pPic, date, catId, userId);
                list.add(p);
            }
            
            
            
        } catch (Exception e) {
        e.printStackTrace();
        }
        
        
        
        return list;
    }
    
    public post getPostById(int postId){
        post p2=null;
        try {
            
            PreparedStatement ps=this.con.prepareStatement("select * from post where pId=? ");
            ps.setInt(1, postId);
            ResultSet s=ps.executeQuery();
            if(s.next()){
                int pid=s.getInt("pId");
                String pTitle=s.getString("pTitle");
                String pContent=s.getString("pContent");
                String pCode=s.getString("pCode");
                String pPic=s.getString("pPic");
                Timestamp date=s.getTimestamp("pDate");
                int cid=s.getInt("catId");
                int userId=s.getInt("userId");
                p2=new post(pid, pTitle, pContent, pCode, pPic, date, cid, userId);
                
            }
            
        } catch (Exception e) {
        e.printStackTrace();
        }
        
        return p2;
    }
}
