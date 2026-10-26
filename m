Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=130.117.225.111
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793017512;
	b=X3JqZxqW9babhdcdGVYZ2G1U1R2NPpUIHz/dorcJTKbeeSIN6CwNerAtEg9YSlndPu6z
	 v5gl5QyClpbTEfjj9rPjogqSpvUpsSmmleW4GQVKCPpDtcP8iKSs2lCnnz+4IXuOgLdJd
	 T3h/z0nQZOWCJCuzmSmWkzj+0VKJlWkswhi2jTO1pDlUNar5HGUrmpkuiRyYvFbLyxd/C
	 d7Tik8lcbiOPxUsWqLDWkRLL7lZYJlupQZMSjl64tljtovN+QIxZRFjUVgEID7SOk3OEN
	 9ou3H1ZmtLfLTt+k4CD8HWmhYDqCBod7IqRJoZI2dzKn2o3oCx+exAqd6Le7Dp/h85Q==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793017512;
	h=DMARC-Filter:DKIM-Signature:Received:From:To:Cc:Subject:Date:
	 Message-ID:X-Mailer:MIME-Version:Content-Transfer-Encoding;
	bh=wa7YoBBd7JzA0bL8omeqz71lvo/LcqYa/z0727D7QW8=;
	b=oWJqA29buCazwjK8ejAen0XLxAWwJWVvLCve3JbQ/uwEpwM/b3E07G9TlFqTiJBoli8p
	 zyf55zw2UrAzwUvAe8zVr1oeqyXSe/8sr43QxSse96T2lcQPkW4v0b0ENIZdyW5BrPBHi
	 Z2RC6nFSFqFyAE9Kh/Tzpja6/CWIavl2GhUPR5v+/e7VGYckxL9jO5HfwjdWh/MIk7QsR
	 eKtSGVCDsH2KYjbIQMwJW3+kIX3GkS8QfTGqXBz/8uMt6xyfKhvD5Uw1iQ2Y36IlB0Ruv
	 h+oEOgOx/7SVNZgejjQaH+xpy9fu4k8p/UtsfMIVyLZPMIrJWe1Kg/7Bg1tEzu9LFWw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=virtuozzo.com;
	spf=pass smtp.mailfrom=virtuozzo.com;
	dkim=pass header.d=virtuozzo.com header.i=@virtuozzo.com header.a=rsa-sha256 header.s=relay header.b=dFgsTXxN;
	arc=none smtp.remote-ip=130.117.225.111
Received: from relay.virtuozzo.com (relay.virtuozzo.com [130.117.225.111])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 57E92606A31A;
	Mon, 26 Oct 2026 12:25:11 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 57E92606A31A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=virtuozzo.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=virtuozzo.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=virtuozzo.com header.i=@virtuozzo.com header.a=rsa-sha256 header.s=relay header.b=dFgsTXxN
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=virtuozzo.com; s=relay; h=MIME-Version:Message-ID:Date:Subject:From:
	Content-Type; bh=wa7YoBBd7JzA0bL8omeqz71lvo/LcqYa/z0727D7QW8=; b=dFgsTXxNYG6J
	+E/f4BNFuOF4LeltcVBbHCXvwL5i5z0X8eaahCjNi1RAa3baflqXGcwI6i2pwtR9GiptwNiQfWpDQ
	sNQeINdmD4ridjIgy8+f7str2qk8IR6XDi3vADJt9qnBRNy4LhdWdQYE9I+QkGl4n9bm/RsWZuau7
	LotIr+TxSILlMAliuLFK/vnmt1MV0qwnTJeAzyMQwkEDP9EW2OZq0FW8prbwBnpWMpO/YDpjR1Goj
	FE7HaoSGLUDoJjzmWNa3GtcC16U93qDAdmAtoa9bD0aydsV1fM63vOZ1n401ZMUCB6uNY9ai5gpiY
	bdhrlMWawdOqsUkRWReeCg==;
Received: from ch-vpn.virtuozzo.com ([130.117.225.6] helo=LekKit-T14)
	by relay.virtuozzo.com with esmtp (Exim 4.96)
	(envelope-from <eva.kurchatova@virtuozzo.com>)
	id 1xLJhK-0029cR-0C;
	Mon, 26 Oct 2026 13:24:48 +0100
From: Eva Kurchatova <eva.kurchatova@virtuozzo.com>
To: "David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@kernel.org>,
	Jakub Kicinski <kuba@kernel.org>,
	Paolo Abeni <pabeni@redhat.com>,
	Simon Horman <horms@kernel.org>,
	Shuah Khan <shuah@kernel.org>
Cc: linux-kernel@vger.kernel.org,
	Willem de Bruijn <willemdebruijn.kernel@gmail.com>,
	Eva Kurchatova <eva.kurchatova@virtuozzo.com>,
	netdev@vger.kernel.org,
	linux-kselftest@vger.kernel.org
Subject: [PATCH] selftests: net: veth: check UDP GRO forwarding on forwarded traffic
Date: Mon, 26 Oct 2026 14:24:35 +0200
Message-ID: <20261026122440.603302-1-eva.kurchatova@virtuozzo.com>
X-Mailer: git-send-email 2.56.0
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

