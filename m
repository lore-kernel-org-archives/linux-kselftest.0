Received: from mail-yw1-f175.google.com (mail-yw1-f175.google.com [209.85.128.175])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3D8003C3C07
	for <linux-kselftest@vger.kernel.org>; Thu,  2 Jul 2026 07:49:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.175
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782978578; cv=none; b=GmtN1bkApQvBJapYtulErMEmh2RXKKe9cvSkkzsY3ihJ8MDsFw87PkXNC/HG0tHXFmiCjiZVmmRVu1xmN9TYfsv5obuOS5Ts0dICrs6s/9OJko2mAOUBb3aHatuCpkHB+ZXdrH3bXtnhNW/yAzqoOxPTNYPi4w0vDOtKOotGyDY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782978578; c=relaxed/simple;
	bh=5aY6jgDGxHHuKKofEbdBbN3i11i7tJ7gyBsJWfhgjYc=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=OueqZgoKFP4ntmXETUd3xqVADBH3BSl0Q+IHRvLkxe+QphPnAVWGFzSvPRB8Ith3SdDHJDx1Dric922br7B/p20e63DlXJ90b9p5qszc1oTe/eUNJFq9sx1TIxuIM0vUophM1HC1qBYKlPduYvRCU4V6ArCibZ3yuR3HWgUGd90=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=EX4m0bpx; arc=none smtp.client-ip=209.85.128.175
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="EX4m0bpx"
Received: by mail-yw1-f175.google.com with SMTP id 00721157ae682-80a1fb0c683so18167937b3.1
        for <linux-kselftest@vger.kernel.org>; Thu, 02 Jul 2026 00:49:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1782978575; x=1783583375; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=/dNM3gzN7WGtyObjROoTO4V+/DlyZKbxSjH6yLNERms=;
        b=EX4m0bpxQWZ/juNcvvXLXkKF234lViBrLwwWbMNOdHL1AomnlmAqIzQYyfx1EBdcwv
         EVE9EG1uaA7kYXJjh1qCjOO36mC85Wpewr31iB7+3vqFl9yEW0lfF5UOYZvxNF3Qh0fT
         Vq0ItcxxbUNjHwPgPAqv7hlMBoJlCyq9dy6CP8wVhyYiMcoW0kufGV0F5TQFOd7xOpE6
         9+ab+n+KXUH+P6ybuVgtwuDoiaN57NHbyNwaDJFsmUWbt35wLU3HGiPnIcuZqQubzF6q
         aECRKLwtQu0psrWEvqmBiLid/k/tA7YbKPRUQ0g89Gh64JYPjWA8woMcdzwRqhSi/WCv
         ueBA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782978575; x=1783583375;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=/dNM3gzN7WGtyObjROoTO4V+/DlyZKbxSjH6yLNERms=;
        b=GPOuMYdKfuMAQ8qWOgIohvJIOwizASTT8mdkT46G6txa21+kTGXgChbqiqpsY9UPSx
         NxKCtxc95ymyf0HUGGZZVedQWy4xmZ0u8GH0jmnT7wb9p86tE2Hoi53KK9fqV6ReL5k5
         S7bSEw3cDBLTT0kJd/Fev/LPtTyIxyRbEsGodRp1NHHL7iIN/nJuU/TXfWSdpo11uhYK
         w+r+IRy7XzvfXfsU3EVu/ubC291P3VfPuyNMKosDfZiTr26y1BMol57uwhN9MsAtfuhu
         UMmwh6xHYKeg3me3GRR6JRxZBpHDTTy5onHraPUJ3IwUvWXcM+r+8WSNmZSEANprrYwJ
         AR7Q==
X-Forwarded-Encrypted: i=1; AHgh+RoSuGKjxr6/dH5FyLt8IxSdPNg9AnopWiGBa1IrD8Pt8mCTTo/s6GGLA66ZQT1bm4yVl8dRdX2diDZ6Sub3YwA=@vger.kernel.org
X-Gm-Message-State: AOJu0Yy/+SMkAxmant8VV6NSJevuj1TvwXrJbi1XVGE1GAaBV1onkaKN
	WLTZQBH0cvu9pQgMsD7RFvM0nAbspywy/GJXroNyrv4pplaH/c3u+0bG
