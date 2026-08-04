Received: from smtpbgeu2.qq.com (smtpbgeu2.qq.com [18.194.254.142])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 149CC340281;
	Tue,  4 Aug 2026 12:17:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=18.194.254.142
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785845868; cv=none; b=Q7UGmb0oQax2dWrntC5AAiZ7ipojpFOZAJVRkSK2TgOeOxnuDQPZlQ8gPOnFAqYjadmmiQIgoL441GlkhPT96ug27akMt6cTPf9qfOTcrprWagC5j/sGass9KSgEIfgPGK6n/XYwVLf8+BaMpuQdfqUZYps3+6hQiMUMhodVPOQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785845868; c=relaxed/simple;
	bh=VvE2LKjM5ZWS66GpviKnuoAH7c7zBqweiRyeAjYwDR4=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References; b=ZOS5nljsckw4KvXOXrvFZCZ+PC2a+ZbXTgkzNPWlqWRDuur5UA5Z/07NzZteCcrO2oZT/ffvPy21molhTxMV1fifgMxuGzuMOrHqngfS8Xp2McnU3vGCDY3u7cwXJz6DbAYR9hDd59PvUzawpMYX9QVysNaD4PVbtxFTrhUIsdY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ugreen.com; spf=pass smtp.mailfrom=ugreen.com; dkim=pass (1024-bit key) header.d=ugreen.com header.i=@ugreen.com header.b=NzxVH9S3; arc=none smtp.client-ip=18.194.254.142
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ugreen.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ugreen.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ugreen.com header.i=@ugreen.com header.b="NzxVH9S3"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ugreen.com;
	s=pkvm2402; t=1785845858;
	bh=N+5x2O0AaXVTBFLcJOSpjdOEEsG7GciUWuhMJqvwAwI=;
	h=From:To:Subject:Date:Message-Id;
	b=NzxVH9S3wQDVYtY3Jnrmjfr9fG0k8MJNbYX8bhD/OAKcAqHZe9JyPHrfA1eAO+QLU
	 lT4dOh9mR61sd7Vz3WHoxE+ZV3TAdsy6vqpTQSrIV1FktdVGEztXp6aNwamcWurEnq
	 TiTZ0noSfUeqLCT+MFl1f9mXGdRDWYvnbDKSOh2E=
X-QQ-mid: esmtpsz20t1785845853t7f5c10f7
X-QQ-Originating-IP: P3vIaFGclNI048NjNJM92lV3lMKWV/wY7CS5UTrKovc=
Received: from localhost.localdomain ( [113.98.201.214])
	by bizesmtp.qq.com (ESMTP) with 
	id ; Tue, 04 Aug 2026 20:17:22 +0800 (CST)
X-QQ-SSF: 0000000000000000000000000000000
X-QQ-GoodBg: 0
X-BIZMAIL-ID: 15148486447510069967
EX-QQ-RecipientCnt: 13
From: Warren Xiong <warren.xiong@ugreen.com>
To: akpm@linux-foundation.org,
	shuah@kernel.org
Cc: david@kernel.org,
	ljs@kernel.org,
	liam@infradead.org,
	vbabka@kernel.org,
	rppt@kernel.org,
	surenb@google.com,
	mhocko@suse.com,
	linux-mm@kvack.org,
	linux-kselftest@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Warren Xiong <warren.xiong@ugreen.com>
Subject: [PATCH v2] selftests/mm: read memory information without popen
Date: Tue,  4 Aug 2026 20:16:58 +0800
Message-Id: <1785845818-3131-1-git-send-email-warren.xiong@ugreen.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1785720615-5826-1-git-send-email-warren.xiong@ugreen.com>
References: <1785720615-5826-1-git-send-email-warren.xiong@ugreen.com>
X-QQ-SENDSIZE: 520
Feedback-ID: esmtpsz:ugreen.com:qybglogicsvrgz:qybglogicsvrgz6b-0
X-QQ-XMAILINFO: MwoN/pFApqr2FftfL4rngzLi7NfCCi+g/ijWzRHFyxo/UhKzPJfLT5RY
	0md+lOJHOS/XJkQfQF34zXumNXc40iCjIo8W2Q2HQJ+z30ZBETvSJjhfxZhWJKDIWyNb1V3
	B0YMqtYCufmNTbrftpoFRGsPZFwKhVwyWBMRiXe1z8tsWnVcHltebFW7gVIQFkxafUw81jF
	T8wKtpf7jGbRKdnIxNXzOwYcJQOyjVPVh/IexlswzbVqE+/W/H5X1132Vo4L3/KJYrmNWbf
	O4wqiMUA9Gjn3QImZy3J3d8jr6R3KcLm7bVQadwBooNYBRn9FXYdIwAk+bk35Q0O0aAzxtm
	5FNokmQ4b4F8Pfwb6KNMPuYXkLdmXvQrEB/JYhOrTFLlaJt9p1DsOo1PhHTNcQip6U0GykS
	LEVoMgtlKyiUne92gk222lACtcL5UpHFZxovGu2FcTrAMkiCZcFHZjtB/CkUdmaKtaGX+Bq
	HrafPrznjnBkS5RxiuzkWVOFdM9Zl96L4xAk8IS1D3d3Z9bg2gbaEfIuINEXeQ0z9SsIIKD
	TNPd82YQ3SLDV8ZDtQokIIabO8+S9gp1EPg603r+veMw1ibW4kyhZZWzhh37z4NtJiRc+H8
	m6+GeF7ywoVa3/tjZOml/ty2Dd8QsZqTO7INZev6y7ERzLIs2NDiiRwvHXLaSwPWUCCoSKO
	FZfytbAUaVD3WQpMTj1lOEzuYl9VPyXmjQCmeW66g5JSN4eqA8lznMhfQ6cyUK49Mlw514H
	yPlEzAEm5vf7us/aTn1qn4zO16X9H5KzgRlgwzToQ8dTx/5/5UnwWaZwsA5WD7fksPXzoA4
	InUH6U7aYrS+y8/qyxGu96ln9O6ZOmjEAR0WWBK5+sf5TSpXOEkseTIKTLs2s/oUqwo22wo
	sRC1etsaQgkQyibgw5wCYCV7ZY8WFJhhS8VfZWDmh9S6XVeWVeJJQvzjLRFzAY2AvqxwEgt
	+bRm1AcMxJVYrE4Htusxc9hYEjXdBc4TqGHp5PIozuVV4pGSk/lKia3/dGZXo5oec4zhfOD
	hNgHAwzRI641lUX5Xhz2jGvG5ZoOSHIO9VYVJw4fNRPQq1jFwf/0WD8h3kwygeRvjmoqp+U
	S6qmcGfXRKF7xv1OroSMv+rXb6pcJYfIw==
