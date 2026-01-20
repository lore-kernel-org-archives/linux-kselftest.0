Received: from canpmsgout10.his.huawei.com (canpmsgout10.his.huawei.com [113.46.200.225])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F304C3D5242;
	Tue, 20 Jan 2026 12:21:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=113.46.200.225
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768911719; cv=none; b=trHytltRC9gRY3amx391FbvLYXHNlHfXm+LrKCp0nzLtLu4vl91vdxSOEE+y/A4MYqzMRcRlpPmzSIUax275K1B5dmdhezqUWZF9HN8QYzfClqcw8C2VOKItfTq2nebfYz6pTxf8Qt7BXyq6btCqHDwtgbneelRaLjsjnpuxqW4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768911719; c=relaxed/simple;
	bh=cekDGUVleARgDgj2ZRRqa++Pd4m+Vu73Q9vduf3WL40=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=QjNYs5ZWUa14yBsjnFfo0cned5a7s/IfO5SJqnFBkjWu3wTg8yUQDXm5KNYTnJQ27Ti8oNn1T9p+ZzlGms/3ugEGLiC1qzBM3wPpRigu4of+WlgaC6joN/KzYxm9yx4IXArPwdVnfHYa+jRAdRxsI1lkQPEIqTn/9MDid5WXJWY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=huawei.com; spf=pass smtp.mailfrom=huawei.com; dkim=pass (1024-bit key) header.d=huawei.com header.i=@huawei.com header.b=OVZf+HWc; arc=none smtp.client-ip=113.46.200.225
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=huawei.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=huawei.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=huawei.com header.i=@huawei.com header.b="OVZf+HWc"
dkim-signature: v=1; a=rsa-sha256; d=huawei.com; s=dkim;
	c=relaxed/relaxed; q=dns/txt;
	h=From;
	bh=mBOOYNYXFCfWOks6zujGii6P/ItlkH49gnpYx5qmEj0=;
	b=OVZf+HWcipbo88/UUufeT682Qw0LixFHuMyoJr9kztQYteb8FkKxYdPp5HxzztODMqzCYNxrN
	L6KB571pl+MMLOB0P5AhlRUAnbaEOAEGWgUXlo1IGqHbAkJxaJK+fgHqiqrNUaS1bJyv4NMtnPs
	GIt6D5covbai3OCo0PXzuBA=
Received: from mail.maildlp.com (unknown [172.19.162.92])
	by canpmsgout10.his.huawei.com (SkyGuard) with ESMTPS id 4dwRF46Yjzz1K96j;
	Tue, 20 Jan 2026 20:18:32 +0800 (CST)
Received: from dggemv712-chm.china.huawei.com (unknown [10.1.198.32])
	by mail.maildlp.com (Postfix) with ESMTPS id 2660540568;
	Tue, 20 Jan 2026 20:21:54 +0800 (CST)
Received: from kwepemq500010.china.huawei.com (7.202.194.235) by
 dggemv712-chm.china.huawei.com (10.1.198.32) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.11; Tue, 20 Jan 2026 20:21:53 +0800
Received: from huawei.com (10.173.125.37) by kwepemq500010.china.huawei.com
 (7.202.194.235) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.11; Tue, 20 Jan
 2026 20:21:52 +0800
From: Miaohe Lin <linmiaohe@huawei.com>
To: <akpm@linux-foundation.org>, <shuah@kernel.org>
CC: <david@kernel.org>, <lorenzo.stoakes@oracle.com>,
	<Liam.Howlett@oracle.com>, <vbabka@suse.cz>, <rppt@kernel.org>,
	<surenb@google.com>, <mhocko@suse.com>, <nao.horiguchi@gmail.com>,
	<linmiaohe@huawei.com>, <linux-mm@kvack.org>, <linux-kernel@vger.kernel.org>,
	<linux-kselftest@vger.kernel.org>
Subject: [PATCH v2 2/3] selftests/mm: add memory failure clean pagecache test
Date: Tue, 20 Jan 2026 20:32:38 +0800
Message-ID: <20260120123239.909882-3-linmiaohe@huawei.com>
X-Mailer: git-send-email 2.33.0
In-Reply-To: <20260120123239.909882-1-linmiaohe@huawei.com>
References: <20260120123239.909882-1-linmiaohe@huawei.com>
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: kwepems500002.china.huawei.com (7.221.188.17) To
 kwepemq500010.china.huawei.com (7.202.194.235)

