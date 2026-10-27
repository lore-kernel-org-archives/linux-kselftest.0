Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.210.182
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793101401;
	b=gld4ivnMKhLJy+GKS/H9ZW2mmTnpuIW34X/0m0TRc3JcHHKDA09R/6eGDT6sngEvBGTZ
	 aQkN22pa9yu6DY0xqat3CfwgG/j8qEVrfO0IHd6WdAY8qPYaFSz0x/iPh12zq5ObQdaTN
	 O2emX5RmWtLgxVlQxLOyO7BizBjLIzf6+R85Mt2ywJnFk4Nc6B+iIzpnoq7cy8P9l/lD4
	 Sf3ctO6I7vilbpVO7qqS/5uPMpEp5cGz2qwAZoATjVpgT5NHuKO8yJVStcr47URlhZoY2
	 iUYm6VVX84D09SGClXaLLt7GOy/z4/gYrZoGap49Md5r9DlWGZe+4Rq9guAkAINAEsw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793101401;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To:User-Agent;
	bh=zZcYX7S/IRLmRwsATrT9hZb6l/1JqthXKat4XzKms4c=;
	b=wSD8uuDQKGhOJ2DO4E7L2yqwx42r36a7JK9oITe1B/Soxlmhx9ZhVGNJ0E6FNiHhEcie
	 6TDSJr2PWD68GkMYQbOx2LfMZpurxTSpmWCVQqgtNMutP3Rwi9xXGxbrCNg8yPaC8PTdW
	 n7quVlls9ANf1tIxk3oU3D61NZtyMCSCUaFUzZCOIrA+Tf5uvNc2En1AzYo+SSsMvPyvh
	 WB41GJatzUbaMc1VaM2GqRub2corCmeU8v6fCymn4EmNvl7S7oSIul5depM4od1TMhQxH
	 +CYVk1JMRoePJ2JvVofX58Oz2+8yO4pEpVs6+tGFdAcxdjNPhofTyvjQMl/Gygw8oKA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=chrisdown.name;
	spf=pass smtp.mailfrom=chrisdown.name;
	dkim=pass header.d=chrisdown.name header.i=@chrisdown.name header.a=rsa-sha256 header.s=google header.b="l/iQCDTp";
	arc=none smtp.remote-ip=209.85.210.182
Received: from mail-pf1-f182.google.com (mail-pf1-f182.google.com [209.85.210.182])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3E030606A336
	for <linux-kselftest@vger.kernel.org>; Tue, 27 Oct 2026 11:43:21 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 3E030606A336
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=chrisdown.name
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chrisdown.name
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=chrisdown.name header.i=@chrisdown.name header.a=rsa-sha256 header.s=google header.b=l/iQCDTp
Received: by mail-pf1-f182.google.com with SMTP id d2e1a72fcca58-8a052aff9e9so2861663b3a.0
        for <linux-kselftest@vger.kernel.org>; Tue, 27 Oct 2026 04:43:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chrisdown.name; s=google; t=1793101401; x=1793706201; darn=vger.kernel.org;
        h=user-agent:in-reply-to:content-disposition:content-type
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=zZcYX7S/IRLmRwsATrT9hZb6l/1JqthXKat4XzKms4c=;
        b=l/iQCDTpA4mRZGrOlC6GaJLKXbFzOgDhzj0I0P/PQZQpXCAqyyEKfEKaaKUxLQwvxx
         AQZKi8H0NYM/5PD7HIx1Le0kvffPUnD/HKfAS2gLQeyvHF1r3dVxNpAHr811gVbUoRvf
         LyLRDl0ALTtuxefSzSu4E+vZ6LRJIG0th+bKc=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793101401; x=1793706201;
        h=user-agent:in-reply-to:content-disposition:content-type
         :mime-version:references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=zZcYX7S/IRLmRwsATrT9hZb6l/1JqthXKat4XzKms4c=;
        b=rX94R+oeHqCG1a8gScATAcrn7+t/dXTMxNX6WfF5bpOnGeItC7WUwoVeIVhz1n2jSR
         TkPjSG0xk5F3U9x0r52MNZiuEKRAVV75NzakI7tINWb7GcKU6YmvzkDGQau0waP4hktJ
         Cy4w62keQo9hQiIciXAxuzV5/brnzwOxMb4PZKRhjIQG7Yae+n2O4vucdnh5+TPzAAsD
         m0Y7AlLzbtmL9x+tIxHB0wiiGlhF+KbFo8+cqhVJq6BkDF0Ql4RT0SCFhW2rfMCwklyl
         AuyTKcK1/omUXCPqUT1HSmIE2tLiEWqPABYvqHX2mB+SE05baYQ6PRdn4nWYQiLgyWT6
         pCNA==
