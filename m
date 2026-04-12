Received: from mail-pg1-f175.google.com (mail-pg1-f175.google.com [209.85.215.175])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A559B375ABD
	for <linux-kselftest@vger.kernel.org>; Sun, 12 Apr 2026 11:11:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.175
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775992297; cv=none; b=tI8K3QBP81tSGaGLV9UnD80UeGeaolFBYpSV53JVs55VIib1uEF0RRoGzvsXL8dCprGkjDZyulYqtUTwqMk57YaZnzin+MiBXFW1EMA9o3C2HdGgAuKR4uXMw5sE+bLMaG20+C7iA6DnEL4G0T7fezR3bThuCQIFvrRQNmlsu7c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775992297; c=relaxed/simple;
	bh=Komn/jtzHBJBVBAbBcG1/JcOKIK4WPmcOOz8EffA+vs=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=lqXMRpab2As++UQdU9baHXM1bSTdo0VyiGjmxOTa5JAMkTmArQz12aB5BAv8KU0MPooYIEHYdpYEWhvPlArbon/7Cu5r9VqEoqbsDNczqGxL0N5b1FhrNSk5y5v/pf2hwVsO9nusD8cVcymtO6fIm6sGGLCqUGZfIcDrwB0PQ+I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=TAEocMP/; arc=none smtp.client-ip=209.85.215.175
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="TAEocMP/"
Received: by mail-pg1-f175.google.com with SMTP id 41be03b00d2f7-c76e702e01aso1149435a12.3
        for <linux-kselftest@vger.kernel.org>; Sun, 12 Apr 2026 04:11:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1775992295; x=1776597095; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=jVGxqOACJLFxmxnpIjWVVcYX7bPeWpPr5Ieb+rKdDo4=;
        b=TAEocMP/TMAbOHKlmoXbvyqbBlK4/n/xdaiUVfApKz4ZrrhGQTw2OG2N+i/cDRKlfh
         aERSjb6cEfOrD0P4VlQvuUzQgtb/uCgfD/HgjQZu+2tis1UQTKioofaWwN3E3uypKtgL
         JK8Udjav8lcxjRe1AOHpTz3xA+hgzzetK3kOgrfvcPkHLbjUMmYY6dVEXHDKv+/9Z/7d
         YA/GSwCMvB+7C0S7jtmrOnS6aYw1ZHT/hYQ3PKJeqB9j8taMZtbBXZv5xUvbafuMWqV/
         FfIWXJG3nJifZqjEtBCthp0PLj9vlYnl5JYd8gJtJ/EOhhKOPvbQzJ21oeE/ivmbWmA6
         rdWw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775992295; x=1776597095;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=jVGxqOACJLFxmxnpIjWVVcYX7bPeWpPr5Ieb+rKdDo4=;
        b=ehPf7J3NEUmp6zkuhQRWjsEZ8KZI/4IFRDUvcF8yROt3DEX5NlEmTyepvItEaGWR8I
         py4lvJuFh2VJCYomQTeBJa/JrH3qOy9zTh8kyoZZ8QAiLvdEsROxjCEB2D9d77PhPG58
         sPq6Rk4OK2ABgx6es1ZU2KplHB/nKRTYQcysnPiJl0nxblShtVweqxPN2QPnrnEl7Smd
         uM7k4TPpJ0FBqOmnoOyqB2yImKozEWKEQC5yFnQoCEZSdNWXRaJH3Pt2bW+Cx6xld8Mv
         NhmGXR7/cM9QB403qBEZk3wDQWKDrD00xvkupVOUXQVlrAXWwMJN/zuB1mSIt7rNpTJ2
         Z/yg==
