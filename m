Received: from foss.arm.com (foss.arm.com [217.140.110.172])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D3CDC443C0A;
	Fri, 11 Sep 2026 11:10:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.140.110.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789125029; cv=none; b=P/jG7ipGo+q/GPLbFDJI1Y0eCbbeQGFsV0j8ynQJ/dOBA6142MMlWD20pDJo/AYTaiYQemfuzOiuooeSMoiqRThcTtp1r/DSorMxXR36QVdDCde0d9Kl4VKsNz0foQyjbMs5mLJzSAPExmMKwdjyBDbWd6tzH+pLBHi5gn4f+6M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789125029; c=relaxed/simple;
	bh=xF0k60TEQ8akSLlQFC4CGPrBt98AU+OSQDd7D86kcZ8=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=TH7TtdhKdQLP5d8I6wuhdkRVc76PZTFj3yC4UwuTPoIPrMaFmuaTaL25kN5dd7Ta2Pm20uTHpwivMY9c4HGa0i00ukfhJiDTKUmR/5MsrcufXp4qkWHZQHXOc+Z+HvLAZXEe7XlkcIUgbbrW60eKcTNrAFZXSBHZmwXkayZTd88=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com; spf=pass smtp.mailfrom=arm.com; dkim=pass (1024-bit key) header.d=arm.com header.i=@arm.com header.b=TMFDkDYX; arc=none smtp.client-ip=217.140.110.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=arm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=arm.com header.i=@arm.com header.b="TMFDkDYX"
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 1CD72143D;
	Fri, 11 Sep 2026 04:10:20 -0700 (PDT)
Received: from a081061.blr.arm.com (a081061.arm.com [10.164.19.84])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id 25A383F59E;
	Fri, 11 Sep 2026 04:10:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1789125023; bh=xF0k60TEQ8akSLlQFC4CGPrBt98AU+OSQDd7D86kcZ8=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=TMFDkDYX+BNBgEfdATC448Ir4cZoeSnZ30u34WIpTqZ6lclNb0QAYrXKhbRfl7bqA
	 8pvy+UKS0JRTVRfIpuEAyNFRcX8h7IdVpDW4QsRm4mHnVp6WTzEiHn+sLkJKZvJzcS
	 JI8NoFSNT4vit7wtnwmGxXiBf1fkEdfmysSAZXa4=
From: Sarthak Sharma <sarthak.sharma@arm.com>
To: Andrew Morton <akpm@linux-foundation.org>,
	David Hildenbrand <david@kernel.org>
Cc: Lorenzo Stoakes <ljs@kernel.org>,
	"Liam R . Howlett" <liam@infradead.org>,
	Vlastimil Babka <vbabka@kernel.org>,
	Mike Rapoport <rppt@kernel.org>,
	Suren Baghdasaryan <surenb@google.com>,
	Michal Hocko <mhocko@suse.com>,
	Shuah Khan <shuah@kernel.org>,
	Shuah Khan <skhan@linuxfoundation.org>,
	Jonathan Corbet <corbet@lwn.net>,
	Jason Gunthorpe <jgg@ziepe.ca>,
	John Hubbard <jhubbard@nvidia.com>,
	Peter Xu <peterx@redhat.com>,
	Leon Romanovsky <leon@kernel.org>,
	Zi Yan <ziy@nvidia.com>,
	Baolin Wang <baolin.wang@linux.alibaba.com>,
	Nico Pache <npache@redhat.com>,
	Ryan Roberts <ryan.roberts@arm.com>,
	Dev Jain <dev.jain@arm.com>,
	Barry Song <baohua@kernel.org>,
	Lance Yang <lance.yang@linux.dev>,
	Mark Brown <broonie@kernel.org>,
	Anshuman Khandual <anshuman.khandual@arm.com>,
	Muhammad Usama Anjum <usama.anjum@arm.com>,
	linux-mm@kvack.org,
	linux-kselftest@vger.kernel.org,
	linux-doc@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Sarthak Sharma <sarthak.sharma@arm.com>
Subject: [PATCH v10 2/6] tools/lib/mm: add shared file helpers
Date: Fri, 11 Sep 2026 16:39:46 +0530
Message-ID: <20260911110950.200240-3-sarthak.sharma@arm.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260911110950.200240-1-sarthak.sharma@arm.com>
References: <20260911110950.200240-1-sarthak.sharma@arm.com>
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Move read_file(), write_file(), read_num(), write_num() and
write_num_ignore_einval() out of tools/testing/selftests/mm/vm_util.c
into a new shared helper under tools/lib/mm/.

