Received: from galois.linutronix.de (Galois.linutronix.de [193.142.43.55])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1ED433ADB99;
	Thu, 30 Jul 2026 06:47:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=193.142.43.55
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785394070; cv=none; b=BXbYiUBC1mH8hk4/XUltsvFY4q4jLioqQkPhUORGH1EXy47vNY3MPdv6p17lYYJ9mrFhfIkERZuBFB1Nq1ZTjU/n5DCDQUSsqeGY2C6Cjfg+iH7CbBGxOqE+pJShafyErLav+K+4BqHF8NsBcgF7WMqU5gzj9O7KOxfUwD99ehM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785394070; c=relaxed/simple;
	bh=DALe5O/eshy9jMm/CQK7Kl8g0BzKVn3HeUUbe0nrhLQ=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=AlQTSqXJgCiYapgGDq4ARac0bBy++3INE/EuliDQ08Nh3op3qi4kOylA294oBkGzgXh+ERaeZHS+7InNxmLvwwwznVYZ63bcmAmx4xuiGCl5IRG57MWLQcoeTPnBbRYa6TDTsuIiw9bSUeZ4KNqYZ9CTxT2H2hCFmdlS55cf4LM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linutronix.de; spf=pass smtp.mailfrom=linutronix.de; dkim=pass (2048-bit key) header.d=linutronix.de header.i=@linutronix.de header.b=Ya9/FyBP; dkim=permerror (0-bit key) header.d=linutronix.de header.i=@linutronix.de header.b=eyN2K/NK; arc=none smtp.client-ip=193.142.43.55
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linutronix.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linutronix.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linutronix.de header.i=@linutronix.de header.b="Ya9/FyBP";
	dkim=permerror (0-bit key) header.d=linutronix.de header.i=@linutronix.de header.b="eyN2K/NK"
From: =?utf-8?q?Thomas_Wei=C3=9Fschuh_=28Schneider_Electric=29?= <thomas.weissschuh@linutronix.de>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020; t=1785394065;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=ZOgQf08Qajk4uNYNxNWJ7kvwTeDXyg7JpRXotsfCxmk=;
	b=Ya9/FyBP29b5b4kSuCBkih3j3j75omzKKq87AICl+aJPTBrq3DlNw++ruZBMfWb6R+V9md
	6wnXfnEKRzm/Ff0wG4ESWvHDIsTf1kBQKFosk9zTKE17gjyW7pqlDhxNkl343dFIZHt9/s
	OhMsah8jGYq4ZAg0CZi2Oql+PYYSWzOGRkVGeemcGY92p5zHyp7qINdwTNm3Yt2cqF+gci
	NHEmuzj9NnPsPPyikXdOozNEkUMEMsa/BbSNFBAEpkTTMuk4Y0Akf+ZjkwqG6Y+HAmFg6R
	f+chUeieAhI14bmPLWxaGUUbnIq7hVa5rN7aT7qdC4OBwir2rjumoXI2+rdOVA==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020e; t=1785394065;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=ZOgQf08Qajk4uNYNxNWJ7kvwTeDXyg7JpRXotsfCxmk=;
	b=eyN2K/NKY8M8eTBxz+yOXH2KKF1r0+h+djSyfJz5ERR1yHezYw0rD15HbXz3WOSfW6GFzC
	A6sAI2SuosCluhAw==
Date: Thu, 30 Jul 2026 08:47:38 +0200
Subject: [PATCH 01/16] timekeeping: Rename clockid_aux_valid() to
 clockid_is_aux_clock()
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20260730-auxclock-nanosleep-prep-v1-1-cd8b61229a7c@linutronix.de>
References: <20260730-auxclock-nanosleep-prep-v1-0-cd8b61229a7c@linutronix.de>
In-Reply-To: <20260730-auxclock-nanosleep-prep-v1-0-cd8b61229a7c@linutronix.de>
To: John Stultz <jstultz@google.com>, Thomas Gleixner <tglx@kernel.org>, 
 Stephen Boyd <sboyd@kernel.org>, Miroslav Lichvar <mlichvar@redhat.com>, 
 Anna-Maria Behnsen <anna-maria@linutronix.de>, 
 Frederic Weisbecker <frederic@kernel.org>, Shuah Khan <shuah@kernel.org>
Cc: linux-kernel@vger.kernel.org, linux-kselftest@vger.kernel.org, 
 =?utf-8?q?Thomas_Wei=C3=9Fschuh_=28Schneider_Electric=29?= <thomas.weissschuh@linutronix.de>
X-Developer-Signature: v=1; a=ed25519-sha256; t=1785394062; l=1542;
 i=thomas.weissschuh@linutronix.de; s=20240209; h=from:subject:message-id;
 bh=DALe5O/eshy9jMm/CQK7Kl8g0BzKVn3HeUUbe0nrhLQ=;
 b=hsczb9RMqLhb2SZ+GhCzRwlqvy//V086rplvXCXE8HLSuDkTA6vPVEkhM/drbHaSccBmmjY5U
 BhuO6B4dRYQC1/MUIz9RvztcIbQWqMWg/ZiFAmRO7KEPILp3GdCefGH
X-Developer-Key: i=thomas.weissschuh@linutronix.de; a=ed25519;
 pk=pfvxvpFUDJV2h2nY0FidLUml22uGLSjByFbM6aqQQws=

The current name is not clear about its behavior.

Rename it.

Signed-off-by: Thomas Weißschuh (Schneider Electric) <thomas.weissschuh@linutronix.de>
---
 include/linux/posix-timers.h | 2 +-
 kernel/time/timekeeping.c    | 4 ++--
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/include/linux/posix-timers.h b/include/linux/posix-timers.h
index 4117827efdb8..9a1a0c61361c 100644
--- a/include/linux/posix-timers.h
+++ b/include/linux/posix-timers.h
@@ -37,7 +37,7 @@ static inline int clockid_to_fd(const clockid_t clk)
 	return ~(clk >> 3);
 }
 
-static inline bool clockid_aux_valid(clockid_t id)
+static inline bool clockid_is_aux_clock(clockid_t id)
 {
 	return IS_ENABLED(CONFIG_POSIX_AUX_CLOCKS) && id >= CLOCK_AUX && id <= CLOCK_AUX_LAST;
 }
diff --git a/kernel/time/timekeeping.c b/kernel/time/timekeeping.c
index 97db2e9393f9..d4cdbcdcb9df 100644
--- a/kernel/time/timekeeping.c
+++ b/kernel/time/timekeeping.c
@@ -3129,7 +3129,7 @@ static inline unsigned int clockid_to_tkid(unsigned int id)
 
 static inline struct tk_data *aux_get_tk_data(clockid_t id)
 {
-	if (!clockid_aux_valid(id))
+	if (!clockid_is_aux_clock(id))
 		return NULL;
 	return &timekeeper_data[clockid_to_tkid(id)];
 }
@@ -3224,7 +3224,7 @@ EXPORT_SYMBOL_GPL(ktime_get_aux_ts64);
 
 static int aux_get_res(clockid_t id, struct timespec64 *tp)
 {
-	if (!clockid_aux_valid(id))
+	if (!clockid_is_aux_clock(id))
 		return -ENODEV;
 
 	tp->tv_sec = aux_clock_resolution_ns() / NSEC_PER_SEC;

-- 
2.55.0

