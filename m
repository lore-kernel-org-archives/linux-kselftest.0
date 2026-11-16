Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=128.30.2.78
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794796540;
	b=FfrkHzKoY2ZV7nqfmalorkf6kPkTluXmuxgwf+k7zcNL6S7fHZ7rDWZTraVxXFF/9JMf
	 v1mwiJ/s5P++KwpAzB8m4lmHBsL+t7f7k0IamoJ7w+FCeqOYdKEhW7orgH03oKqiKs93w
	 HOxz+LWato9cdSQEcqQsAsChR/XQaq/3ShkHQGeXlxZPKDyA2FD+cijTgDQtf34WtK9xL
	 21carhadova6aDSNMqyT+Fsf+d9VadeGCoAu7i9ynSv6674LgPLQOZicyfGStDzR+7Rfj
	 AbEOeO9UeU4mYM5pMozwwvjBgAI7TKhkmWCLVfLHeJ7ZLKfuatY4Xz17KKYLukL6qhQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794796540;
	h=DMARC-Filter:Received:From:To:Cc:Subject:Date:Message-ID:X-Mailer:
	 In-Reply-To:References:MIME-Version:Content-Transfer-Encoding;
	bh=XCk3tuAk2tY94YbdGb0TtCYZgFeyXdNGKMLPBWlLuv4=;
	b=uXEMAC7pLltp7emYfmEQKm0p8Cst+LNtBoqh3a5SOMQG0tQPlFN7Iq/vUAMN3ZwZOGaw
	 bb+A3piIhxKl8HfMlH96bBX+Mq2sjXaF26Exm3gapmxRdoUVK7x9FlGVSajCDOYyoKzjU
	 osHTXSHagg/XRlndB42IlsG74wx3TMh/b33N6POaFv0ZqOvf860wGy/ComHAriyMQApAq
	 f8W4DscM6OJ4latTXrHMfbV7Tuf6fjLQu2rq8TMUMK8e7+TaKIEhqxcK4dZQya0vM4IoQ
	 ItWqNFJ3TbStCtKIvFpHqZzSu4fz+kvZH89pvv4qunv83+FPiYdko5I5gUlmC5ulvkg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=csail.mit.edu;
	spf=pass smtp.mailfrom=csail.mit.edu;
	arc=none smtp.remote-ip=128.30.2.78
Received: from outgoing2021.csail.mit.edu (outgoing2021.csail.mit.edu [128.30.2.78])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0B1DF606A31F;
	Mon, 16 Nov 2026 02:35:39 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 0B1DF606A31F
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=csail.mit.edu
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=csail.mit.edu
Received: from escalante.csail.mit.edu ([128.52.128.198])
	by outgoing2021.csail.mit.edu with esmtp (Exim 4.95)
	(envelope-from <nickolai@csail.mit.edu>)
	id 1xSmZC-004DmY-Se;
	Sun, 15 Nov 2026 21:35:34 -0500
From: Nickolai Zeldovich <nickolai@csail.mit.edu>
To: Paul Walmsley <pjw@kernel.org>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>
Cc: Alexandre Ghiti <alex@ghiti.fr>,
	Andy Chiu <andybnac@gmail.com>,
	Guobin Zhang <guobin.zhang@intel.com>,
	Deepak Gupta <debug@rivosinc.com>,
	Shuah Khan <shuah@kernel.org>,
	linux-riscv@lists.infradead.org,
	linux-kselftest@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Nickolai Zeldovich <nickolai@csail.mit.edu>
Subject: [PATCH v3 1/2] riscv: signal: mark the FP state clean before restoring it from the frame
Date: Sun, 15 Nov 2026 21:35:33 -0500
Message-ID: <20261116023534.50074-2-nickolai@csail.mit.edu>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20261116023534.50074-1-nickolai@csail.mit.edu>
References: <20261116023534.50074-1-nickolai@csail.mit.edu>
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

If rt_sigreturn() is preempted or sleeps on a page fault while it copies
the FP registers from the signal frame, the interrupted code resumes
with the signal handler's FP registers instead of its own.

restore_fp_state() copies the frame into current->thread.fstate and then
loads it with fstate_restore(). If the handler used the FPU, FS is still
Dirty during the copy, so a context switch makes fstate_save() store the
live registers, the handler's, over the partly copied image.

Mark the FP state clean before the copy, as commit c27fa53b858b ("riscv:
Fix vector state restore in rt_sigreturn()") did for the vector state.
Preemption is disabled around it because the scheduler also writes
regs->status.

Fixes: e2c0cdfba7f6 ("RISC-V: User-facing API")
Signed-off-by: Nickolai Zeldovich <nickolai@csail.mit.edu>
---
 arch/riscv/kernel/signal.c | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/arch/riscv/kernel/signal.c b/arch/riscv/kernel/signal.c
index 59784dc117e4..11edfc128ac3 100644
--- a/arch/riscv/kernel/signal.c
+++ b/arch/riscv/kernel/signal.c
@@ -47,6 +47,13 @@ static long restore_fp_state(struct pt_regs *regs,
 	long err;
 	struct __riscv_d_ext_state __user *state = &sc_fpregs->d;
 
+	/* Discard the handler's FP registers before the copy can sleep */
+	if ((regs->status & SR_FS) != SR_FS_OFF) {
+		preempt_disable();
+		__fstate_clean(regs);
+		preempt_enable();
+	}
+
 	err = __copy_from_user(&current->thread.fstate, state, sizeof(*state));
 	if (unlikely(err))
 		return err;
-- 
2.53.0

