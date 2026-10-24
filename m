Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=117.135.210.5
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792834259;
	b=GpMidGBon9rcUMONNmN43D7LEt5VhBhvkbZp4ZCE1Vxb7kQtQLMThynA27qwokeRyBKt
	 2Kej0e2W7JYQHJAz714G2NOGg7ASVFqy+5nKfSv+tRtHLGr1Oc/fuvL+l9itZp7RjW8ly
	 gaDxBdBKlPgcf8Gp529sgVcTPI0XLjMVMM7qHyzW4Yo1hIahaGhjN1so/ELgsJZy2r56c
	 +0DjXDLX5XgeO2XHnh20WBZwxGzRhaqimAV7d9vAEEb64lONTx9rit6+blKniL6e8b2wq
	 2eKVIdnB3M6Qc072JkiiwfizFToLIKZ36VPMsrpu68hzntkzjTtoFs9VG0vPpMzQd0w==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792834259;
	h=DMARC-Filter:DKIM-Signature:Received:From:To:Cc:Subject:Date:
	 Message-Id:X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding:X-CM-TRANSID:X-Coremail-Antispam:
	 X-CM-SenderInfo;
	bh=9QuznG4j1jiezSApa3ebKCoXkxisoyFoxDweWi31QAY=;
	b=f5jwLUVVWfTCUJJWlySxKIateQmJshqPVhPWmMIdPM3GlmxT0P1P9KkWdNVBlLhZiW49
	 0GdKiUMCDx3vCdexO3IffA5BOfGy+jELsgaqx784y3r4zrCrfsocbIDnzFKSmL190saVn
	 PjorROB91EqMulR8cQu90vjgI7B7kRAE4Blte1JgSj0A0HQEBtaXz00vmYEix2tpRTr4z
	 Keuwi6Rii6ax48PjLqalSTelQqp2zQ0UGSXV5CbqXXNY3roz9j4zDUVLsQ43XBDUamMPg
	 aam33VeaKepGq0JquSrTfE6BaagPrhVco+H/lO6j+bV337bLh84ZDQ9pjniR0e1WefQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=163.com;
	spf=pass smtp.mailfrom=163.com;
	dkim=pass header.d=163.com header.i=@163.com header.a=rsa-sha256 header.s=s110527 header.b=MVzOmlbn;
	arc=none smtp.remote-ip=117.135.210.5
Received: from m16.mail.163.com (m16.mail.163.com [117.135.210.5])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 252CE606A31A;
	Sat, 24 Oct 2026 09:30:55 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 252CE606A31A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=163.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=163.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=163.com header.i=@163.com header.a=rsa-sha256 header.s=s110527 header.b=MVzOmlbn
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=163.com;
	s=s110527; h=From:To:Subject:Date:Message-Id:MIME-Version; bh=9Q
	uznG4j1jiezSApa3ebKCoXkxisoyFoxDweWi31QAY=; b=MVzOmlbnxp6q8ynN5m
	ZCGh0IOesHEHhu233NiMByrZtXrqv9MtgwnAsjJvPqJDO8Th/rArImJN3sxJ8H5l
	2i50RcfOGl0lXzGX0FvIiZhStk6TBHFU7rZOP0Y06d/1ysuCxaMh8Ge5pSS7w++C
	VAJAksHNqkdr28GuYHF8LZmhU=
Received: from localhost.localdomain (unknown [])
	by gzga-smtp-mtada-g0-4 (Coremail) with SMTP id _____wDX35eretxqoPpsCg--.62139S3;
	Sat, 24 Oct 2026 17:30:22 +0800 (CST)
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
	hangbin.liu@linux.dev,
	yana06070@163.com
Subject: [PATCH net v4 2/2] selftests: net: check veth carrier after changing channel counts
Date: Sat, 24 Oct 2026 17:30:07 +0800
Message-Id: <20261024093007.12981-2-yana06070@163.com>
X-Mailer: git-send-email 2.33.0
In-Reply-To: <20261024093007.12981-1-yana06070@163.com>
References: <20261024093007.12981-1-yana06070@163.com>
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
X-CM-TRANSID:_____wDX35eretxqoPpsCg--.62139S3
X-Coremail-Antispam: 1Uf129KBjvJXoWxuF4xXrW7Kr4UuF45Jw4fXwb_yoWrtrW8pF
	Z3Cry3Gr48WFyfGw1Ikr1jyr45uw1kXw17Jr97tr4jvFy5G3sIvr1ft3yjyF4DKrZagw1r
	Zayvvr1kCan0va7anT9S1TB71UUUUU7qnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
	9KBjDUYxBIdaVFxhVjvjDU0xZFpf9x0zEw0eJUUUUU=
X-CM-SenderInfo: p1dqtiawqxiqqrwthudrp/xtbC-A6bImrceq700AAA3N

Extend veth.sh to check that changing channel counts preserves carrier
state. When only one end is up, the running end must not report LOWER_UP.

Cover up/up and both mixed up/down combinations. Resize RX and TX queues
in both directions on each endpoint, and check carrier after a rejected
out-of-range request as well. Create the pair with two queues explicitly
so the carrier cases also run on single-CPU systems.

Reuse the existing namespace setup and cleanup. Run each carrier case
in a subshell to keep its variables separate from the other tests, and
accumulate failures in the caller. Only check LOWER_UP on running
interfaces, where the flag exposes carrier state.

