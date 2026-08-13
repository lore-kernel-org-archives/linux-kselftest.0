Received: from foss.arm.com (foss.arm.com [217.140.110.172])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 994023DD525;
	Thu, 13 Aug 2026 18:14:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.140.110.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786644854; cv=none; b=oNRiuiAYmpRj099l+NhHV0OnTAGRlNra8U/5SV68XCgdlF+qavRD1V9wRMunZXxFTyWH8JJE8gvihG3mLq3Aq8VHwHx5t33L6DwI/zLXOBAjnh0UrNKTIIngBaFWzqd1kkG9LVIR2uqQqmMYQt9SedZHDg5tj3OpQ0fKXDnLQNY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786644854; c=relaxed/simple;
	bh=n+ixg0gEj//vEve/eI8OzR4nRqMJ7Zk3ybRGgHQdE7k=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=nFbhepbB43Q8f2THESKHUPypOqQs/spYdLSInBXT/FMKWZ7Ipjr9n5yC7RYWDzWlZr0vqO3XZuUZpk/ZkScjIaLKBYofxSiy2Cn2KkTmqoa9zTtqMwThSWNiSG/vbsG5VserJLeUKGKxrIF6/b1jd4BYRJzfbLLfDGhvEgYcE7Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com; spf=pass smtp.mailfrom=arm.com; dkim=pass (1024-bit key) header.d=arm.com header.i=@arm.com header.b=jJrVZnor; arc=none smtp.client-ip=217.140.110.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=arm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=arm.com header.i=@arm.com header.b="jJrVZnor"
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 09CDE1AC1;
	Thu, 13 Aug 2026 11:14:08 -0700 (PDT)
Received: from a081061.arm.com (unknown [10.163.171.218])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id 0C2773F66F;
	Thu, 13 Aug 2026 11:14:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1786644852; bh=n+ixg0gEj//vEve/eI8OzR4nRqMJ7Zk3ybRGgHQdE7k=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=jJrVZnorjSUcZxYwmrwz3LukTsVym4B5KakTFsxeWc20gf8VMfL7WoJyz08YnzGIF
	 RH2XI5OU1XdNRG593ijuC6xT7TiDxiyrT2J8KmSNs63OCKEM8VvlW/8qyvXATBI3+z
	 jsAd7l/rnhvfOBZhmxweTIkmhNUVa3+uxUPkYPSA=
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
	Zi Yan <ziy@nvidia.com>,
	Baolin Wang <baolin.wang@linux.alibaba.com>,
	Nico Pache <npache@redhat.com>,
	Ryan Roberts <ryan.roberts@arm.com>,
	Dev Jain <dev.jain@arm.com>,
	Barry Song <baohua@kernel.org>,
	Lance Yang <lance.yang@linux.dev>,
	Jason Gunthorpe <jgg@ziepe.ca>,
	John Hubbard <jhubbard@nvidia.com>,
	Peter Xu <peterx@redhat.com>,
	Leon Romanovsky <leon@kernel.org>,
	Jonathan Corbet <corbet@lwn.net>,
	Shuah Khan <skhan@linuxfoundation.org>,
	Mark Brown <broonie@kernel.org>,
	Anshuman Khandual <anshuman.khandual@arm.com>,
	linux-mm@kvack.org,
	linux-kselftest@vger.kernel.org,
	linux-doc@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Sarthak Sharma <sarthak.sharma@arm.com>
Subject: [PATCH v7 6/6] selftests/mm: add a GUP selftest
Date: Thu, 13 Aug 2026 23:42:30 +0530
Message-ID: <20260813181230.483746-7-sarthak.sharma@arm.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260813181230.483746-1-sarthak.sharma@arm.com>
References: <20260813181230.483746-1-sarthak.sharma@arm.com>
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
FOLL_WRITE. Run 7 test cases for every variant: get_user_pages,
get_user_pages_fast, pin_user_pages, pin_user_pages_fast,
pin_user_pages_longterm, and DUMP_USER_PAGES_TEST using both
get and pin.

Set up 128 default-sized HugeTLB pages once for the HugeTLB variants
and derive their mapping size from the default huge-page size.

Sweep four nr_pages_per_call values for each test: 1, 512, 123 and
all pages. This preserves the coverage previously provided by
run_gup_matrix(): 12 mapping combinations x 5 GUP/PUP operations x 4
batch sizes, for 240 ioctl calls. The two dump modes add another 96
calls.

Preserve the previous sparse dump coverage with a standalone test for
pages 0, 19 and 0x1000. In total the selftest reports 85 TAP
cases and issues 337 ioctls.

Add the new gup binary to the selftests/mm build, run_vmtests.sh and
MAINTAINERS. Update Documentation/core-api/pin_user_pages.rst for the
new test.

Suggested-by: David Hildenbrand (Arm) <david@kernel.org>
Signed-off-by: Sarthak Sharma <sarthak.sharma@arm.com>
---
 Documentation/core-api/pin_user_pages.rst |  14 +-
 MAINTAINERS                               |   1 +
 tools/testing/selftests/mm/Makefile       |   1 +
 tools/testing/selftests/mm/gup.c          | 329 ++++++++++++++++++++++
 tools/testing/selftests/mm/run_vmtests.sh |   1 +
 5 files changed, 342 insertions(+), 4 deletions(-)
 create mode 100644 tools/testing/selftests/mm/gup.c

