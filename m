Received: from out-186.mta0.migadu.com (out-186.mta0.migadu.com [91.218.175.186])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 294F918FC97
	for <linux-kselftest@vger.kernel.org>; Mon,  1 Jun 2026 09:28:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=91.218.175.186
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780306141; cv=none; b=IhrxnDKupZs5Ae08UvptOIihGWUNgAQDsNWLDPV3Li30+SSipL1HKk1W+j7iWjsQ6sybz9W/jZVh48iqhbav4udklympqBHkFBVsplMIRqQyaCFylIVKp2j5PPa9yaZLXX/VIRm+2iPxrHO4xGtBuYtOY5aokcUo4nuRojFtTKk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780306141; c=relaxed/simple;
	bh=CqKfad+2TXBowfjWkNJ/8et34wmy9C6mL+x/1Jr1+Gs=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=hmZlDm0ckxt01/5VKhrlE/LDY1xLCo6ykLVy55ZnGxbWZEY60myp7Kq1p+LyFs6+SROdIBfCpPFMz/PeVYe83JY4ZSlI68Bw8YPD1EiAA1TJv9kD2xdBwfNqTtIdp6BmgY27qNFYIEp8WiAuTeFPhbkA3kOpfkFMYZYVRrYZD+M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev; spf=pass smtp.mailfrom=linux.dev; dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b=G1yanIRS; arc=none smtp.client-ip=91.218.175.186
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b="G1yanIRS"
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.dev; s=key1;
	t=1780306128;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding;
	bh=g29uDzwGW0NTcSuFfWko8xrjZg7XxEg7NOcp6XGp35E=;
	b=G1yanIRS6yXPZoIwX1L76zEI/J+Uwmu2iCm4414ti+w1YVL+TEmhRDZxnTfDwVpz4RQ1Ks
	RgQds/2HYs8jVcZzx93YbUarTOCWkNz5RANvpCjGdcmpwLQstUfaAmlYGrb2E27rjO/Dna
	OiiPa7ufzdr9fGuygNemUGjCcQ/nspc=
From: George Guo <dongtai.guo@linux.dev>
To: Huacai Chen <chenhuacai@kernel.org>,
	Mike Rapoport <rppt@kernel.org>,
	Pasha Tatashin <pasha.tatashin@soleen.com>,
	Pratyush Yadav <pratyush@kernel.org>,
	Shuah Khan <shuah@kernel.org>
Cc: George Guo <guodongtai@kylinos.cn>,
	WANG Xuerui <kernel@xen0n.name>,
	Alexander Graf <graf@amazon.com>,
	loongarch@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	kexec@lists.infradead.org,
	linux-mm@kvack.org,
	linux-kselftest@vger.kernel.org
Subject: [PATCH v3 0/3] LoongArch: add KHO support and selftests
Date: Mon,  1 Jun 2026 17:28:20 +0800
Message-Id: <20260601092823.110362-1-dongtai.guo@linux.dev>
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Migadu-Flow: FLOW_OUT

From: George Guo <guodongtai@kylinos.cn>

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

Selftest support (patch 3):

Patch 3 adds loongarch.conf and extends vmtest.sh to recognise loongarch64
as a build target.  The LoongArch virt machine is FDT-only (no ACPI), so
'earlycon' must appear on the kernel cmdline or the console UART is never
discovered.  PS/2 input devices are disabled since QEMU's LoongArch virt
machine has no i8042 controller; the fallback port probe hits a page fault
and panics before reaching userspace.  QEMU provides no EFI runtime
services on LoongArch, so machine_restart() falls through to an infinite
idle loop after kexec; QEMU_TIMEOUT=120 in loongarch.conf lets timeout(1)
terminate QEMU once the time limit is reached.

Changes in v3:
- Merge selftest patches 3 and 4 from v2 into a single patch
- Replace QEMU_NEEDS_KILL/background kill loop with QEMU_TIMEOUT/timeout(1);
  the timeout value is set per-arch in the conf file.

George Guo (3):
  LoongArch: kexec: add KHO support for FDT-based systems
  LoongArch: kexec: add KHO support for ACPI-only systems
  selftests/kho: add LoongArch vmtest support

 arch/loongarch/Kconfig                     |   3 +
 arch/loongarch/include/asm/kexec.h         |   7 +
 arch/loongarch/kernel/machine_kexec.c      |  38 +++
 arch/loongarch/kernel/machine_kexec_file.c | 256 +++++++++++++++++++++
 arch/loongarch/kernel/setup.c              |  21 +-
 tools/testing/selftests/kho/loongarch.conf |  13 ++
 tools/testing/selftests/kho/vmtest.sh      |  23 +-
 7 files changed, 353 insertions(+), 8 deletions(-)
 create mode 100644 tools/testing/selftests/kho/loongarch.conf

--
2.25.1

