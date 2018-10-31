From: lkp at intel.com (kbuild test robot)
Date: Thu, 1 Nov 2018 04:18:19 +0800
Subject: [PATCH v2 1/2] kretprobe: produce sane stack traces
In-Reply-To: <20181031152543.12138-2-cyphar@cyphar.com>
References: <20181031152543.12138-2-cyphar@cyphar.com>
Message-ID: <201811010431.4BRyGN60%fengguang.wu@intel.com>

Hi Aleksa,

Thank you for the patch! Yet something to improve:

[auto build test ERROR on tip/perf/core]
[also build test ERROR on v4.19 next-20181031]
[if your patch is applied to the wrong git tree, please drop us a note to help improve the system]

url:    https://github.com/0day-ci/linux/commits/Aleksa-Sarai/kretprobe-produce-sane-stack-traces/20181101-034104
config: i386-tinyconfig (attached as .config)
compiler: gcc-7 (Debian 7.3.0-1) 7.3.0
reproduce:
        # save the attached .config to linux build tree
        make ARCH=i386 

All error/warnings (new ones prefixed by >>):

   kernel/events/callchain.c: In function 'get_perf_callchain':
>> kernel/events/callchain.c:201:35: error: implicit declaration of function 'current_kretprobe_instance'; did you mean 'current_top_of_stack'? [-Werror=implicit-function-declaration]
      struct kretprobe_instance *ri = current_kretprobe_instance();
                                      ^~~~~~~~~~~~~~~~~~~~~~~~~~
                                      current_top_of_stack
>> kernel/events/callchain.c:201:35: warning: initialization makes pointer from integer without a cast [-Wint-conversion]
>> kernel/events/callchain.c:206:4: error: implicit declaration of function 'kretprobe_perf_callchain_kernel'; did you mean 'perf_callchain_kernel'? [-Werror=implicit-function-declaration]
       kretprobe_perf_callchain_kernel(ri, &ctx);
       ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
       perf_callchain_kernel
   cc1: some warnings being treated as errors

vim +201 kernel/events/callchain.c

   178	
   179	struct perf_callchain_entry *
   180	get_perf_callchain(struct pt_regs *regs, u32 init_nr, bool kernel, bool user,
   181			   u32 max_stack, bool crosstask, bool add_mark)
   182	{
   183		struct perf_callchain_entry *entry;
   184		struct perf_callchain_entry_ctx ctx;
   185		int rctx;
   186	
   187		entry = get_callchain_entry(&rctx);
   188		if (rctx == -1)
   189			return NULL;
   190	
   191		if (!entry)
   192			goto exit_put;
   193	
   194		ctx.entry     = entry;
   195		ctx.max_stack = max_stack;
   196		ctx.nr	      = entry->nr = init_nr;
   197		ctx.contexts       = 0;
   198		ctx.contexts_maxed = false;
   199	
   200		if (kernel && !user_mode(regs)) {
 > 201			struct kretprobe_instance *ri = current_kretprobe_instance();
   202	
   203			if (add_mark)
   204				perf_callchain_store_context(&ctx, PERF_CONTEXT_KERNEL);
   205			if (ri)
 > 206				kretprobe_perf_callchain_kernel(ri, &ctx);
   207			else
   208				perf_callchain_kernel(&ctx, regs);
   209		}
   210	
   211		if (user) {
   212			if (!user_mode(regs)) {
   213				if  (current->mm)
   214					regs = task_pt_regs(current);
   215				else
   216					regs = NULL;
   217			}
   218	
   219			if (regs) {
   220				mm_segment_t fs;
   221	
   222				if (crosstask)
   223					goto exit_put;
   224	
   225				if (add_mark)
   226					perf_callchain_store_context(&ctx, PERF_CONTEXT_USER);
   227	
   228				fs = get_fs();
   229				set_fs(USER_DS);
   230				perf_callchain_user(&ctx, regs);
   231				set_fs(fs);
   232			}
   233		}
   234	
   235	exit_put:
   236		put_callchain_entry(rctx);
   237	
   238		return entry;
   239	}
   240	

---
0-DAY kernel test infrastructure                Open Source Technology Center
https://lists.01.org/pipermail/kbuild-all                   Intel Corporation
-------------- next part --------------
A non-text attachment was scrubbed...
Name: .config.gz
Type: application/gzip
Size: 6493 bytes
Desc: not available
URL: <http://lists.linaro.org/pipermail/linux-kselftest-mirror/attachments/20181101/928d4c2c/attachment.bin>