X-QQ-XMRINFO: NS+P29fieYNwqS3WCnRCOn9D1NpZuCnCRA==
X-QQ-RECHKSPAM: 0
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>

read_memory_info() invokes two shell pipelines to obtain MemFree and
Hugepagesize from /proc/meminfo. It does not check whether popen()
returns NULL before passing the result to fgets(), and it does not call
pclose() when fgets() fails.

Open /proc/meminfo directly and obtain both values in a single pass.
This removes the unchecked NULL path, closes the file on all paths, and
avoids dependencies on external commands.

The compaction test continues to pass after this change.

Signed-off-by: Warren Xiong <warren.xiong@ugreen.com>
---
Changes in v2:
- Replace the two boolean flags with a hit counter, as suggested by
  David Hildenbrand.

v1: https://lore.kernel.org/1785720615-5826-1-git-send-email-warren.xiong@ugreen.com/

 tools/testing/selftests/mm/compaction_test.c | 38 +++++++++++++++-------------
 1 file changed, 21 insertions(+), 17 deletions(-)

diff --git a/tools/testing/selftests/mm/compaction_test.c b/tools/testing/selftests/mm/compaction_test.c
index 5b58258..30d4ace 100644
--- a/tools/testing/selftests/mm/compaction_test.c
+++ b/tools/testing/selftests/mm/compaction_test.c
@@ -29,30 +29,34 @@ struct map_list {
 
 int read_memory_info(unsigned long *memfree, unsigned long *hugepagesize)
 {
-	char  buffer[256] = {0};
-	char *cmd = "cat /proc/meminfo | grep -i memfree | grep -o '[0-9]*'";
-	FILE *cmdfile = popen(cmd, "r");
+	char buffer[256];
+	int found = 0;
+	FILE *file;
+	int ret = -1;
 
-	if (!(fgets(buffer, sizeof(buffer), cmdfile))) {
-		ksft_print_msg("Failed to read meminfo: %s\n", strerror(errno));
+	file = fopen("/proc/meminfo", "r");
+	if (!file) {
+		ksft_print_msg("Failed to open /proc/meminfo: %s\n",
+			       strerror(errno));
 		return -1;
 	}
 
-	pclose(cmdfile);
-
-	*memfree = atoll(buffer);
-	cmd = "cat /proc/meminfo | grep -i hugepagesize | grep -o '[0-9]*'";
-	cmdfile = popen(cmd, "r");
-
-	if (!(fgets(buffer, sizeof(buffer), cmdfile))) {
-		ksft_print_msg("Failed to read meminfo: %s\n", strerror(errno));
-		return -1;
+	while (fgets(buffer, sizeof(buffer), file) && found != 2) {
+		if (sscanf(buffer, "MemFree: %lu kB", memfree) == 1 ||
+		    sscanf(buffer, "Hugepagesize: %lu kB", hugepagesize) == 1)
+			found++;
 	}
 
-	pclose(cmdfile);
-	*hugepagesize = atoll(buffer);
+	if (ferror(file))
+		ksft_print_msg("Failed to read /proc/meminfo: %s\n",
+			       strerror(errno));
+	else if (found != 2)
+		ksft_print_msg("Failed to parse /proc/meminfo\n");
+	else
+		ret = 0;
 
-	return 0;
+	fclose(file);
+	return ret;
 }
 
 int prereq(void)
-- 
2.7.4
