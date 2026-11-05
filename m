Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.remote-ip=209.85.208.41
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=fail;
	t=1793876689;
	b=uwmU0eDHbyRLr6JpZEMBAggkdxps8+UcJBE/6Xn0r7jN08xWcL4zgmD3gPV88OQwK+VB
	 iGyHJCEWKXRIdlyvBgSiRhFPiGyu8Fv5C02gu4YdIxGy/um5EvrQOUoHzxlH7N1OhQ0/5
	 FKbUTHat/sjMiBCnX6yvNyeaLpSt1bIZFFDodimi77WfbcShoVjMNdfJvOD8AQyspZ52R
	 tWMDHcYuP3WYQ9wijsEWofvW79lIVaGORdhJmBnhhabYDtSdDTavEXrTG9wqOQZDX6JQ+
	 KcPPgYH6TyJPEPvPE8WVw5EVuPvWUB68EGsJrD2NPeB+aNCyN69wQjeNxkfZFgZUV6w==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793876689;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Received:Received:MIME-Version:Received:From:In-Reply-To:References:
	 Date:X-Gm-Features:Message-ID:Subject:To:Cc:Content-Type;
	bh=0am8CfLTgv92qkgop5G7IfmmvPUqaNxO/vuHRyrSZqw=;
	b=4wLlHVPOCQ/4sIph9LGWFW2xzgbuqDSQPj+uYcI8qZ4vuqLt022/K/siuXWzHCMyAZjm
	 GAnkkyMQxz+2E1rRL1w03yfWPponAgCDAbowAl6zR9F6Ze/U1Gy0AEjQHmwOUVVPVIm3i
	 +KXj7HNGQKwpVN/ko2gp2CnWJLJ9Ak2eR5set5xm+nBuFQa0YEvvyMdVqvYbz1aRXXh5s
	 HUE1uNIn9PQXr02eWPqFntgb/cafG/VrfgJb+Ng29HBNEygDOToeHW8bkYwT4YYU4wcG2
	 yonWMt1pn9wps8T4tcO1IpJ1F8GZKFmay2lnBbdp2XOE317Jsb5xpcBEevrhOcHeM5Q==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=b1PlvSnv;
	arc=fail smtp.remote-ip=209.85.208.41
