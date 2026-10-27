Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.216.51
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793101388;
	b=tKmpSkA6EUvfyt4e7I07jGk0ht2rom1eGAOqFttl96H60ncVV02xDaQyukNbfbXmLkhV
	 nxqjVc/ahdCroaTRSrRai67n7Hf99XlOcixEyA23nLEuSE7Ii+pcLCqLnEC30A7M8x1UD
	 R3+7RULkAbDuv7dqyV0k7e6zV+u0cuodCtWigXimXrmYjtBBfZ8M1AOw+sOW59BWyJzHh
	 KdAVJrljCrnSqtt1qRRaJyxQiXqpExm/81rwBtdgkoLH4Dc/uBeHQ66M+gy3/kX4KQOlL
	 X3BynDVxeyeirqtH/Y9/HGkJdoEb50+U5SBQzYckdwQFarMUpBdlJMJlAYrmOayVjhQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793101388;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To:User-Agent;
	bh=ihSaCVGXoXgLVj2uB+0zOcIYk1LHOIcOLN85o/KJU9U=;
	b=oePoxOm+7pHf3NBynsNuJv7Bu1Au/l36lvdLQfTortEjiHSLOGvKQAK+5e5gesERj7Of
	 2hrH8wNNXGV8N4XRoUHFD7Oo++xFGbJNtCLIn+w0Nul/6ZzLy3UnVVBKcD7bkDZVSd2r6
	 8kZoLp2xGk3IPjE5b2bBvxPhW87TNuoBmvDSHMyCnoTWM6NbGoZt67OqBEn0QxEOqFOey
	 pgoTOQGv9TNc5ZlqpN+DTNqTTDSnPegEATnbftHSx72atzx+qdDw7xZT8WF25YwtpJS1O
	 VmYEmXMrG4wozvA9xy43ixBMfs0uEZ6SoJZZQYQnQEbYHyDBkU3e7HuO/6O533PjmWA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=chrisdown.name;
	spf=pass smtp.mailfrom=chrisdown.name;
	dkim=pass header.d=chrisdown.name header.i=@chrisdown.name header.a=rsa-sha256 header.s=google header.b=As535jtd;
	arc=none smtp.remote-ip=209.85.216.51
Received: from mail-pj1-f51.google.com (mail-pj1-f51.google.com [209.85.216.51])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 27BFA606A7DB
	for <linux-kselftest@vger.kernel.org>; Tue, 27 Oct 2026 11:43:07 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 27BFA606A7DB
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=chrisdown.name
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chrisdown.name
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=chrisdown.name header.i=@chrisdown.name header.a=rsa-sha256 header.s=google header.b=As535jtd
Received: by mail-pj1-f51.google.com with SMTP id 98e67ed59e1d1-3acc96a256dso2268507a91.3
        for <linux-kselftest@vger.kernel.org>; Tue, 27 Oct 2026 04:43:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chrisdown.name; s=google; t=1793101387; x=1793706187; darn=vger.kernel.org;
        h=user-agent:in-reply-to:content-disposition:content-type
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=ihSaCVGXoXgLVj2uB+0zOcIYk1LHOIcOLN85o/KJU9U=;
        b=As535jtdLXNb7iaxyL40okCCk5U4IdR8pZ75J2PFR5dKbctdjvkH89fWiWt1zaEdBE
         W5QsPPwQ1fCkCco7q5FWuLqWyg/n/i+eqvSnR9CCmHFUfP7azi+JU7gZAwkwb8uEUTzO
         bFeR36R5quNPqJSASV8HVwSYKiEik4kPwXk+c=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793101387; x=1793706187;
        h=user-agent:in-reply-to:content-disposition:content-type
         :mime-version:references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=ihSaCVGXoXgLVj2uB+0zOcIYk1LHOIcOLN85o/KJU9U=;
        b=daFO8XbXdI+b9sqaVMJ4UHThNSPMXPg+hzfbjQcNhl+sELlpk2jNkk2G5UYddWx4A5
         Ez6ugvAcUgmtRd5oOmSwtUJTfH6TmEEEaGG6Q+nOMZEQS96IsallZZN6uBJgtNhXTn3Z
         73B8UH+gMjee/EPJBYvIoLWP1LLSlVrQEguzAmvbOW3l8IYLi2oDIpXlRYnisuFRxzds
         /wjF8syYt/pB6aqdnHKuoVWxnTx3W+uYY3a8LXbUJiagN+hwX0FQtNNVSUtrfc/sQz1Z
         8Yh3AGMsND4wILFd7W/V6EppeDBy/tWRYErWGRk9NVnqF/qGmirZcAHZRr9a4Ana78PL
         N0VQ==
