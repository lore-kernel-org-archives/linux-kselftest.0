Received: from out30-113.freemail.mail.aliyun.com (out30-113.freemail.mail.aliyun.com [115.124.30.113])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D5B293E3176
	for <linux-kselftest@vger.kernel.org>; Mon, 25 May 2026 08:37:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=115.124.30.113
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779698261; cv=none; b=VUG7GnIDcNpmrug0P1eCaNLw5BJfafbFRbacql3gPUiRT2SdRS57TxRLsEnCBd9fTPqSI2k4mVnMyiGPa5R5qhjn2pbxg09pij1slBB8gnyKKoLESfKUOQn6yr/k9f3pTLgJStzLQF+uyh1/E6TY3MmUDAp/LvE/lgYsyGbZySk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779698261; c=relaxed/simple;
	bh=nWhiqERXPNrEXNIjYTj2497195/HMW9Sl8fqITNlza8=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=VLqcXEHUoe7IE1dsGw+jdTIhW+5KqO+XAMKTu5xcdb+GGd7OzYdK2kQhw7Os7HhMFb5YKbVPJbGOfL5xzl+TfVzZFcamnkxaJ7BzZHUtS5b0SC2uFdIKUyYwNpT6X5d8V0vFK0q8KDetBnCAbLTbcF7u4wHnyDPi+mILYPp5Mg4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.alibaba.com; spf=pass smtp.mailfrom=linux.alibaba.com; dkim=pass (1024-bit key) header.d=linux.alibaba.com header.i=@linux.alibaba.com header.b=YR5bRHDk; arc=none smtp.client-ip=115.124.30.113
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.alibaba.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.alibaba.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux.alibaba.com header.i=@linux.alibaba.com header.b="YR5bRHDk"
DKIM-Signature:v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=linux.alibaba.com; s=default;
	t=1779698255; h=From:To:Subject:Date:Message-ID:MIME-Version;
	bh=+bjKIj74kR89Lxc7k+LCpx2MlMI9LLUN9GdyDifl7t8=;
	b=YR5bRHDksn5o38M5/lkeElaooaLWGdU43yBIC6aDQsGMV/+ZP3C/FGvf+GoldRJ4KR//AkjAnVKwMsfN4IaqI2Yf6xJ+RccOT3ZLxRVaXCU6eSg6uRiSODe5d5OEvGDjPKpfe4bI2czNhWTJbkDbSiwe6GlqjPpkZRGlFuL2cPs=
X-Alimail-AntiSpam:AC=PASS;BC=-1|-1;BR=01201311R101e4;CH=green;DM=||false|;DS=||;FP=0|-1|-1|-1|0|-1|-1|-1;HT=maildocker-contentspam033045098064;MF=zelin.deng@linux.alibaba.com;NM=1;PH=DS;RN=4;SR=0;TI=SMTPD_---0X3WidsM_1779698254;
Received: from localhost(mailfrom:zelin.deng@linux.alibaba.com fp:SMTPD_---0X3WidsM_1779698254 cluster:ay36)
          by smtp.aliyun-inc.com;
          Mon, 25 May 2026 16:37:35 +0800
From: Zelin Deng <zelin.deng@linux.alibaba.com>
To: mbenes@suse.cz,
	shuah@kernel.org
Cc: linux-kselftest@vger.kernel.org,
	Zelin Deng <zelin.deng@linux.alibaba.com>
Subject: [PATCH] selftests: livepatch: unset sub_make_done in case top level Makefile be overwritten
Date: Mon, 25 May 2026 16:37:21 +0800
Message-ID: <20260525083721.27857-1-zelin.deng@linux.alibaba.com>
X-Mailer: git-send-email 2.43.7
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

After I did: make kselftest-all in top level of kernel source tree, top
level Makefile was overwritten by auto generated contents by
filechk_makefile:
[root@emr: /home/shiyu.dzl/linux-next]$ cat Makefile
export KBUILD_OUTPUT = .
export KBUILD_EXTMOD = /home/shiyu.dzl/linux-next
export KBUILD_EXTMOD_OUTPUT = /home/shiyu.dzl/linux-next
include /home/shiyu.dzl/linux-next/Makefile

Top-level Makefile export sub_make_done=1, leaks into unrelated re-invocations
of the top-level Makefile when recursive descent through selftests -
building test_module of livepatch. That causes KBUILD_EXTMOD setup to be
skipped, which leads to a relative/absolute path mismatch in srcroot vs
CURDIR, falsely setting building_out_of_srctree, and ultimately overwriting
the source tree's Makefile with a generated stub.

Clear sub_make_done before re-invoking the kernel Makefile.

Fixes: c4bbe83d27c2 ("livepatch: Move tests from lib/livepatch to selftests/livepatch")
Signed-off-by: Zelin Deng <zelin.deng@linux.alibaba.com>
---
 tools/testing/selftests/livepatch/test_modules/Makefile | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/tools/testing/selftests/livepatch/test_modules/Makefile b/tools/testing/selftests/livepatch/test_modules/Makefile
index a13d398585dc..b78657089ab7 100644
--- a/tools/testing/selftests/livepatch/test_modules/Makefile
+++ b/tools/testing/selftests/livepatch/test_modules/Makefile
@@ -19,11 +19,11 @@ obj-m += test_klp_atomic_replace.o \
 # Ensure that KDIR exists, otherwise skip the compilation
 modules:
 ifneq ("$(wildcard $(KDIR))", "")
-	$(Q)$(MAKE) -C $(KDIR) modules KBUILD_EXTMOD=$(TESTMODS_DIR)
+	$(Q)unset sub_make_done && $(MAKE) -C $(KDIR) modules KBUILD_EXTMOD=$(TESTMODS_DIR)
 endif
 
 # Ensure that KDIR exists, otherwise skip the clean target
 clean:
 ifneq ("$(wildcard $(KDIR))", "")
-	$(Q)$(MAKE) -C $(KDIR) clean KBUILD_EXTMOD=$(TESTMODS_DIR)
+	$(Q)unset sub_make_done && $(MAKE) -C $(KDIR) clean KBUILD_EXTMOD=$(TESTMODS_DIR)
 endif
-- 
2.43.7

