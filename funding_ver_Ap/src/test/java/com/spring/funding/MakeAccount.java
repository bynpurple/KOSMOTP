/*package com.spring.funding;

import java.math.BigInteger;
import java.util.UUID;

import org.web3j.crypto.ECKeyPair;
import org.web3j.crypto.Keys;
import org.web3j.crypto.Wallet;
import org.web3j.crypto.WalletFile;

public class MakeAccount {
	public static void main(String[] args) {
		String seed = UUID.randomUUID().toString();

		try {
			ECKeyPair ecKeyPair = Keys.createEcKeyPair();
			BigInteger privateKeyInDec = ecKeyPair.getPrivateKey();

			String privKey = privateKeyInDec.toString(16);

			WalletFile aWallet = Wallet.createLight(seed, ecKeyPair);
			String address = "0x" + aWallet.getAddress();
			
			System.out.println("address: " + address);
			System.out.println("private key: " + privKey);
		} catch (Exception e) {
			e.printStackTrace();
		} 
	}
}
*/