Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=113.46.200.216
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795680332;
	b=W0vbwGsMRgThjTGIAVfb/1ZrpUv9bDPBR+ivr82GIBlcukacgJ8EV3Sh1lPNRGlj5BTP
	 BDmL4HRlj3ObgvfPKmJn7ye5adVHrjG7wVPHBKnTLpO03/y24oMDw4wwPmoqWYp+PNdb9
	 P8e4ASGH1hJ7vZxN9uZYy+j3NtYm1+c4dUjIhXemQyIbPQwoCTEZiOsCZFk8hCiBAZN5F
	 iXDgFRcFj8DrX+d2IOkedF0foW8abYv0hej3ZILqc4+cjVk/k71YKSwbeAVV08wXxb8Yl
	 137H02YD5LGxPqLrjle1LcahbjnZ5bhIoaWfLTk8Xkn1EcNsTndTteIcaPAfXQHNV1w==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795680332;
	h=DMARC-Filter:dkim-signature:Received:Received:Received:From:To:CC:
	 Subject:Date:Message-ID:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding:Content-Type:X-Originating-IP:
	 X-ClientProxiedBy;
	bh=q/V4IUszpazd8BoTzUiOrvt4bOc1nZAchjVHwkWLl8s=;
	b=b1KzZuQzu8ofh8QSiP0fn8CIjZpX9Ym/ki/mqE5cN8lZWnxto9cKogIGjfNQCUNELxlr
	 Kz6Qn81bGQpZcanqOeSFKVZRo3VUkbv9BnkpNZ42GYC0EjMJBx4gZYbCssr4Tsa0SD5vc
	 K526zMS1oLLgQubrMqv3oMUSmIfTFY2ZQq5KrPhGf9THfwxRDtl27X8ELuls6/SY3fjmf
	 pdLW97NVw4DLKmVnPcU8/g+ygxzWnCMQQL/H2/QZSque3HalGcRie0nL3R4WTSpjuWxaU
	 z1BSOfkztpC5vlPBpbvvmGHBsZAVD5Di3S3wxNYgm8xOrn1Bauq8ZBRIaWkpXk6nLnQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=huawei.com;
	spf=pass smtp.mailfrom=huawei.com;
	dkim=pass header.d=huawei.com header.i=@huawei.com header.a=rsa-sha256 header.s=dkim header.b=cTwEr1R6;
	arc=none smtp.remote-ip=113.46.200.216
Received: from canpmsgout01.his.huawei.com (canpmsgout01.his.huawei.com [113.46.200.216])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8275D606A31E;
	Thu, 26 Nov 2026 08:05:31 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 8275D606A31E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=huawei.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=huawei.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=huawei.com header.i=@huawei.com header.a=rsa-sha256 header.s=dkim header.b=cTwEr1R6
dkim-signature: v=1; a=rsa-sha256; d=huawei.com; s=dkim;
	c=relaxed/relaxed; q=dns/txt;
	h=From;
	bh=q/V4IUszpazd8BoTzUiOrvt4bOc1nZAchjVHwkWLl8s=;
	b=cTwEr1R6Yi7F3BNvJDxreEUGdbVfS9VlYIBiouaPVMBBLfLPlbFH8FHa8EIQztVAxqypki4ip
	YvKt8hTQGE94N6GOWUJ13eAKZHbIJikMDd8Ra3wAmpR3sBErVROkvoDjCO0b/Vd2uTcduBgD9kd
	QxTyqxTOu4/QiLNfkylC8jA=
Received: from mail.maildlp.com (unknown [172.19.163.0])
	by canpmsgout01.his.huawei.com (SkyGuard) with ESMTPS id 4jZpwx0L5vz1T4Fv;
	Thu, 26 Nov 2026 16:04:33 +0800 (CST)
Received: from kwepemk200008.china.huawei.com (unknown [7.202.194.74])
	by mail.maildlp.com (Postfix) with ESMTPS id 21E1240561;
	Thu, 26 Nov 2026 16:05:24 +0800 (CST)
Received: from huawei.com (10.90.53.73) by kwepemk200008.china.huawei.com
 (7.202.194.74) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.45; Thu, 26 Nov
 2026 16:05:23 +0800