Received: from mail-ed1-f41.google.com (mail-ed1-f41.google.com [209.85.208.41])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 565D6606A328
	for <linux-kselftest@vger.kernel.org>; Thu,  5 Nov 2026 11:04:49 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 565D6606A328
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=b1PlvSnv
Received: by mail-ed1-f41.google.com with SMTP id 4fb4d7f45d1cf-6acb9c018ffso898884a12.1
        for <linux-kselftest@vger.kernel.org>; Thu, 05 Nov 2026 03:04:49 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1793876688; cv=none;
        d=google.com; s=arc-20260327;
        b=CWvy4gHH2wep2bFvwcyxxEPxOIuUrpxnLQgdPzZ0TOQxd7bbeKb+KMvAYBBhvA8wDm
         gYQeveIwTfxFjVsiiIso9vR4l2icEHYgVSE66OvaHlITjCKbzpzaumtXopPGkC+MU9vz
         uvGyqlnPvQ7Lt38ZddX1kcJQFw8JiIpk02Z9vpzLnYkln3ftKlb5ELX6xDMcXcuBWaI9
         lFGDzF0lHuo59QoG6wWQzEdNl78gaFViNA4vg9DMwGST2/6O96X63GkkioVW1w3U5CBu
         FyKxJZbV5VFHfIjsNlUBHa2F2v3u9DviE1C3WPgZ2qpSbeypojS0twfjfzPrgXoFkhM8
         AFEQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:references:in-reply-to:from
         :mime-version:dkim-signature;
        bh=0am8CfLTgv92qkgop5G7IfmmvPUqaNxO/vuHRyrSZqw=;
        fh=cvu9jyEK9bc1NCt5zl1uMLI98VMr1bhf0FV7kk0iz7k=;
        b=NPbbMglw2TBTP7EQUcIklkneAV1z1nw6jtwxfV0mqhqZxfFOHQ9MHK59HIY5D8Y9xT
         18N9iN+daa/uU4fsECY5QqOBtYmYygTPSbMJRMAt3RRQJBDIw7qKUM+u6rHh6boHDbJl
         aZYb5Jt3q2Oj7GOp0G8XsAkpGlkOaKYaxVHGWXFZKuOc3w5DINQ4ffyw5sJ/Y8hEnV8M
         BfKdz9QEiTPDX6z7CmGydT9Nkkj8u8kTr5FN3FhgBNbTaYaDybWHwWmqDJZxXMdgmMBx
         zBSzWGQmNwC2YUp+Qd78yhd4V/cqGiNYNeO4u7C4SSptkuyz/v0iAt80qGnoGPHq87MF
         DeAQ==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793876688; x=1794481488; darn=vger.kernel.org;
        h=content-type:cc:to:subject:message-id:date:references:in-reply-to
         :from:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=0am8CfLTgv92qkgop5G7IfmmvPUqaNxO/vuHRyrSZqw=;
        b=b1PlvSnvndvaZQXsu8PAy4yevw7hV0/nJeaKI7uWTPJjANe+cSJUoyFhDheZjkMPON
         Gpq2TLF5sZHYJC6MeRwCp33wmE5/YK8jm7Kozc4HAKBY8aLyk6TmEdoClGIVNzCJEXy6
         LO7JUMRpgYoSqfA6c/eGRgTL/ZZjeVhp3y3mPBOI8Bh+sMXeLUV8MbvfprFiwHdRqRE+
         3u2znYOuR2n2iOUSLYFPhA5OVfrZMR9KY5sokvZI4/z0THslW+CDXmfnH6WXYOtHqBgK
         F6dgEbmqptVpUrrkes75CgdmCu7vmoYE4i7E6AV1H/B2HDVS8sTrJgwQllSEgZUB+t3P
         EO0g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793876688; x=1794481488;
        h=content-type:cc:to:subject:message-id:date:references:in-reply-to
         :from:mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=0am8CfLTgv92qkgop5G7IfmmvPUqaNxO/vuHRyrSZqw=;
        b=irOvKQotc53OUHkQZAhSIpFpro4Ku8skf/0UsVrj06dx1Uj9XQfMvmjO+cmMXtqwum
         V0oyqAeTdMxeAqesT5zSexCWON7hFeQFbZumuIsSBSQLgwt1JYR1seHSUcMYY16kWg02
         boH+iGvrVIBcgScdFDJWEGSNChDCUZBqEclk1Bd92LS45N89cQxonnqfZUvpaJoadWCO
         wCDLKRUFYT3S/JMGolrL3EZFzGQRpFapVLp8HaVE7tqfl4dh3CsdILNwZ2ribjUbJfjb
         QSreknPAUdB7suUA0TXUYjnwC/41k3d1bfA7e9MXkWhOFYFVRC9EIkixUUTFfST2W3PN
         FMDg==
X-Forwarded-Encrypted: i=1; AKwUvBxOHuGehNLsXLLdaorL8+M+VRi0nirP5QCHY5QL7Q3ovs81Wj0oscbu3UGElnvhidpSWnotUR653VXorpjK9Ac=@vger.kernel.org
X-Gm-Message-State: APuU4Z+VhQfaiomvuV4LgfxZya72+pi0yprLjJi7LuWHv3XG6EcHY90l
	U1uHYg/MZ86e2a9w8DQJGb0BHiS1VA/4cO3tzIfYfhiJnzQn+IKn8LcagYXOufGTMI3mXkxMsIe
	8ZFVcsqFyU5TcG5TgMhwH9QvnfiqPLMXVHsP7
X-Gm-Gg: AYBFou2swRxwVv8x8QlZD/LZsv8lYShr15hzObN3SujNSyQ3xVB+pBRLgRA+Iac1fLI
	/a9UwDqLbUADmNRUwgNfyr5MgbcnZ295HL31Z3JZdfo48P7QRkTUaR1K+8IMoBJL7jEsw5yDYnN
	Dz1lTlard3jWz7xgc4Ftgr4j6kTzLEE2g5G6GCrxwoEYuPv1WymtD1xR8lC3qDJk/3CIYDT/Q0j
	xnSJMOEgvxRjmKtsgxTXT7i3eGqy1A6HEFjXYBn2QO2Im80PU3NlktY6n+8O/DHO3ODRlBTmL/5
	olRJuG/hV2nqc8eTgZctwjgZINROkgj1tHRR/vPBtP3zCyHV7pK3z1oPzofLdJGOz/j545stsBu
	ZuCzzcDLlykqeArwkW8fZ4lqQE/B23ByKqBhf7Avwx+9KV90lAgSWcPlUOvGMhT370VAiO36nwz
	rbEA3aWigwiPuRAwER2OOPc0+4l+ysEpWMLlJ5JZSbc7s6diaiXl/uijDXSCWsD833YBB0dyy2h
	d3S/UwB6fYxVllfpw==