These helpers are used by mm selftests today and will also be needed by
shared hugepage helpers in subsequent patches. Move them to a generic
location so they can be reused outside selftests as well.

Keep the helpers exposed to mm selftests through vm_util.h by including
the new shared header there, and link the new helper into the
selftests/mm build.

Update the explicit x86 protection_keys 32-bit and 64-bit build rules
to preserve prerequisite paths, now that file_utils.c is built from
tools/lib/mm.

Add tools/lib/mm/ to the MEMORY MANAGEMENT - MISC entry in MAINTAINERS.

Acked-by: Mike Rapoport (Microsoft) <rppt@kernel.org>
Acked-by: David Hildenbrand (Arm) <david@kernel.org>
Tested-by: Muhammad Usama Anjum <usama.anjum@arm.com>
Signed-off-by: Sarthak Sharma <sarthak.sharma@arm.com>
---
 MAINTAINERS                          |   1 +
 tools/lib/mm/file_utils.c            | 106 +++++++++++++++++++++++++++
 tools/lib/mm/file_utils.h            |  13 ++++
 tools/testing/selftests/mm/Makefile  |  11 +--
 tools/testing/selftests/mm/vm_util.c |  97 ------------------------
 tools/testing/selftests/mm/vm_util.h |   7 +-
 6 files changed, 127 insertions(+), 108 deletions(-)
 create mode 100644 tools/lib/mm/file_utils.c
 create mode 100644 tools/lib/mm/file_utils.h

diff --git a/MAINTAINERS b/MAINTAINERS
index 35262aa3e67e..dd5374a1a3c2 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -17295,6 +17295,7 @@ F:	mm/memory-tiers.c
 F:	mm/page_idle.c
 F:	mm/pgalloc-track.h
 F:	mm/process_vm_access.c
+F:	tools/lib/mm/
 F:	tools/testing/selftests/mm/
 
 MEMORY MANAGEMENT - NUMA MEMBLOCKS AND NUMA EMULATION
diff --git a/tools/lib/mm/file_utils.c b/tools/lib/mm/file_utils.c
new file mode 100644
index 000000000000..9b2237e9823e
--- /dev/null
+++ b/tools/lib/mm/file_utils.c
@@ -0,0 +1,106 @@
+// SPDX-License-Identifier: GPL-2.0
+#include <errno.h>
+#include <fcntl.h>
+#include <stdio.h>
+#include <stdlib.h>
+#include <string.h>
+#include <unistd.h>
+
+#include "file_utils.h"
+
+int read_file(const char *path, char *buf, size_t buflen)
+{
+	int fd, err;
+	ssize_t numread;
+
+	fd = open(path, O_RDONLY);
+	if (fd == -1)
+		return -errno;
+
+	numread = read(fd, buf, buflen - 1);
+	if (numread < 1) {
+		err = numread ? errno : ENODATA;
+		close(fd);
+		return -err;
+	}
+
+	buf[numread] = '\0';
+	close(fd);
+
+	return 0;
+}
+
+int write_file(const char *path, const char *buf, size_t buflen)
+{
+	int fd, saved_errno;
+	ssize_t numwritten;
+
+	if (buflen < 2)
+		return -EINVAL;
+
+	fd = open(path, O_WRONLY);
+	if (fd == -1)
+		return -errno;
+
+	numwritten = write(fd, buf, buflen - 1);
+	saved_errno = errno;
+	close(fd);
+
+	if (numwritten < 0)
+		return -saved_errno;
+
+	if (numwritten != (ssize_t)(buflen - 1))
+		return -EIO;
+
+	return 0;
+}
+
+int read_num(const char *path, unsigned long *num)
+{
+	unsigned long val;
+	int ret;
+	char buf[21];
+	char *end;
+
+	if (!num)
+		return -EINVAL;
+
+	ret = read_file(path, buf, sizeof(buf));
+	if (ret)
+		return ret;
+
+	/* Reject signs and leading whitespace that are accepted by strtoul() */
+	if (buf[0] < '0' || buf[0] > '9')
+		return -EINVAL;
+
+	errno = 0;
+	val = strtoul(buf, &end, 10);
+	if (errno)
+		return -errno;
+
+	/* Only allow a newline after the number */
+	if (*end == '\n')
+		end++;
+
+	if (*end != '\0')
+		return -EINVAL;
+
+	*num = val;
+	return 0;
+}
+
+int write_num(const char *path, unsigned long num)
+{
+	char buf[21];
+
+	sprintf(buf, "%lu", num);
+	return write_file(path, buf, strlen(buf) + 1);
+}
+
+int write_num_ignore_einval(const char *path, unsigned long num)
+{
+	int ret;
+
+	ret = write_num(path, num);
+	return ret == -EINVAL ? 0 : ret;
+}
diff --git a/tools/lib/mm/file_utils.h b/tools/lib/mm/file_utils.h
new file mode 100644
index 000000000000..50daa82c2b2b
--- /dev/null
+++ b/tools/lib/mm/file_utils.h
@@ -0,0 +1,13 @@
+/* SPDX-License-Identifier: GPL-2.0 */
+#ifndef __MM_FILE_UTILS_H__
+#define __MM_FILE_UTILS_H__
+
+#include <stddef.h>
+
+int read_file(const char *path, char *buf, size_t buflen);
+int write_file(const char *path, const char *buf, size_t buflen);
+int read_num(const char *path, unsigned long *num);
+int write_num(const char *path, unsigned long num);
+int write_num_ignore_einval(const char *path, unsigned long num);
+
+#endif
diff --git a/tools/testing/selftests/mm/Makefile b/tools/testing/selftests/mm/Makefile
index 2d5366196e30..61d974d2cbae 100644
--- a/tools/testing/selftests/mm/Makefile
+++ b/tools/testing/selftests/mm/Makefile
@@ -37,7 +37,8 @@ endif
 # LDLIBS.
 MAKEFLAGS += --no-builtin-rules
 
