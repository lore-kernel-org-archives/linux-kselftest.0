Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=220.197.31.5
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792659562;
	b=o5wNplHpGUNq61uk6SgbE+EOxwXdG719ucnEj6+WqvcHtDJCvL+oYGkqhpO6ZbcCz+mv
	 dZMYrxJudcu8E+J9dRWehobaxAp1MK74rGcsMlYdwgF9mQB84yWr8hJA0J4q8LqMDB29h
	 LWdEA6M4seRS8eTHAFTR9sT0qMvPYLV/6b5Fct/ve/oxO8ME3nI9IR9iNAVaX/PHyyrpq
	 ALhS9SgzOHOYL6Vc0ZfVF0KW9h9KchKomqkFwuZA3DJflfFIAh5ZsgTsUM+PhdcRQM6Cp
	 G4IvrfZi5LSpqpOvEpp29DNpKW0wS6t33Pb5rVhsfYqLDiuqzgl/W76SJAYILNgwq8w==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792659562;
	h=DMARC-Filter:DKIM-Signature:Received:From:To:Cc:Subject:Date:
	 Message-Id:X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding:X-CM-TRANSID:X-Coremail-Antispam:
	 X-CM-SenderInfo;
	bh=g/PkNjCtBdGWPRw1cElAYHNMvEFt3neHKaCbi6M6u5s=;
	b=lIdpyfb+CXVK6c6RmuGSbmr+tUM/30XOVoj9ep3QCyxU654NqQv0pfg3z2JBVAKiC84U
	 7VtZZP0HPIG9o0IbGGPgG6AvNiGYr0nE6mWNYDyJhGvseKW+L9dQufGHRvvgAH3jyUXUf
	 xt0JKJ70ZrsKGZsRWNlj+cGxwF+AnebGq9GOIK2XoemkHd3C0ou8ttX0hhlnB1p4nxv9L
	 TobY3KSTJw8cuqJ4LP8HBs6wC6CDafprdblg/fDUdf2g5i0Pk0cbOoXLWZZMh9SrQp1BW
	 jt3f6ziftsZ1epguYzEI7aI/eNnHnYyCerP0LJquUvZptTiK+E0LlB3dl/uo/w6NJDQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=163.com;
	spf=pass smtp.mailfrom=163.com;
	dkim=pass header.d=163.com header.i=@163.com header.a=rsa-sha256 header.s=s110527 header.b=l0HEIhDA;
	arc=none smtp.remote-ip=220.197.31.5
Received: from m16.mail.163.com (m16.mail.163.com [220.197.31.5])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 02CAC606A326;
	Thu, 22 Oct 2026 08:59:19 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 02CAC606A326
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=163.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=163.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=163.com header.i=@163.com header.a=rsa-sha256 header.s=s110527 header.b=l0HEIhDA
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=163.com;
	s=s110527; h=From:To:Subject:Date:Message-Id:MIME-Version; bh=g/
	PkNjCtBdGWPRw1cElAYHNMvEFt3neHKaCbi6M6u5s=; b=l0HEIhDAz0aPsNFfco
	DcJV6salmmIwtIpk3dTtXhdE+9VJj4OjZ+CxXmh387r88I1iYiZms+1+zvXkoo2D
	hpn7HnI8LsAK+QmBup4r+rA+uai7WiDebfWQ+qzDM2EpC3E6T0075XCFHw8+ya3P
	CWCXp0pAlrD0GNwZ7tZ2+29y4=
Received: from localhost.localdomain (unknown [])
	by gzsmtp2 (Coremail) with SMTP id PSgvCgB3lRxP0NlqnOotBQ--.27898S3;
	Thu, 22 Oct 2026 16:58:58 +0800 (CST)
