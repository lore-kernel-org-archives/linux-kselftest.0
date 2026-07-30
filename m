Received: from galois.linutronix.de (Galois.linutronix.de [193.142.43.55])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B66F43AFD04;
	Thu, 30 Jul 2026 06:47:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=193.142.43.55
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785394072; cv=none; b=N0kda9XmzXdZwBRY0jYPczYdwIgAC4QObAPHEI8fqgdwafxoBwq95vOCYYtdnsuH5lGdqwQBhJdxjHDhn1YGO2UB0yojbrXHtys+FQj+z/6bmDGIJXSSXl/CCrKAlfQ+2Mws1aOwop1Zv4/endpY9H5ri0nwWJCk8blQpxVNQoc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785394072; c=relaxed/simple;
	bh=Hp5rv1CpHg29jiqVQ1/IZMfw96P0gMLxQ5ldJpY6ZCo=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=ZRWdI58EUprZLnDAEIyd1Z815G+eA7rX4DrsZLdXlEDycKBH02Z6amGqoGbvD3k4RvaO+7PgAow8W4XGeyoYYJHctrmq3T/tatX+x+qD7yfTTd8EWmhYRUbeUabAGOPQyLlE62rYEHnexYlfFqEJHyvvGXro4Q1Aa0547eLM/dc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linutronix.de; spf=pass smtp.mailfrom=linutronix.de; dkim=pass (2048-bit key) header.d=linutronix.de header.i=@linutronix.de header.b=ef0mpUd4; dkim=permerror (0-bit key) header.d=linutronix.de header.i=@linutronix.de header.b=Uh04fPQS; arc=none smtp.client-ip=193.142.43.55
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linutronix.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linutronix.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linutronix.de header.i=@linutronix.de header.b="ef0mpUd4";
	dkim=permerror (0-bit key) header.d=linutronix.de header.i=@linutronix.de header.b="Uh04fPQS"
From: =?utf-8?q?Thomas_Wei=C3=9Fschuh_=28Schneider_Electric=29?= <thomas.weissschuh@linutronix.de>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020; t=1785394066;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=M9GQzDYdvfBW+ZHNqLs5VdShZheTS1/89sMW/FHVCWk=;
	b=ef0mpUd4a3tRU9SXnRjztlN6hWZy4MC7NB6bXLH2VmsocbNnlA/BYZFsyifzXnkqW/4VQY
	V8PdVUieG8qtZxufUmd0GvH6matPL4DSo2rUkRK3SiXF4Up0o+LIw7wj+HIQehz0D4VyXv
	rRQcYHoH1t0kfkFmoHtuNhj6p4LRri0+m6OHh84UfftrODvOl9tgzBCNxXB//1qgrwE7Qz
	21ddSzlPam4ZgbwdnM8pWpkgrQqk7k1DlFl1dXDOc+5sdibrVAhQTpJF0oTrYFmTYoDxDT
	9M06kawoyD0BxVEgmLz3oFEmKppt5zI+ZFmVPwMrx3kArKnTmN2P+rqptmeP3g==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020e; t=1785394066;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=M9GQzDYdvfBW+ZHNqLs5VdShZheTS1/89sMW/FHVCWk=;
	b=Uh04fPQSnlZyN+N+/Ub05I8x3SYaw5IdhO2la3SjoUB06Q551QJaHGwU05Dzhx4yneqoSf
	Dm8BwMglY7D4v0AQ==
Date: Thu, 30 Jul 2026 08:47:40 +0200
Subject: [PATCH 03/16] hrtimer: Add a lockdep assertion to
 hrtimer_update_base()
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20260730-auxclock-nanosleep-prep-v1-3-cd8b61229a7c@linutronix.de>
References: <20260730-auxclock-nanosleep-prep-v1-0-cd8b61229a7c@linutronix.de>
In-Reply-To: <20260730-auxclock-nanosleep-prep-v1-0-cd8b61229a7c@linutronix.de>
To: John Stultz <jstultz@google.com>, Thomas Gleixner <tglx@kernel.org>, 
 Stephen Boyd <sboyd@kernel.org>, Miroslav Lichvar <mlichvar@redhat.com>, 
 Anna-Maria Behnsen <anna-maria@linutronix.de>, 
 Frederic Weisbecker <frederic@kernel.org>, Shuah Khan <shuah@kernel.org>
Cc: linux-kernel@vger.kernel.org, linux-kselftest@vger.kernel.org, 
 =?utf-8?q?Thomas_Wei=C3=9Fschuh_=28Schneider_Electric=29?= <thomas.weissschuh@linutronix.de>
X-Developer-Signature: v=1; a=ed25519-sha256; t=1785394062; l=834;
 i=thomas.weissschuh@linutronix.de; s=20240209; h=from:subject:message-id;
 bh=Hp5rv1CpHg29jiqVQ1/IZMfw96P0gMLxQ5ldJpY6ZCo=;
 b=3YizdLPLkmr+82fULxZM3F6hPblsrSKzvuuRarwLSJavF30CR9PNoDVWd80TELOQoLS9Z845g
 l3RbBkqvpG2BR8W4wTiVWi3A39IVsQIMi2VXIlY+r33VaKIRQ7sYT4w
X-Developer-Key: i=thomas.weissschuh@linutronix.de; a=ed25519;
 pk=pfvxvpFUDJV2h2nY0FidLUml22uGLSjByFbM6aqQQws=

Document and verify that the base's lock is held at this point.

Signed-off-by: Thomas Weißschuh (Schneider Electric) <thomas.weissschuh@linutronix.de>
---
 kernel/time/hrtimer.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/kernel/time/hrtimer.c b/kernel/time/hrtimer.c
index 01890b7a5f98..1dcd084d88f7 100644
--- a/kernel/time/hrtimer.c
+++ b/kernel/time/hrtimer.c
@@ -677,6 +677,8 @@ static ktime_t hrtimer_update_next_event(struct hrtimer_cpu_base *cpu_base)
 
 static inline ktime_t hrtimer_update_base(struct hrtimer_cpu_base *base)
 {
+	lockdep_assert_held(&base->lock);
+
 	ktime_t *offs_real = &base->clock_base[HRTIMER_BASE_REALTIME].offset;
 	ktime_t *offs_boot = &base->clock_base[HRTIMER_BASE_BOOTTIME].offset;
 	ktime_t *offs_tai = &base->clock_base[HRTIMER_BASE_TAI].offset;

-- 
2.55.0

