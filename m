Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=115.124.30.100
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793949309;
	b=MvzYtOnmMXUTrlVHIb1AfrSDywByD2HEHqrkA/DNvhz3/2FhGMm9XFUYdVEKu2IPoIBn
	 vnHHLvRV9bShuDef2/1HIimyf1uh/YNNlc8ESV86PkRNIG8yNGf8lOK87Ieth/C1M71nm
	 Hy7R7Q1sezaQfae9kpDLRK+jmpo1ymlHXdU/2IIL1s8aO+Fg56eLYhveglp9TVBuIjgN1
	 efFtzp58zuNvFW94GuqUk28SRRaPNpVlqYD0IobbuVVpsdgpBi5Fm/Ja2uvG52tRnacTK
	 cKSXkB6xNcnlK82XxtFhpvUmTVeZaOA4tYSoR9/RLfmR2xGGaMEv50rdRfL4ByslrUw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793949309;
	h=DMARC-Filter:DKIM-Signature:X-Alimail-AntiSpam:Received:From:To:Cc:
	 Subject:Date:Message-ID:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding;
	bh=Bi1Umej3UF4Ax9j2KGl5zOTvpdxOlN8avyZ39eWeMGs=;
	b=ClzUGeymtPm+kA5t3zt9mEPQH6ppVCMeh0NS51H9+gAZ1hHzWJQVqu6MrznzgyFEb9HZ
	 okEnG094HbK86qFjEzPi5+jAP2qkE7u0Ld+DRFrsZTiQOSq6/PdGJ4ZbGbDnbGEeR9P5B
	 in+ETdLzvzhHAivRx+lvI8Nw2brau+ia75qtwDWW/KiB2W/ZjqNrEbRSo3+bAagoxy09z
	 lfHT27V15a7YbZOxAA0xV6BZhD5t0FxyjSqzXKBRcOTYKf9KbB+hnq2HNGeuPMV1lF4rK
	 xhS7dVOocwe78WAYe/VgeplsxwJ8JCjxmmrILU6BUAhclN66uNRVh3+ppAlDxqdKjoA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=linux.alibaba.com;
	spf=pass smtp.mailfrom=linux.alibaba.com;
	dkim=pass header.d=linux.alibaba.com header.i=@linux.alibaba.com header.a=rsa-sha256 header.s=default header.b=qeJpSyEC;
	arc=none smtp.remote-ip=115.124.30.100
Received: from out30-100.freemail.mail.aliyun.com (out30-100.freemail.mail.aliyun.com [115.124.30.100])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0E51B606D803;
	Fri,  6 Nov 2026 07:15:06 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 0E51B606D803
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.alibaba.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.alibaba.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=linux.alibaba.com header.i=@linux.alibaba.com header.a=rsa-sha256 header.s=default header.b=qeJpSyEC
DKIM-Signature:v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=linux.alibaba.com; s=default;
	t=1793949304; h=From:To:Subject:Date:Message-ID:MIME-Version;
	bh=Bi1Umej3UF4Ax9j2KGl5zOTvpdxOlN8avyZ39eWeMGs=;
	b=qeJpSyEC0rtOQjFs4B0uPLRSJ/qVYJjXe0u60dN4ksjCnPEzgErkz3gjxoeACsVv0vTDBhIKTOXJiZ0AetMWLeaD3BbNCS1EInfjJui/scP7BfB8DPu6kTHOBSjuJNy7WZgYT8Ut9jNseWMu0cBEIn5y5LxZtuqR+d7nTrvlmWU=
