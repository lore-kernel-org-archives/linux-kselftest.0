Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=95.215.58.226
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795333082;
	b=kmneKn48UOpsMunuTtasnqIyJE8pdQF9XmHwm0fY73J8iilEUFkoCS0VhTG78gveJZOE
	 Ta2Le04Q73fug5I1khQxFXej/kR+2gwXRjUFcR7yMxTMGMDuVQitprH9JNHxJV3UDvIj9
	 0fZ8fkyFJIL+A1Yqkn7ynSZgcb50HKrgb89DdEAit5tqPiOm0LIuiGJscnBJm2lT17tzM
	 Hmofu3TygSZelVbKNRoYQBRYPHmWXzQzthKYdh+Vp2X68IbWLJk9h/N0GSxQX8AiR4Hii
	 z3P7cCbbFWs0k8EpZWjbt8VKY5tWMV/zosWLu8ZFOugjq3AFJF2limwB99sOKRBKpqA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795333082;
	h=DMARC-Filter:X-Envelope-To:DKIM-Signature:X-Envelope-To:Received:
	 X-Mizu-Trace-ID:X-Migadu-Flow:From:Date:Subject:MIME-Version:
	 Content-Type:Content-Transfer-Encoding:Message-Id:References:
	 In-Reply-To:To:Cc:X-Mailer;
	bh=12Z4DT9i8/6oxWicy0+gAH1Rj+7DfuYqr5j02garklk=;
	b=39v4MaqKKDmgh1R9GYTELlDJ7RXHy8E98m1ApIkmSnS2oHwtc/P9YlhNcob275bEYM6l
	 ekDGQpNgmU32ZrPJ7ct7WLy8qsAJFGsRbRQ+JOkOYpFgj7noI8YFcBawlWIA4n+ZCL8/b
	 mWb4l39OnF/0oZBUcYKWiFSBHoVYrBXePPI6Nwfu6HxMQ1ynUOmlKSQf19oOFI+igGZBM
	 OZTL6IliiMJQxnyUOwqVCIOiLvoXaTU2coAeq2910j9OizaRMm0d1nfgfaXux6bgMUdBd
	 3YRb/WTUqylMUtxQGUAfUZLAINZl0lcDXmYr05PGPRB8KLKTjXNSdBGow+Z31sJt3Aw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=linux.dev;
	spf=pass smtp.mailfrom=linux.dev;
	dkim=pass header.d=linux.dev header.i=@linux.dev header.a=rsa-sha256 header.s=key1 header.b=mLSeCACi;
	arc=none smtp.remote-ip=95.215.58.226
Received: from mta1.migadu.com (out-226.mta1.migadu.com [95.215.58.226])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 14675606A320
	for <linux-kselftest@vger.kernel.org>; Sun, 22 Nov 2026 07:38:01 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 14675606A320
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=linux.dev header.i=@linux.dev header.a=rsa-sha256 header.s=key1 header.b=mLSeCACi
X-Envelope-To: linux-kselftest@vger.kernel.org
DKIM-Signature: a=rsa-sha256; bh=9Bjh+mLwWCYX/lvrGtaVs+DhROo/OhYvZoDPXw0dP3Y=;
 c=simple/simple; d=linux.dev;
 h=from:to:subject:date:message-id:mime-version:content-type; s=key1;
 t=1795333080; v=1; x=1795937880;
 b=mLSeCACisVCl0PdRZYRmlkjEZJ3zf4jNXIpBejni9qXDQo+vbyMH5bRB0sb6VAgQLIJEU3aD
 KuWQuMUGt5Bx7DwmSIX338wrERoXTQCHKSmaLjuWrwtbHlYecY0z2eofbdn3vWoUk+WdhbZ2w+N
 O23KbBAcJiAsnGUjeTdY2arU=
X-Envelope-To: linux-kselftest@vger.kernel.org
Received: by smtp.migadu.com with ESMTPS id 5445dd188f8cd78c;
	Sun, 22 Nov 2026 07:37:59 +0000
X-Mizu-Trace-ID: 5445dd188f8cd78c
X-Migadu-Flow: FLOW_OUT
From: Qiliang Yuan <qiliang.yuan@linux.dev>
Date: Sun, 22 Nov 2026 02:37:38 -0500
Subject: [PATCH 3/3] selftests/udmabuf: test mapping a huge page backed
 udmabuf
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Post: <mailto:linux-kselftest@vger.kernel.org>
List-Help: <mailto:linux-kselftest+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kselftest+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261122-feat-udmabuf-huge-pfnmap-v1-3-dcba888940c2@linux.dev>
References: <20261122-feat-udmabuf-huge-pfnmap-v1-0-dcba888940c2@linux.dev>
In-Reply-To: <20261122-feat-udmabuf-huge-pfnmap-v1-0-dcba888940c2@linux.dev>
To: Sumit Semwal <sumit.semwal@linaro.org>, 
 =?utf-8?q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>, 
 Philipp Stanner <phasta@kernel.org>, Gerd Hoffmann <kraxel@redhat.com>, 
 Vivek Kasireddy <vivek.kasireddy@intel.com>, Shuah Khan <shuah@kernel.org>
Cc: linux-media@vger.kernel.org, dri-devel@lists.freedesktop.org, 
 linaro-mm-sig@lists.linaro.org, linux-kernel@vger.kernel.org, 
 linux-kselftest@vger.kernel.org, Qiliang Yuan <qiliang.yuan@linux.dev>
X-Mailer: b4 0.13.0

udmabuf maps the ranges of a buffer that are backed by huge pages with
PMDs, provided the mapping covers whole PMDs at an aligned address.

The existing tests of huge page backed buffers only map a few pages, so
they never get a PMD mapping or check what is read through one.

