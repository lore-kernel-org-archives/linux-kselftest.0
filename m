Received: from mail-ej1-f100.google.com (mail-ej1-f100.google.com [209.85.218.100])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 480CA3A1E95
	for <linux-kselftest@vger.kernel.org>; Mon, 16 Mar 2026 16:30:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.100
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773678658; cv=none; b=GfgfNq9G5sd4MHjog7MNtX1MR2/wJRTfVTwY2EXDpxbLD0XEPeDzoD1oYe5FDgFxrbBFByEGFvXvtwMSX08uX0/cR1/wNGjObJp24Md8qrCzC7OU2pC6acGIvhwEdtn/M3jU+1nrPnXC4+GPzapv8NN/3+x/wkDIe09AYCRcII4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773678658; c=relaxed/simple;
	bh=3eOUF/0t4xtstufAr4jTFkqeyICqNkit2RzVHVoXX9U=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=VSdAdGBCEeqE76N16yfTX0KDBc/lLfFcLI7pmuYus0oV2QJRohg5RVgof5BZh93vZFOw9YFCBflEk4L04JZ48EyfhJiuRHt4cR1x30gkrEMVdLXhEbgjNrcytgQD+XhCJUsgoP9m+4FDrde3fjVCCUtZ4LCjFdloD/4O3BRa3ys=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=6wind.com; spf=pass smtp.mailfrom=6wind.com; dkim=pass (2048-bit key) header.d=6wind.com header.i=@6wind.com header.b=SGbR1334; arc=none smtp.client-ip=209.85.218.100
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=6wind.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=6wind.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=6wind.com header.i=@6wind.com header.b="SGbR1334"
Received: by mail-ej1-f100.google.com with SMTP id a640c23a62f3a-b79f8f7ea43so794550866b.2
        for <linux-kselftest@vger.kernel.org>; Mon, 16 Mar 2026 09:30:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=6wind.com; s=google; t=1773678656; x=1774283456; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=PEh7BRKAizp8GGJ568E4oqZ+Kbjdlfk2PW2zSqId4BE=;
        b=SGbR1334Yg4AoRJiyHGpNvoqEmL9aQ9JHHBd6NvcTyJMJoo+UPf28Di7AMablVTPFN
         bxy0JSGI+544TgExv97J20eSql+dV7HsI7x42ZwBBZsFTkEjB4fBQfvbk50cK5s7yIfQ
         KFBKsHWhnHkD9gmw12q2/sV5Ki01EC8f4YoXrm8dmSa1j9jliVXp1s1XjMHEP5EapKGl
         L7ahAWcXaq+1jDKXT1aB1lckJ/KUMVtjO7LM7RYg5V0mSUV95ZTdi+e+R8tX9uviJYlw
         4RsfGMt4zT3Uf2Adm9Uxof67OFppbaGfESbeSJLDA8EMpuq2CsSkEV2Z3QbdMWkyLTcp
         UQdQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1773678656; x=1774283456;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=PEh7BRKAizp8GGJ568E4oqZ+Kbjdlfk2PW2zSqId4BE=;
        b=pnQGcviq3yhFdTP0raSupBmU+tl0f3rN5wP4jQLaqlpQdna8FPv72SXjYd+REytj4V
         3IrP5MaiPSWULa1IbcUR3Nra/e2Bp87mDRyUyDkyb3HyT+3i8uERo20rcZgK7ixJXanf
         gkK7Fk9PO9vi78m8bTE/F7fD6jJI8FV1tj3kMA58GUWgJxatqhER5LxEUyT/mnC8DOdb
         Hx8dp8NW5gM3YoqLTPkFDyQcDxp863n3Qjwds6+Gx8XKEBAHdgd50KvztJO2dhcfeCln
         ZPInicXdtQ+Jp5IoQwcn/rg3CJBgzXgBVhlo5TNNlnl10ReWAUw6o7Io/4CnlQE1CyvO
         BHKg==
