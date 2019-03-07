From: bo.tong@intel.com (Tong Bo)
Date: Thu,  7 Mar 2019 16:25:40 +0800
Subject: [PATCH] selftests/x86: Support Atom for syscall_arg_fault test
Message-ID: <1551947140-22166-1-git-send-email-bo.tong@intel.com>
Content-Type: text/plain; charset="UTF-8"
Message-ID: <20190307082540.1Ss4duf5XZZj0WKMqWu7szBtRl8s_6rq0O3lRO41Z5k@z>

Atom-based CPUs trigger stack fault when invoke 32-bit SYSENTER instruction
with invalid register values. So we also need sigbus handling in this case.

Following is assembly when the fault expception happens.

(gdb) disassemble $eip
Dump of assembler code for function __kernel_vsyscall:
   0xf7fd8fe0 <+0>:     push   %ecx
   0xf7fd8fe1 <+1>:     push   %edx
   0xf7fd8fe2 <+2>:     push   %ebp
   0xf7fd8fe3 <+3>:     mov    %esp,%ebp
   0xf7fd8fe5 <+5>:     sysenter
   0xf7fd8fe7 <+7>:     int    $0x80
=> 0xf7fd8fe9 <+9>:     pop    %ebp
   0xf7fd8fea <+10>:    pop    %edx
   0xf7fd8feb <+11>:    pop    %ecx
   0xf7fd8fec <+12>:    ret
End of assembler dump.

Accroding to Intel SDM, this could also be a Stack Segment Fault(#SS, 12),
except a normal Page Fault(#PF, 14). Especially, in section 6.9 of Vol.3A,
both stack and page faults are within the 10th(lowest priority) class, and
as it said, "exceptions within each class are implementation-dependent and
may vary from processor to processor". It's expected for processors like
Intel Atom to trigger stack fault(sigbus), while we get page fault(sigsegv)
from common Core processors.

Signed-off-by: Tong Bo <bo.tong at intel.com>
---
 tools/testing/selftests/x86/syscall_arg_fault.c | 6 ++++--
 1 file changed, 4 insertions(+), 2 deletions(-)

diff --git a/tools/testing/selftests/x86/syscall_arg_fault.c b/tools/testing/selftests/x86/syscall_arg_fault.c
index 7db4fc9..38cd246 100644
--- a/tools/testing/selftests/x86/syscall_arg_fault.c
+++ b/tools/testing/selftests/x86/syscall_arg_fault.c
@@ -43,7 +43,7 @@ static sigjmp_buf jmpbuf;
 
 static volatile sig_atomic_t n_errs;
 
-static void sigsegv(int sig, siginfo_t *info, void *ctx_void)
+static void sigsegv_or_sigbus(int sig, siginfo_t *info, void *ctx_void)
 {
 	ucontext_t *ctx = (ucontext_t*)ctx_void;
 
@@ -73,7 +73,9 @@ int main()
 	if (sigaltstack(&stack, NULL) != 0)
 		err(1, "sigaltstack");
 
-	sethandler(SIGSEGV, sigsegv, SA_ONSTACK);
+	sethandler(SIGSEGV, sigsegv_or_sigbus, SA_ONSTACK);
+	/* Atom CPUs may trigger sigbus for below SYSENTER exception case */
+	sethandler(SIGBUS, sigsegv_or_sigbus, SA_ONSTACK);
 	sethandler(SIGILL, sigill, SA_ONSTACK);
 
 	/*
-- 
2.7.4
