Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.221.41
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793985301;
	b=hTek3Fb2AAscPEpkIxMG8r2sLfQT2Mhfgxrt5mhHaNqBL35B4LEYpxXcvrUpt7RZ1djs
	 /oS9IAbtl7k0s+1UiriO2QjLTGZTlc86BdbwjLDLJ58eDdhhlvZxbsYCBCWydF9iBEQnP
	 cIrQwr3j7JygBtaIuilh8WPF3PpOWUCN1VF3lKXbL3V7QiayQCOCxQYckpOQ27sViYgzF
	 EnOYD7qsRU/iiiwjzFJybhDu3PeiNqW0/PRiGYMJMrX33E3tL/GSrUkJpBFN3KnsumkX8
	 YzKeM0mHcI3rhQ+QJRNjGB9kKxaY8qtE4mZgt9KTQxpqG4TjUHhrXTNHycflYA4ZvKQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793985301;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=1S4mR0QPoC6nO8yYpDVgFwSwnBHCQTPEsHvUyW429Rc=;
	b=JKBAbLXVxnc4ftclZsG3H8nQYp+OuoD+DNkJYXX/BpA1NjXAj84xflFkcI+AWUL5BDO4
	 mO6ScUnI58B3XCnwCeVDXqv0PJth8RX5CuaWBRRmdXGELhbOrJRT4wAHlnfTBjR0nd3xJ
	 GyGBoMC/1cVaaz+hfnKMc+esnGVzzdjkKJKik85wXjVFHPXOx0N8lgNSPt1FarPI2jKJB
	 c/Hov+xwOt6dz4Hkl0txgINlP0goaPtQcjEtiqP6DSpcjCgww2NAjR5EfQuyyqIQgl+Ai
	 eusuvaJOGC4x8XvsJtRvTIQaM62hgbkfdkUpV7ZLyRjv9VzFkljwKmVW/VyNHn5x/Uw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=WCX3loN9;
	arc=none smtp.remote-ip=209.85.221.41
Received: from mail-wr1-f41.google.com (mail-wr1-f41.google.com [209.85.221.41])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EB59B606D803
	for <linux-kselftest@vger.kernel.org>; Fri,  6 Nov 2026 17:14:48 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org EB59B606D803
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=WCX3loN9
Received: by mail-wr1-f41.google.com with SMTP id ffacd0b85a97d-49376eb635fso316365f8f.1
        for <linux-kselftest@vger.kernel.org>; Fri, 06 Nov 2026 09:14:48 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793985287; x=1794590087; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=1S4mR0QPoC6nO8yYpDVgFwSwnBHCQTPEsHvUyW429Rc=;
        b=WCX3loN9CbTwZTJ3fT8dhK2OpMhEDhmrTp2p+I4v9aNr8BkWSbNAPaDAUFis2zb37H
         dAg0nJlkO8mtwFqgAobQdD1+1LDKdkMmwY2Xy2kyV1wrMDBaSyTWnaV12noKRyXcayzM
         WoKEEMwtX6aHJa8pQJiw7uM2lxsuZdxDwtS8OaFod3k1RtJsOtNq5Hr3jmcFL3Ldkp9j
         Kqyryy0Vy2FSm0KC5CJ3PdExVN+4OSRHdWUtAAILX+McR+hr1Wrxw1xAXGR1wDY9x9aW
         xLYnyP8RhwYUD4/tepKFDph2R7AAzbhsiND64uLFXv1mUCOMIOgc5fcPD/HooHX+68o0
         KR8Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793985287; x=1794590087;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=1S4mR0QPoC6nO8yYpDVgFwSwnBHCQTPEsHvUyW429Rc=;
        b=ryX9t0R0fKYY/DONtGRLBuQq8Ez99Mxh4RYWt7a+03eD/fkpHCc/iwmBSuqDNa1rT4
         ipmzmoYNbUNmSgNFqswLRJzaPJr8JCNhmuqNvXBV0P1RJMwQieoLNgXER3ICLEnMM+ii
         fa48YJP7tM40PAH+kb/wh/HuJrc7myZINQcH42JBk0r4Xw4fYNgMSeJ9nHX1RUQMvB/g
         NVK+WOq8wxIlbXPU9v0keEeV9zFFdPILJqxPT3nC+nOm9csjda8OrxpA5syOupT8ygHH
         XWOwMzPz2TAyBFTc543nWv4U3BIAVfvoD9gxwbH0rki2SzmFT2KG8Mt+/utqCnE1ldWK
         AUSw==
