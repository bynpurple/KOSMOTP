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
import org.web3j.tuples.generated.Tuple4;
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
public class FundContract extends Contract {
    private static final String BINARY = "608060405234801561001057600080fd5b5060018054600160a060020a031916331790556105c3806100326000396000f3006080604052600436106100775763ffffffff7c01000000000000000000000000000000000000000000000000000000006000350416632b7f9277811461007c5780633feb5f2b1461009257806341c96964146100bc5780635b3165ef146100fa5780638da5cb5b14610112578063d0a2f2c414610150575b600080fd5b61009060043560243560443560643561019e565b005b34801561009e57600080fd5b506100aa60043561045d565b60408051918252519081900360200190f35b3480156100c857600080fd5b506100d4600435610471565b604080519485526020850193909352838301919091526060830152519081900360800190f35b34801561010657600080fd5b506100d46004356104cb565b34801561011e57600080fd5b506101276104f2565b6040805173ffffffffffffffffffffffffffffffffffffffff9092168252519081900360200190f35b34801561015c57600080fd5b5061016561050e565b604051808261190080838360005b8381101561018b578181015183820152602001610173565b5050505090500191505060405180910390f35b600084101580156101b0575060c78411155b151561022c576040805160e560020a62461bcd02815260206004820152602660248201527f696e646578ec9d9820ebb294ec9c84ec979020ebb297ec96b4eb82acec8ab5eb60448201527f8b88eb8ba42e0000000000000000000000000000000000000000000000000000606482015290519081900360840190fd5b600082116102aa576040805160e560020a62461bcd02815260206004820152602f60248201527fed8e80eb939cebb288ed98b8eab080203020ec9db4ed9598ec9dbcec8898eb8a60448201527f9420ec9786ec8ab5eb8b88eb8ba42e0000000000000000000000000000000000606482015290519081900360840190fd5b60008111610328576040805160e560020a62461bcd02815260206004820152603260248201527feab384ec95bdeab5aceca28cec8898eab080203020ec9db4ed9598ec9dbcec8860448201527f98eb8a9420ec9786ec8ab5eb8b88eb8ba42e0000000000000000000000000000606482015290519081900360840190fd5b60028460c8811061033557fe5b0154156103b2576040805160e560020a62461bcd02815260206004820152602760248201527fec9db4ebafb820eca1b4ec9eaced9598eb8a9420ec9db8eb8db1ec8aa4ec9e8560448201527feb8b88eb8ba42e00000000000000000000000000000000000000000000000000606482015290519081900360840190fd5b8260028560c881106103c057fe5b01556040805160808101825284815260208082018581528284018581526060840189815260008a8152938490528584209451855591516001808601919091559051600285015590516003909301929092559054915173ffffffffffffffffffffffffffffffffffffffff909216913480156108fc0292909190818181858888f19350505050158015610456573d6000803e3d6000fd5b5050505050565b60028160c8811061046a57fe5b0154905081565b60008060008061047f61054b565b5050506000928352505060208181526040918290208251608081018452815480825260018301549382018490526002830154948201859052600390920154606090910152929091908190565b60006020819052908152604090208054600182015460028301546003909301549192909184565b60015473ffffffffffffffffffffffffffffffffffffffff1681565b610516610577565b604080516119008101918290529060029060c89082845b8154815260019091019060200180831161052d575050505050905090565b608060405190810160405280600080191681526020016000815260200160008152602001600081525090565b6119006040519081016040528060c89060208202803883395091929150505600a165627a7a72305820164d345e529279dea708fb98dafc5c48b3c4fbbd93b8a3598b252ec6a1ea43540029";

    public static final String FUNC_BUYINVEST = "buyInvest";

    public static final String FUNC_INVESTORS = "investors";

    public static final String FUNC_GETINVESTORINFO = "getInvestorInfo";

    public static final String FUNC_INVESTORSINFO = "InvestorsInfo";

    public static final String FUNC_OWNER = "owner";

    public static final String FUNC_GETALLINVESTORS = "getAllInvestors";

    @Deprecated
    protected FundContract(String contractAddress, Web3j web3j, Credentials credentials, BigInteger gasPrice, BigInteger gasLimit) {
        super(BINARY, contractAddress, web3j, credentials, gasPrice, gasLimit);
    }

    protected FundContract(String contractAddress, Web3j web3j, Credentials credentials, ContractGasProvider contractGasProvider) {
        super(BINARY, contractAddress, web3j, credentials, contractGasProvider);
    }

    @Deprecated
    protected FundContract(String contractAddress, Web3j web3j, TransactionManager transactionManager, BigInteger gasPrice, BigInteger gasLimit) {
        super(BINARY, contractAddress, web3j, transactionManager, gasPrice, gasLimit);
    }

