Received: from mail-wm1-f99.google.com (mail-wm1-f99.google.com [209.85.128.99])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8D3CE3BC660
	for <linux-kselftest@vger.kernel.org>; Fri, 20 Mar 2026 13:59:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.99
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774015203; cv=none; b=U7pPG9AJNY+gwooZ8xg07yMBt9NUQzRjoP/Na9XC/KIfLIRy7eO6ZN/BtoVfYNnSIsVYbQeBIq1aPwzxX4egpaPxrwMcqQu1UleJbguorHl+QeunzAgmXW4i1yO9w2k1tz3pfgHaXotRpDeBJpiV4Zq8XMCmUWCHO9OTM/w/QHk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774015203; c=relaxed/simple;
	bh=dBwaCSZBdDssZVKTAnmoq01jrdQrKsOdNu8j6J0fJeQ=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=oc8XTkBOe4hH9OCiV+dlEunS1AzQeEpDvD/6kb5SalohWiHx4YpwVKzMg31Vl17Vx4hmI2QoeKTN3AURfw8gT9BIvYpEdknTKAKqWGWsE36aUbKBFWrSnvMW1GwxfwgLMmFMw5F8ZP3B9tINM3r+kzvxY5WIqcNgIb7AGfVhN/8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=6wind.com; spf=pass smtp.mailfrom=6wind.com; dkim=pass (2048-bit key) header.d=6wind.com header.i=@6wind.com header.b=ZsKtRKbB; arc=none smtp.client-ip=209.85.128.99
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=6wind.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=6wind.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=6wind.com header.i=@6wind.com header.b="ZsKtRKbB"
Received: by mail-wm1-f99.google.com with SMTP id 5b1f17b1804b1-486b96760easo22347775e9.2
        for <linux-kselftest@vger.kernel.org>; Fri, 20 Mar 2026 06:59:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=6wind.com; s=google; t=1774015196; x=1774619996; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ZaGQ7bAe7Qv2bP6EwvdVuCN6lWQ/fgqQXKLbW79lSys=;
        b=ZsKtRKbBlLU/O5DiCycBOXWDeR2VAUfKDSwRAE0vsdD9rUqHrKBlZKGg8YpAWj0nZ5
         kPgfKcsdTktAf1lh6QaV2VoS8ZLJNXAEx64vxikKU0KHMmibOBfRldW9OGRtqpL1BUjW
         L25n3D9A9N7VTK4ntboV5Jwdq0v0CwaAk5xZk/kX7f7GoNbHlB1ECZWAIvdrbI6fEtIT
         4vnhcGssDhaN9HoHxnreYS3sto1sQq91EYllWUr0ZtPAhfTmtG/+TYclovP5K1mecNRt
         d+2qDsXek/p3lzrHPHPagCW6ChMshHM073/UaMIH/HP3MFoojfRYiInim6MOJpzwmevB
         0B3w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774015196; x=1774619996;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=ZaGQ7bAe7Qv2bP6EwvdVuCN6lWQ/fgqQXKLbW79lSys=;
        b=sGYcRNAvWYy0Plufou/sIoiSQCQ4r3q9bYc9m9D/Z08x4BOXkT8uyrsmRr4oC3WM7x
         +WOpgxucKbq2vLZCScSMdyrq3mRdRVnaKnLK+C0gQkCRNhc+cWowsHk1XTDhhvg7AnsC
         +hw3yoAZ/u3FPWNkUHxYXq9PPWnQno7kN+GkrGVf8+TW9QjFbYl+dpZhsM9CCD5pwRTM
         mr54TXmKSUd2Jf4GnHqBVgFW2os1bpsLGxvgIq7j4DdNoer9mvBAKxkazungScRuf+JU
         SsJRzX9SD7nHf7OMtw1xWtCYGJ+xcQ3AZWaTVeKbl07xVZDFgm1F7dqGEcq6Db3pFTv2
         +y7g==
X-Forwarded-Encrypted: i=1; AJvYcCU+RKuMaskfFfMiP1W2ahvcsd6AsLFaYIuVhrnIlXo3bYipHd6Fu+7pGD4aAJGJ+G+Qg2LhhT6YTWgvpBpNp4c=@vger.kernel.org
X-Gm-Message-State: AOJu0YzEZ3b/BFM3MlRg/Kmy7qLYloQ+oqkdiL5Cnz1zw1mqQHDz0qcR
	qFuKS4K9FS4j0sAnXimU9bV6/YHtQb7RegB6p7Po0hlvPI7RsE67DrPtX5uWMhfTO3f9OSAoiCU
	PaMJaA0DRS6ceiMYBD9LsE32HbPfqMT/u0aey
