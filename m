Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=117.135.210.3
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793179617;
	b=hEdj8912vojhvQukP3qfDt2ruwiCVnBWrMS4y9LpIIgh21zbAzxeVz/z/dKdtqba98ZQ
	 RGHcjYgFtqwyaxW1oSIFaTaAad0hqKmXG3XKXWlVTs4lGLWh4c3SZJosamrSDuxIbcjQc
	 rqYZxbcEoEX7+Z4JtJP2aajlUQ7+DweSWwX4efwlpJ/xz2l3Ng6AaHKdDEK5sHF+F5o+M
	 f6wOrLLrKvxxiscdk1zi9g4A/S9ArZmIZL7MKkHSULGG/PjQhzbAwlVoE9Gig/7AvtEcy
	 5eDXe+7YCQ/YRNTjKWE+bk3WCQ/zhyTZ7o4g05kZED2PbIQLx4muzpc3RUV1BBzQbvg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793179617;
	h=DMARC-Filter:DKIM-Signature:Received:From:To:Cc:Subject:Date:
	 Message-Id:X-Mailer:MIME-Version:Content-Transfer-Encoding:
	 X-CM-TRANSID:X-Coremail-Antispam:X-CM-SenderInfo;
	bh=uKXsUrFEY/XQ4vBtFLHNxUDClY4V1cw+HkUMZdP4ofE=;
	b=Cn44SxONiaYY0apDmw51J4CHkVuKclSaXI5DNdS4EurO7+6pNnE5ovTIltdTA82uzyHp
	 5mxmBR9HrXal0w+oFs8BCqc3WEIVhtEPVeYrkDTrccn3xkLso/+u2QA8npO49Iji+ucxp
	 7I7EY6QWms3bTRdRRks0MI5bco1knmFfjVyCPNY2WigdYjNBoVnah6tWGdPp3DeYr2h1a
	 wwiMBFFIcirCxOKBTKqiyk2PqBuy2BzaXERAUeARMQMYqO/zFfBgzbkpfmOZf7X80FqKS
	 eVLVUh8wvksF3mzCL7bnKrxHMAUVi1oat48EvZYo9+u3g4zE+cSbyA1nVhZagrcpQ0A==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=163.com;
	spf=pass smtp.mailfrom=163.com;
	dkim=pass header.d=163.com header.i=@163.com header.a=rsa-sha256 header.s=s110527 header.b=FoSORRnx;
	arc=none smtp.remote-ip=117.135.210.3
Received: from m16.mail.163.com (m16.mail.163.com [117.135.210.3])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4D804606A31C;
	Wed, 28 Oct 2026 09:26:53 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 4D804606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=163.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=163.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=163.com header.i=@163.com header.a=rsa-sha256 header.s=s110527 header.b=FoSORRnx
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=163.com;
	s=s110527; h=From:To:Subject:Date:Message-Id:MIME-Version; bh=uK
	XsUrFEY/XQ4vBtFLHNxUDClY4V1cw+HkUMZdP4ofE=; b=FoSORRnxHVl+EMxCQc
	+cGIFRjH6YpMJ4t9fZbEbJpr0by0QYrsgfpOxwNn6E/cmjFcXxfBIDMhgg19X1ov
	o913euIATEjhIODm2wj8dbJC4Esqsjrec876u5IUwx91dyMGPZmxu3PDawAhIpef
	imr3LUrtHO/SadNej14MGrmVo=
Received: from thinkpadx13gen2i.. (unknown [])
	by gzga-smtp-mtada-g0-2 (Coremail) with SMTP id _____wDnz8mVv+Fqj7mdDQ--.50177S2;
	Wed, 28 Oct 2026 17:25:42 +0800 (CST)
From: Zongmin Zhou <min_halo@163.com>
To: shuah@kernel.org,
	pjw@kernel.org,
	palmer@dabbelt.com,
	aou@eecs.berkeley.edu
Cc: alex@ghiti.fr,
	linux-kselftest@vger.kernel.org,
	linux-riscv@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Zongmin Zhou <zhouzongmin@kylinos.cn>
Subject: [PATCH] selftests: riscv: fix flag parsing and argv termination in vector tests
Date: Wed, 28 Oct 2026 17:25:08 +0800
Message-Id: <20261028092508.50223-1-min_halo@163.com>
X-Mailer: git-send-email 2.34.1
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Post: <mailto:linux-kselftest@vger.kernel.org>
List-Help: <mailto:linux-kselftest+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kselftest+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CM-TRANSID:_____wDnz8mVv+Fqj7mdDQ--.50177S2
X-Coremail-Antispam: 1Uf129KBjvJXoWxCr4rGF4rZw4rXw47Xr15twb_yoWrKFyDpa
	yfKa4j9ryrKFWIqw47AF4UJF4Fka4fJrWDAr1fA34UZr48GrykWF97Ka17XFnrur4Fq3Zx
	Aw1qgry8u3W5JaDanT9S1TB71UUUUU7qnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
	9KBjDUYxBIdaVFxhVjvjDU0xZFpf9x07jjLvtUUUUU=
X-CM-SenderInfo: pplqsxxdorqiywtou0bp/xtbC0hYo02rhv5bftwAA31

From: Zongmin Zhou <zhouzongmin@kylinos.cn>

The xtheadvector support broke both the sending and the parsing side
of the vector-test argv flag protocol, in two independent ways.

