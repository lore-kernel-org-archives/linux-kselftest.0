Received: from canpmsgout08.his.huawei.com (canpmsgout08.his.huawei.com [113.46.200.223])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 79C4738BF84;
	Wed,  4 Feb 2026 07:23:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=113.46.200.223
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770189789; cv=none; b=ZCeGgdf9XdYOaYe/O6MiPeUpbgwr7kDmIpN2nNczZlrCoC2E5G1b6qGrDK0O0Gmz/3fs8tHLvS+yOhMSN4mVEGjEEmohhv1I8jYtUZH5ThQ2YUORBvuyLvDhwJpSJ/+Yrs1PTL5a7+RtZCM6u7Qp+XPdXVLl3XZ+pmr0jYmEJfE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770189789; c=relaxed/simple;
	bh=eXHqgD1fZvdDw7Ej6HRXpRkpUOZ3ZKCBYwsPo/Gwjj4=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=rBb3df9LG/KQozSY/UPWdtGXAGMDYw6ofU9XPjFMGb8c/XvJHmRTXgrNat/R0G3Ph4qHuqrMGLvhxzDvrYk4InYz/bZC/BS6X/RAPmDVLPxVVB94qfBFrMQisSobC+fckdJ15tqZUl4GO1EVo7+SGYK6gsCaeKNzbYKu7OO5310=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=huawei.com; spf=pass smtp.mailfrom=huawei.com; dkim=pass (1024-bit key) header.d=huawei.com header.i=@huawei.com header.b=bS+LYkvr; arc=none smtp.client-ip=113.46.200.223
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=huawei.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=huawei.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=huawei.com header.i=@huawei.com header.b="bS+LYkvr"
dkim-signature: v=1; a=rsa-sha256; d=huawei.com; s=dkim;
	c=relaxed/relaxed; q=dns/txt;
	h=From;
	bh=s09W6T/GPRyuerNlrv5Ie2L5UW/FX11530s9MFvNE9k=;
	b=bS+LYkvrjYAQ2n6R77Wd+cwuAY5NfZdg8JR8ntIaEENdBt5a0JxU6C3WY7K1+EGFL1PPNJiLX
	BeRkw2I6/1xUhoPQgI7WW1fgkOjxxugRuwvPawScgtx8VKSYBH/l5vASkO9L2fNvY5N1SOCO/8u
	Zxb4rj4UuHY35Ne3yoF3Ggw=
Received: from mail.maildlp.com (unknown [172.19.163.127])
	by canpmsgout08.his.huawei.com (SkyGuard) with ESMTPS id 4f5Wsz5XfBzmVCj;
	Wed,  4 Feb 2026 15:18:31 +0800 (CST)
Received: from dggemv706-chm.china.huawei.com (unknown [10.3.19.33])
	by mail.maildlp.com (Postfix) with ESMTPS id BDE2E402AB;
	Wed,  4 Feb 2026 15:23:06 +0800 (CST)
Received: from kwepemq500010.china.huawei.com (7.202.194.235) by
 dggemv706-chm.china.huawei.com (10.3.19.33) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.11; Wed, 4 Feb 2026 15:23:06 +0800
Received: from huawei.com (10.173.125.37) by kwepemq500010.china.huawei.com
 (7.202.194.235) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.11; Wed, 4 Feb
 2026 15:23:05 +0800
From: Miaohe Lin <linmiaohe@huawei.com>
To: <akpm@linux-foundation.org>, <shuah@kernel.org>
CC: <david@kernel.org>, <lorenzo.stoakes@oracle.com>,
	<Liam.Howlett@oracle.com>, <vbabka@suse.cz>, <rppt@kernel.org>,
	<surenb@google.com>, <mhocko@suse.com>, <nao.horiguchi@gmail.com>,
	<broonie@kernel.org>, <linmiaohe@huawei.com>, <linux-mm@kvack.org>,
	<linux-kernel@vger.kernel.org>, <linux-kselftest@vger.kernel.org>
Subject: [PATCH v3 3/3] selftests/mm: add memory failure dirty pagecache test
Date: Wed, 4 Feb 2026 15:33:31 +0800
Message-ID: <20260204073331.899406-4-linmiaohe@huawei.com>
X-Mailer: git-send-email 2.33.0
In-Reply-To: <20260204073331.899406-1-linmiaohe@huawei.com>
References: <20260204073331.899406-1-linmiaohe@huawei.com>
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
dirty pagecache. This performs similar operations as clean pagecaches
except fsync() is not used to keep pages dirty.

