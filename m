Received: from foss.arm.com (foss.arm.com [217.140.110.172])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5559E3FE650;
	Tue, 25 Aug 2026 11:19:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.140.110.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787656779; cv=none; b=bZAqBCjL6hNBIaxDq78/1A3qyBJWc5Zm9b9X8lQDeKmhQlTQLfv1a1H2JInypp0XPhqQ4eRU2vTYW/96TzqL8nDXUB668mitwBtU1niPOw3cPmKiuYiV6fOBYfXNR4sg+4G5eZfUGxTbhOn0+JgvH34/ufwj7BJ/shlvz6N2Y/o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787656779; c=relaxed/simple;
	bh=Y1Jm9L8yq2zLLxZ+1oux911Vfzwh3bqWb+6GBVfCttY=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=iOB8auCIETgNXjyOU8/hdMgphR1Vw+KE0mn7ouV4j5guoH6Jf9LIFvxiZPpbgt+UitP7tr+wH6Tn0AJXvSW2seCifMTvx/DX1fBy9grg+zEV78LIR8tji5fWO5yBK57I8HXEYEJvjh/GMl68cUOdmJJIe17E1HELGsjbtlHOOxA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com; spf=pass smtp.mailfrom=arm.com; dkim=pass (1024-bit key) header.d=arm.com header.i=@arm.com header.b=MGRmZ9//; arc=none smtp.client-ip=217.140.110.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=arm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=arm.com header.i=@arm.com header.b="MGRmZ9//"
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id D62B1153B;
	Tue, 25 Aug 2026 04:19:32 -0700 (PDT)
Received: from e142334-100.cambridge.arm.com (e142334-100.cambridge.arm.com [10.2.198.93])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id F3FDD3F66F;
	Tue, 25 Aug 2026 04:19:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1787656776; bh=Y1Jm9L8yq2zLLxZ+1oux911Vfzwh3bqWb+6GBVfCttY=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=MGRmZ9//+KJRAOFuhZSDw7Zy4T/DqMF4lMScreEy/Cj23WmOGrqxFWASnk+UyXAz+
	 B8dSJDnH4kJ+4jWZnsEIjc7jCbyNHsA7siRCPcHSgYYFUhASkBFWPEYdZtyOYqZngr
	 6F7c+WfXtF6w7rkL+brmd7jriOF1y3WS9g2nXCow=
From: Muhammad Usama Anjum <usama.anjum@arm.com>
To: Catalin Marinas <catalin.marinas@arm.com>,
	Will Deacon <will@kernel.org>,
	Mark Rutland <mark.rutland@arm.com>,
	Shuah Khan <shuah@kernel.org>,
	Vincenzo Frascino <vincenzo.frascino@arm.com>,
	Andrey Konovalov <andreyknvl@gmail.com>,
	Andrew Morton <akpm@linux-foundation.org>,
	Amit Daniel Kachhap <amit.kachhap@arm.com>,
	Yeoreum Yun <yeoreum.yun@arm.com>,
	Mark Brown <broonie@kernel.org>,
	linux-kernel@vger.kernel.org (open list),
	linux-arm-kernel@lists.infradead.org (moderated list:ARM64 PORT (AARCH64 ARCHITECTURE)),
	linux-kselftest@vger.kernel.org (open list:KERNEL SELFTEST FRAMEWORK)
Cc: Muhammad Usama Anjum <usama.anjum@arm.com>
Subject: [PATCH v3 2/4] selftests/arm64: Treat KSM merge_across_nodes as optional
Date: Tue, 25 Aug 2026 12:18:35 +0100
Message-ID: <20260825111929.2882324-3-usama.anjum@arm.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20260825111929.2882324-1-usama.anjum@arm.com>
References: <20260825111929.2882324-1-usama.anjum@arm.com>
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The MTE KSM test requires write access to KSM sysfs but does not check
that it is running as root. It also unconditionally saves, enables and
restores the merge_across_nodes attribute. The kernel only creates this
attribute when CONFIG_NUMA=y, so a non-NUMA kernel prints the following
message three times even though every KSM subtest passes:

  # ERR: missing /sys/kernel/mm/ksm/merge_across_nodes

