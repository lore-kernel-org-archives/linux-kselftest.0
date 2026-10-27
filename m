Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=95.215.58.160
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793103645;
	b=hXjHVDJRY0jKo8B05Ivk3TqUmiytP+haSs/9lFn6fTCpjfNuhx9E5d1v8gPHCjUI2epJ
	 sF072G2MAujLFg8Yz84u3Kh4afTbSgktTt0ZMKgkkZMACIT0KPIxmmO4AARoe+IlycNoW
	 L3lljIZ6+Ikdss9dMpd1/eNR45MQNDgkbLJ1wpySQR4vSB8DmE/jWNpGzhrAoB912lTov
	 yxbxyIHUA8vcTX5Yl84vyayHMEprmbtxT5eHsIsW2TPniRM7+lxcMU2oOYFQfsQodilzj
	 aTIeO2uLAcyzjnaPCJux8itV+yC66lDH2xlWCaTXRn9xByUeeQfZh29yvnLO9FV7ugw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793103645;
	h=DMARC-Filter:X-Envelope-To:DKIM-Signature:X-Envelope-To:Received:
	 X-Mizu-Trace-ID:X-Migadu-Flow:From:To:Cc:Subject:Date:Message-ID:
	 X-Mailer:MIME-Version:Content-Transfer-Encoding;
	bh=3uHNkIbz1W2hVmZzTNOsS0vwkqrVetO/PC31U24Oh2o=;
	b=UvO+PgskjDluTIIfcu30L/E7uqD6+E0N/c2jSd6bWaQc3klLtENaGgH3Aus/++CeDhpz
	 m6u0Hm3oDOjQ+nFpXSo7iDIO89bZF5RJRyF0cYAY63fKEdk0e1akByPs6/rxVezDVgV/m
	 j7hEF6R52u4OHNRm2pCHa/MP0XwLjPCE05saL5Zyo9wkz+AAGPaCybKpbP6QfjaFnb+hJ
	 Oa8lKzFpKBRvforiCv8qgHvz0Anhg3RLx416xKUndxDZkYc0UO8sJngThzu1QjlILh5rl
	 W3hSIFEFjv2QDRRHGLtHu++UkZUveUI9XUAg0PmfoiuE7Cphi9sAVCmchiQ5esHE2ew==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=linux.dev;
	spf=pass smtp.mailfrom=linux.dev;
	dkim=pass header.d=linux.dev header.i=@linux.dev header.a=rsa-sha256 header.s=key1 header.b=k6+zS+vG;
	arc=none smtp.remote-ip=95.215.58.160
Received: from mta1.migadu.com (out-160.mta1.migadu.com [95.215.58.160])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0AA34606A31D
	for <linux-kselftest@vger.kernel.org>; Tue, 27 Oct 2026 12:20:44 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 0AA34606A31D
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=linux.dev header.i=@linux.dev header.a=rsa-sha256 header.s=key1 header.b=k6+zS+vG
X-Envelope-To: linux-kselftest@vger.kernel.org
DKIM-Signature: a=rsa-sha256; bh=cF4VhcKCkracUo6gNIATmuRN1hHW/I53fxt0RDVbk+M=;
 c=simple/simple; d=linux.dev;
 h=from:to:subject:date:message-id:mime-version:content-type; s=key1;
 t=1793103643; v=1; x=1793708443;
 b=k6+zS+vGc0DuFZGWaTqzhdhz1NQwKEixaQvY0If8/c5h9gJnI5Qhrbgys/3hsQWHb+iH8/Ta
 55Hv9OEC+PWZQY4Zmr//7zwrafI66hmZvydjK3xqWB7nXtPcIMS+aeavKFcZt1Gdx7Mo985pjyL
 hh1z0reSYhL/SZIG2GUzq5pg=
X-Envelope-To: linux-kselftest@vger.kernel.org
Received: by smtp.migadu.com with ESMTPS id 5ae49ba9d3797755;
	Tue, 27 Oct 2026 12:20:43 +0000
X-Mizu-Trace-ID: 5ae49ba9d3797755
X-Migadu-Flow: FLOW_OUT
From: Zenghui Yu <zenghui.yu@linux.dev>
To: linux-mm@kvack.org,
	linux-kselftest@vger.kernel.org,
	linux-kernel@vger.kernel.org
Cc: akpm@linux-foundation.org,
	david@kernel.org,
	ljs@kernel.org,
	liam@infradead.org,
	vbabka@kernel.org,
	rppt@kernel.org,
	surenb@google.com,
	mhocko@suse.com,
	kas@kernel.org,
	"Zenghui Yu (Huawei)" <zenghui.yu@linux.dev>
Subject: [PATCH] selftests/mm: fix khugepaged_race build with older glibc
Date: Tue, 27 Oct 2026 20:20:13 +0800
Message-ID: <20261027122013.4286-1-zenghui.yu@linux.dev>
X-Mailer: git-send-email 2.56.0
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

From: "Zenghui Yu (Huawei)" <zenghui.yu@linux.dev>

glibc versions before 2.37 do not define MADV_COLLAPSE in <sys/mman.h>, so
khugepaged_race fails to build against them (e.g. glibc 2.34):

[root@localhost mm]# make
  CC       khugepaged_race
khugepaged_race.c: In function 'main':
khugepaged_race.c:506:23: error: 'MADV_COLLAPSE' undeclared (first use in this function); did you mean 'MADV_COLD'?
  506 |       hpage_pmd_size, MADV_COLLAPSE);
      |                       ^~~~~~~~~~~~~
      |                       MADV_COLD
khugepaged_race.c:506:23: note: each undeclared identifier is reported only once for each function it appears in
make: *** [../lib.mk:225: /data/code/mm/tools/testing/selftests/mm/khugepaged_race] Error 1

Include <linux/mman.h> to get the UAPI definition of MADV_COLLAPSE.

Fixes: 66c374464438 ("selftests/mm: add khugepaged race harness")
Signed-off-by: Zenghui Yu (Huawei) <zenghui.yu@linux.dev>
---
 tools/testing/selftests/mm/khugepaged_race.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/tools/testing/selftests/mm/khugepaged_race.c b/tools/testing/selftests/mm/khugepaged_race.c
index abb0678522cd..1a27cb39745b 100644
--- a/tools/testing/selftests/mm/khugepaged_race.c
+++ b/tools/testing/selftests/mm/khugepaged_race.c
@@ -8,6 +8,7 @@
 #define _GNU_SOURCE
 #include <errno.h>
 #include <fcntl.h>
+#include <linux/mman.h>
 #include <pthread.h>
 #include <stdio.h>
 #include <stdlib.h>
-- 
2.56.0

