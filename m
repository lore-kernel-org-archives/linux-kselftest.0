Received: from galois.linutronix.de (Galois.linutronix.de [193.142.43.55])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 97ADC3B6341;
	Thu, 30 Jul 2026 06:47:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=193.142.43.55
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785394081; cv=none; b=mPre7sX/Xo7/tkQbPNJoObpkW1/2IUCRh2NOmEHevuxJxYEPQZReITXyeez9zSwwzN67WsABvtJeQbLznB21dZeH2qVA+mKhesjqj15viVSAwgjZw6gNBCUWW29wYEfN1F/tDS6dt2oeabJJvljhsZFiYLum6yO/okB/Xyh4U2k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785394081; c=relaxed/simple;
	bh=JW7wm5Gnp8xFVFmYee+ahof9lgO/Vkd2KI6W/DXDmR4=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=HIH3xMzC/Wcdh2ayslSFa81lPKfZDxMQzGGX99wr9/FGjM+TkzGd83KZVsGhbsQukjdy8j+WcRyioCwTX6cRor5nmYTHpqr5dMwg/raxwMx3psU/6IOEEg6hg6LpsKPthdZYa3XHCVdg/f+RWMKR19yQdHMBgsHXKoEyH/8QqlM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linutronix.de; spf=pass smtp.mailfrom=linutronix.de; dkim=pass (2048-bit key) header.d=linutronix.de header.i=@linutronix.de header.b=zf9CC7Ri; dkim=permerror (0-bit key) header.d=linutronix.de header.i=@linutronix.de header.b=E9UOFtDD; arc=none smtp.client-ip=193.142.43.55
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linutronix.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linutronix.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linutronix.de header.i=@linutronix.de header.b="zf9CC7Ri";
	dkim=permerror (0-bit key) header.d=linutronix.de header.i=@linutronix.de header.b="E9UOFtDD"
From: =?utf-8?q?Thomas_Wei=C3=9Fschuh_=28Schneider_Electric=29?= <thomas.weissschuh@linutronix.de>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020; t=1785394069;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=EJXfOI9ACfmuS1BdwEmhxJUA4MF5NiefRYfYZpQNmVU=;
	b=zf9CC7RiVxRYh+91VwhFYXGUwRsbx8HAPUkEXMI1W3VKf9vk0m+mMFV7eNbvGHd6bQqkHX
	t95899+pnkVJV3ZVglZg36HZyHGCk0iNhmYhI+dj/KMXv7M+n9KZxANX6xmiDkBsO97IzL
	UYsyv6L0ePJzU6yPvjbBPa4E6FvkXeKLAtXnIGKI8UxLJOv4H/aGsr7wO4jkJcffDCkkKq
	DCRSbGkPQUFQ9Xzl8t5XnJ1fZKhKHnDawNryoA+bTJULb679c8jCpps3vf89HcYsaCxD+4
	uIUWy12fMv4cW/8YBDTywhJZzF0739/YQpypmJVEIB2J4dcXZfrfBIN1ZO0TZw==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020e; t=1785394069;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=EJXfOI9ACfmuS1BdwEmhxJUA4MF5NiefRYfYZpQNmVU=;
	b=E9UOFtDDo9XNuNhDDWVzoa4F0PI5z9mBIvOXULi5sd0ZHh3Y4+9ITYpdmVVly8ATSr/Z0s
	07EvUvo+cGyBAbAQ==
Date: Thu, 30 Jul 2026 08:47:45 +0200
Subject: [PATCH 08/16] selftests: timers: nanosleep: Drop output alignment
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20260730-auxclock-nanosleep-prep-v1-8-cd8b61229a7c@linutronix.de>
References: <20260730-auxclock-nanosleep-prep-v1-0-cd8b61229a7c@linutronix.de>
In-Reply-To: <20260730-auxclock-nanosleep-prep-v1-0-cd8b61229a7c@linutronix.de>
To: John Stultz <jstultz@google.com>, Thomas Gleixner <tglx@kernel.org>, 
 Stephen Boyd <sboyd@kernel.org>, Miroslav Lichvar <mlichvar@redhat.com>, 
 Anna-Maria Behnsen <anna-maria@linutronix.de>, 
 Frederic Weisbecker <frederic@kernel.org>, Shuah Khan <shuah@kernel.org>
Cc: linux-kernel@vger.kernel.org, linux-kselftest@vger.kernel.org, 
 =?utf-8?q?Thomas_Wei=C3=9Fschuh_=28Schneider_Electric=29?= <thomas.weissschuh@linutronix.de>
X-Developer-Signature: v=1; a=ed25519-sha256; t=1785394062; l=1725;
 i=thomas.weissschuh@linutronix.de; s=20240209; h=from:subject:message-id;
 bh=JW7wm5Gnp8xFVFmYee+ahof9lgO/Vkd2KI6W/DXDmR4=;
 b=H5/m5oFKdnWoN7ve5Gd9c2mE0Pc1PABSlBZKS6+ajfunuMApBFQRw276KCHWcCtrWPomxf1mS
 pfoHb0WGQv7B74G7Ef9CsqKmfsWjcz1peo/FAdmK5NVlb2RFnBjC2+7
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

