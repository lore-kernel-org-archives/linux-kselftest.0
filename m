Received: from foss.arm.com (foss.arm.com [217.140.110.172])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4D5583AAF61;
	Mon, 31 Aug 2026 04:22:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.140.110.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788150131; cv=none; b=F6/Q/myM9ZvMY6+fJBLKUFEyJFFEOMmF/PTynHFf173IuOvlA86sy+NwOqLloSkjXZcKl35onhm0jXx5GXcLI2PIApz9wG2Qkd8bHk+8ljcLucpWS8ktVnz9BolQjA/EcgpoIi4da7gb8oYChGV8jwweb8ljBAi0xg+efjgtKg0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788150131; c=relaxed/simple;
	bh=4LoBPYXFLt535Lmo54j6xirXoFSokDHwRO3DQUBkjus=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=gGyD71BMQyXL3n+3xC8wz8hdyCh+1gavLlj5vfMx4d78jhg9Z0qAfeMZSnVZj+NG64lLfi9tIXkKqisLL1iQ9hkF/FokCXxo4HGSMd+KmKbUa+mUyGGVVgaCYgRujRI47hsbKJXfu2KeJgauuiQHepFi0UFTlCUFjaS1Y+yFKvM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com; spf=pass smtp.mailfrom=arm.com; dkim=pass (1024-bit key) header.d=arm.com header.i=@arm.com header.b=LJFnoWpD; arc=none smtp.client-ip=217.140.110.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=arm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=arm.com header.i=@arm.com header.b="LJFnoWpD"
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id D348414BF;
	Sun, 30 Aug 2026 21:22:04 -0700 (PDT)
Received: from a081061.blr.arm.com (a081061.arm.com [10.164.19.84])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id F39413F8C6;
	Sun, 30 Aug 2026 21:22:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1788150128; bh=4LoBPYXFLt535Lmo54j6xirXoFSokDHwRO3DQUBkjus=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=LJFnoWpDQ2rT2vwzdYwEbZ3Xkvd55Y/Y0VUvOhtpBp2TKI/jSvkPCnq2GCO03+Yh2
	 LdOMeHE+cthSvwQC+sw4asfIFwMhCtMEoY1bxomTqStVyk2frR4i9mfDxmvHGTU7Io
	 UGlh1c2C4WkIdJitxAh8ekpLdew/l2+3cYvdXIek=
From: Sarthak Sharma <sarthak.sharma@arm.com>
To: Andrew Morton <akpm@linux-foundation.org>,
	David Hildenbrand <david@kernel.org>
Cc: Lorenzo Stoakes <ljs@kernel.org>,
	"Liam R. Howlett" <liam@infradead.org>,
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
Subject: [PATCH v8 6/6] selftests/mm: add a GUP selftest
Date: Mon, 31 Aug 2026 09:51:01 +0530
Message-ID: <20260831042101.18085-7-sarthak.sharma@arm.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260831042101.18085-1-sarthak.sharma@arm.com>
References: <20260831042101.18085-1-sarthak.sharma@arm.com>
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Add a new GUP selftest which uses kselftest_harness.h. Cover
12 mapping configurations: THP enabled, THP disabled and
HugeTLB, each across private/shared mappings and with/without
FOLL_WRITE. Run 5 test cases for every variant: get_user_pages,
get_user_pages_fast, pin_user_pages, pin_user_pages_fast and
pin_user_pages_longterm.

Set up 128 default-sized HugeTLB pages once for the HugeTLB variants
and derive their mapping size from the default huge-page size.

Sweep four nr_pages_per_call values for each test: 1, 512, 123 and
all pages. This preserves the coverage previously provided by
run_gup_matrix(): 12 mapping combinations x 5 GUP/PUP operations x 4
batch sizes. In total the selftest reports 60 TAP cases and issues
240 ioctls.

Do not carry DUMP_USER_PAGES_TEST into the new selftest because
the test only verifies whether an ioctl succeeded, not the output
written to the kernel log.

Add the new gup binary to the selftests/mm build, run_vmtests.sh and
MAINTAINERS. Update mm/Kconfig to describe the benchmark and
selftest split.

