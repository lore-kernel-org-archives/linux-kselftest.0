Received: from mx1.secunet.com (mx1.secunet.com [62.96.220.36])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 22732433E92;
	Fri,  3 Jul 2026 17:08:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=62.96.220.36
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783098491; cv=none; b=KmD3PvT6sQMckpT7CrYXQnbbKq9VtkMa+PtY2UuzDQcc5dfoZe4N3FoU9ukRLX/wlRGfwE4yddKnOlJeZsI814S68eUwenxYvLbVGLDwVxuF/MaRD5ArSC3OVKkmwApJwMwuhaqmU7qDaKIk2jQcHtnLvM4YzHF0ltdt+PhTbqk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783098491; c=relaxed/simple;
	bh=WfDcRHrrn1C53/AqE6buzuqC5wFhmhjqZXuZWSisB08=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=ECiQOb+avWw1DDQtSHTcz/+TBt2t5wqJp9d7Nat3yScN/syQyeTVhJPx0qnTFOhY9DVJ1H/L2DxWJjYELQgeGYOYtK2qRWaI/xniNm1wMaRQq6rr3cYU+UWDZg8KG4K3zphGWHXlxS9OMnMOBxnv0ziztwt/TnM3g0NJ5Cj1rbM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=secunet.com; spf=pass smtp.mailfrom=secunet.com; dkim=pass (2048-bit key) header.d=secunet.com header.i=@secunet.com header.b=utavVG5T; arc=none smtp.client-ip=62.96.220.36
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=secunet.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=secunet.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=secunet.com header.i=@secunet.com header.b="utavVG5T"
Received: from localhost (localhost [127.0.0.1])
	by mx1.secunet.com (Postfix) with ESMTP id D072E207AC;
	Fri,  3 Jul 2026 19:08:08 +0200 (CEST)
X-Virus-Scanned: by secunet
Received: from mx1.secunet.com ([127.0.0.1])
 by localhost (mx1.secunet.com [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id XQ25rSmV7EGl; Fri,  3 Jul 2026 19:08:08 +0200 (CEST)
Received: from EXCH-02.secunet.de (rl2.secunet.de [10.32.0.232])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mx1.secunet.com (Postfix) with ESMTPS id ECD2120612;
	Fri,  3 Jul 2026 19:08:07 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 mx1.secunet.com ECD2120612
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=secunet.com;
	s=202301; t=1783098488;
	bh=Y7UMbN2CF/xS/+neuLhhWkvrGxC+dbf1FpNGBgSvO+E=;
	h=From:To:CC:Subject:Date:In-Reply-To:References:From;
	b=utavVG5T5YAHcjF/Gc04u3CgYo4yYMYODMrmFFyCCFy0sGu8QvHTS40yq5OYXnP3h
	 VaCwBP/JPHAbcyHNWUpyTqg3RYdSyOJwK5RT0yIPyApXuXx146q+ZZ9QwEZkDHp76u
	 4fzgunaBIB8ow6Ekt4yrlLGqV9v6QcxP4SQbTLUHOtMOeO5zqYohfVgjAJzuWtSkwM
	 fxQfzx+FMej5Q0kD+N1E1immDMzReIbzEI4j9yWfNvNKY4TVoiQSrk5beoEZstv5EQ
	 KnK3w/daP2sk6ajSPl6Gibd4HYJih1TI1Ised65zIR/GBC2GrdYKL6p3YqdX2le5my
	 EbxDePaClvSLg==
Received: from moon.secunet.de (172.18.149.1) by EXCH-02.secunet.de
 (10.32.0.172) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.37; Fri, 3 Jul
 2026 19:08:07 +0200
From: Antony Antony <antony.antony@secunet.com>
To: Antony Antony <antony.antony@secunet.com>, Steffen Klassert
	<steffen.klassert@secunet.com>, Herbert Xu <herbert@gondor.apana.org.au>,
	"David S. Miller" <davem@davemloft.net>, Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, Simon
 Horman <horms@kernel.org>, David Ahern <dsahern@kernel.org>, Jamal Hadi Salim
	<hadi@cyberus.ca>, Shuah Khan <shuah@kernel.org>
CC: Sabrina Dubroca <sd@queasysnail.net>, <netdev@vger.kernel.org>, Yan Yan
	<evitayan@google.com>, Tobias Brunner <tobias@strongswan.org>, Florian
 Westphal <fw@strlen.de>, <linux-kselftest@vger.kernel.org>,
	<linux-doc@vger.kernel.org>
Subject: [PATCH ipsec 3/8] selftests: net: xfrm_state: add mark shadowing tests for state lookups
Date: Fri, 3 Jul 2026 19:07:58 +0200
Message-ID: <migrate-state-fixes-v0-3-a69e8637ba3b@secunet.com>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <migrate-state-fixes-v0-0-a69e8637ba3b@secunet.com>
References: <migrate-state-fixes-v0-0-a69e8637ba3b@secunet.com>
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
X-Mailer: b4 0.16-dev
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: EXCH-02.secunet.de (10.32.0.172) To EXCH-02.secunet.de
 (10.32.0.172)

Add SPI and by-address wildcard-mark shadowing tests.

Signed-off-by: Antony Antony <antony.antony@secunet.com>
---
 tools/testing/selftests/net/xfrm_state.sh | 130 +++++++++++++++++++++++++++++-
 1 file changed, 129 insertions(+), 1 deletion(-)

diff --git a/tools/testing/selftests/net/xfrm_state.sh b/tools/testing/selftests/net/xfrm_state.sh
index f6c54a6496d7..f202073726a9 100755
--- a/tools/testing/selftests/net/xfrm_state.sh
+++ b/tools/testing/selftests/net/xfrm_state.sh
@@ -42,7 +42,11 @@ tests="
 	mtu_ipv4_r2			IPv4 MTU exceeded from ESP router r2
 	mtu_ipv6_r2			IPv6 MTU exceeded from ESP router r2
 	mtu_ipv4_r3			IPv4 MTU exceeded from router r3
-	mtu_ipv6_r3			IPv6 MTU exceeded from router r3"
+	mtu_ipv6_r3			IPv6 MTU exceeded from router r3
+	mark_wildcard_shadow		mark: wildcard SA in by-spi state get lookup
+	mark_wildcard_delete		mark: wildcard SA in by-spi state delete
+	mark_wildcard_get_addr		mark: wildcard SA in by-address get lookup
+	mark_wildcard_delete_addr	mark: wildcard SA in by-address delete"
 
 prefix4="10.1"
 prefix6="fc00"
@@ -101,6 +105,10 @@ run_test() {
 		mtu_ipv6_r2)         test_mtu_ipv6_r2 ;;
 		mtu_ipv4_r3)         test_mtu_ipv4_r3 ;;
 		mtu_ipv6_r3)         test_mtu_ipv6_r3 ;;
