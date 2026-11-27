Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=195.10.208.62
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795798121;
	b=sFLkjI/eJPNpL2JWFd37zFmgKJ5xeGGzm1Lew8vUZGww2gBJNUDABDtVQD3ByMwX0DTs
	 J+noVj4WVQ7qvHfjswgYA1e/BhiLrLGAgRfQJ4OZgtxk5qS+5tExHQB3q/pIMfUgiTcUx
	 nHjeKlYW0JD28LMjeRc2ftXWGHGg8YGFAW0MIF61QDtcqNEImQkVXtGrXlDfUxBxfgHvf
	 gx6u9Gde9Myw2kJcXQ1sOZuJPiKBb/cTPt25Il7s9R3u5nBjMXGu5wCqsTDhjDyFQJ5Kz
	 YKbcZ/idyTu1euxd4HKYQMfxKPACUS2wxkDwhSVLz88cdKGM2dDfk6VrQOwWb4+08kA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795798121;
	h=DMARC-Filter:Received:DKIM-Signature:From:To:Cc:Subject:Date:
	 Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding:X-Rspamd-Queue-Id;
	bh=d25kI2cFp4xOJkScEkzgccIm4TbZYpw7NLHWsddR/kE=;
	b=cX/ohKWxTfadvGP6GllsYqVedY0ogPBzI5z29qFZ2BISibRG6JXTWT7cgBsqh11o8w2W
	 alJhUMm3zfkYKkVkDGxNXq9sjvKOSl9rjfKDcjgiXATw9h3cNOfsunifobVKaUS7Dk+1L
	 SYl9HeCXbgHYNoNxdirybPZ8nm8S6nJiOn45quZ1oTMwPt2RPuqc74p1kgJEsepiSFPQi
	 5EsJaUSxNOZPVYo2Hz51tUOYHw65sbN76aF6+pLmgnweZIcm/20onqwb+1AEGUPrFjXK4
	 4GtslK4MDlc4qr1xNGk35t60aeaw2fbWn2Cr/sCJQA42oRH3/KPuY9qqWZEG4G5patg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=mandelbit.com;
	spf=pass smtp.mailfrom=mandelbit.com;
	dkim=pass header.d=mandelbit.com header.i=@mandelbit.com header.a=rsa-sha256 header.s=MBO0001 header.b=z+TEEMJe;
	arc=none smtp.remote-ip=195.10.208.62
Received: from mout-b-202.mailbox.org (mout-b-202.mailbox.org [195.10.208.62])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D24A2606A31E;
	Fri, 27 Nov 2026 16:48:40 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org D24A2606A31E
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=mandelbit.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=mandelbit.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=mandelbit.com header.i=@mandelbit.com header.a=rsa-sha256 header.s=MBO0001 header.b=z+TEEMJe
Received: from smtp102.mailbox.org (smtp102.mailbox.org [IPv6:2001:67c:2050:b231:465::102])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519MLKEM768 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by mout-b-202.mailbox.org (Postfix) with ESMTPS id 4jbfW919kdzKnG2;
	Fri, 27 Nov 2026 17:48:37 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mandelbit.com;
	s=MBO0001; t=1795798117;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=d25kI2cFp4xOJkScEkzgccIm4TbZYpw7NLHWsddR/kE=;
	b=z+TEEMJe370krGxLXqeIfGFgbxevwFAmJQgFHg9Zix7qyCkOjDUP95T3H8dqOO9tI1EbZq
	GlFtk9Sp6n6QVTgfnGkqFCMD7EP72EgqaZ6lTyKRc2KuqonmsuJWvKPH//e8bNFgflK/m3
	XIh2Tdb1i0mFMK8q8zh7Mt3bK6U4F4MBWolu5cRWLD7OLaUj81gQfakEVSNUuqD2cAdAhU
	9hbroWgj0jb1/pOxC3gWkjy6UnMof6DwgFipw2kT4WEGwDCMI583x6c/3m7HDINvPRgm0/
	apPQmulx51CztwBLl6TGKPV8qgNnERE+RStjg3ZIQXFDa5O7qppERiup+lJhYw==
Authentication-Results: outgoing_mbo_mout;
	dkim=none;
	spf=pass (outgoing_mbo_mout: domain of ralf@mandelbit.com designates 2001:67c:2050:b231:465::102 as permitted sender) smtp.mailfrom=ralf@mandelbit.com
From: Ralf Lici <ralf@mandelbit.com>
To: Steffen Klassert <steffen.klassert@secunet.com>,
	Herbert Xu <herbert@gondor.apana.org.au>
Cc: "David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@kernel.org>,
	Jakub Kicinski <kuba@kernel.org>,
	Paolo Abeni <pabeni@redhat.com>,
	Willem de Bruijn <willemb@google.com>,
	Simon Horman <horms@kernel.org>,
	Shuah Khan <shuah@kernel.org>,
	Nicolas Dichtel <nicolas.dichtel@6wind.com>,
	netdev@vger.kernel.org,
	ipsec@lists.linux.dev,
	linux-kselftest@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH ipsec v2 2/2] selftests: net: add a test for xfrm policy removal
