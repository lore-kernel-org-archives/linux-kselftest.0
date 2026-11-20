Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.217.54
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795196629;
	b=oAK75FxnPd040ZlxF6fdjFZ0pxIaFh9164UaUjRxHiEwgMIkC2lUSOCvxnlj9IQZLUsL
	 9oZ0oZ1eKU0Ux02oHo+Ac992UQ6sLPAuDEDXW6RMVf+3tCSvDhU6+qhcCl5lJuFPRnAFO
	 h03jCmskuENiUBik5Sa+IjiTzto+FOzXZVcJJFYFA80OWmux8fRm0Lt77cy11tRfyQ3lQ
	 gyuOGeWK/xNDxl79aapzwRoeODqQyqzuKC0fBx9AWIps47o6hWe+peE7vd7VE0NZtqEwS
	 oUF8tXEV4yab5zNHYuYRFE5NJnzoTrgEl/PwBTF2WHQLYBJGxI7e20sVcj0PRp+cojg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795196629;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=v7KGyIjjX8jZtUtHgLg9K/kkFR1h+yrC9ZS5X10Hz+M=;
	b=OpgATsDwDnTaSCk2wENVruD4EFj+i4wu15sKa8vzhrhpBJ83qqVwy43Pp0kg9wD+ubIN
	 WKVPOMFCishTqRDisAtdAAaY126g+KKUYI6s6juoia6O/ltjc93hhWVpmPYF8QWXcjWqU
	 WGaZA1VuRoM9kHe11l6OnHLPW2K1ekIyQWn1lVYtX0PvQ/YL8ro+LU9lHY8oBJljtEymg
	 MfGZODAQkBnepxkK/gmj5Zz3v5XaoqedLroheI7A+w5RXRi0mMXXBgqYjQ1TlZo0sLi9H
	 B61r1ZkGR/uzXLiFBL2OFg9ci5s0BEiV94JThzrYoMag2QN1D661Jz+/6939vHQ0h8Q==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=A6xI3fT1;
	arc=none smtp.remote-ip=209.85.217.54
Received: from mail-vs1-f54.google.com (mail-vs1-f54.google.com [209.85.217.54])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EC785606A7FE
	for <linux-kselftest@vger.kernel.org>; Fri, 20 Nov 2026 17:43:47 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org EC785606A7FE
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=A6xI3fT1
Received: by mail-vs1-f54.google.com with SMTP id ada2fe7eead31-77bf892b496so432371137.0
        for <linux-kselftest@vger.kernel.org>; Fri, 20 Nov 2026 09:43:47 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795196627; x=1795801427; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=v7KGyIjjX8jZtUtHgLg9K/kkFR1h+yrC9ZS5X10Hz+M=;
        b=A6xI3fT1lI8DKPJhlyClzuqgbSyUXbUKKP5S3dMl6Icz57s5HODVzTDdw4sdaPLsmS
         hNYEY1v+ZNq/AFAx6FoYKJOvIbBPdntq5z4+hdJdmHCN7m33SXREUCaIY1Qxjvo55Ynb
         /ZxrGyFlN76Ei6SUku+eUs0e5JEwWRdqHFie9/55QHAZD/p6sdJVXo7KIvSOecSPhWwk
         x6IiIc6nb378CNK3LnsbGLZNRDG/e2IjX3B/ZleCRaHLRxdvvoHs4x2TtB4pPJj079d6
         2AmlAr0MPJCW/uf3NP7PFuutwfvtfabMiCTKGHm1ycSSg7B26WU7Qo20ZXMhiEQrjeFl
         exig==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795196627; x=1795801427;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=v7KGyIjjX8jZtUtHgLg9K/kkFR1h+yrC9ZS5X10Hz+M=;
        b=G3mSHFvGwf1EamQPxII1R7P+Ve7oTs9pzr8NDYHQ2DsclzjzaHjItBoP9ArZFSaf/M
         ghbN1Sp7NVnqkSHibA0JyR9oqJGrXDTu/ha2MK+A+oOcqMS1GqJg7GTb9y31BfVjBgUa
         AkpfQlby88BUJQeKdvEoGDfalEtYxhJto3MjtwZg+eXzBaiI8r/WG14QGZleqWOu5ygO
         yy0hoDpD0gE8MgpQP4FEaKCrpFz9aOtgMrH7qzZg1fH0tlfPpJa9nXlimztcGG/nZFE2
         FRl6Gzd3ZaaHXXNmrr3J2z5CcioN9ST6kkml19gcs627IrKEKncTethR7fQn4OedvLc+
         sgjg==
