package com.spring.funding.service;

import java.math.BigInteger;
import java.util.ArrayList;
import java.util.Arrays;
import java.util.Collections;
import java.util.List;
import java.util.concurrent.Callable;
import org.web3j.abi.EventEncoder;
import org.web3j.abi.TypeReference;
import org.web3j.abi.datatypes.Address;
import org.web3j.abi.datatypes.Event;
import org.web3j.abi.datatypes.Function;
import org.web3j.abi.datatypes.Type;
import org.web3j.abi.datatypes.generated.Bytes32;
import org.web3j.abi.datatypes.generated.StaticArray10;
import org.web3j.abi.datatypes.generated.Uint256;
import org.web3j.crypto.Credentials;
import org.web3j.protocol.Web3j;
import org.web3j.protocol.core.DefaultBlockParameter;
import org.web3j.protocol.core.RemoteCall;
import org.web3j.protocol.core.methods.request.EthFilter;
import org.web3j.protocol.core.methods.response.Log;
import org.web3j.protocol.core.methods.response.TransactionReceipt;
import org.web3j.tuples.generated.Tuple3;
import org.web3j.tx.Contract;
import org.web3j.tx.TransactionManager;
import org.web3j.tx.gas.ContractGasProvider;
import rx.Observable;
import rx.functions.Func1;

/**
 * <p>Auto generated code.
 * <p><strong>Do not modify!</strong>
 * <p>Please use the <a href="https://docs.web3j.io/command_line.html">web3j command line tools</a>,
 * or the org.web3j.codegen.SolidityFunctionWrapperGenerator in the 
 * <a href="https://github.com/web3j/web3j/tree/master/codegen">codegen module</a> to update.
 *
 * <p>Generated with web3j version 3.6.0.
 */
public class RealEstate extends Contract {
    private static final String BINARY = "608060405234801561001057600080fd5b5060018054600160a060020a031916331790556103eb806100326000396000f3006080604052600436106100775763ffffffff7c010000000000000000000000000000000000000000000000000000000060003504166332d0c15f811461007c5780635aee87031461008f57806386cba22b146100cf5780638da5cb5b1461011d578063e377e9661461014e578063f2aa821814610166575b600080fd5b61008d60043560243560443561017e565b005b34801561009b57600080fd5b506100a760043561028f565b60408051600160a060020a039094168452602084019290925282820152519081900360600190f35b3480156100db57600080fd5b506100e46102e2565b604051808261014080838360005b8381101561010a5781810151838201526020016100f2565b5050505090500191505060405180910390f35b34801561012957600080fd5b50610132610328565b60408051600160a060020a039092168252519081900360200190f35b34801561015a57600080fd5b506100a7600435610337565b34801561017257600080fd5b50610132600435610362565b60008310158015610190575060098311155b151561019b57600080fd5b33600284600a81106101a957fe5b018054600160a060020a0392831673ffffffffffffffffffffffffffffffffffffffff199182161790915560408051606081018252338152602080820187815282840187815260008a815292839052848320935184549088169616959095178355516001838101919091559351600290920191909155915490519216913480156108fc0292909190818181858888f1935050505015801561024e573d6000803e3d6000fd5b50604080513381526020810185905281517f0868a2b77ef5243ab424f87952a349bc823a92fd01d9b45d2fec78b8eafb586b929181900390910190a1505050565b600080600061029c61037f565b505050600091825250602081815260409182902082516060810184528154600160a060020a03168082526001830154938201849052600290920154930183905292909190565b6102ea61039f565b6040805161014081019182905290600290600a9082845b8154600160a060020a03168152600190910190602001808311610301575050505050905090565b600154600160a060020a031681565b600060208190529081526040902080546001820154600290920154600160a060020a03909116919083565b600281600a811061036f57fe5b0154600160a060020a0316905081565b604080516060810182526000808252602082018190529181019190915290565b61014060405190810160405280600a9060208202803883395091929150505600a165627a7a7230582087ac90a37dd0df400b337cf84e01e0359f66fdc53283c4a1f4cb46a704fc56b00029";

    public static final String FUNC_BUYREALESTATE = "buyRealEstate";

    public static final String FUNC_GETBUYERINFO = "getBuyerInfo";

    public static final String FUNC_GETALLBUYERS = "getAllBuyers";

    public static final String FUNC_OWNER = "owner";

    public static final String FUNC_BUYERINFO = "buyerInfo";

    public static final String FUNC_BUYERS = "buyers";