This patch adds a new testcase to validate memory failure handling for
clean pagecache. This test performs similar operations as anonymous
pages except allocating memory using mmap() with a file fd.

This test helps ensure that memory failure handling for clean pagecache
works correctly, including unchanged page content, page isolation, and
recovery paths.

Signed-off-by: Miaohe Lin <linmiaohe@huawei.com>
---
 tools/testing/selftests/mm/memory-failure.c | 66 +++++++++++++++++++++
 1 file changed, 66 insertions(+)

diff --git a/tools/testing/selftests/mm/memory-failure.c b/tools/testing/selftests/mm/memory-failure.c
index 37806a58f4b4..128c2ee6d332 100644
--- a/tools/testing/selftests/mm/memory-failure.c
+++ b/tools/testing/selftests/mm/memory-failure.c
@@ -10,10 +10,14 @@
 #include <sys/mman.h>
 #include <linux/mman.h>
 #include <linux/string.h>
+#include <unistd.h>
 #include <signal.h>
 #include <setjmp.h>
 #include <unistd.h>
 #include <fcntl.h>
+#include <sys/vfs.h>
+#include <linux/magic.h>
+#include <errno.h>
 
 #include "vm_util.h"
 
@@ -24,7 +28,9 @@ enum inject_type {
 
 enum result_type {
 	MADV_HARD_ANON,
+	MADV_HARD_CLEAN_PAGECACHE,
 	MADV_SOFT_ANON,
+	MADV_SOFT_CLEAN_PAGECACHE,
 };
 
 static jmp_buf signal_jmp_buf;
@@ -154,6 +160,8 @@ static void check(struct __test_metadata *_metadata, FIXTURE_DATA(memory_failure
 
 	switch (type) {
 	case MADV_SOFT_ANON:
+	case MADV_HARD_CLEAN_PAGECACHE:
+	case MADV_SOFT_CLEAN_PAGECACHE:
 		/* It is not expected to receive a SIGBUS signal. */
 		ASSERT_EQ(setjmp, 0);
 
@@ -236,4 +244,62 @@ TEST_F(memory_failure, anon)
 	ASSERT_EQ(munmap(addr, self->page_size), 0);
 }
 
+/* Borrowed from mm/gup_longterm.c. */
+static __fsword_t get_fs_type(int fd)
+{
+	struct statfs fs;
+	int ret;
+
+	do {
+		ret = fstatfs(fd, &fs);
+	} while (ret && errno == EINTR);
+
+	return ret ? 0 : fs.f_type;
+}
+
+TEST_F(memory_failure, clean_pagecache)
+{
+	const char *fname = "./clean-page-cache-test-file";
+	int fd;
+	char *addr;
+	int ret;
+	__fsword_t fs_type;
+
+	fd = open(fname, O_RDWR | O_CREAT, 0664);
+	if (fd < 0)
+		SKIP(return, "failed to open test file.\n");
+	unlink(fname);
+	ftruncate(fd, self->page_size);
+	fs_type = get_fs_type(fd);
+	if (!fs_type || fs_type == TMPFS_MAGIC)
+		SKIP(return, "unsupported filesystem :%lx\n", fs_type);
+
+	addr = mmap(0, self->page_size, PROT_READ | PROT_WRITE,
+		    MAP_SHARED, fd, 0);
+	if (addr == MAP_FAILED)
+		SKIP(return, "mmap failed, not enough memory.\n");
+	memset(addr, 0xce, self->page_size);
+	fsync(fd);
+
+	prepare(_metadata, self, addr);
+
+	ret = sigsetjmp(signal_jmp_buf, 1);
+	if (!self->triggered) {
+		self->triggered = true;
+		ASSERT_EQ(variant->inject(self, addr), 0);
+		FORCE_READ(*addr);
+	}
+
+	if (variant->type == MADV_HARD)
+		check(_metadata, self, addr, MADV_HARD_CLEAN_PAGECACHE, ret);
+	else
+		check(_metadata, self, addr, MADV_SOFT_CLEAN_PAGECACHE, ret);
+
+	cleanup(_metadata, self, addr);
+
+	ASSERT_EQ(munmap(addr, self->page_size), 0);
+
+	ASSERT_EQ(close(fd), 0);
+}
+
 TEST_HARNESS_MAIN
-- 
2.33.0