X-Gm-Gg: AfdE7ck284oGvD4kOc5xGQCGZ5ZnfBuGwNTxtRbtQUOZwYPfAwW2752Upw8WXe8EGBK
	oJn2dM1vr8UVWWmDx2BOMQlIwfKkumH1LgfDIhtNBBFL554HUFcdHaaaZd6+pdHs9fP5Xy016n7
	EjSIb2GE9lNHJFvk1fx3mVrn5du//4LHY7UMPuG35oqPHq8SkFFxJY7UiZq/1DkYgB2/YhGPN/x
	JD1U3oFOUefez14p3feu4eK5hwFaEVFUl+ycP5LjGbY1y8OD5XS0+kMn2ht4VUO2u+v+o7tLQ1e
	hUnzXdSQD55snr4n5e77XWaAjWBDWb+dY3ys5K05DOHOqJc1/m7/npjGN2jiMr1pyWIObxLp7ad
	nKlD+Ki1qJbrsMEus3ypD/uGk3wT61cS4SCJQ97QBXQGHFL33c4Z7ObVc1BBiIolcH4F3lzq5i/
	GHpBzm
X-Received: by 2002:a05:690c:670c:b0:7f8:7e50:638d with SMTP id 00721157ae682-812eb1790c2mr60976337b3.47.1782978575064;
        Thu, 02 Jul 2026 00:49:35 -0700 (PDT)
Received: from houminxi ([23.133.88.228])
        by smtp.gmail.com with ESMTPSA id 00721157ae682-8144af52bd6sm9417827b3.28.2026.07.02.00.49.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 02 Jul 2026 00:49:33 -0700 (PDT)
From: Minxi Hou <houminxi@gmail.com>
To: netdev@vger.kernel.org
Cc: Minxi Hou <houminxi@gmail.com>,
	aconole@redhat.com,
	echaudro@redhat.com,
	i.maximets@ovn.org,
	davem@davemloft.net,
	edumazet@google.com,
	kuba@kernel.org,
	pabeni@redhat.com,
	horms@kernel.org,
	shuah@kernel.org,
	dev@openvswitch.org,
	linux-kselftest@vger.kernel.org
Subject: [PATCH net-next v3] selftests/net/openvswitch: add output truncation test
Date: Thu,  2 Jul 2026 03:49:26 -0400
Message-ID: <20260702074926.1174810-1-houminxi@gmail.com>
X-Mailer: git-send-email 2.54.0
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Add test_trunc exercising the OVS_ACTION_ATTR_TRUNC action. The test
verifies truncation limits in four steps: reject trunc(1) and
trunc(13) which are below ETH_HLEN, confirm normal forwarding works,
apply trunc(14) which truncates packets to the Ethernet header and
verify ping fails, then restore normal forwarding and verify recovery.

The kernel requires max_len >= ETH_HLEN (14 bytes). trunc(14) sets
OVS_CB(skb)->cutlen so pskb_trim strips the IP payload at output
time; the receiver drops the runt frame and no echo reply is
generated.

Signed-off-by: Minxi Hou <houminxi@gmail.com>
---
 .../selftests/net/openvswitch/openvswitch.sh  | 87 +++++++++++++++++++
 1 file changed, 87 insertions(+)

diff --git a/tools/testing/selftests/net/openvswitch/openvswitch.sh b/tools/testing/selftests/net/openvswitch/openvswitch.sh
index 2954245129a2..f75ee723415a 100755
--- a/tools/testing/selftests/net/openvswitch/openvswitch.sh
+++ b/tools/testing/selftests/net/openvswitch/openvswitch.sh
@@ -32,6 +32,7 @@ tests="
 	dec_ttl					ttl: dec_ttl decrements IP TTL
 	flow_set				flow-set: Flow modify
 	action_set				set: SET action rewrites fields
