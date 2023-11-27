package controller;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import shopping.Fruits;
import shopping.FruitsDAO;

/**
 *
 * @author PHUC
 */

@WebServlet(name = "ShoppingController", urlPatterns = {"/ShoppingController"})
public class ShoppingController extends HttpServlet {

    private static final String ERROR = "shopping.jsp";
    private static final String SUCCESS = "shopping.jsp";

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        String url = ERROR;
        try {
            // Fetch the list of fruits from the database using FruitsDAO
            FruitsDAO dao = new FruitsDAO();
            List<Fruits> fruitsList = dao.getAllFruits();
            if(fruitsList.size()>0){
            // Set the fetched fruits list as a request attribute
            request.setAttribute("FRUITS_LIST", fruitsList);
            url=SUCCESS;
            // Forward the request to the shopping.jsp page
            }
        } catch (Exception e) {
            log("ERROR at ShoppingController: " + e.toString());
        }finally{
            request.getRequestDispatcher(url).forward(request, response);

        }
    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }
}
