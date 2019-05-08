From: peterz@infradead.org (Peter Zijlstra)
Date: Wed, 08 May 2019 09:49:03 +0200
Subject: [PATCH 2/4] x86/kprobes: Fix frame pointer annotations
References: <20190508074901.982470324@infradead.org>
Message-ID: <20190508080612.721269814@infradead.org>
Content-Type: text/plain; charset="UTF-8"
Message-ID: <20190508074903.d3vnbe3UCCdS0lRqXRJ0wJ6nijb0iRgOpujenfHMXxM@z>

The kprobe trampolines have a FRAME_POINTER annotation that makes no
sense. It marks the frame in the middle of pt_regs, at the place of
saving BP.

Change it to mark the pt_regs frame as per the ENCODE_FRAME_POINTER
from the respective entry_*.S.

Signed-off-by: Peter Zijlstra (Intel) <peterz at infradead.org>
---
 arch/x86/kernel/kprobes/common.h |   32 +++++++++++++++++++++++---------
 1 file changed, 23 insertions(+), 9 deletions(-)

--- a/arch/x86/kernel/kprobes/common.h
+++ b/arch/x86/kernel/kprobes/common.h
@@ -6,14 +6,15 @@
 
 #include <asm/asm.h>
 
+#ifdef CONFIG_X86_64
+
 #ifdef CONFIG_FRAME_POINTER
-# define SAVE_RBP_STRING "	push %" _ASM_BP "\n" \
-			 "	mov  %" _ASM_SP ", %" _ASM_BP "\n"
+#define ENCODE_FRAME_POINTER			\
+	"	leaq 1(%rsp), %rbp\n"
 #else
-# define SAVE_RBP_STRING "	push %" _ASM_BP "\n"
+#define ENCODE_FRAME_POINTER
 #endif
 
-#ifdef CONFIG_X86_64
 #define SAVE_REGS_STRING			\
 	/* Skip cs, ip, orig_ax. */		\
 	"	subq $24, %rsp\n"		\
@@ -27,11 +28,13 @@
 	"	pushq %r10\n"			\
 	"	pushq %r11\n"			\
 	"	pushq %rbx\n"			\
-	SAVE_RBP_STRING				\
+	"	pushq %rbp\n"			\
 	"	pushq %r12\n"			\
 	"	pushq %r13\n"			\
 	"	pushq %r14\n"			\
-	"	pushq %r15\n"
+	"	pushq %r15\n"			\
+	ENCODE_FRAME_POINTER
+
 #define RESTORE_REGS_STRING			\
 	"	popq %r15\n"			\
 	"	popq %r14\n"			\
@@ -51,19 +54,30 @@
 	/* Skip orig_ax, ip, cs */		\
 	"	addq $24, %rsp\n"
 #else
+
+#ifdef CONFIG_FRAME_POINTER
+#define ENCODE_FRAME_POINTER			\
+	"	movl %esp, %ebp\n"		\
+	"	andl $0x7fffffff, %ebp\n"
+#else
+#define ENCODE_FRAME_POINTER
+#endif
+
 #define SAVE_REGS_STRING			\
 	/* Skip cs, ip, orig_ax and gs. */	\
-	"	subl $16, %esp\n"		\
+	"	subl $4*4, %esp\n"		\
 	"	pushl %fs\n"			\
 	"	pushl %es\n"			\
 	"	pushl %ds\n"			\
 	"	pushl %eax\n"			\
-	SAVE_RBP_STRING				\
+	"	pushl %ebp\n"			\
 	"	pushl %edi\n"			\
 	"	pushl %esi\n"			\
 	"	pushl %edx\n"			\
 	"	pushl %ecx\n"			\
-	"	pushl %ebx\n"
+	"	pushl %ebx\n"			\
+	ENCODE_FRAME_POINTER
+
 #define RESTORE_REGS_STRING			\
 	"	popl %ebx\n"			\
 	"	popl %ecx\n"			\
