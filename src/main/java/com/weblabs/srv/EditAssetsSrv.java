


package com.weblabs.srv;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;


import com.weblabs.beans.AssetsBean;
import com.weblabs.service.impl.AssetsServiceImpl;
			
@WebServlet("/EditAssetsSrv")
public class EditAssetsSrv extends HttpServlet {
    private static final long serialVersionUID = 1L;

   

    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {


   	 String status = "Add Assets Failed!";
   	 String id = request.getParameter("id");
        String assetName = request.getParameter("asset_name");
        String PurchaseDate= request.getParameter("purchase_date");
       String supplierID= request.getParameter("supplier_id");
        String Manufacturer= request.getParameter("manufacturer");
        String Model= request.getParameter("model");
        String Status= request.getParameter("status");
         String AssetCondition= request.getParameter("condition");
        String Warranty = request.getParameter("warranty");
      String Price = request.getParameter("value");
        String AssetUser = request.getParameter("asset_user");
        String Description= request.getParameter("description");
    
   	 
     AssetsBean obj = new AssetsBean();
     obj.setId(id);
     obj.setAssetName(assetName);
     obj.setPurchaseDate(PurchaseDate);
     obj.setSupplierID(supplierID);
     obj.setManufacturer(Manufacturer);
     obj.setModel(Model);
     obj.setStatus(Status);
     
     obj.setAssetCondition(AssetCondition);
     obj.setWarranty(Warranty);
     obj.setPrice(Price);
     obj.setAssetUser(AssetUser);
     obj.setDescription(Description);
     
     AssetsServiceImpl ass =new AssetsServiceImpl();
     status=ass.updateAssets( id,assetName, PurchaseDate, supplierID, Manufacturer, Model,Status ,  AssetCondition, Warranty, Price, AssetUser, Description );
     
   
     
        RequestDispatcher rd = request.getRequestDispatcher("Assets.jsp?message=" + status);
        rd.forward(request, response);
    }

    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        doGet(request, response);
    }
}