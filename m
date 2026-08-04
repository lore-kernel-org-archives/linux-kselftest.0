Received: from todd.t-8ch.de (todd.t-8ch.de [159.69.126.157])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 129F13264E9;
	Tue,  4 Aug 2026 05:32:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=159.69.126.157
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785821565; cv=none; b=dh3QLAsl8qJCgrbqNCYsSl1T8+2P8QLg8nplaZTIqWll03GbNAgE5KRaNMH4ZDzo7W8ap6IiuaeLPaoXyTtFFwZ2nC+9v5VXHYbaUdZWWXLV6Sy1vktlDE5vz7csKFIB6HKx0ilmTu7sIGAZsiKdYAdhPbL/ANUKzbKD+zq1cjs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785821565; c=relaxed/simple;
	bh=m1wAGTVAnMlw7a7kXInoWv0uxOFJUKsjvMWoHPv+kR8=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=sP+GWi02aBcZLSniLN/pjfCB95EX8C0/JrCH9+kGIdjiLbIbdwZLfRf6vqnQfh8gva92mv2XhesJUk1yrCUT3VwbFD0WwmcvdXryPkSc882/1kLUQcYEhkR6nOY5QaGyhhOyaVNs7b8E7iRIWe7/xbXwlvx6W/UZ7v2KIN7civg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=weissschuh.net; spf=pass smtp.mailfrom=weissschuh.net; dkim=pass (1024-bit key) header.d=weissschuh.net header.i=@weissschuh.net header.b=DYL8Zl8Y; arc=none smtp.client-ip=159.69.126.157
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=weissschuh.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=weissschuh.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=weissschuh.net header.i=@weissschuh.net header.b="DYL8Zl8Y"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=weissschuh.net;
	s=mail; t=1785821555;
	bh=m1wAGTVAnMlw7a7kXInoWv0uxOFJUKsjvMWoHPv+kR8=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=DYL8Zl8YxxOUEDJV3gzX1YeaQKsHb/quP7YFvBK46HZjXngoYW0jskCqVO+MF+/93
	 3CETfEafqruj+QBvSbkezz34c/4pVJLThKpDw6dagbTBViW0ldgUuz302Ty8LZgXeY
	 VRbWxbHYZ1o/H1TxJd8dpuhg92hz6o4/rZmuLXvo=
From: =?utf-8?q?Thomas_Wei=C3=9Fschuh?= <linux@weissschuh.net>
Date: Tue, 04 Aug 2026 07:32:35 +0200
Subject: [PATCH 3/4] microblaze: reset: Provide a power off handler through
 an unaligned PC
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20260804-kunit-microblaze-v1-3-6dcdfe12eb40@weissschuh.net>
References: <20260804-kunit-microblaze-v1-0-6dcdfe12eb40@weissschuh.net>
In-Reply-To: <20260804-kunit-microblaze-v1-0-6dcdfe12eb40@weissschuh.net>
To: Michal Simek <monstr@monstr.eu>, 
 Brendan Higgins <brendan.higgins@linux.dev>, David Gow <david@davidgow.net>, 
 Rae Moar <raemoar63@gmail.com>
Cc: linux-kernel@vger.kernel.org, linux-kselftest@vger.kernel.org, 
 kunit-dev@googlegroups.com, 
 =?utf-8?q?Thomas_Wei=C3=9Fschuh?= <linux@weissschuh.net>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1785821555; l=2279;
 i=linux@weissschuh.net; s=20221212; h=from:subject:message-id;
 bh=m1wAGTVAnMlw7a7kXInoWv0uxOFJUKsjvMWoHPv+kR8=;
 b=ejZgvbNlQtaGcgBHxZ+o2882hDVqXKn2gvYvJY7SiV2cwh+Aj/XZZBvQrkwJSTSkHiPK7gHeE
 n77jA/zD8cXA5zOouKX0BNu7ZXEeodBXxw58t5ZYgl3K3DSxSldC0Sp
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
index 3612a20ca16d..4af660deed3b 100644
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

