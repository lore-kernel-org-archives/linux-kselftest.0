Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.208.47
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1793876712;
	b=4TXCPjhduw7wQA0p5irSMJ3W04xE/lXDjOKT3W9q9qz6qcPudrB6HXpJx+3mImQ5Hs05
	 yUEGKTiewIRgQmFlSf4sgqJcci6oL0MQ1C5Ei2LwVvzcntlCcTwdVXQvVjp+yfpmeooSr
	 gNAbokxeAmB0dIC1Wbd1aPmYLQJFzlgWHXZcISZMp/IV/T4UctPC8ZgiqrhqpiqjsUpGx
	 XVHhh2x7oqr+pzo/TngY18ko9dAYfyX4xiHbGT6JoCwBIik0V71SZFoTyHAmt+jUKllGi
	 49YiJWiKTaz43sCqFOMJvUSztyxq1jIOCbEnx7kJgt+oBYl68SpLO6WFaVjvpPkcU9Q==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793876712;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Received:Received:MIME-Version:Received:From:In-Reply-To:References:
	 Date:X-Gm-Features:Message-ID:Subject:To:Cc:Content-Type;
	bh=EACSeKrdz4bGKRBeWmqR524LYko7JkqQI6iv01qT4ws=;
	b=Ne0bUOwDSiLQtk2VPGzIfGu45dufWjjJxaQ2JwQNCQLGMuITtbAOkKtq9vURlYFDH3cI
	 zVViP+IzZr9EQq+5pWDwc9W3PeYaXf8X6/LcPmoT/N7Pgj9D3OK48aTUgNB8DkD+oYR1J
	 u3zoLPKPE69kl3D+RC2qNeDrPnrC4iKDxUmq7yg985K0nzknBjuse1GRmjj7+lj0uE05q
	 ik4o0McgAY8JqO/bZldGbkO0Qr2Woj0Eqs9tCAGYz44YrvdGIwkT3HBaVdbjgp49x2zcu
	 IWa5FZmUaO5MMYFw69ljPTmA1uaVCK6rf9f2mt9CkFf2Yyywm8Ma0qbrzC6l8BD5gRw==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=UwQBFCRf;
	arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.208.47
Received: from mail-ed1-f47.google.com (mail-ed1-f47.google.com [209.85.208.47])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DCC83606A326
	for <linux-kselftest@vger.kernel.org>; Thu,  5 Nov 2026 11:05:11 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org DCC83606A326
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=UwQBFCRf
Received: by mail-ed1-f47.google.com with SMTP id 4fb4d7f45d1cf-6b56c428212so1387887a12.2
        for <linux-kselftest@vger.kernel.org>; Thu, 05 Nov 2026 03:05:11 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1793876710; cv=none;
        d=google.com; s=arc-20260327;
        b=Kbi/SpwDYvgniH+D1hR72/t+/4iRSfCTf9dsqOkpDxk1i4e//75nR4ae3Al5a2zyzu
         eXm8chFPupgvcd/jzwVvNkwqt/MmOYVN/CGuGZoSWlUBAQ81dCgmVDWdZTPRYoNggwDt
         O1q9rZrHtp+k+H4UpuPYQ8sLXy8a8zvhs5URVh+q9S00oPj1jblnZHhrEkX41P8E6HSL
         5xCNkKyMFlib+PvhXgPuu4pNnqzwGnlFdEOrGU5U6805HRclSKiZG2h0hfzgQM39+XVg
         xGw0yP6ruALuGux3ZlSobZxy+p2LgCHS7vBurqParhKNU3nNR50dgc6OJkKXvfr4EoMP
         3+3A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:references:in-reply-to:from
         :mime-version:dkim-signature;
        bh=EACSeKrdz4bGKRBeWmqR524LYko7JkqQI6iv01qT4ws=;
        fh=OkiuhXGAcJb3PCezRIWqaWrI+0dn9Ed9paYUJgJ58N4=;
        b=JuAMRd/m9XNjDD+Ab00wOoTOmHfH0n7X7H49hqlWzS90bauLmHzwoSyPIdfyNRB1KV
         xxYe59UBBnGt60ktRAVHGLwJVyM64ua3XLriy+/nrVQl8ouBWjNLA4sk+g2DKppFmHC6
         NcMyER3bsUPJiZKetQHnODRvq41+3jbH6IPiwmy/smJVVEdTkO1dgGygEHSO84CWUuAj
         QnuH2X5sXYlHgPg/qLvt4wfWoTuizZJfB96gyHRMWk3F5NXJxqPkP4RNIhZwtx7q/rgx
         4F0hqggN4HraIRxTQVh3wmVWUGtsoozwy3pvHuUYz/8sVYKhWlDtBK0V2fzP/YtlR18q
         Y0vQ==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793876710; x=1794481510; darn=vger.kernel.org;
        h=content-type:cc:to:subject:message-id:date:references:in-reply-to
         :from:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=EACSeKrdz4bGKRBeWmqR524LYko7JkqQI6iv01qT4ws=;
        b=UwQBFCRfxFQORo86l7fky65QmFyk5pZq5nf5Gb1HJMrfA1MqU9tR+cmYRR0Z38XIi3
         eeU8i43UkNv0A+eQu1Mrsa934JL5FU7W2ePK8v3eUsDKU/DM/Bvix9pxLBoN3IJuDIcN
         JlQ3r4aWf+s3JdEAsPAdeje+JAttZ+8Pfz/TMNFuK+lUHEBYk3x3DPMMWzq38dXE/CRb
         jQ0NOwlS9JTD/YM+dBUagabK/67ZjyFU9LyabVfN9WqKeUfTAYOhHTncNSIx8oYO7Nl1
         0Gw2EisIskxJCULQNQrkdUGtV75wFy0dD8b686SCbNPhqCAwuIJqeGnvbYefGUVGO3nz
         og5Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793876710; x=1794481510;
        h=content-type:cc:to:subject:message-id:date:references:in-reply-to
         :from:mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=EACSeKrdz4bGKRBeWmqR524LYko7JkqQI6iv01qT4ws=;
        b=h45k31OZpcCvpQHHor0Ax2L4OhDIN9JamZtgbMJ44zZuCJ84E4Mq18GCjdCDmG91La
         vN39MoqWbS9CRZv6qI3rf1ddaBsK6YMmgd6+W0aOpdFqiA9QgqepDc6jsYEZEIIjpQ/w
         ToYSSl+X+QoU89yG0HEojmnDb0Ri0RkT5F3x3xhkluAli6Al30nJM0gkFA9Ye2aT3nOZ
         FLQKacI+ccnQDHtLWb2c4RYP9NmyQUL5EhkZ3KVLHotyM8fOvbXn24H4HHFQBCvc9NP9
         8fYlq5al8mG/U2MmW9y/tN9JGg3rN+VN/HIulwdx0L+TWx7q0HYHxshCA1HwG6uSVwMj
         XxxQ==