X-Forwarded-Encrypted: i=1; AKwUvBxOmZCM+sDOrS5nMG+cHD6iT38SJlm8fhha9mEhUexH4NTA6BHBJ66jPV9ndVOdOnnl+c+DS0DeN5v2bmaDXJ0=@vger.kernel.org
X-Gm-Message-State: APuU4Z9kIaXwJTSYTgQOmBTuSgd7bN6T4yjX0t8Bodk8zGIyx5QiEbfs
	bDR66qI0uMBMJRqs1sGyz3ZY2VLIGI5ZKFXREztGcBsBFp3TrM1rwPSA
X-Gm-Gg: AYBFou1JyMbamTHMLoI53Ddp7WKTw5y8MxjLGUAlHoT641KK20tOEC4qOV/1eMEUSnq
	OXaY++DYIRKlGaDHqXRzCo/OViAojTSll9y0CbWnYME+ukmGtjaK4Hr5nyTA8JYgAxJcxKcX3cr
	stlWNDHC3QLgNHDR0xxDdtGBTMDNTe+HdvMpkQn4N12TznbpyWjWX6OCro8GYzKjtihJMgTFyQp
	246vyyZRxfm0Adlc3xV2RkQMKZfnQF/cXCEonxK/5lzHXDb4VWTIp+povAdj3zFaLhEWD8gigiN
	AsyThthYI2TMkFYMxaSDWa+ZTnbDLHkLWnSURTEU2FNr8cy30Qnw+VC6zntsAQpyw6ggB+K9rHF
	jW/S8RvsnbBOWoiJK3J/uQ9CJbEyZR2cFthrtns8Q95mpe9KhQ4zyStmZd+bcIHcPy6KkDJD+Im
	MEOuwuzsXHppZQId8MtMmmrV5yvGCWCe4cfMP2Ho5ySELu06wSmqkAvqqVgPwfJmzXdKiz26s01
	idpK/VOgJw1s7al3BLS9Fa4fb7Omvrkl0UO3QQOHw5r1xYkQg7UGaCJu8pLIyEOKjI/HG4WwasN
	kp/+jaKf4XBihq1egRUq1/8ElD+OubJxTRxcarGjNLvnDJ8zyOoOHM0o4e9sTUA5v+pdqEFHAxl
	ZxkkCuHGuKyrsTftBw8uq+c8jwBolixyevgXDxuS/paRaHuqM0pjqPXIOXkiZtb416ySD+uwMsf
	wra8PaYmreLPkJOJM/zrtt8JlhMGUNB4bukRh08NLK
X-Received: by 2002:a05:600c:818e:b0:4b3:9540:47a6 with SMTP id 5b1f17b1804b1-4b6dff86e38mr52698025e9.28.1793985287188;
        Fri, 06 Nov 2026 09:14:47 -0800 (PST)
Received: from localhost.localdomain ([90.95.39.175])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4b571f46489sm148071985e9.3.2026.11.06.09.14.45
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Fri, 06 Nov 2026 09:14:46 -0800 (PST)
From: Florin Badita-Nistor <baditaflorin@gmail.com>
To: netdev@vger.kernel.org
Cc: edumazet@kernel.org,
	ncardwell@google.com,
	kuniyu@google.com,
	davem@davemloft.net,
	kuba@kernel.org,
	pabeni@redhat.com,
	horms@kernel.org,
	shuah@kernel.org,
	linux-kernel@vger.kernel.org,
	linux-kselftest@vger.kernel.org
Subject: [PATCH net-next v2 2/2] selftests/net: cover odd-sized local port ranges with one free port
Date: Fri,  6 Nov 2026 19:14:42 +0200
Message-ID: <20261106171442.31811-3-baditaflorin@gmail.com>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20261106171442.31811-1-baditaflorin@gmail.com>
References: <20261106171442.31811-1-baditaflorin@gmail.com>
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Post: <mailto:linux-kselftest@vger.kernel.org>
List-Help: <mailto:linux-kselftest+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kselftest+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Leave each port in three- and five-port socket-local ranges as the only
available candidate and verify that bind(..., 0) can allocate it. Cover
both lower-bound parities and repeat allocation to vary the random
starting offset. Use the existing IPv4/IPv6 TCP, UDP, SCTP and MPTCP
fixture variants.

This catches the false EADDRINUSE caused by rounding an odd-sized range
down during TCP port allocation. Without the preceding fix, the TCP
and MPTCP variants fail on both IP versions when the last port in a
three-port range is the only free one. With the fix, all eight variants
pass.

Allow the loopback bind helper to take a port so the test can hold
explicit binds on every other candidate. Retain the existing helper for
automatic binding and run under the existing isolated-network-namespace
wrapper.