+		mark_wildcard_shadow)      test_mark_wildcard_shadow ;;
+		mark_wildcard_delete)      test_mark_wildcard_delete ;;
+		mark_wildcard_get_addr)    test_mark_wildcard_get_addr ;;
+		mark_wildcard_delete_addr) test_mark_wildcard_delete_addr ;;
 		esac
 		ret=$?
 
@@ -167,6 +175,8 @@ setup_namespaces() {
 	[ -n "${NS_S2}" ] && ns_s2=(ip netns exec "${NS_S2}") && ns_active="${ns_active} $NS_S2"
 	[ -n "${NS_R3}" ] && ns_r3=(ip netns exec "${NS_R3}") && ns_active="${ns_active} $NS_R3"
 	[ -n "${NS_B}" ] && ns_active="${ns_active} $NS_B"
+
+	return 0
 }
 
 addr_add() {
@@ -295,6 +305,18 @@ setup_ns_set_v6x() {
 	set_xfrm_params
 }
 
+setup_ns_set_simple() {
+	# Single namespace, no veths/routes.
+	ns_set="a"
+	imax=1
+	src="10.1.1.1"
+	dst="10.1.1.2"
+	src_net="10.1.0.0/24"
+	dst_net="10.2.0.0/24"
+
+	set_xfrm_params
+}
+
 setup_network() {
 	# Create veths and add addresses
 	local -a ns_cmd
@@ -403,6 +425,7 @@ setup() {
 		ns_set_v4x)    setup_ns_set_v4x ;;
 		ns_set_v6)     setup_ns_set_v6 ;;
 		ns_set_v6x)    setup_ns_set_v6x ;;
+		ns_set_simple) setup_ns_set_simple ;;
 		namespaces)    setup_namespaces ;;
 		network)       setup_network ;;
 		xfrm)          setup_xfrm ;;
@@ -548,6 +571,111 @@ test_mtu_ipv6_r3() {
 	return "${rc}"
 }
 
