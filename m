Received: from todd.t-8ch.de (todd.t-8ch.de [159.69.126.157])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 952473E3D9E;
	Sun, 13 Sep 2026 23:50:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=159.69.126.157
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789343435; cv=none; b=GGhv3u/pG4RoGb9+huLEqXxXX3RUIIS1klX2FtBRi2BZzUqIa9bbskAcm5qUBzUF9rjkEH1Nw3vRCKSgD5NOozWV6bFQUxtEVroBV0miOr/JLi02UHeEnVUiRM/aHJmq+nPF4Ay5SesDIm9dmaWfjFw5GedFSjq78xSFjiJT/S4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789343435; c=relaxed/simple;
	bh=GhDK7+iED9atD/ApSHODcxSUBxH7+/t/TGI7b7nhf20=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=eXtxFqHLsicIIgQsFCcyLWVMZtjXGBaz3TTA95f5Jt7XHqhsTwXQ1Ve3YfcubqWMYXU23ambJWevXY7MD1R+II48UWuovVbLg9bAEGq7GU/f76Ejhv+LPJnda3P+bpgjT9T7jdYh1ZNw8C4eO5dXavXqbhVxwD4U6GJ617EIvQU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=weissschuh.net; spf=pass smtp.mailfrom=weissschuh.net; dkim=pass (1024-bit key) header.d=weissschuh.net header.i=@weissschuh.net header.b=PuRGLgDY; arc=none smtp.client-ip=159.69.126.157
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=weissschuh.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=weissschuh.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=weissschuh.net header.i=@weissschuh.net header.b="PuRGLgDY"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=weissschuh.net;
	s=mail; t=1789343424;
	bh=GhDK7+iED9atD/ApSHODcxSUBxH7+/t/TGI7b7nhf20=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=PuRGLgDYWadUOyhIPrKkjnXuu+fQn85x961cXcFmL72H+tP78bjyl/xwyJHWiTE4M
	 7c0v5NqNiIikwlH6xGT9UKS4tAZ+RxvUJB6We6OHGvvXplM6GNULbMhonKdZesHcDc
	 kzX650X6VCoo4+TBR8HPjeGf5cRcHsBeWnLWktbo=
From: =?utf-8?q?Thomas_Wei=C3=9Fschuh?= <linux@weissschuh.net>
Date: Mon, 14 Sep 2026 01:50:12 +0200
Subject: [PATCH v2 5/5] kunit: qemu_configs: Add microblaze configurations
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20260914-kunit-microblaze-v2-5-7d5756e858f8@weissschuh.net>
References: <20260914-kunit-microblaze-v2-0-7d5756e858f8@weissschuh.net>
In-Reply-To: <20260914-kunit-microblaze-v2-0-7d5756e858f8@weissschuh.net>
To: Michal Simek <monstr@monstr.eu>, 
 Brendan Higgins <brendan.higgins@linux.dev>, David Gow <david@davidgow.net>, 
 Rae Moar <raemoar63@gmail.com>
Cc: linux-kernel@vger.kernel.org, linux-kselftest@vger.kernel.org, 
 kunit-dev@googlegroups.com, 
 =?utf-8?q?Thomas_Wei=C3=9Fschuh?= <linux@weissschuh.net>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1789343420; l=2811;
 i=linux@weissschuh.net; s=20221212; h=from:subject:message-id;
 bh=GhDK7+iED9atD/ApSHODcxSUBxH7+/t/TGI7b7nhf20=;
 b=FRvAmyX9eYFv0cGe8nrtCuwyXvzYDMPNNSHqgCFQSa59JAOmZ7dsQdFARBT8cM16B/DbzMpDA
 apeLanpWa/BCr4Eq7tkaagU8w1nzDKSu+cHrwh06xxI2vujyGvbzlQW
X-Developer-Key: i=linux@weissschuh.net; a=ed25519;
 pk=KcycQgFPX2wGR5azS7RhpBqedglOZVgRPfdFSPB1LNw=

Add basic configurations to run kunit tests on big and little endian
microblaze.

