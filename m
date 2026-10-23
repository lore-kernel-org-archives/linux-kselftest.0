Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=115.124.30.113
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792754191;
	b=wgDFJMENJy2G5SNHtWE9Eid8lXvYcfGV+W7Z0Pfua/kGsgXL2TauO74p8ooAmU7tm/e+
	 Bsppj9GjjQF5anrc5iHlFXHAqTkUGq9sx6W+CZrVSTc8DiwSvQy2eBKWmClpm6J0osynm
	 eLvwKd1hp2VmEqQuYB0XcjQqnor+okP6jYfDZ9am1+x8MxJxG1NIqlhjzUxIS5ukXmh9y
	 cKDDPlRFLyuTD7bTAYYXucjeR5yEoaoVzQgrh6DUaM/1EbD0rA4zb40oZF/2mLbT6KjOc
	 Jr7aiGfzJiLDyzywFyFDaO1tqX9UHvShHt2OP9KsbP9HAAN5L0P25BjeeOhM89QF2Nw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792754191;
	h=DMARC-Filter:DKIM-Signature:X-Alimail-AntiSpam:Received:From:To:Cc:
	 Subject:Date:Message-ID:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding;
	bh=imLoQJ3Y32KZZxL6AOPIQXTmbB11pGW4JBEfVopbcl4=;
	b=JkpuwUjFADdVL79MqbGI7WO50HTUfJLO4jTswGHPZJZJ1NL0QrPdTcaKXnWPMKke1QvI
	 OWfbcv4zJ5i1KXT3MShxRlaA0qdEeMJtpMgPtEzzW9rn91TKEs4AIiKOIldn18xhX2PsZ
	 nYDPBZ6AQojEYTHyvX1DazSnaX+0IRFvxaOu5CURg+D3LkQz4zWlypemusnW80CGVp3eF
	 /yU2xoOnvYL9SzET81CdEd3haAFvnXDLN1rBBWUr0mcCdLFn0vHXSzL3HPYhCvybqA+CP
	 w9U1A4oOUYuuy/k+caQntkuVgBtj9YRST3fovr0+As40RRNmX9RK0B/r5ZRbK4MsBNQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=linux.alibaba.com;
	spf=pass smtp.mailfrom=linux.alibaba.com;
	dkim=pass header.d=linux.alibaba.com header.i=@linux.alibaba.com header.a=rsa-sha256 header.s=default header.b=L+WKoa4+;
	arc=none smtp.remote-ip=115.124.30.113
Received: from out30-113.freemail.mail.aliyun.com (out30-113.freemail.mail.aliyun.com [115.124.30.113])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1C6B9606A327;
	Fri, 23 Oct 2026 11:16:29 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 1C6B9606A327
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.alibaba.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.alibaba.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=linux.alibaba.com header.i=@linux.alibaba.com header.a=rsa-sha256 header.s=default header.b=L+WKoa4+
DKIM-Signature:v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=linux.alibaba.com; s=default;
	t=1792754181; h=From:To:Subject:Date:Message-ID:MIME-Version;
	bh=imLoQJ3Y32KZZxL6AOPIQXTmbB11pGW4JBEfVopbcl4=;
	b=L+WKoa4+sqQAAMD0SMhfEGdWljxODtB840uN/eFNgQ0wPNskzD6aqzZKpSHrN6nHDGenNMILEsgEA3twn20N/C/28J4ijTK+XOvP9vPc+MUpatsGnBGCN290G0HI9QCOp9gXxaTuUB4LapJVuaVIUczLUfnyBjgHAW66iCxHITc=
X-Alimail-AntiSpam:AC=PASS;BC=-1|-1;BR=01201311R141e4;CH=green;DM=||false|;DS=||;FP=0|-1|-1|-1|0|-1|-1|-1;HT=maildocker-contentspam033037026112;MF=cp0613@linux.alibaba.com;NM=1;PH=DS;RN=14;SR=0;TI=SMTPD_---0XDM1n3D_1792754172;
Received: from DESKTOP-S9E58SO.localdomain(mailfrom:cp0613@linux.alibaba.com fp:SMTPD_---0XDM1n3D_1792754172 cluster:ay36)
          by smtp.aliyun-inc.com;
          Fri, 23 Oct 2026 19:16:21 +0800
From: Chen Pei <cp0613@linux.alibaba.com>
To: pjw@kernel.org,
	palmer@dabbelt.com,
	alex@ghiti.fr,
	rppt@kernel.org,
	pasha.tatashin@soleen.com,
	pratyush@kernel.org,
	graf@amazon.com,
	shuah@kernel.org