X-Forwarded-Encrypted: i=1; AJvYcCWe+FJIBJHMRFwTl1b7YvbHOgpk8/saHz0buCub6wojZF0G60yDSh2ZagQv9fnmYZLgTgx2Dsc7vyaTNtQ4kwc=@vger.kernel.org
X-Gm-Message-State: AOJu0YyHZQh3So4gyNBl7SLZrXqBeFG87e65XNJNs1U9UvNaZiyGDhAY
	ZA2Y/aGNcP4lh2on/BcAXKyxnsA5cKzXi/Bl6iuchVmhtLQuKHEdueuaREKzqDiXNJALl+IZ8P1
	iDyKsu2XIxMZMNjGTX77lSD/B6/YWFsCGvGeF
X-Gm-Gg: ATEYQzyIk4aoZw3basypuPwvpgf30QOeeLsgsuqYssmB3I4fr3ELynTsD5wu/4F+FQf
	Pl2m2IKsUgeCclX6VXd6bxZT2uhOAc3TAIf5GMOP/jortx3f/+0pySgXYCDVHbFXdElxnfMwKq4
	Ra5mPKnqQo1Ykrn7XaVMJmVrE2w3L/ovyqLsfDEQ+mJvCSq43mB396M8jaqpvl9JYN3hrJV7H5R
	tgvDIek7pK6vpWvUV4L72+cnCIROoTT0UfYpV39+9oxhgij5sWFYtIKDJxwj9Ju3mZ2IyAzGEcK
	g4/kpmTOkapg7Ddsoo+V7cGcTCZVbzZ0Yv+Ny3ZnBAxgDjCQ9C6r6b3StH98c89DvrQhx1GXiEF
	nPjQEZ4unI3uUymO5vsaZtTYn7IOLLD2Sg+ZBJInrZx1qa1dK56RoDfo/tVn0enTTdxbQzxzqAg
	==
X-Received: by 2002:a17:907:e106:b0:b8f:9525:1099 with SMTP id a640c23a62f3a-b9765345c16mr499076666b.35.1773678655357;
        Mon, 16 Mar 2026 09:30:55 -0700 (PDT)
Received: from smtpservice.6wind.com ([185.13.181.2])
        by smtp-relay.gmail.com with ESMTP id a640c23a62f3a-b97a4dac429sm45802566b.17.2026.03.16.09.30.55;
        Mon, 16 Mar 2026 09:30:55 -0700 (PDT)
X-Relaying-Domain: 6wind.com
Received: from localhost (kadavar.dev.6wind.com [10.17.1.232])
	by smtpservice.6wind.com (Postfix) with ESMTP id 3111E19F7B;
	Mon, 16 Mar 2026 17:30:55 +0100 (CET)
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
	paolo.lungaroni@uniroma2.it,
	ahabdels@cisco.com,
	Justin Iurman <justin.iurman@6wind.com>,
	Shuah Khan <shuah@kernel.org>,
	linux-kselftest@vger.kernel.org
Subject: [PATCH net-next v3 2/2] selftests: add check for seg6 tunsrc
Date: Mon, 16 Mar 2026 17:29:55 +0100
Message-Id: <20260316162955.1253225-3-justin.iurman@6wind.com>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20260316162955.1253225-1-justin.iurman@6wind.com>
References: <20260316162955.1253225-1-justin.iurman@6wind.com>
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Extend srv6_hencap_red_l3vpn_test.sh to include checks for the new
"tunsrc" feature.

Cc: Shuah Khan <shuah@kernel.org>
Cc: linux-kselftest@vger.kernel.org
Signed-off-by: Justin Iurman <justin.iurman@6wind.com>
---
 .../net/srv6_hencap_red_l3vpn_test.sh         | 65 ++++++++++++++-----
 1 file changed, 50 insertions(+), 15 deletions(-)

diff --git a/tools/testing/selftests/net/srv6_hencap_red_l3vpn_test.sh b/tools/testing/selftests/net/srv6_hencap_red_l3vpn_test.sh
index 6a68c7eff1dc..bdc485640f79 100755
--- a/tools/testing/selftests/net/srv6_hencap_red_l3vpn_test.sh
+++ b/tools/testing/selftests/net/srv6_hencap_red_l3vpn_test.sh
@@ -345,6 +345,10 @@ setup_rt_networking()
 		ip -netns "${nsname}" addr \
 			add "${net_prefix}::${rt}/64" dev "${devname}" nodad
 
+		ip -netns "${nsname}" addr \
+			add "${net_prefix}::dead:${rt}/64" dev "${devname}" \
+			nodad preferred_lft 0
+
 		ip -netns "${nsname}" link set "${devname}" up
 	done
 
