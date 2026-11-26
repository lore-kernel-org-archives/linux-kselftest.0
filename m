Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=111.22.67.139
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795661471;
	b=lWkPEkGtZr+H2FEBS7u/lztz9lOIDUDFWkgCheOtSEowEAdaVYDMEvjMc3BNrHMPR5xP
	 SLB3TmJWgI2mfX52BFsPIVInt/KCkKGUsS2e+elQu6CDM+fqa+Ms7lpHXsMgaFUfE3gME
	 VlqhzEbifEPBu16NhaRKrO2hTYLHgoK1nZ37gIKBAZLtz43eXiqfyrI3KVoldbpJDXxxa
	 yEdoDfu7lOfc/1n7e7JYbKEqgsrcd+8oPCtIbooV+5hIb5/zWANMZWGeeUx8FRlHY0R8j
	 pJdITgOshoFRcmomdENCaCuHdztJOeI9OUgm97T+N8yg77ekdue++MKXGuT3AkV3FRA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795661471;
	h=DMARC-Filter:DKIM-Signature:X-RM-TagInfo:X-RM-SPAM-FLAG:Received:
	 X-RM-TRANSID:X-RM-TagInfo:X-RM-SPAM-FLAG:Received:X-RM-TRANSID:From:
	 To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=dOs0QGgrUiUPEdrg7wekwgXMxcapi697ENy3Bj6of1Y=;
	b=bC4R43HljfxeGf7ug+zNwXpjhTDmc0vb3r45qXcGtZQLdsKczvgnvZmpy6cD+w4xcZgU
	 nn5OJqQx9T33xebGiCzYS3a5mq6mVC4RDVcWklvIQdsUURwpvcuPRTrhezJU/+jOkt4lc
	 V1PbhZdivTfbskE0P8rrSczMyyzC05wRTAjm+QhSV2mqsiGz+q4PcvRfaazSAoWuXNkab
	 5oimKZSVO6SprSAIVni2bwAc59twM3fQIdnfSjWFSk2G3T+ZxpiWvHGjT/qjgFHKNaMVi
	 ns6mXHc5kYAz3z3tWZAJQz0Rrxo9Rqj3jHIJwLXhlxzJ/dviI/TAWa88Xn6/y33r94w==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=cmss.chinamobile.com;
	spf=pass smtp.mailfrom=cmss.chinamobile.com;
	dkim=pass header.d=cmss.chinamobile.com header.i=@cmss.chinamobile.com header.a=rsa-sha256 header.s=default header.b=eLXr+8V8;
	arc=none smtp.remote-ip=111.22.67.139
Received: from cmccmta6.chinamobile.com (cmccmta6.chinamobile.com [111.22.67.139])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8AA42606A33D;
	Thu, 26 Nov 2026 02:51:10 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 8AA42606A33D
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=cmss.chinamobile.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=cmss.chinamobile.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=cmss.chinamobile.com header.i=@cmss.chinamobile.com header.a=rsa-sha256 header.s=default header.b=eLXr+8V8
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=cmss.chinamobile.com; s=default; l=0;
	h=from:subject:message-id:to:cc:mime-version;
	bh=47DEQpj8HBSa+/TImW+5JCeuQeRkm5NMpJWZG3hSuFU=;
	b=eLXr+8V8txP/Ab6FfLuJnQlU33W4tD7OIXMq0O1XLoqPqL22HPRHK4EVYc3xuuRK7afj/WNMG8ldb
	 TvF+idFmi81nwwl3d6YwItpYEpLZPw8CDwtxJlAzDAWty1pf/MthD/imaZCIVXE/6QQvARuFlFo/yV
	 a5PKECBN2lguKlyg=
X-RM-TagInfo: emlType=0                                       
X-RM-SPAM-FLAG:00000000
Received:from spf.mail.chinamobile.com (unknown[10.188.0.87])
	by rmmx-syy-dmz-app09-12009 (RichMail) with SMTP id 2ee96b079e9c9d8-5c714;
	Thu, 26 Nov 2026 10:51:08 +0800 (CST)
X-RM-TRANSID:2ee96b079e9c9d8-5c714
X-RM-TagInfo: emlType=0                                       
X-RM-SPAM-FLAG:00000000
Received:from  (unknown[104.224.130.48])
	by rmsmtp-syy-appsvr08-12008 (RichMail) with SMTP id 2ee86b079e693eb-59c62;
	Thu, 26 Nov 2026 10:51:08 +0800 (CST)
X-RM-TRANSID:2ee86b079e693eb-59c62
From: Haishuang Yan <yanhaishuang@cmss.chinamobile.com>
To: netdev@vger.kernel.org
Cc: David Ahern <dsahern@kernel.org>,
	Ido Schimmel <idosch@nvidia.com>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@kernel.org>,
	Jakub Kicinski <kuba@kernel.org>,
	Paolo Abeni <pabeni@redhat.com>,
	Simon Horman <horms@kernel.org>,
	Shuah Khan <shuah@kernel.org>,
	Alice Mikityanska <alice.kernel@fastmail.im>,
	Lorenzo Bianconi <lorenzo.bianconi@oss.qualcomm.com>,
	linux-kselftest@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH net-next v2 6/6] selftests: net: big_tcp_tunnels: Cover IP tunnels