Suggested-by: David Hildenbrand (Arm) <david@kernel.org>
Acked-by: Mike Rapoport (Microsoft) <rppt@kernel.org>
Tested-by: Muhammad Usama Anjum <usama.anjum@arm.com>
Signed-off-by: Sarthak Sharma <sarthak.sharma@arm.com>
---
 MAINTAINERS                               |   1 +
 mm/Kconfig                                |  21 +-
 tools/testing/selftests/mm/Makefile       |   1 +
 tools/testing/selftests/mm/gup.c          | 277 ++++++++++++++++++++++
 tools/testing/selftests/mm/run_vmtests.sh |   1 +
 5 files changed, 290 insertions(+), 11 deletions(-)
 create mode 100644 tools/testing/selftests/mm/gup.c

diff --git a/MAINTAINERS b/MAINTAINERS
index 5178c7f54046..775d8ae83177 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -17032,6 +17032,7 @@ F:	mm/gup.c
 F:	mm/gup_test.c
 F:	mm/gup_test.h
 F:	tools/mm/gup_bench.c
+F:	tools/testing/selftests/mm/gup.c
 F:	tools/testing/selftests/mm/gup_longterm.c
 
 MEMORY MANAGEMENT - KSM (Kernel Samepage Merging)
diff --git a/mm/Kconfig b/mm/Kconfig
index 604c58199acb..0bd298c77446 100644
--- a/mm/Kconfig
+++ b/mm/Kconfig
@@ -1292,24 +1292,23 @@ config PERCPU_STATS
 	  be used to help understand percpu memory usage.
 
 config GUP_TEST
-	bool "Enable infrastructure for get_user_pages()-related unit tests"
+	bool "Enable infrastructure for get_user_pages()-related unit tests and benchmarks"
 	depends on DEBUG_FS
 	help
 	  Provides /sys/kernel/debug/gup_test, which in turn provides a way
-	  to make ioctl calls that can launch kernel-based unit tests for
-	  the get_user_pages*() and pin_user_pages*() family of API calls.
+	  to make ioctl calls that can launch kernel-based unit tests and
+	  benchmarks for the get_user_pages*() and pin_user_pages*() families
+	  of API calls.
 
-	  These tests include benchmark testing of the _fast variants of
-	  get_user_pages*() and pin_user_pages*(), as well as smoke tests of
+	  These include benchmark testing of the _fast variants of
+	  get_user_pages*() and pin_user_pages*(), as well as tests of
 	  the non-_fast variants.
 
-	  There is also a sub-test that allows running dump_page() on any
-	  of up to eight pages (selected by command line args) within the
-	  range of user-space addresses. These pages are either pinned via
-	  pin_user_pages*(), or pinned via get_user_pages*(), as specified
-	  by other command line arguments.
+	  There is also a test that allows running dump_page() on any of up
+	  to eight pages within the range of user-space addresses. These
+	  pages are either acquired via pin_user_pages*() or get_user_pages*().
 
-	  See tools/testing/selftests/mm/gup_test.c
+	  See tools/testing/selftests/mm/gup.c and tools/mm/gup_bench.c.
 
 comment "GUP_TEST needs to have DEBUG_FS enabled"
 	depends on !GUP_TEST && !DEBUG_FS
diff --git a/tools/testing/selftests/mm/Makefile b/tools/testing/selftests/mm/Makefile
index 11ca9b11fef1..9c03624fd293 100644
--- a/tools/testing/selftests/mm/Makefile
+++ b/tools/testing/selftests/mm/Makefile
@@ -58,6 +58,7 @@ endif
 
 TEST_GEN_FILES = cow
 TEST_GEN_FILES += compaction_test
+TEST_GEN_FILES += gup
 TEST_GEN_FILES += gup_longterm
 TEST_GEN_FILES += hmm-tests
 TEST_GEN_FILES += hugetlb-madvise