-CFLAGS = -Wall -O2 -I $(top_srcdir) $(EXTRA_CFLAGS) $(KHDR_INCLUDES) $(TOOLS_INCLUDES)
+CFLAGS = -Wall -O2 -I $(top_srcdir) -I $(top_srcdir)/tools/lib
+CFLAGS += $(EXTRA_CFLAGS) $(KHDR_INCLUDES) $(TOOLS_INCLUDES)
 CFLAGS += -Wunreachable-code
 LDLIBS = -lrt -lpthread -lm
 
@@ -187,8 +188,8 @@ TEST_FILES += write_hugetlb_memory.sh
 
 include ../lib.mk
 
-$(TEST_GEN_PROGS): vm_util.c hugepage_settings.c
-$(TEST_GEN_FILES): vm_util.c hugepage_settings.c
+$(TEST_GEN_PROGS): vm_util.c hugepage_settings.c $(top_srcdir)/tools/lib/mm/file_utils.c
+$(TEST_GEN_FILES): vm_util.c hugepage_settings.c $(top_srcdir)/tools/lib/mm/file_utils.c
 
 $(OUTPUT)/uffd-stress: uffd-common.c
 $(OUTPUT)/uffd-unit-tests: uffd-common.c
@@ -217,7 +218,7 @@ $(BINARIES_32): CFLAGS += -m32 -mxsave
 $(BINARIES_32): LDLIBS += -lrt -ldl -lm
 $(BINARIES_32): $(OUTPUT)/%_32: %.c
 	$(call msg,CC,,$@)
-	$(Q)$(CC) $(CFLAGS) $(EXTRA_CFLAGS) $(notdir $^) $(LDLIBS) -o $@
+	$(Q)$(CC) $(CFLAGS) $(EXTRA_CFLAGS) $^ $(LDLIBS) -o $@
 $(foreach t,$(VMTARGETS),$(eval $(call gen-target-rule-32,$(t))))
 endif
 
@@ -226,7 +227,7 @@ $(BINARIES_64): CFLAGS += -m64 -mxsave
 $(BINARIES_64): LDLIBS += -lrt -ldl
 $(BINARIES_64): $(OUTPUT)/%_64: %.c
 	$(call msg,CC,,$@)
-	$(Q)$(CC) $(CFLAGS) $(EXTRA_CFLAGS) $(notdir $^) $(LDLIBS) -o $@
+	$(Q)$(CC) $(CFLAGS) $(EXTRA_CFLAGS) $^ $(LDLIBS) -o $@
 $(foreach t,$(VMTARGETS),$(eval $(call gen-target-rule-64,$(t))))
 endif
 