X-Forwarded-Encrypted: i=1; AL+hErEf69JWENVjZb8zELlzKQu+OpVoT+QPIQ2Y7lVbSyn4kLyroTkoAkhVDqQDUVXA4cfrSitsvGkD+P6Qy921rAM=@vger.kernel.org
X-Gm-Message-State: APuU4Z+tW3KRrVDoigSFruW6h7MBv0Ej2dcPa/ClQaayRSiqQViVMEry
	n6sB3G+D340AxTvBOWBNHic8HArNn/DpSlHstJjzKh2gZaD8lEX+JSyq
X-Gm-Gg: AZFdTZckyZR4Bga8Yi9WxBHbqgudD7W0RF14/WTjD2nB4hh7FV6azjaV3PqRbPNFtdx
	qrQLkUL2aT8aVGnUVH2TdLDTBmQEbeu6LoGZNHAcGzn3Cq3lP/mzQUrld7iMWHGlnp3VNiBOdOW
	07SLCqGmTzDzcQ3C1KsvyFZ0kpule1JNkN3NwTTJlYo98fUw3h93i+YKsLMF2w8rVOoukZIoRWO
	gDWvzZzZuaQvz9DmUvHlbysEBSr/Vm4NNUDsSuq2yKos1CmEwKjZ/yz9L/wjbyCrXHr/3Ru23sv
	7S92UPATftw3P7eADq1KR2wyCVDEW12GpnCuRMj1eQlxSC4usvjAY17sclgFHWSmwmcJUOeY1Lo
	l07RaJpTZMBufbuefhsehEA4oxMT3kWIffdxsjrBWOS4/OWTHRLSB4F4Ua5w2gnW0PjswrCVZJi
	omiZcV2dBZtEOp8hr6FaMpdQvw5e13nMZoqsbSsUYPahTxvacyHnEgDBiJLkxwpjT5rz1SqMmDT
	dVdKPuGt2o4hrD6yZYAb0WV52vN8IZbzjhImN9K746hJKsVDkx3F+1+4RruDLI/+JTToCQTdNcH
	AWmTOtk3XPix0/SC7/kgUQhycj8xue2LSv0ae6Ptq0An177ho0hJe7mNFVRipy/rBvGoPTnuW2I
	bkyhdm1UAkmg6uIA=
X-Received: by 2002:a05:6102:41a3:b0:7d2:754c:23e7 with SMTP id ada2fe7eead31-7d7396d1b09mr1556174137.35.1795196626639;
        Fri, 20 Nov 2026 09:43:46 -0800 (PST)
Received: from localhost.localdomain ([2603:9000:d440:53a:a9cf:4432:7fb7:e8])
        by smtp.gmail.com with ESMTPSA id ada2fe7eead31-7d6e7d784b3sm3571363137.2.2026.11.20.09.43.45
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Fri, 20 Nov 2026 09:43:45 -0800 (PST)
From: Juan Agustin Niccolini <juanagusnicco@gmail.com>
To: "David S . Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@kernel.org>,
	Jakub Kicinski <kuba@kernel.org>,
	Paolo Abeni <pabeni@redhat.com>
Cc: Simon Horman <horms@kernel.org>,
	Kuniyuki Iwashima <kuniyu@google.com>,
	Willem de Bruijn <willemdebruijn.kernel@gmail.com>,
	Willem de Bruijn <willemb@google.com>,
	Eric Garver <e@erig.me>,
	Shuah Khan <shuah@kernel.org>,
	linux-kselftest@vger.kernel.org,
	netdev@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH net 3/4] udp: Ignore a connect()-set device in the bind conflict check
Date: Fri, 20 Nov 2026 12:43:40 -0500
Message-ID: <20261120174341.35873-4-juanagusnicco@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20261120174341.35873-1-juanagusnicco@gmail.com>
References: <20261120174341.35873-1-juanagusnicco@gmail.com>
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

The bind conflict checks compare sk_bound_dev_if, which connect() also
writes, for a link-local or multicast IPv6 peer.

This is only safe if the device is the one that bind() reserved. A
socket bound with no device holds its port on every device, but while
it is connected to such a peer it looks bound to one device, so a bind
of the same port on another device is admitted.

As a result, an unprivileged user can bind a port that another user's
socket holds, and receive the datagrams that arrive on its device once
that socket disconnects:

  victim:   bind([::]:P), connect(fe80::1%eth0)
  attacker: SO_BINDTODEVICE(eth1), bind([::]:P)   /* should fail */
  victim:   connect(AF_UNSPEC)

Compare the device that bind() reserved instead: none for a socket
whose device connect() set, which SOCK_CONNECT_DEV records. A VRF
master that connect() narrowed to one of its interfaces does not get
the flag and is compared as before.

