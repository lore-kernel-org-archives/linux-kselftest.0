Received: from m16.mail.163.com (m16.mail.163.com [220.197.31.5])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BEA473BBA0F;
	Wed, 29 Jul 2026 07:25:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=220.197.31.5
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785309943; cv=none; b=J/1Q0QuOHt+d97IF2WxG1x889vd9hkmBt69AMYS03i1BkZis6ZZDmQUZNDdkgogdtcTrqQfNkqoAsEXlep2Dq3V8jZzmQhb5RCS2ZY9QPbSYtwVKVS3Y5dvY0HJ1a76KJNgDgEAduIoL4DoTl8OuaxHIaAtZGeoRcsW/YEq9H+k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785309943; c=relaxed/simple;
	bh=uA9E/02FBdvC/3xgD65N3r2jIubgdR1WUsAw5W6kXyg=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=pEQLfs7iVRPvUh8pasPBeKPRYQxGq1SXM0Y59tZ3SEqt+8aSNRFfJaPJq9eQOkjEUTLdKu+KFLZhcghwMSBM2aIz/NAow47U+jt+njztzpBheY0EX6PYC7sBsCqv7y1OCE6Yj8L8fwqpMtTiKy/1CK7OyYNMOJae63iM8ow0VE4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=163.com; spf=pass smtp.mailfrom=163.com; dkim=pass (1024-bit key) header.d=163.com header.i=@163.com header.b=KCnHMQTY; arc=none smtp.client-ip=220.197.31.5
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=163.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=163.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=163.com header.i=@163.com header.b="KCnHMQTY"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=163.com;
	s=s110527; h=From:To:Subject:Date:Message-Id:MIME-Version; bh=vr
	qb3sxHYXBZhJfHNSGI2OIYuH/m+iQgzsQRyibmvh4=; b=KCnHMQTYzPp+UN2aBT
	y+zB93ZLVEnnykqasZgTrKLaSPrNC2gsL7FCuvXMlhODROyLsA+4NNc6W325mUxV
	sIIw28Rj7O2x/0McHL4TjbOK23yQ0XS+VUQ2EePsXcuN+Ac0mMd7wPG1tbrMqbzj
	ex36r+RmeMHZ0cnYAUrr2zo6I=
Received: from localhost.localdomain (unknown [])
	by gzga-smtp-mtada-g1-4 (Coremail) with SMTP id _____wD3dImqqmlq0n+hMg--.15305S2;
	Wed, 29 Jul 2026 15:24:26 +0800 (CST)
From: Lei Zhu <zhulei_szu@163.com>
To: david@ixit.cz,
	bongsu.jeon@samsung.com,
	shuah@kernel.org
Cc: oe-linux-nfc@lists.linux.dev,
	netdev@vger.kernel.org,
	linux-kselftest@vger.kernel.org
Subject: [PATCH v2] selftests: nci: Correct pthread_create return value check
Date: Wed, 29 Jul 2026 15:24:26 +0800
Message-Id: <20260729072426.303484-1-zhulei_szu@163.com>
X-Mailer: git-send-email 2.25.1
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CM-TRANSID:_____wD3dImqqmlq0n+hMg--.15305S2
X-Coremail-Antispam: 1Uf129KBjvJXoW7KFWxZr4UCr15urWfJFWUJwb_yoW5JF1kpa
	48Aa4kCF48AF4vy3W3AFZ0vF45tr4DXFWkArZ09348u3y3X3yrtr1kKFyUWF17urZ8t3WF
	vryruF9xuF4xJF7anT9S1TB71UUUUU7qnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
	9KBjDUYxBIdaVFxhVjvjDU0xZFpf9x07jeoGQUUUUU=
X-CM-SenderInfo: x2kxzvxlbv63i6rwjhhfrp/xtbC7wvJF2ppqqtIigAA36

From: Lei Zhu <zhulei@kylinos.cn>

The pthread_create() functions returns 0 on success and a positive value on
failure. Modify the return value check to correctly detect failure cases.

Fixes: 72696bd8a09d ("selftests: nci: Extract the start/stop discovery function")
Signed-off-by: Lei Zhu <zhulei@kylinos.cn>
---
- Sashiko pointed out ignored the return value check in
  disconnect_tag. Fixed now.
---
 tools/testing/selftests/nci/nci_dev.c | 12 +++++++-----
 1 file changed, 7 insertions(+), 5 deletions(-)

diff --git a/tools/testing/selftests/nci/nci_dev.c b/tools/testing/selftests/nci/nci_dev.c
index 312f84ee0444..c053f5cf2745 100644
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
@@ -830,6 +830,8 @@ int disconnect_tag(int nfc_sock, int virtual_fd)
 
 	status = pthread_create(&thread_t, NULL, virtual_deactivate_proc,
 				(void *)&virtual_fd);
+	if (status)
+		return status;
 
 	close(nfc_sock);
 	pthread_join(thread_t, (void **)&status);
@@ -874,7 +876,7 @@ TEST_F(NCI, deinit)
 	else
 		rc = pthread_create(&thread_t, NULL, virtual_deinit,
 				    (void *)&self->virtual_nci_fd);
-	ASSERT_GT(rc, -1);
+	ASSERT_EQ(rc, 0);
 
 	rc = send_cmd_with_idx(self->sd, self->fid, self->pid,
 			       NFC_CMD_DEV_DOWN, self->dev_idex);
-- 
2.25.1

