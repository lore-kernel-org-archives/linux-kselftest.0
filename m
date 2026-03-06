Received: from aye.elm.relay.mailchannels.net (aye.elm.relay.mailchannels.net [23.83.212.6])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7EC971519B4;
	Fri,  6 Mar 2026 18:22:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=23.83.212.6
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772821374; cv=pass; b=G9/dKqIUoTArSP0Pv4ekUh8VooiCcTGa7pS6Ohq9+CYzVrtYaN1Tp/OqhcmmACIaowk9Wrz9ZfU7w33ZqY3qLLnOp/CFLDKQOtukkPaVIcvMlCQR1UAUQbBVs/5IEUXPtWZJ/V3WT5CPrzpDjaHsOhce940+5nixzDg4U+BzNf4=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772821374; c=relaxed/simple;
	bh=lPEAUXwJnuD68JjrvIxut5vQRHbNaHoVtEMgWBcMBlc=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=ZBKHdlLk+wVI1+Ot7oCnQbAcaEtVg+KPf4v0wtinLW0ebrXdVCb11gWHyl1FqS2fLq9IjWjuhmjQ199xzDL4OW4UgnX0JRC7V7RVHVgd5MkW4/yisbcton/Z3l843FXD/hxISgfc2dOsFM/PEBJTel2c3/6v8U3/fYmkobv1XfU=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=stgolabs.net; spf=fail smtp.mailfrom=stgolabs.net; dkim=pass (2048-bit key) header.d=stgolabs.net header.i=@stgolabs.net header.b=XvcCNQW/; arc=pass smtp.client-ip=23.83.212.6
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=stgolabs.net
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=stgolabs.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=stgolabs.net header.i=@stgolabs.net header.b="XvcCNQW/"
X-Sender-Id: dreamhost|x-authsender|dave@stgolabs.net
Received: from relay.mailchannels.net (localhost [127.0.0.1])
	by relay.mailchannels.net (Postfix) with ESMTP id 9E6C9222C6F;
	Fri, 06 Mar 2026 18:22:47 +0000 (UTC)
Received: from pdx1-sub0-mail-a222.dreamhost.com (100-107-94-73.trex-nlb.outbound.svc.cluster.local [100.107.94.73])
	(Authenticated sender: dreamhost)
	by relay.mailchannels.net (Postfix) with ESMTPA id AECD2222C15;
	Fri, 06 Mar 2026 18:22:46 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; d=mailchannels.net; s=arc-2022; cv=none;
	t=1772821366;
	b=DNMJLOF3ql2HJCSECbv7jETPqB4bZrIIvkG0i1lSdDet6lrKsPiyGq0yo1+Kf/aLp+D+rW
	A22O2pAIp1T5MfEWF3zPDHWGCi203Mp19HyDF839nASanMpTVDVXmJTgp3IYw1Ju9fp/gx
	JYQnqtTmJs2v8I/hxRE8Uy1bHmHuDwpZKnjnmglEQggKM2dbJzXh6ckZLo3Ah8g8Q40MJC
	aT5TaVyyeSc8hxwXerNswKwwfceUWJfbKU2QD7sriIl/0GL1ohOj5de0KHCQlNSqiiFunA
	Q/xGAY2JwmUKSlR6RvSRwEoBGpeinjBDXavoZHZ/wKV0gLVoBrYeOcHYi1enjA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed;
 d=mailchannels.net;
	s=arc-2022; t=1772821366;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:dkim-signature;
	bh=WuRuJOUVBDyYnZifDnkKHzzI/4NgLCNebUDFiFHR9E0=;
	b=aduhrBFSzGk2biu0zPWsBuzDvm97YJpzGU2OkW16IUv1Q/hn5XvsEIPxIZ8jTt5Jxp/RxN
	2wHERvlstGNsHlzv55xP7RYNUX+t05B1L9E1PjqWaLwYEX1mBxJ6ack2uW3plxdM1+SsrT
	3YmaW8hjYnAQYgfeD39Jrqh5zMysc1R3yFKJ0Jd6Xid54ON76B2syit/4aZxcpoeCMUCkV
	6AYy2qeFJEH7Ei8eHv1GcIyHJRo3pDE+ciLfVMsLaJdBM3UF08h4a7vrHt7z5oW9dxBRlC
	dRxhQtj7NQy9qUvA5zd10xrPLC4ZlE6FKn98QvF66/xravGhJvqTSdlRtAI0Rw==
ARC-Authentication-Results: i=1;
	rspamd-6f5c445b59-kgqgj;
	auth=pass smtp.auth=dreamhost smtp.mailfrom=dave@stgolabs.net