Note that the checks read the flag without the other socket's lock, so
it is ordered against the device with barriers: seeing the device
before the flag would trust a connect()-set device again.

Fixes: 1da177e4c3f4 ("Linux-2.6.12-rc2")
Cc: stable@vger.kernel.org
Signed-off-by: Juan Agustin Niccolini <juanagusnicco@gmail.com>
---
Notes:
- A connect() that sets the device and is undone again, both between
  the two reads of the flag, can still be seen as a bound device, so a
  conflicting bind can be admitted. Not fixed here because closing it
  needs a sequence count in struct sock, a larger change for a window
  that the other socket's owner has to open within two loads.
- connect() also narrows the local address of a wildcard-bound
  socket, which opens the same window through the address. It is not
  fixed here: connect() moves the socket to the secondary hash slot of
  the narrowed address, so a specific-address bind on a busy port never
  scans it. Closing that needs either a full scan on every bind or no
  rehash on connect, which slows down binds or lookups on busy ports,
  so I leave it for a separate patch.

 net/core/sock.c     |  2 ++
 net/ipv4/udp.c      | 46 +++++++++++++++++++++++++++++++++++----------
 net/ipv6/datagram.c | 12 ++++++++++--
 3 files changed, 48 insertions(+), 12 deletions(-)

diff --git a/net/core/sock.c b/net/core/sock.c
index 5ce4aefc514d..48ec344a3a8b 100644
--- a/net/core/sock.c
+++ b/net/core/sock.c
@@ -650,6 +650,8 @@ static int sock_bindtoindex_locked(struct sock *sk, int ifindex)
 
 	/* Paired with all READ_ONCE() done locklessly. */
 	WRITE_ONCE(sk->sk_bound_dev_if, ifindex);
+	/* Pairs with the first smp_rmb() in udp_bound_dev_if(). */
+	smp_wmb();
 	WRITE_ONCE(sk->sk_userlocks, sk->sk_userlocks & ~SOCK_CONNECT_DEV);
 
 	if (sk->sk_prot->rehash)
diff --git a/net/ipv4/udp.c b/net/ipv4/udp.c
index 9f1f45afee53..a13bf32cbdb9 100644
--- a/net/ipv4/udp.c
+++ b/net/ipv4/udp.c
@@ -131,11 +131,35 @@ EXPORT_PER_CPU_SYMBOL_GPL(udp_memory_per_cpu_fw_alloc);
 #define MAX_UDP_PORTS 65536
 #define PORTS_PER_CHAIN (MAX_UDP_PORTS / UDP_HTABLE_SIZE_MIN_PERNET)
 
-static bool udp_lport_same_bind(const struct sock *sk, const struct sock *sk2)
+static int udp_bound_dev_if(const struct sock *sk)
+{
+	int dif;
+
+	if (READ_ONCE(sk->sk_userlocks) & SOCK_CONNECT_DEV)
+		return 0;
+	/* Pairs with the smp_wmb() before SOCK_CONNECT_DEV is cleared. */
+	smp_rmb();
+	dif = READ_ONCE(sk->sk_bound_dev_if);
+	/* Pairs with the smp_wmb() after SOCK_CONNECT_DEV is set. */
+	smp_rmb();
+	if (READ_ONCE(sk->sk_userlocks) & SOCK_CONNECT_DEV)
+		return 0;
+	return dif;
+}
+
+static bool udp_bound_dev_overlap(int dif, const struct sock *sk2)
+{
+	int dif2 = udp_bound_dev_if(sk2);
+
+	return !dif || !dif2 || dif == dif2;
+}
+
+static bool udp_lport_same_bind(const struct sock *sk, int dif,
+				const struct sock *sk2)
 {
 	return sk2->sk_family == sk->sk_family &&
 	       ipv6_only_sock(sk2) == ipv6_only_sock(sk) &&
-	       sk2->sk_bound_dev_if == sk->sk_bound_dev_if &&
+	       udp_bound_dev_if(sk2) == dif &&
 	       sk2->sk_reuse == sk->sk_reuse &&
 	       inet_rcv_saddr_equal(sk, sk2, false);
 }
