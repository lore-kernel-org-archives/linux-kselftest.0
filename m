Received: from out-182.mta1.migadu.com (out-182.mta1.migadu.com [95.215.58.182])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9677C39AD55
	for <linux-kselftest@vger.kernel.org>; Mon, 25 May 2026 06:28:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=95.215.58.182
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779690511; cv=none; b=c8IFQkUDkeKnGTJaMZNC4wf2d40HsxSoUi1Bxzg15791/KfMt77jKoqX7X56VOgJGaW+WCvci3XbACix7zAikp8ZCUu+9Vynpc9WeaSS0NqJKsrIsbwOwm/Dgzi04WqGQ4czZJIHaAyL+qMiDs3Sj4ibUngAy7G/NGw7fna4u+A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779690511; c=relaxed/simple;
	bh=GIOu+GB+XnyDhaPnCV12/4ERanlq1RJsgTIJ0ee2x9c=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=iovfQEWw+v+M9o935+9hhN9u6Uvrfos0OuBoxmKsE179oShljDA2bwOcunV9nQhWpBVxqvDCX27mhlRGYmyExsK0IAy0L2oOHp5XEb2yrhKZ6dhyELnLLcCW1oOahu3pbdAH1TChg95arTK+EjdaMilijtVVsuiVHG4h3CdXVLY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev; spf=pass smtp.mailfrom=linux.dev; dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b=IIr3jMS+; arc=none smtp.client-ip=95.215.58.182
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b="IIr3jMS+"
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.dev; s=key1;
	t=1779690497;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding;
	bh=hIRi3HO9e8xA8aknZ+Hmyg9qLaGWZHy9zhx8wJx1Ids=;
	b=IIr3jMS+wd34Awp2PESkNwbtIVAd+PlWxSlG7OC5DEjyjpcqSEGLbiw8523AvvMPLjdbqo
	CjeS0Nnk6q1Kaqdn0L0rv13USlnXLplGl//9Cqz6+d65uyv5Ei7w9OvQVTRHFhvZmhqxdS
	/ykMAAqLGv18mjCxo0qCjhE5lwvUY4M=
From: George Guo <dongtai.guo@linux.dev>
To: chenhuacai@kernel.org,
	rppt@kernel.org,
	pasha.tatashin@soleen.com,
	pratyush@kernel.org
Cc: kernel@xen0n.name,
	graf@amazon.com,
	shuah@kernel.org,
	loongarch@lists.linux.dev,
	kexec@lists.infradead.org,
	linux-mm@kvack.org,
	linux-kselftest@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	George Guo <guodongtai@kylinos.cn>
Subject: [PATCH 0/7] LoongArch: add KHO support and selftests
Date: Mon, 25 May 2026 14:28:03 +0800
Message-Id: <20260525062810.103367-1-dongtai.guo@linux.dev>
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Migadu-Flow: FLOW_OUT

From: George Guo <guodongtai@kylinos.cn>>

This series adds Kexec Handover (KHO) support for LoongArch64 and
extends the KHO selftest infrastructure to run on LoongArch under QEMU.

KHO support (patches 1-2)
--------------------------
Patch 1 wires up the three pieces needed for KHO on LoongArch:
 - Kconfig: select ARCH_SUPPORTS_KEXEC_HANDOVER for 64BIT
 - machine_kexec_file: call cmdline_add_kho() to pass the KHO FDT and
   scratch buffer addresses via "kho_handover=" on the kernel cmdline
 - setup: parse "kho_handover=" early and call kho_populate()

Patch 2 fixes a duplicate-parameter bug when kexec is invoked with
--reuse-cmdline: the running kernel's cmdline already contains a stale
kho_handover= from the previous load.  load_other_segments() prepends a
fresh entry but appends the original cmdline verbatim, so early_param()
calls kho_populate() twice and the second call overwrites the first with
a stale FDT pointer, panicking early in mm_core_init().

Bug fixes (patches 3-4)
------------------------
Patch 3 fixes a build failure with CONFIG_KFENCE=y: virt_to_phys() and
phys_to_virt() in asm/io.h expand to use offset_in_page() and
page_address(), which require <linux/mm.h> that was not included.

Patch 4 moves KEXEC_CONTROL_CODE from 0x100000 to 0x180000.  QEMU
places its machine FDT at 0x100000 when booting with '-kernel'; the
previous placement silently overwrote the FDT with the relocation
trampoline, breaking earlycon in the kexec'd kernel.

Selftest support (patches 5-7)
-------------------------------
Patch 5 adds loongarch.conf and extends vmtest.sh to recognise
loongarch64 as a build target.  QEMU's LoongArch virt machine is
FDT-only (no ACPI), so 'earlycon' must appear on the kernel cmdline or
the console UART is never discovered and the test log stays empty.

Patch 6 disables SERIO_I8042 and its dependents in the QEMU_KCONFIG
fragment.  QEMU's LoongArch virt machine has no i8042 controller; the
fallback port probe hits a page fault on the memory-mapped I/O range and
panics before reaching userspace.

Patch 7 polls the serial output for the test verdict and kills QEMU once
it appears.  QEMU provides no EFI runtime services on LoongArch, so
machine_restart() falls through to an infinite idle loop and QEMU never
exits after kexec.


George Guo (7):
  LoongArch: Add KHO basic support
  LoongArch: kho: strip stale kho_handover= from reused cmdline
  LoongArch: Add missing linux/mm.h include in asm/io.h
  LoongArch: kexec: avoid overwriting QEMU's machine FDT at 0x100000
  selftests/kho: add LoongArch vmtest support
  selftests/kho: LoongArch: disable PS/2 input devices for QEMU virt
  selftests/kho: handle QEMU not exiting after kexec on LoongArch

 arch/loongarch/Kconfig                     |  3 ++
 arch/loongarch/include/asm/io.h            |  1 +
 arch/loongarch/kernel/machine_kexec.c      |  9 +++-
 arch/loongarch/kernel/machine_kexec_file.c | 57 ++++++++++++++++++++++
 arch/loongarch/kernel/setup.c              | 27 ++++++++++
 tools/testing/selftests/kho/loongarch.conf | 10 ++++
 tools/testing/selftests/kho/vmtest.sh      | 38 ++++++++++++---
 7 files changed, 135 insertions(+), 10 deletions(-)
 create mode 100644 tools/testing/selftests/kho/loongarch.conf

-- 
2.25.1

