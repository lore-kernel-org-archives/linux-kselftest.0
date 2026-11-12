Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=117.135.210.4
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794453561;
	b=KQh9ay6bAoy+QDAaBzynD3HFjgg+W+EjpCPUXRu6GKZCSmgYr1U5yyKTX3FeKdewXRw4
	 xSzTZXNuQ4vvS0d03SZbpN+EwcFtVboySH78rqwOD8E9u+1exWdrUZnNPE61Obhk716at
	 8EIabNPYalkklk/tE4m97YfIvjxD+3K6na3yXCIomCbvZk0MxEmJId5zQMPcjP4GY0oZm
	 6I0La4OGknis/G10gJD+SQKjJIOsNjhcEcdbZccECFvb+fNI5/fAWjBLB9MgWSnKMnSWj
	 Ma5i9Dr+Jzm74fL3gvCHtWyiYXT0LctQ/rCPPLPz4Dbpgcd23KJq+09Mj5GLNn2068g==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794453561;
	h=DMARC-Filter:DKIM-Signature:Received:From:To:Cc:Subject:Date:
	 Message-ID:X-Mailer:MIME-Version:Content-Transfer-Encoding:
	 X-CM-TRANSID:X-Coremail-Antispam:X-CM-SenderInfo;
	bh=OAJSZeu5S+BGy7vQFCxiIgP/IXx1ATwnYQxbK6vospE=;
	b=zqWe879PeWx5iJMwd1zgk4DxZw9uxAiBZLMjC9yT+mChhmpKOP/XTawQc2tWBF9QSVos
	 Undfy+xBRUETOn4fXiiyB6VC3jdNpgA+C8W2KDquM8LaVgOBliAkAhbRDzPgGPffbNTiG
	 2/qQPIy8ZleTOzwGauheUSN1KOq2uxv84dvDRQrQ68ccBk+tb7G9lOiz5Kraw0gdKj6eJ
	 MrIyws9dMlt9Bh8bf+TnlK/xA8YWLjr33GH8lHZ3iECIgo49MdvSNri3XA3/c4dPJ89UT
	 uhOcQIvCGhgrZ2IXIvA9wYjtGGZ7NR5lLRTbJ6VNcI7WuZ1L3/FjUjy5RDgVqJuIn8w==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=163.com;
	spf=pass smtp.mailfrom=163.com;
	dkim=pass header.d=163.com header.i=@163.com header.a=rsa-sha256 header.s=s110527 header.b=J8q9LXeV;
	arc=none smtp.remote-ip=117.135.210.4
Received: from m16.mail.163.com (m16.mail.163.com [117.135.210.4])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 12C63606A321;
	Thu, 12 Nov 2026 03:19:17 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 12C63606A321
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=163.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=163.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=163.com header.i=@163.com header.a=rsa-sha256 header.s=s110527 header.b=J8q9LXeV
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=163.com;
	s=s110527; h=From:To:Subject:Date:Message-ID:MIME-Version; bh=OA
	JSZeu5S+BGy7vQFCxiIgP/IXx1ATwnYQxbK6vospE=; b=J8q9LXeVwUeilZTDiw
	SwlVJGeycGVnVK3XJqd93QTe0PwTpKW3fXyBPJ3b0Ef2tfgDlUO8aTWtgIrvg0bS
	LFLqRubPPuKxfXOlV+VRNsH3X8KZHD5FLmgI9KBJ6o8kUMDpIR3J1a+lTIrEONe+
	YNUPP5YSGNsxrfSrL6851St7M=
Received: from 5219-2604 (unknown [])
	by gzsmtp5 (Coremail) with SMTP id QCgvCgDnl6oRMPVqpjyfFQ--.50271S2;
	Thu, 12 Nov 2026 11:18:46 +0800 (CST)
From: Xionggui Chen <evers_chen@163.com>
To: David Hildenbrand <david@kernel.org>,
	Andrew Morton <akpm@linux-foundation.org>,
	Shuah Khan <shuah@kernel.org>
Cc: Lorenzo Stoakes <ljs@kernel.org>,
	linux-mm@kvack.org,
	linux-kselftest@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	chenxionggui@lanxincomputing.com
Subject: [PATCH] selftests/mm: Handle implicit read permissions in madv_populate
Date: Thu, 12 Nov 2026 03:18:11 +0000
Message-ID: <20261112031811.56500-1-evers_chen@163.com>
X-Mailer: git-send-email 2.53.0
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Post: <mailto:linux-kselftest@vger.kernel.org>
List-Help: <mailto:linux-kselftest+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kselftest+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CM-TRANSID:QCgvCgDnl6oRMPVqpjyfFQ--.50271S2
X-Coremail-Antispam: 1Uf129KBjvJXoWxCw4DtFWxuw1DGw4xAr45Awb_yoWrJr1kpF
	yDJas0vF4rt3ZrA3yxAF17Xrn0yryIyayxXw1xJ3s0vwnxK345Kr47Ka48tFy8JFZ7Xw15
	Ca98ZasFkw4DJaUanT9S1TB71UUUUU7qnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
	9KBjDUYxBIdaVFxhVjvjDU0xZFpf9x07jFnm_UUUUU=