Cc: guoren@kernel.org,
	linux-riscv@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	linux-mm@kvack.org,
	linux-kselftest@vger.kernel.org,
	kexec@lists.infradead.org
Subject: [PATCH 0/4] riscv: Enable kexec handover and live update
Date: Fri, 23 Oct 2026 19:16:08 +0800
Message-ID: <20261023111612.2134-1-cp0613@linux.alibaba.com>
X-Mailer: git-send-email 2.43.0
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

Host kernel updates in the cloud should not require draining the
machine: next to live migration to another host, replacing the kernel
in place while preserving selected workload state ("live update") is
what KHO/LUO were built for, and LUO's documentation names hypervisor
hosts as its primary use case. This series closes the gap for riscv64
and validates it with both upstream test runners.

KHO has been architecture independent since it was merged: the outgoing
kernel publishes the handover FDT and the scratch descriptor array in
the /chosen node of the DTB it builds for the incoming kernel, and the
incoming kernel collects both while scanning that node -- which is why
the arm64 integration (commit 274cdcb1c004) needed only three lines of
arch code.

RISC-V already walks those same generic paths (load_extra_segments() ->
of_kexec_alloc_and_setup_fdt(), parse_dtb() -> early_init_dt_scan()).
The one real blocker is ordering: setup_arch() runs early_ioremap_setup()
*after* parse_dtb(), so kho_populate()'s early_memremap() of the handover
FDT returns "offset + 0" -- NULL for a page aligned address -- and the
handover is dropped:

  KHO: setup: failed to memremap FDT (0x810bb000)
  KHO: disabling KHO revival

Patch 1 fixes that ordering, matching arm64/x86 and standing on its own
regardless of KHO. Patch 2 enables ARCH_SUPPORTS_KEXEC_HANDOVER as
"def_bool 64BIT && MMU" rather than arm64's "def_bool y":
ARCH_SUPPORTS_KEXEC_FILE is already 64BIT-only, and KEXEC_HANDOVER
selects CMA, which depends on MMU. Patches 3 and 4 teach the two
upstream vmtest runners about riscv64. LIVEUPDATE depends only on
KEXEC_HANDOVER, so patch 2 makes it selectable on riscv as well.

No DT schema changes are needed: linux,kho-fdt / linux,kho-scratch are
the properties arm64 introduced (commit 274cdcb1c004), and their
binding lives in the external dt-schema repository [1] rather than in
Documentation.

[1] https://github.com/devicetree-org/dt-schema/blob/main/dtschema/schemas/chosen.yaml

Test
----
Testing on qemu-system-riscv64 (virt, -cpu max, TCG); method and logs
under the --- of patches 3 and 4:
  - kho vmtest: "ok 1 KHO succeeded"
  - liveupdate vmtest, all four suites PASSED (simple, multi-session,
    500 files, 2000 sessions)
  - riscv defconfig with and without CONFIG_KEXEC_HANDOVER both boot to
    userspace unchanged; builds: riscv defconfig (+KHO), rv32_defconfig,
    arm64, x86_64

Additionally, a workload-continuity test was run on the same setup,
outside the selftests: a counter process was snapshot with criu 4.3,
the dump was carried across the kexec in an LUO-preserved memfd, and
criu restored it in the new kernel. The process resumed with the same
PID and open log file and kept counting from where it was dumped
(500006 -> 500007, no lost or duplicated ticks).

Chen Pei (4):
  riscv: Call early_ioremap_setup() before parsing the DTB
  riscv: Add support for kexec handover (KHO)
  selftests: kho: Add riscv support
  selftests: liveupdate: Add riscv support

 arch/riscv/Kconfig                                | 3 +++
 arch/riscv/kernel/setup.c                         | 2 +-
 tools/testing/selftests/kho/riscv.conf            | 9 +++++++++
 tools/testing/selftests/kho/vmtest.sh             | 3 ++-
 tools/testing/selftests/liveupdate/config.riscv64 | 3 +++
 tools/testing/selftests/liveupdate/run-vmtests.sh | 2 +-
 tools/testing/selftests/liveupdate/vmtest.sh      | 8 +++++++-
 7 files changed, 26 insertions(+), 4 deletions(-)
 create mode 100644 tools/testing/selftests/kho/riscv.conf
 create mode 100644 tools/testing/selftests/liveupdate/config.riscv64

-- 
2.50.1