diff --git a/tools/testing/selftests/mm/vm_util.c b/tools/testing/selftests/mm/vm_util.c
index c1b8d60e519d..4751db798c3a 100644
--- a/tools/testing/selftests/mm/vm_util.c
+++ b/tools/testing/selftests/mm/vm_util.c
@@ -889,103 +889,6 @@ int unpoison_memory(unsigned long pfn)
 	return ret > 0 ? 0 : -errno;
 }
 
-int read_file(const char *path, char *buf, size_t buflen)
-{
-	int fd, err;
-	ssize_t numread;
-
-	fd = open(path, O_RDONLY);
-	if (fd == -1)
-		return -errno;
-
-	numread = read(fd, buf, buflen - 1);
-	if (numread < 1) {
-		err = numread ? errno : ENODATA;
-		close(fd);
-		return -err;
-	}
-
-	buf[numread] = '\0';
-	close(fd);
-
-	return 0;
-}
-
-int write_file(const char *path, const char *buf, size_t buflen)
-{
-	int fd, saved_errno;
-	ssize_t numwritten;
-
-	if (buflen < 2)
-		return -EINVAL;
-
-	fd = open(path, O_WRONLY);
-	if (fd == -1)
-		return -errno;
-
-	numwritten = write(fd, buf, buflen - 1);
-	saved_errno = errno;
-	close(fd);
-
-	if (numwritten < 0)
-		return -saved_errno;
-
-	if (numwritten != (ssize_t)(buflen - 1))
-		return -EIO;
-
-	return 0;
-}
-
-int read_num(const char *path, unsigned long *num)
-{
-	unsigned long val;
-	int ret;
-	char buf[21];
-	char *end;
-
-	if (!num)
-		return -EINVAL;
-
-	ret = read_file(path, buf, sizeof(buf));
-	if (ret)
-		return ret;
-
-	/* Reject signs and leading whitespace that are accepted by strtoul() */
-	if (buf[0] < '0' || buf[0] > '9')
-		return -EINVAL;
-
-	errno = 0;
-	val = strtoul(buf, &end, 10);
-	if (errno)
-		return -errno;
-
-	/* Only allow a newline after the number */
-	if (*end == '\n')
-		end++;
-
-	if (*end != '\0')
-		return -EINVAL;
-
-	*num = val;
-	return 0;
-}
-
-int write_num(const char *path, unsigned long num)
-{
-	char buf[21];
-
-	sprintf(buf, "%lu", num);
-	return write_file(path, buf, strlen(buf) + 1);
-}
-
-int write_num_ignore_einval(const char *path, unsigned long num)
-{
-	int ret;
-
-	ret = write_num(path, num);
-	return ret == -EINVAL ? 0 : ret;
-}
-
 static unsigned long shmall, shmmax;
 
 void __shm_limits_restore(void)
diff --git a/tools/testing/selftests/mm/vm_util.h b/tools/testing/selftests/mm/vm_util.h
index 62f6f5b42649..fe0475f2bdf2 100644
--- a/tools/testing/selftests/mm/vm_util.h
+++ b/tools/testing/selftests/mm/vm_util.h
@@ -8,6 +8,7 @@
 #include <unistd.h> /* _SC_PAGESIZE */
 #include "kselftest.h"
 #include <linux/fs.h>
+#include <mm/file_utils.h>
 
 #define BIT_ULL(nr)                   (1ULL << (nr))
 #define PM_SOFT_DIRTY                 BIT_ULL(55)
@@ -166,12 +167,6 @@ int unpoison_memory(unsigned long pfn);
 #define PAGEMAP_PRESENT(ent)	(((ent) & (1ull << 63)) != 0)
 #define PAGEMAP_PFN(ent)	((ent) & ((1ull << 55) - 1))
 
-int write_file(const char *path, const char *buf, size_t buflen);
-int read_file(const char *path, char *buf, size_t buflen);
-int read_num(const char *path, unsigned long *num);
-int write_num(const char *path, unsigned long num);
-int write_num_ignore_einval(const char *path, unsigned long num);
-
 void shm_limits_prepare(unsigned long length);
 void __shm_limits_restore(void);
 
-- 
2.53.0