Suggested-by: Michal Simek <monstr@monstr.eu>
Link: https://lore.kernel.org/lkml/5cd8df03-ad51-460c-9b20-3bf288831b5a@amd.com/
Signed-off-by: Thomas Weißschuh <linux@weissschuh.net>
Reviewed-by: David Gow <david@davidgow.net>
---
 tools/testing/kunit/qemu_configs/microblazebe.py | 24 ++++++++++++++++++++
 tools/testing/kunit/qemu_configs/microblazeel.py | 28 ++++++++++++++++++++++++
 2 files changed, 52 insertions(+)

diff --git a/tools/testing/kunit/qemu_configs/microblazebe.py b/tools/testing/kunit/qemu_configs/microblazebe.py
new file mode 100644
index 000000000000..f37b7af20142
--- /dev/null
+++ b/tools/testing/kunit/qemu_configs/microblazebe.py
@@ -0,0 +1,24 @@
+# SPDX-License-Identifier: GPL-2.0-only
+from ..qemu_config import QemuArchParams
+
+QEMU_ARCH = QemuArchParams(linux_arch='microblaze',
+						   kconfig='''
+CONFIG_KERNEL_BASE_ADDR=0x90000000
+CONFIG_XILINX_MICROBLAZE0_USE_MSR_INSTR=1
+CONFIG_XILINX_MICROBLAZE0_USE_PCMP_INSTR=1
+CONFIG_XILINX_MICROBLAZE0_USE_BARREL=1
+CONFIG_XILINX_MICROBLAZE0_USE_DIV=0
+CONFIG_XILINX_MICROBLAZE0_USE_HW_MUL=1
+CONFIG_XILINX_MICROBLAZE0_USE_FPU=0
+CONFIG_CPU_BIG_ENDIAN=y
+CONFIG_SERIAL_UARTLITE=y
+CONFIG_SERIAL_UARTLITE_CONSOLE=y
+CONFIG_MB_POWER_OFF_THROUGH_UNALIGNED_PC=y
+''',
+						   qemu_arch='microblaze',
+						   kernel_path='arch/microblaze/boot/linux.bin',
+						   kernel_command_line='kunit_shutdown=poweroff',
+						   extra_qemu_params=[
+							'-M', 'petalogix-s3adsp1800',
+						   ],
+)
diff --git a/tools/testing/kunit/qemu_configs/microblazeel.py b/tools/testing/kunit/qemu_configs/microblazeel.py
new file mode 100644
index 000000000000..25db2052db06
--- /dev/null
+++ b/tools/testing/kunit/qemu_configs/microblazeel.py
@@ -0,0 +1,28 @@
+# SPDX-License-Identifier: GPL-2.0-only
+from ..qemu_config import QemuArchParams
+
+QEMU_ARCH = QemuArchParams(linux_arch='microblaze',
+						   kconfig='''
+CONFIG_KERNEL_BASE_ADDR=0x50000000
+CONFIG_XILINX_MICROBLAZE0_FAMILY="virtex5"
+CONFIG_XILINX_MICROBLAZE0_USE_MSR_INSTR=1
+CONFIG_XILINX_MICROBLAZE0_USE_PCMP_INSTR=1
+CONFIG_XILINX_MICROBLAZE0_USE_BARREL=1
+CONFIG_XILINX_MICROBLAZE0_USE_DIV=1
+CONFIG_XILINX_MICROBLAZE0_USE_HW_MUL=2
+CONFIG_XILINX_MICROBLAZE0_USE_FPU=1
+CONFIG_CPU_LITTLE_ENDIAN=y
+CONFIG_SERIAL_8250=y
+CONFIG_SERIAL_8250_CONSOLE=y
+CONFIG_SERIAL_8250_16550A_VARIANTS=y
+CONFIG_SERIAL_OF_PLATFORM=y
+CONFIG_MB_POWER_OFF_THROUGH_UNALIGNED_PC=y
+''',
+						   qemu_arch='microblaze',
+						   kernel_path='arch/microblaze/boot/linux.bin',
+						   kernel_command_line='kunit_shutdown=poweroff',
+						   extra_qemu_params=[
+							'-M', 'petalogix-ml605',
+						   ],
+)
+

-- 
2.55.0

