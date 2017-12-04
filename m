From: lkp@intel.com (kbuild test robot)
Date: Mon, 4 Dec 2017 12:00:40 +0800
Subject: [Linux-kselftest-mirror] [PATCH 1/5] bpf: correct broken uapi
 for BPF_PROG_TYPE_PERF_EVENT program type
In-Reply-To: <1512137948-31729-2-git-send-email-brueckner@linux.vnet.ibm.com>
References: <1512137948-31729-2-git-send-email-brueckner@linux.vnet.ibm.com>
Message-ID: <201712041117.BmtvHi0J%fengguang.wu@intel.com>
Content-Type: text/plain; charset="UTF-8"
Message-ID: <20171204040040.fzfLQSJOjpMn2AoAT_yP4H-PzUxGLztVjc2h8BvJoc8@z>

Hi Hendrik,

Thank you for the patch! Yet something to improve:

[auto build test ERROR on linus/master]
[also build test ERROR on v4.15-rc2]
[cannot apply to tip/perf/core]
[if your patch is applied to the wrong git tree, please drop us a note to help improve the system]

url:    https://github.com/0day-ci/linux/commits/Hendrik-Brueckner/bpf-correct-broken-uapi-for-BPF_PROG_TYPE_PERF_EVENT-program-type/20171204-092027
config: x86_64-randconfig-g0-12040613 (attached as .config)
compiler: gcc-4.9 (Debian 4.9.4-2) 4.9.4
reproduce:
        # save the attached .config to linux build tree
        make ARCH=x86_64 

All errors (new ones prefixed by >>):

   In file included from include/linux/perf_event.h:18:0,
                    from include/linux/trace_events.h:10,
                    from include/trace/syscall.h:7,
                    from include/linux/syscalls.h:82,
                    from net/socket.c:83:
>> include/uapi/linux/bpf_perf_event.h:11:32: fatal error: asm/bpf_perf_event.h: No such file or directory
    #include <asm/bpf_perf_event.h>
                                   ^
   compilation terminated.

vim +11 include/uapi/linux/bpf_perf_event.h

    10	
  > 11	#include <asm/bpf_perf_event.h>
    12	

---
0-DAY kernel test infrastructure                Open Source Technology Center
https://lists.01.org/pipermail/kbuild-all                   Intel Corporation
