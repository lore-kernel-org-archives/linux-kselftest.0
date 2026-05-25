Received: from out-170.mta1.migadu.com (out-170.mta1.migadu.com [95.215.58.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8FB2F39DBC0
	for <linux-kselftest@vger.kernel.org>; Mon, 25 May 2026 06:28:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=95.215.58.170
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779690521; cv=none; b=WIJoFNWUHd36Q8TxM+DNWmfEm7kZnEeREQllWgqC6knFRu12AjOvf7BqYs0VrFgem8sXtrLU24SKoyl1aZ53673OgR8LYMUIE2MGHPm2nM/hQnFqFP/ZxyESajtsAVd44PtfLXqFdG53xr3YPRkuom4ycn1V5I/eEh8KZFjzkEA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779690521; c=relaxed/simple;
	bh=e4FM8ZhzT2nd6jhoefAjV1OAseKOwjDrNbHN2Uhbm4c=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=bioOgA5Em9iH8Aq6lqFSUpv8fO23T7iwBMPYH83k2I78tMXQKiBT6TNr2vgumydkZ9+4L0BSv8Ydl9ytrjYQKwKUXuimM9z1T3y7GIATOtRcGq3AL5J1sujoL1/tefYDzGWjt1HTpAZrqkrm8BpBx+7xi+ZJCt3vBfZI6P5+F+s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev; spf=pass smtp.mailfrom=linux.dev; dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b=Yucifz/s; arc=none smtp.client-ip=95.215.58.170
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b="Yucifz/s"
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.dev; s=key1;
	t=1779690517;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=1DpUemWUGyJtUUApdw/ETRvltxpRFxe9n1wlPX0btGE=;
	b=Yucifz/sdS2vKuW192qxuRBEWgSXVsddVL+KNGf+XI6D7sznnV9iJsKaKPcj5drGUYn+YD
	JBL+Z4v3QQJ3d074krQwygVweZ8fObWIwiw8MI7MMywq3T+IFQ2Ebk0zut2bAiCsDUu7KV
	PVHuh2mBNxiXm+o0Usrwp+1/B1cI60E=
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
Subject: [PATCH 6/7] selftests/kho: LoongArch: disable PS/2 input devices for QEMU virt
Date: Mon, 25 May 2026 14:28:09 +0800
Message-Id: <20260525062810.103367-7-dongtai.guo@linux.dev>
In-Reply-To: <20260525062810.103367-1-dongtai.guo@linux.dev>
References: <20260525062810.103367-1-dongtai.guo@linux.dev>
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Migadu-Flow: FLOW_OUT

From: George Guo <guodongtai@kylinos.cn>

QEMU's LoongArch virt machine has no i8042 PS/2 controller.  When PNP
detection finds nothing, i8042_init() falls back to probing the ports
directly.  On LoongArch the I/O ports are memory-mapped, and the i8042
port addresses are not backed by any device on the virt machine, so
i8042_flush() takes a page fault and the kernel panics:

  i8042: PNP: No PS/2 controller found.
  i8042: Probing ports directly.
  CPU 0 Unable to handle kernel paging request at virtual address ffff800000008064
  ERA: i8042_flush+0x50/0x198
   RA: i8042_init+0x2a8/0x35c
  Kernel panic - not syncing: Attempted to kill init!

Disable SERIO_I8042 and its dependents (KEYBOARD_ATKBD, MOUSE_PS2) in
the QEMU_KCONFIG fragment to prevent the driver from being built.

Signed-off-by: George Guo <guodongtai@kylinos.cn>
---
 tools/testing/selftests/kho/loongarch.conf | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/tools/testing/selftests/kho/loongarch.conf b/tools/testing/selftests/kho/loongarch.conf
index b0551e0c2d77..0145cb49e5b2 100644
--- a/tools/testing/selftests/kho/loongarch.conf
+++ b/tools/testing/selftests/kho/loongarch.conf
@@ -2,6 +2,9 @@ QEMU_CMD="qemu-system-loongarch64 -M virt -cpu la464"
 QEMU_KCONFIG="
 CONFIG_SERIAL_8250=y
 CONFIG_SERIAL_8250_CONSOLE=y
+# CONFIG_KEYBOARD_ATKBD is not set
+# CONFIG_MOUSE_PS2 is not set
+# CONFIG_SERIO_I8042 is not set
 "
 KERNEL_IMAGE="vmlinux.efi"
 KERNEL_CMDLINE="console=ttyS0 earlycon"
-- 
2.25.1

