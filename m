Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=128.30.2.78
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794796541;
	b=piHM5UMD9Sy4HYLq8dnAoCRmAhpYaNw8wg5oMe76BJalH5G3CjyT3jYgRkCAB1KEOp01
	 RSZfPJffsSFIBd6x1NqPvXdERF58jD91trrOdZOQkL+j+R9ex3dVRmQeWPOrtyS3EDQwP
	 A8hdJUdD+eMahcaycArHFRWM0PY1Dq0w+5NsqThc+J0lO8sY45KwEYA4BB0VGvD04wvKJ
	 h+ncGqJ0wuPskoZ8r/SCJc2J4pUBoKy/4dtDRlW12RitsaB+8WHkolSEwDllhJY9tunr6
	 gkIet6BEIraVF3J5PvBc27zwyRvu1RAfE7vgaGSGQ3SCFJ+cCS5/8ZS9NYTVPcmMXcQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794796541;
	h=DMARC-Filter:Received:From:To:Cc:Subject:Date:Message-ID:X-Mailer:
	 MIME-Version:Content-Transfer-Encoding;
	bh=/1nfez8rEGBZkiN7A3tsIGU96VfDaysyNnOZ7JlI17I=;
	b=pzQZ+aObfcn80PY0mvb32ba0JZEfMoEenzSVMcEj/zk6jej58zPdW6HjlnHrV4sA18tS
	 IwK5eWDD6rZZThOw1lU0Z3RQUWCB3rfeKSLgzW5pareLvbMtOR2TfusknVB7N/+c4+sab
	 1Ue5OOqsVnE+pPAB9zzml+r8BN3fS6nz9qv0cv27GGa73Imt1dvut08TbHTgtB8hPwA4z
	 HPW/GETqfcPjsYWGMZJNH8VOYrdEIgLGMDLKU8P87/OlqXZCJA5IHtMuC5P3HKi3+VeZu
	 yMXxryR2q7qGkEsV+4Ap+pzL0/6Dv9NU+OJX5A22t6uomUUNQ8Y7JGvtPKdCEcv1fzQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=csail.mit.edu;
	spf=pass smtp.mailfrom=csail.mit.edu;
	arc=none smtp.remote-ip=128.30.2.78
Received: from outgoing2021.csail.mit.edu (outgoing2021.csail.mit.edu [128.30.2.78])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0B4C0606A323;
	Mon, 16 Nov 2026 02:35:39 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 0B4C0606A323
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=csail.mit.edu
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=csail.mit.edu
Received: from escalante.csail.mit.edu ([128.52.128.198])
	by outgoing2021.csail.mit.edu with esmtp (Exim 4.95)
	(envelope-from <nickolai@csail.mit.edu>)
	id 1xSmZC-004DmY-Px;
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
Subject: [PATCH v3 0/2] riscv: signal: fix the FP state restore in rt_sigreturn()
Date: Sun, 15 Nov 2026 21:35:32 -0500
Message-ID: <20261116023534.50074-1-nickolai@csail.mit.edu>
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
new test, built with GCC 15 through the kselftest Makefile and with
clang 21, fails 10 of 10 runs without patch 1 and passes 10 of 10 with
it.

This series was prepared with the help of an AI tool.

Changes in v3:
- selftest: load the tgkill() arguments inside the asm statement. v2
  bound them to local register variables, which GCC does not keep
  across the sigaltstack() call before the asm, so the signal was never
  sent and the test failed with or without patch 1 (Andy Chiu).
- Rebased onto v7.4-rc3.

v2: https://lore.kernel.org/all/20261031161826.858908-1-nickolai@csail.mit.edu/
v1: https://lore.kernel.org/all/20261016160708.790397-1-nickolai@csail.mit.edu/

Nickolai Zeldovich (2):
  riscv: signal: mark the FP state clean before restoring it from the
    frame
  selftests: riscv: test FP state restore when rt_sigreturn() faults

 arch/riscv/kernel/signal.c                    |   7 +
 .../selftests/riscv/sigreturn/.gitignore      |   1 +
 .../selftests/riscv/sigreturn/Makefile        |   5 +-
 .../selftests/riscv/sigreturn/fp_restore.c    | 147 ++++++++++++++++++
 4 files changed, 159 insertions(+), 1 deletion(-)
 create mode 100644 tools/testing/selftests/riscv/sigreturn/fp_restore.c


base-commit: aebb7274476403040d582c61478df8f4a7bf9cd3
-- 
2.53.0