+	trunc					trunc: output truncation
 	psample					psample: Sampling packets with psample"
 
 info() {
@@ -443,6 +444,92 @@ test_action_set() {
 	return 0
 }
 
+# trunc test
+# - trunc(14): truncate to ETH_HLEN, strips IP payload, ping fails
+# - trunc(1) and trunc(13): kernel rejects below ETH_HLEN (EINVAL)
+# - restore normal forwarding and verify recovery
+test_trunc() {
+	sbx_add "test_trunc" || return $?
+	ovs_add_dp "test_trunc" trunctest || return 1
+
+	info "create namespaces"
+	for ns in client server; do
+		ovs_add_netns_and_veths "test_trunc" "trunctest" \
+		    "$ns" "${ns:0:1}0" "${ns:0:1}1" || return 1
+	done
+
+	ip netns exec client ip addr add 10.0.0.1/24 dev c1
+	ip netns exec client ip link set c1 up
+	ip netns exec server ip addr add 10.0.0.2/24 dev s1
+	ip netns exec server ip link set s1 up
+
+	ovs_add_flow "test_trunc" trunctest \
+	    'in_port(1),eth(),eth_type(0x0806),arp()' '2' || return 1
+	ovs_add_flow "test_trunc" trunctest \
+	    'in_port(2),eth(),eth_type(0x0806),arp()' '1' || return 1
+	ovs_add_flow "test_trunc" trunctest \
+	    'in_port(1),eth(),eth_type(0x0800),ipv4()' \
+	    '2' || return 1
+	ovs_add_flow "test_trunc" trunctest \
+	    'in_port(2),eth(),eth_type(0x0800),ipv4()' \
+	    '1' || return 1
+
+	info "verify connectivity without truncation"
+	ovs_sbx "test_trunc" ip netns exec client \
+	    ping -c 1 -W 2 10.0.0.2 || return 1
+
+	# trunc below ETH_HLEN must be rejected by the kernel
+	info "verify trunc(1) is rejected"
+	ovs_add_flow "test_trunc" trunctest \
+	    'in_port(1),eth(),eth_type(0x0800),ipv4()' \
+	    'trunc(1),2' &> /dev/null \
+	    && { info "trunc(1) should be rejected"; return 1; }
+
+	info "verify trunc(13) is rejected"
+	ovs_add_flow "test_trunc" trunctest \
+	    'in_port(1),eth(),eth_type(0x0800),ipv4()' \
+	    'trunc(13),2' &> /dev/null \
+	    && { info "trunc(13) should be rejected"; return 1; }
+
+	ovs_del_flows "test_trunc" trunctest
+	ovs_add_flow "test_trunc" trunctest \
+	    'in_port(1),eth(),eth_type(0x0806),arp()' '2' || return 1
+	ovs_add_flow "test_trunc" trunctest \
+	    'in_port(2),eth(),eth_type(0x0806),arp()' '1' || return 1
+
+	info "add trunc(14) forwarding flow"
+	ovs_add_flow "test_trunc" trunctest \
+	    'in_port(1),eth(),eth_type(0x0800),ipv4()' \
+	    'trunc(14),2' || return 1
+	ovs_add_flow "test_trunc" trunctest \
+	    'in_port(2),eth(),eth_type(0x0800),ipv4()' \
+	    '1' || return 1
+
+	info "verify ping fails with trunc(14)"
+	ovs_sbx "test_trunc" ip netns exec client \
+	    ping -c 1 -W 2 10.0.0.2 >/dev/null 2>&1 \
+	    && { info "ping should fail with trunc(14)"
+	         return 1; }
+
+	ovs_del_flows "test_trunc" trunctest
+	ovs_add_flow "test_trunc" trunctest \
+	    'in_port(1),eth(),eth_type(0x0806),arp()' '2' || return 1
+	ovs_add_flow "test_trunc" trunctest \
+	    'in_port(2),eth(),eth_type(0x0806),arp()' '1' || return 1
+	ovs_add_flow "test_trunc" trunctest \
+	    'in_port(1),eth(),eth_type(0x0800),ipv4()' \
+	    '2' || return 1
+	ovs_add_flow "test_trunc" trunctest \
+	    'in_port(2),eth(),eth_type(0x0800),ipv4()' \
+	    '1' || return 1
+
+	info "verify connectivity restored"
+	ovs_sbx "test_trunc" ip netns exec client \
+	    ping -c 1 -W 2 10.0.0.2 || return 1
+
+	return 0
+}
+
 # psample test
 # - use psample to observe packets
 test_psample() {
-- 
2.54.0