Date: Wed, 25 Nov 2026 18:50:15 -0800
Message-ID: <20261126025015.10416-7-yanhaishuang@cmss.chinamobile.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20261126025015.10416-1-yanhaishuang@cmss.chinamobile.com>
References: <20261126025015.10416-1-yanhaishuang@cmss.chinamobile.com>
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

Now that ipip, gre, gretap, sit, ip6tnl, ip6gre and ip6gretap allow BIG
TCP too, run the same checks over them as for vxlan, geneve and
bareudp, without encapsulation and with FOU and GUE. With FOU and GUE,
turn on the outer UDP checksum, which is off by default on an IPv4
underlay, so that it is checked too.

sit only carries IPv6, and is only run with veth tx checksum offload
enabled: unlike the other tunnels it does not use gro_cells on receive,
so with software GSO on the sender the receiver does not see any BIG
TCP packet.

fou is not loaded on demand when it is built as a module, so load fou
and fou6 first, and skip the FOU and GUE cases if that fails.

Signed-off-by: Haishuang Yan <yanhaishuang@cmss.chinamobile.com>
---
 .../testing/selftests/net/big_tcp_tunnels.sh  | 139 +++++++++++++++++-
 1 file changed, 136 insertions(+), 3 deletions(-)

diff --git a/tools/testing/selftests/net/big_tcp_tunnels.sh b/tools/testing/selftests/net/big_tcp_tunnels.sh
index 9c1482b842b..1e8387fce99 100755
--- a/tools/testing/selftests/net/big_tcp_tunnels.sh
+++ b/tools/testing/selftests/net/big_tcp_tunnels.sh
@@ -1,7 +1,9 @@
 #!/usr/bin/env bash
 # SPDX-License-Identifier: GPL-2.0
 #
-# Testing for IPv4 and IPv6 BIG TCP over VXLAN, GENEVE and bareudp tunnels.
+# Testing for IPv4 and IPv6 BIG TCP over VXLAN, GENEVE and bareudp tunnels,
+# and over ipip, gre, gretap, sit, ip6tnl, ip6gre and ip6gretap tunnels,
+# without encapsulation and with FOU and GUE.
 
 source "$(dirname "$0")/lib.sh"
 
@@ -17,6 +19,8 @@ CLIENT_IP6="2001:db8::1:2"
 CLIENT_IP4_TUN="192.168.2.2"
 CLIENT_IP6_TUN="2001:db8::2:2"
 
+FOU_PORT=5555
+
 # Kselftest framework requirement - SKIP code is 4.
 ksft_skip=4
 
@@ -71,15 +75,86 @@ setup_bareudp() {
 	return 1
 }
 