X-Gm-Gg: ATEYQzwWYNuBS1jGflmV09o/ugTK5lFBi6y6JQMhGmIknYxZHUNA5sDzgD5o5gvcXQs
	2Jk3lDg0o+5S9B/RNf+oCHWuxo2Oi1GcaB6IW0O4fEk960Mn4rWCsl5fDsFmACAGlrMuiYib7ac
	3YH0drspwKV7lxOpAmXMsKxzOp/AGemRmMKhNQ9z00kadyQN/HcfOVJk+MBzWXNFP56Oy59X8q8
	+EUGgk+zjumzU+cV1tvAsmM3YlPNFEjsleVnxi4Ya540Tj7bc96wPapGWJs4/folI1lm6X1mv+5
	3ss6Zz7Prmj5pnTGpvhpYvPlG7HyLYp79VYpM3otBgv5fBZbrCz+91zmiiGkqErpvSWbKiLt3ZZ
	Xoh6ntd4drfgwWaf7hgGBblzBOvS2C37SdIzyQXeo3e/g4XFo9Qa0lRpgCtNkZpPB1vWLiy1q1g
	==
X-Received: by 2002:a05:600c:524e:b0:486:f634:ef3 with SMTP id 5b1f17b1804b1-486ff01efcdmr47257075e9.32.1774015196335;
        Fri, 20 Mar 2026 06:59:56 -0700 (PDT)
Received: from smtpservice.6wind.com ([185.13.181.2])
        by smtp-relay.gmail.com with ESMTP id 5b1f17b1804b1-486fe7e3b16sm1152305e9.6.2026.03.20.06.59.56;
        Fri, 20 Mar 2026 06:59:56 -0700 (PDT)
X-Relaying-Domain: 6wind.com
Received: from localhost (kadavar.dev.6wind.com [10.17.1.232])
	by smtpservice.6wind.com (Postfix) with ESMTP id 387321C273;
	Fri, 20 Mar 2026 14:59:56 +0100 (CET)
From: Justin Iurman <justin.iurman@6wind.com>
To: netdev@vger.kernel.org
Cc: andrea.mayer@uniroma2.it,
	davem@davemloft.net,
	edumazet@google.com,
	kuba@kernel.org,
	pabeni@redhat.com,
	horms@kernel.org,
	justin.iurman@gmail.com,
	nicolas.dichtel@6wind.com,
	stefano.salsano@uniroma2.it,
	Justin Iurman <justin.iurman@6wind.com>,
	Shuah Khan <shuah@kernel.org>,
	linux-kselftest@vger.kernel.org
Subject: [PATCH net-next v4 2/2] selftests: add check for seg6 tunsrc
Date: Fri, 20 Mar 2026 14:59:09 +0100
Message-Id: <20260320135909.1729313-3-justin.iurman@6wind.com>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20260320135909.1729313-1-justin.iurman@6wind.com>
References: <20260320135909.1729313-1-justin.iurman@6wind.com>
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Extend srv6_hencap_red_l3vpn_test.sh to include checks for the new
"tunsrc" feature. If there is no support for tunsrc, it silently
falls back to the encap config without tunsrc.

Cc: Shuah Khan <shuah@kernel.org>
Cc: linux-kselftest@vger.kernel.org
Signed-off-by: Justin Iurman <justin.iurman@6wind.com>
---
 .../net/srv6_hencap_red_l3vpn_test.sh         | 95 ++++++++++++++++---
 1 file changed, 82 insertions(+), 13 deletions(-)

diff --git a/tools/testing/selftests/net/srv6_hencap_red_l3vpn_test.sh b/tools/testing/selftests/net/srv6_hencap_red_l3vpn_test.sh
index 6a68c7eff1dc..a6e32279a1f7 100755
--- a/tools/testing/selftests/net/srv6_hencap_red_l3vpn_test.sh
+++ b/tools/testing/selftests/net/srv6_hencap_red_l3vpn_test.sh
@@ -193,6 +193,8 @@ ret=${ksft_skip}
 nsuccess=0
 nfail=0
 