@@ -145,6 +169,7 @@ static int udp_lib_lport_inuse(struct net *net, __u16 num,
 			       unsigned long *bitmap,
 			       struct sock *sk, unsigned int log)
 {
+	int dif = udp_bound_dev_if(sk);
 	kuid_t uid = sk_uid(sk);
 	struct sock *sk2;
 
@@ -157,14 +182,13 @@ static int udp_lib_lport_inuse(struct net *net, __u16 num,
 		    sk2 != sk &&
 		    (bitmap || udp_sk(sk2)->udp_port_hash == num) &&
 		    (bitmap || !sk2->sk_reuse || !sk->sk_reuse) &&
-		    (!sk2->sk_bound_dev_if || !sk->sk_bound_dev_if ||
-		     sk2->sk_bound_dev_if == sk->sk_bound_dev_if) &&
-		    inet_rcv_saddr_equal(sk, sk2, true)) {
+		    inet_rcv_saddr_equal(sk, sk2, true) &&
+		    udp_bound_dev_overlap(dif, sk2)) {
 			if (!bitmap) {
 				if (sk2->sk_reuseport && sk->sk_reuseport &&
 				    !rcu_access_pointer(sk->sk_reuseport_cb) &&
 				    uid_eq(uid, sk_uid(sk2))) {
-					if (udp_lport_same_bind(sk, sk2))
+					if (udp_lport_same_bind(sk, dif, sk2))
 						return 0;
 					continue;
 				}
@@ -184,6 +208,7 @@ static int udp_lib_lport_inuse2(struct net *net, __u16 num,
 				struct udp_hslot *hslot2,
 				struct sock *sk)
 {
+	int dif = udp_bound_dev_if(sk);
 	kuid_t uid = sk_uid(sk);
 	struct sock *sk2;
 	int res = 0;
@@ -194,13 +219,12 @@ static int udp_lib_lport_inuse2(struct net *net, __u16 num,
 		    sk2 != sk &&
 		    (udp_sk(sk2)->udp_port_hash == num) &&
 		    (!sk2->sk_reuse || !sk->sk_reuse) &&
-		    (!sk2->sk_bound_dev_if || !sk->sk_bound_dev_if ||
-		     sk2->sk_bound_dev_if == sk->sk_bound_dev_if) &&
-		    inet_rcv_saddr_equal(sk, sk2, true)) {
+		    inet_rcv_saddr_equal(sk, sk2, true) &&
+		    udp_bound_dev_overlap(dif, sk2)) {
 			if (sk2->sk_reuseport && sk->sk_reuseport &&
 			    !rcu_access_pointer(sk->sk_reuseport_cb) &&
 			    uid_eq(uid, sk_uid(sk2))) {
-				if (!udp_lport_same_bind(sk, sk2))
+				if (!udp_lport_same_bind(sk, dif, sk2))
 					continue;
 				res = 0;
 			} else {
@@ -2207,6 +2231,8 @@ int __udp_disconnect(struct sock *sk, int flags)
 	sock_rps_reset_rxhash(sk);
 	if (userlocks & SOCK_CONNECT_DEV) {
 		WRITE_ONCE(sk->sk_bound_dev_if, 0);
+		/* Pairs with the first smp_rmb() in udp_bound_dev_if(). */
+		smp_wmb();
 		WRITE_ONCE(sk->sk_userlocks,
 			   sk->sk_userlocks & ~SOCK_CONNECT_DEV);
 	}
diff --git a/net/ipv6/datagram.c b/net/ipv6/datagram.c
index 0296207dbeb0..37a093f74724 100644
--- a/net/ipv6/datagram.c
+++ b/net/ipv6/datagram.c
@@ -141,9 +141,12 @@ EXPORT_SYMBOL_GPL(ip6_datagram_release_cb);
 
 static void ip6_datagram_connect_dev(struct sock *sk, int old_dif, int dif)
 {
-	if (!old_dif && dif)
+	if (!old_dif && dif) {
 		WRITE_ONCE(sk->sk_userlocks,
 			   sk->sk_userlocks | SOCK_CONNECT_DEV);
+		/* Pairs with the second smp_rmb() in udp_bound_dev_if(). */
+		smp_wmb();
+	}
 	WRITE_ONCE(sk->sk_bound_dev_if, dif);
 }
 
@@ -275,9 +278,14 @@ int __ip6_datagram_connect(struct sock *sk, struct sockaddr_unsized *uaddr,
 		np->flow_label = old_fl6_flowlabel;
 		inet->inet_dport = old_dport;
 		WRITE_ONCE(sk->sk_bound_dev_if, old_bound_dev_if);
-		if (!old_bound_dev_if)
+		if (!old_bound_dev_if) {
+			/* Pairs with the first smp_rmb() in
+			 * udp_bound_dev_if().
+			 */
+			smp_wmb();
 			WRITE_ONCE(sk->sk_userlocks,
 				   sk->sk_userlocks & ~SOCK_CONNECT_DEV);
+		}
 		goto out;
 	}
 
-- 
2.43.0

