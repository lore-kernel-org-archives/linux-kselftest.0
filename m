Received: from mail-qt1-f176.google.com (mail-qt1-f176.google.com [209.85.160.176])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 834F03D2FF4
	for <linux-kselftest@vger.kernel.org>; Fri, 12 Jun 2026 13:05:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.160.176
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781269526; cv=none; b=u+Hkv7n4tGO7eb2j+imFak4OOsXKyZ7Fc3ZG1749yzGruMc3wH7YmsFDeoq8Bm416H0U/zYFk0s1yjmrf4/FeGOd09C7uDCKdDhX+Z+aipmsar5wT+0RHWQvuT1EHfK1Rn6WH+qoI5Do7ZGAHkhfH+RuA/FClXRlcxGs5vju1S4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781269526; c=relaxed/simple;
	bh=/u5n0ZLTjcOeOWVFdcyyVpxGewb/+5l0WRaVCdRb5Gg=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=Y/dZcAPIhHycxzF6OZQyftDwoTlYolniXP2OQSq1Nr7cG2htoQvzpDBSLai190QZhyFw/+lt7aUPzvc6/ZVg1rGUW7kX5gKgN8dlXr7HREUaVlTnkYwhzcPPHAgrhGckPVvvjMP7r0iTlVm8JmZ6+xZDKZ+KskfljvqBrSxn3Kk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=f6cRqZhu; arc=none smtp.client-ip=209.85.160.176
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="f6cRqZhu"
Received: by mail-qt1-f176.google.com with SMTP id d75a77b69052e-5176a2fd597so7616941cf.1
        for <linux-kselftest@vger.kernel.org>; Fri, 12 Jun 2026 06:05:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1781269521; x=1781874321; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=fvXXwXWTSGYXKy5X/ooRPGvrZHiscmZ8mdP5qLv/Du4=;
        b=f6cRqZhuVt8KayVC3XtlRngSYe5LtJZSBKIvqqj6w46+GBCF+xZHvukTCWzjxvxjcC
         tmsuAMrzf6rW19MNdZWnWHfAV9FIyc+IizXZ3dUhegnPv4/gHTFaT/JQ/0nJM12RqwJF
         153KF/xdtu/A/GN+lSGz45Qhx0KFYMBzp3lHdzRdI/Bmpt0D4l131lu6aM2n6MCID6+6
         gINuiYfSoY9uw+YU29eeV7l9d3PAix9hykrsfm0itg4SmaTZCpTlHfV01VEcPpQcvyN1
         z3mTLkCwtfNuMne/+Eua/63TuAgcRhsUAP8eiLBIQCTvFDLO8n8nXIyZ5m5Q6iKO71HM
         Xaow==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781269521; x=1781874321;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=fvXXwXWTSGYXKy5X/ooRPGvrZHiscmZ8mdP5qLv/Du4=;
        b=fy36Qt8pKVhwrcdUyKrAqee/4xjzzCsgrt0Q/7+f+Hinr5wCxPw9MzP4lQaHySW1lI
         UuzaRuqxfkvPD75w9BWdanEAZYMVPXZtqCeWjrGXRT0nq5g2Kw+KyOffBqgs6jtDRkta
         yRZ7eP6r/+V7XhdDMQdm02bDXPNnZ1sl/2aIS+fzq3NhmwUTt32msw6vaH3FbOzhJ4pv
         ymahGIce5zE8+0QV7aiFy0dDCs02lVCMC2guUBacdjB/Hsp8iG9UPJnh5ikJ88Du1SaD
         Ud+cHbx7WdjZF5HXdd57rnB7ys2SIJ2TyhlBrXp1I1b4OxDGIKur24/hvjrRS+HGHMEL
         BGHA==
X-Forwarded-Encrypted: i=1; AFNElJ+RgQb/QRBm7ekgFLaAmoJ1YRdRppk9hOAae4H9q/gDClHcYzil2IvjsHmjc1EY6Ca/8Cn92rErww7EYBs+e1w=@vger.kernel.org
X-Gm-Message-State: AOJu0Yx/URl0yICUkl+AzDTD/k6CH7v9g2m5RhTT5l89XSq5O6LWOnaA
	c4VgW2u0RnDFgtJPy3TqfWtc4oSgKOXacQcTZ/s6PlgwuUQ9p5RSMivA
X-Gm-Gg: Acq92OHlKV6UUlcsNp0GLcDtO+aqU6uLXQJ0vTGazt6ZFIA9m6nZaDFiZBymvy3rBfn
	WZVcrLTnclyAbPnqInQ/Dlrzp4Npdlwq27nyns40MKwIgjzsYxuNt6QWetmad5UoLnCQ9n99IBQ
	KbZ0vyoQxlz6dXluBK0MJBmZ6CALeM1oNTtFeyR1AmBMnzvF9b3FnmTDhTBj9NqnKFH9Nc1UMw+
	OweEZawmtTN4j7ibpW+/GEuna+f4y7bcnnGt2bSYljB9je4vp+R3QKbYZvBzaXEYXNMEkpoYYka
	kK/I2cxeJM0uB8k1pivMaD6O24rNQbIGDnGrrAKnvjkK+m0WLXbOsyiciWEajIzyU63iFjHDJCd
	o0lnzYT5zfnk/0E0Phlct4DHZe6fJT0XxQrm3DWB0Z2kCv/z169TKLq7Ic75oRErdqjHdvtxe94
	3t0V/mvy5I5sS935PEyg==
