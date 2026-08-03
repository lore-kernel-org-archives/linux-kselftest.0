Received: from galois.linutronix.de (Galois.linutronix.de [193.142.43.55])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DA65537D135;
	Mon,  3 Aug 2026 10:04:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=193.142.43.55
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785751493; cv=none; b=aW7gIPDFbb3xENDfHpmRhnk86emE/lPdV6a48XplHKpYP/X0wboahSphySWIY7FS/p6sgI8jQeDCI7a0PMoUnrRAOPy8RtAA5vwiZyFOx7ciPaFbGQHMdXCpgHRdxhyFPl+OfU06gdsHgZJX8aPpI0uIg+jjfzQ4fpieqqi0YSY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785751493; c=relaxed/simple;
	bh=cSPG97HHdQvSt5MuP1g2wCe3dTsy8tM+XrKyRFvfFJ4=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=hwZhsBY6yLjQgXoGd+oBwpCh+j4xM47wpn2zhO17qgDUhgxMb1KY8UGQnvCMqy/KTdWkApupkIP1Gxse4tyQsSvwXnAYH1qZbXL+2GqKeDjmlFeWO/tGc8wat5iZMcvGpLq1L855L2uxGgmNVommRPGVMw00JQDwJFT50AZCcsQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linutronix.de; spf=pass smtp.mailfrom=linutronix.de; dkim=pass (2048-bit key) header.d=linutronix.de header.i=@linutronix.de header.b=B+lLkNbM; dkim=permerror (0-bit key) header.d=linutronix.de header.i=@linutronix.de header.b=Y62eUp29; arc=none smtp.client-ip=193.142.43.55
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linutronix.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linutronix.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linutronix.de header.i=@linutronix.de header.b="B+lLkNbM";
	dkim=permerror (0-bit key) header.d=linutronix.de header.i=@linutronix.de header.b="Y62eUp29"
From: =?utf-8?q?Thomas_Wei=C3=9Fschuh_=28Schneider_Electric=29?= <thomas.weissschuh@linutronix.de>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020; t=1785751490;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=7cOgkEiUY5Nek/Yxobxpk/lyOOSwHnWvKhtxAwfhtdk=;
	b=B+lLkNbMFh8RHWFD5HbPWFMG2dWRHA2kaYcEEgPj+bkbCPvofL2XHi6lkOh4aBZfZEk1j8
	8nTTSjDlu0K91ryDjYUWh7iO+Mco5/9d8KrEMdAxhErwFAS4Q+Gc3J9DLWTI9sY1CwdOkO
	8eIkiSaY/hOJwXrHzb/EwMzC81PbbtjDmw7+D/FFkDyCrfK49zeKNH/r2Cw33llE/PwlOh
	ys1MDw6LKTwczuwm8jYqFHTk8pDV5Qomi4HdaHjVNh9lw3eNE9RzJtKIVyAOYG5nY7YubL
	N6HuItQNklGjsgthykf/D25FGty45d/95hdEeXeNH92muwgvdj0sBim0fWhqfg==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020e; t=1785751490;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=7cOgkEiUY5Nek/Yxobxpk/lyOOSwHnWvKhtxAwfhtdk=;
	b=Y62eUp29V6Su1cepUMDV0FvKsVUfBMZAdBNg4PkgeSt3PJCssOEwp178gVZbVbubjw+NXJ
	/ZyZXctJzsQfO/Cw==
Date: Mon, 03 Aug 2026 12:04:45 +0200
Subject: [PATCH v2 14/17] selftests: timers: nsleep-lat: Use NSEC_PER_MSEC
 define for unreasonable latency
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20260803-auxclock-nanosleep-prep-v2-14-910cbd485390@linutronix.de>
References: <20260803-auxclock-nanosleep-prep-v2-0-910cbd485390@linutronix.de>
In-Reply-To: <20260803-auxclock-nanosleep-prep-v2-0-910cbd485390@linutronix.de>
To: John Stultz <jstultz@google.com>, Thomas Gleixner <tglx@kernel.org>, 
 Stephen Boyd <sboyd@kernel.org>, Miroslav Lichvar <mlichvar@redhat.com>, 
 Anna-Maria Behnsen <anna-maria@linutronix.de>, 
 Frederic Weisbecker <frederic@kernel.org>, Shuah Khan <shuah@kernel.org>
Cc: linux-kernel@vger.kernel.org, linux-kselftest@vger.kernel.org, 
 =?utf-8?q?Thomas_Wei=C3=9Fschuh_=28Schneider_Electric=29?= <thomas.weissschuh@linutronix.de>
X-Developer-Signature: v=1; a=ed25519-sha256; t=1785751481; l=851;
 i=thomas.weissschuh@linutronix.de; s=20240209; h=from:subject:message-id;
 bh=cSPG97HHdQvSt5MuP1g2wCe3dTsy8tM+XrKyRFvfFJ4=;
 b=AlwzdgDYDoNJQfS/dUkhOW+SUhP8181xbLwcfkasVqyUuxQUFKeD/7/jPgh5nxZEuc93JnLM0
 AWKMRNKkjbuBvA9XBUHz5tChSxyEeYPj6OLveQSv5N42aEMRJDGsEaA
X-Developer-Key: i=thomas.weissschuh@linutronix.de; a=ed25519;
 pk=pfvxvpFUDJV2h2nY0FidLUml22uGLSjByFbM6aqQQws=

Use the predefined symbol to make the code easier to understand.

Signed-off-by: Thomas Weißschuh (Schneider Electric) <thomas.weissschuh@linutronix.de>
Acked-by: John Stultz <jstultz@google.com>
---
 tools/testing/selftests/timers/nsleep-lat.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/tools/testing/selftests/timers/nsleep-lat.c b/tools/testing/selftests/timers/nsleep-lat.c
index d22973c87f21..d46f17404439 100644
--- a/tools/testing/selftests/timers/nsleep-lat.c
+++ b/tools/testing/selftests/timers/nsleep-lat.c
@@ -27,7 +27,7 @@
 #include "clock-helpers.h"
 #include "kselftest.h"
 
-#define UNRESONABLE_LATENCY 40000000 /* 40ms in nanosecs */
+#define UNRESONABLE_LATENCY (40 * NSEC_PER_MSEC)
 
 /* CLOCK_HWSPECIFIC == CLOCK_SGI_CYCLE (Deprecated) */
 #define CLOCK_HWSPECIFIC		10

-- 
2.55.0

