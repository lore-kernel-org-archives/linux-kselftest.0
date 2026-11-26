Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=192.134.164.104
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795710377;
	b=roJT75Ri3feI3R7BzElyOd8/uWZ5rdn3tComOjJKSp01RB9alNJakzsyDjIgHWbBviHW
	 aF8Yb7ZMOufel9+jMDIh8I5aIgXu7xDBpPhIO+fc+hKsV0FF2pcbRd5pnCJLtXJLOLeqm
	 qSGUisJFNpcDyeqnLClZJtco0/SyruvXPBLT8SnTs6PahMlH7S1hb1UWMH5UkPI4qc34j
	 nsNOC17A0vQ5+XEI7XWrAz7tUIx3Lz2+8hJgN7LffCW4sKh/FbQwfCmMyAG0tx51SDjPP
	 FSJV2O75oL4lc2jRxp1KopG4iosh+6A13JdaEBoQOeOk7SfKkqKmTzZZas6fWhF1agw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795710377;
	h=DMARC-Filter:DKIM-Signature:X-CSE-ConnectionGUID:X-CSE-MsgGUID:
	 X-IronPort-AV:Received:From:To:Cc:Subject:Date:Message-ID:X-Mailer:
	 In-Reply-To:References:MIME-Version:Content-Transfer-Encoding;
	bh=kCNuFLcMnfT4IP9oPKJHhe8nWqsuT5VB/X4HVQ9HSTY=;
	b=bzM2tF+pgbgi1VkyKEUmagR1QPpzN8KwHYTjybM9CglBsSp86LsyAew5xBbwf/PaFFbG
	 QqNqaKwQzY5Pm8Ad0OVEuoSLR0d0aRqnz5HEW48+a7VpxffBsSuSFN70eIPrSLgNZ8wgU
	 DqoYjV1jefRJtsQUwr0Ab9jxKJ02d3CmonLCQhTF7uOZH3GMnRJ6nhKSIh6TC+QkKSTLI
	 EEUNrnO4TPRZeAVTb0EKWjGDNs+XW08MyTJi3yOIWBBYKFgDqlPkGeHKN4FdaQ2i+yplx
	 7v5JxDLgCNSgUF6MOjyRm04kOTEhOTDTz8Zq5LAuHQbzpx6Wq5096WSCOGTidqHgbvA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=inria.fr;
	spf=pass smtp.mailfrom=inria.fr;
	dkim=pass header.d=inria.fr header.i=@inria.fr header.a=rsa-sha256 header.s=dc header.b=PcXDNP1s;
	arc=none smtp.remote-ip=192.134.164.104
Received: from mail3-relais-sop.national.inria.fr (mail3-relais-sop.national.inria.fr [192.134.164.104])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 80F2A606A32C;
	Thu, 26 Nov 2026 16:26:16 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 80F2A606A32C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=inria.fr
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=inria.fr
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=inria.fr header.i=@inria.fr header.a=rsa-sha256 header.s=dc header.b=PcXDNP1s
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=inria.fr; s=dc;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=kCNuFLcMnfT4IP9oPKJHhe8nWqsuT5VB/X4HVQ9HSTY=;
  b=PcXDNP1s+phvNPyoYLR1kxdd7rceMqY6/Hgk4b3UIDCQOhv278B2Q7+H
   zHBHuV0IG5cSh8aacIonAMoU6JAAYExOggrrsPiN4wATzFL9w3Mfau48R
   co8U5+5DzKSUCosBHubX4oNFuuuZ6Hq11WLxgA2htdh57bBndaB/UxbjL
   w=;
X-CSE-ConnectionGUID: vKF+7RezQ1enqv+pS8togg==
X-CSE-MsgGUID: KHd3cIvXQ1y+rNabcrl+ww==
Authentication-Results: mail3-relais-sop.national.inria.fr; dkim=none (message not signed) header.i=none; spf=SoftFail smtp.mailfrom=yifei.sun@inria.fr; dmarc=fail (p=none dis=none) d=inria.fr
X-IronPort-AV: E=Sophos;i="6.27,235,1787004000"; 
   d="scan'208";a="163990380"
Received: from datamove-nixosbtw.imag.fr (HELO framework.tail650e82.ts.net) ([129.88.52.51])
  by mail3-relais-sop.national.inria.fr with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 26 Nov 2026 17:26:00 +0100
From: Yifei Sun <yifei.sun@inria.fr>
To: netdev@vger.kernel.org
Cc: Yifei Sun <yifei.sun@inria.fr>,
	idosch@nvidia.com,
	dsahern@kernel.org,
	davem@davemloft.net,
	edumazet@kernel.org,
	kuba@kernel.org,
	pabeni@redhat.com,
	willemb@google.com,
	horms@kernel.org,
	razor@blackwall.org,
	shuah@kernel.org,
	linux-kselftest@vger.kernel.org
Subject: [PATCH net v2 2/2] selftests: net: test IPv4 nexthop fallback in the same trie leaf
Date: Thu, 26 Nov 2026 17:25:38 +0100
Message-ID: <20261126162538.2509994-2-yifei.sun@inria.fr>
X-Mailer: git-send-email 2.56.1
In-Reply-To: <20261126162538.2509994-1-yifei.sun@inria.fr>
References: <20261126162538.2509994-1-yifei.sun@inria.fr>
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

