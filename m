Received: from galois.linutronix.de (Galois.linutronix.de [193.142.43.55])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E6C8E372B2F;
	Mon,  3 Aug 2026 10:04:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=193.142.43.55
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785751487; cv=none; b=Z6SqowXALVenJbi3n0ByFMySls2VHwR5g8DqnhcRgERCCt1gmDVYPPHr98aUdjUnOAM04to9DjJFV3Re+IpmfeFvIZaMD1TLJDPuA2dgggzzJnJCO+f+EN7yHpGi2KWJ5yaUx3VDRPEwMElJ1QatrC5VfGzzHq1xM3bgErxEwfE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785751487; c=relaxed/simple;
	bh=LlazCrVCSAoA7nQhANTzDxedg6EqyDm4a1QtRJTqUAg=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=ZQOpokEU4Viy4ZgM/HLW2594qCtSON95QjgDPDGtCFIKyeVd7r2Ebn936IHMeIR72YqGyeyoi3Qf0jG+Iag9rAxtFZc9a+RUCJ53FHZKfpiOIgAE433zB1keXbpFispuioktE42/crn/6fqdwmLENPHtMnsO3W25mbXEzmqH/2I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linutronix.de; spf=pass smtp.mailfrom=linutronix.de; dkim=pass (2048-bit key) header.d=linutronix.de header.i=@linutronix.de header.b=FyN3q/YX; dkim=permerror (0-bit key) header.d=linutronix.de header.i=@linutronix.de header.b=utFAfzom; arc=none smtp.client-ip=193.142.43.55
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linutronix.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linutronix.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linutronix.de header.i=@linutronix.de header.b="FyN3q/YX";
	dkim=permerror (0-bit key) header.d=linutronix.de header.i=@linutronix.de header.b="utFAfzom"
From: =?utf-8?q?Thomas_Wei=C3=9Fschuh_=28Schneider_Electric=29?= <thomas.weissschuh@linutronix.de>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020; t=1785751484;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=Pw57SHParWAVAZJM5LNMTJHk4umVymwCjycA9VHiXio=;
	b=FyN3q/YXfgc4nBICaN0WJsf0D2I5SkwqUYwE6TJvtLhP5KYBTTIClTDcpopYbhpClA+esN
	POQVjr7KCRHLMWB+KT4SSAF688u/ehN8xA6pDhMvr/o25NlEIn6upei6UlTZHkeFIfzJAz
	2Yye7eFTQ8qf6EyoAF8D2Io+8bZQQ5URsT8lZZddnFsbE0PPU9yurpY2gzbh+9K/YWLyQA
	TV88KUgQenBvW+z/fTUxqy67trHAR7FFl95Iz3rITnxXCfPRWTCevJynBHzszVH5ko1yrV
	lsqWqiFeksyaU8rrTqQ1A+u7rgKtdn9GRANwOJs+BulOG85fS0v+Vdh8af5XAg==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020e; t=1785751484;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=Pw57SHParWAVAZJM5LNMTJHk4umVymwCjycA9VHiXio=;
	b=utFAfzomFZfaNw1QK8Ln+PT+dGZCVhqjJql8FLpUB5DG0Y/5kxjf3KVuMn1HpQ153eqduv
	pKRes7d1ugIXn7AQ==
Date: Mon, 03 Aug 2026 12:04:34 +0200
Subject: [PATCH v2 03/17] hrtimer: Add a lockdep assertion to
 hrtimer_update_base()
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20260803-auxclock-nanosleep-prep-v2-3-910cbd485390@linutronix.de>
References: <20260803-auxclock-nanosleep-prep-v2-0-910cbd485390@linutronix.de>
In-Reply-To: <20260803-auxclock-nanosleep-prep-v2-0-910cbd485390@linutronix.de>
To: John Stultz <jstultz@google.com>, Thomas Gleixner <tglx@kernel.org>, 
 Stephen Boyd <sboyd@kernel.org>, Miroslav Lichvar <mlichvar@redhat.com>, 
 Anna-Maria Behnsen <anna-maria@linutronix.de>, 
 Frederic Weisbecker <frederic@kernel.org>, Shuah Khan <shuah@kernel.org>
Cc: linux-kernel@vger.kernel.org, linux-kselftest@vger.kernel.org, 
 =?utf-8?q?Thomas_Wei=C3=9Fschuh_=28Schneider_Electric=29?= <thomas.weissschuh@linutronix.de>
X-Developer-Signature: v=1; a=ed25519-sha256; t=1785751481; l=834;
 i=thomas.weissschuh@linutronix.de; s=20240209; h=from:subject:message-id;
 bh=LlazCrVCSAoA7nQhANTzDxedg6EqyDm4a1QtRJTqUAg=;
 b=Io7tRhjDxYl7oxPEVwa1Ikg2H+6N95NxVBYTFLy1edlgCoVjimP1CEx70Eyv9Z7QbpMqAssF3
 /69sm9/g9yaC2fYre+fwoC/aaqu3Qo3ZPWAzNDtYbFvNVzYLUo4hbBP
X-Developer-Key: i=thomas.weissschuh@linutronix.de; a=ed25519;
 pk=pfvxvpFUDJV2h2nY0FidLUml22uGLSjByFbM6aqQQws=

Document and verify that the base's lock is held at this point.

Signed-off-by: Thomas Weißschuh (Schneider Electric) <thomas.weissschuh@linutronix.de>
---
 kernel/time/hrtimer.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/kernel/time/hrtimer.c b/kernel/time/hrtimer.c
index 957c619e4271..91b2ea890730 100644
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