X-Alimail-AntiSpam:AC=PASS;BC=-1|-1;BR=01201311R151e4;CH=green;DM=||false|;DS=||;FP=0|-1|-1|-1|0|-1|-1|-1;HT=maildocker-contentspam033037026112;MF=cp0613@linux.alibaba.com;NM=1;PH=DS;RN=14;SR=0;TI=SMTPD_---0XEAtjKg_1793949299;
Received: from DESKTOP-S9E58SO.localdomain(mailfrom:cp0613@linux.alibaba.com fp:SMTPD_---0XEAtjKg_1793949299 cluster:ay36)
          by smtp.aliyun-inc.com;
          Fri, 06 Nov 2026 15:15:03 +0800
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
Subject: [PATCH v3 0/4] riscv: Enable kexec handover and live update
Date: Fri,  6 Nov 2026 15:14:55 +0800
Message-ID: <20261106071459.2003-1-cp0613@linux.alibaba.com>
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
machine: next to live migration to another host, replacing the kernel in
place while preserving selected workload state ("live update") is what
KHO/LUO were built for, and LUO's documentation names hypervisor hosts as
its primary use case. This series closes the gap for riscv64 and
validates it with both upstream test runners.

KHO has been architecture independent since it was merged: the outgoing
kernel publishes the handover FDT and the bootmem descriptor array in
the /chosen node of the DTB it builds for the incoming kernel, and the
incoming kernel collects both while scanning that node -- which is why
the arm64 integration (commit 274cdcb1c004) needed only three lines of
arch code.

RISC-V already walks those generic paths. The blocker is ordering:
setup_arch() runs early_ioremap_setup() after parse_dtb(), so the early
mapping kho_populate() needs for the handover FDT is not set up yet and
the handover is dropped. Patch 1 fixes that ordering, matching arm64 and
x86, and stands on its own regardless of KHO. Patch 2 enables
ARCH_SUPPORTS_KEXEC_HANDOVER as "def_bool 64BIT && MMU" rather than
arm64's "def_bool y": ARCH_SUPPORTS_KEXEC_FILE is already 64BIT only, and
KEXEC_HANDOVER selects CMA, which depends on MMU. LIVEUPDATE depends only
on KEXEC_HANDOVER, so patch 2 makes it selectable on riscv as well.
Patches 3 and 4 teach the two upstream vmtest runners about riscv64.

This series depends on Greg Thelen's fix to is_kho_boot() [1].

No DT schema changes are needed: linux,kho-fdt / linux,kho-bootmem are
the properties arm64 introduced (commit 274cdcb1c004), and their binding
lives in the external dt-schema repository [2] rather than in
Documentation.

[1] https://lore.kernel.org/all/20261023054518.3258350-1-gthelen@google.com
[2] https://github.com/devicetree-org/dt-schema/blob/main/dtschema/schemas/chosen.yaml

Changes since v2:
 - Dropped "kho: Do not translate the handover FDT address in
   is_kho_boot()", which Greg Thelen's [1] does as well.
 - Commit messages cut back to the reason for the change.
 - Rebased onto linux-next-20261105 (ddfe51b0a0f5).

Changes since v1:
 - New patch 1: kho: Do not translate the handover FDT address in
   is_kho_boot(), a generic fix the riscv enablement needs.
 - Rebased onto linux-next-20261102 (2637bdec0535).

Test
----
Testing on linux-next-20261105 (ddfe51b0a0f5) with qemu-system-riscv64
(virt, -cpu max, TCG); method and logs under the --- of patches 3 and 4:
  - kho vmtest: "ok 1 KHO succeeded", Totals pass:1 fail:0
  - liveupdate vmtest, all four suites passed one by one (simple,
    multi-session, 500 files, 2000 sessions)
  - riscv defconfig with and without CONFIG_KEXEC_HANDOVER both boot to
    userspace with no oops on the console; builds: riscv defconfig
    (+KHO), rv32_defconfig, arm64 defconfig (+KHO), x86_64 defconfig
    (+KHO)
  - UEFI handover boot (edk2 on pflash over OpenSBI fw_dynamic,
    DEBUG_VIRTUAL=y): with [1] applied, 32 consecutive handovers and no
    BUG; without it the first handover dies in
    linear_mapping_pa_to_va()

Additionally, a workload-continuity test was run outside the selftests:
a counter process was snapshot with criu 4.3, the dump was carried
across the kexec in an LUO-preserved memfd, and criu restored it in the
new kernel. The process resumed with the same PID and open log file and
kept counting from where it was dumped (500007 -> 500008, no lost or
duplicated ticks).


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


base-commit: ddfe51b0a0f5dc9e415cc2c8ad8db17532dd426b
-- 
2.50.1