+HAS_TUNSRC=false
+
 log_test()
 {
 	local rc="$1"
@@ -345,6 +347,14 @@ setup_rt_networking()
 		ip -netns "${nsname}" addr \
 			add "${net_prefix}::${rt}/64" dev "${devname}" nodad
 
+		# A dedicated ::dead:<rt> address (with preferred_lft 0, i.e.,
+		# deprecated) is added. Because it is deprecated, the kernel
+		# should never auto-select it as source with current config.
+		# Only an explicit tunsrc can place it in the outer header.
+		ip -netns "${nsname}" addr \
+			add "${net_prefix}::dead:${rt}/64" dev "${devname}" \
+			nodad preferred_lft 0
+
 		ip -netns "${nsname}" link set "${devname}" up
 	done
 
@@ -420,6 +430,7 @@ setup_rt_local_sids()
 #       to the destination host)
 #  $5 - encap mode (full or red)
 #  $6 - traffic type (IPv6 or IPv4)
+#  $7 - force tunsrc (true or false)
 __setup_rt_policy()
 {
 	local dst="$1"
@@ -428,10 +439,40 @@ __setup_rt_policy()
 	local dec_rt="$4"
 	local mode="$5"
 	local traffic="$6"
+	local with_tunsrc="$7"
 	local nsname
 	local policy=''
+	local tunsrc=''
 	local n
 
+	# Verify the per-route tunnel source address ("tunsrc") feature.
+	# If it is not supported, fallback on encap config without tunsrc.
+	if $with_tunsrc && $HAS_TUNSRC; then
+		local net_prefix
+		local nxt
+
+		eval nsname=\${$(get_rtname "${dec_rt}")}
+
+		# Next SRv6 hop: first End router if any, or the decap router
+		[ -z "${end_rts}" ] && nxt="${dec_rt}" || nxt="${end_rts%% *}"
+
+		# Use the right prefix for tunsrc depending on the next SRv6 hop
+		net_prefix="$(get_network_prefix "${encap_rt}" "${nxt}")"
+		tunsrc="tunsrc ${net_prefix}::dead:${encap_rt}"
+
+		# To verify that the outer source address matches the one
+		# configured with tunsrc, the decap router discards packets
+		# with any other source address.
+		ip netns exec "${nsname}" ip6tables -t raw -I PREROUTING 1 \
+			-s "${net_prefix}::dead:${encap_rt}" \
+			-d "${VPN_LOCATOR_SERVICE}:${dec_rt}::${DT46_FUNC}" \
+			-j ACCEPT
+
+		ip netns exec "${nsname}" ip6tables -t raw -A PREROUTING \
+			-d "${VPN_LOCATOR_SERVICE}:${dec_rt}::${DT46_FUNC}" \
+			-j DROP
+	fi
+
 	eval nsname=\${$(get_rtname "${encap_rt}")}
 
 	for n in ${end_rts}; do
@@ -444,7 +485,7 @@ __setup_rt_policy()
 	if [ "${traffic}" -eq 6 ]; then
 		ip -netns "${nsname}" -6 route \
 			add "${IPv6_HS_NETWORK}::${dst}" vrf "${VRF_DEVNAME}" \
-			encap seg6 mode "${mode}" segs "${policy}" \
+			encap seg6 mode "${mode}" ${tunsrc} segs "${policy}" \
 			dev "${VRF_DEVNAME}"
 
 		ip -netns "${nsname}" -6 neigh \
@@ -455,7 +496,7 @@ __setup_rt_policy()
 		# received, otherwise the proxy arp does not work.
 		ip -netns "${nsname}" -4 route \
 			add "${IPv4_HS_NETWORK}.${dst}" vrf "${VRF_DEVNAME}" \
-			encap seg6 mode "${mode}" segs "${policy}" \
+			encap seg6 mode "${mode}" ${tunsrc} segs "${policy}" \
 			dev "${VRF_DEVNAME}"
 	fi
 }
@@ -463,13 +504,13 @@ __setup_rt_policy()
 # see __setup_rt_policy
 setup_rt_policy_ipv6()
 {
-	__setup_rt_policy "$1" "$2" "$3" "$4" "$5" 6
+	__setup_rt_policy "$1" "$2" "$3" "$4" "$5" 6 "$6"
 }
 
 #see __setup_rt_policy
 setup_rt_policy_ipv4()
 {
-	__setup_rt_policy "$1" "$2" "$3" "$4" "$5" 4
+	__setup_rt_policy "$1" "$2" "$3" "$4" "$5" 4 "$6"
 }
 
 setup_hs()
@@ -567,41 +608,41 @@ setup()
 	# the network path between hs-1 and hs-2 traverses several routers
 	# depending on the direction of traffic.
 	#
-	# Direction hs-1 -> hs-2 (H.Encaps.Red)
+	# Direction hs-1 -> hs-2 (H.Encaps.Red + tunsrc)
 	#  - rt-3,rt-4 (SRv6 End behaviors)
 	#  - rt-2 (SRv6 End.DT46 behavior)
 	#
 	# Direction hs-2 -> hs-1 (H.Encaps.Red)
 	#  - rt-1 (SRv6 End.DT46 behavior)
-	setup_rt_policy_ipv6 2 1 "3 4" 2 encap.red
-	setup_rt_policy_ipv6 1 2 "" 1 encap.red
+	setup_rt_policy_ipv6 2 1 "3 4" 2 encap.red true
+	setup_rt_policy_ipv6 1 2 "" 1 encap.red false
 
 	# create an IPv4 VPN between hosts hs-1 and hs-2
 	# the network path between hs-1 and hs-2 traverses several routers
 	# depending on the direction of traffic.
 	#
-	# Direction hs-1 -> hs-2 (H.Encaps.Red)
+	# Direction hs-1 -> hs-2 (H.Encaps.Red + tunsrc)
 	# - rt-2 (SRv6 End.DT46 behavior)
 	#
 	# Direction hs-2 -> hs-1 (H.Encaps.Red)
 	#  - rt-4,rt-3 (SRv6 End behaviors)
 	#  - rt-1 (SRv6 End.DT46 behavior)
-	setup_rt_policy_ipv4 2 1 "" 2 encap.red
-	setup_rt_policy_ipv4 1 2 "4 3" 1 encap.red
+	setup_rt_policy_ipv4 2 1 "" 2 encap.red true
+	setup_rt_policy_ipv4 1 2 "4 3" 1 encap.red false
 
 	# create an IPv6 VPN between hosts hs-3 and hs-4
 	# the network path between hs-3 and hs-4 traverses several routers
 	# depending on the direction of traffic.
 	#
-	# Direction hs-3 -> hs-4 (H.Encaps.Red)
+	# Direction hs-3 -> hs-4 (H.Encaps.Red + tunsrc)
 	# - rt-2 (SRv6 End Behavior)
 	# - rt-4 (SRv6 End.DT46 behavior)
 	#
 	# Direction hs-4 -> hs-3 (H.Encaps.Red)
 	#  - rt-1 (SRv6 End behavior)
 	#  - rt-3 (SRv6 End.DT46 behavior)
-	setup_rt_policy_ipv6 4 3 "2" 4 encap.red
-	setup_rt_policy_ipv6 3 4 "1" 3 encap.red
+	setup_rt_policy_ipv6 4 3 "2" 4 encap.red true
+	setup_rt_policy_ipv6 3 4 "1" 3 encap.red false
 
 	# testing environment was set up successfully
 	SETUP_ERR=0
@@ -809,6 +850,33 @@ test_vrf_or_ksft_skip()
 	fi
 }
 
