Received: from smtpbgau1.qq.com (smtpbgau1.qq.com [54.206.16.166])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 08C5F7262B;
	Mon,  3 Aug 2026 01:31:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=54.206.16.166
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785720665; cv=none; b=gPTDL1P6Xhj/CHp7QQoZxTql5jeLd4Mc8nj3hRjcmT6QX0vDAH5BrL03ykw7TjfP21HPO+jHGpQUKJn6h29bG81vSwdODaIjo1MsCjRFakh7/KkA23ihfgyaSrg7XTCDsbsQ9FOqPciJktK/4roVX7TZbMf/HfzgmOxCpdKR1v4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785720665; c=relaxed/simple;
	bh=+H3zhhQraCjI/WnJ3x+gTlgSdfPjFbqGoizISw5fjVI=;
	h=From:To:Cc:Subject:Date:Message-Id; b=QEZaXTpDwbxUIEZeRu9/mT7pketo5qRUm9Py7jAiFLPkBkide4Bj1uHNpBKR2BZ+LuB9heHgk7Kd0E/F8IiIcRPledlNhhHZiNt2kQIBk6XtAlkPoujfpj+9qEeiGzHtxQkVl0m3ePW5bkbLrP5TYtq7bLfj03QtJnWNiFDUdlw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ugreen.com; spf=pass smtp.mailfrom=ugreen.com; dkim=pass (1024-bit key) header.d=ugreen.com header.i=@ugreen.com header.b=Z8AZaOly; arc=none smtp.client-ip=54.206.16.166
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ugreen.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ugreen.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ugreen.com header.i=@ugreen.com header.b="Z8AZaOly"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ugreen.com;
	s=pkvm2402; t=1785720650;
	bh=09rkTuMDDVqF9abH3X0B/t3sherUeOedU/4OBZrumvI=;
	h=From:To:Subject:Date:Message-Id;
	b=Z8AZaOlyIWc1b3u7sThkZH/m8wVZUS7oghcqAXch7VMKiJHk0RXZkcfl1G1qQOqf5
	 JOz5QcdlV4dauwAsAhL28bRdj7kYGOgFUuyq7WCQmTqDEIAGpH1To4W0k59dyqhLfd
	 VHYV4JrdcW7uY7ZhX9F1LelGdILZfsYR0j8URF10=
X-QQ-mid: zesmtpsz2t1785720645t91937be5
X-QQ-Originating-IP: bzQf6HnNiJZYwmOVBHh+2fwKuDqnUpmM2SuA4MLcqjQ=
Received: from localhost.localdomain ( [113.98.201.214])
	by bizesmtp.qq.com (ESMTP) with 
	id ; Mon, 03 Aug 2026 09:30:34 +0800 (CST)
