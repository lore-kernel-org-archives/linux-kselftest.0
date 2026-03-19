Received: from mail-pg1-f201.google.com (mail-pg1-f201.google.com [209.85.215.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6686240B6C2
	for <linux-kselftest@vger.kernel.org>; Thu, 19 Mar 2026 23:31:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773963064; cv=none; b=EmhHg/9NhFM6Sm3SJ/zJ+juqxeB6hIU0U6ymDYqWyhFCG+FQq8TftF2tII8p91Fdo/qVg9cm8BMKQGAx/p10/1ONB3v+MkPsNcY/ZF5nCehHhd96iuEhS3m5feGBzbaapzMHCRkG1/S7XkC6W+HKulTb3azDvvyTrQN1AfBenXg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773963064; c=relaxed/simple;
	bh=XqXOZx8bRJ+MW3QLKZ9eLemXOW8pkkhqg+4Xehhhu34=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=jT7YMgD2AlhklGa9pxky++icvJvrjcUg9kHlNjssL42iYnAwucG3iRoYBfCKXBUgnBrkWR+6qy1gCbVEK+Xm+HW0zHolQvso2oefgB5ljsHvO0scgw0qY1k61tszhFgpzssUj9+/W3dYlUeB1TAPz3vdk4PzDhIpCrhubRREaLI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--wyihan.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=cVMxfYa1; arc=none smtp.client-ip=209.85.215.201
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--wyihan.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="cVMxfYa1"
Received: by mail-pg1-f201.google.com with SMTP id 41be03b00d2f7-b62da7602a0so25431a12.2
        for <linux-kselftest@vger.kernel.org>; Thu, 19 Mar 2026 16:31:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1773963063; x=1774567863; darn=vger.kernel.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=dLN80hi+wV7RsIDgwy/tRG94iKBvpQ4g3gjUbQ44niY=;
        b=cVMxfYa1W6IQapW66DifvfmqGeW1bX5Uk4m4dDH10M9MOLnFryOUekLi0MN8LKGyL1
         2Ybw57YiHa+Q4xyHGSTsZhEAtC1pBZqzziARktV8t3mTDxTnx3KWd1VmB04as0/ZX38h
         GfeSrJuNmyBGbFv0Dqd89X/SqttvYswqRtQX+Eztg6fhDXp4jgR2XgEdzcJboKrnaufA
         tAlrT3bXWqIagGiHMThMx0kJKc2mBGElsImcotPjy+RlR7c20owkmRN/IFWGw3vQut1n
         mdFIX4cIRnJT+8vwYAJfQKFU9aNy4eCOjPsT2hUAOeWWcEuG8tP7wDuYg2M8h6rcfgmQ
         W5Fg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1773963063; x=1774567863;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=dLN80hi+wV7RsIDgwy/tRG94iKBvpQ4g3gjUbQ44niY=;
        b=p/TvUGAX1TYNXLliGBwT3JUG9RM9uArTI+kGM2V50cy117szvNep4Cgthf0/EXB5pK
         MstCsxKgEUnLE4OtoLL9djpTcwEHTEuWrsi62Iyo05fgHIeDLNydksOmURed1h/fdQQH
         c+fktRS63ZV0xX1Hgf+JEoXEy4xThIjUip36JAmwpaDekvuO041VpFndvKd2vUWiurDB
         DOqj950U3khWlJrsfhY9RHgDWfAsUMAj3Jq2bHFvAglUqPG1bCFdU44QAwTOsbOuuOxp
         Q+X81JLnAQMZsrwn6CwMeeu1G3Ig1R/lfbNSonnAMxbdtcrd+XpzDwR26jXfF6lYlE39
         +fSQ==
X-Forwarded-Encrypted: i=1; AJvYcCWsR6Vm/qhHtWfa8qBbFpprxYp76FS8f8M/UtQK0N5nKKjln3Hlfv7Qme0LWHCiLBsIv8Q9QlrW8Pn51YMLFoA=@vger.kernel.org
X-Gm-Message-State: AOJu0Yz4YaTASPjiKLPJYgJ6D9N83rJMQJJrGppnwTqMgzj0jcUZPetX
	kI50g1Xgmm86F1pWYrW/HZqGxWYkReu8F7CPGDRrgcAYsejO+j1J7qKWNE3p9dFibUEIDWNFLg+
	9iTOwBQ==
X-Received: from pgab123.prod.google.com ([2002:a63:3481:0:b0:c73:9919:c4f8])
 (user=wyihan job=prod-delivery.src-stubby-dispatcher) by 2002:a05:6a20:3d81:b0:398:8546:c3fc
 with SMTP id adf61e73a8af0-39bce9b7e6emr924394637.7.1773963062623; Thu, 19
 Mar 2026 16:31:02 -0700 (PDT)
Date: Thu, 19 Mar 2026 23:30:32 +0000
In-Reply-To: <20260319-memory-failure-mf-delayed-fix-rfc-v2-v2-0-92c596402a7a@google.com>
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
References: <20260319-memory-failure-mf-delayed-fix-rfc-v2-v2-0-92c596402a7a@google.com>
X-Developer-Key: i=wyihan@google.com; a=ed25519; pk=cRi0fKzS5BMxlHyHY2pJv3w/1zcgfYKr6EYGYppdMYc=
X-Developer-Signature: v=1; a=ed25519-sha256; t=1773963053; l=5121;
 i=wyihan@google.com; s=20260319; h=from:subject:message-id;
 bh=XqXOZx8bRJ+MW3QLKZ9eLemXOW8pkkhqg+4Xehhhu34=; b=nez3ePfz2DyHfRD1EU96GSlzQoAPO6925YzKCLhpMi6Z7BSIWwpw9+JzE9uSu8N4PKdbla1ke
 3gFKoffsCYJChdWiQqNpWcqhpXJunH0VukcDhLctTtRU/LD9KRdsv3T
X-Mailer: b4 0.14.3
Message-ID: <20260319-memory-failure-mf-delayed-fix-rfc-v2-v2-5-92c596402a7a@google.com>
Subject: [PATCH RFC v2 5/7] mm: selftests: Add shmem memory failure test
From: Lisa Wang <wyihan@google.com>
To: Miaohe Lin <linmiaohe@huawei.com>, Naoya Horiguchi <nao.horiguchi@gmail.com>, 
	Andrew Morton <akpm@linux-foundation.org>, Paolo Bonzini <pbonzini@redhat.com>, 
	Shuah Khan <shuah@kernel.org>, Hugh Dickins <hughd@google.com>, 
	Baolin Wang <baolin.wang@linux.alibaba.com>, David Hildenbrand <david@kernel.org>, 
	Lorenzo Stoakes <lorenzo.stoakes@oracle.com>, "Liam R. Howlett" <Liam.Howlett@oracle.com>, 
	Vlastimil Babka <vbabka@kernel.org>, Mike Rapoport <rppt@kernel.org>, 
	Suren Baghdasaryan <surenb@google.com>, Michal Hocko <mhocko@suse.com>, linux-mm@kvack.org, 
	linux-kernel@vger.kernel.org, kvm@vger.kernel.org, 
	linux-kselftest@vger.kernel.org
Cc: rientjes@google.com, seanjc@google.com, ackerleytng@google.com, 
	vannapurve@google.com, michael.roth@amd.com, jiaqiyan@google.com, 
	tabba@google.com, dave.hansen@linux.intel.com, Lisa Wang <wyihan@google.com>
Content-Type: text/plain; charset="utf-8"

Add a shmem memory failure selftest to test the shmem memory failure is
correct after modifying shmem return value.

Test that
+ madvise() call returns 0 at the first time
+ trigger a SIGBUS when the poisoned shmem page is fault-in again.

Signed-off-by: Lisa Wang <wyihan@google.com>
---
 tools/testing/selftests/mm/Makefile                |  3 +
 tools/testing/selftests/mm/run_vmtests.sh          |  1 +
 .../selftests/mm/shmem_memory_failure_test.c       | 98 ++++++++++++++++++++++
 3 files changed, 102 insertions(+)

diff --git a/tools/testing/selftests/mm/Makefile b/tools/testing/selftests/mm/Makefile
index 7a5de4e9bf52..ac033851c9eb 100644
--- a/tools/testing/selftests/mm/Makefile
+++ b/tools/testing/selftests/mm/Makefile
@@ -72,6 +72,7 @@ TEST_GEN_FILES += madv_populate
 TEST_GEN_FILES += map_fixed_noreplace
 TEST_GEN_FILES += map_hugetlb
 TEST_GEN_FILES += map_populate
+TEST_GEN_FILES += shmem_memory_failure_test
 ifneq (,$(filter $(ARCH),arm64 riscv riscv64 x86 x86_64 loongarch32 loongarch64))
 TEST_GEN_FILES += memfd_secret
 endif
@@ -259,6 +260,8 @@ $(OUTPUT)/migration: LDLIBS += -lnuma
 
 $(OUTPUT)/rmap: LDLIBS += -lnuma
 
+$(OUTPUT)/shmem_memory_failure_test: CFLAGS += -I$(top_srcdir)/tools/include
+
 local_config.mk local_config.h: check_config.sh
 	CC="$(CC)" CFLAGS="$(CFLAGS)" ./check_config.sh
 
diff --git a/tools/testing/selftests/mm/run_vmtests.sh b/tools/testing/selftests/mm/run_vmtests.sh
index afdcfd0d7cef..58fb959a7936 100755
--- a/tools/testing/selftests/mm/run_vmtests.sh
+++ b/tools/testing/selftests/mm/run_vmtests.sh
@@ -402,6 +402,7 @@ CATEGORY="hugetlb" run_test ./hugetlb-soft-offline
 echo "$nr_hugepages_tmp" > /proc/sys/vm/nr_hugepages
 echo "$enable_soft_offline" > /proc/sys/vm/enable_soft_offline
 CATEGORY="hugetlb" run_test ./hugetlb-read-hwpoison
+CATEGORY="mmap" run_test ./shmem_memory_failure_test
 fi
 
 if [ $VADDR64 -ne 0 ]; then
diff --git a/tools/testing/selftests/mm/shmem_memory_failure_test.c b/tools/testing/selftests/mm/shmem_memory_failure_test.c
new file mode 100644
index 000000000000..44752024a7fc
--- /dev/null
+++ b/tools/testing/selftests/mm/shmem_memory_failure_test.c
@@ -0,0 +1,98 @@
+// SPDX-License-Identifier: GPL-2.0
+/*
+ * This test makes sure when memory failure happens, shmem can handle
+ * successfully.
+ */
+#include <linux/compiler.h>
+#include <stdio.h>
+#include <stdlib.h>
+#include <sys/mman.h>
+#include <sys/stat.h>
+#include <fcntl.h>
+#include <unistd.h>
+#include <signal.h>
+#include <setjmp.h>
+#include <errno.h>
+#include "kselftest.h"
+#include "vm_util.h"
+
+static sigjmp_buf sigbuf;
+
+static void signal_handler(int sig, siginfo_t *info, void *ucontext)
+{
+	siglongjmp(sigbuf, 1);
+}
+
+static void set_signal_handler(int sig, void (*handler)(int, siginfo_t *, void *))
+{
+	struct sigaction sa = {};
+
+	sa.sa_sigaction = handler;
+	sa.sa_flags = SA_SIGINFO;
+	sigemptyset(&sa.sa_mask);
+	if (sigaction(sig, &sa, NULL) == -1)
+		ksft_exit_fail_msg("Failed to set SIGBUS handler: %s\n", strerror(errno));
+}
+
+static unsigned long addr_to_pfn(char *addr)
+{
+	int pagemap_fd;
+	unsigned long pfn;
+
+	pagemap_fd = open("/proc/self/pagemap", O_RDONLY);
+	if (pagemap_fd < 0)
+		ksft_exit_fail_msg("Failed to open /proc/self/pagemap: %s\n", strerror(errno));
+	pfn = pagemap_get_pfn(pagemap_fd, addr);
+	close(pagemap_fd);
+
+	return pfn;
+}
+
+static void test_shmem_memory_failure(size_t total_size, size_t page_size)
+{
+	unsigned long memory_failure_pfn;
+	char *memory_failure_mem;
+	char *memory_failure_addr;
+	int fd;
+
+	fd = memfd_create("shmem_hwpoison_test", 0);
+	if (fd < 0)
+		ksft_exit_skip("memfd_create failed: %s\n", strerror(errno));
+
+	if (ftruncate(fd, total_size) < 0)
+		ksft_exit_fail_msg("ftruncate failed: %s\n", strerror(errno));
+
+	memory_failure_mem = mmap(NULL, total_size, PROT_READ | PROT_WRITE, MAP_SHARED, fd, 0);
+	if (memory_failure_mem == MAP_FAILED)
+		ksft_exit_fail_msg("mmap failed: %s\n", strerror(errno));
+	memory_failure_addr = memory_failure_mem + page_size;
+	READ_ONCE(memory_failure_addr[0]);
+	memory_failure_pfn = addr_to_pfn(memory_failure_addr);
+
+	if (madvise(memory_failure_addr, page_size, MADV_HWPOISON) != 0)
+		ksft_exit_fail_msg("MADV_HWPOISON failed: %s\n", strerror(errno));
+
+	if (sigsetjmp(sigbuf, 1) == 0) {
+		READ_ONCE(memory_failure_addr[0]);
+		ksft_test_result_fail("Read from poisoned page should have triggered SIGBUS\n");
+	} else {
+		ksft_test_result_pass("SIGBUS triggered as expected on poisoned page\n");
+	}
+
+	munmap(memory_failure_mem, total_size);
+	close(fd);
+	if (unpoison_memory(memory_failure_pfn) < 0)
+		ksft_exit_fail_msg("unpoison_memory failed: %s\n", strerror(errno));
+}
+
+int main(int argc, char *argv[])
+{
+	const size_t pagesize = getpagesize();
+
+	ksft_print_header();
+	ksft_set_plan(1);
+
+	set_signal_handler(SIGBUS, signal_handler);
+	test_shmem_memory_failure(pagesize * 4, pagesize);
+	ksft_finished();
+}

-- 
2.53.0.959.g497ff81fa9-goog

