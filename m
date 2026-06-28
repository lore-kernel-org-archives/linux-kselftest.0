Received: from out-179.mta1.migadu.com (out-179.mta1.migadu.com [95.215.58.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B72D763CB
	for <linux-kselftest@vger.kernel.org>; Sun, 28 Jun 2026 14:31:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=95.215.58.179
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782657099; cv=none; b=rbKTvi9+GaL9psVO/S8arIlPxKp9OGUlq869q3Ay5aZInzXF/8z/BwLM4HJiocPF7ZZWL3BTYpatv11yNWouwnmBXuBQxpMc6nzSwMsRyWpLt2kvZvnUtW2vijDRAsvQ61zosjx4/ppZhDY2QpXzQeKWqgpfxMTmd8V0p9JtPu8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782657099; c=relaxed/simple;
	bh=vtoHhuI4JpayW3Y2sSJLK2LR5s2cgpxYn7rMEJQODog=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=jHw43bDYxi5A6m3ydmdJcmZtxIRzbfcKX4WnZTuRQLIBM16lpS7X7G3kcowkH7DAF+RRitnbt13D/Ci9dpGFw8sFheZ793EoUXaB4lm/fjmq/GF2zqJ6YbpKe+EpX82m8pzzsJVxCL9DBYn2ZO6v4DR5ZoMimiG8d8FVobxRoSc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev; spf=pass smtp.mailfrom=linux.dev; dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b=iLwALtkn; arc=none smtp.client-ip=95.215.58.179
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b="iLwALtkn"
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.dev; s=key1;
	t=1782657095;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding;
	bh=giQ5JZiMBc+levHSGoNxfSkMTUQ4CST11ly2JfyN3Dw=;
	b=iLwALtknnxAdMMZb3J5Y0+N+4RbEzF0FRS4LcT/leUorBVKJsQQQeZ7RDQHy5dXOl2Pujo
	0lh0UN/zvE8ThNEYgSUDYtNdd4FJnoymm1ShXTqMpeO8Czgl3r+0zgRs70vSyioI9erYvf
	Ft/gB5iL6rP6+iuSCsGliHjeZSsuirU=
From: Zenghui Yu <zenghui.yu@linux.dev>
To: linux-mm@kvack.org,
	linux-kselftest@vger.kernel.org,
	linux-kernel@vger.kernel.org
Cc: jgg@ziepe.ca,
	leon@kernel.org,
	akpm@linux-foundation.org,
	david@kernel.org,
	ljs@kernel.org,
	liam@infradead.org,
	vbabka@kernel.org,
	rppt@kernel.org,
	surenb@google.com,
	mhocko@suse.com,
	shuah@kernel.org,
	dev.jain@arm.com,
	Zenghui Yu <zenghui.yu@linux.dev>
Subject: [PATCH] selftests/mm: hmm-tests: include linux/mman.h to access MADV_COLLAPSE
Date: Sun, 28 Jun 2026 22:31:11 +0800
Message-ID: <20260628143111.36863-1-zenghui.yu@linux.dev>
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Migadu-Flow: FLOW_OUT

The following compilation error occurs with an old version of glibc due to
a recent commit adding MADV_COLLAPSE testing:

 [root@localhost mm]# getconf GNU_LIBC_VERSION
 glibc 2.34
 [root@localhost mm]# make
   CC       hmm-tests
 hmm-tests.c: In function 'hmm_migrate_anon_huge_fault':
 hmm-tests.c:2355:27: error: 'MADV_COLLAPSE' undeclared (first use in this function); did you mean 'MADV_COLD'?
  2355 |  ret = madvise(map, size, MADV_COLLAPSE);
       |                           ^~~~~~~~~~~~~
       |                           MADV_COLD
 hmm-tests.c:2355:27: note: each undeclared identifier is reported only once for each function it appears in
 make: *** [../lib.mk:225: /root/code/linux/tools/testing/selftests/mm/hmm-tests] Error 1

Include linux/mman.h (which provides the definition of MADV_COLLAPSE) to
fix the build error.

Fixes: e3d8707358ea ("selftests/mm/hmm-tests: test pagemap reads of PMD device-private entries")
Signed-off-by: Zenghui Yu <zenghui.yu@linux.dev>
---
 tools/testing/selftests/mm/hmm-tests.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/tools/testing/selftests/mm/hmm-tests.c b/tools/testing/selftests/mm/hmm-tests.c
index e4c49699f3f7..2f2b9879d100 100644
--- a/tools/testing/selftests/mm/hmm-tests.c
+++ b/tools/testing/selftests/mm/hmm-tests.c
@@ -23,6 +23,7 @@
 #include <time.h>
 #include <pthread.h>
 #include <limits.h>
+#include <linux/mman.h>
 #include <sys/types.h>
 #include <sys/stat.h>
 #include <sys/mman.h>
-- 
2.53.0