X-Received: by 2002:aa7:cfcd:0:b0:6b3:cfa0:77cb with SMTP id
 4fb4d7f45d1cf-6b5777268f1mr1117005a12.10.1793876687591; Thu, 05 Nov 2026
 03:04:47 -0800 (PST)
Received: from 77377267392 named unknown by gmailapi.google.com with HTTPREST;
 Thu, 5 Nov 2026 03:04:46 -0800
Received: from 77377267392 named unknown by gmailapi.google.com with HTTPREST;
 Thu, 5 Nov 2026 03:04:40 -0800
Received: from 77377267392 named unknown by gmailapi.google.com with HTTPREST;
 Thu, 5 Nov 2026 03:04:13 -0800
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
 Thu, 5 Nov 2026 02:57:55 -0800
From: Florin Badita-Nistor <baditaflorin@gmail.com>
In-Reply-To: <CADnh+D0zSzAyYCLo5cXU56o9X-P3RG3N2ix7ARPrP95d8sBXmg@mail.gmail.com>
References: <CADnh+D0zSzAyYCLo5cXU56o9X-P3RG3N2ix7ARPrP95d8sBXmg@mail.gmail.com>
Date: Thu, 5 Nov 2026 03:04:46 -0800
X-Gm-Features: AclHuK8JAKDvSsOv_WcYjMNCz8gzZNtzoHji_gLTKVDuZBc4kV7FsgmeUAtGpZU
Message-ID: <CADnh+D3nz5aehxjvurK+Fv7gF6n4csMm-dFatvdMmg1fWdGSQg@mail.gmail.com>
Subject: [PATCH net 1/2] tcp: avoid false bind exhaustion with odd-sized port ranges
To: netdev@vger.kernel.org
Cc: edumazet@kernel.org, ncardwell@google.com, kuniyu@google.com, 
	davem@davemloft.net, kuba@kernel.org, pabeni@redhat.com, horms@kernel.org, 
	shuah@kernel.org, linux-kernel@vger.kernel.org, 
	linux-kselftest@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

inet_csk_find_open_port() rounds the range length down to an even
number but keeps the original exclusive upper bound for wrapping.
For an odd-sized range, the two scans can therefore miss a valid port
and return EADDRINUSE while an eligible port remains free.

For example, restrict a TCP socket to IP_LOCAL_PORT_RANGE [40000, 40002]
and hold explicit binds on 40000 and 40001. bind(..., 0) always fails,
although an explicit bind to 40002 succeeds. Both IPv4 and IPv6 TCP and
MPTCP are affected. A namespace-wide odd-sized ip_local_port_range can
also trigger the failure without a per-socket range setting.

Keep the full length for the scan bound and wrapping. The two scans
then cover every candidate in an odd-sized range, with at most one
repeated candidate when exhausted. Even-sized candidate sequences
remain unchanged.

The issue was triggered while developing port-range selftests with
Codex assistance, then confirmed using userspace reproducers on
unmodified kernels. No kernel instrumentation or fault injection was
needed. Booted x86-64 KVM kernels were tested against the regression
selftest, the full ip_local_port_range suite, and a Go net.Listen
reproducer. The Go reproducer fails 100/100 times per IP version before
the fix and 0/100 afterwards with a three-port namespace range and two
listeners occupying its first two ports.

Fixes: ea8add2b1903 ("tcp/dccp: better use of ephemeral ports in bind()")
Cc: stable@vger.kernel.org
Signed-off-by: Florin Badita-Nistor <baditaflorin@gmail.com>
---
 net/ipv4/inet_connection_sock.c | 2 --
 1 file changed, 2 deletions(-)

diff --git a/net/ipv4/inet_connection_sock.c b/net/ipv4/inet_connection_sock.c
index e56beec43..755fcea35 100644
--- a/net/ipv4/inet_connection_sock.c
+++ b/net/ipv4/inet_connection_sock.c
@@ -343,8 +343,6 @@ inet_csk_find_open_port(const struct sock *sk,
struct inet_bind_bucket **tb_ret,
 			low = half;
 	}
 	remaining = high - low;
-	if (likely(remaining > 1))
-		remaining &= ~1U;

 	offset = get_random_u32_below(remaining);
 	/* __inet_hash_connect() favors ports having @low parity

base-commit: c6b41de4dd9f2d6856d8d8d292348f7961034152
-- 
2.51.0
