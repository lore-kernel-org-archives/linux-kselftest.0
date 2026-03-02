Received: from galois.linutronix.de (Galois.linutronix.de [193.142.43.55])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CC5A0410D38;
	Mon,  2 Mar 2026 14:13:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=193.142.43.55
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772460827; cv=none; b=jm3S7zJc32EJrN8Ix+Sk0hZ8uLGtNKeJ+Q0liURsmhADtKaO1xG1125TSmvf+aux7UCMqvSAjm1DlB5+AoK1UrwcX4v/g4wOmVlzXHIQ5a/uhJycDjVJXvZ32/fYBTXKHPBqObwcfZnu96lzK7DzDLBzo21FdUgFm9zsNrNQ9d8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772460827; c=relaxed/simple;
	bh=u8EUg0ZyQmSus3QNbAm2GZpaSK9u1dOI00AgCVKP5EM=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=Jk/tNDczH+eIkiIGrZtcEC25nzynx5OqWgwOmMwaKu+Lm9lT5kVZuutrikeaG48iATnZL420YmwGRmJzvYmdbi1hfhg9PLOXIDZONbnVWyxP8E9SMrgbFL7YcaI/3VCDfZcmGnvKSIi5wfS8Mz0xt+jc3LSS3dPTSpWNzJM/ED8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linutronix.de; spf=pass smtp.mailfrom=linutronix.de; dkim=pass (2048-bit key) header.d=linutronix.de header.i=@linutronix.de header.b=FcoOC2CV; dkim=permerror (0-bit key) header.d=linutronix.de header.i=@linutronix.de header.b=0Tv5IvqX; arc=none smtp.client-ip=193.142.43.55
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linutronix.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linutronix.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linutronix.de header.i=@linutronix.de header.b="FcoOC2CV";
	dkim=permerror (0-bit key) header.d=linutronix.de header.i=@linutronix.de header.b="0Tv5IvqX"
From: =?utf-8?q?Thomas_Wei=C3=9Fschuh?= <thomas.weissschuh@linutronix.de>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020; t=1772460824;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=DENFRSmvUruhh7sXW/NRQgaI5tyD0A/XM0dVW35m5wI=;
	b=FcoOC2CVX0+VLAczxAtyQJXBdVRFcCIEx2yQHLpF9PVaWRZdaYFcaHQaya1Ob1P09TNaz6
	/uRVGsRlA71sgO/W2HT/Dq+FiH9LUK0DXBMcOTkK+zKQUkgLyZZao4F0wKH4yAwrxBBX92
	emNpQkufUnqjlndV/+7P8jM0+6jdewHidV8tdQtF26e1cVfYQumP7V+0yejEBcI2FbgVdG
	ObyxNz5Clr6X9hymbxfIpafzJZ4oNBCYOBBCN+KDD7ZJ7D291a2a7oSbDI1XVQUhMBOLrI
	IcPICD+PLqkJ4gFeZgQAAZphyAkW+2EDxKCK8Gej4o0ci1So2jzkB1KQjRrdsA==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020e; t=1772460824;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=DENFRSmvUruhh7sXW/NRQgaI5tyD0A/XM0dVW35m5wI=;
	b=0Tv5IvqXpCLDWZ0lvzuMNiotl7Quzu3ueFrV6/hTWEtEUBvBV0Lnus2GnBiAKIwUN+zCrL
	eB71SiD5yWkcmlBg==
Date: Mon, 02 Mar 2026 15:13:28 +0100
Subject: [PATCH v2 1/5] selftests: kselftest: Treat xpass as successful
 result
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20260302-kselftest-harness-v2-1-3143aa41d989@linutronix.de>
References: <20260302-kselftest-harness-v2-0-3143aa41d989@linutronix.de>
In-Reply-To: <20260302-kselftest-harness-v2-0-3143aa41d989@linutronix.de>
To: Shuah Khan <shuah@kernel.org>, Kees Cook <kees@kernel.org>, 
 Andy Lutomirski <luto@amacapital.net>, Will Drewry <wad@chromium.org>
Cc: linux-kselftest@vger.kernel.org, linux-kernel@vger.kernel.org, 
 =?utf-8?q?Thomas_Wei=C3=9Fschuh?= <thomas.weissschuh@linutronix.de>
X-Developer-Signature: v=1; a=ed25519-sha256; t=1772460823; l=814;
 i=thomas.weissschuh@linutronix.de; s=20240209; h=from:subject:message-id;
 bh=u8EUg0ZyQmSus3QNbAm2GZpaSK9u1dOI00AgCVKP5EM=;
 b=8MA4Uz9MF4BNTC69FjxtUUa09KEjCDmtqcPnf/GzjD9EP3ERt7Y8RJx/WeF+Eum8fjxkXvi0w
 36+L5Bh2uDuCJ3LFMmU1JcAna/crdwmdiVrEVMr4fludR7NKsS8+FV8
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
2.53.0

