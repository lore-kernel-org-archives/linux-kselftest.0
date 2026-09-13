Received: from todd.t-8ch.de (todd.t-8ch.de [159.69.126.157])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B24ED3E49CB;
	Sun, 13 Sep 2026 23:50:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=159.69.126.157
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789343430; cv=none; b=iSi52jurTAPZDN6Wu3CRVh4NY2zt+BBloDjfSegtjw2ILm4TeDT+l2BrUja60etQTyiz3I9eyH4J+AxbZawvtbuP87enU9pYe3/hU7TzOaTi3c4XApBKBue1VKVO3LLWhqXpmtFAQNs05q8jTAi4gIccXdRd0dJO2KuM5pm5A+g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789343430; c=relaxed/simple;
	bh=coN69LJf3sKMTzz7yrlr3DPNCHcPQEiBNoxBEnrxxy0=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=W9HsZyBBN7FCJItch7+D5BdADT+0/xmhLvH1WpBFNwNrMC+qMpgmWZEzl3gflT55kL3QPGNbcstXWYfJsy/trhmJnvURssr8BiWg/XyIHMgcYnMJbc5B4JA/RUcQWfNL5FqrUpynKuhGq8b/jru6z6U7laef93GJcQhUwA7yJiM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=weissschuh.net; spf=pass smtp.mailfrom=weissschuh.net; dkim=pass (1024-bit key) header.d=weissschuh.net header.i=@weissschuh.net header.b=LVFIJnm4; arc=none smtp.client-ip=159.69.126.157
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=weissschuh.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=weissschuh.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=weissschuh.net header.i=@weissschuh.net header.b="LVFIJnm4"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=weissschuh.net;
	s=mail; t=1789343423;
	bh=coN69LJf3sKMTzz7yrlr3DPNCHcPQEiBNoxBEnrxxy0=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=LVFIJnm4I+OyT+vVr6u9FjxSAf6XqqW4psV6lIJts/lRQ3zb4NwOihcM5aCWGvs5Q
	 9Tnt94rijBGnc5bXxjR1DoN6WA+MZLl+bt/1uhQbiGYacjl4F7At25tycS+w4JsLhT
	 QZxLFkfvLzHUnlZuCUcT8k1YL8AYCkyd5OyAVO44=
From: =?utf-8?q?Thomas_Wei=C3=9Fschuh?= <linux@weissschuh.net>
Date: Mon, 14 Sep 2026 01:50:11 +0200
Subject: [PATCH v2 4/5] microblaze: reset: Provide a power off handler
 through an unaligned PC
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20260914-kunit-microblaze-v2-4-7d5756e858f8@weissschuh.net>
References: <20260914-kunit-microblaze-v2-0-7d5756e858f8@weissschuh.net>
In-Reply-To: <20260914-kunit-microblaze-v2-0-7d5756e858f8@weissschuh.net>
To: Michal Simek <monstr@monstr.eu>, 
 Brendan Higgins <brendan.higgins@linux.dev>, David Gow <david@davidgow.net>, 
 Rae Moar <raemoar63@gmail.com>
Cc: linux-kernel@vger.kernel.org, linux-kselftest@vger.kernel.org, 
 kunit-dev@googlegroups.com, 
 =?utf-8?q?Thomas_Wei=C3=9Fschuh?= <linux@weissschuh.net>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1789343420; l=2320;
 i=linux@weissschuh.net; s=20221212; h=from:subject:message-id;
 bh=coN69LJf3sKMTzz7yrlr3DPNCHcPQEiBNoxBEnrxxy0=;
 b=bYMIUSpSoA8TMnMdQffyr6Cd/dm5gX/qetulpC8yUikusQ8baMRS9B+34jarzvwJKuMfGh0dc
 YW7hEUmBSAtBhMetQuD4y4ZrJlBd2WNUyNNlydO/qmz0s4TnpbwiOUo
X-Developer-Key: i=linux@weissschuh.net; a=ed25519;
 pk=KcycQgFPX2wGR5azS7RhpBqedglOZVgRPfdFSPB1LNw=

microblaze is missing a generic architecture-wide power off mechanism.

To enable KUnit for microblaze it is necessary for KUnit to shut down
the machine in a way that QEMU will recognize. The machines emulated by
QEMU do not provide machine-specific power off functionality which could
be used.
However at least the petalogix-s3adsp1800 machine will abort if an
unaligned instruction is executed. An ugly message will be printed but
that is not an issue for KUnit.

Make use of this to provide a power off handler.

Signed-off-by: Thomas Weißschuh <linux@weissschuh.net>
Tested-by: David Gow <david@davidgow.net>
---
This is quite hacky. But I didn't find a better solution.
---
 arch/microblaze/Kconfig        |  9 +++++++++
 arch/microblaze/kernel/reset.c | 21 +++++++++++++++++++++
 2 files changed, 30 insertions(+)

diff --git a/arch/microblaze/Kconfig b/arch/microblaze/Kconfig
index 484ebb3baedf..0ca8999dd770 100644
--- a/arch/microblaze/Kconfig
+++ b/arch/microblaze/Kconfig
@@ -216,3 +216,12 @@ config MB_MANAGER
 	  Say N here unless you know what you are doing.
 
 endmenu
+
+config MB_POWER_OFF_THROUGH_UNALIGNED_PC
+	bool "Power off through unaligned PC"
+	help
+	  This options adds a power off handler which executes an unaligned PC
+	  so the machine resets in a generic way. This works for the
+	  petalogix-s3adsp1800 QEMU machine.
+
+	  Say N here unless you know what you are doing.
diff --git a/arch/microblaze/kernel/reset.c b/arch/microblaze/kernel/reset.c
index 774bc1f79119..42031c535d48 100644
--- a/arch/microblaze/kernel/reset.c
+++ b/arch/microblaze/kernel/reset.c
@@ -41,3 +41,24 @@ void machine_restart(char *cmd)
 	pr_emerg("Reboot failed -- System halted\n");
 	while (1);
 }
+
+#ifdef CONFIG_MB_POWER_OFF_THROUGH_UNALIGNED_PC
+static int unaligned_pc_sys_off(struct sys_off_data *data)
+{
+	__asm__(
+		"bri 1\n"
+	);
+
+	return NOTIFY_DONE;
+}
+
+static int __init register_unaligned_pc_sys_off(void)
+{
+	struct sys_off_handler *sys_off;
+
+	sys_off = register_sys_off_handler(SYS_OFF_MODE_POWER_OFF, SYS_OFF_PRIO_LOW,
+					   unaligned_pc_sys_off, NULL);
+	return PTR_ERR_OR_ZERO(sys_off);
+}
+device_initcall(register_unaligned_pc_sys_off);
+#endif /* CONFIG_MB_POWER_OFF_THROUGH_UNALIGNED_PC */

-- 
2.55.0