X-Forwarded-Encrypted: i=1; AKwUvBwLgjbleuhg+ZkVPkvhxjKQMi9lbaiwU4DN4QMRQcnwUq3lyijX3Q1quNZ9ilhI6zFYq0uTIJCwi4gZ02UtcYM=@vger.kernel.org
X-Gm-Message-State: AFq9FYLfe5QUyDhtsBuyKH2l5LtdjSv18TVl5jL/GiNpiXsONVox+XSQ
	ndWJ6f2T1OYJcwYaAfHY6ro3z5QJaaxyxfILMLhNCm54xHg03J4nIqj+gEP5M4D+rSg=
X-Gm-Gg: AYBFou3DYz7oqwCcosrkfgIfqOPAkHORFdjDi3kE1n1UT68I1uvH8zanU7eEwLVa6FH
	lCnjzlkdyyOq7pvt0dpdjiLmLsFdz/JqJakkzBddT3UKuFMyK6RNp7SgjWMb5ClACViROSv7Leo
	WOGsZ07OlvcesQwc807MAYhNZFhDAik25uSEJNHGWO8v3yG3VgYc79Lk3mqhApHmlfQ0lkKHB6F
	ev7/xmIzZu9W6xa2pDP3rmfopH9Fre1CZRfk629oSwfMvLaCCR3pMmKIjCFIfO4mZQ/3/baGfYN
	rJnNZwbdG8Oznxl8dfruMTcr1/9P2ySSh/SljHL69bKoqf4cf4/sA3VvNUKpRWxi6KDSJRW9L6p
	eQ8T27zkvN3mS5WEYgZlr0W4u7opvlfysUXsF2cDwIH/GV+VAM6jeXA3Pgfjq5QfE+CAu3vx8R6
	4/90FfdIc5JaZ51UzOLHWFXCkbdO96O5HlmrgH1WCQRKv6BmUcbrPuwSglbVTGpFt+FPMs41zqf
	0rBJVy4vmBnZXlM2YbQjOVH3it3+5dupEMzP6StoSYi7NDYbMPMGzIE2kQ8zMQ2O6Ms6mqGZ3p8
	gcAnasaguggMZ5SMaEnqa05hkJtbd7tP+G9VlHJbzoXSMuPc5jfOnWQ+4/FecPa+u2ARTwijbKj
	1lre4HkrQ/4tDp/JupfSf1YY=
X-Received: by 2002:a05:6a20:db95:b0:3de:7dd6:ff8f with SMTP id adf61e73a8af0-3e7bfc0fce4mr7504911637.50.1793101400652;
        Tue, 27 Oct 2026 04:43:20 -0700 (PDT)
Received: from localhost ([116.86.153.182])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-cd8ccc21274sm2604064a12.8.2026.10.27.04.43.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 27 Oct 2026 04:43:19 -0700 (PDT)
Date: Tue, 27 Oct 2026 19:43:17 +0800
From: Chris Down <chris@chrisdown.name>
To: Andrew Morton <akpm@linux-foundation.org>,
	"Liam R. Howlett" <liam@infradead.org>,
	Lorenzo Stoakes <ljs@kernel.org>
Cc: Vlastimil Babka <vbabka@kernel.org>, Jann Horn <jannh@google.com>,
	Pedro Falcato <pfalcato@suse.de>,
	David Hildenbrand <david@kernel.org>, Kees Cook <kees@kernel.org>,
	Jeff Xu <jeffxu@chromium.org>, Andrey Vagin <avagin@gmail.com>,
	Alexander Mikhalitsyn <alexander@mihalicyn.com>,
	Paul Moore <paul@paul-moore.com>, James Morris <jmorris@namei.org>,
	"Serge E. Hallyn" <serge@hallyn.com>, Shuah Khan <shuah@kernel.org>,
	Jonathan Corbet <corbet@lwn.net>, linux-mm@kvack.org,
	linux-hardening@vger.kernel.org,
	linux-security-module@vger.kernel.org,
	linux-kselftest@vger.kernel.org, linux-doc@vger.kernel.org,
	linux-kernel@vger.kernel.org, kernel-team@meta.com
Subject: [PATCH 2/3] mseal sysmap: Allow with CHECKPOINT_RESTORE, default off
Message-ID: <7ff59c2ab6c234ca4d799f862eb7c3f22d671f99.1793094611.git.chris@chrisdown.name>
References: <cover.1793094611.git.chris@chrisdown.name>
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Post: <mailto:linux-kselftest@vger.kernel.org>
List-Help: <mailto:linux-kselftest+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kselftest+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <cover.1793094611.git.chris@chrisdown.name>
User-Agent: Mutt/2.3.3 (9073d26d) (2026-06-12)