diff --git a/Documentation/core-api/pin_user_pages.rst b/Documentation/core-api/pin_user_pages.rst
index c16ca163b55e..1564b16994ad 100644
--- a/Documentation/core-api/pin_user_pages.rst
+++ b/Documentation/core-api/pin_user_pages.rst
@@ -228,12 +228,18 @@ Unit testing
 ============
 This file::
 
- tools/testing/selftests/mm/gup_test.c
+ tools/testing/selftests/mm/gup.c
 
-has the following new calls to exercise the new pin*() wrapper functions:
+contains the following test cases to exercise pin_user_pages*():
 
-* PIN_FAST_BENCHMARK (./gup_test -a)
-* PIN_BASIC_TEST (./gup_test -b)
+* pin_user_pages via PIN_BASIC_TEST
+* pin_user_pages_fast via PIN_FAST_BENCHMARK
+* pin_user_pages_longterm via PIN_LONGTERM_BENCHMARK
+
+Run with::
+
+  make -C tools/testing/selftests/mm
+  ./tools/testing/selftests/mm/gup
 
 You can monitor how many total dma-pinned pages have been acquired and released
 since the system was booted, via two new /proc/vmstat entries: ::
diff --git a/MAINTAINERS b/MAINTAINERS
index ed9a8549ae31..861504fa2e31 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -17032,6 +17032,7 @@ F:	mm/gup.c
 F:	mm/gup_test.c
 F:	mm/gup_test.h
 F:	tools/mm/gup_bench.c
+F:	tools/testing/selftests/mm/gup.c
 F:	tools/testing/selftests/mm/gup_longterm.c
 
 MEMORY MANAGEMENT - KSM (Kernel Samepage Merging)
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
index 000000000000..4c9e14dbb434
--- /dev/null
+++ b/tools/testing/selftests/mm/gup.c
@@ -0,0 +1,329 @@
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
+			 unsigned long command,
+			 unsigned int test_flags,
+			 unsigned int which_page)
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
+			.test_flags = test_flags,
+			.which_pages = { which_page },
+		};
+
+		TH_LOG("nr_pages_per_call=%u", gup.nr_pages_per_call);
+		ASSERT_EQ(ioctl(self->gup_fd, command, &gup), 0);
+	}
+}
+
+TEST_F(gup_test, get_user_pages)
+{
+	run_gup_cmd(_metadata, self, variant, GUP_BASIC_TEST, 0, 0);
+}
+
+TEST_F(gup_test, pin_user_pages)
+{
+	run_gup_cmd(_metadata, self, variant, PIN_BASIC_TEST, 0, 0);
+}
+
+TEST_F(gup_test, dump_user_pages_with_get)
+{
+	run_gup_cmd(_metadata, self, variant, DUMP_USER_PAGES_TEST, 0, 1);
+}
+
+TEST_F(gup_test, dump_user_pages_with_pin)
+{
+	run_gup_cmd(_metadata, self, variant, DUMP_USER_PAGES_TEST,
+		    GUP_TEST_FLAG_DUMP_PAGES_USE_PIN, 1);
+}
+
+TEST_F(gup_test, get_user_pages_fast)
+{
+	run_gup_cmd(_metadata, self, variant, GUP_FAST_BENCHMARK, 0, 0);
+}
+
+TEST_F(gup_test, pin_user_pages_fast)
+{
+	run_gup_cmd(_metadata, self, variant, PIN_FAST_BENCHMARK, 0, 0);
+}
+
+TEST_F(gup_test, pin_user_pages_longterm)
+{
+	run_gup_cmd(_metadata, self, variant, PIN_LONGTERM_BENCHMARK, 0, 0);
+}
+
+TEST(dump_user_pages_sparse_indices)
+{
+	struct gup_test gup = { 0 };
+	unsigned long size = 128 * MB;
+	int zero_fd, gup_fd;
+	char *addr, *p;
+
+	zero_fd = open("/dev/zero", O_RDWR);
+	ASSERT_GE(zero_fd, 0);
+
+	gup_fd = open(GUP_TEST_FILE, O_RDWR);
+	ASSERT_GE(gup_fd, 0);
+
+	addr = mmap(NULL, size, PROT_READ | PROT_WRITE, MAP_PRIVATE, zero_fd, 0);
+	close(zero_fd);
+	ASSERT_NE(addr, MAP_FAILED);
+
+	madvise(addr, size, MADV_HUGEPAGE);
+
+	for (p = addr; (unsigned long)p < (unsigned long)addr + size;
+	     p += psize())
+		p[0] = 0;
+
+	gup.addr = (unsigned long)addr;
+	gup.size = size;
+	gup.nr_pages_per_call = size / psize();
+	gup.gup_flags = FOLL_WRITE;
+	gup.which_pages[0] = 1;
+	gup.which_pages[1] = 20;
+	gup.which_pages[2] = 0x1001;
+
+	ASSERT_EQ(ioctl(gup_fd, DUMP_USER_PAGES_TEST, &gup), 0);
+
+	munmap(addr, size);
+	close(gup_fd);
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
2.39.5

