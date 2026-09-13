Received: from m16.mail.163.com (m16.mail.163.com [117.135.210.5])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B2DE6374745;
	Sun, 13 Sep 2026 06:35:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=117.135.210.5
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789281359; cv=none; b=YFbxYIdt0Iwb+mwJoJF/Kd30alYOEFYVFLgxUDfDeGeK1mQWFG7AG1aJpyQtYfYOFrdVuHUBYqxs8bHSG2xrMdg6BusdREPcoRFJJ92g572DjMTn92fYVhbeEkLS0VorZrzZMGADLrEl2cKSjMawOYq3jlcwJ59Oy7+r1NMYY3M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789281359; c=relaxed/simple;
	bh=ONiEDh5RCxcG+d5MzmF6pFw2I9pINv/Sb5S7kG8toDk=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=mRLxAWk4bSGUPEizPbXX6+jrovRiVSnFPpPp5AMoYZhluxd5FCm/GlkuufoepjO6etn3YQMZ0XUkj5DMHRXj0zK+9/eWFEKtdl/2tKDCYToYRfosTOUA6/6rQ6uveXSxnhFVAa28Eptj6MLAQ9QMEtiBVdIq2+gEUFKkytJJLwA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=163.com; spf=pass smtp.mailfrom=163.com; dkim=pass (1024-bit key) header.d=163.com header.i=@163.com header.b=T1nXMjx+; arc=none smtp.client-ip=117.135.210.5
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=163.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=163.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=163.com header.i=@163.com header.b="T1nXMjx+"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=163.com;
	s=s110527; h=From:To:Subject:Date:Message-ID:MIME-Version; bh=Uy
	dHFPlT/LvY4TGP582dBZaNlxC8hCkdi8SuWa1765Q=; b=T1nXMjx+/J/TFiLjFu
	f6FHOP6asrmaE0XFiQPajqVkOvtnPzwaTqr7pu9D2VWOy2CAo//rqRJl+iCntWIm
	72VSyu4iKX3r+g9+JEQ1UTjEyQ4UVAo4az4Rh81fVuC3gueRfeCOMtCObmZEx89L
	OonKSwdoTJnXKKviyhtEA5xdE=
Received: from localhost (unknown [])
	by gzga-smtp-mtada-g1-2 (Coremail) with SMTP id _____wD3z+gBRKZq3wuLAQ--.45906S2;
	Sun, 13 Sep 2026 14:34:42 +0800 (CST)
From: Hui Su <sh_def@163.com>
To: mingo@redhat.com,
	peterz@infradead.org
Cc: juri.lelli@redhat.com,
	vincent.guittot@linaro.org,
	dietmar.eggemann@arm.com,
	rostedt@goodmis.org,
	bsegall@google.com,
	mgorman@suse.de,
	vschneid@redhat.com,
	kprateek.nayak@amd.com,
	shuah@kernel.org,
	chris.hyser@oracle.com,
	linux-kernel@vger.kernel.org,
	linux-kselftest@vger.kernel.org,
	sh_def@163.com
Subject: [PATCH v1 2/2] selftests/sched: Retry PR_SCHED_CORE_GET on EBUSY
Date: Sun, 13 Sep 2026 15:34:39 +0900
Message-ID: <20260913063439.1513107-3-sh_def@163.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20260913063439.1513107-1-sh_def@163.com>
References: <20260913063439.1513107-1-sh_def@163.com>
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CM-TRANSID:_____wD3z+gBRKZq3wuLAQ--.45906S2
X-Coremail-Antispam: 1Uf129KBjvJXoW7Ww1DGr45Xw4kWFWruw1DGFg_yoW8uFWrpr
	WfX34DtF4YgF9xtrn3JrWvgryrZrnFqFWUGw4fJryxAw48t3WUtr1xtF4agF17CFWFv3yS
	yr4ava4YkayDJ3DanT9S1TB71UUUUU7qnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
	9KBjDUYxBIdaVFxhVjvjDU0xZFpf9x0JUjjg7UUUUU=
X-CM-SenderInfo: xvkbvvri6rljoofrz/xtbCwQJVtGqmRALRZgAA3f

During early boot, the pointer hash key may not be initialized when
PR_SCHED_CORE_GET is called. With the preceding kernel fix, GET reports
EBUSY until the pointer hash key becomes available.

Retry the operation for up to one second when it returns EBUSY. Report
other errors immediately, instead of describing every failed GET as an
unsupported core scheduling system.

cs_prctl_test passes on x86_64 QEMU with normal random initialization.
A targeted early-boot probe also confirmed that the fixed kernel
returns EBUSY while pointer hashing is unavailable.

Signed-off-by: Hui Su <sh_def@163.com>
---
 tools/testing/selftests/sched/cs_prctl_test.c | 27 ++++++++++++++-----
 1 file changed, 20 insertions(+), 7 deletions(-)

diff --git a/tools/testing/selftests/sched/cs_prctl_test.c b/tools/testing/selftests/sched/cs_prctl_test.c
index 52d97fae4dbd..dcb661cace5e 100644
--- a/tools/testing/selftests/sched/cs_prctl_test.c
+++ b/tools/testing/selftests/sched/cs_prctl_test.c
@@ -51,6 +51,8 @@ static pid_t gettid(void)
 
 #define MAX_PROCESSES 128
 #define MAX_THREADS   128
+#define CORE_COOKIE_RETRIES	100
+#define CORE_COOKIE_RETRY_US	10000
 
 static const char USAGE[] = "cs_prctl_test [options]\n"
 "    options:\n"
@@ -112,16 +114,27 @@ static void handle_usage(int rc, char *msg)
 static unsigned long get_cs_cookie(int pid)
 {
 	unsigned long long cookie;
-	int ret;
+	int i, ret, err = 0;
+
+	for (i = 0; i < CORE_COOKIE_RETRIES; i++) {
+		ret = prctl(PR_SCHED_CORE, PR_SCHED_CORE_GET, pid, PIDTYPE_PID,
+			    (unsigned long)&cookie);
+		if (!ret)
+			return cookie;
+
+		err = errno;
+		if (err != EBUSY)
+			break;
 
-	ret = prctl(PR_SCHED_CORE, PR_SCHED_CORE_GET, pid, PIDTYPE_PID,
-		    (unsigned long)&cookie);
-	if (ret) {
-		printf("Not a core sched system\n");
-		return -1UL;
+		usleep(CORE_COOKIE_RETRY_US);
 	}
 
-	return cookie;
+	if (err == EBUSY)
+		printf("Timed out waiting for core sched cookie\n");
+	else
+		printf("Failed to get core sched cookie: %s\n", strerror(err));
+
+	return -1UL;
 }
 
 static int child_func_thread(void __attribute__((unused))*arg)
-- 
2.55.0