Skip the test when it is not running as root. Check that the optional
attribute is readable and writable, treating ENOENT as its expected
absence on non-NUMA kernels and skipping the test for other access
failures. Only save, enable and restore the attribute when it is
available.

Check MTE availability before the privilege and sysfs checks so systems
without MTE retain the existing feature-unavailable skip result.

This preserves the existing behavior on NUMA kernels without requiring
NUMA or reducing KSM coverage on single-node systems.

Fixes: f981d8fa2646 ("kselftest/arm64: Verify KSM page merge for MTE pages")
Signed-off-by: Muhammad Usama Anjum <usama.anjum@arm.com>
---
Changes since v2:
- Skip on merge_across_nodes access errors other than ENOENT.

Changes since v1:
- Check MTE availability before requiring root and validating
  merge_across_nodes access.
- Use the selftests/arm64 subject prefix.
---
 .../selftests/arm64/mte/check_ksm_options.c   | 29 +++++++++++++++++--
 1 file changed, 26 insertions(+), 3 deletions(-)

diff --git a/tools/testing/selftests/arm64/mte/check_ksm_options.c b/tools/testing/selftests/arm64/mte/check_ksm_options.c
index 866f0929b6647..4855b737d5507 100644
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
@@ -22,6 +23,20 @@
 
 static size_t page_sz;
 static unsigned long ksm_sysfs[5];
+static bool has_merge_across_nodes;
+
+static bool merge_across_nodes_available(void)
+{
+	const char *path = PATH_KSM "merge_across_nodes";
+
+	if (!access(path, R_OK | W_OK))
+		return true;
+	if (errno == ENOENT)
+		return false;
+
+	ksft_exit_skip("Unable to read and write %s: %s\n", path,
+		       strerror(errno));
+}
 
 static unsigned long read_sysfs(char *str)
 {
@@ -56,8 +71,10 @@ static void write_sysfs(char *str, unsigned long val)
 
 static void mte_ksm_setup(void)
 {
-	ksm_sysfs[0] = read_sysfs(PATH_KSM "merge_across_nodes");
-	write_sysfs(PATH_KSM "merge_across_nodes", 1);
+	if (has_merge_across_nodes) {
+		ksm_sysfs[0] = read_sysfs(PATH_KSM "merge_across_nodes");
+		write_sysfs(PATH_KSM "merge_across_nodes", 1);
+	}
 	ksm_sysfs[1] = read_sysfs(PATH_KSM "sleep_millisecs");
 	write_sysfs(PATH_KSM "sleep_millisecs", 0);
 	ksm_sysfs[2] = read_sysfs(PATH_KSM "run");
@@ -70,7 +87,8 @@ static void mte_ksm_setup(void)
 
 static void mte_ksm_restore(void)
 {
-	write_sysfs(PATH_KSM "merge_across_nodes", ksm_sysfs[0]);
+	if (has_merge_across_nodes)
+		write_sysfs(PATH_KSM "merge_across_nodes", ksm_sysfs[0]);
 	write_sysfs(PATH_KSM "sleep_millisecs", ksm_sysfs[1]);
 	write_sysfs(PATH_KSM "run", ksm_sysfs[2]);
 	write_sysfs(PATH_KSM "max_page_sharing", ksm_sysfs[3]);
@@ -137,6 +155,11 @@ int main(int argc, char *argv[])
 	err = mte_default_setup();
 	if (err)
 		return err;
+
+	if (geteuid() != 0)
+		ksft_exit_skip("Please run the test as root\n");
+
+	has_merge_across_nodes = merge_across_nodes_available();
 	page_sz = getpagesize();
 	if (!page_sz) {
 		ksft_print_msg("ERR: Unable to get page size\n");
-- 
2.47.3

