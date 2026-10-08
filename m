Received: from cmccmta6.chinamobile.com (cmccmta6.chinamobile.com [111.22.67.139])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 53FBB1FBC8C;
	Sat, 10 Oct 2026 01:19:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=111.22.67.139
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791595175; cv=none; b=HIN7JV42juCvVHzdMtVMLRn+t1k+8ooNHw5Qqo0Wq9g5ulcTsMRpEPJbSTMLpDCVoBLeW8WSbh80rHdv1cptmc2UwVTUxKBOUeEYdnAQNhonpBnwEmnEbs9ilne2ePU1C1LpXjEhnQJCsgUNnRtxsk6vhyzRf/8gT/Jsx3uFOm0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791595175; c=relaxed/simple;
	bh=bO6yVuUF8gN/sYXlRsL4XVg/twXvxzVG5iJv3Gs+Z3Q=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=KRGwX2+yhWY0iGRFve90tLCzF/aLT8k5YOYUuktkh0lxrCXWlRh9ETIvIqIJfJ4o9MEKOnLwzjjeyyT0ik2rrC5Q8/anHeoJIC/SdI7qNgpQ2F33dPpwHTrN8aS/q97PbgBRDbXD0EFZ6vi4ElwVUhCV5SeD84qPsKqAehlB/ps=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=cmss.chinamobile.com; spf=pass smtp.mailfrom=cmss.chinamobile.com; dkim=pass (1024-bit key) header.d=cmss.chinamobile.com header.i=@cmss.chinamobile.com header.b=Rs/v/GrD; arc=none smtp.client-ip=111.22.67.139
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=cmss.chinamobile.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=cmss.chinamobile.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=cmss.chinamobile.com header.i=@cmss.chinamobile.com header.b="Rs/v/GrD"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=cmss.chinamobile.com; s=default; l=0;
	h=from:subject:message-id:to:cc:mime-version;
	bh=47DEQpj8HBSa+/TImW+5JCeuQeRkm5NMpJWZG3hSuFU=;
	b=Rs/v/GrDZ/YbOctOxd+Ooui2QcY/vDirwnq77FzHTX/bDX8BqeAKxr9uRobwssITgSUVBRDwjaNH/
	 YZ9gKjsq6MAnwZonlZLJ8ISBqlc9F2TtkeCHqt9vTYkJlu+fVNWFUuO8xEpet5LgpRksfAuTSRrI8Q
	 3TpuNAy2X50PyjDg=
X-RM-TagInfo: emlType=0                                       
X-RM-SPAM-FLAG:00000000
Received:from spf.mail.chinamobile.com (unknown[10.188.0.87])
	by rmmx-syy-dmz-app09-12009 (RichMail) with SMTP id 2ee96ac9929b258-c8b03;
	Sat, 10 Oct 2026 09:19:24 +0800 (CST)
X-RM-TRANSID:2ee96ac9929b258-c8b03
X-RM-TagInfo: emlType=0                                       
X-RM-SPAM-FLAG:00000000
Received:from  (unknown[223.108.79.100])
	by rmsmtp-syy-appsvr02-12002 (RichMail) with SMTP id 2ee26ac99295573-59a05;
	Sat, 10 Oct 2026 09:19:24 +0800 (CST)
X-RM-TRANSID:2ee26ac99295573-59a05
From: Haishuang Yan <yanhaishuang@cmss.chinamobile.com>
To: netdev@vger.kernel.org
Cc: Alice Mikityanska <alice.kernel@fastmail.im>,
	Daniel Borkmann <daniel@iogearbox.net>,
	Andrew Lunn <andrew+netdev@lunn.ch>,
	"David S . Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@kernel.org>,
	Jakub Kicinski <kuba@kernel.org>,
	Paolo Abeni <pabeni@redhat.com>,
	Shuah Khan <shuah@kernel.org>,
	linux-kselftest@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Haishuang Yan <yanhaishuang@cmss.chinamobile.com>
Subject: [PATCH net-next v3 2/2] selftests: net: big_tcp_tunnels: Cover bareudp
Date: Thu,  8 Oct 2026 13:55:13 +0800
Message-ID: <20261008055513.1560739-3-yanhaishuang@cmss.chinamobile.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20261008055513.1560739-1-yanhaishuang@cmss.chinamobile.com>
References: <20261008055513.1560739-1-yanhaishuang@cmss.chinamobile.com>
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Now that bareudp allows BIG TCP too, run the same checks over bareudp as
for vxlan and geneve.

bareudp only works in external mode, so attach the tunnel metadata to
all packets sent through the device with a tc tunnel_key action on
egress. The device uses ethertype ipv4 with multiproto, so that both
IPv4 and IPv6 traffic can go through it. Its MTU does not account for
the encapsulation, so lower it to leave room for the IPv6 and UDP
headers, otherwise the encapsulated packets would be fragmented.

Assisted-by: LLM
Signed-off-by: Haishuang Yan <yanhaishuang@cmss.chinamobile.com>
---
 .../testing/selftests/net/big_tcp_tunnels.sh  | 52 +++++++++++++++----
 1 file changed, 43 insertions(+), 9 deletions(-)