X-Sender-Id: dreamhost|x-authsender|dave@stgolabs.net
X-MC-Relay: Neutral
X-MailChannels-SenderId: dreamhost|x-authsender|dave@stgolabs.net
X-MailChannels-Auth-Id: dreamhost
X-Desert-Duck: 3d6fc21a7231bdc4_1772821366985_2283979282
X-MC-Loop-Signature: 1772821366985:3658861613
X-MC-Ingress-Time: 1772821366984
Received: from pdx1-sub0-mail-a222.dreamhost.com (pop.dreamhost.com
 [64.90.62.162])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384)
	by 100.107.94.73 (trex/7.1.3);
	Fri, 06 Mar 2026 18:22:46 +0000
Received: from offworld.lan (unknown [76.167.199.67])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: dave@stgolabs.net)
	by pdx1-sub0-mail-a222.dreamhost.com (Postfix) with ESMTPSA id 4fSFBZ070Pz2S;
	Fri,  6 Mar 2026 10:22:45 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=stgolabs.net;
	s=dreamhost; t=1772821366;
	bh=WuRuJOUVBDyYnZifDnkKHzzI/4NgLCNebUDFiFHR9E0=;
	h=From:To:Cc:Subject:Date:Content-Transfer-Encoding;
	b=XvcCNQW/DokN9fU9NU3LtoPwEpewxYeRSRt35gsR8M4r0S+swKhl3xAdl5KzV5FdT
	 JSNlsR/AbE9OHXrMZ6Dson1j/kxwyMZEDpuyuaadpA4CYlHzjFX/ySwZ1rTuVxncK/
	 2tRmWSihkghAoFcu9j8H6g9pk0XlXy0vx/iIG463ya/qUS1MmP4Svtj2WTNKjpPZCO
	 igaaMUDVfYQLOGech0IbqvmqgZjS4WnxNUKIEsbLxTizUPCds/DC3CvDw65gmo0onP
	 KufgPHu8O5tcD+IUI/XqxiGUrG2mGSf/Vu1eT088ONyN+4gQcDreOnjKcldYp5AlwP
	 zFKAeYwXePZig==
From: Davidlohr Bueso <dave@stgolabs.net>
To: tglx@kernel.org,
	peterz@infradead.org
Cc: bigeasy@linutronix.de,
	linux-kernel@vger.kernel.org,
	linux-kselftest@vger.kernel.org,
	Davidlohr Bueso <dave@stgolabs.net>
Subject: [PATCH] selftests/futex: Bump up libnuma version check
Date: Fri,  6 Mar 2026 10:22:15 -0800
Message-Id: <20260306182215.2088991-1-dave@stgolabs.net>
X-Mailer: git-send-email 2.39.5
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

numa_set_mempolicy_home_node() was introduced in libnuma 2.0.18, not
2.0.16, via:
	https://github.com/numactl/numactl/commit/8f2ffc89654c

Signed-off-by: Davidlohr Bueso <dave@stgolabs.net>
---
 tools/testing/selftests/futex/functional/Makefile          | 2 +-
 tools/testing/selftests/futex/functional/futex_numa_mpol.c | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/tools/testing/selftests/futex/functional/Makefile b/tools/testing/selftests/futex/functional/Makefile
index af7ec309ea78..ea3ef45f993e 100644
--- a/tools/testing/selftests/futex/functional/Makefile
+++ b/tools/testing/selftests/futex/functional/Makefile
@@ -1,6 +1,6 @@
 # SPDX-License-Identifier: GPL-2.0
 PKG_CONFIG ?= pkg-config
-LIBNUMA_TEST = $(shell sh -c "$(PKG_CONFIG) numa --atleast-version 2.0.16 > /dev/null 2>&1 && echo SUFFICIENT || echo NO")
+LIBNUMA_TEST = $(shell sh -c "$(PKG_CONFIG) numa --atleast-version 2.0.18 > /dev/null 2>&1 && echo SUFFICIENT || echo NO")
 
 INCLUDES := -I../include -I../../ $(KHDR_INCLUDES)
 CFLAGS := $(CFLAGS) -g -O2 -Wall -pthread -D_FILE_OFFSET_BITS=64 -D_TIME_BITS=64 $(INCLUDES) $(KHDR_INCLUDES) -DLIBNUMA_VER_$(LIBNUMA_TEST)=1
diff --git a/tools/testing/selftests/futex/functional/futex_numa_mpol.c b/tools/testing/selftests/futex/functional/futex_numa_mpol.c
index 220ef219c823..d8dd3ae0c5b1 100644
--- a/tools/testing/selftests/futex/functional/futex_numa_mpol.c
+++ b/tools/testing/selftests/futex/functional/futex_numa_mpol.c
@@ -206,7 +206,7 @@ TEST(futex_numa_mpol)
 	}
 	ksft_test_result_pass("futex2 MPOL hints test passed\n");
 #else
-	ksft_test_result_skip("futex2 MPOL hints test requires libnuma 2.0.16+\n");
+	ksft_test_result_skip("futex2 MPOL hints test requires libnuma 2.0.18+\n");
 #endif
 	munmap(futex_ptr, mem_size * 2);
 }
-- 
2.39.5

