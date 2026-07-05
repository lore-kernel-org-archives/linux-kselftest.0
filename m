Received: from out203-205-221-233.mail.qq.com (out203-205-221-233.mail.qq.com [203.205.221.233])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5FEE7292B54;
	Sun,  5 Jul 2026 15:47:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=203.205.221.233
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783266483; cv=none; b=WT8q69gfZFhTTSm/7hroHKyPTrOIRrIKvgpNBH/gx4SukGUkJ2cy/5vKMHmlKEti6HM8aItqnsgJDV7CBC9xV9Vr2H5lvqLmWR4sFSxeya6p+GP6sM7c14EceEGId9xCObmGtgEBPt6u+KIRZsoV3uVFtYUxoor0XaCWdsGoTXg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783266483; c=relaxed/simple;
	bh=hlbpdBo3Uq0EN/42H203OfcXv1pYqJQdz8cLqyz426E=;
	h=Message-ID:From:To:Cc:Subject:Date:In-Reply-To:References:
	 MIME-Version; b=CzPmJ68FB/GKxjOer3/P6QrsGZMA17j8NO6Arh/4mCkN3N+XicQ2td/0vQUAhnoM0eW3zU/r2mesRADWNUrVWkB1VdrO1Z0Xmj7y245NkEPxdR92KUyJ/+zbVMA3U2MZEQm0YqRXm1Qk+qPPEqrublwLjhCN8V/u09/nwfJxlNY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=qq.com; spf=pass smtp.mailfrom=qq.com; dkim=pass (1024-bit key) header.d=qq.com header.i=@qq.com header.b=SFoFy0dM; arc=none smtp.client-ip=203.205.221.233
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=qq.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=qq.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=qq.com header.i=@qq.com header.b="SFoFy0dM"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qq.com; s=s201512;
	t=1783266477; bh=NtuUbY240M0fU9kQruxrCPW0ej8gT6RfnDWnfPfSEQU=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=SFoFy0dM8Ier5Yv53ERLxg3WLCshKGtjLPfRriDjsVw33f8x3mc85Gls0cYujGr/d
	 EtwKVvbuXHzNr0ME2RIK1EIEOW+IqJy00VNdVqbIk6SZRiXaAcPwlq5loONj/PCT90
	 fgjjvlhfE+aebcIUYxE3dLmMIw1imqOeAOXO8zOQ=
Received: from LAPTOP-KNA43L24 ([2409:8a55:34b0:84b3:416b:63d5:3813:92b0])
	by newxmesmtplogicsvrszc43-0.qq.com (NewEsmtp) with SMTP
	id BF238886; Sun, 05 Jul 2026 23:47:50 +0800
X-QQ-mid: xmsmtpt1783266470te4886uuo
Message-ID: <tencent_BAB26179A92C5CE28657C0451540E6EE4B05@qq.com>
X-QQ-XMAILINFO: OOO9dHjlsLs7iIfk7wHMrsewBYACxnX2AZtccVv8Fxc37wgTwJkpy4gNVMurwK
	 brfmNAtJJrstkwgn+247UGZFPr3jU5PDQQJ17kuG4XhqipzaPAHYMS8OIo73J3/d08zZ5gS0fWib
	 l9oS71e6SJgoaGzWYhWRattHp8E6G/39HLfzgFZt0LS/bU75DNqPPvXjmro1W0J55bsBd+EQkmJx
	 L5YlwjAE3aQXGUwPHe6DYS5MrtRdEfn3wIbDxHA57RZbk+HJ+K4oNgLScC3K1DSgZZW7pZtlUdxF
	 eA25en+U2ZbaUg9zX+JY3a4cIMcliBEumTWPXZxWTVxhd9XJR88I+VR/+xPkC92UmTNW0icXYy3/
	 Sr/kc3xgV7dMEdzVlHSl0IHukPHCN8ZYkIp3ws/DEfwrsnPWPWIJ0AS84O2ChXeEMRmkK7+uDFom
	 HWpsacfrCkbesWytPROQY+pYN1arExjBkXitgX7V5FGcdsoW8TA+etUCBz+k/POu+UQvlF6giM50
	 xRz63Y5lJKO9h8BrmRGPnOTHJsqH8fGURlmw5d3Taki5BsezaXDUSjIcTrjyoC+IMk7O58IvdXOc
	 OtE4KKYnDCz2/drYcqgVBuKOLMcJ8ei5y76F7YqsE/vapbVllyqQ950mtm09WV9jR5/dHxDHqXmZ
	 Esd5tv6nOvJhkjeOMvvW0K4QoApkrU+R0AudInQWftK9Fd5ca2cq4IVMuf0tvS9AoN1Ycq8gCjx4
	 O9DuQTIOyK1GnNZffupTfz4wO+LgqwzQYsYzPNl02Kg2dD4V0PmwUHEMWHRIVdV5x4qM440EtqM+
	 wciWU0Z+q5XdsXzY+waWsEwNJyIHUrQZq8Sf+PvX3o/fxh1uaZTX9DTnkLAkf9Hu+2ewLwxU6jJ2
	 7EbfUUt3nzlHJEKV3BpyajWX6Nmk1h0ZFBJkRZGwfwiNsKWe2nkxg0VlVEoyKGjs1OilZvrKnjCb
	 P5VV002qt1qFbCXk+Jnku4EUFkYY9akFjfYUBOUBYAFNixYjUjJJfD+/5CoIEdoiVVJyQ9jJfKAR
	 TCKnRGOG+xkL4JnrBf0KGF2AMrBiidUKZcdZjj7A==
X-QQ-XMRINFO: Mp0Kj//9VHAxzExpfF+O8yhSrljjwrznVg==
From: Ding Junlin <1746193727@qq.com>
To: mathieu.desnoyers@efficios.com,
	peterz@infradead.org,
	paulmck@kernel.org,
	boqun@kernel.org,
	shuah@kernel.org
Cc: tglx@kernel.org,
	linux-kernel@vger.kernel.org,
	linux-kselftest@vger.kernel.org,
	Ding Junlin <1746193727@qq.com>
Subject: [PATCH v2] selftests/rseq: Fix spelling of accommodate
Date: Sun,  5 Jul 2026 23:47:46 +0800
X-OQ-MSGID: <20260705154746.99-1-1746193727@qq.com>
X-Mailer: git-send-email 2.50.1.windows.1
In-Reply-To: <tencent_A20EAF9C0B2AC0D6DD97A4C2F250D9970406@qq.com>
References: <tencent_A20EAF9C0B2AC0D6DD97A4C2F250D9970406@qq.com>
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The comment contains a spelling error listed in scripts/spelling.txt.

Fix it.

Signed-off-by: Ding Junlin <1746193727@qq.com>
---
v2:
- Use real name for authorship and Signed-off-by. No code changes.

 tools/testing/selftests/rseq/rseq.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/tools/testing/selftests/rseq/rseq.c b/tools/testing/selftests/rseq/rseq.c
index be0d0a97031e..1cd633923b1d 100644
--- a/tools/testing/selftests/rseq/rseq.c
+++ b/tools/testing/selftests/rseq/rseq.c
@@ -73,7 +73,7 @@ static int rseq_ownership;
 #define ORIG_RSEQ_ALLOC_SIZE		32
 
 /*
- * Use a union to ensure we allocate a TLS area of 1024 bytes to accomodate an
+ * Use a union to ensure we allocate a TLS area of 1024 bytes to accommodate an
  * rseq registration that is larger than the current rseq ABI.
  */
 union rseq_tls {
-- 
2.50.1.windows.1

