#!/bin/bash
CUR_DIR=$(realpath .)
SGXSAN_DIR=$(realpath ${CUR_DIR}/../../)

source ${SGXSAN_DIR}/kAFL/kafl/env.sh
kafl fuzz --kernel /home/leone/Documents/linux/arch/x86_64/boot/bzImage --initrd ${CUR_DIR}/target.cpio.gz --memory 512 --sharedir ${CUR_DIR}/sharedir --seed-dir ${CUR_DIR}/seeds -t 4 -ts 2 -tc -p 1 --redqueen --grimoire --radamsa -D --funky --purge --log-hprintf --abort-time 24 -w ${CUR_DIR}/workdir_T0 --cpu-offset 8
# kafl debug --action single -w ${CUR_DIR}/workdir_debug --kernel /home/leone/Documents/linux/arch/x86_64/boot/bzImage --initrd ${CUR_DIR}/target_debug.cpio.gz --memory 512 --sharedir ${CUR_DIR}/sharedir --purge --qemu-base "-enable-kvm -machine kAFL64-v1 -cpu kAFL64-Hypervisor-v1,+vmx -no-reboot -nic user,hostfwd=tcp::5555-:1234 -display none" -t 0 --input $1
# kafl cov --kernel /home/leone/Documents/linux/arch/x86_64/boot/bzImage --initrd ${CUR_DIR}/target.cpio.gz --memory 512 --sharedir ${CUR_DIR}/sharedir -r -ip0 0x7ffff62be000-0x7ffff6793000 -t 4 -w ${CUR_DIR}/workdir_T0 -p16
# ${SGXSAN_DIR}/Tool/GetLayout.py Enclave/enclave_hsm_t.o Enclave/marshal.o Enclave/enclave_hsm.o Enclave/enclave_msg_exchange.o Enclave/openssl_operation.o Enclave/key_factory.o Enclave/key_operation.o Enclave/self_test/rsa_test.o Enclave/self_test/sm4_test.o Enclave/self_test/aes_test.o Enclave/self_test/ecc_test.o Enclave/self_test/sm2_test.o Enclave/self_test/enclave_self_test.o /home/leone/Documents/SGXSan/install/sgxssl/lib64/libsgx_tsgxssl.a /home/leone/Documents/SGXSan/install/sgxssl/lib64/libsgx_tsgxssl_ssl.a /home/leone/Documents/SGXSan/install/sgxssl/lib64/libsgx_tsgxssl_crypto.a /home/leone/Documents/SGXSan/install/lib64/libSGXSanRTEnclave.a /home/leone/Documents/SGXSan/install/lib64/libsgx_dcap_tvl.a /home/leone/Documents/SGXSan/install/lib64/libsgx_trts_sim.a /home/leone/Documents/SGXSan/install/lib64/libsgx_tcrypto.a /home/leone/Documents/SGXSan/install/lib64/libsgx_tservice_sim.a -d ${CUR_DIR}/core
# ${SGXSAN_DIR}/kAFL/kafl/fuzzer/scripts/ghidra_run.sh ${CUR_DIR}/workdir_T0 ${CUR_DIR}/out/ehsm-core/libenclave-ehsm-core.so ${SGXSAN_DIR}/ghidra_cov_analysis.py
