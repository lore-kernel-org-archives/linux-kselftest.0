Received: from mail-pj1-f42.google.com (mail-pj1-f42.google.com [209.85.216.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EB85731354F
	for <linux-kselftest@vger.kernel.org>; Fri,  1 May 2026 17:32:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777656741; cv=none; b=G5TFUfnHsEnDkzr9GmRN1aeKQrtSnJ/Z43a986E7XX2sj2z777wl7kYDvBr7lob3IbUxFl0YjHfUrM6T7w+oBjJ+0Kgtb6eMGYqyfbOKDl9GdhCWqGCeeEWdOFSG2hIRCMVvpV5YoQtaCkzcY9Y8GKgoLd6ZU1fxor2VQuHmK1Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777656741; c=relaxed/simple;
	bh=UNdRW3uKisT5Fvi5K3/wNmEi4x6RxXCvZYWzNG8kchQ=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=mH7nhprbttZNDxLMFnPEcOUmJvzG/9JzcrvehtrrU6SxdL51N0iEMqv0XcNAOeNvafLte+RmorU4lLziWrgAvHua/cBM8clsNRXmx2wnH4PAO9+yhFUGTy15fCWKlKJfxUQ/R8MF3FRa25L7SlMejPp1w+46mmiZj8Z8R/pFvxQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=VLNT9R3J; arc=none smtp.client-ip=209.85.216.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="VLNT9R3J"
Received: by mail-pj1-f42.google.com with SMTP id 98e67ed59e1d1-35fc0d7c310so1525469a91.1
        for <linux-kselftest@vger.kernel.org>; Fri, 01 May 2026 10:32:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1777656739; x=1778261539; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=IzwTHkm3utnnP48DK2qyC96JgeUzR2iB5DEneSRP2HI=;
        b=VLNT9R3J+EkkBPhHzMUcxLoxxO7tRbNaTUbFkFDW1f52EBrrMUyhjmXn4psm54yO9N
         1sy5ijNAjJGl686tSMCchfPQOc7he496jAfT/HRMDuAIWGlGiJ3I8jzas3I0kNKp0ONF
         /Kp867dz3U6YRUDP1HH7SRk6cOsBtE9WdrbpzBFNxdM2+QSKrJ4WjXpmXvqOIK1ZQmJv
         TCY8WzyMzHwaQhtrw6IuR9051n/42ZOm6AG2XC4a2F9vvplY8+c4Bd1/VoEyAuWm82c2
         AhZlEHIrBnSHclPZlYoGfpfxIJ284kJy5I2Gf5JjEtGE2z9DyvXW/riJ81xltXZL1gdP
         C/yg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777656739; x=1778261539;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=IzwTHkm3utnnP48DK2qyC96JgeUzR2iB5DEneSRP2HI=;
        b=d/kPm2mFfYKRjOPLfKtrDMVoQLglL3UZLP+5tbAXMZVF8NiGXUG9x5fa0lTqWeQXtO
         Tg9F1pbl4V3N1/VOa+Vgxlhfai4fgyLBnv99qVeg11sfEIs18yF6Bk5k0k+PI4mUeyAz
         ITXjj9ND2GbGqRiO9ENUm2xPGOmsrE3JfsvjihIVcldIWf59G8UaUkmKfrfofmYeODXf
         UYzghPDqfCA6AYMQSZ1VVwDaUqowsowQ4zQU/ZaffO3Zw3G+3U7VHdd8MB4noiukLQ9a
         TKWB/Or8Qrs/gQ1ekSTLHmN9aD6gF2vBP7w8HgPXuAeaiN2jtQJLYZhULF2VBYUQM+UZ
         uJfg==
X-Forwarded-Encrypted: i=1; AFNElJ+iOJiY438WV3YpYrBbTr6ZgLzihXmT0nmVJoKrJ56D0VmTxLce8XLTFP/A+KhL02QhFBeUMvVdLfHcCtFBgo4=@vger.kernel.org
X-Gm-Message-State: AOJu0YyCZTxqUZYDJElVpI9ef6OS8fKyj3/2Pb5Od+U+huYoB548pRiE
	2t/TAOem0N9JNsvkRnGBUdwkMOiQC0b46sGw3Ed41N4eVsh+hrvJZBxL
X-Gm-Gg: AeBDieuUn/SsQNIu6hqO4rQ8RBImmQYYw8hNLskfeOHEAIErzlIxlQ55GWuOrLr76OS
	u65BiGLvlaUslw0/D+ZNOHZfJxdlGyqNWttSLlThiXvMSDxLTaV3Aq3eDKY2Wkwpr5gWgf4Tqc0
	H50yWiDPT+s70JvnCGQ7DT+2hXKYpjAe7GtNxfrdA32hQ/19MqZaHSrgW9pPoeSIog7ZkFhyWCx
	M+MUhHzYk7ZBCWTYEM8oY7xtHQ2mL4ZlvDNtz2k6RnIFGxb13DtErd/WDET/AfEsll7P71uUXzH
	GQwyHWhWTpCQ5zNV928oPi+DQjUgEyL3Z/+EGYnfvHRBgv3DaJyDMJu7G9BI2pzRfq3S2GnVfOl
	nqCqnkZWOp0oE+atghhBekYnDKlxO2yGx1zsv4oSJSoGZfpmyGn2Yn8AB6uqkiPEkUDRcIPORay
	iVmO8nDxgVhJQU/bRtnsembLn8E8gMN7q8sM14Lj7rzVg83XsGAw==
X-Received: by 2002:a17:90b:278f:b0:35c:30a8:32a with SMTP id 98e67ed59e1d1-3650cdb8085mr166497a91.9.1777656739170;
        Fri, 01 May 2026 10:32:19 -0700 (PDT)
Received: from DESKTOP-82PPU4A.localdomain ([202.8.116.84])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-364ebec73aasm2908906a91.2.2026.05.01.10.32.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 01 May 2026 10:32:18 -0700 (PDT)
From: Ujjal Roy <royujjal@gmail.com>
To: "David S . Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>,
	Paolo Abeni <pabeni@redhat.com>,
	Simon Horman <horms@kernel.org>,
	Nikolay Aleksandrov <razor@blackwall.org>,
	Ido Schimmel <idosch@nvidia.com>,
	David Ahern <dsahern@kernel.org>,
	Shuah Khan <shuah@kernel.org>,
	Andy Roulin <aroulin@nvidia.com>,
	Yong Wang <yongwang@nvidia.com>,
	Petr Machata <petrm@nvidia.com>
Cc: Ujjal Roy <ujjal@alumnux.com>,
	bridge@lists.linux.dev,
	netdev@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-kselftest@vger.kernel.org
Subject: [PATCH net-next v5 5/5] selftests: net: bridge: add MRC and QQIC field encoding tests
Date: Fri,  1 May 2026 17:31:29 +0000
Message-ID: <20260501173130.3486-6-royujjal@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260501173130.3486-1-royujjal@gmail.com>
References: <20260501173130.3486-1-royujjal@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Enhance vlmc_query_intvl_test and vlmc_query_response_intvl_test in
bridge_vlan_mcast.sh to validate IGMPv3/MLDv2 protocol compliance for
MRC and QQIC field encoding across both linear and exponential ranges.

TEST: Vlan multicast snooping enable                                [ OK ]
TEST: Vlan mcast_query_interval global option default value         [ OK ]
TEST: Number of tagged IGMPv2 general query                         [ OK ]
TEST: IGMPv3 QQIC linear value 60(s)                                [ OK ]
TEST: MLDv2 QQIC linear value 60(s)                                 [ OK ]
TEST: IGMPv3 QQIC non linear value 160(s)                           [ OK ]
TEST: MLDv2 QQIC non linear value 160(s)                            [ OK ]
TEST: Vlan mcast_query_response_interval global option default value   [ OK ]
TEST: IGMPv3 MRC linear value of 60(x0.1s)                          [ OK ]
TEST: MLDv2 MRC linear value of 24000(ms)                           [ OK ]
TEST: IGMPv3 MRC non linear value of 240(x0.1s)                     [ OK ]
TEST: MLDv2 MRC non linear value of 48000(ms)                       [ OK ]

Reviewed-by: Ido Schimmel <idosch@nvidia.com>
Signed-off-by: Ujjal Roy <royujjal@gmail.com>
---
 .../net/forwarding/bridge_vlan_mcast.sh       | 140 +++++++++++++++++-
 1 file changed, 132 insertions(+), 8 deletions(-)

diff --git a/tools/testing/selftests/net/forwarding/bridge_vlan_mcast.sh b/tools/testing/selftests/net/forwarding/bridge_vlan_mcast.sh
index e8031f68200a..07a377652a59 100755
--- a/tools/testing/selftests/net/forwarding/bridge_vlan_mcast.sh
+++ b/tools/testing/selftests/net/forwarding/bridge_vlan_mcast.sh
@@ -162,14 +162,27 @@ vlmc_query_cnt_setup()
 {
 	local type=$1
 	local dev=$2
+	local match=($3)
 
 	if [[ $type == "igmp" ]]; then
-		tc filter add dev $dev egress pref 10 prot 802.1Q \
+		# This matches: IP Protocol 2 (IGMP)
+		tc filter add dev "$dev" egress pref 10 prot 802.1Q \
 			flower vlan_id 10 vlan_ethtype ipv4 dst_ip 224.0.0.1 ip_proto 2 \
+			action goto chain 1
+		# AND Type 0x11 (Query) at offset 0 of IGMP header
+		# 20 bytes IPv4 header + 4 bytes Router Alert option + IGMP[offset 0]
+		tc filter add dev "$dev" egress pref 20 chain 1 prot 802.1Q u32 \
+			match u8 0x11 0xff at 24 "${match[@]}" \
 			action pass
 	else
-		tc filter add dev $dev egress pref 10 prot 802.1Q \
+		# This matches: ICMPv6
+		tc filter add dev "$dev" egress pref 10 prot 802.1Q \
 			flower vlan_id 10 vlan_ethtype ipv6 dst_ip ff02::1 ip_proto icmpv6 \
+			action goto chain 1
+		# AND Type 0x82 (Query) at offset 0 of MLD header
+		# 40 bytes IPv6 header + 8 bytes Hop-by-hop option + MLD[offset 0]
+		tc filter add dev "$dev" egress pref 20 chain 1 prot 802.1Q u32 \
+			match u8 0x82 0xff at 48 "${match[@]}" \
 			action pass
 	fi
 
@@ -181,7 +194,39 @@ vlmc_query_cnt_cleanup()
 	local dev=$1
 
 	ip link set dev br0 type bridge mcast_stats_enabled 0
-	tc filter del dev $dev egress pref 10
+	tc filter del dev "$dev" egress pref 20 chain 1
+	tc filter del dev "$dev" egress pref 10
+}
+
+vlmc_query_get_intvl_match()
+{
+	local type=$1
+	local version=$2
+	local test=$3
+	local enc_val=$4
+
+	if [ "$test" = "qqic" ]; then
+		# QQIC is 8-bit floating point encoding for IGMPv3 and MLDv2
+		if [ "${type}v${version}" = "igmpv3" ]; then
+			# QQIC is at offset 9 of IGMP header
+			# 20 bytes IPv4 header + 4 bytes Router Alert option + IGMP[offset 9]
+			echo "match u8 $enc_val 0xff at 33"
+		elif [ "${type}v${version}" = "mldv2" ]; then
+			# QQIC is at offset 25 of MLD header
+			# 40 bytes IPv6 header + 8 bytes Hop-by-hop option + MLD[offset 25]
+			echo "match u8 $enc_val 0xff at 73"
+		fi
+	elif [ "$test" = "mrc" ]; then
+		if [ "${type}v${version}" = "igmpv3" ]; then
+			# MRC is 8-bit floating point encoding at offset 1 of IGMP header
+			# 20 bytes IPv4 header + 4 bytes Router Alert option + IGMP[offset 1]
+			echo "match u8 $enc_val 0xff at 25"
+		elif [ "${type}v${version}" = "mldv2" ]; then
+			# MRC is 16-bit floating point encoding at offset 4 of MLD header
+			# 40 bytes IPv6 header + 8 bytes Hop-by-hop option + MLD[offset 4]
+			echo "match u16 $enc_val 0xffff at 52"
+		fi
+	fi
 }
 
 vlmc_check_query()
@@ -191,9 +236,13 @@ vlmc_check_query()
 	local dev=$3
 	local expect=$4
 	local time=$5
+	local test=$6
+	local enc_val=$7
+	local intvl_match=""
 	local ret=0
 
-	vlmc_query_cnt_setup $type $dev
+	intvl_match="$(vlmc_query_get_intvl_match "$type" "$version" "$test" "$enc_val")"
+	vlmc_query_cnt_setup "$type" "$dev" "$intvl_match"
 
 	local pre_tx_xstats=$(vlmc_query_cnt_xstats $type $version $dev)
 	bridge vlan global set vid 10 dev br0 mcast_snooping 1 mcast_querier 1
@@ -201,7 +250,7 @@ vlmc_check_query()
 	if [[ $ret -eq 0 ]]; then
 		sleep $time
 
-		local tcstats=$(tc_rule_stats_get $dev 10 egress)
+		local tcstats=$(tc_rule_stats_get "$dev" 20 egress)
 		local post_tx_xstats=$(vlmc_query_cnt_xstats $type $version $dev)
 
 		if [[ $tcstats != $expect || \
@@ -448,8 +497,46 @@ vlmc_query_intvl_test()
 	# 1 is sent immediately, then 2 more in the next 5 seconds
 	vlmc_check_query igmp 2 $swp1 3 5
 	check_err $? "Wrong number of tagged IGMPv2 general queries sent"
-	log_test "Vlan 10 mcast_query_interval option changed to 200"
+	log_test "Number of tagged IGMPv2 general query"
+
+	RET=0
+	bridge vlan global set vid 10 dev br0 mcast_snooping 1 mcast_igmp_version 3
+	check_err $? "Could not set mcast_igmp_version in vlan 10"
+	bridge vlan global set vid 10 dev br0 mcast_snooping 1 mcast_mld_version 2
+	check_err $? "Could not set mcast_mld_version in vlan 10"
+	bridge vlan global set vid 10 dev br0 mcast_snooping 1 mcast_query_interval 6000
+	check_err $? "Could not set mcast_query_interval in vlan 10"
+	# 1 is sent immediately, IGMPv3 QQIC should match with linear value 60 (0x3c)
+	# which is 8-bit encoded value of 60 [units of seconds]
+	vlmc_check_query igmp 3 $swp1 1 1 qqic 0x3c
+	check_err $? "Wrong QQIC in generated IGMPv3 general queries"
+	log_test "IGMPv3 QQIC linear value 60(s)"
+
+	RET=0
+	# 1 is sent immediately, MLDv2 QQIC should match with linear value 60 (0x3c)
+	# which is 8-bit encoded value of 60 [units of seconds]
+	vlmc_check_query mld 2 $swp1 1 1 qqic 0x3c
+	check_err $? "Wrong QQIC in generated MLDv2 general queries"
+	log_test "MLDv2 QQIC linear value 60(s)"
+
+	RET=0
+	bridge vlan global set vid 10 dev br0 mcast_snooping 1 mcast_query_interval 16000
+	check_err $? "Could not set mcast_query_interval in vlan 10"
+	# 1 is sent immediately, IGMPv3 QQIC should match with non linear value 132 (0x84)
+	# which is 8-bit encoded value of 160 [units of seconds]
+	vlmc_check_query igmp 3 $swp1 1 1 qqic 0x84
+	check_err $? "Wrong QQIC in generated IGMPv3 general queries"
+	log_test "IGMPv3 QQIC non linear value 160(s)"
 
+	RET=0
+	# 1 is sent immediately, MLDv2 QQIC should match with non linear value 132 (0x84)
+	# which is 8-bit encoded value of 160 [units of seconds]
+	vlmc_check_query mld 2 $swp1 1 1 qqic 0x84
+	check_err $? "Wrong QQIC in generated MLDv2 general queries"
+	log_test "MLDv2 QQIC non linear value 160(s)"
+
+	bridge vlan global set vid 10 dev br0 mcast_snooping 1 mcast_igmp_version 2
+	bridge vlan global set vid 10 dev br0 mcast_snooping 1 mcast_mld_version 1
 	bridge vlan global set vid 10 dev br0 mcast_snooping 1 mcast_startup_query_count 2
 	bridge vlan global set vid 10 dev br0 mcast_snooping 1 mcast_query_interval 12500
 }
@@ -469,10 +556,47 @@ vlmc_query_response_intvl_test()
 	log_test "Vlan mcast_query_response_interval global option default value"
 
 	RET=0
-	bridge vlan global set vid 10 dev br0 mcast_snooping 1 mcast_query_response_interval 200
+	bridge vlan global set vid 10 dev br0 mcast_snooping 1 mcast_startup_query_count 0
+	bridge vlan global set vid 10 dev br0 mcast_snooping 1 mcast_igmp_version 3
+	check_err $? "Could not set mcast_igmp_version in vlan 10"
+	bridge vlan global set vid 10 dev br0 mcast_snooping 1 mcast_mld_version 2
+	check_err $? "Could not set mcast_mld_version in vlan 10"
+	bridge vlan global set vid 10 dev br0 mcast_snooping 1 mcast_query_response_interval 600
+	check_err $? "Could not set mcast_query_response_interval in vlan 10"
+	# 1 is sent immediately, IGMPv3 MRC should match with linear value 60 (0x3c)
+	# which is 8-bit encoded value of 60 [units of 0.1s = 6 seconds]
+	vlmc_check_query igmp 3 $swp1 1 1 mrc 0x3c
+	check_err $? "Wrong MRC in generated IGMPv3 general queries"
+	log_test "IGMPv3 MRC linear value of 60(x0.1s)"
+
+	RET=0
+	bridge vlan global set vid 10 dev br0 mcast_snooping 1 mcast_query_response_interval 2400
+	check_err $? "Could not set mcast_query_response_interval in vlan 10"
+	# 1 is sent immediately, MLDv2 MRC should match with linear value 0x5dc0 (24000)
+	# which is 16-bit encoded value of 24000 [units of ms / 24 seconds]
+	vlmc_check_query mld 2 $swp1 1 1 mrc 0x5dc0
+	check_err $? "Wrong MRC in generated MLDv2 general queries"
+	log_test "MLDv2 MRC linear value of 24000(ms)"
+
+	RET=0
+	# 1 is sent immediately, IGMPv3 MRC should match with non linear value 142 (0x8e)
+	# which is 8-bit encoded value of 240 [units of 0.1s = 24 seconds]
+	vlmc_check_query igmp 3 $swp1 1 1 mrc 0x8e
+	check_err $? "Wrong MRC in generated IGMPv3 general queries"
+	log_test "IGMPv3 MRC non linear value of 240(x0.1s)"
+
+	RET=0
+	bridge vlan global set vid 10 dev br0 mcast_snooping 1 mcast_query_response_interval 4800
 	check_err $? "Could not set mcast_query_response_interval in vlan 10"
-	log_test "Vlan 10 mcast_query_response_interval option changed to 200"
+	# 1 is sent immediately, MLDv2 MRC should match with non linear value 0x8770 (34672)
+	# which is 16-bit encoded value of 48000 [units of ms / 48 seconds]
+	vlmc_check_query mld 2 $swp1 1 1 mrc 0x8770
+	check_err $? "Wrong MRC in generated MLDv2 general queries"
+	log_test "MLDv2 MRC non linear value of 48000(ms)"
 
+	bridge vlan global set vid 10 dev br0 mcast_snooping 1 mcast_igmp_version 2
+	bridge vlan global set vid 10 dev br0 mcast_snooping 1 mcast_mld_version 1
+	bridge vlan global set vid 10 dev br0 mcast_snooping 1 mcast_startup_query_count 2
 	bridge vlan global set vid 10 dev br0 mcast_snooping 1 mcast_query_response_interval 1000
 }
 
-- 
2.43.0

