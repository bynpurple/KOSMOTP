package com.spring.funding.service;

import java.math.BigInteger;
import java.util.Arrays;
import java.util.Collections;
import java.util.List;
import java.util.concurrent.Callable;
import org.web3j.abi.TypeReference;
import org.web3j.abi.datatypes.Address;
import org.web3j.abi.datatypes.Function;
import org.web3j.abi.datatypes.StaticArray;
import org.web3j.abi.datatypes.Type;
import org.web3j.abi.datatypes.generated.Bytes32;
import org.web3j.abi.datatypes.generated.Uint256;
import org.web3j.crypto.Credentials;
import org.web3j.protocol.Web3j;
import org.web3j.protocol.core.RemoteCall;
import org.web3j.protocol.core.methods.response.TransactionReceipt;
import org.web3j.tuples.generated.Tuple3;
import org.web3j.tx.Contract;
import org.web3j.tx.TransactionManager;
import org.web3j.tx.gas.ContractGasProvider;

/**
 * <p>Auto generated code.
 * <p><strong>Do not modify!</strong>
 * <p>Please use the <a href="https://docs.web3j.io/command_line.html">web3j command line tools</a>,
 * or the org.web3j.codegen.SolidityFunctionWrapperGenerator in the 
 * <a href="https://github.com/web3j/web3j/tree/master/codegen">codegen module</a> to update.
 *
 * <p>Generated with web3j version 3.6.0.
 */
public class Investment3 extends Contract {
    private static final String BINARY = "608060405234801561001057600080fd5b5060018054600160a060020a03191633179055610376806100326000396000f3006080604052600436106100775763ffffffff7c01000000000000000000000000000000000000000000000000000000006000350416632b7f9277811461007c5780633feb5f2b1461009257806341c96964146100bc5780635b3165ef146100f25780638da5cb5b1461010a578063d0a2f2c414610148575b600080fd5b610090600435602435604435606435610196565b005b34801561009e57600080fd5b506100aa600435610233565b60408051918252519081900360200190f35b3480156100c857600080fd5b506100d4600435610247565b60408051938452602084019290925282820152519081900360600190f35b3480156100fe57600080fd5b506100d4600435610291565b34801561011657600080fd5b5061011f6102b2565b6040805173ffffffffffffffffffffffffffffffffffffffff9092168252519081900360200190f35b34801561015457600080fd5b5061015d6102ce565b60405180826112c080838360005b8381101561018357818101518382015260200161016b565b5050505090500191505060405180910390f35b83600281609681106101a457fe5b015560408051606081018252848152602080820185815282840185815260008981529283905284832093518455905160018085019190915590516002909301929092559054915173ffffffffffffffffffffffffffffffffffffffff909216913480156108fc0292909190818181858888f1935050505015801561022c573d6000803e3d6000fd5b5050505050565b6002816096811061024057fe5b0154905081565b600080600061025461030a565b5050506000918252506020818152604091829020825160608101845281548082526001830154938201849052600290920154930183905292909190565b60006020819052908152604090208054600182015460029092015490919083565b60015473ffffffffffffffffffffffffffffffffffffffff1681565b6102d661032a565b604080516112c08101918290529060029060969082845b8154815260200190600101908083116102ed575050505050905090565b604080516060810182526000808252602082018190529181019190915290565b6112c06040519081016040528060969060208202803883395091929150505600a165627a7a72305820703e2e3814aaf816011633071134407cd7cbe0c04b2677beb326bc732bb304bd0029";

    public static final String FUNC_BUYINVEST = "buyInvest";

    public static final String FUNC_INVESTORS = "investors";

    public static final String FUNC_GETINVESTORINFO = "getInvestorInfo";

    public static final String FUNC_INVESTORSINFO = "InvestorsInfo";

    public static final String FUNC_OWNER = "owner";

    public static final String FUNC_GETALLINVESTORS = "getAllInvestors";

    @Deprecated
    protected Investment3(String contractAddress, Web3j web3j, Credentials credentials, BigInteger gasPrice, BigInteger gasLimit) {
        super(BINARY, contractAddress, web3j, credentials, gasPrice, gasLimit);
    }

    protected Investment3(String contractAddress, Web3j web3j, Credentials credentials, ContractGasProvider contractGasProvider) {
        super(BINARY, contractAddress, web3j, credentials, contractGasProvider);
    }

    @Deprecated
    protected Investment3(String contractAddress, Web3j web3j, TransactionManager transactionManager, BigInteger gasPrice, BigInteger gasLimit) {
        super(BINARY, contractAddress, web3j, transactionManager, gasPrice, gasLimit);
    }

    protected Investment3(String contractAddress, Web3j web3j, TransactionManager transactionManager, ContractGasProvider contractGasProvider) {
        super(BINARY, contractAddress, web3j, transactionManager, contractGasProvider);
    }

    public RemoteCall<TransactionReceipt> buyInvest(BigInteger _index, byte[] _investorname, BigInteger _investnumber, BigInteger _investvolume, BigInteger weiValue) {
        final Function function = new Function(
                FUNC_BUYINVEST, 
                Arrays.<Type>asList(new org.web3j.abi.datatypes.generated.Uint256(_index), 
                new org.web3j.abi.datatypes.generated.Bytes32(_investorname), 
                new org.web3j.abi.datatypes.generated.Uint256(_investnumber), 
                new org.web3j.abi.datatypes.generated.Uint256(_investvolume)), 
                Collections.<TypeReference<?>>emptyList());
        return executeRemoteCallTransaction(function, weiValue);
    }

