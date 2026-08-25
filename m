Received: from m16.mail.163.com (m16.mail.163.com [117.135.210.4])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B48DE1A6815;
	Tue, 25 Aug 2026 06:47:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=117.135.210.4
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787640445; cv=none; b=tU48nXjvPHfcmK8Tow7OFCiz2LkO3XdnVI3oOEgfz/ZSZ6x8yz9WHQE+g/kAebMX8pY4SNY/nM70R6o1QDKAqDshN5w7UhS/5p0lgrqb0vW/lkhA+WwvbiqoUktZ4fcbK82d9pEJN28rP4/MlVQoem4Bwcl3Ns4xp9y3QyQLyAE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787640445; c=relaxed/simple;
	bh=IxWnrHSXomJfnanl8u82Sj8bdFPa1AjkVFJN0w4TYy0=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=aZt2esXKUMz85LMOncKt1UKWwPxQfErg7x5CQWMJsHANo6uXgCnA/At3wu/J+PiluuLHlzN3TW2NsaaRjcOH9Lu6N3LqcWN92TJS4rWLjbY9XBJqEmmWfjUpzL2Npg8y15qUKDtD0hIfEq1s2uaGR2XCSkIkzzVulrAX8w/kcCs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=163.com; spf=pass smtp.mailfrom=163.com; dkim=pass (1024-bit key) header.d=163.com header.i=@163.com header.b=lcuBobQi; arc=none smtp.client-ip=117.135.210.4
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=163.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=163.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=163.com header.i=@163.com header.b="lcuBobQi"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=163.com;
	s=s110527; h=From:To:Subject:Date:Message-Id:MIME-Version; bh=FD
	d5+K8ekfm6FYmynp77HRy2jmEGEtKm+E9AgCDfYl4=; b=lcuBobQibAYDUQo8W/
	XqaHSfpGTQUHC3RBukvvwmVyxBuQXSK9ptzDW4KfAHGWssvgMn6GyFkQSzUb2/98
	6j3Fts4oJRxBOp0MXD56sRAL3kVlu6ZTrxF/aH+2KuNN39mY8R8afDFKL9uXYjzn
	o1ChEse7MT5SkuR+eVqZ0eeac=
Received: from localhost.localdomain (unknown [])
	by gzga-smtp-mtada-g0-4 (Coremail) with SMTP id _____wB3s6EwOo1qKYSERw--.3416S2;
	Tue, 25 Aug 2026 14:46:09 +0800 (CST)
From: Qingshuang Fu <fffsqian@163.com>
To: Andy Whitcroft <apw@canonical.com>,
	Joe Perches <joe@perches.com>,
	Anna-Maria Behnsen <anna-maria@linutronix.de>,
	Frederic Weisbecker <frederic@kernel.org>,
	Thomas Gleixner <tglx@kernel.org>,
	John Stultz <jstultz@google.com>,
	Stephen Boyd <sboyd@kernel.org>,
	Miroslav Lichvar <mlichvar@redhat.com>,
	Shuah Khan <shuah@kernel.org>
Cc: linux-kselftest@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Qingshuang Fu <fuqingshuang@kylinos.cn>,
	Qingshuang Fu <fffsqian@163.com>
Subject: [PATCH selftests/timers] selftests/timers: clocksource-switch: fix unchecked open()/read()
Date: Tue, 25 Aug 2026 14:46:05 +0800
Message-Id: <20260825064605.472889-1-fffsqian@163.com>
X-Mailer: git-send-email 2.25.1
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CM-TRANSID:_____wB3s6EwOo1qKYSERw--.3416S2
X-Coremail-Antispam: 1Uf129KBjvJXoW7uw4xury8Cw4xtrWftr1DZFb_yoW8Kr45p3
	y0kw15tr15Xa42vrsakF1UJrn5uws29F15Gry5XFy2yrW5Arn5XF43KryjyFW3Ars3Z34a
	vF95Zr4rCFyDArJanT9S1TB71UUUUU7qnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
	9KBjDUYxBIdaVFxhVjvjDU0xZFpf9x0JUUEf5UUUUU=
X-CM-SenderInfo: 5iii21xldqqiywtou0bp/xtbCwhGYY2qNOjEZPAAA3h

From: Qingshuang Fu <fuqingshuang@kylinos.cn>

get_clocksources() and get_cur_clocksource() open and read the
clocksource sysfs files without checking the return values and without
NUL-terminating the buffer.

If open() fails, read() is called on fd -1 and returns -1, which is
stored in a size_t as SIZE_MAX.  The token-scanning loop in
get_clocksources() then walks past the uninitialized stack buffer,
reading and writing out of bounds.  Even on success the buffer is not
NUL-terminated, so a fully read buffer makes the inner scan run past the
data, and get_cur_clocksource() lets change_clocksource() call strlen()
on a non-terminated buffer.

Check the open()/read() results, use ssize_t for the read length,
NUL-terminate the buffer, and close the fd in get_cur_clocksource().

Fixes: 7290ce1423c3 ("selftests/timers: Add clocksource-switch test from timetest suite")
Signed-off-by: Qingshuang Fu <fuqingshuang@kylinos.cn>
---
 .../selftests/timers/clocksource-switch.c     | 23 ++++++++++++++++---
 1 file changed, 20 insertions(+), 3 deletions(-)

diff --git a/tools/testing/selftests/timers/clocksource-switch.c b/tools/testing/selftests/timers/clocksource-switch.c
index db62a764c29e..2e86f56d953e 100644
--- a/tools/testing/selftests/timers/clocksource-switch.c
+++ b/tools/testing/selftests/timers/clocksource-switch.c
@@ -40,16 +40,23 @@
 int get_clocksources(char list[][30])
 {
 	int fd, i;
-	size_t size;
+	ssize_t size;
 	char buf[512];
 	char *head, *tmp;
 
 	fd = open("/sys/devices/system/clocksource/clocksource0/available_clocksource", O_RDONLY);
+	if (fd < 0)
+		return 0;
 
-	size = read(fd, buf, 512);
+	size = read(fd, buf, sizeof(buf) - 1);
 
 	close(fd);
 
+	if (size <= 0)
+		return 0;
+
+	buf[size] = '\0';
+
 	for (i = 0; i < 10; i++)
 		list[i][0] = '\0';
 
@@ -74,11 +81,21 @@ int get_clocksources(char list[][30])
 
 int get_cur_clocksource(char *buf, size_t size)
 {
+	ssize_t len;
 	int fd;
 
 	fd = open("/sys/devices/system/clocksource/clocksource0/current_clocksource", O_RDONLY);
+	if (fd < 0)
+		return -1;
+
+	len = read(fd, buf, size - 1);
+
+	close(fd);
+
+	if (len <= 0)
+		return -1;
 
-	size = read(fd, buf, size);
+	buf[len] = '\0';
 
 	return 0;
 }

base-commit: 66498c75b4f8017f62d720d9b59675bdf3abce91
-- 
2.25.1

