Received: from mail-lf1-f54.google.com (mail-lf1-f54.google.com [209.85.167.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 947D43B71D1
	for <linux-kselftest@vger.kernel.org>; Mon, 31 Aug 2026 21:52:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788213131; cv=none; b=MP7+QFI8kLbWMLa7Kls1Fp9HpQnO/MliZT4RS53ImDeh+EV3PN7fJukj7U2xHOoDGtqmyJoTTaJ4oRl5m+5kEdvSplch9iVIKAPoD4KJcYiCrk/2Vvu5N3J3sh2DOFjGAMVye4hRKvlsjkWTXkswziYyoCZ5rFyhxW3LiaScNZ8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788213131; c=relaxed/simple;
	bh=YuTeDlB5rSGQjCGg0nhug/A5mS/4NUh11W33+NvMTeI=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=JMxm6OowEJ3fERynsyVznF/xfrwkApdKGZsM13DY7vhTFEB5Jp10HSldlpNqF85F6zi5Tesad4WIRZUzTLzUL4EAHVIaF+x/Q+tJ+1V3A6g4uJR0A2wxxmuKvCeuqLafOVGK6AiBm0fCCEWDQGqDtIl5ebdRKgTY9wr8WXaBA2I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=MjhmwFaR; arc=none smtp.client-ip=209.85.167.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="MjhmwFaR"
Received: by mail-lf1-f54.google.com with SMTP id 2adb3069b0e04-5b5607bd3b5so3646234e87.3
        for <linux-kselftest@vger.kernel.org>; Mon, 31 Aug 2026 14:52:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788213121; x=1788817921; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=N3b1QazDuG4xzv4W7Y1bzZmafsmvUHp3dVsi9T+Ml1A=;
        b=MjhmwFaRxYAvYIWJsf6j0XmbfbkCHQnWXCzAfNge6i+m/SXHRtjmGuJfEzGNQ0Rgnm
         PxA1cCeDJloqh5W1EQSu7zGkgBQGy3O6aPofbHGAsTCHkD40UDsnKm/GAWVpNGg8Igz/
         iauwHokC1pdmvpfxkhC58kjprU9nhJopkAHCQhNqHOZKz/i5LJXseytLmE4HBeW974JI
         UAK7MLFfivGFfzZCWbBWF3TofzEhFvl75hak4tGGEcgaEuH2SDCFilJ8gBxoEl1XWWpt
         KHUrQ+vgHITNuaI37YbBlBcXWNX2ntzpkAOf9RH0TeGEWZxCNxnEOuhDrSdUGUdvzl0J
         yYJA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788213121; x=1788817921;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=N3b1QazDuG4xzv4W7Y1bzZmafsmvUHp3dVsi9T+Ml1A=;
        b=HdrlVg0qg47pOSdkVRUawuBiUZE5mZKlXBUbkzDMmc/75hBakgux3d587Oj6NC2w6G
         ooEkRfoKHNBRQtH8s+JQfbwCbORMhwdxnU0sreHO+1RWrO9WPBLCDPjPBsprK7g5p01D
         if9W/Dp2RAqme9WdpMmbSkyyfO20VTUb93K3nxDQIq8pcnD0Cg4bN5hbu3POw1+MS9hd
         j5rUaiol4Bi9HU32jyEqK5wNzewplJ3bS0J9jxTYwdDxPJwdPUrh5hlKYuRkQZ3mPyOa
         IAa17Iaw6fxVGh1eklj2sKe4M6TmBKZUCRIJ9GAG/cv3QDsoQtOBRtidaPVzUFTb+Fnp
         SYVQ==
X-Forwarded-Encrypted: i=1; AKwUvBwCJnKgRpGMdCEUDE3+ZxUVmVWC3fC6vc27Vczw3C+4Qj7fmhHjaXDici8D0rNrrWIfODRablg4ABNnhUGi0tg=@vger.kernel.org
X-Gm-Message-State: AFuF++llCORd/Mxg4Tvayqlcf+sZtUReDINVagxQdgSHSFkP/Ihm1mdp
	43iGW0pDrcPgySPypQfT9eOHyA1CI1mT/c68ZZCTUYvfTw4B2PcxMx8IzKhMpUYmZ+k=
X-Gm-Gg: AYBFou1UlQ93hgB01+2nJpIKHHuc4x8/ffMC/D+wdIBxwMdS1TmKq6q6iKvKaqzmslV
	u2USCpnLqT8x3r5/LWo0dmv82xWKQgCg1XbLevx0XHitR7TMFTbDjIMlYCLfGaZ5j5RQaNPWz9+
	auSsgNxw0xlZ0eq+qahigUzYI/P4Q0v2ivCk1xQ96VjYSUBAC+FKt3R29oxMjB9wH170LMyvOJL
	fBFabCXtu1BPpWwfk7QXUWFOEZrb66QYWMC/dVXiw5WAe6HP5tEzshX3qJWNH1/kNypd2SHPI+u
	nTc65q7znqlS+o3bUIw4+t88zNLoJwGrEaFTBkJlIMCrcjp/M1o5EGy8fPTD0n7zs1hkD5bijdD
	2yVD2uI2bQVT4V+7hg3ubfec4Avsli2mrsm9NuZWmTTNK415cuj3GDHvz9nSFpuw7rEqj66Q30k
	KgSxGGPJ8ZBM0Acbcb5ZNjhpktyQ4jXRm1CAOrX6UCCL3YEOoCTt1y7bT4ylZjEH169e2tzBUsd
	bFabRnRDD85BwEhRg+1uHpr3a+oj5ezxlUYisU3G4T2
X-Received: by 2002:a05:6512:3c8a:b0:5b0:22a6:6b13 with SMTP id 2adb3069b0e04-5b5e684ae6bmr9361502e87.0.1788213121068;
        Mon, 31 Aug 2026 14:52:01 -0700 (PDT)
Received: from dau-home-pc.. ([212.35.184.237])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5b5e8a06a77sm2388782e87.48.2026.08.31.14.51.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 31 Aug 2026 14:52:00 -0700 (PDT)
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
Subject: [PATCH net-next 07/11] selftests: net: cover the GRE specific drop reasons
Date: Tue,  1 Sep 2026 00:51:33 +0300
Message-ID: <20260831215137.549324-8-littlesmilingcloud@gmail.com>
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

Extend the tunnel drop reason test with the reasons added to the GRE
receive path:

 - two endpoints configured with different keys make the tunnel lookup
   on the receiver fail, which is reported as GRE_TUNNEL_NOT_FOUND,

 - setting the routing bit of the GRE header is reported as
   GRE_INVALID_HDR, and announcing GRE version 1, which has no handler
   unless PPTP is built in, is reported as UNHANDLED_PROTO.

The last two corrupt the header of the received packets with tc pedit
and are skipped when the ingress qdisc or the pedit action are not
available.

SKB_DROP_REASON_GRE_CSUM is not covered: veth hands the packets over
with CHECKSUM_UNNECESSARY, so the GRE checksum is never validated and
the reason cannot be reached without crafting the packets.

Assisted-by: Claude-Code:claude-opus-5
Signed-off-by: Anton Danilov <littlesmilingcloud@gmail.com>
---
 .../selftests/net/tunnel_drop_reasons.sh      | 62 +++++++++++++++++++
 1 file changed, 62 insertions(+)

diff --git a/tools/testing/selftests/net/tunnel_drop_reasons.sh b/tools/testing/selftests/net/tunnel_drop_reasons.sh
index eb19967ae7dd..aad003f0efe5 100755
--- a/tools/testing/selftests/net/tunnel_drop_reasons.sh
+++ b/tools/testing/selftests/net/tunnel_drop_reasons.sh
@@ -20,6 +20,17 @@
 # A control case, where both endpoints agree on the options, makes sure
 # that no tunnel drop reason is reported when packets are accepted.
 #
+# The GRE specific reasons are checked as well:
+#
+#  - a packet that matches no tunnel is reported as
+#    GRE_TUNNEL_NOT_FOUND.  It is triggered here by giving the two
+#    endpoints different keys.
+#
+#  - a header with the routing bit set is reported as GRE_INVALID_HDR,
+#    and a header announcing a GRE version nobody handles is reported as
+#    UNHANDLED_PROTO.  Both are triggered by corrupting the GRE header
+#    on ingress with tc pedit, and are skipped if that is not available.
+#
 # Drop reasons are read from the skb:kfree_skb tracepoint.  A dedicated
 # trace instance is used so that the test does not disturb, and is not
 # disturbed by, anything else using the tracing facility.
@@ -202,6 +213,47 @@ test_control()
 	check_reason "gre: matching configuration (control)" ""
 }
 
+# Corrupt one field of the GRE header of every IPv4 packet received by
+# the receiver.  $1 is a tc pedit munge expression, with offsets counted
+# from the start of the IPv4 header.
+corrupt_gre_header()
+{
+	ip netns exec "$NS_RCV" tc qdisc add dev veth_r ingress || return 1
+	ip netns exec "$NS_RCV" tc filter add dev veth_r ingress \
+		protocol ip matchall action pedit ex munge "$@" || return 1
+}
+
+test_tunnel_not_found()
+{
+	setup_ns_pair
+	# The two endpoints use different keys, so the lookup on the
+	# receiver finds no tunnel for the incoming packets.
+	add_gre "$NS_SND" "$SND_V4" "$RCV_V4" okey 1 ikey 1
+	add_gre "$NS_RCV" "$RCV_V4" "$SND_V4" okey 2 ikey 2
+	addr_tunnels
+
+	check_reason "gre: tunnel not found" GRE_TUNNEL_NOT_FOUND
+}
+
+# $1: test name, $2: expected reason, $3...: tc pedit munge expression
+test_corrupted_header()
+{
+	local name=$1 want=$2
+
+	shift 2
+	setup_ns_pair
+	add_gre "$NS_SND" "$SND_V4" "$RCV_V4"
+	add_gre "$NS_RCV" "$RCV_V4" "$SND_V4"
+	addr_tunnels
+
+	if ! corrupt_gre_header "$@" 2>/dev/null; then
+		log_test_skip "$name"
+		return
+	fi
+
+	check_reason "$name" "$want"
+}
+
 if [ "$(id -u)" -ne 0 ]; then
 	echo "SKIP: need root"
 	exit "$ksft_skip"
@@ -217,6 +269,16 @@ test_opts_mismatch gre icsum
 test_control
 test_old_seq gre
 
+test_tunnel_not_found
+# The routing bit is the second most significant bit of the first byte
+# of the GRE header, which follows the 20 byte IPv4 header.
+test_corrupted_header "gre: routing bit set" GRE_INVALID_HDR \
+	offset 20 u8 set 0x40
+# The GRE version sits in the low bits of the next byte.  Version 1 is
+# PPTP, which has no handler here.
+test_corrupted_header "gre: unhandled GRE version" UNHANDLED_PROTO \
+	offset 21 u8 set 0x01
+
 if [ -e /proc/sys/net/ipv6 ]; then
 	test_opts_mismatch ip6gre iseq
 	test_old_seq ip6gre
-- 
2.47.3

