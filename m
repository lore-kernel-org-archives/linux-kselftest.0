Received: from todd.t-8ch.de (todd.t-8ch.de [159.69.126.157])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E5F77386C12;
	Sun, 13 Sep 2026 23:50:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=159.69.126.157
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789343428; cv=none; b=FIu79avnIcAakLnAdcGZblT6AVF1HUvENb4ZLhHQA5FNgpqUEhondbYNF3V/M6ftC6OkDG0JPU5jHeynjFM/g60foY5xhKISzBKip2IKVSD407Zx5145csVu3R9b0DoZkL1kk5ZzAmGfdkiVVdccTqmhW2Fh96WsMTAcYMGsj7s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789343428; c=relaxed/simple;
	bh=spOLWJ0AT1LoUd1wenGeTkrlYwKJabco7j2luwxNOCs=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=Ktzbz0iaMjpcNT0BAaKPuMoyVdUxLSa4V20wkbZwul7XGfzPH/dqyCy6AyBAohc7x82BoJF50B4EN/ndQdARkrWMJq6y4AhVN/fEWXary03cJrY/dbTmZSAcleMWmzqpeEoG/7zqPLRbp/yVm4bONO5zZkwanvmeRKHskWeNnmA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=weissschuh.net; spf=pass smtp.mailfrom=weissschuh.net; dkim=pass (1024-bit key) header.d=weissschuh.net header.i=@weissschuh.net header.b=bjHe5R0l; arc=none smtp.client-ip=159.69.126.157
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=weissschuh.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=weissschuh.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=weissschuh.net header.i=@weissschuh.net header.b="bjHe5R0l"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=weissschuh.net;
	s=mail; t=1789343423;
	bh=spOLWJ0AT1LoUd1wenGeTkrlYwKJabco7j2luwxNOCs=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=bjHe5R0l2wdv58koUu5oKLZQvlZVaFCo1Drr90P5n8brgfjB7fibEUlQMPOQ73Xr2
	 4mq8OOgdRI4bd9akJh51fxqny8Z8rhaEXNFnELmW4SFshlM0inI8fMw1Sit9NaMcJ1
	 x/0xnAnnD9nRXPu/8EZVpmKv+My83ee3hrOz/Ezc=
From: =?utf-8?q?Thomas_Wei=C3=9Fschuh?= <linux@weissschuh.net>
Date: Mon, 14 Sep 2026 01:50:09 +0200
Subject: [PATCH v2 2/5] microblaze: Pass -m{big,little}-endian through
 KBUILD_CPPFLAGS
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20260914-kunit-microblaze-v2-2-7d5756e858f8@weissschuh.net>
References: <20260914-kunit-microblaze-v2-0-7d5756e858f8@weissschuh.net>
In-Reply-To: <20260914-kunit-microblaze-v2-0-7d5756e858f8@weissschuh.net>
To: Michal Simek <monstr@monstr.eu>, 
 Brendan Higgins <brendan.higgins@linux.dev>, David Gow <david@davidgow.net>, 
 Rae Moar <raemoar63@gmail.com>
Cc: linux-kernel@vger.kernel.org, linux-kselftest@vger.kernel.org, 
 kunit-dev@googlegroups.com, 
 =?utf-8?q?Thomas_Wei=C3=9Fschuh?= <linux@weissschuh.net>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1789343420; l=1579;
 i=linux@weissschuh.net; s=20221212; h=from:subject:message-id;
 bh=spOLWJ0AT1LoUd1wenGeTkrlYwKJabco7j2luwxNOCs=;
 b=zNQqs3kRuZI/aiHy5E0kQTLQVIUGHehFHotDa7vnk24s/+pzJw1CPM8FNPQb+l+hz06e7maHR
 bZ0dxWGx/LxBWpdxIAEMp8mAxKIoC5+TDvVRnrBJxICn7WYYk0f3+AX
X-Developer-Key: i=linux@weissschuh.net; a=ed25519;
 pk=KcycQgFPX2wGR5azS7RhpBqedglOZVgRPfdFSPB1LNw=

These parameters are also necessary for preprocessed files which do not
contain code. One example is arch/microblaze/kernel/vmlinux.lds.S which
inspects __MICROBLAZEEL__ for the definition of 'jiffies_64'.
As currently the endianness is not passed from the build system for this
file, the preprocessor will instead use the default endianness of the
toolchain. When a default big-endian toolchain is used to build a
little-endian kernel, that kernel will hang during delay calibration
as 'jiffies' never changes.

Make sure all preprocessor invocations know about the correct endianness
by passing it through KBUILD_CPPFLAGS. This will also be inherited by
CFLAGS and AFLAGS.

Fixes: 02b08045a030 ("microblaze: Add support for little-endian Microblaze")
Signed-off-by: Thomas Weißschuh <linux@weissschuh.net>
---
 arch/microblaze/Makefile | 6 ++----
 1 file changed, 2 insertions(+), 4 deletions(-)

diff --git a/arch/microblaze/Makefile b/arch/microblaze/Makefile
index 02e6be9c5b0d..9087a366ce78 100644
--- a/arch/microblaze/Makefile
+++ b/arch/microblaze/Makefile
@@ -34,12 +34,10 @@ CPUFLAGS-$(CONFIG_XILINX_MICROBLAZE0_USE_BARREL) += -mxl-barrel-shift
 CPUFLAGS-$(CONFIG_XILINX_MICROBLAZE0_USE_PCMP_INSTR) += -mxl-pattern-compare
 
 ifdef CONFIG_CPU_BIG_ENDIAN
-KBUILD_CFLAGS += -mbig-endian
-KBUILD_AFLAGS += -mbig-endian
+KBUILD_CPPFLAGS += -mbig-endian
 KBUILD_LDFLAGS += -EB
 else
-KBUILD_CFLAGS += -mlittle-endian
-KBUILD_AFLAGS += -mlittle-endian
+KBUILD_CPPFLAGS += -mlittle-endian
 KBUILD_LDFLAGS += -EL
 endif
 

-- 
2.55.0