X-Forwarded-Encrypted: i=1; AKwUvBzaljdJvvIJ31W7rM9OPyv8hrDrh6ZS61iO+ymqrD45SKEPkSWBosDddFKTYvNDsi++2gOTnPo50OG1tEY+gR8=@vger.kernel.org
X-Gm-Message-State: APuU4Z/UWcGX9z59S8vaS0Ttkjdw062thMz7Cue5bj8BWUNoqYCuyirl
	Mnpzi9JMxNQOGbh9Y5AUWNUY4+nJV1OLniEYdbglNw2KrAO1dmO9FxJdXh8xN/OMAxgmI/3oUTY
	l7Q0rBXz4u1SyeJTWnSTWl3/MkID9MrU=
X-Gm-Gg: AYBFou3n4NaURLoYBse0RzXlThKSLw5qXHlzr/fsHyaOB/LQshgiZLLH4gwoBgtdDWf
	VCLkMaZT159c3XcUKBjLL2OeyN7G2rvPRbiUUjnRqUarOoRIn1+XLF7BBLPq3dZy0YGD0R0rt2O
	4Y+cV0apnz9hKtiRtRoTxJ4mEdNqqrueRXv/fT/20FbuN7n3M6lr6IkfzNL07vL6OuhYbSltG5M
	EOX0zwXBXzGgpKX70BOqKEEZZeXnR+orPn7Jdb5PZ1HiZAcvsWXA8gKmeOZ5125rletQxlk09Ya
	rbvTOcC8CxGNNyUVVhhncbZTSGkN7UAItBya6uOYX+dq3Ghl4l3FU+i+JiY2DjT07UOWJ6HQnFk
	GmeUvYSQrtnIE7qMnLPhHNC41Hb9RKl0m//HedhP9JPsuZ9Zui0g2+WZuMhGfWaEwVuAxyQvraR
	qAtnJFv3CL47w5KD2BhHjVXEUxYij/zRCYmuib4LoRvj+AvJjz1z/eXSTVHdkHagOCtOJwt1JUg
	PZy3wejuSsC2gzocg==
X-Received: by 2002:aa7:ca5a:0:b0:6b1:d2ee:392f with SMTP id
 4fb4d7f45d1cf-6b4d4d7456fmr10223394a12.25.1793876710202; Thu, 05 Nov 2026
 03:05:10 -0800 (PST)
Received: from 77377267392 named unknown by gmailapi.google.com with HTTPREST;
 Thu, 5 Nov 2026 03:05:09 -0800
Received: from 77377267392 named unknown by gmailapi.google.com with HTTPREST;
 Thu, 5 Nov 2026 03:04:57 -0800
Received: from 77377267392 named unknown by gmailapi.google.com with HTTPREST;
 Thu, 5 Nov 2026 03:04:14 -0800
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Post: <mailto:linux-kselftest@vger.kernel.org>
List-Help: <mailto:linux-kselftest+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kselftest+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Received: from 77377267392	named unknown	by gmailapi.google.com	with HTTPREST;
 Thu, 5 Nov 2026 02:57:56 -0800
From: Florin Badita-Nistor <baditaflorin@gmail.com>
In-Reply-To: <CADnh+D0zSzAyYCLo5cXU56o9X-P3RG3N2ix7ARPrP95d8sBXmg@mail.gmail.com>
References: <CADnh+D0zSzAyYCLo5cXU56o9X-P3RG3N2ix7ARPrP95d8sBXmg@mail.gmail.com>
Date: Thu, 5 Nov 2026 03:05:09 -0800
X-Gm-Features: AclHuK9ci3ISHKdlFTJfWL5UQTii2K6y9JcFzosGDRAOWFRE1BZCZMqATJw5ROk
Message-ID: <CADnh+D1CH7yU2fsnoKBnLUSgDdFmWCivS31PQHfDqxUptp9aiQ@mail.gmail.com>
Subject: [PATCH net 2/2] selftests/net: cover odd-sized local port ranges with
 one free port
To: netdev@vger.kernel.org
Cc: edumazet@kernel.org, ncardwell@google.com, kuniyu@google.com, 
	davem@davemloft.net, kuba@kernel.org, pabeni@redhat.com, horms@kernel.org, 
	shuah@kernel.org, linux-kernel@vger.kernel.org, 
	linux-kselftest@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

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

diff --git a/tools/testing/selftests/net/ip_local_port_range.c
b/tools/testing/selftests/net/ip_local_port_range.c
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