Assisted-by: LLM
Signed-off-by: Xia Yan <yana06070@163.com>
---
Changes in v4:
- Drop the extra GRO on/off runs, as discussed with Hangbin.
  Keep up/up and both mixed up/down states.
- Use subshells for the new helpers and accumulate failures in the
  caller. Quote single-value arguments and wrap long lines.
- Driver code is unchanged.

v3: https://lore.kernel.org/netdev/20261022085842.2527-1-yana06070@163.com/

Testing on 513444cc62e2, x86_64 QEMU/KVM with three vCPUs:
- Complete default veth.sh:
  before: 56 checks pass, two mixed up/down carrier checks fail;
  after: all 58 checks pass. The 55 existing checks pass on both.
- Script exit status: 1 before, 0 after. No checks were skipped.
- Both guests powered down normally.
- bash -n and git diff --check pass.

 tools/testing/selftests/net/veth.sh | 81 ++++++++++++++++++++++++++++-
 1 file changed, 80 insertions(+), 1 deletion(-)

diff --git a/tools/testing/selftests/net/veth.sh b/tools/testing/selftests/net/veth.sh
index 8b867e0675a7c1eea300468c26f2a9528ddc1194..e438e9ee7b33b151099d8ce779a9c9b47b0cc0af 100755
--- a/tools/testing/selftests/net/veth.sh
+++ b/tools/testing/selftests/net/veth.sh
@@ -41,13 +41,16 @@ create_ns() {
 		ip -n $ns link set dev lo up
 	done
 
-	ip link add name veth$SRC type veth peer name veth$DST
+	ip link add name "veth$SRC" "$@" type veth \
+		peer name "veth$DST" "$@" || return 1
 
 	for ns in $SRC $DST; do
 		ip link set dev veth$ns netns $BASE$ns up
 		ip -n $BASE$ns addr add dev veth$ns $BM_NET_V4$ns/24
 		ip -n $BASE$ns addr add dev veth$ns $BM_NET_V6$ns/64 nodad
 	done
+
+	return 0
 }
 
 __chk_flag() {
@@ -130,6 +133,78 @@ chk_channels() {
 	fi
 }
 
+chk_carrier() (
+	target=$1
+	state=$2
+	expected=$3
+	carrier=0
+
+	# IFF_LOWER_UP is reported only for running interfaces.
+	[ "$state" = up ] || return 0
+
+	if ! link=$(ip -n "$BASE$target" -o link show dev "veth$target"); then
+		echo " fail - cannot read veth$target link state"
+		return 1
+	fi
+	case "$link" in
+		*LOWER_UP*) carrier=1 ;;
+	esac
+	if [ "$carrier" -ne "$expected" ]; then
+		printf ' fail - veth%s carrier is %s, expected %s\n' \
+			"$target" "$carrier" "$expected"
+		return 1
+	fi
+)
+
+# Keep per-case variables separate from the other tests.
+chk_channels_carrier() (
+	src_state=$1
+	dst_state=$2
+	expected=0
+	err=0
+	msg="carrier after channel change ($src_state/$dst_state)"
+
+	if ! create_ns numtxqueues 2 numrxqueues 2; then
+		printf "%-60s" "$msg"
+		echo " skip - cannot create veth pair"
+		cleanup
+		return 0
+	fi
+
+	ip -n "$NS_SRC" link set dev "veth$SRC" "$src_state" || err=1
+	ip -n "$NS_DST" link set dev "veth$DST" "$dst_state" || err=1
+	[ "$src_state" = up ] && [ "$dst_state" = up ] && expected=1
+	chk_carrier "$SRC" "$src_state" "$expected" || err=1
+	chk_carrier "$DST" "$dst_state" "$expected" || err=1
+
+	for target in "$SRC" "$DST"; do
+		for count in 1 2; do
+			ip netns exec "$BASE$target" ethtool -L "veth$target" \
+				rx "$count" tx "$count" || err=1
+			chk_carrier "$SRC" "$src_state" "$expected" || err=1
+			chk_carrier "$DST" "$dst_state" "$expected" || err=1
+		done
+
+		if ip netns exec "$BASE$target" ethtool -L "veth$target" \
+			rx 3 tx 3 \
+			>/dev/null 2>&1; then
+			echo " fail - out-of-range channel counts were accepted"
+			err=1
+		fi
+		chk_carrier "$SRC" "$src_state" "$expected" || err=1
+		chk_carrier "$DST" "$dst_state" "$expected" || err=1
+	done
+
+	cleanup
+	printf "%-60s" "$msg"
+	if [ "$err" -eq 0 ]; then
+		echo " ok "
+	else
+		echo " fail "
+	fi
+	return "$err"
+)
+
 chk_gro() {
 	local msg="$1"
 	local expected=$2
@@ -257,6 +332,10 @@ fi
 [ $STRESS -gt 0 -a $CPUS -lt 3 ] && echo " stress test will be skipped, too"
 [ ! -f "$YNL" ] && echo "ynl cli not found, ndo-xmit tests will be skipped"
 
+chk_channels_carrier up "up" || ret=1
+chk_channels_carrier up down || ret=1
+chk_channels_carrier down up || ret=1
+
 create_ns
 chk_gro_flag "default - gro flag" $SRC off
 chk_gro_flag "        - peer gro flag" $DST off

-- 
2.39.0.windows.2