@@ -419,7 +423,8 @@ setup_rt_local_sids()
 #  $4 - SRv6 router configured for removing the SRv6 Policy (router connected
 #       to the destination host)
 #  $5 - encap mode (full or red)
-#  $6 - traffic type (IPv6 or IPv4)
+#  $6 - force tunsrc (true or false)
+#  $7 - traffic type (IPv6 or IPv4)
 __setup_rt_policy()
 {
 	local dst="$1"
@@ -427,11 +432,40 @@ __setup_rt_policy()
 	local end_rts="$3"
 	local dec_rt="$4"
 	local mode="$5"
-	local traffic="$6"
+	local with_tunsrc="$6"
+	local traffic="$7"
 	local nsname
 	local policy=''
+	local tunsrc=''
 	local n
 
+	if [ "$with_tunsrc" = "true" ]; then
+		local net_prefix
+		local drule
+		local nxt
+
+		[ "$end_rts" = "" ] && nxt="${dec_rt}" || nxt="${end_rts%% *}"
+
+		net_prefix="$(get_network_prefix "${encap_rt}" "${nxt}")"
+		tunsrc="tunsrc ${net_prefix}::dead:${encap_rt}"
+
+		eval nsname=\${$(get_rtname "${dec_rt}")}
+
+		drule="PREROUTING \
+		       -d ${VPN_LOCATOR_SERVICE}:${dec_rt}::${DT46_FUNC} \
+		       -j DROP"
+
+		if ! ip netns exec "${nsname}" \
+			ip6tables -t raw -C ${drule} &>/dev/null; then
+			ip netns exec "${nsname}" ip6tables -t raw -A ${drule}
+		fi
+
+		ip netns exec "${nsname}" ip6tables -t raw -I PREROUTING 1 \
+			-s "${net_prefix}::dead:${encap_rt}" \
+			-d ${VPN_LOCATOR_SERVICE}:${dec_rt}::${DT46_FUNC} \
+			-j ACCEPT
+	fi
+
 	eval nsname=\${$(get_rtname "${encap_rt}")}
 
 	for n in ${end_rts}; do
@@ -444,7 +478,7 @@ __setup_rt_policy()
 	if [ "${traffic}" -eq 6 ]; then
 		ip -netns "${nsname}" -6 route \
 			add "${IPv6_HS_NETWORK}::${dst}" vrf "${VRF_DEVNAME}" \
-			encap seg6 mode "${mode}" segs "${policy}" \
+			encap seg6 mode "${mode}" ${tunsrc} segs "${policy}" \
 			dev "${VRF_DEVNAME}"
 
 		ip -netns "${nsname}" -6 neigh \
@@ -455,7 +489,7 @@ __setup_rt_policy()
 		# received, otherwise the proxy arp does not work.
 		ip -netns "${nsname}" -4 route \
 			add "${IPv4_HS_NETWORK}.${dst}" vrf "${VRF_DEVNAME}" \
-			encap seg6 mode "${mode}" segs "${policy}" \
+			encap seg6 mode "${mode}" ${tunsrc} segs "${policy}" \
 			dev "${VRF_DEVNAME}"
 	fi
 }
@@ -463,13 +497,13 @@ __setup_rt_policy()
 # see __setup_rt_policy
 setup_rt_policy_ipv6()
 {
-	__setup_rt_policy "$1" "$2" "$3" "$4" "$5" 6
+	__setup_rt_policy "$1" "$2" "$3" "$4" "$5" "$6" 6
 }
 
 #see __setup_rt_policy
 setup_rt_policy_ipv4()
 {
-	__setup_rt_policy "$1" "$2" "$3" "$4" "$5" 4
+	__setup_rt_policy "$1" "$2" "$3" "$4" "$5" "$6" 4
 }
 
 setup_hs()
@@ -567,41 +601,41 @@ setup()
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
@@ -819,6 +853,7 @@ test_command_or_ksft_skip ip
 test_command_or_ksft_skip ping
 test_command_or_ksft_skip sysctl
 test_command_or_ksft_skip grep
+test_command_or_ksft_skip ip6tables
 
 test_iproute2_supp_or_ksft_skip
 test_vrf_or_ksft_skip
-- 
2.39.2