Date: Fri, 27 Nov 2026 17:48:21 +0100
Message-ID: <467acfb25f93252b01f9f096037ae248b8826a56.1795797791.git.ralf@mandelbit.com>
X-Mailer: git-send-email 2.56.0
In-Reply-To: <cover.1795797791.git.ralf@mandelbit.com>
References: <cover.1795797791.git.ralf@mandelbit.com>
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
X-Rspamd-Queue-Id: 4jbfW919kdzKnG2

Check that a connected UDP socket that cached its route through an allow
policy stops sending in plaintext once that policy is deleted, deleted
by index, expires or is flushed.

Signed-off-by: Ralf Lici <ralf@mandelbit.com>
---
 tools/testing/selftests/net/Makefile          |   1 +
 tools/testing/selftests/net/config            |   1 +
 .../selftests/net/xfrm_policy_removal.sh      | 212 ++++++++++++++++++
 3 files changed, 214 insertions(+)
 create mode 100755 tools/testing/selftests/net/xfrm_policy_removal.sh

diff --git a/tools/testing/selftests/net/Makefile b/tools/testing/selftests/net/Makefile
index 9180b9bec515..bdc31252a6fc 100644
--- a/tools/testing/selftests/net/Makefile
+++ b/tools/testing/selftests/net/Makefile
@@ -136,6 +136,7 @@ TEST_PROGS := \
 	vrf_route_leaking.sh \
 	vrf_strict_mode_test.sh \
 	xfrm_policy.sh \
+	xfrm_policy_removal.sh \
 	xfrm_state.sh \
 # end of TEST_PROGS
 
diff --git a/tools/testing/selftests/net/config b/tools/testing/selftests/net/config
index d4416f8bdcfd..d5d289089059 100644
--- a/tools/testing/selftests/net/config
+++ b/tools/testing/selftests/net/config
@@ -18,6 +18,7 @@ CONFIG_DUMMY=y
 CONFIG_GENEVE=m
 CONFIG_GTP=m
 CONFIG_IFB=y
+CONFIG_INET6_ESP=y
 CONFIG_INET_DIAG=y
 CONFIG_INET_ESP=y
 CONFIG_INET_ESP_OFFLOAD=y