The regression test was developed with Codex assistance and exercised
on booted x86-64 KVM kernels before and after the fix.

Signed-off-by: Florin Badita-Nistor <baditaflorin@gmail.com>
---
 .../selftests/net/ip_local_port_range.c       | 67 ++++++++++++++++++-
 1 file changed, 64 insertions(+), 3 deletions(-)

diff --git a/tools/testing/selftests/net/ip_local_port_range.c b/tools/testing/selftests/net/ip_local_port_range.c
index 3d32b33cb..c17d95045 100644
--- a/tools/testing/selftests/net/ip_local_port_range.c
+++ b/tools/testing/selftests/net/ip_local_port_range.c
@@ -44,7 +44,7 @@ static int get_so_domain(int fd)
 	return domain;
 }
 
-static int bind_to_loopback_any_port(int fd)
+static int bind_to_loopback_port(int fd, __u16 port)
 {
 	union {
 		struct sockaddr sa;
@@ -57,13 +57,13 @@ static int bind_to_loopback_any_port(int fd)
 	switch (get_so_domain(fd)) {
 	case AF_INET:
 		addr.v4.sin_family = AF_INET;
-		addr.v4.sin_port = htons(0);
+		addr.v4.sin_port = htons(port);
 		addr.v4.sin_addr.s_addr = htonl(INADDR_LOOPBACK);
 		addr_len = sizeof(addr.v4);
 		break;
 	case AF_INET6:
 		addr.v6.sin6_family = AF_INET6;
-		addr.v6.sin6_port = htons(0);
+		addr.v6.sin6_port = htons(port);
 		addr.v6.sin6_addr = in6addr_loopback;
 		addr_len = sizeof(addr.v6);
 		break;
@@ -74,6 +74,11 @@ static int bind_to_loopback_any_port(int fd)
 	return bind(fd, &addr.sa, addr_len);
 }
 
+static int bind_to_loopback_any_port(int fd)
+{
+	return bind_to_loopback_port(fd, 0);
+}
+
 static int get_sock_port(int fd)
 {
 	union {
@@ -301,6 +306,62 @@ TEST_F(ip_local_port_range, single_port_range)
 	}
 }
 
+/* Leave each port in turn as the only available one. An odd-sized range
+ * must not report exhaustion while a port at either end is still free.
+ */
+TEST_F(ip_local_port_range, odd_port_range)
+{
+	const struct {
+		__u16 low;
+		__u16 high;
+	} ranges[] = {
+		{ 40000, 40002 },
+		{ 40001, 40003 },
+		{ 40000, 40004 },
+		{ 40001, 40005 },
+	};
+	int i, j, port, free_port, fd, err;
+	__u32 range;
+	int fds[5];
+
+	for (i = 0; i < ARRAY_SIZE(ranges); i++) {
+		range = pack_port_range(ranges[i].low, ranges[i].high);
+		for (free_port = ranges[i].low; free_port <= ranges[i].high; free_port++) {
+			for (port = ranges[i].low; port <= ranges[i].high; port++) {
+				j = port - ranges[i].low;
+				fds[j] = -1;
+				if (port == free_port)
+					continue;
+				fd = socket(variant->so_domain, variant->so_type,
+					    variant->so_protocol);
+				ASSERT_GE(fd, 0) TH_LOG("socket failed");
+				fds[j] = fd;
+				err = bind_to_loopback_port(fd, port);
+				ASSERT_EQ(err, 0) TH_LOG("bind(%d) failed", port);
+			}
+
+			/* Exercise different random starting offsets. */
+			for (j = 0; j < 16; j++) {
+				fd = socket(variant->so_domain, variant->so_type,
+					    variant->so_protocol);
+				ASSERT_GE(fd, 0) TH_LOG("socket failed");
+				err = setsockopt(fd, SOL_IP, IP_LOCAL_PORT_RANGE,
+						 &range, sizeof(range));
+				ASSERT_EQ(err, 0) TH_LOG("setsockopt(IP_LOCAL_PORT_RANGE) failed");
+				err = bind_to_loopback_any_port(fd);
+				ASSERT_EQ(err, 0) TH_LOG("range %d-%d, free port %d",
+						       ranges[i].low, ranges[i].high, free_port);
+				ASSERT_EQ(get_sock_port(fd), free_port);
+				ASSERT_EQ(close(fd), 0);
+			}
+
+			for (j = 0; j <= ranges[i].high - ranges[i].low; j++)
+				if (fds[j] >= 0)
+					ASSERT_EQ(close(fds[j]), 0);
+		}
+	}
+}
+
 #define REUSEADDR	0x1
 #define REUSEPORT	0x2
 
-- 
2.51.0

