package com.spring.funding.service;

import java.math.BigDecimal;
import java.math.BigInteger;
import java.util.ArrayList;
import java.util.List;
import java.util.Map;

import org.web3j.crypto.Credentials;
import org.web3j.protocol.Web3j;
import org.web3j.protocol.http.HttpService;
import org.web3j.tuples.generated.Tuple4;
import org.web3j.utils.Numeric;

public class FundContractMain {
	//보내고자 하는 address의 private_key
	private static String PRIVATE_KEY = "fae0d89c9581787937e48ebd3ff0a4ca04bf0c13d56cba567828cc0f0653f1fe";
	
	private final static BigInteger GAS_LIMIT = BigInteger.valueOf(6721975L);
	private final static BigInteger GAS_PRICE = BigInteger.valueOf(20000000000L);
	private final static BigDecimal value = BigDecimal.ONE;
	//받는 곳의 address의 address
	//private static String RECIPIENT = "0x37f92304c5500528b66cba9a745a65ba6b59648b";
	
	public static void main(String[] args) {
		web3j = Web3j.build(new HttpService("HTTPS://ropsten.infura.io/v3/dbf0b2dbcbcf48d1a333d6b5626dc6c0"));
		credentials = getCredentialsFromPrivateKey();
		FundContractMain fundContractMain = new FundContractMain();
		FundContract fundContract = fundContractMain.loadContract("0x14c8b8c20c974f129f27d42235e5e9471c0ac375", web3j, credentials);
		//String address = fundContractMain.buyInvest(0, "testkg", Integer.parseInt("1335530"), Integer.parseInt("5"), fundContract);
		//System.out.println(address);
		
		fundContract.getAllInvestors();
	}
	
	private String contract_address = "";
	
	public static Web3j web3j = null;
	
	public static Credentials credentials = null;

	public String getCONTRACT_ADDRESS() {
		return contract_address;
	}

	public void setCONTRACT_ADDRESS(String contract_address) {
		this.contract_address = contract_address;
	}
	
	public FundContractMain(String contract_address) {
		this.contract_address = contract_address;
		web3j = Web3j.build(new HttpService("HTTPS://ropsten.infura.io/v3/dbf0b2dbcbcf48d1a333d6b5626dc6c0"));
		credentials = getCredentialsFromPrivateKey();
		
	}
	
	public FundContractMain() {
		web3j = Web3j.build(new HttpService("HTTPS://ropsten.infura.io/v3/dbf0b2dbcbcf48d1a333d6b5626dc6c0"));
		credentials = getCredentialsFromPrivateKey();
	}

	//보내고자 하는 주소의 크리덴셜 생성
    public static Credentials getCredentialsFromPrivateKey() {
    	return Credentials.create(PRIVATE_KEY);
    }
    
    //컨트랙트 생성 - 컨트랙트 주소 리턴
    public String deployContract(){
    	try {
			return FundContract.deploy(web3j, credentials, GAS_PRICE, GAS_LIMIT).send().getContractAddress();
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
			return null;
		}
    }
    
    //컨트랙트 로드
    public FundContract loadContract(String contractAddress, Web3j web3j, Credentials credentials) {
    	return FundContract.load(contractAddress, web3j, credentials, GAS_PRICE, GAS_LIMIT);
    }
    
    //구입
    public String buyInvest(int index, String investorname, int investnumber, int investvolume, FundContract fundContract){
    	byte[] username = stringToBytes32(investorname);
    	try {
			return fundContract.buyInvest(BigInteger.valueOf(index), username, BigInteger.valueOf(investnumber), BigInteger.valueOf(investvolume), BigInteger.valueOf(1)).send().getTransactionHash();
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
			return null;
		}
    }
    
    //구매자 목록 가져오기
    public List<String> getAllInvestors(FundContract fundContract){
    	List<String> investorList = new ArrayList<>();
    	List investors;
		try {
			investors = fundContract.getAllInvestors().send();
			System.out.println(investors.size());
	    	for(Object investor : investors) {
	    		investorList.add(investor.toString());
	    	}
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
    	return investorList;
    }
    
    //StringToBytes32
    public static byte[] stringToBytes32(String string) {
        byte[] byteValue = string.getBytes();
        byte[] byteValueLen32 = new byte[32];
        System.arraycopy(byteValue, 0, byteValueLen32, 0, byteValue.length);
        return byteValueLen32;
    }
    
	//각 배열의 구입 주소 가져오기
    public Map<String, Object> printGetBuyerInfo(int number, FundContract fundContract) {
    	//각 배열의 구입 주소 가져오기
    	Tuple4<byte[], BigInteger, BigInteger, BigInteger> investorInfo;
		try {
			investorInfo = fundContract.getInvestorInfo(BigInteger.valueOf(number)).send();
			System.out.println(Numeric.toHexStringNoPrefix(investorInfo.getValue1()));
			System.out.println(investorInfo.getValue2().intValue());
			System.out.println(investorInfo.getValue3().intValue());
			System.out.println(investorInfo.getValue4().intValue());
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return null;
    }
}
