From: mpe at ellerman.id.au (Michael Ellerman)
Date: Tue, 23 Jan 2018 18:11:31 +1100
Subject: [Linux-kselftest-mirror] selftests: run all tests
In-Reply-To: <20180116115407.xqlu6bfvqcwoxszg@pd.tnic>
References: <20180115145942.s3dgy457xwhn6lwv@pd.tnic>
 <87tvvmcp0u.fsf@concordia.ellerman.id.au>
 <20180116114411.u4cqtvzw6evwnehu@pd.tnic>
 <20180116115407.xqlu6bfvqcwoxszg@pd.tnic>
Message-ID: <87372xoxr0.fsf@concordia.ellerman.id.au>

Borislav Petkov <bp at alien8.de> writes:

> On Tue, Jan 16, 2018 at 12:44:28PM +0100, Borislav Petkov wrote:
>> Ah, that was hidden in the included lib.mk, thanks.
>> 
>> I wonder if we should make it more user-friendly by adding a help target
>> like for the main Makefile...
>
> One more point:
>
> What I do is copy the x86/ folder to a test box and run all tests there.
> If the lib.mk is not copied, run_tests is missing....

OK, that's not really supported I guess.

If you're happy building on your host system, you can do:

$ make -C tools/testing/selftests/ TARGETS=x86 install

And then you'll have:

$ find tools/testing/selftests/install/
tools/testing/selftests/install/
tools/testing/selftests/install/x86
tools/testing/selftests/install/x86/mpx-mini-test_64
tools/testing/selftests/install/x86/iopl_64
tools/testing/selftests/install/x86/sysret_rip_64
tools/testing/selftests/install/x86/protection_keys_64
tools/testing/selftests/install/x86/sysret_ss_attrs_64
tools/testing/selftests/install/x86/syscall_nt_64
tools/testing/selftests/install/x86/test_mremap_vdso_64
tools/testing/selftests/install/x86/ioperm_64
tools/testing/selftests/install/x86/ptrace_syscall_64
tools/testing/selftests/install/x86/sigreturn_64
tools/testing/selftests/install/x86/fsgsbase_64
tools/testing/selftests/install/x86/5lvl_64
tools/testing/selftests/install/x86/check_initial_reg_state_64
tools/testing/selftests/install/x86/ldt_gdt_64
tools/testing/selftests/install/x86/single_step_syscall_64
tools/testing/selftests/install/x86/test_vdso_64
tools/testing/selftests/install/run_kselftest.sh

You can rsync that wherever, and run it manually or with the
run_kselftest.sh script.

cheers
--
To unsubscribe from this list: send the line "unsubscribe linux-kselftest" in
the body of a message to majordomo at vger.kernel.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