X-Forwarded-Encrypted: i=1; AJvYcCUXQiBEXAQ87sbxAEYP7UI7zGpO7Fi71iDGm9TH75cXJj0Z0jj5n6JenIDmBhywCXdhbGGpSFgSGuqXv/lf+Ng=@vger.kernel.org
X-Gm-Message-State: AOJu0YzgnLDPe8yFUMoNeNkS4womGPLVwpiWCoNC6eJce+w+YTndTYxk
	yogu6m0cuViPdgee20gO3giWiFIf0UZ6IMQ8+bu9FBM1bxsHkuFQnaRn
X-Gm-Gg: AeBDiet5D3bUpTkxrt3Q3Pi12O3ukVNLYubaE3yr15FUI711FSCK6RGF6IkqH+xKMEi
	vinstANfEPcOVtiF5FCwmuMoMnAwhqwhcYLYP9O/DlCns9W6iBw4ICDWGot/kzMvuo1C1CCmvM7
	5Id3lLTMtBSfjgr25hwaMe8uSl5Qst6ilfLvv4pjvbIqKz889X51fnOn+ZADc22kaAVAWmVpKGD
	LnCCSVSJVJMj3/1oBANxgEBN2ZozzDmDJT3tuOAYH2fde6dBM1DgT5djs4A0avFcaLKBBKKAKTz
	CphT9oeWs0bNRXIEOraFzGhXz8SRFslLC0xb7jN38ofin46bUFqGai7OxCtm0xV8uav43S+TIWT
	M405JCsxIHegVCQ13d2igTyEnH9vMZk/dtVBeUj1KX7LPRAIKjRmIq7rr0CdxbtVwdUawFDx6Bg
	JCwG2rAy6J2VgehNVSEad1fwCAxEjlFpgajW3lhb85
X-Received: by 2002:a05:6a21:3284:b0:39f:94cb:1bc with SMTP id adf61e73a8af0-39fe3c64c48mr10313543637.1.1775992295009;
        Sun, 12 Apr 2026 04:11:35 -0700 (PDT)
Received: from DESKTOP-82PPU4A.localdomain ([202.8.116.169])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-c7934c9ef38sm2522981a12.12.2026.04.12.04.11.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 12 Apr 2026 04:11:34 -0700 (PDT)
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
Subject: [PATCH net-next v4 5/5] selftests: net: bridge: add MRC and QQIC field encoding tests
Date: Sun, 12 Apr 2026 11:10:47 +0000
Message-ID: <20260412111047.1326-6-royujjal@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260412111047.1326-1-royujjal@gmail.com>
References: <20260412111047.1326-1-royujjal@gmail.com>
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
INFO: Vlan 10 mcast_query_interval (QQIC) test cases:
TEST: Number of tagged IGMPv2 general query                         [ OK ]
TEST: IGMPv3 QQIC linear value 60                                   [ OK ]
TEST: MLDv2 QQIC linear value 60                                    [ OK ]
TEST: IGMPv3 QQIC non linear value 160                              [ OK ]
TEST: MLDv2 QQIC non linear value 160                               [ OK ]
TEST: Vlan mcast_query_response_interval global option default value   [ OK ]
INFO: Vlan 10 mcast_query_response_interval (MRC) test cases:
TEST: IGMPv3 MRC linear value 60                                    [ OK ]
TEST: IGMPv3 MRC non linear value 160                               [ OK ]
TEST: MLDv2 MRC linear value 30000                                  [ OK ]
TEST: MLDv2 MRC non linear value 60000                              [ OK ]

Signed-off-by: Ujjal Roy <royujjal@gmail.com>
---
 .../net/forwarding/bridge_vlan_mcast.sh       | 150 +++++++++++++++++-
 1 file changed, 142 insertions(+), 8 deletions(-)