From: Xia Yan <yana06070@163.com>
To: netdev@vger.kernel.org
Cc: andrew+netdev@lunn.ch,
	davem@davemloft.net,
	edumazet@kernel.org,
	horms@kernel.org,
	kuba@kernel.org,
	linux-kernel@vger.kernel.org,
	linux-kselftest@vger.kernel.org,
	pabeni@redhat.com,
	shuah@kernel.org,
	yana06070@163.com
Subject: [PATCH net v3 2/2] selftests: net: check veth carrier after changing channel counts
Date: Thu, 22 Oct 2026 16:58:42 +0800
Message-Id: <20261022085842.2527-2-yana06070@163.com>
X-Mailer: git-send-email 2.33.0
In-Reply-To: <20261022085842.2527-1-yana06070@163.com>
References: <20261022085842.2527-1-yana06070@163.com>
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Post: <mailto:linux-kselftest@vger.kernel.org>
List-Help: <mailto:linux-kselftest+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kselftest+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
X-CM-TRANSID:PSgvCgB3lRxP0NlqnOotBQ--.27898S3
X-Coremail-Antispam: 1Uf129KBjvJXoWxCry3tF4rWw4fXr1fJr13urg_yoW7JFW8pF
	Z7Jry5Gw47JF13Gw1Ikw1jkr4rW3Z3Xr17Xr9IqrWUZF98GF9avr43t34jvF4DKrZ5X3Z5
	ZFWj9r4kGa1qyaDanT9S1TB71UUUUU7qnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
	9KBjDUYxBIdaVFxhVjvjDU0xZFpf9x0ziVT5kUUUUU=
X-CM-SenderInfo: p1dqtiawqxiqqrwthudrp/xtbC-BJZ32rZ0FIESQAA3U

Extend veth.sh to check carrier state after changing channel counts.
A running interface must keep carrier off while its peer is down.

Cover up/up and both mixed up/down combinations with GRO on and off.
Resize RX and TX queues in both directions on each endpoint, and check
that rejecting an out-of-range request also preserves carrier state.
Use two queues explicitly so these cases also run on single-CPU systems.

Keep these cases with the existing veth tests and reuse their namespace
setup, cleanup and aggregate failure status. Only check LOWER_UP on
running interfaces, where that flag exposes carrier state.

The four mixed up/down cases fail with the unfixed driver. All six
carrier cases and the existing checks pass with the fix.

Assisted-by: LLM
Signed-off-by: Xia Yan <yana06070@163.com>
---

Notes:
    Changes in v3:
    - Move the six carrier cases into veth.sh following review of v2.
    - Reuse namespace setup, cleanup and error reporting.
    - Allow explicit queue counts in create_ns().

    v2: https://lore.kernel.org/netdev/20261020135544.24441-1-yana06070@163.com/

    Testing on the v2 baseline 513444cc62e2:
    - Complete default veth.sh on x86_64 QEMU/KVM, three vCPUs:
      before: 57 checks pass, four mixed up/down carrier checks fail;
      after: all 61 checks pass. The 55 existing checks pass on both.
    - bash -n and git diff --check pass.
    - If creating the veth pair fails, the case is skipped without
      masking failures from earlier test cases.

    Both patches also apply to net/main ffdf678dd166
    (application check only, checked on 2026-10-22).

    The QEMU guests failed to power off cleanly (initramfs issue) after
    the tests completed; the exit codes above are the veth.sh results.


 tools/testing/selftests/net/veth.sh | 84 ++++++++++++++++++++++++++++-
 1 file changed, 83 insertions(+), 1 deletion(-)