+# $1: tunnel type, $2: traffic family
+# Prints the IP protocol carried by FOU for this tunnel.
+fou_ipproto() {
+	case "$1" in
+	ipip)
+		echo 4
+		;;
+	sit)
+		echo 41
+		;;
+	ip6tnl)
+		if [ "$2" = 4 ]; then
+			echo 4
+		else
+			echo 41
+		fi
+		;;
+	*)
+		echo 47
+		;;
+	esac
+}
+
+# Create an IP tunnel device, with FOU or GUE encapsulation if requested.
+# $1: netns, $2: device, $3: tunnel type, $4: tunnel family,
+# $5: traffic family, $6: encapsulation (none, fou or gue),
+# $7: local underlay address, $8: remote one
+setup_ip_tunnel() {
+	local encap_args=()
+	local fou_args=()
+	local mode=()
+
+	if [ "$4" = 6 ]; then
+		fou_args=(-6)
+	fi
+	if [ "$6" = fou ]; then
+		ip -netns "$1" fou add port "$FOU_PORT" \
+			ipproto "$(fou_ipproto "$3" "$5")" "${fou_args[@]}" ||
+			return 1
+	elif [ "$6" = gue ]; then
+		ip -netns "$1" fou add port "$FOU_PORT" gue "${fou_args[@]}" ||
+			return 1
+	fi
+	if [ "$6" != none ]; then
+		encap_args=(encap "$6" encap-sport auto encap-dport "$FOU_PORT")
+		# Check the outer UDP checksum too
+		if [ "$4" = 4 ]; then
+			encap_args+=(encap-csum)
+		else
+			encap_args+=(encap-udp6-csum)
+		fi
+	fi
+	if [ "$3" = ip6tnl ]; then
+		if [ "$5" = 4 ]; then
+			mode=(mode ipip6)
+		else
+			mode=(mode ip6ip6)
+		fi
+	fi
+
+	ip -netns "$1" link add "$2" type "$3" "${mode[@]}" \
+		local "$7" remote "$8" "${encap_args[@]}"
+}
+
+# $1: tunnel type, $2: tunnel family, $3: veth tx csum offload,
+# and for IP tunnels: $4: traffic family, $5: encapsulation
 setup_tunnel() {
+	local name="${1^^}"
+
+	if [ "${5:-none}" != none ]; then
+		name="$name/${5^^}"
+	fi
 	if [ "$2" = 4 ]; then
 		SERVER_IP="$SERVER_IP4"
 		CLIENT_IP="$CLIENT_IP4"
-		echo "Setting up ${1^^} over IPv4, veth tx csum offload $3"
+		echo "Setting up $name over IPv4, veth tx csum offload $3"
 	else
 		SERVER_IP="$SERVER_IP6"
 		CLIENT_IP="$CLIENT_IP6"
-		echo "Setting up ${1^^} over IPv6, veth tx csum offload $3"
+		echo "Setting up $name over IPv6, veth tx csum offload $3"
 	fi
 
 	case "$1" in
@@ -95,6 +170,10 @@ setup_tunnel() {
 		setup_bareudp "$CLIENT_NS" tun0 "$CLIENT_IP" "$SERVER_IP" ||
 			return 1
 		;;
+	*)
+		setup_ip_tunnel "$CLIENT_NS" tun0 "$1" "$2" "$4" "$5" \
+			"$CLIENT_IP" "$SERVER_IP" || return 1
+		;;
 	esac
 	ip -netns "$CLIENT_NS" link set tun0 up
 	ip -netns "$CLIENT_NS" addr replace "$CLIENT_IP4_TUN/24" dev tun0
@@ -115,6 +194,10 @@ setup_tunnel() {
 		setup_bareudp "$SERVER_NS" tun1 "$SERVER_IP" "$CLIENT_IP" ||
 			return 1
 		;;
+	*)
+		setup_ip_tunnel "$SERVER_NS" tun1 "$1" "$2" "$4" "$5" \
+			"$SERVER_IP" "$CLIENT_IP" || return 1
+		;;
 	esac
 	ip -netns "$SERVER_NS" link set tun1 up
 	ip -netns "$SERVER_NS" addr replace "$SERVER_IP4_TUN/24" dev tun1
@@ -127,9 +210,22 @@ setup_tunnel() {
 	ip netns exec "$SERVER_NS" ethtool -K link1 tx-checksumming "$3" > /dev/null
 }
 
+# For IP tunnels: $1: tunnel family, $2: encapsulation
 cleanup_tunnel() {
+	local fou_args=()
+	local ns
+
 	ip -netns "$CLIENT_NS" link del tun0
 	ip -netns "$SERVER_NS" link del tun1
+	if [ "${2:-none}" = none ]; then
+		return 0
+	fi
+	if [ "$1" = 6 ]; then
+		fou_args=(-6)
+	fi
+	for ns in "$CLIENT_NS" "$SERVER_NS"; do
+		ip -netns "$ns" fou del port "$FOU_PORT" "${fou_args[@]}"
+	done
 }
 
 cleanup() {
@@ -240,6 +336,30 @@ if ! ip link help 2>&1 | grep gso_ipv4_max_size &> /dev/null; then
 	exit "$ksft_skip"
 fi
 
+# $1: tunnel type, $2: tunnel family, $3: traffic family, $4: encapsulation
+run_ip_tunnel() {
+	local csum_offload
+
+	for csum_offload in on off; do
+		# sit does not use gro_cells on receive, so with software GSO
+		# on the sender there is nothing big to receive.
+		if [ "$1" = sit ] && [ "$csum_offload" = off ]; then
+			continue
+		fi
+		setup_tunnel "$1" "$2" "$csum_offload" "$3" "$4" || exit "$?"
+		do_test "$2" "$3" "$csum_offload" || exit "$?"
+		cleanup_tunnel "$2" "$4"
+	done
+}
+
+# fou is not loaded on demand when built as a module
+ENCAPS=(none)
+if modprobe -q fou && modprobe -q fou6; then
+	ENCAPS+=(fou gue)
+else
+	echo "SKIP: FOU and GUE tests, could not load fou and fou6"
+fi
+
 WORKDIR=$(mktemp -d)
 trap cleanup EXIT
 setup
@@ -254,3 +374,16 @@ for tunnel in vxlan geneve bareudp; do
 		done
 	done
 done
+for encap in "${ENCAPS[@]}"; do
+	run_ip_tunnel ipip 4 4 "$encap"
+	for traffic_family in 4 6; do
+		run_ip_tunnel gre 4 "$traffic_family" "$encap"
+		run_ip_tunnel gretap 4 "$traffic_family" "$encap"
+	done
+	run_ip_tunnel sit 4 6 "$encap"
+	for traffic_family in 4 6; do
+		run_ip_tunnel ip6tnl 6 "$traffic_family" "$encap"
+		run_ip_tunnel ip6gre 6 "$traffic_family" "$encap"
+		run_ip_tunnel ip6gretap 6 "$traffic_family" "$encap"
+	done
+done
-- 
2.43.0



