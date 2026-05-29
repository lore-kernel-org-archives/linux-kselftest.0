Received: from out-181.mta0.migadu.com (out-181.mta0.migadu.com [91.218.175.181])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 148E43ED3BA
	for <linux-kselftest@vger.kernel.org>; Fri, 29 May 2026 14:33:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=91.218.175.181
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780065210; cv=none; b=p+cQIm4cpILlLBDqdZ4VhdRqzcOBvCzYWD3sovjBKBppq4C5UvMSgVrFt9GM32LMkKJnQTLjUEGJzgUhWz67XtUbnF4g7gVNBlgwzVG3YJG/Uq8YK9aW2v2SPJlb6LPTuoBwCbwy3Foy0ek2cHlfOlntwZx/gPCFAAtPZ4dZhuc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780065210; c=relaxed/simple;
	bh=SjXyUPuAqyq4xe/evwf4lnTr+bkuOPszI8NNSSibzbo=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=JgsP5l5FlhxWb4fAty61LFgS7l0RqbNhzQyiR/c10oCHu3mT25zDmR+jGPR6QQXEc+oZiWO0Wn6wR8GrXN6e4wi49ptpwVRYbVRbkGnva4pjgCq7p44dU1XxxtwIiYYGlCK6S6FW0+ePSAM91mDF7IUP3YWSa5UEuFXg90eSICI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev; spf=pass smtp.mailfrom=linux.dev; dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b=DZjSulJ9; arc=none smtp.client-ip=91.218.175.181
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b="DZjSulJ9"
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.dev; s=key1;
	t=1780065197;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding;
	bh=eyl+ehBlxBHsDx62eFKFPSNCgRZqAc+bGbUbiW2nOz8=;
	b=DZjSulJ961TsPjzS3b+q4BFKgAd2C05gQOdDZlFa763xRuqKnpXByoSAiGELafch2Gl9Kv
	a95Tb6wB1z6MyzZmazv2suEs0dzCNZXvCgB+d6bqsw3Q1BKGdhe+v4YwAwSUKtgWfvVjVU
	ZohlUO6R3CXU3BR5GBu46ZASDoyT5Zo=
From: George Guo <dongtai.guo@linux.dev>
To: Huacai Chen <chenhuacai@kernel.org>,
	Mike Rapoport <rppt@kernel.org>,
	Pasha Tatashin <pasha.tatashin@soleen.com>,
	Pratyush Yadav <pratyush@kernel.org>,
	Shuah Khan <shuah@kernel.org>
Cc: WANG Xuerui <kernel@xen0n.name>,
	Alexander Graf <graf@amazon.com>,
	loongarch@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	kexec@lists.infradead.org,
	linux-mm@kvack.org,
	linux-kselftest@vger.kernel.org,
	George Guo <guodongtai@kylinos.cn>
Subject: 
Date: Fri, 29 May 2026 22:32:34 +0800
Message-Id: <20260529143238.169169-1-dongtai.guo@linux.dev>
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
ERROR: Invalid commit separator - some tools may have problems applying this
Content-Transfer-Encoding: 8bit
X-Migadu-Flow: FLOW_OUT

From: George Guo <guodongtai@kylinos.cn>

WARNING: Prefer a maximum 75 chars per line (possible unwrapped commit description?)
#26: 
containing only /chosen with the two KHO properties.  Since DEVICE_TREE_GUID

ERROR: Invalid commit separator - some tools may have problems applying this
#34: 
-------------------------------

total: 2 errors, 1 warnings, 0 lines checked
>
Date: Fri, 29 May 2026 21:54:01 +0800
Subject: [PATCH v2 0/4] LoongArch: add KHO support and selftests

This series adds Kexec Handover (KHO) support for LoongArch and extends
the KHO selftest infrastructure to run on LoongArch under QEMU.

KHO passes metadata (the KHO state FDT and scratch area addresses) to the
second kernel via the FDT /chosen node, using the linux,kho-fdt and
linux,kho-scratch properties that drivers/of/kexec.c:kho_add_chosen()
writes and drivers/of/fdt.c:early_init_dt_check_kho() reads.

KHO support (patches 1-2):

Patch 1 adds KHO support for FDT-based systems (initial_boot_params !=
NULL, e.g. QEMU virt without OVMF).  kho_load_fdt() copies the running
kernel's FDT, appends linux,kho-fdt and linux,kho-scratch to /chosen,
and loads the result as a kexec segment.  machine_kexec() updates the
DEVICE_TREE_GUID entry in the EFI config table to point to this segment
so the second kernel's fdt_setup() can find and parse it.

Patch 2 adds KHO support for ACPI-only systems (initial_boot_params ==
NULL, e.g. LoongArch servers with UEFI or QEMU with OVMF).  Because no
system FDT is available, kho_load_fdt() builds a minimal FDT from
scratch containing only /chosen with the two KHO properties.  Since
DEVICE_TREE_GUID is absent from the EFI config table on ACPI-only
systems, a new extended config table is built with the entry appended
and loaded as a kexec segment; machine_kexec() switches st->tables to
point to it before jumping.  The second kernel's fdt_setup() calls
efi_fdt_pointer() to detect the KHO FDT and passes it to
early_init_dt_check_kho().

Selftest support (patches 3-4):

Patch 3 adds loongarch.conf and extends vmtest.sh to recognise loongarch64
as a build target.  The LoongArch virt machine is FDT-only (no ACPI), so
'earlycon' must appear on the kernel cmdline or the console UART is never
discovered.  PS/2 input devices are also disabled since QEMU's LoongArch
virt machine has no i8042 controller; the fallback port probe hits a page
fault and panics before reaching userspace.

Patch 4 handles QEMU not exiting after kexec on LoongArch.  QEMU provides
no EFI runtime services, so machine_restart() falls through to an infinite
idle loop.  QEMU_NEEDS_KILL=1 in loongarch.conf signals vmtest.sh to run
QEMU in the background, poll the serial output for the test verdict, and
kill QEMU once it appears, so the test completes unattended.

George Guo (4):
  LoongArch: kexec: add KHO support for FDT-based systems
  LoongArch: kexec: add KHO support for ACPI-only systems
  selftests/kho: add LoongArch vmtest support
  selftests/kho: handle QEMU not exiting after kexec on LoongArch

 arch/loongarch/Kconfig                     |   3 +
 arch/loongarch/include/asm/kexec.h         |   7 +
 arch/loongarch/kernel/machine_kexec.c      |  38 +++
 arch/loongarch/kernel/machine_kexec_file.c | 256 +++++++++++++++++++++
 arch/loongarch/kernel/setup.c              |  21 +-
 tools/testing/selftests/kho/loongarch.conf |  13 ++
 tools/testing/selftests/kho/vmtest.sh      |  35 ++-
 7 files changed, 365 insertions(+), 8 deletions(-)
 create mode 100644 tools/testing/selftests/kho/loongarch.conf

-- 
2.25.1

