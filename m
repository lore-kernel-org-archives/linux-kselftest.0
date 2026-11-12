Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=206.220.120.4
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794528012;
	b=zNdB9Tvo73ltaL631DoLDVd60xe97ZGQthTrChVgh4U7lLgPvnq3tGGZwQOx3AiB3FOf
	 dLJEizkpoIfDFZEK3YMXR1/RgGQqaUXYVzzRVWHr7YLnowSLN4hEtWUdh+N3o2ydlsPCo
	 R1CEb3p+O5FH9xJHkWFRB4hj9lixjLU4obcixucqM60xsW8+Myy6gwlu+mWvl1DVPdUex
	 FGNgWSeYyVYcnLvOnYjZgAsrKo9MCxB+JwtYfkpw69ZwgxXLEFgNnbjA1o7gqC/9OMKTx
	 Fy59tV8Q0Hq/AZeUX4fjhwZznX8FJK9SOwpoLHFOvwdEPc8WMH96e9Ou43QCtImIFuw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794528012;
	h=DMARC-Filter:Received:DKIM-Signature:From:To:Cc:Subject:Date:
	 Message-ID:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding;
	bh=BxFdqfktbAlYgqmNp0elWzFlaF/RFGyYW+YqPLC+OiM=;
	b=wl0EWc7EP8I2pDh5DXKSjJCAXnl5JSIhsuXqMMMNq14R9OTh3EBEcmyfJ0u94ndmY+bj
	 m8DtouXjskHeDhyrrCr6h11NFV6YP/UXoi2SloJZkOx17PoJL0I+8bXnWyBJs09hH71EC
	 lR0oz7q+D6MMesLEbLZHeQoYH6AdBGabcO9wVPKvDkewRvTxNCP3kDpXNDN9PrE+ng25e
	 4nI+ARFLFwWyzlWJcoQIH3kinLmwRDjhq0vqgcrBBKg7M06Q7yEi/uP44C8DLGaC+JqeQ
	 pPlp1FGwzmBIS388gwH8tsoD/NYFiqIUs9Skznte673kxpab9npVTm1wEWzE4itas8w==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=grapheneos.org;
	spf=pass smtp.mailfrom=grapheneos.org;
	dkim=pass header.d=grapheneos.org header.i=@grapheneos.org header.a=rsa-sha256 header.s=default header.b=cegOfyuj;
	arc=none smtp.remote-ip=206.220.120.4
Received: from mail.grapheneos.org (mail.grapheneos.org [206.220.120.4])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8501D606A33D;
	Fri, 13 Nov 2026 00:00:11 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 8501D606A33D
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=grapheneos.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=grapheneos.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=grapheneos.org header.i=@grapheneos.org header.a=rsa-sha256 header.s=default header.b=cegOfyuj
Received: by mail.grapheneos.org (Postfix) id 3E4123C01F0A4;
	Fri, 13 Nov 2026 00:00:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=grapheneos.org;
	s=default; t=1794528010;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=BxFdqfktbAlYgqmNp0elWzFlaF/RFGyYW+YqPLC+OiM=;
	b=cegOfyuj9tAH1EE2nrUh4S1Rc8WHw0bp2L6JpLtMjJUrCS5icll7Q3f2KE8u0ekwA1RM2k
	eDeA/iuBvQCij+tinJgdWWAppMKnQ0Zw7yDKc6SXF2ezOqZ847FAlnH5fyftGfyz31km2+
	iWJtTjmXKwPX0AnIuq8j0aPujf2b5VWJXQWMMxxmEvznlG4bUkHl74skhYC1JonTX8NyhI
	9gRt3uk7FmyRqBYPmkuuj6FGE8pa6H0GHcWW99GfN+UFIkmPi1/XWwWskMr6DS3lFVAjmk
	7b+SMnQFM6BwApl8mOM2IpRQutTMXxABX1//XSP+IrwhhTgDBhKFA/KshHhyPg==
From: liamsmith827 <liamsmith827@grapheneos.org>
To: netdev@vger.kernel.org
Cc: David Ahern <dsahern@kernel.org>,
	Ido Schimmel <idosch@nvidia.com>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@kernel.org>,
	Jakub Kicinski <kuba@kernel.org>,
	Paolo Abeni <pabeni@redhat.com>,
	Simon Horman <horms@kernel.org>,
	Shuah Khan <shuah@kernel.org>,
	linux-kselftest@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Liam Smith <liamsmith827@proton.me>
Subject: [PATCH net-next v3 3/4] selftests: net: test restricted on-link fallback
Date: Thu, 12 Nov 2026 23:59:31 +0000
Message-ID: <20261112235932.23836-4-liamsmith827@grapheneos.org>
In-Reply-To: <20261112235932.23836-1-liamsmith827@grapheneos.org>
References: <20261112235932.23836-1-liamsmith827@grapheneos.org>
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

From: Liam Smith <liamsmith827@proton.me>

Update tests now that the on-link fallback has been restricted to
routing lookup misses for non-vrf unicast.