diff --git a/tools/testing/selftests/net/forwarding/bridge_vlan_mcast.sh b/tools/testing/selftests/net/forwarding/bridge_vlan_mcast.sh
index e8031f68200a..9f9f33d58286 100755
--- a/tools/testing/selftests/net/forwarding/bridge_vlan_mcast.sh
+++ b/tools/testing/selftests/net/forwarding/bridge_vlan_mcast.sh
@@ -162,14 +162,27 @@ vlmc_query_cnt_setup()
 {
 	local type=$1
 	local dev=$2
+	local match=$3
 
 	if [[ $type == "igmp" ]]; then
-		tc filter add dev $dev egress pref 10 prot 802.1Q \
+		# This matches: IP Protocol 2 (IGMP)
+		tc filter add dev "$dev" egress pref 10 prot 802.1Q \
 			flower vlan_id 10 vlan_ethtype ipv4 dst_ip 224.0.0.1 ip_proto 2 \
+			action continue
+		# AND Type 0x11 (Query) at offset 24 after IP
+		# IP (20 byte IP + 4 bytes Option)
+		match=(match u8 0x11 0xff at 24 $match)
+		tc filter add dev "$dev" egress pref 20 prot 802.1Q u32 "${match[@]}" \
 			action pass
 	else
-		tc filter add dev $dev egress pref 10 prot 802.1Q \
+		# This matches: ICMPv6
+		tc filter add dev "$dev" egress pref 10 prot 802.1Q \
 			flower vlan_id 10 vlan_ethtype ipv6 dst_ip ff02::1 ip_proto icmpv6 \
+			action continue
+		# AND Type 0x82 (Query) at offset 48 after IPv6
+		# IPv6 (40 bytes IPv6 + 2 bytes next HDR + 4 bytes Option + 2 byte pad)
+		match=(match u8 0x82 0xff at 48 $match)
+		tc filter add dev "$dev" egress pref 20 prot 802.1Q u32 "${match[@]}" \
 			action pass
 	fi
 
@@ -181,7 +194,53 @@ vlmc_query_cnt_cleanup()
 	local dev=$1
 
 	ip link set dev br0 type bridge mcast_stats_enabled 0
-	tc filter del dev $dev egress pref 10
+	tc filter del dev "$dev" egress pref 20
+	tc filter del dev "$dev" egress pref 10
+}
+
+vlmc_query_get_intvl_match()
+{
+	local type=$1
+	local version=$2
+	local test=$3
+	local interval=$4
+
+	if [ "$test" = "qqic" ]; then
+		# QQIC is 8-bit floating point encoding for IGMPv3 and MLDv2
+		if [ "${type}v${version}" = "igmpv3" ]; then
+			# IP 20 bytes + 4 bytes Option + IGMPv3[9]
+			if [[ $interval -lt 128 ]]; then
+				echo "match u8 0x3c 0xff at 33"
+			else
+				echo "match u8 0x84 0xff at 33"
+			fi
+		elif [ "${type}v${version}" = "mldv2" ]; then
+			# IPv6 40 + 2 next HDR + 4 Option + 2 pad + MLDv2[25]
+			if [[ $interval -lt 128 ]]; then
+				echo "match u8 0x3c 0xff at 73"
+			else
+				echo "match u8 0x84 0xff at 73"
+			fi
+		fi
+	elif [ "$test" = "mrc" ]; then
+		if [ "${type}v${version}" = "igmpv3" ]; then
+			# MRC is 8-bit floating point encoding for IGMPv3
+			# IP 20 bytes + 4 bytes Option + IGMPv3[1]
+			if [[ $interval -lt 128 ]]; then
+				echo "match u8 0x3c 0xff at 25"
+			else
+				echo "match u8 0x84 0xff at 25"
+			fi
+		elif [ "${type}v${version}" = "mldv2" ]; then
+			# MRC is 16-bit floating point encoding for MLDv2
+			# IPv6 40 + 2 next HDR + 4 Option + 2 pad + MLDv2[4]
+			if [[ $interval -lt 32768 ]]; then
+				echo "match u16 0x7530 0xffff at 52"
+			else
+				echo "match u16 0x8d4c 0xffff at 52"
+			fi
+		fi
+	fi
 }
 
 vlmc_check_query()
@@ -191,9 +250,13 @@ vlmc_check_query()
 	local dev=$3
 	local expect=$4
 	local time=$5