X-Received: by 2002:a05:620a:448f:b0:915:cda5:2805 with SMTP id af79cd13be357-9161bf57505mr368410585a.52.1781269521084;
        Fri, 12 Jun 2026 06:05:21 -0700 (PDT)
Received: from houminxi ([163.123.141.225])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-91619ed7857sm201511485a.4.2026.06.12.06.05.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 12 Jun 2026 06:05:20 -0700 (PDT)
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
Subject: [PATCH net-next] selftests/net/openvswitch: add SET action test
Date: Fri, 12 Jun 2026 21:05:03 +0800
Message-ID: <20260612130503.311240-1-houminxi@gmail.com>
X-Mailer: git-send-email 2.54.0
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Add test_action_set exercising OVS_ACTION_ATTR_SET with an ipv4 dst
rewrite. The test verifies the SET action in three steps: first
confirm normal forwarding, then apply set(ipv4(dst=10.0.0.99)) to
rewrite the destination to an address nobody owns and verify ping
fails, then restore normal forwarding and verify connectivity
recovers.

Signed-off-by: Minxi Hou <houminxi@gmail.com>
---
 .../selftests/net/openvswitch/openvswitch.sh  | 66 +++++++++++++++++++
 1 file changed, 66 insertions(+)

diff --git a/tools/testing/selftests/net/openvswitch/openvswitch.sh b/tools/testing/selftests/net/openvswitch/openvswitch.sh
index d533decca5c1..2954245129a2 100755
--- a/tools/testing/selftests/net/openvswitch/openvswitch.sh
+++ b/tools/testing/selftests/net/openvswitch/openvswitch.sh
@@ -31,6 +31,7 @@ tests="
 	pop_vlan				vlan: POP_VLAN action strips tag
 	dec_ttl					ttl: dec_ttl decrements IP TTL
 	flow_set				flow-set: Flow modify
+	action_set				set: SET action rewrites fields
 	psample					psample: Sampling packets with psample"
 
 info() {
@@ -377,6 +378,71 @@ test_flow_set() {
 	return 0
 }
 
+test_action_set() {
+	sbx_add "test_action_set" || return $?
+	ovs_add_dp "test_action_set" settest || return 1
+
+	info "create namespaces"
+	for ns in client server; do
+		ovs_add_netns_and_veths "test_action_set" "settest" "$ns" \
+			"${ns:0:1}0" "${ns:0:1}1" || return 1
+	done
+
+	ip netns exec client ip addr add 10.0.0.1/24 dev c1
+	ip netns exec client ip link set c1 up
+	ip netns exec server ip addr add 10.0.0.2/24 dev s1
+	ip netns exec server ip link set s1 up
+
+	ovs_add_flow "test_action_set" settest \
+		'in_port(1),eth(),eth_type(0x0806),arp()' '2' || return 1
+	ovs_add_flow "test_action_set" settest \
+		'in_port(2),eth(),eth_type(0x0806),arp()' '1' || return 1
+
+	ovs_add_flow "test_action_set" settest \
+		'in_port(1),eth(),eth_type(0x0800),ipv4()' '2' || return 1
+	ovs_add_flow "test_action_set" settest \
+		'in_port(2),eth(),eth_type(0x0800),ipv4()' '1' || return 1
+
+	info "verify connectivity without SET"
+	ovs_sbx "test_action_set" ip netns exec client ping -c 1 -W 2 \
+		10.0.0.2 || return 1
+
+	ovs_del_flows "test_action_set" settest
+	ovs_add_flow "test_action_set" settest \
+		'in_port(1),eth(),eth_type(0x0806),arp()' '2' || return 1
+	ovs_add_flow "test_action_set" settest \
+		'in_port(2),eth(),eth_type(0x0806),arp()' '1' || return 1
+
+	info "set ipv4 dst to unreachable address"
+	ovs_add_flow "test_action_set" settest \
+		'in_port(1),eth(),eth_type(0x0800),ipv4()' \
+		'set(ipv4(dst=10.0.0.99)),2' || return 1
+	ovs_add_flow "test_action_set" settest \
+		'in_port(2),eth(),eth_type(0x0800),ipv4()' '1' || return 1
+
+	info "verify ping fails with rewritten dst"
+	ovs_sbx "test_action_set" ip netns exec client ping -c 1 -W 2 \
+		10.0.0.2 >/dev/null 2>&1 \
+		&& { info "FAIL: ping should fail with dst rewritten"
+		     return 1; }
+
+	ovs_del_flows "test_action_set" settest
+	ovs_add_flow "test_action_set" settest \
+		'in_port(1),eth(),eth_type(0x0806),arp()' '2' || return 1
+	ovs_add_flow "test_action_set" settest \
+		'in_port(2),eth(),eth_type(0x0806),arp()' '1' || return 1
+	ovs_add_flow "test_action_set" settest \
+		'in_port(1),eth(),eth_type(0x0800),ipv4()' '2' || return 1
+	ovs_add_flow "test_action_set" settest \
+		'in_port(2),eth(),eth_type(0x0800),ipv4()' '1' || return 1
+
+	info "verify connectivity restored without SET"
+	ovs_sbx "test_action_set" ip netns exec client ping -c 1 -W 2 \
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

