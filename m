Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 15F734E4321;
	Fri, 25 Sep 2026 19:30:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790364621; cv=none; b=X9E7IndeROs0sjmgVaVxO4Doe90E5drdqxh4BXkFP51Pb7c0+TjKuVJs6ypIj9wK5ht2ULFQqvM0C6O8CPGaTVzpXP4QW3QFdxuBA8xHs/TtypShxLvtRBec1hoixIZuSnG586WclhORCh5PLL/WiYa82bOYTyE0sLaFFVV8ZFc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790364621; c=relaxed/simple;
	bh=pDqb994ic/Z+6UXT2aao8EB9GiNe/BjSDj6U340lXcU=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=Hngv3keKRj6WqTnn84ZeNBz7bTAFDsOfudXSxUQ3Wqf8GpV/OMzjsI1m/Wq7LuhK2S+QC3cCGlpRi5s7AcgQes/56qNd7pNujJtNEY/42xmSTDeqfRQj04r3Gtas9mgWah3B7skIMshzT+wpbH15rMyCs6co5C20S7DpNoSFqtw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=lY/jjOpQ; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="lY/jjOpQ"
Received: by smtp.kernel.org (Postfix) with UTF8SMTPSA id 33F1D1F00893;
	Fri, 25 Sep 2026 19:30:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1790364619;
	bh=dA+hfa1kQZbaNVONmrZnwYeXHMn1vsq598ePpiU7B9Y=;
	h=From:Subject:Date:To:Cc;
	b=lY/jjOpQYa1WuC/0HJnPK8VazSYniOslQPwa1od00x1u7tvjLUR7olim3xn8VbDfA
	 5Z9Hvij9oxD4JOZ8xIbh59oglxLtsCjKcvCZe8mE+ApjXlxUA0VULcRk13YMT12/tA
	 RRsk0tot8SeD5gWXijB63RdP0r/9adEepl5UVyevMp2yDl6MMaFY4w7zoGpYmKeTdi
	 tB2hcarX8yZs9HcLOqpURK5vlE+3fkKN2WJvEaZBVL0YRaQj8yxLdX34VBcDooNCFP
	 l9m7PXeG+TllvhCFIzO9ELkGq7X6wWh89CG6LF5QMg3lrP/Rrnh+SnX3vw4P6uAyjk
	 qdUrb53rYZBew==
From: Nicolas Schier <nsc@kernel.org>
Subject: [PATCH v3 0/2] Move tool for generating initramfs cpio to scripts/
Date: Fri, 25 Sep 2026 21:29:29 +0200
Message-Id: <20260925-move-gen_init_cpio-to-scripts-v3-0-99c493f76722@kernel.org>
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-B4-Tracking: v=1; b=H4sIAJnLtmoC/4XNQQ6CMBCF4auQrq1phxSsK+9hDIE6wERtSds0G
 sLdLbgwrlz+b/G9mQX0hIEdi5l5TBTI2RzlrmBmbO2AnK65GQioBIDiD5eQD2gbshQbM5Hj0fF
 gPE0xcI0Hjb3WqGTLsjF57Om5+edL7pFCdP613SW5rh+5FPqPnCQXXBgllO4kGtWdbugt3vfOD
 2ylE3y5GsQ/DjIHVVejVKaWZfnDLcvyBpu0+1saAQAA
X-Change-ID: 20260225-move-gen_init_cpio-to-scripts-9e89ef99e51a
To: Nathan Chancellor <nathan@kernel.org>, Nicolas Schier <nsc@kernel.org>, 
 Jonathan Corbet <corbet@lwn.net>, Shuah Khan <skhan@linuxfoundation.org>, 
 Randy Dunlap <rdunlap@infradead.org>, 
 Luis Augenstein <luis.augenstein@tngtech.com>, 
 Maximilian Huber <maximilian.huber@tngtech.com>, 
 Mike Rapoport <rppt@kernel.org>, Pasha Tatashin <pasha.tatashin@soleen.com>, 
 Pratyush Yadav <pratyush@kernel.org>, Alexander Graf <graf@amazon.com>, 
 Willy Tarreau <w@1wt.eu>, 
 =?utf-8?q?Thomas_Wei=C3=9Fschuh?= <linux@weissschuh.net>
Cc: linux-kbuild@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Askar Safin <safinaskar@gmail.com>, linux-doc@vger.kernel.org, 
 kexec@lists.infradead.org, linux-mm@kvack.org, 
 linux-kselftest@vger.kernel.org, 
 =?utf-8?q?Thomas_Wei=C3=9Fschuh?= <thomas.weissschuh@linutronix.de>
