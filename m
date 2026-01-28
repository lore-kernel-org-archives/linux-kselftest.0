Received: from galois.linutronix.de (Galois.linutronix.de [193.142.43.55])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7A4332FD697;
	Wed, 28 Jan 2026 10:24:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=193.142.43.55
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769595879; cv=none; b=IKAOcCIfiCiPdAfgStgtyz3vuLmHflxTrCFGIyQKHV7D5CgEOvA0QCySy6g4RAqlrGbv2OXXAGR+et7hRhEeB6LrkVZt/atxT3NoeFhzwrjJQzFAQDFugFJ31z/lhUGv5ZukQyM3dVVjwp3w50vMtpyDhdP/PY+OmRDdlH+uizs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769595879; c=relaxed/simple;
	bh=e48bmD7vgHTOz8cT191AtlkutcsNg4yWKs+H2Snws1I=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=Lwvw5f9Qtb3VoaxOrnIrvWgLihNOSJnP4Mq2olIjUNQ8BYpiTidPpK2YxLoLTQapTx2jZQ/idqaLiIgl4RUPerMT2Q4v+Y4sOilIKZihEH42kthk2v9asz+gv8lC1OEcITMbph4WCu/OyvI7YA4YNKpLlFrUPElD/SlxurYdMII=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linutronix.de; spf=pass smtp.mailfrom=linutronix.de; dkim=pass (2048-bit key) header.d=linutronix.de header.i=@linutronix.de header.b=WlNvCih2; dkim=permerror (0-bit key) header.d=linutronix.de header.i=@linutronix.de header.b=cc6db/d4; arc=none smtp.client-ip=193.142.43.55
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linutronix.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linutronix.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linutronix.de header.i=@linutronix.de header.b="WlNvCih2";
	dkim=permerror (0-bit key) header.d=linutronix.de header.i=@linutronix.de header.b="cc6db/d4"
From: =?utf-8?q?Thomas_Wei=C3=9Fschuh?= <thomas.weissschuh@linutronix.de>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020; t=1769595877;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=LbuNG7HvvntG2agb1VQphZS+Ig7+gNzZe5U3c7IxW1w=;
	b=WlNvCih2Zvgvp8B1MM27L4Gbdp9J3IDAWFerWgYsuiaCeulic+P9a5ohaEn08HC7x/7T1I
	MlQWFsQhVtxlU58lS0JVOH/rc12SGtHSqCrr4MnB79+KYsu/rTcEjGC/kzEbmHQHRPd6dh
	xUeiToM62dNYqVIkPx8xornf1jcYjt9vi2aV8vyu4LCzOQODXrSuV8aG64WZ1B68wtveWC
	eD2gA9cRP2giLiVkhAc2HewcStaalNzt+m9l/n4qGpe0hOAN9MRnODtwN8VltujtYSOe1F
	358uTqY0VkztlQmx4qmNpBqempKxzEMUKOfdxjMz4Xp6FLTm0NGnYLeACsXRkg==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020e; t=1769595877;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=LbuNG7HvvntG2agb1VQphZS+Ig7+gNzZe5U3c7IxW1w=;
	b=cc6db/d4U5i4eepEJsjn7IwwSKVJ7H1sQYqt060IHGsn/5SrT9in0ekq5VJhA9zMCdG4cu
	8Lvmj9hFw/lAO8CQ==
Date: Wed, 28 Jan 2026 11:24:33 +0100
Subject: [PATCH 1/5] selftests: kselftest: Treat xpass as successful result
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20260128-kselftest-harness-v1-1-cb259fa81cd0@linutronix.de>
References: <20260128-kselftest-harness-v1-0-cb259fa81cd0@linutronix.de>
In-Reply-To: <20260128-kselftest-harness-v1-0-cb259fa81cd0@linutronix.de>
To: Shuah Khan <shuah@kernel.org>, Kees Cook <kees@kernel.org>, 
 Andy Lutomirski <luto@amacapital.net>, Will Drewry <wad@chromium.org>
Cc: linux-kselftest@vger.kernel.org, linux-kernel@vger.kernel.org, 
 =?utf-8?q?Thomas_Wei=C3=9Fschuh?= <thomas.weissschuh@linutronix.de>
X-Developer-Signature: v=1; a=ed25519-sha256; t=1769595876; l=814;
 i=thomas.weissschuh@linutronix.de; s=20240209; h=from:subject:message-id;
 bh=e48bmD7vgHTOz8cT191AtlkutcsNg4yWKs+H2Snws1I=;
 b=CxlD1hjoyAhEcwPCqLai/Kd3Bz1z/BKtws8KMm/RRtJF4d27dE1pp0SAJiCT95BulhJK/gFRZ
 mrceRNXivr4BGCKCrqv8M0FjQqgWRVgE0x/Omb6JQlAdXUYgbmj1SJK
X-Developer-Key: i=thomas.weissschuh@linutronix.de; a=ed25519;
 pk=pfvxvpFUDJV2h2nY0FidLUml22uGLSjByFbM6aqQQws=

The harness treats these tests as successful, as does pytest.

Align kselftest.h to the rest of the ecosystem.

None of the Linux selftests seem to actually use this anyways.

Signed-off-by: Thomas Weißschuh <thomas.weissschuh@linutronix.de>
---
 tools/testing/selftests/kselftest.h | 1 +
 1 file changed, 1 insertion(+)

diff --git a/tools/testing/selftests/kselftest.h b/tools/testing/selftests/kselftest.h
index afbcf8412ae5..1e7e73f77fa7 100644
--- a/tools/testing/selftests/kselftest.h
+++ b/tools/testing/selftests/kselftest.h
@@ -399,6 +399,7 @@ static inline __noreturn void ksft_exit_fail(void)
 #define ksft_finished()			\
 	ksft_exit(ksft_plan ==		\
 		  ksft_cnt.ksft_pass +	\
+		  ksft_cnt.ksft_xpass +	\
 		  ksft_cnt.ksft_xfail +	\
 		  ksft_cnt.ksft_xskip)
 

-- 
2.52.0