    public static final Event LOGBUYREALESTATE_EVENT = new Event("LogBuyRealEstate", 
            Arrays.<TypeReference<?>>asList(new TypeReference<Address>() {}, new TypeReference<Uint256>() {}));
    ;

    @Deprecated
    protected RealEstate(String contractAddress, Web3j web3j, Credentials credentials, BigInteger gasPrice, BigInteger gasLimit) {
        super(BINARY, contractAddress, web3j, credentials, gasPrice, gasLimit);
    }

    protected RealEstate(String contractAddress, Web3j web3j, Credentials credentials, ContractGasProvider contractGasProvider) {
        super(BINARY, contractAddress, web3j, credentials, contractGasProvider);
    }

    @Deprecated
    protected RealEstate(String contractAddress, Web3j web3j, TransactionManager transactionManager, BigInteger gasPrice, BigInteger gasLimit) {
        super(BINARY, contractAddress, web3j, transactionManager, gasPrice, gasLimit);
    }

    protected RealEstate(String contractAddress, Web3j web3j, TransactionManager transactionManager, ContractGasProvider contractGasProvider) {
        super(BINARY, contractAddress, web3j, transactionManager, contractGasProvider);
    }

    public RemoteCall<TransactionReceipt> buyRealEstate(BigInteger _id, byte[] _name, BigInteger _age, BigInteger weiValue) {
        final Function function = new Function(
                FUNC_BUYREALESTATE, 
                Arrays.<Type>asList(new org.web3j.abi.datatypes.generated.Uint256(_id), 
                new org.web3j.abi.datatypes.generated.Bytes32(_name), 
                new org.web3j.abi.datatypes.generated.Uint256(_age)), 
                Collections.<TypeReference<?>>emptyList());
        return executeRemoteCallTransaction(function, weiValue);
    }

    public RemoteCall<Tuple3<String, byte[], BigInteger>> getBuyerInfo(BigInteger _id) {
        final Function function = new Function(FUNC_GETBUYERINFO, 
                Arrays.<Type>asList(new org.web3j.abi.datatypes.generated.Uint256(_id)), 
                Arrays.<TypeReference<?>>asList(new TypeReference<Address>() {}, new TypeReference<Bytes32>() {}, new TypeReference<Uint256>() {}));
        return new RemoteCall<Tuple3<String, byte[], BigInteger>>(
                new Callable<Tuple3<String, byte[], BigInteger>>() {
                    @Override
                    public Tuple3<String, byte[], BigInteger> call() throws Exception {
                        List<Type> results = executeCallMultipleValueReturn(function);
                        return new Tuple3<String, byte[], BigInteger>(
                                (String) results.get(0).getValue(), 
                                (byte[]) results.get(1).getValue(), 
                                (BigInteger) results.get(2).getValue());
                    }
                });
    }