Check that a lookup bound to dummy0 selects the preferred route, while
one bound to dummy1 falls back to another route in the same trie leaf.
Cover both a shorter prefix and a higher metric for the same prefix.
Run the same checks with legacy nexthops and for IPv6.

Signed-off-by: Yifei Sun <yifei.sun@inria.fr>
---
v2: Moved to fib_tests.sh. Added legacy and IPv6 cases.
v1: https://lore.kernel.org/netdev/20261121182031.36626-2-yifei.sun@inria.fr/

 tools/testing/selftests/net/fib_tests.sh | 92 ++++++++++++++++++++++++
 1 file changed, 92 insertions(+)

diff --git a/tools/testing/selftests/net/fib_tests.sh b/tools/testing/selftests/net/fib_tests.sh
index d7ac3c727f70..c06eacc8108f 100755
--- a/tools/testing/selftests/net/fib_tests.sh
+++ b/tools/testing/selftests/net/fib_tests.sh
@@ -14,6 +14,8 @@ TESTS="unregister down carrier nexthop suppress ipv6_notify ipv4_notify \
        ipv4_mpath_list ipv6_mpath_list ipv4_mpath_balance ipv6_mpath_balance \
        ipv4_mpath_balance_preferred ipv4_mpath_oif ipv4_mpath_oif_nh \
        ipv4_mpath_oif_vrf ipv6_mpath_oif ipv6_mpath_oif_nh ipv6_mpath_oif_vrf \
+       ipv4_oif_fallback ipv4_oif_fallback_nh ipv6_oif_fallback \
+       ipv6_oif_fallback_nh \
        fib6_ra_to_static fib6_temp_addr_renewal"
 
 VERBOSE=0
@@ -3228,6 +3230,92 @@ ipv6_mpath_oif_vrf_test()
 	cleanup
 }
 
+check_oif_fallback()
+{
+	local dst=$1 dev=$2 prefix=$3 metric=$4
+	local out
+
+	out=$($IP -o route get fibmatch "$dst" oif "$dev") || return 1
+	[[ $out == "$prefix "* && " $out " == *" metric $metric "* ]]
+}
+
+oif_fallback_test_common()
+{
+	local family=$1 mode=$2
+	local addr gw1 gw2 dst longer shorter
+	local -a nh1 nh2
+
+	echo
+	echo "IPv$family output interface fallback ($mode nexthops)"
+
+	if [ "$family" = 4 ]; then
+		addr=192.0.2.1/24
+		gw1=198.51.100.2
+		gw2=192.0.2.2
+		dst=203.0.113.1
+		longer=203.0.113.0/25
+		shorter=203.0.113.0/24
+	else
+		addr=2001:db8:2::1/64
+		gw1=2001:db8:1::2
+		gw2=2001:db8:2::2
+		dst=2001:db8:10::1
+		longer=2001:db8:10::/64
+		shorter=2001:db8:10::/48
+	fi
+
+	setup
+	set -e
+	$IP link add dummy1 up type dummy
+	$IP address add "$addr" dev dummy1
+
+	nh1=(via "$gw1" dev dummy0)
+	nh2=(via "$gw2" dev dummy1)
+	if [ "$mode" = object ]; then
+		$IP nexthop add id 1 "${nh1[@]}"
+		$IP nexthop add id 2 "${nh2[@]}"
+		nh1=(nhid 1)
+		nh2=(nhid 2)
+	fi
+
+	$IP route add "$longer" "${nh1[@]}" metric 100
+	$IP route add "$shorter" "${nh2[@]}" metric 100
+	set +e
+
+	check_oif_fallback "$dst" dummy0 "$longer" 100
+	log_test $? 0 "Lookup on the preferred route's device"
+	check_oif_fallback "$dst" dummy1 "$shorter" 100
+	log_test $? 0 "Fallback to the shorter prefix"
+
+	set -e
+	$IP route add "$longer" "${nh2[@]}" metric 200
+	set +e
+	check_oif_fallback "$dst" dummy1 "$longer" 200
+	log_test $? 0 "Fallback to the higher metric for the same prefix"
+
+	cleanup
+}
+
+ipv4_oif_fallback_test()
+{
+	oif_fallback_test_common 4 legacy
+}
+
+ipv4_oif_fallback_nh_test()
+{
+	oif_fallback_test_common 4 object
+}
+
+ipv6_oif_fallback_test()
+{
+	oif_fallback_test_common 6 legacy
+}
+
+ipv6_oif_fallback_nh_test()
+{
+	oif_fallback_test_common 6 object
+}
+
 ################################################################################
 # usage
 
@@ -3320,6 +3408,10 @@ do
 	ipv6_mpath_oif)			ipv6_mpath_oif_test;;
 	ipv6_mpath_oif_nh)		ipv6_mpath_oif_nh_test;;
 	ipv6_mpath_oif_vrf)		ipv6_mpath_oif_vrf_test;;
+	ipv4_oif_fallback)		ipv4_oif_fallback_test;;
+	ipv4_oif_fallback_nh)		ipv4_oif_fallback_nh_test;;
+	ipv6_oif_fallback)		ipv6_oif_fallback_test;;
+	ipv6_oif_fallback_nh)		ipv6_oif_fallback_nh_test;;
 	fib6_ra_to_static)		fib6_ra_to_static;;
 	fib6_temp_addr_renewal)		fib6_temp_addr_renewal;;
 
-- 
2.56.1