diff --git a/tools/testing/selftests/net/veth.sh b/tools/testing/selftests/net/veth.sh
index 8b867e0..901ba51 100755
--- a/tools/testing/selftests/net/veth.sh
+++ b/tools/testing/selftests/net/veth.sh
@@ -41,13 +41,15 @@ create_ns() {
 		ip -n $ns link set dev lo up
 	done
 
-	ip link add name veth$SRC type veth peer name veth$DST
+	ip link add name veth$SRC "$@" type veth peer name veth$DST "$@" || return 1
 
 	for ns in $SRC $DST; do
 		ip link set dev veth$ns netns $BASE$ns up
 		ip -n $BASE$ns addr add dev veth$ns $BM_NET_V4$ns/24
 		ip -n $BASE$ns addr add dev veth$ns $BM_NET_V6$ns/64 nodad
 	done
+
+	return 0
 }
 
 __chk_flag() {
@@ -130,6 +132,80 @@ chk_channels() {
 	fi
 }
 
+chk_carrier() {
+	local target=$1
+	local state=$2
+	local expected=$3
+	local carrier=0
+	local link
+
+	# IFF_LOWER_UP is reported only for running interfaces.
+	[ "$state" = up ] || return 0
+
+	if ! link=$(ip -n $BASE$target -o link show dev veth$target); then
+		echo " fail - cannot read veth$target link state"
+		return 1
+	fi
+	case "$link" in
+		*LOWER_UP*) carrier=1 ;;
+	esac
+	if [ "$carrier" -ne "$expected" ]; then
+		echo " fail - veth$target carrier is $carrier, expected $expected"
+		return 1
+	fi
+}
+
+chk_channels_carrier() {
+	local src_state=$1
+	local dst_state=$2
+	local gro=$3
+	local expected=0
+	local err=0
+	local target count
+	local msg="carrier after channel change ($src_state/$dst_state, GRO $gro)"
+
+	if ! create_ns numtxqueues 2 numrxqueues 2; then
+		printf "%-60s" "$msg"
+		echo " skip - cannot create veth pair"
+		cleanup
+		return
+	fi
+
+	ip -n $NS_SRC link set dev veth$SRC "$src_state" || err=1
+	ip -n $NS_DST link set dev veth$DST "$dst_state" || err=1
+	ip netns exec $NS_SRC ethtool -K veth$SRC gro "$gro" >/dev/null || err=1
+	ip netns exec $NS_DST ethtool -K veth$DST gro "$gro" >/dev/null || err=1
+	[ "$src_state" = up ] && [ "$dst_state" = up ] && expected=1
+	chk_carrier $SRC "$src_state" "$expected" || err=1
+	chk_carrier $DST "$dst_state" "$expected" || err=1
+
+	for target in $SRC $DST; do
+		for count in 1 2; do
+			ip netns exec $BASE$target ethtool -L veth$target \
+				rx "$count" tx "$count" || err=1
+			chk_carrier $SRC "$src_state" "$expected" || err=1
+			chk_carrier $DST "$dst_state" "$expected" || err=1
+		done
+
+		if ip netns exec $BASE$target ethtool -L veth$target rx 3 tx 3 \
+			>/dev/null 2>&1; then
+			echo " fail - out-of-range channel counts were accepted"
+			err=1
+		fi
+		chk_carrier $SRC "$src_state" "$expected" || err=1
+		chk_carrier $DST "$dst_state" "$expected" || err=1
+	done
+
+	cleanup
+	printf "%-60s" "$msg"
+	if [ "$err" -eq 0 ]; then
+		echo " ok "
+	else
+		echo " fail "
+		ret=1
+	fi
+}
+
 chk_gro() {
 	local msg="$1"
 	local expected=$2
@@ -257,6 +333,12 @@ fi
 [ $STRESS -gt 0 -a $CPUS -lt 3 ] && echo " stress test will be skipped, too"
 [ ! -f "$YNL" ] && echo "ynl cli not found, ndo-xmit tests will be skipped"
 
+for gro in off on; do
+	chk_channels_carrier up up "$gro"
+	chk_channels_carrier up down "$gro"
+	chk_channels_carrier down up "$gro"
+done
+
 create_ns
 chk_gro_flag "default - gro flag" $SRC off
 chk_gro_flag "        - peer gro flag" $DST off
-- 
2.43.0