MSEAL_SYSTEM_MAPPINGS depends on !CHECKPOINT_RESTORE because CRIU moves
system mappings when restoring a process. Now that sealing can be chosen
at boot we should instead use this to determine defaults.

Let's add MSEAL_SYSTEM_MAPPINGS_DEFAULT_ON and move the dependency
there. Existing configurations retain their behaviour. Kernels built
with CHECKPOINT_RESTORE can build sealing in, but will only seal
mappings when explicitly requested with mseal_system_mappings=1.

Hosts can also share a kernel built with MSEAL_SYSTEM_MAPPINGS=y and
MSEAL_SYSTEM_MAPPINGS_DEFAULT_ON=n, enabling sealing only where needed.
This lets hosts which need sealing share the kernel image with hosts
which need their system mappings to remain movable, which simplifies
deployment.

Signed-off-by: Chris Down <chris@chrisdown.name>
---
 .../admin-guide/kernel-parameters.txt         |  2 +-
 Documentation/userspace-api/mseal.rst         |  4 +-
 mm/mseal.c                                    |  3 +-
 security/Kconfig                              | 17 +++++++-
 .../selftests/mseal_system_mappings/Makefile  |  2 +
 .../selftests/mseal_system_mappings/config    |  2 +
 .../mseal_system_mappings/sysmap_is_sealed.c  | 42 ++++++++++++++++++-
 7 files changed, 66 insertions(+), 6 deletions(-)

diff --git a/Documentation/admin-guide/kernel-parameters.txt b/Documentation/admin-guide/kernel-parameters.txt
index b1ec9a8a979e..628f4cccd38e 100644
--- a/Documentation/admin-guide/kernel-parameters.txt
+++ b/Documentation/admin-guide/kernel-parameters.txt
@@ -4275,7 +4275,7 @@ Kernel parameters
 			whether system mappings are sealed for this boot.
 			See Documentation/userspace-api/mseal.rst.
 			Format: <bool>
-			Default: 1 (enabled).
+			Default set by CONFIG_MSEAL_SYSTEM_MAPPINGS_DEFAULT_ON.
 
 	mtdparts=	[MTD]
 			See drivers/mtd/parsers/cmdlinepart.c
diff --git a/Documentation/userspace-api/mseal.rst b/Documentation/userspace-api/mseal.rst
index 4e50215e4762..c1d6dbb006dc 100644
--- a/Documentation/userspace-api/mseal.rst
+++ b/Documentation/userspace-api/mseal.rst
@@ -143,7 +143,9 @@ Use cases
   If supported by an architecture (CONFIG_ARCH_SUPPORTS_MSEAL_SYSTEM_MAPPINGS),
   the CONFIG_MSEAL_SYSTEM_MAPPINGS seals all system mappings of this
   architecture. The kernel command line parameter
-  ``mseal_system_mappings=0`` turns this off at boot.
+  ``mseal_system_mappings=0|1`` turns this off or on at boot. The default is
+  set by CONFIG_MSEAL_SYSTEM_MAPPINGS_DEFAULT_ON, which is off with
+  CONFIG_CHECKPOINT_RESTORE.
 
   WARNING: This feature breaks programs which rely on relocating
   or unmapping system mappings. Known broken software at the time
diff --git a/mm/mseal.c b/mm/mseal.c
index e0563796cfa3..8f2f2a149915 100644
--- a/mm/mseal.c
+++ b/mm/mseal.c
@@ -19,7 +19,8 @@
 #include "internal.h"
 
 #ifdef CONFIG_MSEAL_SYSTEM_MAPPINGS
