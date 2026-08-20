Received: from foss.arm.com (foss.arm.com [217.140.110.172])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7EDB04772AB;
	Thu, 20 Aug 2026 15:34:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.140.110.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787240055; cv=none; b=p7MjwkuaLIZGWR+KS29drZ7XJ7fCLH08Czysv+yvQ50sdPKbMQk9XuZ8hY9IK7eVcgjoV4+5OlMRMrRGxyG9kLyMb1k4BKgfvjqV1aTtiDis0Q5UY12foOPojDyuBreOd+33m7ZzwRRWyyU86SDq1TNT4gSkuiaCYNo2x9z5idQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787240055; c=relaxed/simple;
	bh=D+dw7q4S0N+yJRYhBUe7UafbY5UCUkJuweMW4eXTnyM=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=BqBJJfdSCDLoy1L4I7NBjL1g2jDmG9fUU19qfwREWZbOox5OwlA1a3eX4u4EdKCdUcNKTz1lX48NLFqy21i5qXB3hA8PBJwHmapjaTeVmLTzHliBkqSkrTVrmTEGKNjhLDvV+nfxQ9ZUlSbF0aRZlQqMCxYUmekV6EK9OjtT7ZA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com; spf=pass smtp.mailfrom=arm.com; dkim=pass (1024-bit key) header.d=arm.com header.i=@arm.com header.b=hcAJQxBJ; arc=none smtp.client-ip=217.140.110.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=arm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=arm.com header.i=@arm.com header.b="hcAJQxBJ"
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 115B41D31;
	Thu, 20 Aug 2026 08:34:09 -0700 (PDT)
Received: from e142334-100.cambridge.arm.com (e142334-100.cambridge.arm.com [10.2.198.93])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id 1ED753F763;
	Thu, 20 Aug 2026 08:34:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1787240052; bh=D+dw7q4S0N+yJRYhBUe7UafbY5UCUkJuweMW4eXTnyM=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=hcAJQxBJ99jeN2FBGZx4KLmW6K1tUomD2sPRr/GElxK2E5lma7f/fqEMbOs0gLeRA
	 ycH4w7bs81Xhjqll4F1K+eXNRJsHhUadwAGQC8CmHYBUTHpwXra/9+f8zXTIVAIG8E
	 4cfzSgLjkeHvkfIUyJiEuYLZ92/jZp76UVWSJSPI=
From: Muhammad Usama Anjum <usama.anjum@arm.com>
To: Catalin Marinas <catalin.marinas@arm.com>,
	Will Deacon <will@kernel.org>,
	Mark Rutland <mark.rutland@arm.com>,
	Shuah Khan <shuah@kernel.org>,
	Andrey Konovalov <andreyknvl@gmail.com>,
	Andrew Morton <akpm@linux-foundation.org>,
	Vincenzo Frascino <vincenzo.frascino@arm.com>,
	Amit Daniel Kachhap <amit.kachhap@arm.com>,
	Mark Brown <broonie@kernel.org>,
	Yeoreum Yun <yeoreum.yun@arm.com>,
	linux-kernel@vger.kernel.org (open list),
	linux-arm-kernel@lists.infradead.org (moderated list:ARM64 PORT (AARCH64 ARCHITECTURE)),
	linux-kselftest@vger.kernel.org (open list:KERNEL SELFTEST FRAMEWORK)
Cc: Muhammad Usama Anjum <usama.anjum@arm.com>
Subject: [PATCH 2/4] selftest/arm64: Treat KSM merge_across_nodes as optional
Date: Thu, 20 Aug 2026 16:33:24 +0100
Message-ID: <20260820153331.2448875-3-usama.anjum@arm.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20260820153331.2448875-1-usama.anjum@arm.com>
References: <20260820153331.2448875-1-usama.anjum@arm.com>
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The MTE KSM test unconditionally saves, enables and restores the
merge_across_nodes sysfs attribute. The kernel only creates this
attribute when CONFIG_NUMA=y. A non-NUMA kernel consequently prints the
following message three times even though all KSM subtests pass:

  # ERR: missing /sys/kernel/mm/ksm/merge_across_nodes

Check whether the attribute exists and only access it when present. This
preserves the existing setup and restore behavior on NUMA kernels without
requiring NUMA or reducing KSM coverage on single-node systems.

Fixes: f981d8fa2646 ("kselftest/arm64: Verify KSM page merge for MTE pages")
Signed-off-by: Muhammad Usama Anjum <usama.anjum@arm.com>
---
 .../testing/selftests/arm64/mte/check_ksm_options.c  | 12 +++++++++---
 1 file changed, 9 insertions(+), 3 deletions(-)

diff --git a/tools/testing/selftests/arm64/mte/check_ksm_options.c b/tools/testing/selftests/arm64/mte/check_ksm_options.c
index 0cf5faef17248..b36945fc883d3 100644
--- a/tools/testing/selftests/arm64/mte/check_ksm_options.c
+++ b/tools/testing/selftests/arm64/mte/check_ksm_options.c
@@ -6,6 +6,7 @@
 #include <errno.h>
 #include <fcntl.h>
 #include <signal.h>
+#include <stdbool.h>
 #include <stdio.h>
 #include <stdlib.h>
 #include <string.h>
@@ -22,6 +23,7 @@
 
 static size_t page_sz;
 static unsigned long ksm_sysfs[5];
+static bool has_merge_across_nodes;
 
 static unsigned long read_sysfs(char *str)
 {
@@ -56,8 +58,11 @@ static void write_sysfs(char *str, unsigned long val)
 
 static void mte_ksm_setup(void)
 {
-	ksm_sysfs[0] = read_sysfs(PATH_KSM "merge_across_nodes");
-	write_sysfs(PATH_KSM "merge_across_nodes", 1);
+	has_merge_across_nodes = !access(PATH_KSM "merge_across_nodes", F_OK);
+	if (has_merge_across_nodes) {
+		ksm_sysfs[0] = read_sysfs(PATH_KSM "merge_across_nodes");
+		write_sysfs(PATH_KSM "merge_across_nodes", 1);
+	}
 	ksm_sysfs[1] = read_sysfs(PATH_KSM "sleep_millisecs");
 	write_sysfs(PATH_KSM "sleep_millisecs", 0);
 	ksm_sysfs[2] = read_sysfs(PATH_KSM "run");
@@ -70,7 +75,8 @@ static void mte_ksm_setup(void)
 
 static void mte_ksm_restore(void)
 {
-	write_sysfs(PATH_KSM "merge_across_nodes", ksm_sysfs[0]);
+	if (has_merge_across_nodes)
+		write_sysfs(PATH_KSM "merge_across_nodes", ksm_sysfs[0]);
 	write_sysfs(PATH_KSM "sleep_millisecs", ksm_sysfs[1]);
 	write_sysfs(PATH_KSM "run", ksm_sysfs[2]);
 	write_sysfs(PATH_KSM "max_page_sharing", ksm_sysfs[3]);
-- 
2.47.3