+	local test=$6
+	local interval=$7
+	local intvl_match=""
 	local ret=0
 
-	vlmc_query_cnt_setup $type $dev
+	intvl_match="$(vlmc_query_get_intvl_match "$type" "$version" "$test" "$interval")"
+	vlmc_query_cnt_setup "$type" "$dev" "$intvl_match"
 
 	local pre_tx_xstats=$(vlmc_query_cnt_xstats $type $version $dev)
 	bridge vlan global set vid 10 dev br0 mcast_snooping 1 mcast_querier 1
@@ -201,7 +264,7 @@ vlmc_check_query()
 	if [[ $ret -eq 0 ]]; then
 		sleep $time
 
-		local tcstats=$(tc_rule_stats_get $dev 10 egress)
+		local tcstats=$(tc_rule_stats_get "$dev" 20 egress)
 		local post_tx_xstats=$(vlmc_query_cnt_xstats $type $version $dev)
 
 		if [[ $tcstats != $expect || \
@@ -441,6 +504,7 @@ vlmc_query_intvl_test()
 	check_err $? "Wrong default mcast_query_interval global vlan option value"
 	log_test "Vlan mcast_query_interval global option default value"
 
+	log_info "Vlan 10 mcast_query_interval (QQIC) test cases:"
 	RET=0
 	bridge vlan global set vid 10 dev br0 mcast_snooping 1 mcast_startup_query_count 0
 	bridge vlan global set vid 10 dev br0 mcast_snooping 1 mcast_query_interval 200
@@ -448,8 +512,42 @@ vlmc_query_intvl_test()
 	# 1 is sent immediately, then 2 more in the next 5 seconds
 	vlmc_check_query igmp 2 $swp1 3 5
 	check_err $? "Wrong number of tagged IGMPv2 general queries sent"
-	log_test "Vlan 10 mcast_query_interval option changed to 200"
+	log_test "Number of tagged IGMPv2 general query"
 
+	RET=0
+	bridge vlan global set vid 10 dev br0 mcast_snooping 1 mcast_igmp_version 3
+	check_err $? "Could not set mcast_igmp_version in vlan 10"
+	bridge vlan global set vid 10 dev br0 mcast_snooping 1 mcast_mld_version 2
+	check_err $? "Could not set mcast_mld_version in vlan 10"
+	bridge vlan global set vid 10 dev br0 mcast_snooping 1 mcast_query_interval 6000
+	check_err $? "Could not set mcast_query_interval in vlan 10"
+	# 1 is sent immediately, IGMPv3 QQIC should match with linear value 60s
+	vlmc_check_query igmp 3 $swp1 1 1 qqic 60
+	check_err $? "Wrong QQIC in generated IGMPv3 general queries"
+	log_test "IGMPv3 QQIC linear value 60"
+
+	RET=0
+	# 1 is sent immediately, MLDv2 QQIC should match with linear value 60s
+	vlmc_check_query mld 2 $swp1 1 1 qqic 60
+	check_err $? "Wrong QQIC in generated MLDv2 general queries"
+	log_test "MLDv2 QQIC linear value 60"
+
+	RET=0
+	bridge vlan global set vid 10 dev br0 mcast_snooping 1 mcast_query_interval 16000
+	check_err $? "Could not set mcast_query_interval in vlan 10"
+	# 1 is sent immediately, IGMPv3 QQIC should match with non linear value 160s
+	vlmc_check_query igmp 3 $swp1 1 1 qqic 160
+	check_err $? "Wrong QQIC in generated IGMPv3 general queries"
+	log_test "IGMPv3 QQIC non linear value 160"
+
+	RET=0
+	# 1 is sent immediately, MLDv2 QQIC should match with non linear value 160s
+	vlmc_check_query mld 2 $swp1 1 1 qqic 160
+	check_err $? "Wrong QQIC in generated MLDv2 general queries"
+	log_test "MLDv2 QQIC non linear value 160"
+
+	bridge vlan global set vid 10 dev br0 mcast_snooping 1 mcast_igmp_version 2
+	bridge vlan global set vid 10 dev br0 mcast_snooping 1 mcast_mld_version 1
 	bridge vlan global set vid 10 dev br0 mcast_snooping 1 mcast_startup_query_count 2
 	bridge vlan global set vid 10 dev br0 mcast_snooping 1 mcast_query_interval 12500
 }
@@ -468,11 +566,47 @@ vlmc_query_response_intvl_test()
 	check_err $? "Wrong default mcast_query_response_interval global vlan option value"
 	log_test "Vlan mcast_query_response_interval global option default value"
 
+	log_info "Vlan 10 mcast_query_response_interval (MRC) test cases:"
+	RET=0
+	bridge vlan global set vid 10 dev br0 mcast_snooping 1 mcast_startup_query_count 0
+	bridge vlan global set vid 10 dev br0 mcast_snooping 1 mcast_igmp_version 3
+	check_err $? "Could not set mcast_igmp_version in vlan 10"
+	bridge vlan global set vid 10 dev br0 mcast_snooping 1 mcast_query_response_interval 600
+	check_err $? "Could not set mcast_query_response_interval in vlan 10"
+	# 1 is sent immediately, IGMPv3 MRC should match with linear value 60 units of 1/10s
+	vlmc_check_query igmp 3 $swp1 1 1 mrc 60
+	check_err $? "Wrong MRC in generated IGMPv3 general queries"
+	log_test "IGMPv3 MRC linear value 60"
+
+	RET=0
+	bridge vlan global set vid 10 dev br0 mcast_snooping 1 mcast_query_response_interval 1600
+	check_err $? "Could not set mcast_query_response_interval in vlan 10"
+	# 1 is sent immediately, IGMPv3 MRC should match with non linear value 160 unit of 1/10s
+	vlmc_check_query igmp 3 $swp1 1 1 mrc 160
+	check_err $? "Wrong MRC in generated IGMPv3 general queries"
+	log_test "IGMPv3 MRC non linear value 160"
+
+	RET=0
+	bridge vlan global set vid 10 dev br0 mcast_snooping 1 mcast_mld_version 2
+	check_err $? "Could not set mcast_mld_version in vlan 10"
+	bridge vlan global set vid 10 dev br0 mcast_snooping 1 mcast_query_response_interval 3000
+	check_err $? "Could not set mcast_query_response_interval in vlan 10"
+	# 1 is sent immediately, MLDv2 MRC should match with linear value 30000(ms)
+	vlmc_check_query mld 2 $swp1 1 1 mrc 30000
+	check_err $? "Wrong MRC in generated MLDv2 general queries"
+	log_test "MLDv2 MRC linear value 30000"
+
 	RET=0
-	bridge vlan global set vid 10 dev br0 mcast_snooping 1 mcast_query_response_interval 200
+	bridge vlan global set vid 10 dev br0 mcast_snooping 1 mcast_query_response_interval 6000
 	check_err $? "Could not set mcast_query_response_interval in vlan 10"
-	log_test "Vlan 10 mcast_query_response_interval option changed to 200"
+	# 1 is sent immediately, MLDv2 MRC should match with non linear value 60000(ms)
+	vlmc_check_query mld 2 $swp1 1 1 mrc 60000
+	check_err $? "Wrong MRC in generated MLDv2 general queries"
+	log_test "MLDv2 MRC non linear value 60000"
 
+	bridge vlan global set vid 10 dev br0 mcast_snooping 1 mcast_igmp_version 2
+	bridge vlan global set vid 10 dev br0 mcast_snooping 1 mcast_mld_version 1
+	bridge vlan global set vid 10 dev br0 mcast_snooping 1 mcast_startup_query_count 2
 	bridge vlan global set vid 10 dev br0 mcast_snooping 1 mcast_query_response_interval 1000
 }
 
-- 
2.43.0

