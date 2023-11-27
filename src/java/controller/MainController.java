/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package controller;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 *
 * @author PHUC
 */
public class MainController extends HttpServlet {

    private static final String WELCOME_PAGE="login.jsp";
    private static final String LOGIN="Login";
    private static final String LOGIN_CONTROLLER="LoginController";
    private static final String SEARCH = "Search";
    private static final String SEARCH_CONTROLLER = "SearchController";
    private static final String DELETE = "Delete";
    private static final String DELETE_CONTROLLER = "DeleteController";
    private static final String UPDATE = "Update";
    private static final String UPDATE_CONTROLLER = "UpdateController";
    private static final String CREATE_PAGE = "CreatePage";
    private static final String CREATE_PAGE_VIEW = "createUser.html";
    private static final String CREATE = "Create";
    private static final String CREATE_CONTROLLER = "CreateController";
    private static final String LOGOUT="Logout";
    private static final String LOGOUT_CONTROLLER = "LogoutController";
    private static final String SHOPPING_PAGE="shoppingPage";
    private static final String SHOPPING_CONTROLLER= "ShoppingController";
    private static final String ADD_TO_CART="AddToCart";
    private static final String ADD_TO_CART_CONTROLLER= "CartAddController";
    private static final String VIEW="View";
    private static final String VIEW_CART_CONTROLLER= "CartViewController";
    private static final String EDIT="Edit";
    private static final String EDIT_CONTROLLER="EditController";
    private static final String REMOVE="Remove";
    private static final String CART_REMOVE_CONTROLLER="CartRemoveController";
    private static final String CHECKOUT="Confirm Checkout";
    private static final String CHECKOUT_CONTROLLER="CheckoutController";
    private static final String CHECKOUT_VIEW="checkout.jsp";
    private static final String CHECKOUT_VIEW_CONTROLLER="CheckoutViewController";
    private static final String TOP1_USER="top1";
    private static final String TOP1_USER_CONTROLLER="Top1UserController";
    
    

    
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        String url = WELCOME_PAGE;
        try {
            String action = request.getParameter("action");
            System.out.println(action);
            if(LOGIN.equals(action)) {
                url = LOGIN_CONTROLLER;
            } else if (SEARCH.equals(action)){
                url = SEARCH_CONTROLLER;
            } else if (DELETE.equals(action)){
                url = DELETE_CONTROLLER;
            } else if (UPDATE.equals(action)){
                url = UPDATE_CONTROLLER;
            }else if (CREATE_PAGE.equals(action)){
                url = CREATE_PAGE_VIEW;
            }  else if (CREATE.equals(action)){
                url = CREATE_CONTROLLER;
            } else if(LOGOUT.equals(action)){
                url = LOGOUT_CONTROLLER;
            } else if(SHOPPING_PAGE.equals(action)){  
             url = SHOPPING_CONTROLLER ;
            }else if(ADD_TO_CART.equals(action)){
                url = ADD_TO_CART_CONTROLLER;
            }else if(VIEW.equals(action)){
                url = VIEW_CART_CONTROLLER;  
            }else if (EDIT.equals(action)){
                url = EDIT_CONTROLLER;
            }else if (REMOVE.equals(action)){
                url = CART_REMOVE_CONTROLLER;
            }else if (CHECKOUT.equals(action)){
                url = CHECKOUT_CONTROLLER;
            }else if (CHECKOUT_VIEW.equals(action)){
                url = CHECKOUT_VIEW_CONTROLLER;
            }else if (TOP1_USER.equals(action)){
                url = TOP1_USER_CONTROLLER;
            }else {
                request.setAttribute("ERROR", "Your ACTION is not support");
            }
        } catch (Exception e) {
            log("ERROR at MainController" + e.toString());
        } finally {
            request.getRequestDispatcher(url).forward(request, response);
        }
    }
    

    // <editor-fold defaultstate="collapsed" desc="HttpServlet methods. Click on the + sign on the left to edit the code.">
    /**
     * Handles the HTTP <code>GET</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    /**
     * Handles the HTTP <code>POST</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    /**
     * Returns a short description of the servlet.
     *
     * @return a String containing servlet description
     */
    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}
