Received: from mail-pg1-f178.google.com (mail-pg1-f178.google.com [209.85.215.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9E62B2DCBF8
	for <linux-kselftest@vger.kernel.org>; Thu, 26 Feb 2026 12:54:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.178
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772110446; cv=none; b=U5m/yq8UAcscfRX7KPZmDUfJVI0hMsfLi/R9GzY8UxdgrAV2pCI3/8OV5TBt7w/oi7azGbXSsdFmmEJCASpDfC9KOtZeCWV4uKH8xdGgkiJZOS9ICkxcm/ClneSq1ytSgC5aFn6sFElw6YnO6JRFKRkMW6zdBDGov9MxdtbNlc8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772110446; c=relaxed/simple;
	bh=gjny3v/eTWHbeutrMbxDNE40G5kG1Ylj5usbZJzU9HE=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=r9PpB9nQvuf81gbugH2swxYydmIihgFiam5lHXbHo/I+azYf6itdZhErX3QbM7stBKVG1EfHj5kQB63tD6Z0zp4qp6pOTNtGwPOg/PgClggAHE/sMRvX6tszCSZpSIvdgaQ3DNm04QlCrRFW/tFL24nqbMGDkEjW/1Jpa3WDW8U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=jKBpYqkv; arc=none smtp.client-ip=209.85.215.178
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="jKBpYqkv"
Received: by mail-pg1-f178.google.com with SMTP id 41be03b00d2f7-c6f306faaffso290430a12.0
        for <linux-kselftest@vger.kernel.org>; Thu, 26 Feb 2026 04:54:05 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1772110445; x=1772715245; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=OUrXcfq9vgrgpVWA1902DBETXrF91GneB4Umctz9Jao=;
        b=jKBpYqkvvDZ43qLCn2J9H4npJeUPeMOS9kff2arjTHxORA+TyDvzDTmJKgUR9vSPRM
         4kxaXdZRt3EIzDhYrrkDN8izIYcRg0G+M87P/2NZhLN4HFEXjD4M9irA2L2cUoA35++P
         7qNvnTGAlRIC2rNm+CsDZtNky5I/iYV6trVfRW+MW607IhCbZxifrp5tfhTd7F0v9kS6
         a5V7/hXG9DxaahZ/9s62ioznhaRzRr9dWCSGek4iCBsT4rAmPDeiz1xKg3jXhE3wtQGd
         pRffVY3Gbg7snti1KKLL8R5lHANi74c95kRZJ9+x10+VoYXeL31TrGPmJw/QCRE/An4Q
         IIfQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772110445; x=1772715245;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=OUrXcfq9vgrgpVWA1902DBETXrF91GneB4Umctz9Jao=;
        b=jpDtuWKn6O3zjksamMDQvMJNRWyzRU6CB9rBRf/jePlgMyKc3YyeMUheBgahnREowq
         PvEHUfHcIei8/TPxqfuerwBSrrSUcaoe5YdHxKKlURF6Za8dWN0kMwz7sH5k3cPAuJxG
         yY62UXZOSNGaUaBNyzBqdBDUR/EDMLw7v9Ui6i54NKPWcDbQYva+M57zoe5LAnTettvG
         9RbQfTRfVOY/PFQhExWhFMIGr8nAuLC3s+60ETwO2q9WkufbL8ccainz3bbOMqWtmvMB
         lu6J1h1Z+JiR2jcoBkU/uO/6L2UVzPyLx9QBnq0pwDOYtFOiz/a4gFIqtxXErs4MtPG4
         7+og==
X-Forwarded-Encrypted: i=1; AJvYcCVY4wibJNzkCvIqIiO2N0O5tFQQcGGxTaGMJGzdWQZSihaPBbvwRzovfeASD1j9Kns+W7XHsNEzCQwJn8h9e6o=@vger.kernel.org
X-Gm-Message-State: AOJu0YzhX4/YGPX+WwG5RgNKzxvhUQkZL1gHpPlmoCrDnY+b3YxAZukk
	WqZUZvEB2vvpZywL6+anAsnaIMBz51d22Dp1/unljZAl2coQ91GMvhiE
X-Gm-Gg: ATEYQzy1PTGt2GMt8xrXKFbojC9h0p1oBEtfjvUM1MJgClBHK1IQw8e49CKO80Slf9+
	+UCPfbRIPH/nhCKoMoG3JDwdxJGIVJ2l7epkyfU9IyIRrgBKwxzPqdzB0djFv1pvcVbkkm3TThL
	34AKj5U+VM72Y4jThpJ5NDMueFyqt9CQrkOMs2CTbTg6cTpEP1tpnAsffA2eiMucsqm+PRXPBnU
	6r64Fbrzfs8sdQTHPCdKo3Ss4RR0H1kM08ZaD7KiwM8OwZcAaX0UmvLQdISjLdbPrh5hgCNb9Q/
	loC7UEl/F6yMAs9T7ZCY/HQlzwjLAJ3SkZtVyl9V+OFzSwYos48LVLcur8H1DFS7YJQy5xQ0CFO
	oH0m0n9EFCVAJi1H4jkohx4MMiwGzNqRWvW3TKdBNgEbGyQ5uW2YxBzopbTJ2+25L/+YWasWVA+
	ALj0dAZ1gP5gY3Vy1jRztUqQLiDs8=
X-Received: by 2002:a17:903:19eb:b0:2ad:99bb:3129 with SMTP id d9443c01a7336-2ade9a9fa34mr42879505ad.50.1772110444926;
        Thu, 26 Feb 2026 04:54:04 -0800 (PST)
Received: from fedora ([209.132.188.88])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2adfb705b53sm25276715ad.92.2026.02.26.04.53.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 26 Feb 2026 04:54:04 -0800 (PST)
From: Hangbin Liu <liuhangbin@gmail.com>
To: netdev@vger.kernel.org
Cc: Jay Vosburgh <jv@jvosburgh.net>,
	Andrew Lunn <andrew+netdev@lunn.ch>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>,
	Paolo Abeni <pabeni@redhat.com>,
	Shuah Khan <shuah@kernel.org>,
	Nikolay Aleksandrov <razor@blackwall.org>,
	Mahesh Bandewar <maheshb@google.com>,
	linux-kernel@vger.kernel.org,
	linux-kselftest@vger.kernel.org,
	Hangbin Liu <liuhangbin@gmail.com>
Subject: [PATCHv3 net 3/3] selftests: bonding: add mux and churn state testing
Date: Thu, 26 Feb 2026 12:53:30 +0000
Message-ID: <20260226125331.28147-4-liuhangbin@gmail.com>
X-Mailer: git-send-email 2.50.1
In-Reply-To: <20260226125331.28147-1-liuhangbin@gmail.com>
References: <20260226125331.28147-1-liuhangbin@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Rename the current LACP priority test to LACP ad_select testing, and
extend it to include validation of the actor state machine and churn
state logic. The updated tests verify that both the mux state machine and
the churn state machine behave correctly under aggregator selection and
failover scenarios.

Signed-off-by: Hangbin Liu <liuhangbin@gmail.com>
---
 .../selftests/drivers/net/bonding/Makefile    |  2 +-
 ...nd_lacp_prio.sh => bond_lacp_ad_select.sh} | 73 +++++++++++++++++++
 2 files changed, 74 insertions(+), 1 deletion(-)
 rename tools/testing/selftests/drivers/net/bonding/{bond_lacp_prio.sh => bond_lacp_ad_select.sh} (64%)

diff --git a/tools/testing/selftests/drivers/net/bonding/Makefile b/tools/testing/selftests/drivers/net/bonding/Makefile
index 6c5c60adb5e8..e7bddfbf0f7a 100644
--- a/tools/testing/selftests/drivers/net/bonding/Makefile
+++ b/tools/testing/selftests/drivers/net/bonding/Makefile
@@ -7,7 +7,7 @@ TEST_PROGS := \
 	bond-eth-type-change.sh \
 	bond-lladdr-target.sh \
 	bond_ipsec_offload.sh \
-	bond_lacp_prio.sh \
+	bond_lacp_ad_select.sh \
 	bond_macvlan_ipvlan.sh \
 	bond_options.sh \
 	bond_passive_lacp.sh \
diff --git a/tools/testing/selftests/drivers/net/bonding/bond_lacp_prio.sh b/tools/testing/selftests/drivers/net/bonding/bond_lacp_ad_select.sh
similarity index 64%
rename from tools/testing/selftests/drivers/net/bonding/bond_lacp_prio.sh
rename to tools/testing/selftests/drivers/net/bonding/bond_lacp_ad_select.sh
index a483d505c6a8..9f0b3de4f55c 100755
--- a/tools/testing/selftests/drivers/net/bonding/bond_lacp_prio.sh
+++ b/tools/testing/selftests/drivers/net/bonding/bond_lacp_ad_select.sh
@@ -89,6 +89,65 @@ test_agg_reselect()
 		RET=1
 }
 
