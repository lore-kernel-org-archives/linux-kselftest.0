From: liuwl.fnst@cn.fujitsu.com (Liu, Wenlong)
Date: Tue, 4 Dec 2018 05:53:41 +0000
Subject: seccomp/seccomp_bpf: test terminated by the not expected behavior
In-Reply-To: <CAGXu5j+B_+UggW50bFVuZKM2Fsou7g6ZMrCL_kPHyc7tsWFDSA@mail.gmail.com>
References: <F40213214988A94A9DDBFC5F7146FC5E01AF2E2998@G08CNEXMBPEKD01.g08.fujitsu.local>
 <CAGXu5j+B_+UggW50bFVuZKM2Fsou7g6ZMrCL_kPHyc7tsWFDSA@mail.gmail.com>
Message-ID:
 <F40213214988A94A9DDBFC5F7146FC5E01AF2E3751@G08CNEXMBPEKD01.g08.fujitsu.local>
Content-Type: text/plain; charset="UTF-8"
Message-ID: <20181204055341.FPlZlhsi9cOaPP0fjxz1Vz1Ji1Eo6wWPeIbKM8zj3Iw@z>

[Fixed]
Have found the cause, and I think I should report back to this mailing list about my real problem and its solution.

Problem: [ARCH: aarch64, Version: 4.14.35]
The second in_syscall() based on the updated pt_regs(syscall nr has been emptied) instead of the original pt_regs.
But it should use the original one, otherwise, it cannot trigger the restart_syscall as our expected.

... (arch/arm64/kernel/signal.c)
/*
 * Handle restarting a different system call. As above, if a debugger
 * has chosen to restart at a different PC, ignore the restart.
 */
if (in_syscall(regs) && regs->pc == restart_addr) {
	if (retval == -ERESTART_RESTARTBLOCK)
		setup_restart_syscall(regs);
	user_rewind_single_step(current);
}
...

Fixed commit: 0fe4251 [1]

This commit has already been backport/merged to 4.14.53, but didn't apply to the BSP I'm using.

Thanks.

[1] https://github.com/torvalds/linux/commit/0fe42512b2f03f9e5a20b9f55ef1013a68b4cd48 

Best regards
Liu

> -----Original Message-----
> From: Kees Cook [mailto:keescook at chromium.org]
> Sent: Friday, November 30, 2018 10:58 AM
> To: Liu, Wenlong/刘 文龙 <liuwl.fnst at cn.fujitsu.com>
> Cc: Andy Lutomirski <luto at amacapital.net>; Will Drewry
> <wad at chromium.org>; Shuah Khan <shuah at kernel.org>; open list:KERNEL
> SELFTEST FRAMEWORK <linux-kselftest at vger.kernel.org>;
> yuichi.kusakabe at denso-ten.com; kisuke.kawamura at denso-ten.com
> Subject: Re: seccomp/seccomp_bpf: test terminated by the not expected
> behavior
> 
> On Thu, Nov 29, 2018 at 6:52 PM Liu, Wenlong <liuwl.fnst at cn.fujitsu.com>
> wrote:
> > m3ulcb:/opt/kselftest/seccomp# ./seccomp_bpf 64
> > [ RUN      ] global.get_metadata
> > seccomp_bpf.c:2914:global.get_metadata:Expected sizeof(md) (16) ==
> > ptrace(0x420d, pid, sizeof(md), &md) (-1)
> > global.get_metadata: Test terminated by assertion
> > [     FAIL ] global.get_metadata
> >
> > ---
> > Although I am not so familiar with SECCOMP and BPF, I checked some related
> documents and codes.
> > About the failures above, what the most confused me is that why it always
> give ENOSYS.
> >
> > Am I missing something?
> > Thanks in advance.
> >
> > PS:
> > I didn't run "make kselftest-merge" before compiling the kernel that I'm
> using.
> >
> > ---
> > The Test Environment:
> > - Kernel version: v4.14.0
> 
> Hi!
> 
> It appears you're attempting to use a newer seccomp selftest on an older
> kernel. That isn't a supported way to test seccomp. You'll need to build
> 4.14's seccomp_bpf test binary and run it instead.
> 
> --
> Kees Cook
> 
