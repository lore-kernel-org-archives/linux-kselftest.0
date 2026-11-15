Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=95.143.172.20
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794743254;
	b=hvGGmxmJ7KlPX/NMvXOLwMp0IpTZyC18ZmUwC6J5gAYE87kxOWh9G7a5GRTiiEjOKToU
	 t3TTKLayBL7TFFtgm7JxZDPExExzFtxk91RQdezZ3a0PSnkeXqyyQTJE4VOtbHm7nJCQn
	 NaM1OA5kXU8jU04c+P9rdqH79MbfsbuNGtzJY88LCctWCHrz/o5veStIJ91mjK5OAx0jn
	 Mpm75mvE+oZ9mEIeCmsE92HT5z/pt6suKZS/TvXASYG2IvumhnK99rm/2mY/vvrovPMCn
	 ik2Tob8cUiTryBkXRR/mc/kdm93lqPmseMbCQup4XPDsra2vseTfSb/LqOPsantPOEA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794743254;
	h=DMARC-Filter:Received:Received:Received:From:To:Cc:Subject:Date:
	 Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding:X-Rspamd-Bar:X-Rspamd-Report:X-Rspamd-Score:
	 DKIM-Signature;
	bh=mSFcKbS1lQeyS6RR9MoTbLC9bCn56H/LcHcx2WJyRaI=;
	b=4h8yY3Bip+2eg4AbwjHJPWGC8eLmeS3/AZijs1/0tQmRtpqohM4Uh/M+GTJI5eX5P7hG
	 xw98k1O/Qlc6d2B877iZDihNyQFBlGy6XSF+Yn2XHVEd+fBKnwlXsEQP+c5I/NADja5KC
	 1QRwMRd68kuin+fBHDP+SbNN612Osqd2ELAqDhXAa+rjotLrqNNNVQigbBqOOcpy/74uJ
	 +hNKHIpqKQSKDcHJXf3N7SDabPpWBTTvn8IxGhbZ8TaDezLNunk3pp7q2A+dsSVDNkd9H
	 Nex7CoHtrnou6ic6f1Qw4zjuQp2O/ODbYle2p+/WNpZKJHcZzW67XybhcC4KnkjHpZw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=lausen.nl;
	spf=pass smtp.mailfrom=lausen.nl;
	dkim=pass header.d=lausen.nl header.i=@lausen.nl header.a=rsa-sha256 header.s=uberspace header.b=MQVHfyjn;
	arc=none smtp.remote-ip=95.143.172.20
Received: from mailgate01.uberspace.is (mailgate01.uberspace.is [95.143.172.20])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6DA86606A323
	for <linux-kselftest@vger.kernel.org>; Sun, 15 Nov 2026 11:47:33 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 6DA86606A323
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=lausen.nl
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=lausen.nl
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (4096-bit key) header.d=lausen.nl header.i=@lausen.nl header.a=rsa-sha256 header.s=uberspace header.b=MQVHfyjn
Received: from devico.uberspace.de (devico.uberspace.de [185.26.156.185])
	by mailgate01.uberspace.is (Postfix) with ESMTPS id 21BD760D54
	for <linux-kselftest@vger.kernel.org>; Sun, 15 Nov 2026 12:47:32 +0100 (CET)
Received: (qmail 20332 invoked by uid 990); 15 Nov 2026 11:47:31 -0000
Authentication-Results: devico.uberspace.de;
	auth=pass (plain)
Received: from unknown (HELO unknown) (::1)
	by devico.uberspace.de (Haraka/3.1.1) with ESMTPSA; Sun, 15 Nov 2026 12:47:31 +0100
