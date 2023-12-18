package com.weblabs.service;

public interface AddExpenses {

	public String addExpenses(String ItemName, String PurchaseDate,String PurchasedBy,String Amount,String PaidBy,String Status,String Attachments,String Supplierid);
    public String editExpenses(String Id,String ItemName, String PurchaseDate,String PurchasedBy,String Amount,String PaidBy,String Status,String Attachments,String Supplierid);
    public  String deleteExpenses(String Id);
}
