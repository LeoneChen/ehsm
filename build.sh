#/bin/bash
set -e

make ssl
make -C core

# ~/SGXSan/Tool/GetLayout.sh -d ./core Enclave/enclave_hsm_t.o Enclave/marshal.o Enclave/enclave_hsm.o Enclave/enclave_msg_exchange.o Enclave/openssl_operation.o Enclave/key_factory.o Enclave/key_operation.o Enclave/self_test/rsa_test.o Enclave/self_test/sm4_test.o Enclave/self_test/aes_test.o Enclave/self_test/ecc_test.o Enclave/self_test/sm2_test.o Enclave/self_test/enclave_self_test.o /mnt/hdd/sgx-evaluate/sgxfuzz/Enclaves/ehsm/utils/sgxssl/lib64/libsgx_tsgxssl.a /mnt/hdd/sgx-evaluate/sgxfuzz/Enclaves/ehsm/utils/sgxssl/lib64/libsgx_tsgxssl_ssl.a /mnt/hdd/sgx-evaluate/sgxfuzz/Enclaves/ehsm/utils/sgxssl/lib64/libsgx_tsgxssl_crypto.a /opt/intel/sgxsdk/lib64/libsgx_pthread.a /opt/intel/sgxsdk/lib64/libsgx_dcap_tvl.a /opt/intel/sgxsdk/lib64/libsgx_trts.a /opt/intel/sgxsdk/lib64/libsgx_tstdc.a /opt/intel/sgxsdk/lib64/libsgx_tcxx.a /opt/intel/sgxsdk/lib64/libsgx_tcrypto.a /opt/intel/sgxsdk/lib64/libsgx_tservice.a
