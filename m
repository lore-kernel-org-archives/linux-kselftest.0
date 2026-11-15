Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=206.220.120.4
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794779838;
	b=w+1XW01A5TT10eN/CD6CBbp6wJmrH9eGX2drhTRgeM3C6fqQNMDhJNJpFV3TtCAvkZJl
	 MvdpMkNeuOxDuaZvW2F5UQh1MBYuL3uZxneunnKgu1WGNM8XuFUeEPTdvCjzDFYrraKpv
	 8VJLGNYfMlpEOP3ybRuhnxqM2silIN0vO+9356VBuzA7h1fU1w2LUJXQkUSlziqkzSwz1
	 V6r5I69lc0M6ThYBr91pjsodve5OOFztaMR8gnIvqSF/LjLYSv/T7mclxixVhBr80lnNb
	 gj36cDvhEdeRWUNEK05Mhbc+9Zz0Up1Pd7Bemduez0P3Dc3Ulcj64kBNJi8EbSEgMFA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794779838;
	h=DMARC-Filter:Received:DKIM-Signature:From:To:Cc:Subject:Date:
	 Message-ID:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding;
	bh=hoFapUtlspIAPrh7Ga2yspRCKBKoddrYUp4uzoxvs4M=;
	b=uzoRX19jKGTZEbNMUNUUafR/daBmUSvIUi2PSd0v3ZXkBBdVsVVEdZnTgyf9DdKL8Bv2
	 NaQcZ/C9DeD0wY1XERBWsqM9V23Z8WBymwL5Ec5YzZ2ccrCUCAulTzvWTxEOiqfEYdgXa
	 +Nq080XnB5dN+Py5qm94qZ/znHu+38dKvWsKmGBCA3UfgJEndzijDT/OyX9X4chPgkMty
	 8jsrVMNQg9LQTaVFOYCFVbYWvcUv4LaTB0HPgdsz7Q3Tb2a4Av2Xb8DV2WArpSzwDlOmA
	 mMh1oCk4ZYhyPCNocoGmKztZ2ncg4q1+qyOgal0lnqoWsVsITR3lrYjYRG7NpmYqFMg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=grapheneos.org;
	spf=pass smtp.mailfrom=grapheneos.org;
	dkim=pass header.d=grapheneos.org header.i=@grapheneos.org header.a=rsa-sha256 header.s=default header.b=HFzL14Og;
	arc=none smtp.remote-ip=206.220.120.4
Received: from mail.grapheneos.org (mail.grapheneos.org [206.220.120.4])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 799DB606A323;
	Sun, 15 Nov 2026 21:57:17 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 799DB606A323
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=grapheneos.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=grapheneos.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=grapheneos.org header.i=@grapheneos.org header.a=rsa-sha256 header.s=default header.b=HFzL14Og
Received: by mail.grapheneos.org (Postfix) id 257DC3C08EE9B;
	Sun, 15 Nov 2026 21:57:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=grapheneos.org;
	s=default; t=1794779836;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=hoFapUtlspIAPrh7Ga2yspRCKBKoddrYUp4uzoxvs4M=;
	b=HFzL14OgGUYbdOXrQY8BExpfS48R2XcNs5bsII0Mmoh5f8HCewNbX229vkjdN+ZGStNRuK
	zIUqGggdmhp3BPC06goen0oAaKV2rOiJHGB6IL2RF+i8Mulv2Pc0Wf1XBiVyQ7MdypHqSh
	RaM+I8Rt9Tk/ROlU6miBzp+qIYuQvbZUyr4X5S+9rHf85r8Nan3p2Hkgp1LHaIWgdwTawj
	/NqLwVB0FCdrBDSGfF83Wc3ceJcNQEoVh1sz2vQ37nLnn7rAKmAjSlQJszrVCjJyPmzYqZ
	vr6UCPmS1qrVs02qvdFi3kk+Pw+sUtF6zBXEWtsV1hEKjNX9MXWEPQ2UM3hV/w==
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
Subject: [PATCH net-next v4 3/4] selftests: net: test restricted on-link fallback
Date: Sun, 15 Nov 2026 21:56:39 +0000
Message-ID: <20261115215640.18728-4-liamsmith827@grapheneos.org>
In-Reply-To: <20261115215640.18728-1-liamsmith827@grapheneos.org>
References: <20261115215640.18728-1-liamsmith827@grapheneos.org>
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
 tools/testing/selftests/net/fcnal-test.sh | 53 ++++++++++++++---------
 1 file changed, 32 insertions(+), 21 deletions(-)

diff --git a/tools/testing/selftests/net/fcnal-test.sh b/tools/testing/selftests/net/fcnal-test.sh
index a50609535fed..9722d7dcad08 100755
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
@@ -643,10 +656,14 @@ ipv4_ping_novrf()
 	run_cmd ping -c1 -w1 ${a}
 	log_test_addr ${a} $? 2 "ping out, blocked by rule"
 
-	# NOTE: ipv4 actually allows the lookup to fail and yet still create
-	# a viable rtable if the oif (e.g., bind to device) is set, so this
-	# case succeeds despite the rule
-	# run_cmd ping -c1 -w1 -I ${NSA_DEV} ${a}
+	log_start
+	setup_cmd ip rule add pref 49 to ${NSB_LO_IP} unreachable
+	log_test_addr ${a} $? 2 "ping out, blocked by unreachable rule"
+	setup_cmd ip rule del pref 49 to ${NSB_LO_IP} unreachable
+
+	log_start
+	run_cmd ping -c1 -w1 -I ${NSA_DEV} ${a}
+	log_test_addr ${a} $? 2 "ping out, device bind, blocked by rule"
 
 	a=${NSA_LO_IP}
 	log_start
@@ -671,10 +688,9 @@ ipv4_ping_novrf()
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
@@ -692,10 +708,9 @@ ipv4_ping_novrf()
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
@@ -1602,10 +1617,6 @@ ipv4_udp_novrf()
 	run_cmd nettest -D -d ${NSA_DEV} -S -r ${a} -U
 	log_test_addr ${a} $? 0 "Global server, device client via IP_UNICAST_IF, local connection, with connect()"
 
-
-	# IPv4 with device bind has really weird behavior - it overrides the
-	# fib lookup, generates an rtable and tries to send the packet. This
-	# causes failures for local traffic at different places
 	for a in ${NSA_LO_IP} 127.0.0.1
 	do
 		log_start
@@ -1613,7 +1624,7 @@ ipv4_udp_novrf()
 		run_cmd nettest -D -s &
 		wait_local_port_listen ${NSA} 12345 udp
 		run_cmd nettest -D -r ${a} -d ${NSA_DEV}
-		log_test_addr ${a} $? 2 "Global server, device client, local connection"
+		log_test_addr ${a} $? 1 "Global server, device client, local connection"
 
 		log_start
 		show_hint "Should fail since addresses on loopback are out of device scope"
-- 
2.47.3