The rx-udp-gro-forwarding checks fail with "got 10 packets, expected 1"
on a host where something has a UDP tunnel socket, a vxlan say, and
pass on a host where nothing does. Since commit 36707061d6ba ("udp:
allow forwarding of plain (non-fraglisted) UDP GRO packets") the
feature aggregates only datagrams GRO finds no socket for, and GRO
looks the socket up only once a tunnel socket exists on the host; the
checks send to a socket in the receiving namespace, so they pass only
while nothing looks it up.

Let the destination forward the datagrams to a receiver in a namespace
behind it: no local socket is found there, tunnel or not, and the
checks count what the destination receives as before.

Fixes: 1c3cadbe0242 ("self-tests: add veth tests")
Suggested-by: Willem de Bruijn <willemdebruijn.kernel@gmail.com>
Link: https://lore.kernel.org/netdev/CAF=yD-LZSec9g_0bBgrcQvq2OO1BrxMSRHH=uU7eamCmWcTO_A@mail.gmail.com/
Signed-off-by: Eva Kurchatova <eva.kurchatova@virtuozzo.com>
---
 tools/testing/selftests/net/veth.sh | 26 ++++++++++++++++++++++----
 1 file changed, 22 insertions(+), 4 deletions(-)

diff --git a/tools/testing/selftests/net/veth.sh b/tools/testing/selftests/net/veth.sh
index 8b867e0675a7..be7c6b9213a9 100755
--- a/tools/testing/selftests/net/veth.sh
+++ b/tools/testing/selftests/net/veth.sh
@@ -9,12 +9,17 @@ readonly DST=1
 readonly DST_NAT=100
 readonly NS_SRC=$BASE$SRC
 readonly NS_DST=$BASE$DST
+# The receiver of the GRO checks, behind the destination
+readonly RCV=3
+readonly NS_RCV=$BASE$RCV
 # shellcheck disable=SC2155 # prefer RO variable over return value from cmd
 readonly YNL="$(dirname "$(readlink -f "$0")")/../../../net/ynl/pyynl/cli.py"
 
 # "baremetal" network used for raw UDP traffic
 readonly BM_NET_V4=192.168.1.
 readonly BM_NET_V6=2001:db8::
+# Network between the destination and the receiver
+readonly RCV_NET_V4=192.168.2.
 
 readonly CPUS=`nproc`
 ret=0
@@ -26,7 +31,7 @@ cleanup() {
 	[ -n "${jobs}" ] && kill -1 ${jobs} 2>/dev/null
 	rm -f $STATS
 
-	for ns in $NS_SRC $NS_DST; do
+	for ns in $NS_SRC $NS_DST $NS_RCV; do
 		ip netns del $ns 2>/dev/null
 	done
 }
@@ -48,6 +53,17 @@ create_ns() {
 		ip -n $BASE$ns addr add dev veth$ns $BM_NET_V4$ns/24
 		ip -n $BASE$ns addr add dev veth$ns $BM_NET_V6$ns/64 nodad
 	done
+
+	# Forwarded, the datagrams find no local socket, whatever tunnel the host has
+	ip netns add $NS_RCV
+	ip -n $NS_RCV link set dev lo up
+	ip link add name fwd$DST type veth peer name fwd$RCV
+	ip link set dev fwd$DST netns $NS_DST up
+	ip link set dev fwd$RCV netns $NS_RCV up
+	ip -n $NS_DST addr add dev fwd$DST $RCV_NET_V4$DST/24
+	ip -n $NS_RCV addr add dev fwd$RCV $RCV_NET_V4$RCV/24
+	ip netns exec $NS_DST sysctl -wq net.ipv4.ip_forward=1
+	ip -n $NS_RCV route add default via $RCV_NET_V4$DST
 }
 
 __chk_flag() {
@@ -134,15 +150,17 @@ chk_gro() {
 	local msg="$1"
 	local expected=$2
 
-	ip netns exec $BASE$SRC ping -qc 1 $BM_NET_V4$DST >/dev/null
+	# Taking veth$SRC down drops the route, so set it for every check
+	ip -n $NS_SRC route replace ${RCV_NET_V4}0/24 via $BM_NET_V4$DST
+	ip netns exec $BASE$SRC ping -qc 1 $RCV_NET_V4$RCV >/dev/null
 	NSTAT_HISTORY=$STATS ip netns exec $NS_DST nstat -n
 
 	printf "%-60s" "$msg"
-	ip netns exec $BASE$DST ./udpgso_bench_rx -C 1000 -R 10 &
+	ip netns exec $NS_RCV ./udpgso_bench_rx -C 1000 -R 10 &
 	local spid=$!
 	sleep 0.1
 
-	ip netns exec $NS_SRC ./udpgso_bench_tx -4 -s 13000 -S 1300 -M 1 -D $BM_NET_V4$DST
+	ip netns exec $NS_SRC ./udpgso_bench_tx -4 -s 13000 -S 1300 -M 1 -D $RCV_NET_V4$RCV
 	local retc=$?
 	wait $spid
 	local rets=$?
-- 
2.56.0

