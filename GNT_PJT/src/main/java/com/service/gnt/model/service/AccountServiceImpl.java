package com.service.gnt.model.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.service.gnt.domain.account.Account;
import com.service.gnt.domain.account.MileageHistory;
import com.service.gnt.model.dao.AccountDAO;

@Service
public class AccountServiceImpl implements AccountService{
	
	@Autowired
	private AccountDAO accountDAO;

	public Account createAcc(int userId, int accPassword, String userEmail, String userEngName,
			String address, String userPhone) {
		return accountDAO.createAcc(userId, accPassword, userEmail, userEngName, address, userPhone);
	}

	public int getAccBalance(String accId) {
		return accountDAO.getAccBalance(accId);
	}

	public void depositAcc(int userId, int amount) {
		accountDAO.depositAcc(userId, amount);
	}

	public void sendAcc(int userId, int amount, String accId) {
		accountDAO.sendAcc(userId, amount, accId);
	}

	public void createMile(int userId) {
		accountDAO.createMile(userId);
	}

	public int getMileBalance(int mileagePk) {
		return accountDAO.getMileBalance(mileagePk);
	}

	public List<MileageHistory> getMileHistory(int userId) {
		return accountDAO.getMileHistory(userId);
	}

	public void addMile(int amount, int userId) {
		accountDAO.addMile(amount, userId);
	}

	public int getMilePk(int userId) {
		return accountDAO.getMilePk(userId);
	}

	public void createAccTest(int accPassword) {
		accountDAO.createAccTest(accPassword);
	}

	public Account getAccount(String accId) {
		return accountDAO.getAccount(accId);
	}

}