+# Before enabling tunsrc tests, make sure tunsrc and ip6tables are supported.
+check_tunsrc_support()
+{
+	setup_ns tunsrc_ns
+
+	ip -netns "${tunsrc_ns}" link add veth0 type veth \
+		peer name veth1 netns "${tunsrc_ns}"
+
+	ip -netns "${tunsrc_ns}" link set veth0 up
+
+	if ! ip -netns "${tunsrc_ns}" -6 route add fc00::dead:beef/128 \
+			encap seg6 mode encap.red tunsrc fc00::1 segs fc00::2 \
+			dev veth0 &>/dev/null; then
+		cleanup_ns "${tunsrc_ns}"
+		return
+	fi
+
+	if ! ip netns exec "${tunsrc_ns}" ip6tables -t raw -A PREROUTING \
+			-d fc00::dead:beef -j DROP &>/dev/null; then
+		cleanup_ns "${tunsrc_ns}"
+		return
+	fi
+
+	cleanup_ns "${tunsrc_ns}"
+	HAS_TUNSRC=true
+}
+
 if [ "$(id -u)" -ne 0 ]; then
 	echo "SKIP: Need root privileges"
 	exit "${ksft_skip}"
@@ -826,6 +894,7 @@ test_vrf_or_ksft_skip
 set -e
 trap cleanup EXIT
 
+check_tunsrc_support
 setup
 set +e
 
-- 
2.39.2

