Received: from mail-lf1-f41.google.com (mail-lf1-f41.google.com [209.85.167.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B16E93BE659
	for <linux-kselftest@vger.kernel.org>; Mon, 31 Aug 2026 21:52:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788213136; cv=none; b=taGuu4LuWfoEZPDybSc6MFeyNncj9DEuRPW3FbvztqAeOvh1AFrxWLcD3EZM7XLl2jv/kbrAWPlqWEJyEayItnD1PDOf+1wkR+C1gUYgZOEKzMasqpTKKPECXPQJ1WJ/WFKzc/etcI+2DLxG2Z4mmxOXZkICBULCjswJKfmsunA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788213136; c=relaxed/simple;
	bh=DKx6E5dImMHY5Yp7PtZ+11Xgio+IIf1+fa0J4Yfua5w=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=FUf0+sYu+7QVHhoZ4k75lngKaNcqTcUrJwTXM/GBzIWNPHgCxBehcHM/lVNUHt1EGOWLLtbgF9XZs1t5GFY/DLbclil/JpakLZwcDTyh6PNTWEPeqOoUeq6GzHUp0gtYLDMu7zuj4J+t/OF0aQgPtg8oaxaoNFvPP7+PIKmodP4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=FVgo4FjY; arc=none smtp.client-ip=209.85.167.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="FVgo4FjY"
Received: by mail-lf1-f41.google.com with SMTP id 2adb3069b0e04-5b4ac3ba821so3331762e87.0
        for <linux-kselftest@vger.kernel.org>; Mon, 31 Aug 2026 14:52:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788213128; x=1788817928; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=zSBImvVt2nvI5IA5hzH0bnJG/0pKCpXdDgr7PN684mk=;
        b=FVgo4FjYMnrXsqLzBYzYwyqThIHtsqfWwPPL+TflXy8XWHAiS6fkyp9DX5EwI+wQYW
         WCF5znIy0U4U+mJbuwLikyVCQyIXkDYZFxGBxM1Jzj8crjpN6J6dW5CLCX0RJDGmgcKT
         3HoF/9pr/eMg65bpE5PVEGsvaO4povUSeyuCgFpOQ5Hqt+qctuPp1o2qLEi7ZvGT9ghE
         CBt4dV3Y34RkOQ0bDcn+ssnlkiPgJz7uykTWPhRQh/f92bcskU0VDJxZE0beA3N321p3
         rBADMULBVB22RZv/mqvRdYEbeVJt+ifkXNXlda31YSRPiTHpeah/+eYjcCNymRov2d+a
         pWMg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788213128; x=1788817928;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=zSBImvVt2nvI5IA5hzH0bnJG/0pKCpXdDgr7PN684mk=;
        b=WN1ptNX2oi5DuL5l2ggzVbO6qSYLAhSjwY78xQHMJ8fuBUoHyWieeejGndHNK/Gsyv
         vrzHxLNXNzJ3dHteLv3h7EnIFLAKvSopn0eK0yGfTQ/gw5eRclErvbRjYEYiK0KbKvhw
         ErkatfyVlL5LJeQvnzKghLuvFwPAIeFWdpKanEGqKabYXhQlsvxYpeMk1pXUpJYRGJxQ
         SWVdUF0jkjxX90mxNfg8qnQxr0iDH8BR5XQ9OgfJ5y4LhVvWMtOlyh0w/033/X0yCJ+d
         M2Fh2LeZsTNwi5YXDbXONAIlTIqX+tP9ffVQwexr+q7Va9klvQmg79JaGc8oFtwgU+iJ
         XTsw==
X-Forwarded-Encrypted: i=1; AKwUvByjkdw8hE3hXSrkp1D5IpYZeCfHTRxWj2pzHveynma6n9XTmzIGPcMSDRcYojrAujZHxNmlLWWk9sasuJtdhf0=@vger.kernel.org
X-Gm-Message-State: AFuF++mxHN6v/CyoEdo1pKp/jx0klWfPKYRzkgVJUPQAQndBX/nL+8uK
	4wMn8tpy2jklenfSWmhJ587jlf0PX1ahAA75NNDunNs6JAZ5juHjJQDE
X-Gm-Gg: AYBFou1twWcxRsyOIHc7sStpNUdQp0e/646VTRP757l9rYKCPlhJfW4YP0QRrB/CkAa
	j9hLRB9QtpOxV+lH/FfXfQqeFK+0Q9hON2FBQrNWG+GgnHYH+I/mP0pXqrbcHQ7s/yioG9LRZx/
	DOEdtyvnEizynB+ltAVwJG6gj04VIdN6/leSW1+/gjjIkucxSK2JpyUcEXCCiy3gIOSOIhY+mgy
	d6K+k8mBqFRjRfx2P7WfcnQQ3WDtbVy87y8yJTor7T105KSGAe4o8GeVuElxKRkP+HY374+uGfg
	t4OLXonnDsm12u/RTxYV+tmjS8p08aNX2FgxmFvPFAdJSqL5eafVudU6uTg6DHmbyLngsIh2yAJ
	BjTUDqThXdoQTX9Mq7hmdh97EhcNpTVUp4mrOsQY2SeXgcs7pmd+3218sWwYW+orwUuCYyN0BpM
	wR+RWFNKVk3wyQDwaut4xGI3tVCOVz3AjZYUu8mBvYmAlpMQlsZa5hFfUlHljWC1cMro5vPP+hw
	TCi8YzIZ5Hx5yTu+76uyGA0Hh5z8JIpGQ==
X-Received: by 2002:a05:6512:4014:b0:5b4:a836:13fd with SMTP id 2adb3069b0e04-5b5fe0fbbaamr1575023e87.22.1788213127704;
        Mon, 31 Aug 2026 14:52:07 -0700 (PDT)
Received: from dau-home-pc.. ([212.35.184.237])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5b5e8a06a77sm2388782e87.48.2026.08.31.14.52.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 31 Aug 2026 14:52:07 -0700 (PDT)
From: Anton Danilov <littlesmilingcloud@gmail.com>
To: netdev@vger.kernel.org
Cc: "David S . Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>,
	Paolo Abeni <pabeni@redhat.com>,
	David Ahern <dsahern@kernel.org>,
	Simon Horman <horms@kernel.org>,
	Shuah Khan <shuah@kernel.org>,
	linux-kernel@vger.kernel.org,
	linux-kselftest@vger.kernel.org
Subject: [PATCH net-next 11/11] selftests: net: cover the tunnel transmit drop reasons
Date: Tue,  1 Sep 2026 00:51:37 +0300
Message-ID: <20260831215137.549324-12-littlesmilingcloud@gmail.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20260831215137.549324-1-littlesmilingcloud@gmail.com>
References: <20260831215137.549324-1-littlesmilingcloud@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Extend the tunnel drop reason test with three failures of the transmit
path, all on GRE:

 - an underlay that cannot carry what the tunnel advertises, so the
   encapsulated packet does not fit the path MTU and is dropped after an
   ICMP fragmentation needed is sent back.  This is the case worth
   telling apart from the others: path MTU discovery is working as
   intended, and until now the drop was indistinguishable from a real
   failure,

 - a device in external mode receiving traffic that carries no tunnel
   metadata, reported as TUNNEL_TXINFO,

 - a tunnel whose remote endpoint has no route, reported as
   IP_OUTNOROUTES.

Assisted-by: Claude-Code:claude-opus-5
Signed-off-by: Anton Danilov <littlesmilingcloud@gmail.com>
---
 .../selftests/net/tunnel_drop_reasons.sh      | 58 ++++++++++++++++++-
 1 file changed, 57 insertions(+), 1 deletion(-)

diff --git a/tools/testing/selftests/net/tunnel_drop_reasons.sh b/tools/testing/selftests/net/tunnel_drop_reasons.sh
index aad003f0efe5..5639e29365a4 100755
--- a/tools/testing/selftests/net/tunnel_drop_reasons.sh
+++ b/tools/testing/selftests/net/tunnel_drop_reasons.sh
@@ -26,6 +26,11 @@
 #    GRE_TUNNEL_NOT_FOUND.  It is triggered here by giving the two
 #    endpoints different keys.
 #
+# On the transmit side, the reasons reported while encapsulating are
+# checked too: a packet that does not fit the path MTU, a device in
+# external mode that receives no metadata, and a tunnel whose remote
+# endpoint has no route.
+#
 #  - a header with the routing bit set is reported as GRE_INVALID_HDR,
 #    and a header announcing a GRE version nobody handles is reported as
 #    UNHANDLED_PROTO.  Both are triggered by corrupting the GRE header
@@ -81,6 +86,7 @@ setup_tracing()
 
 setup_ns_pair()
 {
+	PING_ARGS=""
 	cleanup_all_ns
 	setup_ns NS_SND NS_RCV
 
@@ -122,9 +128,15 @@ addr_tunnels()
 	ip -n "$NS_RCV" addr add "$TUN_RCV/24" dev gre_test
 }
 
+# Traffic used by check_reason().  Tests that need something else set
+# PING_ARGS before calling it.
+PING_ARGS=""
+
 send_traffic()
 {
-	ip netns exec "$NS_SND" ping -c 2 -W 1 "$TUN_RCV" >/dev/null 2>&1
+	# shellcheck disable=SC2086
+	ip netns exec "$NS_SND" ping -c 2 -W 1 $PING_ARGS "$TUN_RCV" \
+		>/dev/null 2>&1
 	# Let the tracepoint records reach the trace buffer.
 	sleep 1
 }
@@ -254,6 +266,46 @@ test_corrupted_header()
 	check_reason "$name" "$want"
 }
 
+test_tx_pkt_too_big()
+{
+	setup_ns_pair
+	# The underlay cannot carry what the tunnel advertises, so the
+	# encapsulated packet does not fit the path MTU.  The kernel sends
+	# an ICMP fragmentation needed back and drops it, which is path MTU
+	# discovery working as intended.
+	ip -n "$NS_SND" link set veth_s mtu 1280
+	ip -n "$NS_RCV" link set veth_r mtu 1280
+	add_gre "$NS_SND" "$SND_V4" "$RCV_V4"
+	add_gre "$NS_RCV" "$RCV_V4" "$SND_V4"
+	ip -n "$NS_SND" link set gre_test mtu 1500
+	addr_tunnels
+
+	PING_ARGS="-s 1400 -M do"
+	check_reason "gre: packet does not fit the path MTU" PKT_TOO_BIG
+}
+
+test_tx_no_metadata()
+{
+	setup_ns_pair
+	# A device in external mode expects the destination to come from
+	# the tunnel metadata, which plain traffic does not carry.
+	ip -n "$NS_SND" link add gre_test type gre external
+	ip -n "$NS_SND" link set gre_test up
+	ip -n "$NS_SND" addr add "$TUN_SND/24" dev gre_test
+
+	check_reason "gre: external mode without metadata" TUNNEL_TXINFO
+}
+
+test_tx_no_route()
+{
+	setup_ns_pair
+	# Nothing knows how to reach the remote endpoint of the tunnel.
+	add_gre "$NS_SND" "$SND_V4" 172.31.255.254
+	ip -n "$NS_SND" addr add "$TUN_SND/24" dev gre_test
+
+	check_reason "gre: no route to the remote endpoint" IP_OUTNOROUTES
+}
+
 if [ "$(id -u)" -ne 0 ]; then
 	echo "SKIP: need root"
 	exit "$ksft_skip"
@@ -279,6 +331,10 @@ test_corrupted_header "gre: routing bit set" GRE_INVALID_HDR \
 test_corrupted_header "gre: unhandled GRE version" UNHANDLED_PROTO \
 	offset 21 u8 set 0x01
 
+test_tx_pkt_too_big
+test_tx_no_metadata
+test_tx_no_route
+
 if [ -e /proc/sys/net/ipv6 ]; then
 	test_opts_mismatch ip6gre iseq
 	test_old_seq ip6gre
-- 
2.47.3