From: Jinjie Ruan <ruanjinjie@huawei.com>
To: <oleg@redhat.com>, <linusw@kernel.org>, <catalin.marinas@arm.com>,
	<will@kernel.org>, <mark.rutland@arm.com>, <shuah@kernel.org>,
	<mathieu.desnoyers@efficios.com>, <linux-arm-kernel@lists.infradead.org>,
	<linux-kernel@vger.kernel.org>, <linux-kselftest@vger.kernel.org>
CC: <ruanjinjie@huawei.com>
Subject: [PATCH 0/3] arm64: ptrace: Fix two old bugs
Date: Thu, 26 Nov 2026 16:05:11 +0800
Message-ID: <20261126080514.1523978-1-ruanjinjie@huawei.com>
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
Content-Type: text/plain
X-ClientProxiedBy: kwepems500002.china.huawei.com (7.221.188.17) To
 kwepemk200008.china.huawei.com (7.202.194.74)

As Linus suggested, extract the two ptrace bugfix patch and related
selftests from the patch set of the generic entry patchset[1].

The bugfix were found when switching from arm64 to generic entry, the
fixes are simple but there are many selftests:

- Drop redundancy spurious pseudo-single-step for
  PTRACE_SYSEMU_SINGLESTEP.

- Check whether the syscall is in rseq critical section before
  reporting syscall exit.

- Add related selftests. Because there are currently two related bug
  fixes from long ago that lack self testcases, which are commit ac2081cdc4d99
  ("arm64: ptrace: Consistently use pseudo-singlestep exceptions") and
  commit 3a5a4366cecc ("arm64: ptrace: Override SPSR.SS when
  single-stepping is enabled")

Very welcome any discussion and feedback.

Changes in v1:
- Rebased on v7.4-rc3
- Add real hardware test in commit message.
- Fix selftest AI review issues [2].

[1]: https://lore.kernel.org/all/20261111114225.3977243-1-ruanjinjie@huawei.com/
[2]: https://sashiko.dev/#/patchset/20261111114225.3977243-1-ruanjinjie%40huawei.com

Jinjie Ruan (3):
  arm64: ptrace: Fix spurious pseudo-single-step for
    PTRACE_SYSEMU_SINGLESTEP
  arm64: ptrace: Check rseq critical section before reporting syscall
    exit
  selftests/arm64: Add ptrace single-step and rseq syscall-exit tests

 arch/arm64/kernel/ptrace.c                    |  16 +-
 tools/testing/selftests/arm64/Makefile        |   2 +-
 .../testing/selftests/arm64/ptrace/.gitignore |   6 +
 tools/testing/selftests/arm64/ptrace/Makefile |  15 ++
 .../selftests/arm64/ptrace/ptrace_common.h    | 159 ++++++++++++++
 .../selftests/arm64/ptrace/rseq_syscall_pc.c  | 197 ++++++++++++++++++
 .../selftests/arm64/ptrace/rseq_syscall_pc.h  |  22 ++
 .../arm64/ptrace/rseq_syscall_pc_asm.S        |  45 ++++
 .../arm64/ptrace/single_step_signal_handler.c | 121 +++++++++++
 .../arm64/ptrace/single_step_spsr_ss.c        |  79 +++++++
 .../arm64/ptrace/single_step_syscall_stop.c   | 103 +++++++++
 .../arm64/ptrace/sysemu_singlestep.c          | 141 +++++++++++++
 12 files changed, 902 insertions(+), 4 deletions(-)
 create mode 100644 tools/testing/selftests/arm64/ptrace/.gitignore
 create mode 100644 tools/testing/selftests/arm64/ptrace/Makefile
 create mode 100644 tools/testing/selftests/arm64/ptrace/ptrace_common.h
 create mode 100644 tools/testing/selftests/arm64/ptrace/rseq_syscall_pc.c
 create mode 100644 tools/testing/selftests/arm64/ptrace/rseq_syscall_pc.h
 create mode 100644 tools/testing/selftests/arm64/ptrace/rseq_syscall_pc_asm.S
 create mode 100644 tools/testing/selftests/arm64/ptrace/single_step_signal_handler.c
 create mode 100644 tools/testing/selftests/arm64/ptrace/single_step_spsr_ss.c
 create mode 100644 tools/testing/selftests/arm64/ptrace/single_step_syscall_stop.c
 create mode 100644 tools/testing/selftests/arm64/ptrace/sysemu_singlestep.c

-- 
2.34.1