X-QQ-SSF: 0000000000000000000000000000000
X-QQ-GoodBg: 0
X-BIZMAIL-ID: 12329309936361500638
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
Subject: [PATCH] selftests/mm: read memory information without popen
Date: Mon,  3 Aug 2026 09:30:15 +0800
Message-Id: <1785720615-5826-1-git-send-email-warren.xiong@ugreen.com>
X-Mailer: git-send-email 2.7.4
X-QQ-SENDSIZE: 520
Feedback-ID: zesmtpsz:ugreen.com:qybglogicsvrgz:qybglogicsvrgz6b-0
X-QQ-XMAILINFO: NoFe3wCY3jEyoxdnkMFbgJNvGA+aMzlDDQG6skGHQ9uBjm0Arpx+vbsZ
	9h2Bf7GEXGs3gRI5JQFoVZxiOS0dCZtkyLxhz3m+E2GRYUczatzd+VQBOOFljzYXBMKSclL
	elnH6dyvpiwdS2f58N609ymavS+x8s90fWo8ldr2B1aEESbDpe0ENmrgWEHQM1Ig/ZE72FB
	TFl9/OJVQEABrMhlE1L9KtQF632Ay900ZCinZbAJM6Bxra9nDwu2NqhpBOvhGWzwtZ/EMP4
	3GM/wYZbjLXIrI1MJj+W8OUM8qC0h731aeka39+fmWU6JSNg5Eo6v6F9HqkZY7p8A06l9Ng
	chy3ZHyW7paxZRLCUOKooahE/zGBuqmW5psdalLWPB/GQPkMFF/oxJmXsyyQZvJBWJWFDKF
	OA1H8eURRoTNM7l+676tA1gMPQ7M2XI2PDr+va7kOm/Bi+TR9Qeqkjp6NzKw3GEILT0+IHc
	7M974HQJUCYAKNm5Sar8Z3Clu145EtBGzMTQ4TDo8sr7ddAwdypCwt6CGfKC9nZCjWswyN7
	Rr21HHXoQBpkIUpFCXCnUCVmqg/DC97pvlGnaj97/aiuFZPECtIo2Zfx5cyE+CZIfV9wvVn
	6IzOxEB3EL6LpQr68UFgI3/GPsnqZA48IUqn5G697QrWbPznmyoOp+DeM2PQan3Wi6p/6vE
	fGyuqqsJhEaWpioOcyevrhNgnesYHovELdr4U+7J87LXYYhv73R9TaCMKAdiHtwzWxU/uKc
	mbFOCcIFHJ3IZv2T6usC3hIS667UjzrIRS5E7b4niYx4oPD75OcMz7rC9HRUa7clDwqqQlB
	BUDY+LhnuGaUJILmdyKtO3sGSQZUXjrRY8qVf9Tq2Lu715X6pc95iK9cbo7D1WwLJ5ezZSs
	i5x0ZkXCWhdM+Z2BLhl7QO/AW1gDTgN42G+QWlQ871pcb5SN99odlfiqtlEXkJ4ZtSMbXal
	uBEfvA1Q0QSICCixa7knQARYKHdFr2xu3BYoN2jFCUgX2oICuyOyy6Ca7ERBd3oFxAsVQHW
	KZxGya9/ziiIJGMgQ4jKD9gOZvofc/zx0FasTg+UEe2O7yDrAnqKRnwXvkUxHcR9sznJvMg
	kGqVjbbYIwJUZpk5SY4Ick=
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
 tools/testing/selftests/mm/compaction_test.c | 43 +++++++++++++++++-----------
 1 file changed, 27 insertions(+), 16 deletions(-)

diff --git a/tools/testing/selftests/mm/compaction_test.c b/tools/testing/selftests/mm/compaction_test.c
index 5b58258..0df2000 100644
--- a/tools/testing/selftests/mm/compaction_test.c
+++ b/tools/testing/selftests/mm/compaction_test.c
@@ -7,6 +7,7 @@
  * allocated.
  */
 
+#include <stdbool.h>
 #include <stdio.h>
 #include <stdlib.h>
 #include <sys/mman.h>
@@ -29,30 +30,40 @@ struct map_list {
 
 int read_memory_info(unsigned long *memfree, unsigned long *hugepagesize)
 {
-	char  buffer[256] = {0};
-	char *cmd = "cat /proc/meminfo | grep -i memfree | grep -o '[0-9]*'";
-	FILE *cmdfile = popen(cmd, "r");
+	char buffer[256];
+	bool memfree_found = false;
+	bool hugepagesize_found = false;
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
+	while (fgets(buffer, sizeof(buffer), file)) {
+		if (sscanf(buffer, "MemFree: %lu kB", memfree) == 1)
+			memfree_found = true;
+		else if (sscanf(buffer, "Hugepagesize: %lu kB",
+				hugepagesize) == 1)
+			hugepagesize_found = true;
 
-	*memfree = atoll(buffer);
-	cmd = "cat /proc/meminfo | grep -i hugepagesize | grep -o '[0-9]*'";
-	cmdfile = popen(cmd, "r");
-
-	if (!(fgets(buffer, sizeof(buffer), cmdfile))) {
-		ksft_print_msg("Failed to read meminfo: %s\n", strerror(errno));
-		return -1;
+		if (memfree_found && hugepagesize_found) {
+			ret = 0;
+			break;
+		}
 	}
 
-	pclose(cmdfile);
-	*hugepagesize = atoll(buffer);
+	if (ferror(file))
+		ksft_print_msg("Failed to read /proc/meminfo: %s\n",
+			       strerror(errno));
+	else if (ret)
+		ksft_print_msg("Failed to parse /proc/meminfo\n");
 
-	return 0;
+	fclose(file);
+	return ret;
 }
 
 int prereq(void)
-- 
2.7.4

