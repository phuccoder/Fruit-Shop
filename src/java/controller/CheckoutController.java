
/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package controller;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.SQLException;
import java.sql.Timestamp;
import java.util.Map;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import order.OrderDAO;
import order.OrderDetailDAO;
import shopping.Cart;
import shopping.Fruits;
import shopping.FruitsDAO;
import user.UserDTO;
import utils.VerifyRecaptcha;

/**
 *
 * @author PHUC
 */
public class CheckoutController extends HttpServlet {

    /**
     * Processes requests for both HTTP <code>GET</code> and <code>POST</code>
     * methods.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        String cusName = request.getParameter("txtCusName");
        String cusAddress = request.getParameter("txtCusAddress");
        String phone_no = request.getParameter("txtCusPhone_no");
        String total = request.getParameter("total_price");
        String url = "CheckoutViewController";
        try {
            HttpSession  session = request.getSession(false);
            if (session != null) {
                //2.Take customer's cart
                Cart cart = (Cart) session.getAttribute("CART");
                if (cart != null) {
                    Map<String, Integer> items = cart.getItems();
                    if (items != null) {
                        //3.Create order
                        OrderDAO orderDAO = new OrderDAO();
                        int orderId = orderDAO.addOrder(cusName, 
                                                        new Timestamp(System.currentTimeMillis()),  
                                                        cusAddress,
                                                        phone_no, 
                                                        Double.parseDouble(total));
                        //4.Get each item and add to order
                        FruitsDAO productDAO = new FruitsDAO();
                        Fruits dto = null;
                        OrderDetailDAO detailDAO = new OrderDetailDAO();
                        for (String key : items.keySet()) {
                            dto = productDAO.getFruit(key);
                            detailDAO.addOrderDetail(items.get(key),
                                                    items.get(key) * dto.getPrice(),
                                                    key,
                                                    orderId);
                        }//end for items.keySet
                        session.removeAttribute("CART");
                        request.setAttribute("CHECKOUT_SUCCESSFULLY", "checked out successfully");
                    }//end if items is not null
                }//end if cart is not null
            }//end if session is not null

        } catch (SQLException ex) {
            log("CheckoutServlet _ SQL _ " + ex.getMessage());
        }finally {
            RequestDispatcher rd = request.getRequestDispatcher(url);
            rd.forward(request, response);
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
