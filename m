Received: from mailgw.kylinos.cn (mailgw.kylinos.cn [124.126.103.232])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 76BE23537FB;
	Thu,  2 Jul 2026 07:24:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=124.126.103.232
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782977089; cv=none; b=Uj+m0h+NVd02jnsOWSL56zbACnBzhlL4T8z06ImpmPNx7eITpXfY41YMHR8NOdiXqkrXG3b23h/gYf4OOrw5cCxa8Hakl3pO7qdWICY7E1jvy9rTvSjAPDjYh5GiDmgk0PjREre8V3/9uGIf+/tWWjC54dhEOzYPB7BSVStzkoY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782977089; c=relaxed/simple;
	bh=YynU7gZ+jgLU5h3kfHko0l5Oedq2ARMpzpSMBbWFkTM=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=F5duRS7whJP/1+vK4RikGqFSfRWQzkDtG1HNWjzFR06W4HJ/LAzccUgzn+frTVjpvQku5hXysRa4axHJIVTTuM5SpWOhG2CYdnH03x6ewAxryLC+G6+0uUjQscoVzc+oNmBErhyUT3FRCq6PXedRlkMYVnJwMZuM8Qhzpb/nrlc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=kylinos.cn; spf=pass smtp.mailfrom=kylinos.cn; arc=none smtp.client-ip=124.126.103.232
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=kylinos.cn
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=kylinos.cn
X-UUID: 16b9dabe75e711f1aa26b74ffac11d73-20260702
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.3.12,REQID:8e8c50cd-04b7-4569-9c35-051cde77bdb6,IP:0,U
	RL:0,TC:0,Content:0,EDM:-20,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTIO
	N:release,TS:-20
X-CID-META: VersionHash:e7bac3a,CLOUDID:85d1dad29d98195aa42cf5e97c17f9b5,BulkI
	D:nil,BulkQuantity:0,Recheck:0,SF:102|850|865|898,TC:nil,Content:0|15|50,E
	DM:1,IP:nil,URL:0,File:nil,RT:nil,Bulk:nil,QS:nil,BEC:nil,COL:0,OSI:0,OSA:
	0,AV:0,LES:1,SPR:NO,DKR:0,DKP:0,BRR:0,BRE:0,ARC:0
X-CID-BVR: 2,SSN|SDN
X-CID-BAS: 2,SSN|SDN,0,_
X-CID-FACTOR: TF_CID_SPAM_SNR
X-CID-RHF: D41D8CD98F00B204E9800998ECF8427E
X-UUID: 16b9dabe75e711f1aa26b74ffac11d73-20260702
X-User: yijiangshan@kylinos.cn
Received: from localhost.localdomain [(10.44.16.150)] by mailgw.kylinos.cn
	(envelope-from <yijiangshan@kylinos.cn>)
	(Generic MTA with TLSv1.3 TLS_AES_256_GCM_SHA384 256/256)
	with ESMTP id 1519158850; Thu, 02 Jul 2026 15:24:40 +0800
From: Jiangshan Yi <yijiangshan@kylinos.cn>
To: akpm@linux-foundation.org,
	david@kernel.org,
	shuah@kernel.org
Cc: ljs@kernel.org,
	liam@infradead.org,
	vbabka@kernel.org,
	rppt@kernel.org,
	surenb@google.com,
	mhocko@suse.com,
	linux-mm@kvack.org,
	linux-kselftest@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	13667453960@163.com,
	Jiangshan Yi <yijiangshan@kylinos.cn>
Subject: [PATCH] selftests/mm: cow: fix leaks in child_vmsplice_memcmp_fn()
Date: Thu,  2 Jul 2026 15:24:36 +0800
Message-Id: <20260702072436.739677-1-yijiangshan@kylinos.cn>
X-Mailer: git-send-email 2.25.1
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

child_vmsplice_memcmp_fn() allocated two heap buffers (old, new) and
opened a pipe, but every return path - including the normal one -
returned directly without freeing the buffers or closing the pipe file
descriptors. It also used the malloc() results without checking them,
so memcpy(old, mem, size) would crash on allocation failure (size can
be as large as a huge page).

The sibling helper do_test_vmsplice_in_parent() in the same file already
uses the goto-based cleanup pattern; follow it here.

Check the allocations up front and introduce unified error handling
with goto labels so that old/new are always freed and both pipe fds
are always closed before returning, on every path.

Signed-off-by: Jiangshan Yi <yijiangshan@kylinos.cn>
---
 tools/testing/selftests/mm/cow.c | 44 ++++++++++++++++++++++++--------
 1 file changed, 33 insertions(+), 11 deletions(-)

diff --git a/tools/testing/selftests/mm/cow.c b/tools/testing/selftests/mm/cow.c
index 0c627ea89ff7..f6a1bedfd6e2 100644
--- a/tools/testing/selftests/mm/cow.c
+++ b/tools/testing/selftests/mm/cow.c
@@ -145,26 +145,39 @@ static int child_vmsplice_memcmp_fn(char *mem, size_t size,
 	char *old, *new;
 	int fds[2];
 	char buf;
+	int ret;
 
 	old = malloc(size);
 	new = malloc(size);
+	if (!old || !new) {
+		ret = -ENOMEM;
+		goto free;
+	}
 
 	/* Backup the original content. */
 	memcpy(old, mem, size);
 
-	if (pipe(fds) < 0)
-		return -errno;
+	if (pipe(fds) < 0) {
+		ret = -errno;
+		goto free;
+	}
 
 	/* Trigger a read-only pin. */
 	transferred = vmsplice(fds[1], &iov, 1, 0);
-	if (transferred < 0)
-		return -errno;
-	if (transferred == 0)
-		return -EINVAL;
+	if (transferred < 0) {
+		ret = -errno;
+		goto close_pipe;
+	}
+	if (transferred == 0) {
+		ret = -EINVAL;
+		goto close_pipe;
+	}
 
 	/* Unmap it from our page tables. */
-	if (munmap(mem, size) < 0)
-		return -errno;
+	if (munmap(mem, size) < 0) {
+		ret = -errno;
+		goto close_pipe;
+	}
 
 	/* Wait until the parent modified it. */
 	write(comm_pipes->child_ready[1], "0", 1);
@@ -174,11 +187,20 @@ static int child_vmsplice_memcmp_fn(char *mem, size_t size,
 	/* See if we still read the old values via the pipe. */
 	for (total = 0; total < transferred; total += cur) {
 		cur = read(fds[0], new + total, transferred - total);
-		if (cur < 0)
-			return -errno;
+		if (cur < 0) {
+			ret = -errno;
+			goto close_pipe;
+		}
 	}
 
-	return memcmp(old, new, transferred);
+	ret = memcmp(old, new, transferred);
+close_pipe:
+	close(fds[0]);
+	close(fds[1]);
+free:
+	free(old);
+	free(new);
+	return ret;
 }
 
 typedef int (*child_fn)(char *mem, size_t size, struct comm_pipes *comm_pipes);
-- 
2.25.1

