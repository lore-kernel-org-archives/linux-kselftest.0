Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=206.220.120.4
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794860928;
	b=XwQeP7vaXnQEbAe/fT3twTyEn1UQ5oEp1qgsvAN92R0NbLnk3FJviTakhkApFM+RdaRx
	 p3eIYYpti9OA6oM7NycVyQ9DgzrvsUgM20zpZWHzy16OfIjN2dK8TM7tOwKyghiBMFfnY
	 p2gVKqvIsK473HyYslRgFFJi+iqCdo5jjNJN7McfDfo/Mg1WXA/uunV1TzceV/TAweCK1
	 QFhsTIT7QHOkc0YzDD8IoFxEhW2IpLITaH2eLWcjSZcXg01OeFVYVe2VzlQSTNpzdFVTy
	 XQrBxEfKXI4DQHStbykQh70XT0RxN8EuqtMJzDzch0/IGuesJxYr1whBvhYXV5HQ1FA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794860928;
	h=DMARC-Filter:Received:DKIM-Signature:From:To:Cc:Subject:Date:
	 Message-ID:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding;
	bh=On79LPED33FlkJ6kqadylMsAJan8rpeH4OCMuFHj5fs=;
	b=tq3OOgpyiMg/A4PdCWmsE1Nv6iTbslI0MLAj9wNJfU9FTqSKpSGB4CXjYMv33orb/iQQ
	 59O/h6qXmNHToEnUVhCAqlpciOQWTuyKBuTh0v6Y2Tx51cygQsv2jBBKxpLJOCV0Sfvlo
	 AWOthznjh36RuEv83EKXR33/VjAalwUQFWaTsOP+qaiDD3qkuSQdNhCqKHXl6hq1Finpy
	 Ll5Y4m8aA0lLIx9utuDyE4v0Ws0FQARpx33WSQEjAfWBn6CTKqynLw3YPpsL5wPFOy7dQ
	 A1zqvWorPXzIlQrYUYh3xSrt/gIozwW+NsWqaF8FdAeflWTxHw3TsS4MzIh9gJUmiyw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=grapheneos.org;
	spf=pass smtp.mailfrom=grapheneos.org;
	dkim=pass header.d=grapheneos.org header.i=@grapheneos.org header.a=rsa-sha256 header.s=default header.b=Bb8pa0gX;
	arc=none smtp.remote-ip=206.220.120.4
Received: from mail.grapheneos.org (mail.grapheneos.org [206.220.120.4])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 79B0B606A322;
	Mon, 16 Nov 2026 20:28:47 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 79B0B606A322
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=grapheneos.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=grapheneos.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=grapheneos.org header.i=@grapheneos.org header.a=rsa-sha256 header.s=default header.b=Bb8pa0gX
Received: by mail.grapheneos.org (Postfix) id 376A13C08B8DC;
	Mon, 16 Nov 2026 20:28:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=grapheneos.org;
	s=default; t=1794860926;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=On79LPED33FlkJ6kqadylMsAJan8rpeH4OCMuFHj5fs=;
	b=Bb8pa0gX7ecbJZlpl8ypPdae2QHc9NnlL2ciD4MW4uKB7gl8A0fbgaOUtb58cZlb1wGeLb
	ZnZGD6Wwv4mGDRdhFlNEuKHs7GP+MHBH/+PyxtbxM6wpYzLLZOXTqAeFrjdxwOJApUlGrA
	rgjIBwq4iCZYApmHKfUuOfYQwCb2Y9gaWjFKuPMO1pzj0dgnkYOxuAYQB8pn567rPBYmj8
	7BG1mPb4t5kR9ZZfB79iNT3fQtB4iF3cPjY+BgIQlnJlU+RG22QD4ASsY+vlPj/gFusQSA
	8eRWZFlU9JApuHFo8zZ+tuajZBaeG0Ry+7cjTN2TiiaQG0gvbWgriHs4mpijZQ==
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
Subject: [PATCH net-next v5 3/4] selftests: net: test restricted on-link fallback
Date: Mon, 16 Nov 2026 20:27:40 +0000
Message-ID: <20261116202741.13106-4-liamsmith827@grapheneos.org>
In-Reply-To: <20261116202741.13106-1-liamsmith827@grapheneos.org>
References: <20261116202741.13106-1-liamsmith827@grapheneos.org>
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