X-Mailer: b4 0.17-dev-1f2f7
X-Developer-Signature: v=1; a=openpgp-sha256; l=3169; i=nsc@kernel.org;
 s=20250924; h=from:subject:message-id;
 bh=pDqb994ic/Z+6UXT2aao8EB9GiNe/BjSDj6U340lXcU=;
 b=owEBbQKS/ZANAwAKAQdSCnAWJhJpAcsmYgBqtsufqHVxTJCI0rLc+eABWiVI3ljpInqfy4sM2
 gxxruzB5D+JAjMEAAEKAB0WIQSHQTenhzckp4G+wsYHUgpwFiYSaQUCarbLnwAKCRAHUgpwFiYS
 aZn6EACtoEib3BZH+y5xRl0zD2V2yMwKvo5lxRBhdjAU39DdGVdrWBrpZtD88s6B48PRXbIVTzz
 6z3oGarFnGbDuaOP1lQLQvFUbmLY97a8LGv5KapqwOCjGppxaRXXaVayT5MK9wCq5fjDwgHzXk/
 +Z1qY/yPEGGVU6CjTWmqPH9nLHNyMyJyZnJTOjw+rI4NAkmT4bqwZc7ovQSjVsQxeLMdznQ7HVN
 rjMAb4DVAaNuAHZT6xwjNALqQ+zLKIdWKNBToesbHMIjJNGdhe2o3S1x3nJ1sDJje2AfkMNIDKm
 wdZHuEumebEIFqbtDJAcHL9CAJN9/PrpsVxaTs8mCe2Qbt30RgZyT7PFI3W070rRY03Hlcvb870
 pm+5svMdWB1m5zuBeuqG7QQLVsUq6fZlHS6kcELrNLCGrJJPo2c1CeiBxOocVVOjPrzF+dNh2bz
 jBWaMGNCij2OhNpZgD6cH3kPa90w0u+cNPuDDw6CruRuFc1keb+bptvLUdODnc9RLmVoFN1aWkE
 HM5wlVBYku/JnxHlhUDKgu/tKIZRiUE/7mQ5vKzgr6vMEboAEwR6uBV7AbssugNu9v4jVTqgl0W
 WrEwqtKHP3UV0Qc6inhSD/tEttFBEpY87DVNEjllvQUdUa4eJJtVDSihNY9phvp3uM/3klpfBmn
 030TuXssf+PQxnw==
X-Developer-Key: i=nsc@kernel.org; a=openpgp;
 fpr=18ED52DBE34F860EE9FBC82B7D97093255A0CE7F

initramfs cpio tools had been subject of several recent discussions on
linux-kbuild.  Let's get two minor steps forward by enabling a
top-level target for building gen_init_cpio w/o the need of a valid
kbuild configuration [1] and move the tools for generating the built-in
initramfs from usr/ to scripts/ [2].

Link: https://lore.kernel.org/all/20260220191150.244006-1-safinaskar@gmail.com # [1]
Link: https://lore.kernel.org/all/aSdrCFkUQup3qb-q@derry.ads.avm.de/ # [2]
---
Changes in v3:
  * Update various remaining usr/gen_init* references treewide (Nathan)
  * Link to v2: https://patch.msgid.link/20260720-move-gen_init_cpio-to-scripts-v2-0-26b7e15c7133@kernel.org

Changes in v2:
  * Build gen_init_cpio only if CONFIG_BLK_DEV_INITRD (Thomas)
  * Keep underscore top-level target name (scripts_gen_init_cpio)
    (Thomas)
  * Link to v1: https://patch.msgid.link/20260309-move-gen_init_cpio-to-scripts-v1-0-0c5059b1ec5b@kernel.org

To: Nathan Chancellor <nathan@kernel.org>
To: Nicolas Schier <nsc@kernel.org>
To: Jonathan Corbet <corbet@lwn.net>
To: Shuah Khan <skhan@linuxfoundation.org>
To: Randy Dunlap <rdunlap@infradead.org>
To: Luis Augenstein <luis.augenstein@tngtech.com>
To: Maximilian Huber <maximilian.huber@tngtech.com>
To: Mike Rapoport <rppt@kernel.org>
To: Pasha Tatashin <pasha.tatashin@soleen.com>
To: Pratyush Yadav <pratyush@kernel.org>
To: Alexander Graf <graf@amazon.com>
To: Willy Tarreau <w@1wt.eu>
To: Thomas Weißschuh <linux@weissschuh.net>
Cc: linux-kbuild@vger.kernel.org
Cc: linux-kernel@vger.kernel.org
Cc: linux-doc@vger.kernel.org
Cc: kexec@lists.infradead.org
Cc: linux-mm@kvack.org
Cc: linux-kselftest@vger.kernel.org

---
Nicolas Schier (2):
      kbuild: Mark usr_gen_init_cpio as no-dot-config-target
      kbuild: Move gen_init_cpio and gen_initramfs.sh to scripts/

 .../early-userspace/early_userspace_support.rst          | 16 ++++++++--------
 Documentation/filesystems/ramfs-rootfs-initramfs.rst     | 10 +++++-----
 MAINTAINERS                                              |  1 +
 Makefile                                                 |  9 +++++----
 scripts/.gitignore                                       |  1 +
 scripts/Makefile                                         |  3 +++
 scripts/Makefile.package                                 |  2 +-
 {usr => scripts}/gen_init_cpio.c                         |  0
 {usr => scripts}/gen_initramfs.sh                        |  2 +-
 scripts/remove-stale-files                               |  2 ++
 scripts/sbom/tests/cmd_graph/test_savedcmd_parser.py     |  2 +-
 tools/testing/selftests/kho/vmtest.sh                    |  2 +-
 tools/testing/selftests/nolibc/Makefile.nolibc           |  2 +-
 usr/.gitignore                                           |  4 +++-
 usr/Kconfig                                              |  2 +-
 usr/Makefile                                             |  4 +---
 16 files changed, 35 insertions(+), 27 deletions(-)
---
base-commit: 93f51579e7df248780214094418f205253383cc5
change-id: 20260225-move-gen_init_cpio-to-scripts-9e89ef99e51a

Best regards,
--  
Nicolas