    protected FundContract(String contractAddress, Web3j web3j, TransactionManager transactionManager, ContractGasProvider contractGasProvider) {
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

    public RemoteCall<byte[]> investors(BigInteger param0) {
        final Function function = new Function(FUNC_INVESTORS, 
                Arrays.<Type>asList(new org.web3j.abi.datatypes.generated.Uint256(param0)), 
                Arrays.<TypeReference<?>>asList(new TypeReference<Bytes32>() {}));
        return executeRemoteCallSingleValueReturn(function, byte[].class);
    }

    public RemoteCall<Tuple4<byte[], BigInteger, BigInteger, BigInteger>> getInvestorInfo(BigInteger _index) {
        final Function function = new Function(FUNC_GETINVESTORINFO, 
                Arrays.<Type>asList(new org.web3j.abi.datatypes.generated.Uint256(_index)), 
                Arrays.<TypeReference<?>>asList(new TypeReference<Bytes32>() {}, new TypeReference<Uint256>() {}, new TypeReference<Uint256>() {}, new TypeReference<Uint256>() {}));
        return new RemoteCall<Tuple4<byte[], BigInteger, BigInteger, BigInteger>>(
                new Callable<Tuple4<byte[], BigInteger, BigInteger, BigInteger>>() {
                    @Override
                    public Tuple4<byte[], BigInteger, BigInteger, BigInteger> call() throws Exception {
                        List<Type> results = executeCallMultipleValueReturn(function);
                        return new Tuple4<byte[], BigInteger, BigInteger, BigInteger>(
                                (byte[]) results.get(0).getValue(), 
                                (BigInteger) results.get(1).getValue(), 
                                (BigInteger) results.get(2).getValue(), 
                                (BigInteger) results.get(3).getValue());
                    }
                });
    }

    public RemoteCall<Tuple4<byte[], BigInteger, BigInteger, BigInteger>> InvestorsInfo(BigInteger param0) {
        final Function function = new Function(FUNC_INVESTORSINFO, 
                Arrays.<Type>asList(new org.web3j.abi.datatypes.generated.Uint256(param0)), 
                Arrays.<TypeReference<?>>asList(new TypeReference<Bytes32>() {}, new TypeReference<Uint256>() {}, new TypeReference<Uint256>() {}, new TypeReference<Uint256>() {}));
        return new RemoteCall<Tuple4<byte[], BigInteger, BigInteger, BigInteger>>(
                new Callable<Tuple4<byte[], BigInteger, BigInteger, BigInteger>>() {
                    @Override
                    public Tuple4<byte[], BigInteger, BigInteger, BigInteger> call() throws Exception {
                        List<Type> results = executeCallMultipleValueReturn(function);
                        return new Tuple4<byte[], BigInteger, BigInteger, BigInteger>(
                                (byte[]) results.get(0).getValue(), 
                                (BigInteger) results.get(1).getValue(), 
                                (BigInteger) results.get(2).getValue(), 
                                (BigInteger) results.get(3).getValue());
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
                Arrays.<TypeReference<?>>asList(new TypeReference<StaticArray<Bytes32>>() {}));
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

    public static RemoteCall<FundContract> deploy(Web3j web3j, Credentials credentials, ContractGasProvider contractGasProvider) {
        return deployRemoteCall(FundContract.class, web3j, credentials, contractGasProvider, BINARY, "");
    }

    public static RemoteCall<FundContract> deploy(Web3j web3j, TransactionManager transactionManager, ContractGasProvider contractGasProvider) {
        return deployRemoteCall(FundContract.class, web3j, transactionManager, contractGasProvider, BINARY, "");
    }

    @Deprecated
    public static RemoteCall<FundContract> deploy(Web3j web3j, Credentials credentials, BigInteger gasPrice, BigInteger gasLimit) {
        return deployRemoteCall(FundContract.class, web3j, credentials, gasPrice, gasLimit, BINARY, "");
    }

    @Deprecated
    public static RemoteCall<FundContract> deploy(Web3j web3j, TransactionManager transactionManager, BigInteger gasPrice, BigInteger gasLimit) {
        return deployRemoteCall(FundContract.class, web3j, transactionManager, gasPrice, gasLimit, BINARY, "");
    }

    @Deprecated
    public static FundContract load(String contractAddress, Web3j web3j, Credentials credentials, BigInteger gasPrice, BigInteger gasLimit) {
        return new FundContract(contractAddress, web3j, credentials, gasPrice, gasLimit);
    }

    @Deprecated
    public static FundContract load(String contractAddress, Web3j web3j, TransactionManager transactionManager, BigInteger gasPrice, BigInteger gasLimit) {
        return new FundContract(contractAddress, web3j, transactionManager, gasPrice, gasLimit);
    }

    public static FundContract load(String contractAddress, Web3j web3j, Credentials credentials, ContractGasProvider contractGasProvider) {
        return new FundContract(contractAddress, web3j, credentials, contractGasProvider);
    }

    public static FundContract load(String contractAddress, Web3j web3j, TransactionManager transactionManager, ContractGasProvider contractGasProvider) {
        return new FundContract(contractAddress, web3j, transactionManager, contractGasProvider);
    }
}
