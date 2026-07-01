Received: from out203-205-221-240.mail.qq.com (out203-205-221-240.mail.qq.com [203.205.221.240])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6E29C47CC85;
	Wed,  1 Jul 2026 12:44:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=203.205.221.240
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782909874; cv=none; b=Aw2wQss5UgQ3mj3ZPe8ckJi+jbKsrG72Np5E+mRO9zc68peKveZzDDTBc62YzdXYntfFdvN4Ttm6chbaK+/Zw1X2049be+UUNXBRIzDOwz+ZDPvFf6YT4RiRJFo8do1XvCMN5sTW9rgkAf4h3rMpCzT44LqXv0TSW1Ph39LFAgg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782909874; c=relaxed/simple;
	bh=PmBlIxOnIAWiTT1dMB+k1GJBW3L+i3rVcq5Pvr4YNcM=;
	h=Message-ID:From:To:Cc:Subject:Date:MIME-Version; b=KgPf0P/8H4bbTcGCbHZwNHCnHOQPXHyv2f28vqvY+TrFV9QcauW3W/J2HfX9NfByzGlobv70L/+lqlJk76+QNyW+0O6FQqPYq3QQoHpLw3L8MqKEC2jfQaG9PtNq2KnkFdPn2RWIZgQR3SWLZsvu3NOQ8GlQ6yuBob6E9cHd/9k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=qq.com; spf=pass smtp.mailfrom=qq.com; dkim=pass (1024-bit key) header.d=qq.com header.i=@qq.com header.b=PDHnvyYM; arc=none smtp.client-ip=203.205.221.240
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=qq.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=qq.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=qq.com header.i=@qq.com header.b="PDHnvyYM"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qq.com; s=s201512;
	t=1782909863; bh=2T9UvrmrdIZ1TA3mbiBS9R/xpVn5slOrRYqYeNWpCkQ=;
	h=From:To:Cc:Subject:Date;
	b=PDHnvyYMkk4P8zc/7lOsRgApm+tiH12dWXbH3BYKvvZYMZm+gDcl2qujUVzhj50hb
	 ih/eg7y5kdwdvrT63LXfSsx1I+XOpM+MUz7cdQsAios1rBjKC2lgpTXUFHCB7b9hCK
	 RXQrfOnbkgI/7UwdsEJ8VGcQXKgbs16V6L+s+B1I=
Received: from LAPTOP-KNA43L24 ([2409:895a:38f6:dd00:f937:a83c:6bd9:7270])
	by newxmesmtplogicsvrsza63-0.qq.com (NewEsmtp) with SMTP
	id AE71F824; Wed, 01 Jul 2026 20:43:39 +0800
X-QQ-mid: xmsmtpt1782909819tpsapueyo
Message-ID: <tencent_4780DB9DBAA4CFF241D9A4840EEF9B0B3D06@qq.com>
X-QQ-XMAILINFO: OATpkVjS499usFhVinfmLlowlLd1WvZ2WY+OVxVco5WYAaVL5QBZ9lSEIzBIpb
	 x9s+SSfhzVwbR+MJ9u4pDH0hSnWJ0wLvhzRDx+zLzHnc4mlorqma2/tiBH3KwLlHI38G+cx3a1nD
	 6W+HkRw9H7xYKOD9Z4g4HfrwOOORydHF+kl9fV6qqV8VBSrXmDzKKGyTCDR5XQcvAZaqKc4l8c4K
	 rx2PMpz2XqdoPUgEgZUH2HZxF3oKLtyOcPOxDFvPV07b/qWwtfgv2cJTydh0NkplKgqDT2Q0Ep5m
	 1MLVzyCTdrXM/fbp4fbqKvYYwsbntkR+KsVo4gHiSNF+VDg5kebXBnDKY5xbujJgwuW0Ks5v8fWF
	 PSu5jrVXFEtpS43Kk+pIJuiOuRJ/jjaXzE7IGdHnYz3ALp3ZmUk+6RBVy2KYJfSw2VQM5NWIBwJr
	 YMBo0dwweA9vklw36gyQL73b8pKDJW0lMllJxf1603RcHj1ZZV4X0pducqbaDSfatlv5ch/9ilVM
	 6mN1/m8omC9JH70P5IIh/ZOjGFyTAY3reRHvQW9ZDINaFPBzs7Lj3Xlfg7Fvv8SoGl3fQgHBYhuw
	 OxaXPJwO3gvrNJEI4l5Yv4EQ8bwdYnPeN8TGSXrVFWdr09/qDe/67+1GV2m9W8Ta0Bl8V9fI0cPC
	 yh2zqgJEGQybheNRI7AHDyKb7YWJJ0YK7FFB0G7/YWbg8Mjn49iTYxPNIgNUPhRJcwD7FNy14hJL
	 XiptrQqnOhEjN95k7en+FkeFWMgbq9WBxlIfZWkFuqG5mEfnEBqUiZUOqD3CVY9F1OLQpdWtwwh6
	 2u7WX4scgjnBoRJSElggM91tT4EzI+VLiYp2Wp100UsnjSvlKmLTn5EoN6D4t2mt/xeONezNKtwG
	 b59SzhchoecSG74HAPGAmUMKfJf1JPIZf1kKUkNWnGvTaFKOTFc6ilS10bHg+yiA706Zq+BIFdTA
	 9YksdF0rjRbvWwCiokDS3kbTJfkbkoqKfycLbHohP/M/iBVwbAyLxSuBPjI3p1949lbAYcja1Tf3
	 jpNP9jEG9iY067qvUWBwjpTe8LgMsHG2FyF44UKQ==
X-QQ-XMRINFO: M/715EihBoGS47X28/vv4NpnfpeBLnr4Qg==
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
Date: Wed,  1 Jul 2026 20:43:24 +0800
X-OQ-MSGID: <20260701124324.696-1-1746193727@qq.com>
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

