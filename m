Received: from m16.mail.163.com (m16.mail.163.com [117.135.210.2])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A7EE6211466;
	Mon, 27 Jul 2026 03:16:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=117.135.210.2
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785122178; cv=none; b=VnTGqodMtq1nRlodphJQULPagSUjpO2OAQar2ScTpx8//p+04TPSw9+QbWCNNoMc3Z5d4gN56n8VhJzRJYcDFPP16lWPvco47rikQ39T1GISWznKyz9AoWUljWpeviGwIdCEyhUWdnt1Qd+iYLbj3yN6czyuSDHaudEWSRIF+iM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785122178; c=relaxed/simple;
	bh=yI9IqQQ2qpsQQ81iFXRXbsLlHtQwMnPhCB0xzIpRgCU=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=aaL9OG9Fv0QAt3zXjDLPzJ1RAgGwcJ/qmY6ELbNa9OgT7byidhbIJnwyZl+TpKJqrQG6SSGokFsU06YIhzKSYjTmsB+lXsacocudW9kYomwbDsTZ8ccbPXu/t5RGqIRStSOO6VMBnkVcuOyIUgarW7d40fBPYWpf1cs5VbFl5lw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=163.com; spf=pass smtp.mailfrom=163.com; dkim=pass (1024-bit key) header.d=163.com header.i=@163.com header.b=A5R//N4T; arc=none smtp.client-ip=117.135.210.2
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=163.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=163.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=163.com header.i=@163.com header.b="A5R//N4T"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=163.com;
	s=s110527; h=From:To:Subject:Date:Message-Id:MIME-Version; bh=4A
	gOWnOxwJtt47rQ62lTQ52q6AYMCeM1jcrFwwZhihQ=; b=A5R//N4T0ks6Pmgcsf
	nbwMo4qDCrOers8MoZ5HMXFCd4TQZb/MmfGZfgc+5xpalTu86JYlld2qHrj90+OI
	45yNN+NcS0LYHIz1fxiiVrXdHro7wHqjT03kN3FcrYGyr5JJv24OuyxzEDmp7Xyk
	vxZxnKYKIcfxhR0HjE4exkAP0=
Received: from localhost.localdomain (unknown [])
	by gzga-smtp-mtada-g0-1 (Coremail) with SMTP id _____wAX2YZczWZqURewLQ--.1816S2;
	Mon, 27 Jul 2026 11:15:40 +0800 (CST)
From: Lei Zhu <zhulei_szu@163.com>
To: david@ixit.cz,
	bongsu.jeon@samsung.com,
	shuah@kernel.org
Cc: oe-linux-nfc@lists.linux.dev,
	netdev@vger.kernel.org,
	linux-kselftest@vger.kernel.org,
	zhulei_szu@163.com
Subject: [PATCH] selftests: nci: Correct pthread_create return value check
Date: Mon, 27 Jul 2026 11:15:40 +0800
Message-Id: <20260727031540.125244-1-zhulei_szu@163.com>
X-Mailer: git-send-email 2.25.1
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CM-TRANSID:_____wAX2YZczWZqURewLQ--.1816S2
X-Coremail-Antispam: 1Uf129KBjvJXoW7KFW7XF15Kw13KFyxCr13CFg_yoW8uF4rp3
	4kZas5CFW8AF4qy3W2yrZYvF45tr4DXFWkArWY9348u3y3XrWrtr1kKF1UWF17urZ8t3WF
	vryruF9xuF4xJaUanT9S1TB71UUUUU7qnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
	9KBjDUYxBIdaVFxhVjvjDU0xZFpf9x0pEb18DUUUUU=
X-CM-SenderInfo: x2kxzvxlbv63i6rwjhhfrp/xtbC8By+DGpmzVxJKAAA3i

From: Lei Zhu <zhulei@kylinos.cn>

The pthread_create() functions returns 0 on success and a positive value on
failure. Modify the return value check to correctly detect failure cases.

Fixes: 72696bd8a09d ("selftests: nci: Extract the start/stop discovery function")
Signed-off-by: Lei Zhu <zhulei@kylinos.cn>
---
 tools/testing/selftests/nci/nci_dev.c | 10 +++++-----
 1 file changed, 5 insertions(+), 5 deletions(-)

diff --git a/tools/testing/selftests/nci/nci_dev.c b/tools/testing/selftests/nci/nci_dev.c
index 312f84ee0444..d2ce79daae39 100644
--- a/tools/testing/selftests/nci/nci_dev.c
+++ b/tools/testing/selftests/nci/nci_dev.c
@@ -438,7 +438,7 @@ FIXTURE_SETUP(NCI)
 	else
 		rc = pthread_create(&thread_t, NULL, virtual_dev_open,
 				    (void *)&self->virtual_nci_fd);
-	ASSERT_GT(rc, -1);
+	ASSERT_EQ(rc, 0);
 
 	rc = send_cmd_with_idx(self->sd, self->fid, self->pid,
 			       NFC_CMD_DEV_UP, self->dev_idex);
@@ -509,7 +509,7 @@ FIXTURE_TEARDOWN(NCI)
 			rc = pthread_create(&thread_t, NULL, virtual_deinit,
 					    (void *)&self->virtual_nci_fd);
 
-		ASSERT_GT(rc, -1);
+		ASSERT_EQ(rc, 0);
 		rc = send_cmd_with_idx(self->sd, self->fid, self->pid,
 				       NFC_CMD_DEV_DOWN, self->dev_idex);
 		EXPECT_EQ(rc, 0);
@@ -590,7 +590,7 @@ int start_polling(int dev_idx, int proto, int virtual_fd, int sd, int fid, int p
 
 	rc = pthread_create(&thread_t, NULL, virtual_poll_start,
 			    (void *)&virtual_fd);
-	if (rc < 0)
+	if (rc)
 		return rc;
 
 	rc = send_cmd_mt_nla(sd, fid, pid, NFC_CMD_START_POLL, 2, nla_start_poll_type,
@@ -610,7 +610,7 @@ int stop_polling(int dev_idx, int virtual_fd, int sd, int fid, int pid)
 
 	rc = pthread_create(&thread_t, NULL, virtual_poll_stop,
 			    (void *)&virtual_fd);
-	if (rc < 0)
+	if (rc)
 		return rc;
 
 	rc = send_cmd_with_idx(sd, fid, pid,
@@ -874,7 +874,7 @@ TEST_F(NCI, deinit)
 	else
 		rc = pthread_create(&thread_t, NULL, virtual_deinit,
 				    (void *)&self->virtual_nci_fd);
-	ASSERT_GT(rc, -1);
+	ASSERT_EQ(rc, 0);
 
 	rc = send_cmd_with_idx(self->sd, self->fid, self->pid,
 			       NFC_CMD_DEV_DOWN, self->dev_idex);
-- 
2.25.1