First, on the sending side, launch_test() passes a NULL pointer in
argv[1] or argv[2] when the corresponding flag is unset.  A NULL argv
entry terminates the argument list, so when test_inherit is unset, the
xtheadvector flag in argv[2] never reaches the child and the child
always runs the standard V code path.  v_initval always launches its
child with test_inherit unset, so v_exec_initval_nolibc never
received the flag at all.

Second, on the parsing side, the nolibc receivers test the flags with
strcmp(argv[i], "x"), which is true when the argument is *not* "x",
so the branches were never taken even when both flags were passed.
The xtheadvector code path of v_exec_initval_nolibc was therefore
dead code, and in vstate_exec_nolibc test_inherit could never be set
(a plain "if (argc > 1)" did the job before the xtheadvector support
was added), so the inherit re-exec checks launched by vstate_prctl
were never exercised either.

Always pass both flag slots as non-NULL strings ("-" for false), test
the flags with !strcmp(..., "x"), and, when re-exec'ing for the
inherit check, clear the inherit request while preserving the
xtheadvector flag so the exec'd child still exercises the intended
instruction variant.  exec_argv in vstate_exec_nolibc is enlarged to
hold the terminating NULL.

Fixes: c384c5d4a2ae ("selftests: riscv: Support xtheadvector in vector tests")
Signed-off-by: Zongmin Zhou <zhouzongmin@kylinos.cn>
---
 .../riscv/vector/v_exec_initval_nolibc.c         |  2 +-
 tools/testing/selftests/riscv/vector/v_helpers.c | 10 ++++++++--
 .../selftests/riscv/vector/vstate_exec_nolibc.c  | 16 ++++++++++++----
 3 files changed, 21 insertions(+), 7 deletions(-)

diff --git a/tools/testing/selftests/riscv/vector/v_exec_initval_nolibc.c b/tools/testing/selftests/riscv/vector/v_exec_initval_nolibc.c
index 4dde05e45a04..91e31f185b85 100644
--- a/tools/testing/selftests/riscv/vector/v_exec_initval_nolibc.c
+++ b/tools/testing/selftests/riscv/vector/v_exec_initval_nolibc.c
@@ -17,7 +17,7 @@ int main(int argc, char **argv)
 	char value = 0;
 	unsigned long vl;
 
-	if (argc > 2 && strcmp(argv[2], "x"))
+	if (argc > 2 && !strcmp(argv[2], "x"))
 		asm volatile (
 			// 0 | zimm[10:0] | rs1 | 1 1 1 | rd |1010111| vsetvli
 			// vsetvli	t4, x0, e8, m1, d1
diff --git a/tools/testing/selftests/riscv/vector/v_helpers.c b/tools/testing/selftests/riscv/vector/v_helpers.c
index de6da7c8d2f1..7eb157d4fc4b 100644
--- a/tools/testing/selftests/riscv/vector/v_helpers.c
+++ b/tools/testing/selftests/riscv/vector/v_helpers.c
@@ -61,9 +61,15 @@ int launch_test(char *next_program, int test_inherit, int xtheadvector)
 	}
 
 	if (!pid) {
+		/*
+		 * Always pass both flag slots as non-NULL strings ("-" for
+		 * false), otherwise a NULL argv[] entry terminates the
+		 * argument list and the following slots never reach the
+		 * child.
+		 */
 		exec_argv[0] = next_program;
-		exec_argv[1] = test_inherit != 0 ? "x" : NULL;
-		exec_argv[2] = xtheadvector != 0 ? "x" : NULL;
+		exec_argv[1] = test_inherit != 0 ? "x" : "-";
+		exec_argv[2] = xtheadvector != 0 ? "x" : "-";
 		exec_argv[3] = NULL;
 		exec_envp[0] = NULL;
 		/* launch the program again to check inherit */
diff --git a/tools/testing/selftests/riscv/vector/vstate_exec_nolibc.c b/tools/testing/selftests/riscv/vector/vstate_exec_nolibc.c
index 12f1b1b1c7aa..01ba5e5415b4 100644
--- a/tools/testing/selftests/riscv/vector/vstate_exec_nolibc.c
+++ b/tools/testing/selftests/riscv/vector/vstate_exec_nolibc.c
@@ -8,12 +8,12 @@ int main(int argc, char **argv)
 {
 	int rc, pid, status, test_inherit = 0, xtheadvector = 0;
 	long ctrl, ctrl_c;
-	char *exec_argv[2], *exec_envp[2];
+	char *exec_argv[4], *exec_envp[2];
 
-	if (argc > 1 && strcmp(argv[1], "x"))
+	if (argc > 1 && !strcmp(argv[1], "x"))
 		test_inherit = 1;
 
-	if (argc > 2 && strcmp(argv[2], "x"))
+	if (argc > 2 && !strcmp(argv[2], "x"))
 		xtheadvector = 1;
 
 	ctrl = prctl(PR_RISCV_V_GET_CONTROL, 0, 0, 0, 0);
@@ -31,8 +31,16 @@ int main(int argc, char **argv)
 
 		/* child  */
 		if (!pid) {
+			/*
+			 * Re-exec without the inherit request (this stage
+			 * is done) while preserving the xtheadvector flag,
+			 * so the exec'd child still exercises the intended
+			 * instruction variant.
+			 */
 			exec_argv[0] = THIS_PROGRAM;
-			exec_argv[1] = NULL;
+			exec_argv[1] = "-";
+			exec_argv[2] = xtheadvector ? "x" : "-";
+			exec_argv[3] = NULL;
 			exec_envp[0] = NULL;
 			exec_envp[1] = NULL;
 			/* launch the program again to check inherit */
-- 
2.34.1


No virus found
		Checked by Hillstone Network AntiVirus