    public RemoteCall<List> getAllBuyers() {
        final Function function = new Function(FUNC_GETALLBUYERS, 
                Arrays.<Type>asList(), 
                Arrays.<TypeReference<?>>asList(new TypeReference<StaticArray10<Address>>() {}));
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

    public RemoteCall<String> owner() {
        final Function function = new Function(FUNC_OWNER, 
                Arrays.<Type>asList(), 
                Arrays.<TypeReference<?>>asList(new TypeReference<Address>() {}));
        return executeRemoteCallSingleValueReturn(function, String.class);
    }

    public RemoteCall<Tuple3<String, byte[], BigInteger>> buyerInfo(BigInteger param0) {
        final Function function = new Function(FUNC_BUYERINFO, 
                Arrays.<Type>asList(new org.web3j.abi.datatypes.generated.Uint256(param0)), 
                Arrays.<TypeReference<?>>asList(new TypeReference<Address>() {}, new TypeReference<Bytes32>() {}, new TypeReference<Uint256>() {}));
        return new RemoteCall<Tuple3<String, byte[], BigInteger>>(
                new Callable<Tuple3<String, byte[], BigInteger>>() {
                    @Override
                    public Tuple3<String, byte[], BigInteger> call() throws Exception {
                        List<Type> results = executeCallMultipleValueReturn(function);
                        return new Tuple3<String, byte[], BigInteger>(
                                (String) results.get(0).getValue(), 
                                (byte[]) results.get(1).getValue(), 
                                (BigInteger) results.get(2).getValue());
                    }
                });
    }

    public RemoteCall<String> buyers(BigInteger param0) {
        final Function function = new Function(FUNC_BUYERS, 
                Arrays.<Type>asList(new org.web3j.abi.datatypes.generated.Uint256(param0)), 
                Arrays.<TypeReference<?>>asList(new TypeReference<Address>() {}));
        return executeRemoteCallSingleValueReturn(function, String.class);
    }

    public static RemoteCall<RealEstate> deploy(Web3j web3j, Credentials credentials, ContractGasProvider contractGasProvider) {
        return deployRemoteCall(RealEstate.class, web3j, credentials, contractGasProvider, BINARY, "");
    }

    public static RemoteCall<RealEstate> deploy(Web3j web3j, TransactionManager transactionManager, ContractGasProvider contractGasProvider) {
        return deployRemoteCall(RealEstate.class, web3j, transactionManager, contractGasProvider, BINARY, "");
    }

    @Deprecated
    public static RemoteCall<RealEstate> deploy(Web3j web3j, Credentials credentials, BigInteger gasPrice, BigInteger gasLimit) {
        return deployRemoteCall(RealEstate.class, web3j, credentials, gasPrice, gasLimit, BINARY, "");
    }

    @Deprecated
    public static RemoteCall<RealEstate> deploy(Web3j web3j, TransactionManager transactionManager, BigInteger gasPrice, BigInteger gasLimit) {
        return deployRemoteCall(RealEstate.class, web3j, transactionManager, gasPrice, gasLimit, BINARY, "");
    }

    public List<LogBuyRealEstateEventResponse> getLogBuyRealEstateEvents(TransactionReceipt transactionReceipt) {
        List<Contract.EventValuesWithLog> valueList = extractEventParametersWithLog(LOGBUYREALESTATE_EVENT, transactionReceipt);
        ArrayList<LogBuyRealEstateEventResponse> responses = new ArrayList<LogBuyRealEstateEventResponse>(valueList.size());
        for (Contract.EventValuesWithLog eventValues : valueList) {
            LogBuyRealEstateEventResponse typedResponse = new LogBuyRealEstateEventResponse();
            typedResponse.log = eventValues.getLog();
            typedResponse._buyer = (String) eventValues.getNonIndexedValues().get(0).getValue();
            typedResponse._id = (BigInteger) eventValues.getNonIndexedValues().get(1).getValue();
            responses.add(typedResponse);
        }
        return responses;
    }

    public Observable<LogBuyRealEstateEventResponse> logBuyRealEstateEventObservable(EthFilter filter) {
        return web3j.ethLogObservable(filter).map(new Func1<Log, LogBuyRealEstateEventResponse>() {
            @Override
            public LogBuyRealEstateEventResponse call(Log log) {
                Contract.EventValuesWithLog eventValues = extractEventParametersWithLog(LOGBUYREALESTATE_EVENT, log);
                LogBuyRealEstateEventResponse typedResponse = new LogBuyRealEstateEventResponse();
                typedResponse.log = log;
                typedResponse._buyer = (String) eventValues.getNonIndexedValues().get(0).getValue();
                typedResponse._id = (BigInteger) eventValues.getNonIndexedValues().get(1).getValue();
                return typedResponse;
            }
        });
    }

    public Observable<LogBuyRealEstateEventResponse> logBuyRealEstateEventObservable(DefaultBlockParameter startBlock, DefaultBlockParameter endBlock) {
        EthFilter filter = new EthFilter(startBlock, endBlock, getContractAddress());
        filter.addSingleTopic(EventEncoder.encode(LOGBUYREALESTATE_EVENT));
        return logBuyRealEstateEventObservable(filter);
    }

    @Deprecated
    public static RealEstate load(String contractAddress, Web3j web3j, Credentials credentials, BigInteger gasPrice, BigInteger gasLimit) {
        return new RealEstate(contractAddress, web3j, credentials, gasPrice, gasLimit);
    }

    @Deprecated
    public static RealEstate load(String contractAddress, Web3j web3j, TransactionManager transactionManager, BigInteger gasPrice, BigInteger gasLimit) {
        return new RealEstate(contractAddress, web3j, transactionManager, gasPrice, gasLimit);
    }

    public static RealEstate load(String contractAddress, Web3j web3j, Credentials credentials, ContractGasProvider contractGasProvider) {
        return new RealEstate(contractAddress, web3j, credentials, contractGasProvider);
    }

    public static RealEstate load(String contractAddress, Web3j web3j, TransactionManager transactionManager, ContractGasProvider contractGasProvider) {
        return new RealEstate(contractAddress, web3j, transactionManager, contractGasProvider);
    }

    public static class LogBuyRealEstateEventResponse {
        public Log log;

        public String _buyer;

        public BigInteger _id;
    }
}
