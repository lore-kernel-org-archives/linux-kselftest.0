Received: from mailgw.kylinos.cn (mailgw.kylinos.cn [124.126.103.232])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CA7542DB7B8;
	Wed, 22 Jul 2026 01:51:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=124.126.103.232
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784685119; cv=none; b=U4mdsJ/GLCVLcG4Pm0cLWgaQH2Vyp4rMKHH/xIyt3XrQrqwBN5+4FY5KNt+z2ceg1/I3fzQooz/dTPvWXJoY9ViwjjXjRiVAXqx9PDoMGfyaE6H7Mz86gvFPtXgAtpeMBP/ZowdOv48bL/mtOIskjfTRsf6TNHZKfzOzsE46JNw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784685119; c=relaxed/simple;
	bh=XqR56W7gJTWXbzpBfGpKMJyhOg6Q0hmyudlcq6Hsz8k=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=PotqtqpIO3iUab86p6GT71DFV9SRpGT2niXkA+rARndPrbWCISWyX+fiIuMGp+9Gs+HtKMAILeQn5j82JjDNSnkVl5mSlEgT3o65/RVkwa1YHISiwKYxrAxRVLV6MUWCPF31ZOKaf6qghKIcxwfCuqFU4/f05cQfAfz9kfbSdGs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=kylinos.cn; spf=pass smtp.mailfrom=kylinos.cn; arc=none smtp.client-ip=124.126.103.232
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=kylinos.cn
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=kylinos.cn
X-UUID: e66927be856f11f1aa26b74ffac11d73-20260722
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.3.12,REQID:700017f1-09f0-4f90-87fb-c3274a4720b5,IP:0,U
	RL:0,TC:0,Content:-5,EDM:25,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTIO
	N:release,TS:20
X-CID-META: VersionHash:e7bac3a,CLOUDID:e8fe7246ed586caeb3be2055202cf609,BulkI
	D:nil,BulkQuantity:0,Recheck:0,SF:102|136|850|865|898,TC:nil,Content:0|15|
	50,EDM:5,IP:nil,URL:0,File:nil,RT:nil,Bulk:nil,QS:nil,BEC:nil,COL:0,OSI:0,
	OSA:0,AV:0,LES:1,SPR:NO,DKR:0,DKP:0,BRR:0,BRE:0,ARC:0
X-CID-BVR: 2,SSN|SDN
X-CID-BAS: 2,SSN|SDN,0,_
X-CID-FACTOR: TF_CID_SPAM_SNR
X-CID-RHF: D41D8CD98F00B204E9800998ECF8427E
X-UUID: e66927be856f11f1aa26b74ffac11d73-20260722
X-User: yanlonglong@kylinos.cn
Received: from localhost.localdomain [(10.44.16.150)] by mailgw.kylinos.cn
	(envelope-from <yanlonglong@kylinos.cn>)
	(Generic MTA with TLSv1.3 TLS_AES_256_GCM_SHA384 256/256)
	with ESMTP id 270753574; Wed, 22 Jul 2026 09:51:47 +0800
From: longlong yan <yanlonglong@kylinos.cn>
To: pabeni@redhat.com,
	kuba@kernel.org,
	davem@davemloft.net
Cc: edumazet@google.com,
	netdev@vger.kernel.org,
	linux-kselftest@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	shuah@kernel.org,
	horms@kernel.org,
	longlong yan <yanlonglong@kylinos.cn>
Subject: [PATCH] selftests/net: use MAP_FAILED instead of (void *)-1 in  tcp_mmap
Date: Wed, 22 Jul 2026 09:51:29 +0800
Message-ID: <20260722015129.916-1-yanlonglong@kylinos.cn>
X-Mailer: git-send-email 2.47.1.windows.2
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

mmap() is documented to return MAP_FAILED on error, but tcp_mmap.c
compares the return value against (void *)-1 and (unsigned char *)-1.

Replace these with the standard MAP_FAILED macro for better readability
and type safety.

Signed-off-by: longlong yan <yanlonglong@kylinos.cn>
---
 tools/testing/selftests/net/tcp_mmap.c | 10 +++++-----
 1 file changed, 5 insertions(+), 5 deletions(-)

diff --git a/tools/testing/selftests/net/tcp_mmap.c b/tools/testing/selftests/net/tcp_mmap.c
index 2544ae35d07a..487ae659a1f1 100644
--- a/tools/testing/selftests/net/tcp_mmap.c
+++ b/tools/testing/selftests/net/tcp_mmap.c
@@ -141,12 +141,12 @@ static void *mmap_large_buffer(size_t need, size_t *allocated)
 	buffer = mmap(NULL, sz, PROT_READ | PROT_WRITE,
 		      MAP_PRIVATE | MAP_ANONYMOUS | MAP_HUGETLB, -1, 0);
 
-	if (buffer == (void *)-1) {
+	if (buffer == MAP_FAILED) {
 		sz = need;
 		buffer = mmap(NULL, sz, PROT_READ | PROT_WRITE,
 			      MAP_PRIVATE | MAP_ANONYMOUS | MAP_POPULATE,
 			      -1, 0);
-		if (buffer != (void *)-1)
+		if (buffer != MAP_FAILED)
 			fprintf(stderr, "MAP_HUGETLB attempt failed, look at /sys/kernel/mm/hugepages for optimal performance\n");
 	}
 	*allocated = sz;
@@ -189,13 +189,13 @@ void *child_thread(void *arg)
 
 	fcntl(fd, F_SETFL, O_NDELAY);
 	buffer = mmap_large_buffer(chunk_size, &buffer_sz);
-	if (buffer == (void *)-1) {
+	if (buffer == MAP_FAILED) {
 		perror("mmap");
 		goto error;
 	}
 	if (zflg) {
 		raddr = mmap(NULL, chunk_size + map_align, PROT_READ, flags, fd, 0);
-		if (raddr == (void *)-1) {
+		if (raddr == MAP_FAILED) {
 			perror("mmap");
 			zflg = 0;
 		} else {
@@ -547,7 +547,7 @@ int main(int argc, char *argv[])
 	}
 
 	buffer = mmap_large_buffer(chunk_size, &buffer_sz);
-	if (buffer == (unsigned char *)-1) {
+	if (buffer == MAP_FAILED) {
 		perror("mmap");
 		exit(1);
 	}
-- 
2.43.0

