Received: from mail-qk1-f178.google.com (mail-qk1-f178.google.com [209.85.222.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7E9433BD63C
	for <linux-kselftest@vger.kernel.org>; Thu, 11 Jun 2026 16:25:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.178
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781195149; cv=none; b=mvOZNlvRmnzDNcMtwx749KCd9jtEqnY4bQdOivQEy9qODOuSOtSNFP54rIR77C2XFUk9YtaHC3FyPYyCmFynVEBeJuIR0sNY4sL1wh80fi+c7sYH0XtFwDBUjvId59ev28ZYgncjVnExMQd2SB0BF8HkS87HgYB+YejMUbjxOiM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781195149; c=relaxed/simple;
	bh=r4gBunOLXIzFtVXn/AR+uFVL6An1nu2a3WGcFyXAMhs=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=cYN+LXO60gzaso/iOVbNToPE3Z1f1SpnptWxdevVw0HR1iiy1oNncVCk4wINOTyKoSTr7Ste6Ub7B67SHhZK0aTLyjmkF6ddVlkY3AmKoW8ZiuoCoxbh449Yb+FuE1N5bmjw11g/P2vPv0aK+gPqYyjSaVwYda4mVp2j5tzmVj8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=lVuQt45k; arc=none smtp.client-ip=209.85.222.178
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="lVuQt45k"
Received: by mail-qk1-f178.google.com with SMTP id af79cd13be357-91578c374ecso3938785a.3
        for <linux-kselftest@vger.kernel.org>; Thu, 11 Jun 2026 09:25:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1781195147; x=1781799947; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=Qg6NySY8h7A00xegM352BvnzcFE1OpOjjzeGdz7V4Mk=;
        b=lVuQt45kJ5hlbWuNKeQE+hPfZ1fBg6gcP7dx7b9GZX01nRJ4vbGxicrPk1wbaxzLu/
         nojZ4lYaL4KBDyhT1dDJOnINEi41Zdlo4zQ0DE/h4BlpPLmdy5Rt1XVOnfcpZyH7Digr
         eucSHzAJOs/+pIwL8MDOenkkhx4oMNwarrxekWIy6fOQzXA3E5kl5xb7pL9zaaEXiOGw
         zF58PT1F/lVYAt+dgNybIqKouL704qTMFYbNvJXdm8/4d2fGHLi7GWc3LLx9nVTkkPdE
         zh4WfcTu0FYN3hZ42JGuti0uAQl/MDXjmmNKVKtY27CM93BTyC+cjsNTZCirbYsWCn6Q
         GcbA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781195147; x=1781799947;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Qg6NySY8h7A00xegM352BvnzcFE1OpOjjzeGdz7V4Mk=;
        b=mWQmq+MfzQ09QY0RPwQcMjOxAuBDvPivecX/VRp3973zyvITVTt3nXL4XyEplAlxh1
         PdWkz/7tKqktkuI12V9B0ezangThOh7UMxHe390ZkrHsLaMNbQ5tjKKMvv+I4PRvpH2h
         DiLuNaLWe2w3n0JGvo1trMMKhm8UcVAXASLJDdrXIf+DVM8sqNOOCQ9/nCPH1g6UpoOj
         L1oaAQdooJBLf9eiK6KXtkv71bEbL2iwM3ON0AHaGBSPysynH+aHvcI3WsAxxccUg/1u
         4h8E9EeJcuh30L9oPATF2F0Zv29dfbaaGyv0NFDJlnDKSiSacW02i+/ww17bcvWsrQse
         LgMQ==
X-Forwarded-Encrypted: i=1; AFNElJ/yhRqGxxecr2ivGMAb2mp+S/LCHYttdCIenP+6vYHlIqwPYIpcEIOf400bwfbnzd+bTL4RNmWNSATw0kOKbA4=@vger.kernel.org
X-Gm-Message-State: AOJu0Yxin6SkR5rxDFxKXRAbnDcIyrr+x5qphFICUDpNP3P1mDsy73LM
	V5eFvoV1OC6QpJdqdtyEIbNs2Eg19QQyIVe8yBBvf/jfb/FpBRn27jdLb1Ko93fKulc=
X-Gm-Gg: Acq92OEAvzoQHsPbS+TP4Hz5DXElJFLjtO5k5LcFwS5khc6yLYLEOWglcqSiPSD9/re
	Byjv7AnnUnN1X7/K39T1FFN24MGlfFj75z22Qi1BipwH8TDkxcq2OJpnDwibisV1NQdxpwVWIK3
	5zYOVStsBmxGDyohcWsbP3KQkVVyswCgmK8esdvyOOzyZL+ZBmhoPItXCpTtWo1XYwnCuGtr55Q
	GLUzUfZDoI5yHJGqFrBEwPaMcly8a5gwySnDEeaCzhdk8W4R9J+En9auTzKg6uX3VADbfnOGwhu
	k8A58U9WZJxgliIKX1eWh2+he7br5ExgNqI8vqb3CxFV7WWmWKSrfCOmKShZdN/O9wFAdiFsLvr
	9GRg4wQek8bF5u6/zfw+gAsCV23wmo5WpB2WkfkdrNAvNSlqA74bVM+uG3neLR8M0NwSll9T6wk
	cZvYfpelbpg29ixBucgQ==
X-Received: by 2002:a05:620a:3944:b0:915:9273:9241 with SMTP id af79cd13be357-9160ac7d21dmr548401685a.2.1781195147185;
        Thu, 11 Jun 2026 09:25:47 -0700 (PDT)
Received: from houminxi ([163.123.141.225])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-9160adf4383sm223254385a.23.2026.06.11.09.25.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 11 Jun 2026 09:25:46 -0700 (PDT)
From: Minxi Hou <houminxi@gmail.com>
To: netdev@vger.kernel.org
Cc: aconole@redhat.com,
	echaudro@redhat.com,
	i.maximets@ovn.org,
	davem@davemloft.net,
	edumazet@google.com,
	kuba@kernel.org,
	pabeni@redhat.com,
	horms@kernel.org,
	shuah@kernel.org,
	dev@openvswitch.org,
	linux-kselftest@vger.kernel.org,
	Minxi Hou <houminxi@gmail.com>
Subject: [PATCH net-next] selftests/net/openvswitch: add output truncation test
Date: Fri, 12 Jun 2026 00:25:37 +0800
Message-ID: <20260611162537.3082686-1-houminxi@gmail.com>
X-Mailer: git-send-email 2.54.0
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Add test_trunc exercising the OVS_ACTION_ATTR_TRUNC action. The test
verifies truncation in three steps: first confirm normal forwarding
works, then apply trunc(14) which truncates packets to the Ethernet
header and verify ping fails, then restore normal forwarding and
verify connectivity recovers.

The trunc action sets OVS_CB(skb)->cutlen, causing pskb_trim at
output time. With trunc(14) the IP payload is stripped, so the
receiver drops the frame and ICMP echo reply is never generated.

Signed-off-by: Minxi Hou <houminxi@gmail.com>
---
 .../selftests/net/openvswitch/openvswitch.sh  | 66 +++++++++++++++++++
 1 file changed, 66 insertions(+)

diff --git a/tools/testing/selftests/net/openvswitch/openvswitch.sh b/tools/testing/selftests/net/openvswitch/openvswitch.sh
index 82f066a0ceed..181eeb332de9 100755
--- a/tools/testing/selftests/net/openvswitch/openvswitch.sh
+++ b/tools/testing/selftests/net/openvswitch/openvswitch.sh
@@ -30,6 +30,7 @@ tests="
 	drop_reason				drop: test drop reasons are emitted
 	pop_vlan				vlan: POP_VLAN action strips tag
 	dec_ttl					ttl: dec_ttl decrements IP TTL
+	trunc					trunc: output truncation
 	psample					psample: Sampling packets with psample"
 
 info() {
@@ -300,6 +301,71 @@ test_dec_ttl() {
 	return 0
 }
 
+test_trunc() {
+	sbx_add "test_trunc" || return $?
+	ovs_add_dp "test_trunc" trunctest || return 1
+
+	info "create namespaces"
+	for ns in client server; do
+		ovs_add_netns_and_veths "test_trunc" "trunctest" "$ns" \
+			"${ns:0:1}0" "${ns:0:1}1" || return 1
+	done
+
+	ip netns exec client ip addr add 10.0.0.1/24 dev c1
+	ip netns exec client ip link set c1 up
+	ip netns exec server ip addr add 10.0.0.2/24 dev s1
+	ip netns exec server ip link set s1 up
+
+	ovs_add_flow "test_trunc" trunctest \
+		'in_port(1),eth(),eth_type(0x0806),arp()' '2' || return 1
+	ovs_add_flow "test_trunc" trunctest \
+		'in_port(2),eth(),eth_type(0x0806),arp()' '1' || return 1
+
+	ovs_add_flow "test_trunc" trunctest \
+		'in_port(1),eth(),eth_type(0x0800),ipv4()' '2' || return 1
+	ovs_add_flow "test_trunc" trunctest \
+		'in_port(2),eth(),eth_type(0x0800),ipv4()' '1' || return 1
+
+	info "verify connectivity without truncation"
+	ovs_sbx "test_trunc" ip netns exec client ping -c 1 -W 2 \
+		10.0.0.2 || return 1
+
+	ovs_del_flows "test_trunc" trunctest
+	ovs_add_flow "test_trunc" trunctest \
+		'in_port(1),eth(),eth_type(0x0806),arp()' '2' || return 1
+	ovs_add_flow "test_trunc" trunctest \
+		'in_port(2),eth(),eth_type(0x0806),arp()' '1' || return 1
+
+	info "add truncated forwarding flow"
+	ovs_add_flow "test_trunc" trunctest \
+		'in_port(1),eth(),eth_type(0x0800),ipv4()' \
+		'trunc(14),2' || return 1
+	ovs_add_flow "test_trunc" trunctest \
+		'in_port(2),eth(),eth_type(0x0800),ipv4()' '1' || return 1
+
+	info "verify ping fails with truncation"
+	ovs_sbx "test_trunc" ip netns exec client ping -c 1 -W 2 \
+		10.0.0.2 >/dev/null 2>&1 \
+		&& { info "FAIL: ping should fail with trunc(14)"
+		     return 1; }
+
+	ovs_del_flows "test_trunc" trunctest
+	ovs_add_flow "test_trunc" trunctest \
+		'in_port(1),eth(),eth_type(0x0806),arp()' '2' || return 1
+	ovs_add_flow "test_trunc" trunctest \
+		'in_port(2),eth(),eth_type(0x0806),arp()' '1' || return 1
+	ovs_add_flow "test_trunc" trunctest \
+		'in_port(1),eth(),eth_type(0x0800),ipv4()' '2' || return 1
+	ovs_add_flow "test_trunc" trunctest \
+		'in_port(2),eth(),eth_type(0x0800),ipv4()' '1' || return 1
+
+	info "verify connectivity restored without truncation"
+	ovs_sbx "test_trunc" ip netns exec client ping -c 1 -W 2 \
+		10.0.0.2 || return 1
+
+	return 0
+}
+
 # psample test
 # - use psample to observe packets
 test_psample() {
-- 
2.54.0

