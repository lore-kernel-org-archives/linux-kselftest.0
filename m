Received: from mail-ej2-f42.google.com (mail-ej2-f42.google.com [74.125.228.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8733A4FDE70
	for <linux-kselftest@vger.kernel.org>; Wed, 30 Sep 2026 15:23:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.228.170
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790781814; cv=none; b=HiKW3X0lsTsdE3jweou8/OsV93ERyrIunwuAgckN+5W1mfF8uiriYcXAh/K49NWa4qT9toJC0c5egyM4U7gHxLQPTrXnGaPh0z79kd09Lba7Vbzwh308sBWRVJ9c0JwpoPeKcOmhYMBuDft/mPo7K6G6XRgh5G6XByy6ICGVi7U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790781814; c=relaxed/simple;
	bh=b9y4NXkgYg8B4pqDswquuydxBE3Tjnq/EUwfuU2Enwk=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=Sbl438B1kL1xlsYsWqWsbbFMDgjm9BtM8XuL2WeWWoxQUCk3rnpdZng2kV61CfDMRKy5Q9LLN1hXlzH672qkzwTpElZVb4W9HPnohUW+9E9r6uWBB7n/R236dhH2Z3CIyQpLOC3x4WMvtO7FXF4Q5TetK46QxRIVsgZKTXKh5nc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=cs.unc.edu; spf=pass smtp.mailfrom=cs.unc.edu; dkim=pass (2048-bit key) header.d=cs.unc.edu header.i=@cs.unc.edu header.b=TGT+Thhp; arc=none smtp.client-ip=74.125.228.170
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=cs.unc.edu
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=cs.unc.edu
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=cs.unc.edu header.i=@cs.unc.edu header.b="TGT+Thhp"
Received: by mail-ej2-f42.google.com with SMTP id a640c23a62f3a-c2bf3cc16baso625368766b.0
        for <linux-kselftest@vger.kernel.org>; Wed, 30 Sep 2026 08:23:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=cs.unc.edu; s=google; t=1790781797; x=1791386597; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=xKz38TwNtR/kCvzhvPBXJpWiMyE9q1ag9Gm3OPI54Dw=;
        b=TGT+Thhpg0Ome/58A2npn/9DZHfV2RSvXLQdydNKZwVHgXJFKU4sxgIwaegEwh/RSK
         44jrC0I6HQcO10IRe1BhsuNFYaxsP+Lu5P4VFYn9Whp1P0f80fmmjyFRm/H05FbxmyLO
         +T62Cp4TlM/AxwFk1hnQuG06ptzNVnLHt2HvbqLfv+6P76fVZqk73SXfnfeRICUFjw6J
         P+n/1VI2ZHUl7P8jPVqiALdJzG4abHjkOsXVCS0lDRJ1gny86iZ+P4sczwu7EyxtEpLk
         3y/FMgjCf7U+NOYWyngLfLIs+MXf6Kl5NwbLiyk7AL1DyX/z+jxUNDJpkBuHz3NHNmi0
         +mlg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790781797; x=1791386597;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=xKz38TwNtR/kCvzhvPBXJpWiMyE9q1ag9Gm3OPI54Dw=;
        b=e0U3Lcb2+c6s0/3TJGaD6pUj2tZSy5k2OV3sWKwsbL4hhStgdgnQDKBq7xz9SB67KG
         5KOljRd4YzhoaW7nCP5+mF18oajO7O410Us8nKcM3BA0j/Kk/rUVczHMGw4OVCLoChj6
         x8iIO7pKhMdiV0W8/RvAGajbVjcqeMIPAdN4HV3a1J05nv84kVh7VGJXqRx2tB8LERPu
         R90Bxtxh7zg0x87FVbzqoKubeBP6NoScYcw30wG3FIZaDkK2HnA8prLFTp+tFOQSkxWD
         MnTcB+eTISuVIUaOLRmx/j6G7jN4RewPHuGf4WTY7/gUYNI86iUbOb17RxqP7d9zeud7
         UPgw==
X-Forwarded-Encrypted: i=1; AKwUvBy7qUJhm3ZuTflrdFUrj1zBIkIeMGrfTgdewK224+WLDgSqnDBHrZtTJxAvf7EJqkR1vaWu/Zn1r7sTJrm4Wb0=@vger.kernel.org
X-Gm-Message-State: AFq9FYKsAg395qydiDGStPJUvBHJ5PWq8Fm5B2uV7Yh67ALUq+ZzKqLa
	X0t4LImY2d5luCR7ZyJqtkn/SIBIepxKo4TtZ6T2JCAn4RqfBxd4uNNG1ZTQBD17sw==
X-Gm-Gg: AYBFou3+wiVkumJ2VxJxwCkQrihYD4MwO31cXB2pYP6wBZCUuj8jNkFQycymg1JlZ5h
	iH7zRdQU4PF3uJuUuSh3h+vDFweAraOf6eJC+J1Rs6Zj+VXyqgFXJAPt8oyK7oyGQix9ZV+shSS
	UWdEoTvNaYTmTdd3avauPgwqiwNdcP16LJZVx/BjvdNLsZppQd8aJur3zGFgJ8zI+9BLw8EtJNj
	nF+OA+trgsszG5Nqoke4nnR7hdvtov4khbLGi8cuwfprbNfFkrd0yinD9x3TZ65zCC6EJkZNk6r
	Pi3mSPR5hQIPDGPmf41DLBOyPSzDpP6tcsIyBho7Y67/fnB5TJCBfe0DGEjLlbrI6VMGCqiKTtH
	Nj3+AwCWD+MuOpX2w3sih74K5jTYjKPmpK8HFw5S9+oYlLc4dp35nMbdwds7ZU1XltHi9oXJRYL
	ichaTXtlMmlMq9o0WqN3YHr00jSzzEaTM/3gjUg5NagXXrOXC2PpYZJk7Oe6j4khYrXB2OefRE1
	xWqxYgJj+XFyrSiztz1BQ==
X-Received: by 2002:a17:906:478d:b0:c29:f0a4:a4f8 with SMTP id a640c23a62f3a-c2e233cd0bbmr149280466b.0.1790781797242;
        Wed, 30 Sep 2026 08:23:17 -0700 (PDT)
Received: from cobra01.cs.unc.edu (cobra01.cs.unc.edu. [152.2.130.143])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c2e31ce6499sm23874966b.33.2026.09.30.08.23.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 30 Sep 2026 08:23:16 -0700 (PDT)
From: hengyul@cs.unc.edu
To: netdev@vger.kernel.org
Cc: "David S . Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@kernel.org>,
	Jakub Kicinski <kuba@kernel.org>,
	Paolo Abeni <pabeni@redhat.com>,
	Simon Horman <horms@kernel.org>,
	David Ahern <dsahern@kernel.org>,
	Ido Schimmel <idosch@nvidia.com>,
	Jiayuan Chen <jiayuan.chen@shopee.com>,
	Jiayuan Chen <jiayuan.chen@linux.dev>,
	Shuah Khan <shuah@kernel.org>,
	linux-kselftest@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Hengyu Liang <hengyul@cs.unc.edu>
Subject: [PATCH net 2/2] selftests: net: fib_tests: add tests for IPv6 routes via loopback device
Date: Wed, 30 Sep 2026 11:22:29 -0400
Message-ID: <20260930152229.1453929-3-hengyul@cs.unc.edu>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260930152229.1453929-1-hengyul@cs.unc.edu>
References: <20260930152229.1453929-1-hengyul@cs.unc.edu>
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Hengyu Liang <hengyul@cs.unc.edu>

Check that an IPv6 route via the loopback device can be added when the
loopback device is down, when a gateway is specified, including an
IPv4-mapped one, and when IPv6 is disabled on the loopback device. Such
routes are promoted to reject routes, so their nexthop is not validated.

Without the previous patch:

  # ./fib_tests.sh -t ipv6_route_lo

  IPv6 routes via loopback device tests
      TEST: Route via loopback device that is down              [FAIL]
      TEST: Route via loopback device with gateway              [FAIL]
      TEST: Route via loopback device with IPv4-mapped gateway  [FAIL]
      TEST: Route via loopback device with IPv6 disabled        [FAIL]

  Tests passed:   0
  Tests failed:   4

With the previous patch:

  # ./fib_tests.sh -t ipv6_route_lo

  IPv6 routes via loopback device tests
      TEST: Route via loopback device that is down              [ OK ]
      TEST: Route via loopback device with gateway              [ OK ]
      TEST: Route via loopback device with IPv4-mapped gateway  [ OK ]
      TEST: Route via loopback device with IPv6 disabled        [ OK ]

  Tests passed:   4
  Tests failed:   0

Signed-off-by: Hengyu Liang <hengyul@cs.unc.edu>
---
 tools/testing/selftests/net/fib_tests.sh | 31 +++++++++++++++++++++++-
 1 file changed, 30 insertions(+), 1 deletion(-)

diff --git a/tools/testing/selftests/net/fib_tests.sh b/tools/testing/selftests/net/fib_tests.sh
index b338bfb196a2..19e55a8630a2 100755
--- a/tools/testing/selftests/net/fib_tests.sh
+++ b/tools/testing/selftests/net/fib_tests.sh
@@ -14,7 +14,7 @@ TESTS="unregister down carrier nexthop suppress ipv6_notify ipv4_notify \
        ipv4_mpath_list ipv6_mpath_list ipv4_mpath_balance ipv6_mpath_balance \
        ipv4_mpath_balance_preferred ipv4_mpath_oif ipv4_mpath_oif_nh \
        ipv4_mpath_oif_vrf ipv6_mpath_oif ipv6_mpath_oif_nh ipv6_mpath_oif_vrf \
-       fib6_ra_to_static fib6_temp_addr_renewal"
+       fib6_ra_to_static fib6_temp_addr_renewal ipv6_route_lo"
 
 VERBOSE=0
 PAUSE_ON_FAIL=no
@@ -2466,6 +2466,34 @@ ipv4_route_v6_gw_test()
 	route_cleanup
 }
 
+ipv6_route_lo_test()
+{
+	echo
+	echo "IPv6 routes via loopback device tests"
+
+	setup_ns ns1
+	IP="$(which ip) -netns $ns1"
+
+	# Routes via the loopback device are promoted to reject routes, so
+	# their nexthop is not validated.
+	run_cmd "$IP link set dev lo down"
+	run_cmd "$IP -6 ro add 2001:db8:101::/64 dev lo"
+	log_test $? 0 "Route via loopback device that is down"
+
+	run_cmd "$IP link set dev lo up"
+	run_cmd "$IP -6 ro add 2001:db8:102::/64 via 2001:db8:1::2 dev lo"
+	log_test $? 0 "Route via loopback device with gateway"
+
+	run_cmd "$IP -6 ro add 2001:db8:103::/64 via ::ffff:192.0.2.2 dev lo"
+	log_test $? 0 "Route via loopback device with IPv4-mapped gateway"
+
+	run_cmd "ip netns exec $ns1 sysctl -qw net.ipv6.conf.lo.disable_ipv6=1"
+	run_cmd "$IP -6 ro add 2001:db8:104::/64 dev lo"
+	log_test $? 0 "Route via loopback device with IPv6 disabled"
+
+	cleanup_ns "$ns1"
+}
+
 socat_check()
 {
 	if [ ! -x "$(command -v socat)" ]; then
@@ -3291,6 +3319,7 @@ do
 	ipv6_route_metrics)		ipv6_route_metrics_test;;
 	ipv4_route_metrics)		ipv4_route_metrics_test;;
 	ipv4_route_v6_gw)		ipv4_route_v6_gw_test;;
+	ipv6_route_lo)			ipv6_route_lo_test;;
 	ipv4_mangle)			ipv4_mangle_test;;
 	ipv6_mangle)			ipv6_mangle_test;;
 	ipv4_bcast_neigh)		ipv4_bcast_neigh_test;;
-- 
2.53.0