+is_distributing()
+{
+	ip -j -n "$c_ns" -d link show "$1" \
+		| jq -e '.[].linkinfo.info_slave_data.ad_actor_oper_port_state_str | index("distributing")' > /dev/null
+}
+
+get_churn_state()
+{
+	local slave=$1
+	# shellcheck disable=SC2016
+	ip netns exec "$c_ns" awk -v s="$slave" '
+	$0 ~ "Slave Interface: " s {found=1}
+	found && /Actor Churn State:/ { print $4; exit }
+	' /proc/net/bonding/bond0
+}
+
+check_slave_state()
+{
+	local state=$1
+	local slave_0=$2
+	local slave_1=$3
+	local churn_state
+	RET=0
+
+	s0_agg_id=$(cmd_jq "ip -n ${c_ns} -d -j link show $slave_0" \
+		".[].linkinfo.info_slave_data.ad_aggregator_id")
+	s1_agg_id=$(cmd_jq "ip -n ${c_ns} -d -j link show $slave_1" \
+		".[].linkinfo.info_slave_data.ad_aggregator_id")
+	if [ "${s0_agg_id}" -ne "${s1_agg_id}" ]; then
+		log_info "$state: $slave_0 $slave_1 agg ids are different"
+		RET=1
+	fi
+
+	for s in "$slave_0" "$slave_1"; do
+		churn_state=$(get_churn_state "$s")
+		if [ "$state" = "active" ]; then
+			if ! is_distributing "$s"; then
+				log_info "$state: $s is not in distributing state"
+				RET=1
+			fi
+			if [ "$churn_state" != "none" ]; then
+				log_info "$state: $s churn state $churn_state"
+				RET=1
+			fi
+		else
+			# Backup state, should be in churned and not distributing
+			if is_distributing "$s"; then
+				log_info "$state: $s is in distributing state"
+				RET=1
+			fi
+			if [ "$churn_state" != "churned" ]; then
+				log_info "$state: $s churn state $churn_state"
+				# shellcheck disable=SC2034
+				RET=1
+			fi
+		fi
+	done
+}
+
 trap cleanup_all_ns EXIT
 setup_ns c_ns s_ns b_ns
 setup_links
@@ -98,11 +157,25 @@ log_test "bond 802.3ad" "actor_port_prio setting"
 
 test_agg_reselect eth0
 log_test "bond 802.3ad" "actor_port_prio select"
+# sleep for a while to make sure the mux state machine has completed.
+sleep 10
+check_slave_state active eth0 eth1
+log_test "bond 802.3ad" "active state/churn checking"
+# wait for churn timer expired, need a bit longer as we restart eth1
+sleep 55
+check_slave_state backup eth2 eth3
+log_test "bond 802.3ad" "backup state/churn checking"
 
 # Change the actor port prio and re-test
 ip -n "${c_ns}" link set eth0 type bond_slave actor_port_prio 10
 ip -n "${c_ns}" link set eth2 type bond_slave actor_port_prio 1000
 test_agg_reselect eth2
 log_test "bond 802.3ad" "actor_port_prio switch"
+sleep 10
+check_slave_state active eth2 eth3
+log_test "bond 802.3ad" "active state/churn checking"
+sleep 55
+check_slave_state backup eth0 eth1
+log_test "bond 802.3ad" "backup state/churn checking"
 
 exit "${EXIT_STATUS}"
-- 
2.50.1