diff --git a/tools/testing/selftests/net/big_tcp_tunnels.sh b/tools/testing/selftests/net/big_tcp_tunnels.sh
index cc0875e52fb9..2c841b4b79a5 100755
--- a/tools/testing/selftests/net/big_tcp_tunnels.sh
+++ b/tools/testing/selftests/net/big_tcp_tunnels.sh
@@ -1,7 +1,7 @@
 #!/usr/bin/env bash
 # SPDX-License-Identifier: GPL-2.0
 #
-# Testing for IPv4 and IPv6 BIG TCP over VXLAN and GENEVE tunnels.
+# Testing for IPv4 and IPv6 BIG TCP over VXLAN, GENEVE and bareudp tunnels.
 
 source "$(dirname "$0")/lib.sh"
 
@@ -53,6 +53,21 @@ setup() {
 	DEFAULT_TCP_MIN_TSO_SEGS=$(ip netns exec "$CLIENT_NS" sysctl -n net.ipv4.tcp_min_tso_segs)
 }
 
+# Create a bareudp device. bareudp only works in external mode: attach the
+# tunnel metadata to all packets sent through the device. Its MTU does not
+# account for the encapsulation either, so leave room for IPv6 and UDP
+# headers.
+# $1: netns, $2: device, $3: local underlay address, $4: remote one
+setup_bareudp() {
+	ip -netns "$1" link add "$2" type bareudp \
+		dstport 6635 ethertype ipv4 multiproto &&
+	ip -netns "$1" link set "$2" mtu 1452 &&
+	tc -netns "$1" qdisc add dev "$2" clsact &&
+	tc -netns "$1" filter add dev "$2" egress matchall \
+		action tunnel_key set src_ip "$3" dst_ip "$4" id 0 ttl 64 ||
+	{ echo "Failed to set up bareudp device $2" >&2; return 1; }
+}
+
 setup_tunnel() {
 	if [ "$2" = 4 ]; then
 		SERVER_IP="$SERVER_IP4"
@@ -64,26 +79,40 @@ setup_tunnel() {
 		echo "Setting up ${1^^} over IPv6, veth tx csum offload $3"
 	fi
 
-	if [ "$1" = vxlan ]; then
+	case "$1" in
+	vxlan)
 		ip -netns "$CLIENT_NS" link add tun0 type vxlan \
 			id 5001 remote "$SERVER_IP" local "$CLIENT_IP" dev link0 dstport 4789
-	else
+		;;
+	geneve)
 		ip -netns "$CLIENT_NS" link add tun0 type geneve \
 			id 5001 remote "$SERVER_IP"
-	fi
+		;;
+	bareudp)
+		setup_bareudp "$CLIENT_NS" tun0 "$CLIENT_IP" "$SERVER_IP" ||
+			return 1
+		;;
+	esac
 	ip -netns "$CLIENT_NS" link set tun0 up
 	ip -netns "$CLIENT_NS" addr replace "$CLIENT_IP4_TUN/24" dev tun0
 	ip -netns "$CLIENT_NS" addr replace "$CLIENT_IP6_TUN/112" dev tun0 nodad
 	ip -netns "$CLIENT_NS" link set tun0 \
 		gso_max_size 196608 gso_ipv4_max_size 196608 \
 		gro_max_size 196608 gro_ipv4_max_size 196608
-	if [ "$1" = vxlan ]; then
+	case "$1" in
+	vxlan)
 		ip -netns "$SERVER_NS" link add tun1 type vxlan \
 			id 5001 remote "$CLIENT_IP" local "$SERVER_IP" dev link1 dstport 4789
-	else
+		;;
+	geneve)
 		ip -netns "$SERVER_NS" link add tun1 type geneve \
 			id 5001 remote "$CLIENT_IP"
-	fi
+		;;
+	bareudp)
+		setup_bareudp "$SERVER_NS" tun1 "$SERVER_IP" "$CLIENT_IP" ||
+			return 1
+		;;
+	esac
 	ip -netns "$SERVER_NS" link set tun1 up
 	ip -netns "$SERVER_NS" addr replace "$SERVER_IP4_TUN/24" dev tun1
 	ip -netns "$SERVER_NS" addr replace "$SERVER_IP6_TUN/112" dev tun1 nodad
@@ -112,7 +141,7 @@ do_test() {
 	local packets_threshold="$PACKETS_THRESHOLD"
 
 	# When tx csum offload is off, software GSO is performed before passing the
-	# packet to veth. Check BIG TCP packets inside the VXLAN tunnel to verify
+	# packet to veth. Check BIG TCP packets inside the tunnel to verify
 	# the software checksum path: if the checksum code is broken, these packets
 	# will be dropped.
 	if [ "$3" = on ]; then
@@ -192,6 +221,11 @@ if ! iptables --version &> /dev/null; then
 	exit "$ksft_skip"
 fi
 
+if ! tc -V &> /dev/null; then
+	echo "SKIP: Could not run test without tc tool"
+	exit "$ksft_skip"
+fi
+
 if ! ethtool --version &> /dev/null; then
 	echo "SKIP: Could not run test without ethtool tool"
 	exit "$ksft_skip"
@@ -205,7 +239,7 @@ fi
 WORKDIR=$(mktemp -d)
 trap cleanup EXIT
 setup
-for tunnel in vxlan geneve; do
+for tunnel in vxlan geneve bareudp; do
 	for tun_family in 4 6; do
 		for traffic_family in 4 6; do
 			for csum_offload in on off; do
-- 
2.43.0