Map a 64 MiB udmabuf backed by 2 MiB huge pages and read back what was
written to the memfd: through a mapping of the whole buffer, which must
be PMD aligned when THP support is built in, through a mapping at an
unaligned offset, and from a forked child.

Signed-off-by: Qiliang Yuan <qiliang.yuan@linux.dev>
---
 tools/testing/selftests/drivers/dma-buf/udmabuf.c | 90 ++++++++++++++++++++++-
 1 file changed, 89 insertions(+), 1 deletion(-)

diff --git a/tools/testing/selftests/drivers/dma-buf/udmabuf.c b/tools/testing/selftests/drivers/dma-buf/udmabuf.c
index d78aec662586b..e09330fece6fb 100644
--- a/tools/testing/selftests/drivers/dma-buf/udmabuf.c
+++ b/tools/testing/selftests/drivers/dma-buf/udmabuf.c
@@ -14,6 +14,7 @@
 #include <sys/ioctl.h>
 #include <sys/syscall.h>
 #include <sys/mman.h>
+#include <sys/wait.h>
 #include <linux/memfd.h>
 #include <linux/udmabuf.h>
 #include "kselftest.h"
@@ -130,6 +131,91 @@ static int compare_chunks(void *addr1, void *addr2, off64_t memfd_size)
 	return ret;
 }
 
+#define HPAGE_SIZE	(2UL << 20)
+#define HUGE_BUF_SIZE	(32 * HPAGE_SIZE)
+
+/* Check that @len bytes of @buf at @off read back what was written to @mem */
+static bool check_huge_range(int buf, char *mem, off_t off, size_t len)
+{
+	char *addr;
+	size_t i;
+	bool ok = true;
+
+	addr = mmap(NULL, len, PROT_READ, MAP_SHARED, buf, off);
+	if (addr == MAP_FAILED)
+		return false;
+
+	for (i = 0; i < len; i += getpagesize()) {
+		if (addr[i] != mem[off + i]) {
+			ok = false;
+			break;
+		}
+	}
+
+	munmap(addr, len);
+	return ok;
+}
+
+/*
+ * Map a udmabuf backed by 2MB huge pages, which can be mapped with PMDs, and
+ * read it back from a PMD-aligned address, a sub-range at an unaligned offset
+ * and a forked child.
+ */
+static void test_huge_mapping(int devfd)
+{
+	struct udmabuf_create create = {};
+	int memfd, buf, status;
+	bool thp, aligned, ok;
+	char *mem, *addr;
+	pid_t pid;
+	size_t i;
+
+	memfd = create_memfd_with_seals(HUGE_BUF_SIZE, true);
+	mem = mmap_fd(memfd, HUGE_BUF_SIZE);
+	for (i = 0; i < HUGE_BUF_SIZE; i += getpagesize())
+		mem[i] = (char)(i / getpagesize());
+
+	create.memfd = memfd;
+	create.size = HUGE_BUF_SIZE;
+	buf = ioctl(devfd, UDMABUF_CREATE, &create);
+	if (buf < 0) {
+		ksft_test_result_fail("%s: [FAIL,test-8]\n", TEST_PREFIX);
+		ksft_test_result_skip("%s: [SKIP,test-9]\n", TEST_PREFIX);
+		goto out;
+	}
+
+	/* The address is only aligned when THP support is built in */
+	thp = !access("/sys/kernel/mm/transparent_hugepage", F_OK);
+	addr = mmap(NULL, HUGE_BUF_SIZE, PROT_READ, MAP_SHARED, buf, 0);
+	aligned = addr != MAP_FAILED &&
+		  (!thp || !((unsigned long)addr % HPAGE_SIZE));
+	if (addr != MAP_FAILED)
+		munmap(addr, HUGE_BUF_SIZE);
+	ok = aligned && check_huge_range(buf, mem, 0, HUGE_BUF_SIZE);
+	if (ok)
+		ksft_test_result_pass("%s: [PASS,test-8]\n", TEST_PREFIX);
+	else
+		ksft_test_result_fail("%s: [FAIL,test-8]\n", TEST_PREFIX);
+
+	ok = check_huge_range(buf, mem, HPAGE_SIZE + getpagesize(),
+			      5 * HPAGE_SIZE + 3 * getpagesize());
+	pid = fork();
+	if (!pid)
+		_exit(check_huge_range(buf, mem, 0, HUGE_BUF_SIZE) ? 0 : 1);
+	if (pid < 0 || waitpid(pid, &status, 0) != pid ||
+	    !WIFEXITED(status) || WEXITSTATUS(status))
+		ok = false;
+	if (ok)
+		ksft_test_result_pass("%s: [PASS,test-9]\n", TEST_PREFIX);
+	else
+		ksft_test_result_fail("%s: [FAIL,test-9]\n", TEST_PREFIX);
+
+	close(buf);
+out:
+	munmap(mem, HUGE_BUF_SIZE);
+	close(memfd);
+}
+
 int main(int argc, char *argv[])
 {
 	struct udmabuf_create create;
@@ -138,7 +224,7 @@ int main(int argc, char *argv[])
 	void *addr1, *addr2;
 
 	ksft_print_header();
-	ksft_set_plan(7);
+	ksft_set_plan(9);
 
 	devfd = open("/dev/udmabuf", O_RDWR);
 	if (devfd < 0) {
@@ -268,6 +354,8 @@ int main(int argc, char *argv[])
 
 	close(buf);
 	close(memfd);
+
+	test_huge_mapping(devfd);
 	close(devfd);
 
 	ksft_print_msg("%s: ok\n", TEST_PREFIX);

-- 
2.43.0