From: Leonard Lausen <leonard@lausen.nl>
To: netdev@vger.kernel.org
Cc: leonard@lausen.nl,
	David Ahern <dsahern@kernel.org>,
	Ido Schimmel <idosch@nvidia.com>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@kernel.org>,
	Jakub Kicinski <kuba@kernel.org>,
	Paolo Abeni <pabeni@redhat.com>,
	Simon Horman <horms@kernel.org>,
	Pablo Neira Ayuso <pablo@netfilter.org>,
	Florian Westphal <fw@strlen.de>,
	Phil Sutter <phil@nwl.cc>,
	Shuah Khan <shuah@kernel.org>,
	Daniel Borkmann <daniel@iogearbox.net>,
	netfilter-devel@vger.kernel.org,
	coreteam@netfilter.org,
	linux-kselftest@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH net v2 2/2] selftests: netfilter: cover IPv6 FIB prefix suppression
Date: Sun, 15 Nov 2026 11:44:34 +0000
Message-ID: <20261115114434.10343-6-leonard@lausen.nl>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20261115114434.10343-2-leonard@lausen.nl>
References: <20261115114434.10343-2-leonard@lausen.nl>
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
X-Rspamd-Bar: -----
X-Rspamd-Report: REPLY(-4) BAYES_HAM(-2.999997) MID_CONTAINS_FROM(1) MIME_GOOD(-0.1) R_MISSING_CHARSET(0.5)
X-Rspamd-Score: -5.599997
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
	d=lausen.nl; s=uberspace;
	h=from:to:cc:subject:date;
	bh=SYO3awDBeB5+65vjU95aaGWIQtWLWSpyrg4LOxfZCZE=;
	b=MQVHfyjnLRA1ukUj9w+LpSUejjRiPHHUD/SVTZzBZK7J9A/UqmSrGw8KI6zCvkDqYhGNANXq4S
	S2IuHcTGrnkiRE8ZFesckV3jRCzrdXg8vcGo1XWaoIazeSWDGCEq3k6H62YvbclyT5VreKVQJ3f9
	ItaE23zjPknOmvtE9JDtoycj0//Yp1EckXq1hUnNPHmyge9toPcqpBLIAwvNzUD/Wlq/AtrGFkSM
	YX6LuBnJCcorsbU4y7mK9Os368A6WxfO+Zdbol8GFUOxP3IlPzqFIGQ5r8SAlGbqTdkmOHKySJod
	gX5F1rcAy92xR3A3oxMGIuevVhp7lkYTiE6mYg635nJzqS6V8AYUk6uiomNFCODlOIgWurholDmA
	80vs4QyL7d5mcyNluQYVYgkLd89m91uf546KE+gKb1vdiImBrC6YdwyCzpRxjWtv3oAGLdu2w5D6
	FXdfC7QfZZfeBPYt01ZdEacQUi4bf8t+Nh/yPdXVj1krm8bpUGrJxNRVsCC0sgB/9Vea+zBFvHoW
	/XHJiWnQmE65mT/+SVhemhVy7k2IgS2zDw/Y69urB3DPMXxZJGmWqKUph4A/c0KuH6dCuky7pOJ4
	JPuDanDYL7qdHvX7hjmuSdP2qCfemvU5BKVrjZibTxx8dk9atdMf+wxm22z9Znf2cW2vHCiLXgUq
	A=

Extend nft_fib.sh using its existing namespaces and counter helper to
check that suppress_prefixlength 0 suppresses a default route while
retaining a more-specific route. Check that blackhole, unreachable and
prohibit routes remain terminal despite a usable route in a later table.
Include a blackhole nexthop object to distinguish result reject flags
from flags on the FIB entry.

Require a positive packet counter for the expected nftables FIB result
and compare it with an ordinary route lookup. Install the router's
logging RPF rules after these checks and their policy-rule cleanup, so
neighbour advertisements cannot be logged and dropped while intentionally
different reverse routes are installed.

Assisted-by: LLM
Signed-off-by: Leonard Lausen <leonard@lausen.nl>
---
 .../selftests/net/netfilter/nft_fib.sh        | 63 ++++++++++++++++++-
 1 file changed, 62 insertions(+), 1 deletion(-)

diff --git a/tools/testing/selftests/net/netfilter/nft_fib.sh b/tools/testing/selftests/net/netfilter/nft_fib.sh
index 04544905c216..65d4687622e2 100755
--- a/tools/testing/selftests/net/netfilter/nft_fib.sh
+++ b/tools/testing/selftests/net/netfilter/nft_fib.sh
@@ -202,7 +202,38 @@ check_fib_counter() {
 	return 0
 }
 