X-Forwarded-Encrypted: i=1; AKwUvBz6owvwnI6ZmKjQkv74pUfcznIYvbDTrhrKNtVE0FDQSWlpiPLUtDvcbwePz/t+BGE4LBCCm9G9v5JmzmLVZb4=@vger.kernel.org
X-Gm-Message-State: AFq9FYJwdmJ6PGkuJuTJoJwr0ApdH/At46ZVhnM9i+ZrCh3Dyk9X+o8Q
	x7skhx+hddjOj1BsZFGguiFaCFsqx7y1Ss8o1TG4Rw2enJttU3vvGJZlMWRgTV0w7bs=
X-Gm-Gg: AYBFou3P+cX6KEk0ZlzCu5rzerhdviN7dOLjiOtwvrX3MV1GpInFUlP82GNCrpuQo9t
	wYqCAQO5tLLr5URZoFbz1prTuuw3araJuBttLbvRDlKSU6Qg2OOlAjbvQ3CxZAl6kp7v+Um+sJy
	A2jQHSVYsJhJ5A7+QQvuGkiSnItkB2yzNfV+WNND5pR/S9tlzh1NLiaE8mt5Krf9xFlNcRVtzX4
	kGp9LHttOFchCvsWYIZ2ZSvYidPjBpt7tEth5fadkBicuepzoWiB4BirlDvV23h3Qn+L472LmDr
	YaIxy3bNiXHtga1IGjt+HGkoUfGskaOGvBjDNEI2nFuOOLhZjaX8guRH9c4VTqylL+DugsERF/e
	qBiV8sYv0afrx4PiakSosIV8CB45edSOkGCp8rvm+8rsxlQceKQislw5o8kGM65dscNfNLT3aCB
	NgoA//+mbggpFPjbwoJsUHm1hsCXZrOzgrZIPIA51X/zH1AseHCyu1YYSUzqp2ZtRhx905IpOO8
	0cVKDdSCaMv+ZAcBnAMfCzX+S6HEe1ESMcF83j1q5t6zX6blAzOWiCZ98X1hbrZhH1yi2FSxlHf
	9xJhX8C0tZcICAJ9+EcyDAlQoxXOfKfN1mirYua87G94oPzkUBkEZLd5w87VAUqVmhxYrd2EwpV
	MiHOr0pqMnT0BE61DcTTY+3M=
X-Received: by 2002:a17:90b:3e4d:b0:3ac:adce:60b2 with SMTP id 98e67ed59e1d1-3ade9b2ce76mr8135222a91.2.1793101387414;
        Tue, 27 Oct 2026 04:43:07 -0700 (PDT)
Received: from localhost ([116.86.153.182])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3ae40469a44sm3591664a91.14.2026.10.27.04.43.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 27 Oct 2026 04:43:06 -0700 (PDT)
Date: Tue, 27 Oct 2026 19:43:04 +0800
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
Subject: [PATCH 1/3] mseal sysmap: Add mseal_system_mappings= boot parameter
Message-ID: <5bd3c89d733ad22224f296dfa8900769de937de0.1793094611.git.chris@chrisdown.name>
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

CONFIG_MSEAL_SYSTEM_MAPPINGS seals each process' system mappings when
they are created. As it is today this can only be toggled at build time,
so hosts that need sealing and hosts running software which moves or
unmaps these mappings end up with separate kernels. This is not ideal
since it adds more complexity of deployment, it would be great to be
able to have one kernel which can configurably do both.

So, to improve this, let's add mseal_system_mappings= so that this can
be chosen at boot.

Signed-off-by: Chris Down <chris@chrisdown.name>
---
 .../admin-guide/kernel-parameters.txt         |   7 ++
 Documentation/userspace-api/mseal.rst         |   3 +-
 include/linux/mm.h                            |   3 +-
 mm/mseal.c                                    |  12 ++
 security/Kconfig                              |   2 +
 .../mseal_system_mappings/sysmap_is_sealed.c  | 104 +++++++++++++++---
 6 files changed, 115 insertions(+), 16 deletions(-)

diff --git a/Documentation/admin-guide/kernel-parameters.txt b/Documentation/admin-guide/kernel-parameters.txt
index e75344f4e0cd..b1ec9a8a979e 100644
--- a/Documentation/admin-guide/kernel-parameters.txt
+++ b/Documentation/admin-guide/kernel-parameters.txt
@@ -4270,6 +4270,13 @@ Kernel parameters
 	MTD_Region=	[MTD] Format:
 			<name>,<region-number>[,<base>,<size>,<buswidth>,<altbuswidth>]
 
