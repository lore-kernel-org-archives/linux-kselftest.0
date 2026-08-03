Received: from galois.linutronix.de (Galois.linutronix.de [193.142.43.55])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4942935C193;
	Mon,  3 Aug 2026 10:04:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=193.142.43.55
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785751486; cv=none; b=S1+m+PrRJk7uIIhjz10ZiBQ8NbaVEhyWJh3nlNvMPG7AVSudlSGruNM180ugJMXGGr1UvIHdCVOIN+tBDR+9nAFmv0pb31Fff238mWj6skhVf9nS32r7QfanxMPfMudP8VOvuZ6zwZrrGX6PNzutqcUxinaT6ButH0g+ZmZmO34=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785751486; c=relaxed/simple;
	bh=DALe5O/eshy9jMm/CQK7Kl8g0BzKVn3HeUUbe0nrhLQ=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=mCBfmbHua2O7I16gN5b5wl7UDmMPfPT0Ir9y+gw/j7l/6YVHaGcMrV9tkVqILcz1n1jKkQcziWCsYrUyr9rt6R2N+n7JLLexU2Is1Y12EEM7aNDbhHhtZ0++SE37j3Rkc/dN4d8a8gc2lKnnRmDVvoApF5A+b0bmIAFsAdlbwh4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linutronix.de; spf=pass smtp.mailfrom=linutronix.de; dkim=pass (2048-bit key) header.d=linutronix.de header.i=@linutronix.de header.b=uCOaWPuY; dkim=permerror (0-bit key) header.d=linutronix.de header.i=@linutronix.de header.b=nS9egBUS; arc=none smtp.client-ip=193.142.43.55
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linutronix.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linutronix.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linutronix.de header.i=@linutronix.de header.b="uCOaWPuY";
	dkim=permerror (0-bit key) header.d=linutronix.de header.i=@linutronix.de header.b="nS9egBUS"
From: =?utf-8?q?Thomas_Wei=C3=9Fschuh_=28Schneider_Electric=29?= <thomas.weissschuh@linutronix.de>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020; t=1785751483;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=ZOgQf08Qajk4uNYNxNWJ7kvwTeDXyg7JpRXotsfCxmk=;
	b=uCOaWPuYnWDV0iELf3+4CwecDr33Ry3g49rHNsz0Tn623UrVPq0BjbYP2zSmXCcrctxTV2
	GFIWVQ+LlZuCjN9H7sMeLJgmdNWl8oLmSH5LZnyHmi4BYsoxRJPsGTlM3BMMODKrU/sjCW
	MhhTJ48fiyNlb+MDeur0VxEUnZFutOunYyQlacZ+TNc8+ejzGmnUUA7Gp1lF0qERM14TV4
	b1UrpQYUsoiRdrI1UDObSOrc9PrWSPEPa4t7dsl45l7tXibnW7P5SyqJlBn5625FJAADuK
	GlZVLa5iw/kpmX3xwOtqH/4SH32xkqXLjJdNeNDtcHx453SkmmvOheEorEDjkQ==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020e; t=1785751483;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=ZOgQf08Qajk4uNYNxNWJ7kvwTeDXyg7JpRXotsfCxmk=;
	b=nS9egBUSe6VPeRSWyF7Pq9Y6m/biWVw/pJQ86e4uZUPd/EpWNwiQVpe1bkDohJt+Zj7d/e
	GOISJ7UsZWiX0AAw==
Date: Mon, 03 Aug 2026 12:04:32 +0200
Subject: [PATCH v2 01/17] timekeeping: Rename clockid_aux_valid() to
 clockid_is_aux_clock()
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20260803-auxclock-nanosleep-prep-v2-1-910cbd485390@linutronix.de>
References: <20260803-auxclock-nanosleep-prep-v2-0-910cbd485390@linutronix.de>
In-Reply-To: <20260803-auxclock-nanosleep-prep-v2-0-910cbd485390@linutronix.de>
To: John Stultz <jstultz@google.com>, Thomas Gleixner <tglx@kernel.org>, 
 Stephen Boyd <sboyd@kernel.org>, Miroslav Lichvar <mlichvar@redhat.com>, 
 Anna-Maria Behnsen <anna-maria@linutronix.de>, 
 Frederic Weisbecker <frederic@kernel.org>, Shuah Khan <shuah@kernel.org>
Cc: linux-kernel@vger.kernel.org, linux-kselftest@vger.kernel.org, 
 =?utf-8?q?Thomas_Wei=C3=9Fschuh_=28Schneider_Electric=29?= <thomas.weissschuh@linutronix.de>
X-Developer-Signature: v=1; a=ed25519-sha256; t=1785751481; l=1542;
 i=thomas.weissschuh@linutronix.de; s=20240209; h=from:subject:message-id;
 bh=DALe5O/eshy9jMm/CQK7Kl8g0BzKVn3HeUUbe0nrhLQ=;
 b=b11PWU1E2eAZaVHeTXVxChEB9dAoV6Tg+cWBjz1R2EhMP6RPTRYDxBztMsIxl4IyxL6QyWJWy
 fyOnmW0gz4tDzWj38QBX7gIH8U8EdUfNmn6eeD2enwJNzkik0s1HUge
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

