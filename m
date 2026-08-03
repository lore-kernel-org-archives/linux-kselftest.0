Received: from galois.linutronix.de (Galois.linutronix.de [193.142.43.55])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8214B377EBF;
	Mon,  3 Aug 2026 10:04:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=193.142.43.55
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785751490; cv=none; b=NM4/ydqtNpUXQjN4az3008ILTfiv5zZY2smJ8SfzoatcjRUJORUJVPbZpNad8qwxnsArwUDEEcD0zz9NBnVuytTPJAzpKmgflm9XWR+YvelIMko5g6uJt43Yb7hylETmmXix9NNu+ZMQ5Xh8KSDW1JlOk+cpDardcxOIz8mKgpM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785751490; c=relaxed/simple;
	bh=JW7wm5Gnp8xFVFmYee+ahof9lgO/Vkd2KI6W/DXDmR4=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=hk7OnKdRJCOZkUYUdIWVVgJmMXwCCBFN0n5xRgx6TtSagquaszsvWBZl3F33Obj1Hc3bTnzfSqTkx08wn+iu3+r8EitURJkXHDP3Q16KQDMCUwn5hIBqSPtBFrwSa9Htv2MkZYbG+zCNZxd6T2956Og7vDpxkNSeML02VFS6wbU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linutronix.de; spf=pass smtp.mailfrom=linutronix.de; dkim=pass (2048-bit key) header.d=linutronix.de header.i=@linutronix.de header.b=XaU5g/kr; dkim=permerror (0-bit key) header.d=linutronix.de header.i=@linutronix.de header.b=RCRyTnKm; arc=none smtp.client-ip=193.142.43.55
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linutronix.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linutronix.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linutronix.de header.i=@linutronix.de header.b="XaU5g/kr";
	dkim=permerror (0-bit key) header.d=linutronix.de header.i=@linutronix.de header.b="RCRyTnKm"
From: =?utf-8?q?Thomas_Wei=C3=9Fschuh_=28Schneider_Electric=29?= <thomas.weissschuh@linutronix.de>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020; t=1785751487;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=EJXfOI9ACfmuS1BdwEmhxJUA4MF5NiefRYfYZpQNmVU=;
	b=XaU5g/kr8mc4FAqmMkJzrdyPO/WU6X/NBUyuixqlR/Q4YwhPDN1HBShTQQBYU4u6IWCraI
	NuQPd8ehT4Mo7NW6ZIxCsMbBYTUm7j3FG/8XvnuEVBQyBcQbLTOJSWPMWJcjO5Uycjtq6V
	DpgPlTV9OLqyz0aZouQB8KdX+CQ1MCQfvjkL9OL6G2wr+T4v36tegaRkB9ZKuT2yy4sw09
	Jkgzn82rf9HwXfgxSC+CB/2E+YCMZ4ej9WXO9QR4k77CDMbIM/WAC/GuKzUa8Jsb0ERJp5
	wMEUG2NUEZJnCVBM/P6d/Z2fuRIgYN4DwJuP/CX0vEDkfD3uDP4BwCy5dRJ0rA==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020e; t=1785751487;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=EJXfOI9ACfmuS1BdwEmhxJUA4MF5NiefRYfYZpQNmVU=;
	b=RCRyTnKmL5dq3dKIVhqfCPp8JWiN7Vr21/wc08A02mj30I8OyfOQKZV8whQ2xepQJglfH9
	lHBZOWap/3v2YUCA==
Date: Mon, 03 Aug 2026 12:04:39 +0200
Subject: [PATCH v2 08/17] selftests: timers: nanosleep: Drop output
 alignment
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20260803-auxclock-nanosleep-prep-v2-8-910cbd485390@linutronix.de>
References: <20260803-auxclock-nanosleep-prep-v2-0-910cbd485390@linutronix.de>
In-Reply-To: <20260803-auxclock-nanosleep-prep-v2-0-910cbd485390@linutronix.de>
To: John Stultz <jstultz@google.com>, Thomas Gleixner <tglx@kernel.org>, 
 Stephen Boyd <sboyd@kernel.org>, Miroslav Lichvar <mlichvar@redhat.com>, 
 Anna-Maria Behnsen <anna-maria@linutronix.de>, 
 Frederic Weisbecker <frederic@kernel.org>, Shuah Khan <shuah@kernel.org>
Cc: linux-kernel@vger.kernel.org, linux-kselftest@vger.kernel.org, 
 =?utf-8?q?Thomas_Wei=C3=9Fschuh_=28Schneider_Electric=29?= <thomas.weissschuh@linutronix.de>
X-Developer-Signature: v=1; a=ed25519-sha256; t=1785751481; l=1725;
 i=thomas.weissschuh@linutronix.de; s=20240209; h=from:subject:message-id;
 bh=JW7wm5Gnp8xFVFmYee+ahof9lgO/Vkd2KI6W/DXDmR4=;
 b=/FEgVTJmaaLh2mTMHM7W9oCqnbypDpZ0qHtQ7ZoL2a7yjIrVCx3Rj3Lynlzok8V1RRYIhlVka
 PIY/C2JwBSuAnrGLvy+UTqWB4Ldztj7DZCU3s7NkOYQWWzWqO6ZriGF
X-Developer-Key: i=thomas.weissschuh@linutronix.de; a=ed25519;
 pk=pfvxvpFUDJV2h2nY0FidLUml22uGLSjByFbM6aqQQws=

The padding of the clock name is pointless as nothing else is printed.

Signed-off-by: Thomas Weißschuh (Schneider Electric) <thomas.weissschuh@linutronix.de>
---
 tools/testing/selftests/timers/nanosleep.c | 10 +++++-----
 1 file changed, 5 insertions(+), 5 deletions(-)

diff --git a/tools/testing/selftests/timers/nanosleep.c b/tools/testing/selftests/timers/nanosleep.c
index 7df86dfc897f..629e800135ad 100644
--- a/tools/testing/selftests/timers/nanosleep.c
+++ b/tools/testing/selftests/timers/nanosleep.c
@@ -152,7 +152,7 @@ int main(int argc, char **argv)
 		if (clockid == CLOCK_PROCESS_CPUTIME_ID ||
 				clockid == CLOCK_THREAD_CPUTIME_ID ||
 				clockid == CLOCK_HWSPECIFIC) {
-			ksft_test_result_skip("%-31s\n", clock_name(clockid));
+			ksft_test_result_skip("%s\n", clock_name(clockid));
 			continue;
 		}
 
@@ -162,21 +162,21 @@ int main(int argc, char **argv)
 		while (length <= (NSEC_PER_SEC * 10)) {
 			ret = nanosleep_test(clockid, length);
 			if (ret == UNSUPPORTED) {
-				ksft_test_result_skip("%-31s\n", clock_name(clockid));
+				ksft_test_result_skip("%s\n", clock_name(clockid));
 				goto next;
 			}
 			if (ret < 0) {
-				ksft_test_result_fail("%-31s\n", clock_name(clockid));
+				ksft_test_result_fail("%s\n", clock_name(clockid));
 				ksft_exit_fail();
 			}
 			length *= 100;
 		}
 		ret = nanosleep_test_remaining(clockid);
 		if (ret < 0) {
-			ksft_test_result_fail("%-31s\n", clock_name(clockid));
+			ksft_test_result_fail("%s\n", clock_name(clockid));
 			ksft_exit_fail();
 		}
-		ksft_test_result_pass("%-31s\n", clock_name(clockid));
+		ksft_test_result_pass("%s\n", clock_name(clockid));
 next:
 		ret = 0;
 	}

-- 
2.55.0