    public RemoteCall<BigInteger> investors(BigInteger param0) {
        final Function function = new Function(FUNC_INVESTORS, 
                Arrays.<Type>asList(new org.web3j.abi.datatypes.generated.Uint256(param0)), 
                Arrays.<TypeReference<?>>asList(new TypeReference<Uint256>() {}));
        return executeRemoteCallSingleValueReturn(function, BigInteger.class);
    }

    public RemoteCall<Tuple3<byte[], BigInteger, BigInteger>> getInvestorInfo(BigInteger _index) {
        final Function function = new Function(FUNC_GETINVESTORINFO, 
                Arrays.<Type>asList(new org.web3j.abi.datatypes.generated.Uint256(_index)), 
                Arrays.<TypeReference<?>>asList(new TypeReference<Bytes32>() {}, new TypeReference<Uint256>() {}, new TypeReference<Uint256>() {}));
        return new RemoteCall<Tuple3<byte[], BigInteger, BigInteger>>(
                new Callable<Tuple3<byte[], BigInteger, BigInteger>>() {
                    @Override
                    public Tuple3<byte[], BigInteger, BigInteger> call() throws Exception {
                        List<Type> results = executeCallMultipleValueReturn(function);
                        return new Tuple3<byte[], BigInteger, BigInteger>(
                                (byte[]) results.get(0).getValue(), 
                                (BigInteger) results.get(1).getValue(), 
                                (BigInteger) results.get(2).getValue());
                    }
                });
    }

    public RemoteCall<Tuple3<byte[], BigInteger, BigInteger>> InvestorsInfo(BigInteger param0) {
        final Function function = new Function(FUNC_INVESTORSINFO, 
                Arrays.<Type>asList(new org.web3j.abi.datatypes.generated.Uint256(param0)), 
                Arrays.<TypeReference<?>>asList(new TypeReference<Bytes32>() {}, new TypeReference<Uint256>() {}, new TypeReference<Uint256>() {}));
        return new RemoteCall<Tuple3<byte[], BigInteger, BigInteger>>(
                new Callable<Tuple3<byte[], BigInteger, BigInteger>>() {
                    @Override
                    public Tuple3<byte[], BigInteger, BigInteger> call() throws Exception {
                        List<Type> results = executeCallMultipleValueReturn(function);
                        return new Tuple3<byte[], BigInteger, BigInteger>(
                                (byte[]) results.get(0).getValue(), 
                                (BigInteger) results.get(1).getValue(), 
                                (BigInteger) results.get(2).getValue());
                    }
                });
    }

    public RemoteCall<String> owner() {
        final Function function = new Function(FUNC_OWNER, 
                Arrays.<Type>asList(), 
                Arrays.<TypeReference<?>>asList(new TypeReference<Address>() {}));
        return executeRemoteCallSingleValueReturn(function, String.class);
    }

    public RemoteCall<List> getAllInvestors() {
        final Function function = new Function(FUNC_GETALLINVESTORS, 
                Arrays.<Type>asList(), 
                Arrays.<TypeReference<?>>asList(new TypeReference<StaticArray<Uint256>>() {}));
        return new RemoteCall<List>(
                new Callable<List>() {
                    @Override
                    @SuppressWarnings("unchecked")
                    public List call() throws Exception {
                        List<Type> result = (List<Type>) executeCallSingleValueReturn(function, List.class);
                        return convertToNative(result);
                    }
                });
    }

    public static RemoteCall<Investment> deploy(Web3j web3j, Credentials credentials, ContractGasProvider contractGasProvider) {
        return deployRemoteCall(Investment.class, web3j, credentials, contractGasProvider, BINARY, "");
    }

    public static RemoteCall<Investment> deploy(Web3j web3j, TransactionManager transactionManager, ContractGasProvider contractGasProvider) {
        return deployRemoteCall(Investment.class, web3j, transactionManager, contractGasProvider, BINARY, "");
    }
    //
    @Deprecated
    public static RemoteCall<Investment3> deploy(Web3j web3j, Credentials credentials, BigInteger gasPrice, BigInteger gasLimit) {
        return deployRemoteCall(Investment3.class, web3j, credentials, gasPrice, gasLimit, BINARY, "");
    }
    //
    @Deprecated
    public static RemoteCall<Investment> deploy(Web3j web3j, TransactionManager transactionManager, BigInteger gasPrice, BigInteger gasLimit) {
        return deployRemoteCall(Investment.class, web3j, transactionManager, gasPrice, gasLimit, BINARY, "");
    }

    @Deprecated
    public static Investment3 load(String contractAddress, Web3j web3j, Credentials credentials, BigInteger gasPrice, BigInteger gasLimit) {
        return new Investment3(contractAddress, web3j, credentials, gasPrice, gasLimit);
    }

    @Deprecated
    public static Investment load(String contractAddress, Web3j web3j, TransactionManager transactionManager, BigInteger gasPrice, BigInteger gasLimit) {
        return new Investment(contractAddress, web3j, transactionManager, gasPrice, gasLimit);
    }

    public static Investment load(String contractAddress, Web3j web3j, Credentials credentials, ContractGasProvider contractGasProvider) {
        return new Investment(contractAddress, web3j, credentials, contractGasProvider);
    }

    public static Investment load(String contractAddress, Web3j web3j, TransactionManager transactionManager, ContractGasProvider contractGasProvider) {
        return new Investment(contractAddress, web3j, transactionManager, contractGasProvider);
    }
}