-bool mseal_sysmap_enabled __ro_after_init = true;
+bool mseal_sysmap_enabled __ro_after_init =
+	IS_ENABLED(CONFIG_MSEAL_SYSTEM_MAPPINGS_DEFAULT_ON);
 
 static int __init early_mseal_sysmap(char *buf)
 {
diff --git a/security/Kconfig b/security/Kconfig
index d5e83af1bfc6..6a6323e0897d 100644
--- a/security/Kconfig
+++ b/security/Kconfig
@@ -53,7 +53,6 @@ config MSEAL_SYSTEM_MAPPINGS
 	bool "mseal system mappings"
 	depends on 64BIT
 	depends on ARCH_SUPPORTS_MSEAL_SYSTEM_MAPPINGS
-	depends on !CHECKPOINT_RESTORE
 	help
 	  Apply mseal on system mappings.
 	  The system mappings includes vdso, vvar, vvar_vclock,
@@ -67,11 +66,25 @@ config MSEAL_SYSTEM_MAPPINGS
 	  of writing includes CHECKPOINT_RESTORE, UML, gVisor, rr. Therefore
 	  this config can't be enabled universally.
 
-	  Sealing can be turned off at boot with "mseal_system_mappings=0".
+	  The "mseal_system_mappings=" kernel command line parameter can
+	  be used to enable or disable sealing at boot. The default is set
+	  by MSEAL_SYSTEM_MAPPINGS_DEFAULT_ON.
 
 	  For complete descriptions of memory sealing, please see
 	  Documentation/userspace-api/mseal.rst
 
+config MSEAL_SYSTEM_MAPPINGS_DEFAULT_ON
+	bool "Seal system mappings by default"
+	depends on MSEAL_SYSTEM_MAPPINGS
+	depends on !CHECKPOINT_RESTORE
+	default y
+	help
+	  Sets the default for the "mseal_system_mappings=" boot parameter.
+
+	  With CHECKPOINT_RESTORE=y, system mappings are only sealed when
+	  "mseal_system_mappings=1" is given, since CRIU needs to move them
+	  when restoring a process.
+
 config SECURITY
 	bool "Enable different security models"
 	depends on SYSFS
diff --git a/tools/testing/selftests/mseal_system_mappings/Makefile b/tools/testing/selftests/mseal_system_mappings/Makefile
index 2b4504e2f52f..d3b88af06c94 100644
--- a/tools/testing/selftests/mseal_system_mappings/Makefile
+++ b/tools/testing/selftests/mseal_system_mappings/Makefile
@@ -1,6 +1,8 @@
 # SPDX-License-Identifier: GPL-2.0-only
 CFLAGS += -std=c99 -pthread -Wall $(KHDR_INCLUDES)
 
+LDLIBS += -lz
+
 TEST_GEN_PROGS := sysmap_is_sealed
 
 include ../lib.mk
diff --git a/tools/testing/selftests/mseal_system_mappings/config b/tools/testing/selftests/mseal_system_mappings/config
index 675cb9f37b86..493bbf834a84 100644
--- a/tools/testing/selftests/mseal_system_mappings/config
+++ b/tools/testing/selftests/mseal_system_mappings/config
@@ -1 +1,3 @@
 CONFIG_MSEAL_SYSTEM_MAPPINGS=y
+CONFIG_IKCONFIG=y
+CONFIG_IKCONFIG_PROC=y
diff --git a/tools/testing/selftests/mseal_system_mappings/sysmap_is_sealed.c b/tools/testing/selftests/mseal_system_mappings/sysmap_is_sealed.c
index 97348c2a0689..ea75ad537620 100644
--- a/tools/testing/selftests/mseal_system_mappings/sysmap_is_sealed.c
+++ b/tools/testing/selftests/mseal_system_mappings/sysmap_is_sealed.c
@@ -10,6 +10,8 @@
 #include <unistd.h>
 #include <string.h>
 #include <stdbool.h>
+#include <sys/utsname.h>
+#include <zlib.h>
 
 #include "kselftest.h"
 #include "kselftest_harness.h"
@@ -52,14 +54,52 @@ static int parse_bool(const char *s, bool *res)
 	return -EINVAL;
 }
 
+static int sysmap_config_expected(int *enabled)
+{
+	struct utsname uts;
+	char line[MAX_LINE_LEN];
+	bool default_on = false;
+	gzFile config;
+	int expected;
+
+	*enabled = -1;
+	config = gzopen("/proc/config.gz", "rb");
+	if (!config && !uname(&uts)) {
+		snprintf(line, sizeof(line), "/boot/config-%s", uts.release);
+		config = gzopen(line, "rb");
+	}
+	if (!config)
+		return -1;
+
+	while (gzgets(config, line, sizeof(line))) {
+		if (!strcmp(line, "CONFIG_MSEAL_SYSTEM_MAPPINGS=y\n"))
+			*enabled = 1;
+		else if (!strcmp(line,
+				 "# CONFIG_MSEAL_SYSTEM_MAPPINGS is not set\n"))
+			*enabled = 0;
+		else if (!strcmp(line,
+				 "CONFIG_MSEAL_SYSTEM_MAPPINGS_DEFAULT_ON=y\n"))
+			default_on = true;
+	}
+	if (!gzeof(config))
+		*enabled = -1;
+	expected = *enabled < 0 ? -1 : *enabled && default_on;
+	gzclose(config);
+	return expected;
+}
+
 static int sysmap_sealed_expected(void)
 {
 	char cmdline[4096], *tok, *save;
-	int sealed = 1;
+	int enabled, sealed;
 	bool value;
 	size_t len;
 	FILE *f;
 
+	sealed = sysmap_config_expected(&enabled);
+	if (!enabled)
+		return 0;
+
 	f = fopen("/proc/cmdline", "r");
 	if (!f)
 		return -1;
-- 
2.54.0

