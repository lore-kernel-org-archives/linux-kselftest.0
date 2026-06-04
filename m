Received: from mail-dl1-f41.google.com (mail-dl1-f41.google.com [74.125.82.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 39D6F2D7817
	for <linux-kselftest@vger.kernel.org>; Thu,  4 Jun 2026 16:30:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.82.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780590635; cv=none; b=tINQwNpoS0uzORc2ACzx2GORqEPKaDk+DdGSc4oB9lpyGbEvmifuoSxnqR44RI/9HiHtz6GVoQr/EGRpXrdDkoQ2nGgafN7RdOYw1MMF0LJgGx4HwGsqfIapbOoOaEfzitI6YazPPBIJF3e7b0wCaoOWbMyd6YSTeDI9kssMWsI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780590635; c=relaxed/simple;
	bh=TWQD7Nx2vPdkyw41EjqI2NzyTI0ByqqmHYzzWo5TKSg=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=PJSnA1g6SclxJWh0nh0ZjXOphWAzdy4wRe1rnuaVoQM4ehT8qCFt2/5cbTrgHasZV5xv3KybXMpbUVfCw5Z4i0t3lFhxX0YDDyH9lrTHVi84eycuWvN8KKiX2M1gaZkTSFxAJj9aT8zqivBsYahKbUbSbrxhMl2FlZLEJd0QcAc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=GbMA3v86; arc=none smtp.client-ip=74.125.82.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="GbMA3v86"
Received: by mail-dl1-f41.google.com with SMTP id a92af1059eb24-137335bc3caso1158284c88.0
        for <linux-kselftest@vger.kernel.org>; Thu, 04 Jun 2026 09:30:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1780590631; x=1781195431; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=MNxWKwtOMlmaCtYDf9JG2uLTPybVcNdh3AmCvSMq9aE=;
        b=GbMA3v8629/Vw/zhLcTgNBQwilapXeXobAMfKogSOiP3rpWTn0UuJ7aSV3zXPaVbWn
         KLQOM+s/cMQvkVfvO9qfywLFtc6WdkyWnxeWXPI6K4+eJ8CYzW8yykih2Ldofp9Y2xlN
         bzGa8FoZkJbXEgj/7UlI4lptTYZoxbM8paAvEAuI9j2bcl++7fnnaKw3MqbdUQwcJjaG
         kszIixA2XWjjc0yjsp/qb+jhthbull701ynkqYR5r8EEE7BAKzCR2Zvk32pWX6Ww8cdC
         T99mekXxIf69XJ1PE5RokhpeQ+Pgm0hObJfdxxCN3VZOswRJyIpwhFPU0CqwZun/YRDW
         3BJg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780590631; x=1781195431;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=MNxWKwtOMlmaCtYDf9JG2uLTPybVcNdh3AmCvSMq9aE=;
        b=lraENb9zXsrE67y/gpg1OGhtXOHMg/JYBuIegMfUZmfSoz50WQtGlO3jxeo07ZTPCG
         +wWQlADL//kmpJJr4Z3oThxAn2ZOW4239OTMcl1FBtsOifyKMAWZawLVeRsIq0YDb/K+
         gqerMROYtDSRC+Z3LL0lRhLBRSTgaDe9OzE9SFalP0Zi6fxaZ4WpdcTxVvOyUU3hX+l9
         HLGAUpfakhDvy67yKapvTbo6WH33LYZLGfZpcKwVuFoZT3sU7ns3FJePUFnlIvEJQ3tj
         ec/Ob0KyzroGOytZojVc3d42SK5rhgd7wOt4NRqUPqpZKW68bT7AnbA1DQYsJb2s6bGq
         CLTg==
X-Forwarded-Encrypted: i=1; AFNElJ97lzS6F0TBS4YICVf94AYfGIiG7bWd+a4tuLZiBZYf52wFYO81MLgcv1qPPIYaC8x/lMMzsP7maCR1QDQ/agQ=@vger.kernel.org
X-Gm-Message-State: AOJu0YxfPK85oKBJYRuvPn9mL42vRko8S61Gi77LpaB1eGaIR1t1+Sb7
	ONT74NufTjP7St9GoqFbEA5K7a5urWYWgGYsSmmyXDW4HiRYdQ+wyuNt
X-Gm-Gg: Acq92OFOaUvMBmLl5FLjUtp6NjzfNSjVmA/siRih6t5usPMPxVapQINv72g17v4cTe0
	7KO73c93z5gcXM9C+VCCjzJq5683rGkDB+/qeypyQ3tny/utNtGnu7jwQbABd6nn3+J6J2Q6SQ3
	/vgZ1LB5QOQ0Y2Wc8pwpNrwiQ3OtxCOV1ysUizS8nwZAXWVp1LaQ+/DSFhXFcfutLt9lqU8KeC+
	kjlfy8vZ0zRF7HKvR4/+NIiuBU9RJ3EKkd6c5YlrV3NNSaVJ2SgDFlhDLG4P2OTCp/SPnciGuhP
	ynxyLQgrdhn5Q6QE3kCCvSjrUPntFzvHDww1WHCZ0DmPrlaEu9ZtWYXP2P70J1xs3Vx0C91pfhI
	N0O5m9SOJF+L/nvOp0DPwxzUNFGgr0RY+la1ph8McffisW1UX4IKyZaeSb8rZlzK0fSDEyHj9gm
	onam0bl/OD5cNlP6R+si5gpJOX1ww=
X-Received: by 2002:a05:7022:2390:b0:134:df4a:2821 with SMTP id a92af1059eb24-137f6c16da7mr3392850c88.40.1780590630843;
        Thu, 04 Jun 2026 09:30:30 -0700 (PDT)
Received: from houminxi ([64.118.153.39])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-137f549bbefsm4239005c88.4.2026.06.04.09.30.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 04 Jun 2026 09:30:30 -0700 (PDT)
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
Subject: [PATCH net v4] selftests/net/openvswitch: guard command substitutions against empty output
Date: Fri,  5 Jun 2026 00:30:16 +0800
Message-ID: <20260604163016.3929371-1-houminxi@gmail.com>
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

Changes since v3:
  - Corrected subject prefix to [PATCH net] (hardening fix, not new feature).

Changes since v2:
  - Fixed missing 'net/' in subject path (selftests/net/openvswitch).
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