diff --git a/tools/testing/selftests/net/xfrm_policy_removal.sh b/tools/testing/selftests/net/xfrm_policy_removal.sh
new file mode 100755
index 000000000000..a5cd38091483
--- /dev/null
+++ b/tools/testing/selftests/net/xfrm_policy_removal.sh
@@ -0,0 +1,212 @@
+#!/bin/bash
+# SPDX-License-Identifier: GPL-2.0
+#
+# Test that removing an xfrm policy invalidates the routes that sockets
+# cached while it was in place.
+#
+# An allow policy without templates exempts UDP to one port from an ESP
+# policy with a lower priority. A connected UDP socket sends a datagram
+# through the allow policy, caching a plain route, then the allow policy is
+# deleted, deleted by index, expires or is flushed, and the socket sends
+# again. The datagrams sent after the removal must be encrypted, as counted
+# by the SA. For the flush, the output default is block instead of the ESP
+# policy, so these sends must fail.
+
+source lib.sh
+
+NS=""
+SRC=""
+DST=""
+PORT=5002
+COUNT=10
+KEY=0x0102030405060708090a0b0c0d0e0f1011121314
+
+cleanup() {
+	stop_sender
+	cleanup_all_ns
+}
+
+trap cleanup EXIT
+
+# setup creates the namespace, a dummy device with the IPv$1 sender
+# address and the state and policies for removal $2.
+setup() {
+	local family=$1
+	local mode=$2
+	local plen=24
+	local limit=()
+
+	SRC=10.0.0.1
+	DST=10.0.0.2
+	if [ "$family" = 6 ]; then
+		SRC=2001:db8::1
+		DST=2001:db8::2
+		plen=64
+	fi
+
+	setup_ns NS || return "$ksft_skip"
+	# The datagrams only need to leave the sender: a dummy device drops
+	# them and needs no neighbour resolution for the peer.
+	ip -n "$NS" link add dummy0 type dummy || return "$ksft_skip"
+	# No link-local address: adding its routes would advance the route
+	# generation and hide a missing invalidation.
+	ip -n "$NS" link set dummy0 addrgenmode none
+	ip -n "$NS" link set dummy0 up
+	ip -n "$NS" addr add "$SRC/$plen" dev dummy0 nodad
+
+	# The SA that the ESP policy requires. Its packet counter tells
+	# which datagrams were encrypted.
+	ip -n "$NS" xfrm state add src "$SRC" dst "$DST" proto esp spi 0x1000 \
+		reqid 1 mode transport aead 'rfc4106(gcm(aes))' "$KEY" 128 ||
+		return "$ksft_skip"
+	if [ "$mode" = flush ]; then
+		# A flush also removes the ESP policy, so rely on the output
+		# default instead.
+		ip -n "$NS" xfrm policy setdefault in accept fwd accept \
+			out block || return "$ksft_skip"
+	else
+		ip -n "$NS" xfrm policy add src "$SRC" dst "$DST" dir out \
+			priority 100 tmpl src "$SRC" dst "$DST" proto esp \
+			reqid 1 mode transport
+	fi
+	# The allow policy, which takes precedence for the test port.
+	if [ "$mode" = expire ]; then
+		limit=(limit time-hard 1)
+	fi
+	ip -n "$NS" xfrm policy add src "$SRC" dst "$DST" proto udp \
+		dport "$PORT" dir out priority 10 action allow "${limit[@]}"
+}
+
+# sender runs in the namespace and keeps one UDP socket connected to
+# $1 port $2, so that the route it caches survives across the removal.
+# For each count it reads, it sends that many datagrams and prints how
+# many sends failed.
+# shellcheck disable=SC2329 # run in the namespace through declare -f
+sender() {
+	local fails
+	local n
+	local i
+
+	exec 3>"/dev/udp/$1/$2" || exit 1
+	while read -r n; do
+		fails=0
+		for ((i = 0; i < n; i++)); do
+			echo >&3 2>/dev/null || fails=$((fails + 1))
+		done
+		echo "$fails"
+	done
+}
+
+start_sender() {
+	coproc SENDER {
+		ip netns exec "$NS" bash -c \
+			"$(declare -f sender); sender $DST $PORT"
+	}
+}
+
+stop_sender() {
+	if [ -n "$SENDER_PID" ]; then
+		kill "$SENDER_PID" 2>/dev/null
+		wait "$SENDER_PID" 2>/dev/null
+	fi
+}
+
+send_datagrams() {
+	local fails
+
+	# Ask the sender for $1 datagrams
+	echo "$1" >&"${SENDER[1]}" || return 1
+	# and print how many of its sends failed.
+	read -r -t 5 fails <&"${SENDER[0]}" || return 1
+	echo "$fails"
+}
+
+# sa_packets prints the number of packets that the SA has encrypted.
+sa_packets() {
+	ip -n "$NS" -s xfrm state |
+		sed -nE 's/^\s*[0-9]+\(bytes\), ([0-9]+)\(packets\)$/\1/p'
+}
+
+# allow_policy_gone succeeds once the allow policy is no longer installed.
+allow_policy_gone() {
+	! ip -n "$NS" xfrm policy list dir out | grep -q "dport $PORT"
+}
+
+remove_allow_policy() {
+	local mode=$1
+	local index
+
+	case $mode in
+	delete)
+		ip -n "$NS" xfrm policy delete src "$SRC" dst "$DST" \
+			proto udp dport "$PORT" dir out
+		;;
+	index)
+		index=$(ip -n "$NS" -s xfrm policy list dir out |
+			grep -A1 "dport $PORT" |
+			sed -nE 's/.* index ([0-9]+) .*/\1/p')
+		ip -n "$NS" xfrm policy delete dir out index "$index"
+		;;
+	expire)
+		slowwait 5 allow_policy_gone
+		;;
+	flush)
+		ip -n "$NS" xfrm policy flush
+		;;
+	esac
+	allow_policy_gone
+}
+
+run_test() {
+	local family=$1
+	local mode=$2
+	local name="IPv$family: send after $3"
+	local plain
+	local fails
+	local sent
+	local esp
+
+	RET=0
+
+	if ! setup "$family" "$mode"; then
+		log_test_skip "$name"
+		cleanup_all_ns
+		return
+	fi
+
+	start_sender
+	if ! fails=$(send_datagrams 1) || [ "$fails" != 0 ]; then
+		log_test_skip "$name" "connected UDP socket not usable"
+		cleanup
+		return
+	fi
+	esp=$(sa_packets)
+	check_err "$esp" "the allow policy did not apply"
+
+	remove_allow_policy "$mode"
+	check_err $? "the allow policy was not removed"
+
+	fails=$(send_datagrams "$COUNT")
+	check_err $? "the sender did not answer"
+	if [ "$mode" = flush ]; then
+		sent=$((COUNT - fails))
+		check_err "$sent" "$sent of $COUNT datagrams not blocked"
+	else
+		plain=$((COUNT - fails - $(sa_packets) + esp))
+		check_err "$fails" "$fails of $COUNT sends failed"
+		check_err "$plain" \
+			"$plain of $COUNT datagrams sent in plaintext"
+	fi
+
+	log_test "$name"
+	cleanup
+}
+
+for family in 4 6; do
+	run_test "$family" delete "policy deletion"
+	run_test "$family" index "policy deletion by index"
+	run_test "$family" expire "policy expiry"
+	run_test "$family" flush "policy flush"
+done
+
+exit "$EXIT_STATUS"
-- 
2.56.0

