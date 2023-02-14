set -e

echo $(pwd)

cur=$(pwd)

userprogs=("ch2b_hello_world"
"ch2b_power"
"ch3b_sleep"
"ch3b_sleep1"      
"ch3b_yield0"   
"ch3b_yield1"
"ch3b_yield2"       
"ch5b_getpid"    
"ch5b_forktest0"
"ch5b_forktest1"   
"ch5b_forktest2" 
"ch5b_exit"
"ch6b_filetest"     
"ch6b_exec"    
"ch7b_pipetest"
"ch8b_mpsc_sem"
"ch8b_mut_phi_din" 
"ch8b_mut_race"  
"ch8b_sync_sem"
"ch8b_test_condvar"
"ch8b_threads_arg"
"ch8b_threads"      
"ch8b_spin_mut_race"
"ch8b_mut_phi_din"
"ch8b_usertest")  


ucoredir="./ucore/user/build/riscv64"


pushd "./ucore/user"
make clean
make BASE=1 CHAPTER=8
popd

builddir="./user/build"

objcopy="riscv64-unknown-elf-objcopy"
for i in ${userprogs[@]};
do
    touch "${builddir}/app/${i}.rs"
    cp "${ucoredir}/${i}" "${builddir}/elf/${i}.elf"
done

rm -rf "./user/src/bin"

exit 0