Received: from mail-dy1-f179.google.com (mail-dy1-f179.google.com [74.125.82.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A881B480DE1
	for <linux-kselftest@vger.kernel.org>; Wed,  3 Jun 2026 13:06:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.82.179
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780491998; cv=none; b=P4AxsPxiQFunCRcrdVBt4MsAHTp/zOraWfa6o17rJT+7v0pGOJNo4MVY2bvymkvbIOCobeniXTG+mlKG5dNxIuqFKjQRIyc/NG3HQWjr5cFeQWYqZzfKo0gYDQQqgBNvRbkk5Wa/Sk05TWm7fNXbmmJ3zig9L2PHNAae95RDBfI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780491998; c=relaxed/simple;
	bh=ZApW2cI7YETmeg8qoxa0V/CbOF/XgrMKyvubFMRJs4U=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=ZdC5AdFx63ParcurIesD/tNOFbXMtvKj2gsCKt3nJJg1htx3FIR8RkXkKzNURmDjNoLI74e/hMMgSQiM/KzbE5RLpLxj7ngfgrTpxfMEIiz/0AVzQqPX8Cb4e0m0mcJqO4IIQID2x1MKqwk6szY//RMLAaa1zNulyVKAbNVvE9w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=TcEJtQ/c; arc=none smtp.client-ip=74.125.82.179
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="TcEJtQ/c"
Received: by mail-dy1-f179.google.com with SMTP id 5a478bee46e88-30759632453so443805eec.1
        for <linux-kselftest@vger.kernel.org>; Wed, 03 Jun 2026 06:06:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1780491997; x=1781096797; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=4bwS8I9hjyPMoQIUtgoT/XA9wHOeUpofaMWQ6wzUEIo=;
        b=TcEJtQ/cu5UMnqZIzWe5NVXZGpV7l1F5GyDaFBg6PjesJZKwSLYSZfZjnjWxbhjbKp
         iio3aOdXZtnl2KJTKDzeD2YWsHvsu4s5GwQ0YNnGB/P76HZmtvjvR8Yuvjuvfsh+3O0f
         eDs1UxX0Sao5h9SLil24c3LdhKPveFmAKmMar3WT2nd4pwMyNOY8JX85BohkaOPpjpGC
         UAAZrt3MMDJjuYtN+ZLjyDUqKeUPFI0zpGNZlUHdyEJCaZXCtuBf/iT+/qzLOGVvawBs
         IKpyLBV0XdqrS/qRbbZTW8D54K89o4r3jPq9SApNJwtcbHfh6KJ+ORkVYud+6JG4sRVP
         ZCgQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780491997; x=1781096797;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=4bwS8I9hjyPMoQIUtgoT/XA9wHOeUpofaMWQ6wzUEIo=;
        b=Xuvdc7uirGjvNIW8PfBjEc5ldpAj/5d24ONN3cEFU1PdnJvb2hba45gVIlOA06gJVH
         ct4n26w5lBVj/NFCBuFvSbSd8Ne7FHZA232SD2nqJuCBNcbph0uK0rSk5DPHGrEnYzpN
         qhhlcT2XajzL2oAap0QApYNvhFZutjYeLDO6/+Myiy1xcub6v8nK7fTMbLb1yb1pn7Oo
         1oXkCaRjVimm84qK3Uue/r+Xu5wlVO6iW/CUbVyqRmVauins77nsOw4lF/rwzrM1uzY2
         IDpJBFfYOWIIs7/8fWZJdzn/a+ULItp/E5ErKaEv30S2xbpm8iYy1N0NhXIsKWtDAWLX
         sZLw==
X-Forwarded-Encrypted: i=1; AFNElJ+UhxR8UPujfwOAeG/W9qjXWTlpTmUAn+DosV/LZwXzCp0RkXy/jEHYmeEv21OX+EEWwfSyDOg7SapPykAkAVY=@vger.kernel.org
X-Gm-Message-State: AOJu0Yy+xK+TpdDvDoH5GXpJ/5S7VLDRWDpBDluBxSbBnIeQ8aCPFcuz
	FQ/T2AtJxHuN1gL+4QiIvLiltP0OcV0J9k58+MRFGJhbV9z5q8Hqd6Q3
X-Gm-Gg: Acq92OHTEn2+dFj9LtfYN3ap9xg1lPXgiAaCpmfPxEcupRZl96ChjJNJYwYvgIFYyuh
	8s2Q/khmSIaBSybemHOZF37X/x9Qd9+7MUhkeCkqW60WjLrMenfN3nhJVXSJ4CwXSZ7fpgnf5yM
	AuJYgfjEIX3oun4f3YQC3hlYG/ZUT2tW5kQqzKo5IWsQpvBJ7qsllBPWehYIPxGXZ80ySazJtdR
	MQ/8MOCoR2J9TjIZEUnW4NyFhReSHwVacAyH4a8WnQcyEsajgbZKqHZh4w/EceSa/fxxBJgz3Y6
	F0YFM3DAPQh1PDA0fGxoWildRL07rL64pulCEYw9kgzRpEB8Z3f56LK+g4FdEV5rKNUS+b/SwuU
	4ZFwS5uDVssMhamql9SZSNjBLZQ2aU26ia6WBIyNoaNQQSWuQ1ZzIQx05B61IVLfm9JYsLYMHGp
	LoexykDcK7+XERtZP04Qn3WMGZ
X-Received: by 2002:a05:7300:5726:b0:304:5644:f97a with SMTP id 5a478bee46e88-3074fb7a698mr1767605eec.21.1780491996625;
        Wed, 03 Jun 2026 06:06:36 -0700 (PDT)
Received: from houminxi ([38.34.12.160])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-3074df75ff6sm2397111eec.26.2026.06.03.06.06.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 03 Jun 2026 06:06:36 -0700 (PDT)
From: Minxi Hou <houminxi@gmail.com>
To: netdev@vger.kernel.org
Cc: aconole@redhat.com,
	davem@davemloft.net,
	echaudro@redhat.com,
	edumazet@google.com,
	horms@kernel.org,
	i.maximets@ovn.org,
	kuba@kernel.org,
	pabeni@redhat.com,
	shuah@kernel.org,
	dev@openvswitch.org,
	linux-kselftest@vger.kernel.org,
	Minxi Hou <houminxi@gmail.com>
Subject: [PATCH v3] selftests/net/openvswitch: guard command substitutions against empty output
Date: Wed,  3 Jun 2026 21:06:19 +0800
Message-ID: <20260603130619.1785322-1-houminxi@gmail.com>
X-Mailer: git-send-email 2.54.0
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

When ip-link output is unavailable, when the upcall daemon log has not
been written yet, or when pahole does not know the OVS drop subsystem
ID, the affected command substitutions silently produce empty strings.
The caller then passes empty sha= or pid= arguments to ovs_add_flow,
or matches against wrong drop reason codes, all without a diagnostic.

Add [ -z ] guards immediately after each assignment. For test_arp_ping,
also align the MAC extraction to use awk '/link\/ether/' as in
test_pop_vlan. The drop_reason guard returns ksft_skip because an
absent subsystem ID is an environment issue, not a test failure.

Signed-off-by: Minxi Hou <houminxi@gmail.com>
---

Changes since v2:
  - Fixed missing 'net/' in subject (selftests/net/openvswitch).
  - Removed --base flag (prerequisite-patch-id flood in v2).

Changes since v1:
  - Rebased onto current net-next/main. No code changes.

 .../selftests/net/openvswitch/openvswitch.sh     | 16 ++++++++++++++--
 1 file changed, 14 insertions(+), 2 deletions(-)

diff --git a/tools/testing/selftests/net/openvswitch/openvswitch.sh b/tools/testing/selftests/net/openvswitch/openvswitch.sh
index a415e9dec8cd..82f066a0ceed 100755
--- a/tools/testing/selftests/net/openvswitch/openvswitch.sh
+++ b/tools/testing/selftests/net/openvswitch/openvswitch.sh
@@ -360,6 +360,8 @@ test_psample() {
 	# sFlow / IPFIX.
 	nlpid=$(grep -E "listening on upcall packet handler" \
             $ovs_dir/s0.out | cut -d ":" -f 2 | tr -d ' ')
+	[ -z "$nlpid" ] && \
+		{ info "failed to get upcall PID"; return 1; }
 
 	ovs_add_flow "test_psample" psample \
             "in_port(2),eth(),eth_type(0x0800),ipv4()" \
@@ -393,6 +395,10 @@ test_drop_reason() {
 	ovs_drop_subsys=$(pahole -C skb_drop_reason_subsys |
 			      awk '/OPENVSWITCH/ { print $3; }' |
 			      tr -d ,)
+	if [ -z "$ovs_drop_subsys" ]; then
+		info "failed to get OVS drop subsys ID"
+		return $ksft_skip
+	fi
 
 	sbx_add "test_drop_reason" || return $?
 
@@ -491,13 +497,19 @@ test_arp_ping () {
 	# Setup client namespace
 	ip netns exec client ip addr add 172.31.110.10/24 dev c1
 	ip netns exec client ip link set c1 up
-	HW_CLIENT=`ip netns exec client ip link show dev c1 | grep -E 'link/ether [0-9a-f:]+' | awk '{print $2;}'`
+	HW_CLIENT=$(ip netns exec client ip link show dev c1 \
+		| awk '/link\/ether/ {print $2}')
+	[ -z "$HW_CLIENT" ] && \
+		{ info "failed to get client hwaddr"; return 1; }
 	info "Client hwaddr: $HW_CLIENT"
 
 	# Setup server namespace
 	ip netns exec server ip addr add 172.31.110.20/24 dev s1
 	ip netns exec server ip link set s1 up
-	HW_SERVER=`ip netns exec server ip link show dev s1 | grep -E 'link/ether [0-9a-f:]+' | awk '{print $2;}'`
+	HW_SERVER=$(ip netns exec server ip link show dev s1 \
+		| awk '/link\/ether/ {print $2}')
+	[ -z "$HW_SERVER" ] && \
+		{ info "failed to get server hwaddr"; return 1; }
 	info "Server hwaddr: $HW_SERVER"
 
 	ovs_add_flow "test_arp_ping" arpping \
-- 
2.54.0

