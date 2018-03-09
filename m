From: zhijianx.li at intel.com (Li Zhijian)
Date: Fri, 9 Mar 2018 09:28:19 +0800
Subject: kernel_selftests.x86.mpx-mini-test_32.fail on skylake platform
Message-ID: <4edaa677-bd38-2428-960b-124615be85a6@intel.com>

Hi all

0Day noticed that kernel_selftests.x86.mpx-mini-test_32.fail at recent upstream kernel
a. v4.11 Good
b. v4.12 and later: Bad

And the 64bit application kernel_selftests.x86.mpx-mini-test_64 is always good.

0Day robot tried to bisect the FBC, but it failed at last. But anyway i want to let you know we had this issue.

below is the testing log at v4.12
-----------------------
2018-03-02 23:12:08 make run_tests -C x86
make: Entering directory '/usr/src/linux-selftests-x86_64-rhel-7.2_mpx-6f7da290413ba713f0cdd9ff1a2a9bb129ef4f6c/tools/testing/selftests/x86'
#BR status == 2, missing bounds table,kernel should have handled!!
XSAVE is supported by HW & OS
XSAVE processor supported state mask: 0x2ff
XSAVE OS supported state mask: 0x2ff
  BNDREGS: size: 64 user: 1 supervisor: 0 aligned: 0
   BNDCSR: size: 64 user: 1 supervisor: 0 aligned: 0
executing unmaptest
mpx dig (  1) complete, SUCCESS (       0 /    0)
selftests:  mpx-mini-test_32 [FAIL]
-----------------------

0Day Environment
OS: Debian 9
kernel: v4.12
model: Skylake
nr_cpu: 104
memory: 64G
brand: Intel(R) Xeon(R) Platinum 8170 CPU @ 2.10GHz

-------------------------
as a comparison, paste the log at v4.11 as following
XSAVE is supported by HW & OS
XSAVE processor supported state mask: 0x2ff
XSAVE OS supported state mask: 0x2ff
  BNDREGS: size: 64 user: 1 supervisor: 0 aligned: 0
   BNDCSR: size: 64 user: 1 supervisor: 0 aligned: 0
executing unmaptest
mpx dig (  1) complete, SUCCESS (       0 /    0)
iteration 1 complete, OK so far
mpx dig (  2) complete, SUCCESS (    8836 / 5554)
mpx dig (  3) complete, SUCCESS (    2761 / 1760)
mpx dig (  4) complete, SUCCESS (    4494 / 2828)
mpx dig (  5) complete, SUCCESS (     531 /  337)
mpx dig (  6) complete, SUCCESS (     145 /   92)
mpx dig (  7) complete, SUCCESS (       0 /    0)
mpx dig (  8) complete, SUCCESS (       0 /    0)
mpx dig (  9) complete, SUCCESS (       0 /    0)
mpx dig ( 10) complete, SUCCESS (       0 /    0)
mpx dig ( 11) complete, SUCCESS (       0 /    0)
mpx dig ( 12) complete, SUCCESS (       0 /    0)
mpx dig ( 13) complete, SUCCESS (       0 /    0)
mpx dig ( 14) complete, SUCCESS (       0 /    0)
mpx dig ( 15) complete, SUCCESS (       0 /    0)
mpx dig ( 16) complete, SUCCESS (       0 /    0)
iteration 1566 complete, OK so far
mpx dig ( 17) complete, SUCCESS (       0 /    0)
mpx dig ( 18) complete, SUCCESS (       0 /    0)
mpx dig ( 19) complete, SUCCESS (       0 /    0)
mpx dig ( 20) complete, SUCCESS (       0 /    0)
mpx dig ( 21) complete, SUCCESS (       0 /    0)
mpx dig ( 22) complete, SUCCESS (       0 /    0)
mpx dig ( 23) complete, SUCCESS (       0 /    0)
mpx dig ( 24) complete, SUCCESS (       0 /    0)
mpx dig ( 25) complete, SUCCESS (       0 /    0)
mpx dig ( 26) complete, SUCCESS (       0 /    0)
mpx dig ( 27) complete, SUCCESS (       0 /    0)
mpx dig ( 28) complete, SUCCESS (       0 /    0)
mpx dig ( 29) complete, SUCCESS (       0 /    0)
mpx dig ( 30) complete, SUCCESS (       0 /    0)
mpx dig ( 31) complete, SUCCESS (       0 /    0)
mpx dig ( 32) complete, SUCCESS (       0 /    0)
mpx dig ( 33) complete, SUCCESS (       0 /    0)
mpx dig ( 34) complete, SUCCESS (       0 /    0)
mpx dig ( 35) complete, SUCCESS (       0 /    0)
mpx dig ( 36) complete, SUCCESS (       0 /    0)
mpx dig ( 37) complete, SUCCESS (       0 /    0)
mpx dig ( 38) complete, SUCCESS (       0 /    0)
mpx dig ( 39) complete, SUCCESS (       0 /    0)
mpx dig ( 40) complete, SUCCESS (       0 /    0)
iteration 3325 complete, OK so far
done with malloc() fun
starting mpx bounds table test
iteration 4574 complete, OK so far
iteration 9157 complete, OK so far
done with mpx bounds table test
./mpx-mini-test_32 completed successfully
selftests: mpx-mini-test_32 [PASS]


Thanks

--
To unsubscribe from this list: send the line "unsubscribe linux-kselftest" in
the body of a message to majordomo at vger.kernel.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
