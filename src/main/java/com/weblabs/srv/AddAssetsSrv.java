package com.weblabs.srv;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.weblabs.service.impl.AssetsServiceImpl;

@WebServlet("/AddAssetsSrv")
public class AddAssetsSrv extends HttpServlet {
    private static final long serialVersionUID = 1L;

    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        String status = "Operation not yet executed"; // Default status

        String assetName = request.getParameter("asset_name");
        String PurchaseDate = request.getParameter("purchase_date");
       String supplierID = request.getParameter("supplier_id");
      //  int supplierID = Integer.parseInt(request.getParameter("supplier_id")); // Parse as an integer
        String Manufacturer = request.getParameter("manufacturer");
        String Model = request.getParameter("model");
        String Status = request.getParameter("status");
       
        String AssetCondition = request.getParameter("condition");
        String Warranty = request.getParameter("warranty");
        String Price = request.getParameter("value");
      //  int Price = Integer.parseInt(request.getParameter("value")); // Parse as an integer
        String AssetUser = request.getParameter("asset_user");
        String Description = request.getParameter("description");
     


        AssetsServiceImpl ass = new AssetsServiceImpl();
        status = ass.addAssets(assetName, PurchaseDate, supplierID, Manufacturer, Model, Status,  AssetCondition, Warranty, Price, AssetUser, Description);
        RequestDispatcher rd = request.getRequestDispatcher("Assets.jsp?message=" + status);
        rd.forward(request, response);
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        doPost(request, response);
    }
}
