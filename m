Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=128.30.2.78
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793463515;
	b=BrhjJMf6lCJG+bqAyu6g74y88fgq8/StpGCLjGik60z5T4EkwE2eqgO0j7ER70Z76GEC
	 PVft1HjrI1ekdv9u4EAURGDIMdWtS14oObPOYrBS0B3eeV1BJLAE6JYBA7pp23R1LGb+2
	 5qXA09MMLm0ZjW3gFrDVTfLWEiaqq50PuLc7QcgopcBu6XIdNhYDzLCkJNdnnOa5lG6iA
	 rdhXE1j16GeeE8611WP85aKbK2m8A9YElhAdl8FUqLzH0PmzIr2Q4a8dVEssU9uUxEueN
	 yxHvR4LXPSpDnPCU1DyBMZEQd6Nd2AQMkQEroU2+SLP29L1xtSCfFxQog8YGsVSdVBg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793463515;
	h=DMARC-Filter:Received:From:To:Cc:Subject:Date:Message-ID:X-Mailer:
	 MIME-Version:Content-Transfer-Encoding;
	bh=94iRS+svfMmRFKW8nlnhYNbyyFySTBVOf1GYEPxEDQ8=;
	b=hvSfhP91+7+e8epBVczxGooN3J/VjBwT8FjzTF3Nxlb6BlxhuA4NPKEEn5p2YiLLqfDv
	 lDwK3AoLT7o6/eksYIDo6dumQO1R+EfamD7AVAjFO3zPGXXOCw47iF58U2Yp3rrR+U0Fi
	 fi+y34tLfOySYr+ZOnQ23kvxYc12X2k+4FjOFuO67q9t1Kv6LoVrDyAG5yN631JdAQLig
	 DLlEmzocdw7XB9XMKFvTLsI1t2YhjiGMgKHDFH8n6TskMnRS/FV/VjMhs1584Ek5UUn/n
	 Yj4MGN5uHHqrlHi66TyPjnjVTgYbCkO07BKbUih/+/7D+7d1EyfXVR7jF1XM20c7zjw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=csail.mit.edu;
	spf=pass smtp.mailfrom=csail.mit.edu;
	arc=none smtp.remote-ip=128.30.2.78
Received: from outgoing2021.csail.mit.edu (outgoing2021.csail.mit.edu [128.30.2.78])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0024D606A31E;
	Sat, 31 Oct 2026 16:18:34 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 0024D606A31E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=csail.mit.edu
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=csail.mit.edu
Received: from escalante.csail.mit.edu ([128.52.128.198])
	by outgoing2021.csail.mit.edu with esmtp (Exim 4.95)
	(envelope-from <nickolai@csail.mit.edu>)
	id 1xNBml-00Eg4I-4z;
	Sat, 31 Oct 2026 12:18:27 -0400
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
Subject: [PATCH v2 0/2] riscv: signal: fix the FP state restore in rt_sigreturn()
Date: Sat, 31 Oct 2026 12:18:24 -0400
Message-ID: <20261031161826.858908-1-nickolai@csail.mit.edu>
X-Mailer: git-send-email 2.53.0
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
with the signal handler's FP registers. Patch 1 fixes this, patch 2 adds
a selftest that reproduces it with userfaultfd.

Tested under QEMU with riscv64 defconfig plus CONFIG_USERFAULTFD: the
new test fails 10 of 10 runs on master, with preempt=lazy and
preempt=none, and passes 10 of 10 with patch 1, also on top of Guobin
Zhang's "riscv: signal: protect regs->status RMW from concurrent
preemption" v2 [1]; the two apply in either order.

This series was prepared with the help of an AI tool.

Changes in v2:
- Disable preemption around __fstate_clean() (Andy Chiu)
- Add a selftest (Andy Chiu)
- Shorten the commit message

v1: https://lore.kernel.org/all/20261016160708.790397-1-nickolai@csail.mit.edu/
[1] https://lore.kernel.org/all/20261020-vector_fpu_regs_status_rmw_fix-v2-1-474a59155e96@intel.com/

Nickolai Zeldovich (2):
  riscv: signal: mark the FP state clean before restoring it from the
    frame
  selftests: riscv: test FP state restore when rt_sigreturn() faults

 arch/riscv/kernel/signal.c                    |   7 +
 .../selftests/riscv/sigreturn/.gitignore      |   1 +
 .../selftests/riscv/sigreturn/Makefile        |   5 +-
 .../selftests/riscv/sigreturn/fp_restore.c    | 146 ++++++++++++++++++
 4 files changed, 158 insertions(+), 1 deletion(-)
 create mode 100644 tools/testing/selftests/riscv/sigreturn/fp_restore.c


base-commit: 36aad21d50d1af3f6954bb0c988257a908202477
-- 
2.53.0

