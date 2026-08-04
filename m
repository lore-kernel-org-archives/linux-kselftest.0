Received: from todd.t-8ch.de (todd.t-8ch.de [159.69.126.157])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7FA3933F5A5;
	Tue,  4 Aug 2026 05:32:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=159.69.126.157
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785821565; cv=none; b=k2hs0GQsNS3XbgSxloj6vNrVB5RDjeziN2mjbLPp9it+QIxQ2Vr/CHa8QLdZxW0ShLGedwiPZbA90U3gTX3o5G3vUd1MY58k/T7GWGxhFWfzKjl5zfu0/LChzWfti99THa2gY2zfiXyc4WDam/9l/CUyKwEJTHMvr9UTCIhal4Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785821565; c=relaxed/simple;
	bh=NdFfg3SF/iaHfGjuGYNhsRQIGr8ZwCnOpggOOjBqlBc=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=UAMKD9rxIAuhfNKmEebPEIsz7/u3U3xpdH99fhV0agNVjCiv1H59qCHuochOqlfPdMjKqY372u4pAQoqRO57FcEK20T7KBMFDSUa9oVpcVbOvYceEVNyvqDVpcVCwauXwYFzmLLC8rwGn+xgp5JHvwPYouTfBimt9Z9Wn4+dsGk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=weissschuh.net; spf=pass smtp.mailfrom=weissschuh.net; dkim=pass (1024-bit key) header.d=weissschuh.net header.i=@weissschuh.net header.b=iSBj8uNg; arc=none smtp.client-ip=159.69.126.157
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=weissschuh.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=weissschuh.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=weissschuh.net header.i=@weissschuh.net header.b="iSBj8uNg"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=weissschuh.net;
	s=mail; t=1785821555;
	bh=NdFfg3SF/iaHfGjuGYNhsRQIGr8ZwCnOpggOOjBqlBc=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=iSBj8uNgCNa2Sj6NGynV5ijFO62T+LE2JLXEpswtiE+QYyVTbuvWihXZsGKbtaUmd
	 udBRxRFkgPpX6qbgF67fs1rDdp0QLWFoBFRgzPU2SqLfjJaIZkLC9hvKygXqfr5AvM
	 9qN5jrW2u3VJPWhHnHPFtA792iPKI0pGzMu6Icrw=
From: =?utf-8?q?Thomas_Wei=C3=9Fschuh?= <linux@weissschuh.net>
Date: Tue, 04 Aug 2026 07:32:36 +0200
Subject: [PATCH 4/4] kunit: qemu_configs: Add microblaze configuration
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20260804-kunit-microblaze-v1-4-6dcdfe12eb40@weissschuh.net>
References: <20260804-kunit-microblaze-v1-0-6dcdfe12eb40@weissschuh.net>
In-Reply-To: <20260804-kunit-microblaze-v1-0-6dcdfe12eb40@weissschuh.net>
To: Michal Simek <monstr@monstr.eu>, 
 Brendan Higgins <brendan.higgins@linux.dev>, David Gow <david@davidgow.net>, 
 Rae Moar <raemoar63@gmail.com>
Cc: linux-kernel@vger.kernel.org, linux-kselftest@vger.kernel.org, 
 kunit-dev@googlegroups.com, 
 =?utf-8?q?Thomas_Wei=C3=9Fschuh?= <linux@weissschuh.net>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1785821555; l=1045;
 i=linux@weissschuh.net; s=20221212; h=from:subject:message-id;
 bh=NdFfg3SF/iaHfGjuGYNhsRQIGr8ZwCnOpggOOjBqlBc=;
 b=yVZZAlDFhXqE8bqSO5CLDtTUIeD+W3pIOhm9bCyhiKW6UIumgfjd6e6bc2fTby+M4LCeokESl
 I6ZSgtcKM9DCg4cHT6bjXIyz7g9lnuanKPHi2O/jD1JP5AdMi0+h4wH
X-Developer-Key: i=linux@weissschuh.net; a=ed25519;
 pk=KcycQgFPX2wGR5azS7RhpBqedglOZVgRPfdFSPB1LNw=

Add a basic configuration to run kunit tests on microblaze.

Signed-off-by: Thomas Weißschuh <linux@weissschuh.net>
---
 tools/testing/kunit/qemu_configs/microblaze.py | 17 +++++++++++++++++
 1 file changed, 17 insertions(+)

diff --git a/tools/testing/kunit/qemu_configs/microblaze.py b/tools/testing/kunit/qemu_configs/microblaze.py
new file mode 100644
index 000000000000..ff012095e77d
--- /dev/null
+++ b/tools/testing/kunit/qemu_configs/microblaze.py
@@ -0,0 +1,17 @@
+# SPDX-License-Identifier: GPL-2.0-only
+from ..qemu_config import QemuArchParams
+
+QEMU_ARCH = QemuArchParams(linux_arch='microblaze',
+						   kconfig='''
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

-- 
2.55.0

