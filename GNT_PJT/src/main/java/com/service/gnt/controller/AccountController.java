package com.service.gnt.controller;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;

import com.service.gnt.domain.account.Account;
import com.service.gnt.domain.account.MileageHistory;
import com.service.gnt.model.service.AccountService;

import io.swagger.annotations.ApiOperation;

@RestController
public class AccountController {
	
	@Autowired
	private AccountService accountService;
	
	@ApiOperation(value="createAcc", notes="계좌 생성")
	@PostMapping("/createAcc.do")
	public Map<String,Object> createAcc(@RequestParam int userId,@RequestParam int accPassword,@RequestParam String userNameEng,
			@RequestParam String address, @RequestParam String phone, Model model) {
		try {
			Map<String,Object> maps = new HashMap<>();
			String status = "no";
			Account account = accountService.createAcc(userId, accPassword, userNameEng, address, phone);
			if(account!=null) {
				status = "yes";
				maps.put("account", account);
			}			
			maps.put("message", status);
			return maps;
		} catch(Exception e) {
			model.addAttribute("title", "Error - Occured");
			model.addAttribute("message", "Error Occured :"+e.getMessage());
			System.out.println("Error :"+e.getMessage()+e.toString());
			return null;
		}
	}
	
	@ApiOperation(value="createAccTest", notes="계좌 생성")
	@PostMapping("/createAccTest.do")
	public Map<String,Object> createAcc(@RequestParam int accPassword, Model model) {
		try {
			Map<String,Object> maps = new HashMap<>();
			String status = "no";
			System.out.println("createAcc Contr");
			Account account = accountService.createAccTest(accPassword);
			if(account!=null) {
				status = "yes";
				maps.put("account", account);
			}			
			maps.put("message", status);
			return maps;
		} catch(Exception e) {
			model.addAttribute("title", "Error - Occured");
			model.addAttribute("message", "Error Occured :"+e.getMessage());
			System.out.println("Error :"+e.getMessage()+e.toString());
			return null;
		}
	}

	@ApiOperation(value="checkUserAcc", notes="계좌 존재유무 확인")
	@PostMapping("/checkUserAcc.do")
	public Map<String,Object> checkUserAcc(int userId) {
		Map<String,Object> maps = new HashMap<>();
		try {
			maps.put("message", accountService.checkUserAcc(userId));
			return maps;
		} catch(Exception e) {
			System.out.println("Error :"+e.getMessage()+e.toString());
			maps.put("message","no");
			return maps;
		}
	}
	
	@ApiOperation(value="getAccount", notes="계좌 정보 확인") //비정상 작동 WIP
	@PostMapping("/getAccount.do")
	public Map<String,Object> getAccount(int userId) {
		Map<String,Object> maps = new HashMap<>();
		String status = "no";
		try {
			Account data = accountService.getAccountByUserId(userId);
			if(data!=null) {
				status = "yes";
				maps.put("account", data);
			}			
			maps.put("message", status);
			return maps;
		} catch(Exception e) {
			maps.put("message", status);
			System.out.println(userId);
			System.out.println("Error :"+e.getMessage()+e.toString());
			return maps;
		}
	}
	
	@ApiOperation(value="depositAcc", notes="계좌 입금")
	@PostMapping("/depositAcc.do")
	public Map<String,Object> depositAcc(int userId, int amount) {
			Map<String,Object> maps = new HashMap<>();
			String status = "no";
		try {
			if(accountService.depositAcc(userId, amount)>0){
				status = "yes";
			}
			maps.put("message", status);
			return maps;
		} catch(Exception e) {
			System.out.println("Error :"+e.getMessage()+e.toString());
			maps.put("message", status);
			return maps;
		}
	}
	
	@ApiOperation(value="sendAcc", notes="송금")
	@PostMapping("/sendAcc.do")
	public Map<String,Object> sendAcc(int userId, int amount, String accId) {
		Map<String,Object> maps = new HashMap<>();
		String status = "no";
		try {
			status = accountService.sendAcc(userId, amount, accId);
			maps.put("message", status);
			maps.put("amount",amount);
			return maps;
		} catch(Exception e) {
			System.out.println("Error :"+e.getMessage()+e.toString());
			maps.put("message", status);
			return maps;
		}
	}
	
	@ApiOperation(value="createMile", notes="마일리지 생성")
	@PostMapping("/createMile.do")
	public Map<String,Object> createMile(int userId) {
		Map<String,Object> maps = new HashMap<>();
		String status = "no";
		try {
			if(accountService.createMile(userId)>0) {
				status="yes";
				maps.put("mileageHisstory", accountService.addMile(0, userId));
			}
			maps.put("message", status);
			return maps;
		} catch(Exception e) {
			System.out.println("Error :"+e.getMessage()+e.toString());
			maps.put("message", status);
			return maps;
		}
	}
	
	@ApiOperation(value="getMileBalance", notes="마일리지 잔액 확인")
	@PostMapping("/getMileBalance.do")
	public Map<String,Object> getMileBalance(int userId) {
		Map<String,Object> maps = new HashMap<>();
		String status = "no";
		try {
			Object data = accountService.getMileBalance(userId);
			if(data!=null){
				status = "yes";
				maps.put("mileage", data);
			}
			maps.put("message", status);
			return maps;
		} catch(Exception e) {
			System.out.println("Error :"+e.getMessage()+e.toString());
			maps.put("message", status);
			return maps;
		}
	}
	
	@ApiOperation(value="getMileHistory", notes="마일리지 내역 확인")
	@PostMapping("/getMileHistory.do")
	public Map<String,Object> getMileHistory(int userId) {
		Map<String,Object> maps = new HashMap<>();
		String status = "no";
		try {
			List<MileageHistory> data = accountService.getMileHistory(userId);
			if(accountService.getMileHistoryAMT(userId)>0) {
				status = "yes";
				maps.put("mileageHistory", data);
				maps.put("mileageBalance",accountService.getMileBalance(userId));
			}
			maps.put("message", status);
			return maps;
		} catch(Exception e) {
			System.out.println("Error :"+e.getMessage()+e.toString());
			maps.put("message", status);
			return maps;
		}
	}
	
	@ApiOperation(value="addMile", notes="마일리지 충전")
	@PostMapping("/addMile.do")
	public Map<String,Object> addMile(int amount, int userId) {
		Map<String,Object> maps = new HashMap<>();
		String status = "no";
		try {
			Object data = accountService.addMile(amount, userId);
			if(data!=null){
				status = "yes";
				maps.put("mileage", data);
				maps.put("mileageBalance",accountService.getMileBalance(userId));
			}
			maps.put("message", status);
			return maps;
		} catch(Exception e) {
			System.out.println("Error :"+e.getMessage()+e.toString());
			maps.put("message", status);
			return maps;
		}
	}
}