X-CM-SenderInfo: xhyh22pbfkv0i6rwjhhfrp/xtbC7BYpM2r1MBYfnQAA3b

From: Xionggui Chen <chenxionggui@lanxincomputing.com>

The madv_populate selftest assumes that a mapping created with
PROT_WRITE cannot be read, and expects MADV_POPULATE_READ to fail
with EINVAL.

However, some architectures, including RISC-V, may implicitly grant
read permission to PROT_WRITE mappings. On such architectures,
MADV_POPULATE_READ succeeds, causing the test to fail incorrectly.

Check the actual VMA permissions through /proc/self/maps and adjust
the expected result accordingly.

Add a PROT_NONE test to verify that MADV_POPULATE_READ still fails
with EINVAL for mappings without read permission.

On RISC-V with Linux 7.2.0, the original test fails 1 out of 16
tests, while the updated test passes all 17 tests.

Signed-off-by: Xionggui Chen <chenxionggui@lanxincomputing.com>
---
 tools/testing/selftests/mm/madv_populate.c | 67 ++++++++++++++++++++--
 1 file changed, 63 insertions(+), 4 deletions(-)

diff --git a/tools/testing/selftests/mm/madv_populate.c b/tools/testing/selftests/mm/madv_populate.c
index 7fce5d0b622b..818f99ee2004 100644
--- a/tools/testing/selftests/mm/madv_populate.c
+++ b/tools/testing/selftests/mm/madv_populate.c
@@ -69,10 +69,38 @@ static void test_prot_read(void)
 	munmap(addr, SIZE);
 }
 
+static int mapping_is_readable(void *addr)
+{
+	FILE *maps;
+	char line[256];
+	unsigned long start, end;
+	char perms[5];
+	int readable = -1;
+
+	maps = fopen("/proc/self/maps", "r");
+	if (!maps)
+		return -1;
+
+	while (fgets(line, sizeof(line), maps)) {
+		if (sscanf(line, "%lx-%lx %4s",
+			   &start, &end, perms) != 3)
+			continue;
+
+		if (start <= (unsigned long)addr &&
+		    (unsigned long)addr < end) {
+			readable = perms[0] == 'r';
+			break;
+		}
+	}
+
+	fclose(maps);
+	return readable;
+}
+
 static void test_prot_write(void)
 {
 	char *addr;
-	int ret;
+	int ret, readable;
 
 	ksft_print_msg("[RUN] %s\n", __func__);
 
@@ -80,9 +108,19 @@ static void test_prot_write(void)
 	if (addr == MAP_FAILED)
 		ksft_exit_fail_msg("mmap failed\n");
 
+	readable = mapping_is_readable(addr);
+	if (readable < 0)
+		ksft_exit_fail_msg("Cannot determine VMA permissions\n");
+
+	errno = 0;
 	ret = madvise(addr, SIZE, MADV_POPULATE_READ);
-	ksft_test_result(ret == -1 && errno == EINVAL,
-			 "MADV_POPULATE_READ with PROT_WRITE\n");
+
+	if (readable)
+		ksft_test_result(ret == 0,
+				 "MADV_POPULATE_READ with readable PROT_WRITE mapping\n");
+	else
+		ksft_test_result(ret == -1 && errno == EINVAL,
+				 "MADV_POPULATE_READ with write-only mapping\n");
 
 	ret = madvise(addr, SIZE, MADV_POPULATE_WRITE);
 	ksft_test_result(!ret, "MADV_POPULATE_WRITE with PROT_WRITE\n");
@@ -90,6 +128,26 @@ static void test_prot_write(void)
 	munmap(addr, SIZE);
 }
 
+static void test_prot_none(void)
+{
+	char *addr;
+	int ret;
+
+	ksft_print_msg("[RUN] %s\n", __func__);
+
+	addr = mmap(0, SIZE, PROT_NONE,
+		    MAP_ANONYMOUS | MAP_PRIVATE, 0, 0);
+	if (addr == MAP_FAILED)
+		ksft_exit_fail_msg("mmap failed\n");
+
+	errno = 0;
+	ret = madvise(addr, SIZE, MADV_POPULATE_READ);
+	ksft_test_result(ret == -1 && errno == EINVAL,
+			 "MADV_POPULATE_READ with PROT_NONE\n");
+
+	munmap(addr, SIZE);
+}
+
 static void test_holes(void)
 {
 	char *addr;
@@ -266,7 +324,7 @@ static void test_softdirty(void)
 
 int main(int argc, char **argv)
 {
-	int nr_tests = 16;
+	int nr_tests = 17;
 	int err;
 
 	pagesize = getpagesize();
@@ -280,6 +338,7 @@ int main(int argc, char **argv)
 	sense_support();
 	test_prot_read();
 	test_prot_write();
+	test_prot_none();
 	test_holes();
 	test_populate_read();
 	test_populate_write();
-- 
2.53.0

