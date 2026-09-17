Received: from relay.virtuozzo.com (relay.virtuozzo.com [130.117.225.111])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 58FA5371071;
	Thu, 17 Sep 2026 01:35:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=130.117.225.111
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789608936; cv=none; b=Yr2D7/w449lf6MsckOBrIuDaeYqc+Dt0Q4710xs+nhiamtdsPvVkMRhNXnJbhm57KYEhihnTMmH74umcyQyJtw6qeWY3aB+Bfm5DgFGd+8EtLG4Fmh0w7mf1vs2yNkdLBq1kKqh7cKkkgekRE6Vh1QK0LAnaDprukTyD7FX2qGw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789608936; c=relaxed/simple;
	bh=3N3Hat+v9UHNP4OGJp+BhW/i0evDbPsjd1o698rIjHk=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=OUnCP04OLHzUMZo9Cgw2Wa1TyEypfZvK9xQcvYwpy/6gyBdZCYPsVq2wAyWEzh/KZJnmwyK6/EbpytZGe71pINgPoL5bHM0+W8WDMECtWgs6+2aLSDiqzpGg0IxzObYdusMVm1i4nUy+IohuiRYEq8Uglni3JrT7A8RHXlvwYGA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=virtuozzo.com; spf=pass smtp.mailfrom=virtuozzo.com; dkim=pass (2048-bit key) header.d=virtuozzo.com header.i=@virtuozzo.com header.b=Xr6VoUA7; arc=none smtp.client-ip=130.117.225.111
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=virtuozzo.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=virtuozzo.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=virtuozzo.com header.i=@virtuozzo.com header.b="Xr6VoUA7"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=virtuozzo.com; s=relay; h=MIME-Version:Message-ID:Date:Subject:From:
	Content-Type; bh=4qh8y2osuX90i0OErwuJxaVfLUCHaxWehvQOBueszF4=; b=Xr6VoUA76PAW
	ObUo22gLzgNmGa4M4xThjTB9QZCPLkTZuKnbKkg4BInGtksOjgAXBPazJWDQF5fsq4LVvmHSeFbf3
	eAG5v6S3taeJfJLLHLEUzRRyVqGxeXxff3V1+vOa+F8ec6P3g4x/FjrE0bzutOyVgvvA6a/3tTMC/
	M0f6aoNgsqyxUR7lpI3ZH2Z+USyW2TbgXp5hqcq0Jm3dlxqGroNbeIAVrCD62+lrOTQofCh+iQ0m7
	inMDayhPcufzzBLdUOF49yROah9uayHuiSlh5hkaEPtaeVxakXW8/56jYRFLbQDtd+CDCKz8hKPxa
	X8vyit0XAbMVlkrVSrHybw==;
Received: from ch-vpn.virtuozzo.com ([130.117.225.6] helo=LekKit-T14)
	by relay.virtuozzo.com with esmtp (Exim 4.96)
	(envelope-from <eva.kurchatova@virtuozzo.com>)
	id 1x70zQ-000e6W-25;
	Thu, 17 Sep 2026 03:35:30 +0200
From: Eva Kurchatova <eva.kurchatova@virtuozzo.com>
To: Shuah Khan <shuah@kernel.org>
Cc: linux-kernel@vger.kernel.org,
	Eva Kurchatova <eva.kurchatova@virtuozzo.com>,
	linux-kselftest@vger.kernel.org
Subject: [PATCH] selftests: connector: make proc_filter terminate on its own
Date: Thu, 17 Sep 2026 04:35:21 +0300
Message-ID: <20260917013524.2460121-1-eva.kurchatova@virtuozzo.com>
X-Mailer: git-send-email 2.55.0
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

proc_filter listens for process events until a signal interrupts it, so
a caller that waits for it to finish waits forever. Generate one event,
stop after five seconds, and fail if nothing was received.

Signed-off-by: Eva Kurchatova <eva.kurchatova@virtuozzo.com>
---
 tools/testing/selftests/connector/proc_filter.c | 13 ++++++++++++-
 1 file changed, 12 insertions(+), 1 deletion(-)

diff --git a/tools/testing/selftests/connector/proc_filter.c b/tools/testing/selftests/connector/proc_filter.c
index 36c11467a8f1..2412f66c38e1 100644
--- a/tools/testing/selftests/connector/proc_filter.c
+++ b/tools/testing/selftests/connector/proc_filter.c
@@ -14,6 +14,7 @@
 #include <strings.h>
 #include <errno.h>
 #include <signal.h>
+#include <sys/wait.h>
 #include <string.h>
 
 #include "kselftest.h"
@@ -279,6 +280,16 @@ int main(int argc, char *argv[])
 		exit(1);
 	}
 
+	/*
+	 * Generate one event to observe and stop listening shortly after,
+	 * so that the test terminates on its own.
+	 */
+	signal(SIGALRM, sigint);
+	alarm(5);
+	if (fork() == 0)
+		_exit(0);
+	wait(NULL);
+
 	while (!interrupted) {
 		err = handle_events(epoll_fd, &proc_ev);
 		if (err < 0) {
@@ -306,5 +317,5 @@ int main(int argc, char *argv[])
 	close(nl_sock);
 
 	printf("Done total count: %d\n", tcount);
-	exit(0);
+	exit(tcount > 0 ? KSFT_PASS : KSFT_FAIL);
 }
-- 
2.55.0