This test helps ensure that memory failure handling for dirty pagecache
works correctly, including proper SIGBUS delivery, page isolation, and
recovery paths.

Signed-off-by: Miaohe Lin <linmiaohe@huawei.com>
---
 tools/testing/selftests/mm/memory-failure.c | 62 +++++++++++++++++++--
 1 file changed, 58 insertions(+), 4 deletions(-)

diff --git a/tools/testing/selftests/mm/memory-failure.c b/tools/testing/selftests/mm/memory-failure.c
index 3aa624db9577..3d9e0b9ffb41 100644
--- a/tools/testing/selftests/mm/memory-failure.c
+++ b/tools/testing/selftests/mm/memory-failure.c
@@ -29,8 +29,10 @@ enum inject_type {
 enum result_type {
 	MADV_HARD_ANON,
 	MADV_HARD_CLEAN_PAGECACHE,
+	MADV_HARD_DIRTY_PAGECACHE,
 	MADV_SOFT_ANON,
 	MADV_SOFT_CLEAN_PAGECACHE,
+	MADV_SOFT_DIRTY_PAGECACHE,
 };
 
 static jmp_buf signal_jmp_buf;
@@ -162,6 +164,7 @@ static void check(struct __test_metadata *_metadata, FIXTURE_DATA(memory_failure
 	case MADV_SOFT_ANON:
 	case MADV_HARD_CLEAN_PAGECACHE:
 	case MADV_SOFT_CLEAN_PAGECACHE:
+	case MADV_SOFT_DIRTY_PAGECACHE:
 		/* It is not expected to receive a SIGBUS signal. */
 		ASSERT_EQ(setjmp, 0);
 
@@ -172,6 +175,7 @@ static void check(struct __test_metadata *_metadata, FIXTURE_DATA(memory_failure
 		ASSERT_NE(pagemap_get_pfn(self->pagemap_fd, vaddr), self->pfn);
 		break;
 	case MADV_HARD_ANON:
+	case MADV_HARD_DIRTY_PAGECACHE:
 		/* The SIGBUS signal should have been received. */
 		ASSERT_EQ(setjmp, 1);
 
@@ -244,6 +248,18 @@ TEST_F(memory_failure, anon)
 	ASSERT_EQ(munmap(addr, self->page_size), 0);
 }
 
+static int prepare_file(const char *fname, unsigned long size)
+{
+	int fd;
+
+	fd = open(fname, O_RDWR | O_CREAT, 0664);
+	if (fd >= 0) {
+		unlink(fname);
+		ftruncate(fd, size);
+	}
+	return fd;
+}
+
 /* Borrowed from mm/gup_longterm.c. */
 static int get_fs_type(int fd)
 {
@@ -259,17 +275,14 @@ static int get_fs_type(int fd)
 
 TEST_F(memory_failure, clean_pagecache)
 {
-	const char *fname = "./clean-page-cache-test-file";
 	int fd;
 	char *addr;
 	int ret;
 	int fs_type;
 
-	fd = open(fname, O_RDWR | O_CREAT, 0664);
+	fd = prepare_file("./clean-page-cache-test-file", self->page_size);
 	if (fd < 0)
 		SKIP(return, "failed to open test file.\n");
-	unlink(fname);
-	ftruncate(fd, self->page_size);
 	fs_type = get_fs_type(fd);
 	if (!fs_type || fs_type == TMPFS_MAGIC)
 		SKIP(return, "unsupported filesystem :%x\n", fs_type);
@@ -302,4 +315,45 @@ TEST_F(memory_failure, clean_pagecache)
 	ASSERT_EQ(close(fd), 0);
 }
 
+TEST_F(memory_failure, dirty_pagecache)
+{
+	int fd;
+	char *addr;
+	int ret;
+	int fs_type;
+
+	fd = prepare_file("./dirty-page-cache-test-file", self->page_size);
+	if (fd < 0)
+		SKIP(return, "failed to open test file.\n");
+	fs_type = get_fs_type(fd);
+	if (!fs_type || fs_type == TMPFS_MAGIC)
+		SKIP(return, "unsupported filesystem :%x\n", fs_type);
+
+	addr = mmap(0, self->page_size, PROT_READ | PROT_WRITE,
+		    MAP_SHARED, fd, 0);
+	if (addr == MAP_FAILED)
+		SKIP(return, "mmap failed, not enough memory.\n");
+	memset(addr, 0xce, self->page_size);
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
+		check(_metadata, self, addr, MADV_HARD_DIRTY_PAGECACHE, ret);
+	else
+		check(_metadata, self, addr, MADV_SOFT_DIRTY_PAGECACHE, ret);
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