diff --git a/tools/testing/selftests/mm/gup.c b/tools/testing/selftests/mm/gup.c
new file mode 100644
index 000000000000..e3c2ffa3a057
--- /dev/null
+++ b/tools/testing/selftests/mm/gup.c
@@ -0,0 +1,277 @@
+// SPDX-License-Identifier: GPL-2.0
+#define __SANE_USERSPACE_TYPES__ // Use ll64
+#include <fcntl.h>
+#include <errno.h>
+#include <stdbool.h>
+#include <string.h>
+#include <unistd.h>
+#include <dirent.h>
+#include <sys/ioctl.h>
+#include <sys/mman.h>
+#include <mm/gup_test.h>
+#include "vm_util.h"
+#include "kselftest_harness.h"
+
+#define MB (1UL << 20)
+
+/* Just the flags we need, copied from the kernel internals. */
+#define FOLL_WRITE	0x01	/* check pte is writable */
+
+/* Page counts exercising single, THP-batch, partial, and full-mapping GUP. */
+static const int nr_pages_list[] = { 1, 512, 123, -1 };
+
+#define GUP_TEST_FILE "/sys/kernel/debug/gup_test"
+#define NR_HUGE_PAGES 128
+
+HUGETLB_SETUP_DEFAULT_PAGES(NR_HUGE_PAGES)
+
+FIXTURE(gup_test)
+{
+	int gup_fd;
+	char *addr;
+	unsigned long size;
+};
+
+FIXTURE_VARIANT(gup_test)
+{
+	bool thp;
+	bool hugetlb;
+	bool write;
+	bool shared;
+};
+
+FIXTURE_VARIANT_ADD(gup_test, private_write)
+{
+	.thp = false,
+	.hugetlb = false,
+	.write = true,
+	.shared = false,
+};
+
+FIXTURE_VARIANT_ADD(gup_test, private_read)
+{
+	.thp = false,
+	.hugetlb = false,
+	.write = false,
+	.shared = false,
+};
+
+FIXTURE_VARIANT_ADD(gup_test, private_write_thp)
+{
+	.thp = true,
+	.hugetlb = false,
+	.write = true,
+	.shared = false,
+};
+
+FIXTURE_VARIANT_ADD(gup_test, private_read_thp)
+{
+	.thp = true,
+	.hugetlb = false,
+	.write = false,
+	.shared = false,
+};
+
+FIXTURE_VARIANT_ADD(gup_test, private_write_hugetlb)
+{
+	.thp = false,
+	.hugetlb = true,
+	.write = true,
+	.shared = false,
+};
+
+FIXTURE_VARIANT_ADD(gup_test, private_read_hugetlb)
+{
+	.thp = false,
+	.hugetlb = true,
+	.write = false,
+	.shared = false,
+};
+
+FIXTURE_VARIANT_ADD(gup_test, shared_write)
+{
+	.thp = false,
+	.hugetlb = false,
+	.write = true,
+	.shared = true,
+};
+
+FIXTURE_VARIANT_ADD(gup_test, shared_read)
+{
+	.thp = false,
+	.hugetlb = false,
+	.write = false,
+	.shared = true,
+};
+
+FIXTURE_VARIANT_ADD(gup_test, shared_write_thp)
+{
+	.thp = true,
+	.hugetlb = false,
+	.write = true,
+	.shared = true,
+};
+
+FIXTURE_VARIANT_ADD(gup_test, shared_read_thp)
+{
+	.thp = true,
+	.hugetlb = false,
+	.write = false,
+	.shared = true,
+};
+
+FIXTURE_VARIANT_ADD(gup_test, shared_write_hugetlb)
+{
+	.thp = false,
+	.hugetlb = true,
+	.write = true,
+	.shared = true,
+};
+
+FIXTURE_VARIANT_ADD(gup_test, shared_read_hugetlb)
+{
+	.thp = false,
+	.hugetlb = true,
+	.write = false,
+	.shared = true,
+};
+
+FIXTURE_SETUP(gup_test)
+{
+	int mmap_flags = MAP_PRIVATE;
+	int zero_fd;
+	char *p;
+
+	self->size = 128 * MB;
+
+	if (variant->hugetlb) {
+		unsigned long hp_size = default_huge_page_size();
+
+		if (!hp_size)
+			SKIP(return, "HugeTLB not available\n");
+
+		if (hugetlb_free_default_pages() < NR_HUGE_PAGES)
+			SKIP(return, "Not enough huge pages\n");
+
+		self->size = NR_HUGE_PAGES * hp_size;
+		mmap_flags |= (MAP_HUGETLB | MAP_ANONYMOUS);
+	}
+
+	if (variant->shared)
+		mmap_flags = (mmap_flags & ~MAP_PRIVATE) | MAP_SHARED;
+
+	/* zero_fd has to be >= 0. Already checked in main() */
+	zero_fd = open("/dev/zero", O_RDWR);
+	ASSERT_GE(zero_fd, 0);
+
+	/* gup_fd has to be >= 0. Already checked in main() */
+	self->gup_fd = open(GUP_TEST_FILE, O_RDWR);
+	ASSERT_GE(self->gup_fd, 0);
+
+	self->addr = mmap(NULL, self->size, PROT_READ | PROT_WRITE,
+			  mmap_flags, zero_fd, 0);
+
+	ASSERT_NE(self->addr, MAP_FAILED) {
+		int err = errno;
+
+		close(zero_fd);
+		close(self->gup_fd);
+		TH_LOG("mmap failed: %s", strerror(err));
+	}
+	close(zero_fd);
+
+	if (variant->thp)
+		madvise(self->addr, self->size, MADV_HUGEPAGE);
+	else if (!variant->hugetlb)
+		madvise(self->addr, self->size, MADV_NOHUGEPAGE);
+
+	for (p = self->addr; (unsigned long)p < (unsigned long)self->addr
+			+ self->size; p += psize())
+		p[0] = 0;
+}
+
+FIXTURE_TEARDOWN(gup_test)
+{
+	munmap(self->addr, self->size);
+	close(self->gup_fd);
+}
+
+static void run_gup_cmd(struct __test_metadata *_metadata,
+			 FIXTURE_DATA(gup_test) *self,
+			 const FIXTURE_VARIANT(gup_test) *variant,
+			 unsigned long command)
+{
+	int i;
+
+	for (i = 0; i < (int)ARRAY_SIZE(nr_pages_list); i++) {
+		struct gup_test gup = {
+			.addr = (unsigned long)self->addr,
+			.size = self->size,
+			.nr_pages_per_call = nr_pages_list[i] < 0 ?
+				self->size / psize() : nr_pages_list[i],
+			.gup_flags = variant->write ? FOLL_WRITE : 0,
+		};
+
+		TH_LOG("nr_pages_per_call=%u", gup.nr_pages_per_call);
+		ASSERT_EQ(ioctl(self->gup_fd, command, &gup), 0);
+	}
+}
+
+TEST_F(gup_test, get_user_pages)
+{
+	run_gup_cmd(_metadata, self, variant, GUP_BASIC_TEST);
+}
+
+TEST_F(gup_test, pin_user_pages)
+{
+	run_gup_cmd(_metadata, self, variant, PIN_BASIC_TEST);
+}
+
+TEST_F(gup_test, get_user_pages_fast)
+{
+	run_gup_cmd(_metadata, self, variant, GUP_FAST_BENCHMARK);
+}
+
+TEST_F(gup_test, pin_user_pages_fast)
+{
+	run_gup_cmd(_metadata, self, variant, PIN_FAST_BENCHMARK);
+}
+
+TEST_F(gup_test, pin_user_pages_longterm)
+{
+	run_gup_cmd(_metadata, self, variant, PIN_LONGTERM_BENCHMARK);
+}
+
+int main(int argc, char **argv)
+{
+	int fd;
+	char *file = "/dev/zero";
+
+	fd = open(file, O_RDWR);
+	if (fd < 0) {
+		ksft_print_header();
+		ksft_exit_fail_msg("Unable to open %s: %s\n", file, strerror(errno));
+	}
+	close(fd);
+
+	fd = open(GUP_TEST_FILE, O_RDWR);
+	if (fd == -1) {
+		ksft_print_header();
+		if (errno == EACCES)
+			ksft_exit_skip("Please run this test as root\n");
+		if (errno == ENOENT) {
+			DIR *debugfs = opendir("/sys/kernel/debug");
+
+			if (!debugfs) {
+				ksft_exit_skip("Mount debugfs at /sys/kernel/debug\n");
+			} else {
+				closedir(debugfs);
+				ksft_exit_skip("Check CONFIG_GUP_TEST in kernel config\n");
+			}
+		}
+		ksft_exit_fail_msg("Failed to open %s: %s\n", GUP_TEST_FILE, strerror(errno));
+	}
+	close(fd);
+
+	return test_harness_run(argc, argv);
+}
diff --git a/tools/testing/selftests/mm/run_vmtests.sh b/tools/testing/selftests/mm/run_vmtests.sh
index 8f1e828e4f39..ae0ab5efabae 100755
--- a/tools/testing/selftests/mm/run_vmtests.sh
+++ b/tools/testing/selftests/mm/run_vmtests.sh
@@ -251,6 +251,7 @@ fi
 
 CATEGORY="mmap" run_test ./map_fixed_noreplace
 
+CATEGORY="gup_test" run_test ./gup
 CATEGORY="gup_test" run_test ./gup_longterm
 
 CATEGORY="userfaultfd" run_test ./uffd-unit-tests
-- 
2.53.0

