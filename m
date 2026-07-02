Received: from out203-205-221-239.mail.qq.com (out203-205-221-239.mail.qq.com [203.205.221.239])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4664C1EFFA1;
	Thu,  2 Jul 2026 08:24:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=203.205.221.239
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782980653; cv=none; b=uxNrssQI5PS57IRKsRX4+XVsbNBa27+JymAwgTtsxixIQ7OSJpFsQCpzmKlD52JIUOmJgi8VsU/GjpvsA8rEmhfPDYJVidoEEzRLaOgDoouqJ54OePFekQgnARRwuRHmUFIEx3ex5RNNy0jiR8Ox3Z8dNGqdy4IxwRAjephHkZM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782980653; c=relaxed/simple;
	bh=PmBlIxOnIAWiTT1dMB+k1GJBW3L+i3rVcq5Pvr4YNcM=;
	h=Message-ID:From:To:Cc:Subject:Date:MIME-Version; b=C8gXGscJgftuHiZs5Gl5gYicSZYRG5qV+ARA4YTTJyjC4t7cFdtytldNQ1g/OSao0Dobnw+XzFL07o+kMHqf7WG8KcQvjBjHoDGQK5iPqxiF8iYOd5HTYOcg2Ml0NaAut5wb3oxbUlqZtCB/aebJFXUNfEXPPrfB0UdcDqfUjC4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=qq.com; spf=pass smtp.mailfrom=qq.com; dkim=pass (1024-bit key) header.d=qq.com header.i=@qq.com header.b=dN6Y2hCY; arc=none smtp.client-ip=203.205.221.239
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=qq.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=qq.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=qq.com header.i=@qq.com header.b="dN6Y2hCY"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qq.com; s=s201512;
	t=1782980649; bh=2T9UvrmrdIZ1TA3mbiBS9R/xpVn5slOrRYqYeNWpCkQ=;
	h=From:To:Cc:Subject:Date;
	b=dN6Y2hCYxx2WUG1xPIcWRC4QmjuTUwyxyyE+dGO9+/zJeyTXGSnHC+c54UorboOuz
	 FZ2RYuNXpKfYc3gwRMkkn9nsZeirGh6FmyRDOA4qnjnpRCcpeHdfTwVgxSv+Rybbcj
	 dODJfYT8giqmjL1wvhyL28S/nUxy395GIdwaNgFo=
Received: from LAPTOP-KNA43L24 ([2409:895a:38f6:dd00:11e:7a1f:21b4:a990])
	by newxmesmtplogicsvrsza53-0.qq.com (NewEsmtp) with SMTP
	id 6018E8EF; Thu, 02 Jul 2026 16:24:01 +0800
X-QQ-mid: xmsmtpt1782980641tlx60hzex
Message-ID: <tencent_A20EAF9C0B2AC0D6DD97A4C2F250D9970406@qq.com>
X-QQ-XMAILINFO: MeukCuWaRbQlz6bEgdzsKK+YcRokjFvPiFOGQtnc5fF6xT+mRYvmxTqrszm5HI
	 bxQWpO1n4+/6Ibmpy/eFR1+rm6muujnC2UmLMKytL9JsLThPUO3lWRKGANgDqA7ZUjuwCbzqE64H
	 RNq2Gva4FaIlnEKdZ2juFaZtHY1vJsnPaDFgLY+8UytdRFZlASQ9UwXMGa8weVNCqzlfFjv+kMtp
	 0Tkt93S4owfrQC3H/eM0CfogluC3SBFNhxyRgg0FZT7CZH6PA6/u5YWnVPLR3Vupd7vHYRdOdrIe
	 cE1rdKJxpjYurND2G2KnQP+eyNgAR3zceOOU99yM2O5/Tkk1dFb5wC4huNlbrBwTdWepDclNoyBI
	 FW7xAw93VvzYZRAoVXyff4qfGniCocutwJ0DL/0+iKb5xoPdysQNqKn71g3taAZs0ZMpNeYg+caT
	 t7FNgAORe/9A6Un2QESKMKwH/feFfUeexdBuq8RSxu4KaEymz2WJgYAyoVJUjf9/bhGijhAssk3n
	 TfFqi+VYqlX4sGjvpJ1XCPh2ayx5+tfGb0ZrHDfcoGpxwI3z1nrifE0oWMDN6iPlb+lpETeMiGj2
	 PG0yYtIad6BbmdgQroUAr6D9tcz479+qECJ0NawEP0YRKM16MOdt36zD6A49toMchfR/a4xlSTbW
	 r2pR/UuWAuCAEfMnEQTb/KQMnAOY5+38X9EwQe/rMvxLCM+JoPw2ouKu7pj1PBqdVbaNYONNUtIG
	 XHeGMqa5wna2v64LgH32laX2COabIm49PBiZ/vYZYDu5nLXtSqD63gd4DupndobYut2+YosqEQx/
	 +iw4FLChOWTGmr3FqRC9BlbxdeSPHahWjZOLFYBZFuwBsIkK1OgZkPz0myTVTUgj4Ux7DJ8MSq/g
	 5m4NWHbiq9qXkqVMZJI2aKBONgak/uCB8XS/TXbsWu2/poPTQa59Tk0jBu+YT2yh+rE3bJETE0BN
	 JuF0O8bDDE7NL2PquvrkYzxyRWp9b9W41cn09pS46uRRki1QQm9zUviHqj4fiAyttRXGpJv7LXLg
	 WTM3/EkFbznvRv1w0sG4yANQM2hERbucecnC/xVnFF+AMjyGeKdosHAchp2u/78ZOw6wRVBQ==
X-QQ-XMRINFO: NI4Ajvh11aEjEMj13RCX7UuhPEoou2bs1g==
From: Old-Ding <1746193727@qq.com>
To: mathieu.desnoyers@efficios.com,
	peterz@infradead.org,
	paulmck@kernel.org,
	boqun@kernel.org
Cc: shuah@kernel.org,
	skhan@linuxfoundation.org,
	linux-kernel@vger.kernel.org,
	linux-kselftest@vger.kernel.org,
	Old-Ding <1746193727@qq.com>
Subject: [PATCH] selftests/rseq: Fix spelling of accommodate
Date: Thu,  2 Jul 2026 16:23:53 +0800
X-OQ-MSGID: <20260702082354.1728-1-1746193727@qq.com>
X-Mailer: git-send-email 2.50.1.windows.1
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The comment contains a spelling error listed in scripts/spelling.txt.

Fix it.

Signed-off-by: Old-Ding <1746193727@qq.com>
---
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

