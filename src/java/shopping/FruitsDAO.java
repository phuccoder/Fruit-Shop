/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package shopping;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;
import user.UserDTO;
import utils.DBUtils;

/**
 *
 * @author PHUC
 */
public class FruitsDAO {
    private static final String SHOP = "SELECT productID, productName, price, quantity FROM tblProducts";

    public List<Fruits> getAllFruits() throws SQLException {
        List<Fruits> fruitsList = new ArrayList<>();
        Connection conn = null;
        PreparedStatement ptm = null;
        ResultSet rs = null;
        try {
            conn = DBUtils.getConnectionV2();
            ptm = conn.prepareStatement(SHOP);
            rs = ptm.executeQuery();
            while (rs.next()) {
                String productID = rs.getString("productID");
                String productName = rs.getString("productName");
                double price = rs.getDouble("price");
                int quantity = rs.getInt("quantity");
                fruitsList.add(new Fruits(productID, productName, price, quantity));
            }
        } catch (Exception e) {
            e.printStackTrace();
        } finally {
            if (rs != null) rs.close();
            if (ptm != null) ptm.close();
            if (conn != null) conn.close();
        }
        return fruitsList;
    }
    public Fruits getFruit(String id) throws SQLException {
        Connection conn = null;
        PreparedStatement ptm = null;
        ResultSet rs = null;
        Fruits fruit = null;
        try {
            conn = DBUtils.getConnectionV2();
            String sql = "select productName, price, quantity from tblProducts where productID = ?";
            ptm = conn.prepareStatement(sql);
            ptm.setString(1, id);
            rs = ptm.executeQuery();
            if(rs.next()) {
                String productName = rs.getString("productName");
                double price = rs.getDouble("price");
                int quantity = rs.getInt("quantity");
                fruit = new Fruits(id, productName, price, quantity);
            }
        } catch (Exception e) {
            e.printStackTrace();
        } finally {
            if (rs != null) rs.close();
            if (ptm != null) ptm.close();
            if (conn != null) conn.close();
        }
        return fruit;
    }
}