-load_ruleset "$nsrouter"
+# Count probes matching the expected FIB result, then drop them.
+test_fib_suppress() {
+	local label="$1" expected="$2"
+	local result="${3:-oifname}" err=0
+
+	ip netns exec "$nsrouter" nft -f /dev/stdin <<EOF || return 1
+flush table ip6 filter
+table ip6 filter {
+	chain prerouting {
+		type filter hook prerouting priority -1;
+		ip6 saddr dead:1::99 icmpv6 type echo-request \
+			fib saddr . mark $result "$expected" counter drop
+	}
+}
+EOF
+	ip netns exec "$ns1" ping -6 -c 1 -W 0.1 -q dead:1::1 > /dev/null 2>&1
+	if [ "$result" = type ]; then
+		ip -net "$nsrouter" -6 route get dead:1::99 from dead:1::1 > /dev/null 2>&1 && err=1
+	else
+		ip -net "$nsrouter" -6 route get dead:1::99 from dead:1::1 |
+			grep -q "dev $expected " || err=1
+	fi
+	if check_fib_type_counter_family ip6 1 "$nsrouter" prerouting "$result" "$label" &&
+	   [ "$err" -eq 0 ]; then
+		echo "PASS: $label"
+	else
+		echo "FAIL: $label"
+		ret=1
+		return 1
+	fi
+}
+
 load_ruleset "$ns1"
 load_ruleset "$ns2"
 
@@ -724,6 +755,36 @@ test_fib_vrf()
 	check_fib_veth_vrf_type "fib expression address types match (iif in vrf)"
 }
 
+# Test prefix suppression before installing the router's logging RPF rules.
+# Neighbour discovery must remain usable even when reverse routes differ.
+ip -net "$nsrouter" -6 route add table 128 default dev veth1 || exit 1
+ip -net "$nsrouter" -6 route add table 129 dead:1::/64 dev veth0 || exit 1
+ip -net "$nsrouter" -6 rule add pref 100 to dead:1::99 table 128 suppress_prefixlength 0 || exit 1
+ip -net "$nsrouter" -6 rule add pref 101 to dead:1::99 table 129 || exit 1
+ip netns exec "$nsrouter" nft add table ip6 filter || exit 1
+
+test_fib_suppress "suppress default route" veth0 || ret=1
+ip -net "$nsrouter" -6 route add table 128 dead:1::/64 dev veth1 || exit 1
+test_fib_suppress "retain non-default route" veth1 || ret=1
+ip -net "$nsrouter" -6 route del table 128 dead:1::/64 dev veth1 || exit 1
+
+for type in blackhole unreachable prohibit; do
+	ip -net "$nsrouter" -6 route replace "$type" default table 128 || exit 1
+	test_fib_suppress "retain $type" "$type" type || ret=1
+done
+
+ip -net "$nsrouter" -6 nexthop add id 1 blackhole || exit 1
+ip -net "$nsrouter" -6 route replace default nhid 1 table 128 || exit 1
+test_fib_suppress "retain blackhole nexthop" blackhole type || ret=1
+
+ip -net "$nsrouter" -6 rule del pref 100
+ip -net "$nsrouter" -6 rule del pref 101
+ip -net "$nsrouter" -6 route del table 128 default
+ip -net "$nsrouter" -6 route flush table 129
+ip -net "$nsrouter" -6 nexthop del id 1
+ip netns exec "$nsrouter" nft delete table ip6 filter
+load_ruleset "$nsrouter"
+
 ip netns exec "$nsrouter" sysctl net.ipv6.conf.all.forwarding=1 > /dev/null
 ip netns exec "$nsrouter" sysctl net.ipv4.conf.veth0.forwarding=1 > /dev/null
 ip netns exec "$nsrouter" sysctl net.ipv4.conf.veth1.forwarding=1 > /dev/null
-- 
2.55.0