Following the previous patch, the on-link fallback is no longer taken
when the FIB lookup hits an unreachable, blackhole or prohibit route/
rule. Adjust the IPv4 tests accordingly:

1. ipv4_ping_novrf(): Pinging a loopback address while bound to a
device now fails with an error instead of timing out, since the lookup
hits the unreachable default route. Adjust the expected return code.

2. ipv4_ping_novrf(): Add a variant of the above without the
unreachable default route, to make sure that the fallback is still
taken upon a route miss.

3. ipv4_ping_novrf(): Add a test that demonstrates ping fails as
expected with an unreachable rule. This ensures FIB_LOOKUP_REPORT_MISS
does not break this behavior.

4. ipv4_ping_novrf(): Enable the device bind test cases that were
commented out because of the fallback (prohibit rule, unreachable route
and unreachable default route).

5. ipv4_udp_novrf(): Connecting to a loopback address while bound to a
device now fails with an error instead of timing out. Adjust the
expected return code.

With the exception of the route miss and unreachable ping test cases,
which are specific to IPv4, the IPv4 test cases are now aligned with
their IPv6 counterparts.

Signed-off-by: Liam Smith <liamsmith827@proton.me>
---
 tools/testing/selftests/net/fcnal-test.sh | 54 ++++++++++++++---------
 1 file changed, 33 insertions(+), 21 deletions(-)

diff --git a/tools/testing/selftests/net/fcnal-test.sh b/tools/testing/selftests/net/fcnal-test.sh
index a50609535fed..7d51fdcc8fda 100755
--- a/tools/testing/selftests/net/fcnal-test.sh
+++ b/tools/testing/selftests/net/fcnal-test.sh
@@ -619,17 +619,30 @@ ipv4_ping_novrf()
 	run_cmd ping -c1 -w1 -I ${NSA_DEV} ${a}
 	log_test_addr ${a} $? 0 "ping local, device bind"
 
-	# loopback addresses not reachable from device bind
-	# fails in a really weird way though because ipv4 special cases
-	# route lookups with oif set.
+	# loopback addresses not reachable from device bind, unreachable
+	# default route
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
@@ -643,10 +656,15 @@ ipv4_ping_novrf()
 	run_cmd ping -c1 -w1 ${a}
 	log_test_addr ${a} $? 2 "ping out, blocked by rule"
 
-	# NOTE: ipv4 actually allows the lookup to fail and yet still create
-	# a viable rtable if the oif (e.g., bind to device) is set, so this
-	# case succeeds despite the rule
-	# run_cmd ping -c1 -w1 -I ${NSA_DEV} ${a}
+	log_start
+	setup_cmd ip rule add pref 49 to ${NSB_LO_IP} unreachable
+	run_cmd ping -c1 -w1 -I ${NSA_DEV} ${a}
+	log_test_addr ${a} $? 2 "ping out, device bind, blocked by unreachable rule"
+	setup_cmd ip rule del pref 49 to ${NSB_LO_IP} unreachable
+
+	log_start
+	run_cmd ping -c1 -w1 -I ${NSA_DEV} ${a}
+	log_test_addr ${a} $? 2 "ping out, device bind, blocked by rule"
 
 	a=${NSA_LO_IP}
 	log_start
@@ -671,10 +689,9 @@ ipv4_ping_novrf()
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
@@ -692,10 +709,9 @@ ipv4_ping_novrf()
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
@@ -1602,10 +1618,6 @@ ipv4_udp_novrf()
 	run_cmd nettest -D -d ${NSA_DEV} -S -r ${a} -U
 	log_test_addr ${a} $? 0 "Global server, device client via IP_UNICAST_IF, local connection, with connect()"
 
-
-	# IPv4 with device bind has really weird behavior - it overrides the
-	# fib lookup, generates an rtable and tries to send the packet. This
-	# causes failures for local traffic at different places
 	for a in ${NSA_LO_IP} 127.0.0.1
 	do
 		log_start
@@ -1613,7 +1625,7 @@ ipv4_udp_novrf()
 		run_cmd nettest -D -s &
 		wait_local_port_listen ${NSA} 12345 udp
 		run_cmd nettest -D -r ${a} -d ${NSA_DEV}
-		log_test_addr ${a} $? 2 "Global server, device client, local connection"
+		log_test_addr ${a} $? 1 "Global server, device client, local connection"
 
 		log_start
 		show_hint "Should fail since addresses on loopback are out of device scope"
-- 
2.47.3