+	mseal_system_mappings=
+			[KNL,EARLY] Under CONFIG_MSEAL_SYSTEM_MAPPINGS,
+			whether system mappings are sealed for this boot.
+			See Documentation/userspace-api/mseal.rst.
+			Format: <bool>
+			Default: 1 (enabled).
+
 	mtdparts=	[MTD]
 			See drivers/mtd/parsers/cmdlinepart.c
 
diff --git a/Documentation/userspace-api/mseal.rst b/Documentation/userspace-api/mseal.rst
index c039d782f9f5..4e50215e4762 100644
--- a/Documentation/userspace-api/mseal.rst
+++ b/Documentation/userspace-api/mseal.rst
@@ -142,7 +142,8 @@ Use cases
 
   If supported by an architecture (CONFIG_ARCH_SUPPORTS_MSEAL_SYSTEM_MAPPINGS),
   the CONFIG_MSEAL_SYSTEM_MAPPINGS seals all system mappings of this
-  architecture.
+  architecture. The kernel command line parameter
+  ``mseal_system_mappings=0`` turns this off at boot.
 
   WARNING: This feature breaks programs which rely on relocating
   or unmapping system mappings. Known broken software at the time
diff --git a/include/linux/mm.h b/include/linux/mm.h
index 5f82be0fcde5..2329d81b7d46 100644
--- a/include/linux/mm.h
+++ b/include/linux/mm.h
@@ -568,7 +568,8 @@ enum {
 #define VM_STACK_FLAGS vma_flags_to_legacy(VMA_STACK_FLAGS)
 
 #ifdef CONFIG_MSEAL_SYSTEM_MAPPINGS
-#define VM_SEALED_SYSMAP	VM_SEALED
+extern bool mseal_sysmap_enabled;
+#define VM_SEALED_SYSMAP	(mseal_sysmap_enabled ? VM_SEALED : VM_NONE)
 #else
 #define VM_SEALED_SYSMAP	VM_NONE
 #endif
diff --git a/mm/mseal.c b/mm/mseal.c
index 7a8ac66dc215..e0563796cfa3 100644
--- a/mm/mseal.c
+++ b/mm/mseal.c
@@ -7,6 +7,8 @@
  *  Author: Jeff Xu <jeffxu@chromium.org>
  */
 
+#include <linux/init.h>
+#include <linux/kstrtox.h>
 #include <linux/mempolicy.h>
 #include <linux/minmax.h>
 #include <linux/mman.h>
@@ -16,6 +18,16 @@
 #include <linux/sched.h>
 #include "internal.h"
 
+#ifdef CONFIG_MSEAL_SYSTEM_MAPPINGS
+bool mseal_sysmap_enabled __ro_after_init = true;
+
+static int __init early_mseal_sysmap(char *buf)
+{
+	return kstrtobool(buf, &mseal_sysmap_enabled);
+}
+early_param("mseal_system_mappings", early_mseal_sysmap);
+#endif
+
 static bool range_contains_unmapped(unsigned long start, unsigned long end)
 {
 	VMA_ITERATOR(vmi, current->mm, start);
diff --git a/security/Kconfig b/security/Kconfig
index f7bf6cdc6229..d5e83af1bfc6 100644
--- a/security/Kconfig
+++ b/security/Kconfig
@@ -67,6 +67,8 @@ config MSEAL_SYSTEM_MAPPINGS
 	  of writing includes CHECKPOINT_RESTORE, UML, gVisor, rr. Therefore
 	  this config can't be enabled universally.
 
+	  Sealing can be turned off at boot with "mseal_system_mappings=0".
+
 	  For complete descriptions of memory sealing, please see
 	  Documentation/userspace-api/mseal.rst
 
diff --git a/tools/testing/selftests/mseal_system_mappings/sysmap_is_sealed.c b/tools/testing/selftests/mseal_system_mappings/sysmap_is_sealed.c
index cb0ca6ed7ebe..97348c2a0689 100644
--- a/tools/testing/selftests/mseal_system_mappings/sysmap_is_sealed.c
+++ b/tools/testing/selftests/mseal_system_mappings/sysmap_is_sealed.c
@@ -1,12 +1,12 @@
 // SPDX-License-Identifier: GPL-2.0-only
 /*
- * test system mappings are sealed when
- * KCONFIG_MSEAL_SYSTEM_MAPPINGS=y
+ * Test system mapping sealing and the mseal_system_mappings= boot parameter.
  */
 
 #define _GNU_SOURCE
 #include <stdio.h>
 #include <errno.h>
+#include <ctype.h>
 #include <unistd.h>
 #include <string.h>
 #include <stdbool.h>
@@ -17,6 +17,73 @@
 #define VMFLAGS "VmFlags:"
 #define MSEAL_FLAGS "sl"
 #define MAX_LINE_LEN 512
+#define SYSMAP_PARAM "mseal_system_mappings="
+
+static int parse_bool(const char *s, bool *res)
+{
+	if (!s)
+		return -EINVAL;
+
+	switch (tolower((unsigned char)s[0])) {
+	case 'e':
+	case 'y':
+	case 't':
+	case '1':
+		*res = true;
+		return 0;
+	case 'd':
+	case 'n':
+	case 'f':
+	case '0':
+		*res = false;
+		return 0;
+	case 'o':
+		switch (tolower((unsigned char)s[1])) {
+		case 'n':
+			*res = true;
+			return 0;
+		case 'f':
+			*res = false;
+			return 0;
+		}
+		break;
+	}
+
+	return -EINVAL;
+}
+
+static int sysmap_sealed_expected(void)
+{
+	char cmdline[4096], *tok, *save;
+	int sealed = 1;
+	bool value;
+	size_t len;
+	FILE *f;
+
+	f = fopen("/proc/cmdline", "r");
+	if (!f)
+		return -1;
+	len = fread(cmdline, 1, sizeof(cmdline) - 1, f);
+	if (ferror(f) || !feof(f)) {
+		fclose(f);
+		return -1;
+	}
+	fclose(f);
+	cmdline[len] = '\0';
+
+	for (tok = strtok_r(cmdline, " \t\n", &save); tok;
+	     tok = strtok_r(NULL, " \t\n", &save)) {
+		if (!strcmp(tok, "--"))
+			break;
+		if (strncmp(tok, SYSMAP_PARAM, strlen(SYSMAP_PARAM)))
+			continue;
+
+		if (!parse_bool(tok + strlen(SYSMAP_PARAM), &value))
+			sealed = value;
+	}
+
+	return sealed;
+}
 
 bool has_mapping(char *name, FILE *maps)
 {
@@ -30,7 +97,7 @@ bool has_mapping(char *name, FILE *maps)
 	return false;
 }
 
-bool mapping_is_sealed(char *name, FILE *maps)
+int mapping_is_sealed(FILE *maps)
 {
 	char line[MAX_LINE_LEN];
 
@@ -43,7 +110,7 @@ bool mapping_is_sealed(char *name, FILE *maps)
 		}
 	}
 
-	return false;
+	return -1;
 }
 
 FIXTURE(basic) {
@@ -67,53 +134,62 @@ FIXTURE_TEARDOWN(basic)
 FIXTURE_VARIANT(basic)
 {
 	char *name;
-	bool sealed;
+	bool sysmap;
 };
 
 FIXTURE_VARIANT_ADD(basic, vdso) {
 	.name = "[vdso]",
-	.sealed = true,
+	.sysmap = true,
 };
 
 FIXTURE_VARIANT_ADD(basic, vvar) {
 	.name = "[vvar]",
-	.sealed = true,
+	.sysmap = true,
 };
 
 FIXTURE_VARIANT_ADD(basic, vvar_vclock) {
 	.name = "[vvar_vclock]",
-	.sealed = true,
+	.sysmap = true,
 };
 
 FIXTURE_VARIANT_ADD(basic, sigpage) {
 	.name = "[sigpage]",
-	.sealed = true,
+	.sysmap = true,
 };
 
 FIXTURE_VARIANT_ADD(basic, vectors) {
 	.name = "[vectors]",
-	.sealed = true,
+	.sysmap = true,
 };
 
 FIXTURE_VARIANT_ADD(basic, uprobes) {
 	.name = "[uprobes]",
-	.sealed = true,
+	.sysmap = true,
 };
 
 FIXTURE_VARIANT_ADD(basic, stack) {
 	.name = "[stack]",
-	.sealed = false,
+	.sysmap = false,
 };
 
 TEST_F(basic, check_sealed)
 {
+	int expected = 0, sealed;
+
 	if (!has_mapping(variant->name, self->maps)) {
 		SKIP(return, "could not find the mapping, %s",
 			variant->name);
 	}
 
-	EXPECT_EQ(variant->sealed,
-		mapping_is_sealed(variant->name, self->maps));
+	sealed = mapping_is_sealed(self->maps);
+	if (sealed < 0)
+		SKIP(return, "could not read the mapping's sealing state");
+	if (variant->sysmap) {
+		expected = sysmap_sealed_expected();
+		if (expected < 0)
+			SKIP(return, "could not determine the expected sealing state");
+	}
+	EXPECT_EQ(expected, sealed);
 };
 
 TEST_HARNESS_MAIN
-- 
2.54.0

