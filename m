From: trondmy at primarydata.com (Trond Myklebust)
Date: Sun, 3 Dec 2017 15:17:32 +0000
Subject: [Linux-kselftest-mirror] Difficulties for compilation without
	extra optimisation
In-Reply-To: <a2ac6d05-fdd6-82bb-075e-b7eb81b516fe@users.sourceforge.net>
References: <7f072f78-eef4-6d87-d233-cee71dac5a32@users.sourceforge.net>
 <a2ac6d05-fdd6-82bb-075e-b7eb81b516fe@users.sourceforge.net>
Message-ID: <1512314250.3673.6.camel@primarydata.com>

On Sun, 2017-12-03 at 15:15 +0100, SF Markus Elfring wrote:
> Hello,
> 
> I came along some software modules where I suggested source code
> adjustments.
> 
> Example:
> nfs/write: Use common error handling code in
> nfs_lock_and_join_requests()
> 
> https://lkml.org/lkml/2017/11/7/599
> https://patchwork.kernel.org/patch/10047013/
> https://lkml.kernel.org/r/<7f072f78-eef4-6d87-d233-cee71dac5a32 at users
> .sourceforge.net>;
> 
> I would like to check corresponding build results then without extra
> optimisation applied by the compiler.
> But I got surprised by error messages for a command like the
> following.
> 
> elfring at Sonne:~/Projekte/Linux/next-patched> my_cc=/usr/bin/gcc-7 &&
> LANG=C make -j4 CC="${my_cc}" HOSTCC="${my_cc}" EXTRA_CFLAGS='-O0'
> allmodconfig fs/nfs/write.o
> …
> In file included from ./include/linux/compiler.h:58:0,
>                  from ./include/uapi/linux/stddef.h:1,
>                  from ./include/linux/stddef.h:4,
>                  from ./include/uapi/linux/posix_types.h:4,
>                  from ./include/uapi/linux/types.h:13,
>                  from ./include/linux/types.h:5,
>                  from fs/nfs/write.c:9:
> ./arch/x86/include/asm/jump_label.h: In function
> ‘trace_nfs_writeback_page_enter’:
> ./include/linux/compiler-gcc.h:275:38: warning: asm operand 0
> probably doesn’t match constraints
>  #define asm_volatile_goto(x...) do { asm goto(x); asm (""); } while
> (0)
> …
> 
> 
> How do you think about to improve this software situation anyhow?

I'm not seeing anything obviously wrong with the NFS use of tracepoints
there, and the warning suggests rather that gcc has an issue with the
inlined assembly code in jump_label.h.

Ccing Peter Zijlstra (who appears to have been the last person to touch
that assembly code) and Steven Rostedt.

-- 
Trond Myklebust
Linux NFS client maintainer, PrimaryData
trond.myklebust at primarydata.com