Signed-off-by: Liam Smith <liamsmith827@proton.me>
---
 tools/testing/selftests/net/fcnal-test.sh | 47 +++++++++++++----------
 1 file changed, 26 insertions(+), 21 deletions(-)

diff --git a/tools/testing/selftests/net/fcnal-test.sh b/tools/testing/selftests/net/fcnal-test.sh
index a50609535fed..c048d5be139d 100755
--- a/tools/testing/selftests/net/fcnal-test.sh
+++ b/tools/testing/selftests/net/fcnal-test.sh
@@ -619,17 +619,29 @@ ipv4_ping_novrf()
 	run_cmd ping -c1 -w1 -I ${NSA_DEV} ${a}
 	log_test_addr ${a} $? 0 "ping local, device bind"
 
-	# loopback addresses not reachable from device bind
-	# fails in a really weird way though because ipv4 special cases
-	# route lookups with oif set.
+	# loopback addresses not reachable from device bind, unreachable default route
 	for a in ${NSA_LO_IP} 127.0.0.1
 	do
 		log_start
 		show_hint "Fails since address on loopback device is out of device scope"
 		run_cmd ping -c1 -w1 -I ${NSA_DEV} ${a}
-		log_test_addr ${a} $? 1 "ping local, device bind"
+		log_test_addr ${a} $? 2 "ping local, device bind, unreachable default route"
 	done
 
+	# loopback addresses not reachable from device bind, route miss
+	log_start
+	setup_cmd ip route del unreachable default metric 8192
+
+	for a in ${NSA_LO_IP} 127.0.0.1
+	do
+		log_start
+		show_hint "Fails since address on loopback device is out of device scope"
+		run_cmd ping -c1 -w1 -I ${NSA_DEV} ${a}
+		log_test_addr ${a} $? 1 "ping local, device bind, route miss"
+	done
+
+	setup_cmd ip route add unreachable default metric 8192
+
 	#
 	# ip rule blocks reachability to remote address
 	#
@@ -643,10 +655,9 @@ ipv4_ping_novrf()
 	run_cmd ping -c1 -w1 ${a}
 	log_test_addr ${a} $? 2 "ping out, blocked by rule"
 
-	# NOTE: ipv4 actually allows the lookup to fail and yet still create
-	# a viable rtable if the oif (e.g., bind to device) is set, so this
-	# case succeeds despite the rule
-	# run_cmd ping -c1 -w1 -I ${NSA_DEV} ${a}
+	log_start
+	run_cmd ping -c1 -w1 -I ${NSA_DEV} ${a}
+	log_test_addr ${a} $? 2 "ping out, device bind, blocked by rule"
 
 	a=${NSA_LO_IP}
 	log_start
@@ -671,10 +682,9 @@ ipv4_ping_novrf()
 	run_cmd ping -c1 -w1 ${a}
 	log_test_addr ${a} $? 2 "ping out, blocked by route"
 
-	# NOTE: ipv4 actually allows the lookup to fail and yet still create
-	# a viable rtable if the oif (e.g., bind to device) is set, so this
-	# case succeeds despite not having a route for the address
-	# run_cmd ping -c1 -w1 -I ${NSA_DEV} ${a}
+	log_start
+	run_cmd ping -c1 -w1 -I ${NSA_DEV} ${a}
+	log_test_addr ${a} $? 2 "ping out, device bind, blocked by route"
 
 	a=${NSA_LO_IP}
 	log_start
@@ -692,10 +702,9 @@ ipv4_ping_novrf()
 	run_cmd ping -c1 -w1 ${a}
 	log_test_addr ${a} $? 2 "ping out, unreachable default route"
 
-	# NOTE: ipv4 actually allows the lookup to fail and yet still create
-	# a viable rtable if the oif (e.g., bind to device) is set, so this
-	# case succeeds despite not having a route for the address
-	# run_cmd ping -c1 -w1 -I ${NSA_DEV} ${a}
+	log_start
+	run_cmd ping -c1 -w1 -I ${NSA_DEV} ${a}
+	log_test_addr ${a} $? 2 "ping out, device bind, unreachable default route"
 }
 
 ipv4_ping_vrf()
@@ -1602,10 +1611,6 @@ ipv4_udp_novrf()
 	run_cmd nettest -D -d ${NSA_DEV} -S -r ${a} -U
 	log_test_addr ${a} $? 0 "Global server, device client via IP_UNICAST_IF, local connection, with connect()"
 
-
-	# IPv4 with device bind has really weird behavior - it overrides the
-	# fib lookup, generates an rtable and tries to send the packet. This
-	# causes failures for local traffic at different places
 	for a in ${NSA_LO_IP} 127.0.0.1
 	do
 		log_start
@@ -1613,7 +1618,7 @@ ipv4_udp_novrf()
 		run_cmd nettest -D -s &
 		wait_local_port_listen ${NSA} 12345 udp
 		run_cmd nettest -D -r ${a} -d ${NSA_DEV}
-		log_test_addr ${a} $? 2 "Global server, device client, local connection"
+		log_test_addr ${a} $? 1 "Global server, device client, local connection"
 
 		log_start
 		show_hint "Should fail since addresses on loopback are out of device scope"
-- 
2.47.3