+# SA_decoy (mark 0/0, added second) shadows SA_target (mark 1/1) on a
+# wildcard mark lookup. No traffic sent; these only exercise the SAD.
+
+test_mark_wildcard_shadow() {
+	setup ns_set_simple namespaces || return "$ksft_skip"
+	local result=0
+
+	run_cmd "${ns_a[@]}" ip xfrm state add \
+		src "${src}" dst "${dst}" proto esp spi 0x1000 \
+		reqid 100 mode tunnel \
+		aead 'rfc4106(gcm(aes))' 0x1111111111111111111111111111111111111111 96 \
+		mark 1 mask 1
+
+	run_cmd "${ns_a[@]}" ip xfrm state add \
+		src "${src}" dst "${dst}" proto esp spi 0x1000 \
+		reqid 100 mode tunnel \
+		aead 'rfc4106(gcm(aes))' 0x2222222222222222222222222222222222222222 96 \
+		mark 0 mask 0
+
+	run_cmd_err "${ns_a[@]}" ip xfrm state get \
+		dst "${dst}" proto esp spi 0x1000 \
+		mark 1 mask 1
+
+	# Expected: SA_target (mark 0x1/0x1). Actual (bug): SA_decoy (mark 0/0).
+	echo "$out" | grep -q "mark 0x1/0x1" || result=1
+
+	return "${result}"
+}
+
+test_mark_wildcard_delete() {
+	setup ns_set_simple namespaces || return "$ksft_skip"
+	local result=0
+
+	run_cmd "${ns_a[@]}" ip xfrm state add \
+		src "${src}" dst "${dst}" proto esp spi 0x1000 \
+		reqid 100 mode tunnel \
+		aead 'rfc4106(gcm(aes))' 0x1111111111111111111111111111111111111111 96 \
+		mark 1 mask 1
+
+	run_cmd "${ns_a[@]}" ip xfrm state add \
+		src "${src}" dst "${dst}" proto esp spi 0x1000 \
+		reqid 100 mode tunnel \
+		aead 'rfc4106(gcm(aes))' 0x2222222222222222222222222222222222222222 96 \
+		mark 0 mask 0
+
+	run_cmd "${ns_a[@]}" ip xfrm state delete \
+		dst "${dst}" proto esp spi 0x1000 \
+		mark 1 mask 1
+
+	run_cmd_err "${ns_a[@]}" ip xfrm state show
+	echo "$out" | grep -q "mark 0x1/0x1" && result=1
+
+	return "${result}"
+}
+
+# by-address counterpart: proto route2/hao (IPv6 mobility) have no SPI,
+# so xfrm_user_state_lookup() resolves them by address instead.
+
+test_mark_wildcard_get_addr() {
+	setup ns_set_simple namespaces || return "$ksft_skip"
+	local result=0
+	local src6="fc00:9::1"
+	local dst6="fc00:9::2"
+
+	run_cmd "${ns_a[@]}" ip xfrm state add \
+		src "${src6}" dst "${dst6}" proto route2 mode ro coa fc00:9::3 \
+		mark 1 mask 1
+
+	run_cmd "${ns_a[@]}" ip xfrm state add \
+		src "${src6}" dst "${dst6}" proto route2 mode ro coa fc00:9::4 \
+		mark 0 mask 0
+
+	run_cmd_err "${ns_a[@]}" ip xfrm state get \
+		src "${src6}" dst "${dst6}" proto route2 \
+		mark 1 mask 1
+
+	echo "$out" | grep -q "mark 0x1/0x1" || result=1
+
+	return "${result}"
+}
+
+test_mark_wildcard_delete_addr() {
+	setup ns_set_simple namespaces || return "$ksft_skip"
+	local result=0
+	local src6="fc00:9::1"
+	local dst6="fc00:9::2"
+
+	run_cmd "${ns_a[@]}" ip xfrm state add \
+		src "${src6}" dst "${dst6}" proto route2 mode ro coa fc00:9::3 \
+		mark 1 mask 1
+
+	run_cmd "${ns_a[@]}" ip xfrm state add \
+		src "${src6}" dst "${dst6}" proto route2 mode ro coa fc00:9::4 \
+		mark 0 mask 0
+
+	run_cmd "${ns_a[@]}" ip xfrm state delete \
+		src "${src6}" dst "${dst6}" proto route2 \
+		mark 1 mask 1
+
+	run_cmd_err "${ns_a[@]}" ip xfrm state show
+	echo "$out" | grep -q "mark 0x1/0x1" && result=1
+
+	return "${result}"
+}
+
 ################################################################################
 #
 usage() {

-- 
2.47.3

