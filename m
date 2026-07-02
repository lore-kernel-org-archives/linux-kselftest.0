Received: from mail-yx1-f52.google.com (mail-yx1-f52.google.com [74.125.224.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8BE2C478E45
	for <linux-kselftest@vger.kernel.org>; Thu,  2 Jul 2026 09:09:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.224.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782983358; cv=none; b=OMfMfthP0dllxOK8jZGadeL263EH2ZQuV/23vSkwO+68oMNrK/+zjlvzvPolkIBWaEwAcn44rwRiQSYbDor097QiNzAVrZ2ogZ+3FwpdlSmj5aRudM8k/dFTLWPCY2Ixp771+Dl+kR0qLq0Jd8BXYzHuZMEr2pKCPQ01gtGOotw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782983358; c=relaxed/simple;
	bh=X8BM8CFdrVr64i5oR/ogrqx0u/nHaSGxTJtuTfxxlCs=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=FOtd8oCaboeSymW7+sLZ3m0IZGVMSni/NSHlRhmi6h1XqUcRZxKJv3/FEna+FpTnAMXJ8bw/Q0eNK448ofh3gKj/yx/tmwKcwR3FWTMxwRmnYsaRqihgk2wZDXFfvMqfOp1u2Uoghw8sCNgSO4TELXp1KvyD2GhJSwi7YWXjk8Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=CGW8nOdr; arc=none smtp.client-ip=74.125.224.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="CGW8nOdr"
Received: by mail-yx1-f52.google.com with SMTP id 956f58d0204a3-664eb8cb631so1442738d50.3
        for <linux-kselftest@vger.kernel.org>; Thu, 02 Jul 2026 02:09:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1782983355; x=1783588155; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=VyfsxJg+kjzT4zTmiCCR7ZMxnpzzdi+ueWMGl0wz2n0=;
        b=CGW8nOdrNkl5R9l5ocBfKVrULkoa1PCL7fFWTBpOFIpF8jRFG3ecIG9h9VQkshfbHt
         VW+xr1xiBuManQLIvQUx0psc6YJennW8Q9XVCZkyeeAre+44TCySgg4Vo49QyLCgDlRS
         jcb3e6DKSoSY9FToWRxz10zUwluDAx8/rYXLdMgKYF952S1Bpyzz0EEZw3ihR6UN/EiP
         A0e580izNddzHEqTddancua21f1vF3QxIzPSweSd7kpc3sC0MZh+U/JjTg8yQblXG8Z6
         H5KXnQyGVRClmjRgRY2KrzGb+emW+FhffxUJIYOGfATNck0OnBBTxilSssA+CbPtVEE9
         4+uQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782983355; x=1783588155;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=VyfsxJg+kjzT4zTmiCCR7ZMxnpzzdi+ueWMGl0wz2n0=;
        b=T8cIE3tzpLA17mNuZ+9uOpKvx6RvA5X5nAj+lU/jkdRLT/fnNKiJQpwortA6d2Q3cn
         aodOWwxrcwfpbOeDQpo0gLudCBE6zHwdqlek37u/7BnzysEg4DYh+CJTF/QwPIPs+3J1
         JRwfceRv6n+mBXzaJqfABASMyIDA3TD9zEu5kW+JUchoIc+yhC1Cld0TTnKiSg6O05Z4
         NQtIHoa7nUyG1voo81wJNWpdcs9tl9cK6pjYDE5WuqJol6Ao6lqGYV3mmwPygyZpOVss
         5gTU1leVl/RALDlc9pWAxUEQt05YeWjN7DdDtamimTlN8R9SjConP3KWglLFapjP/v22
         YbBg==
X-Forwarded-Encrypted: i=1; AHgh+Roh+paSrn+HUiy50yCy8SmYRq3uoLuIlS7E1nFNkGLj2TSDM16Vh4FsifnY+h4bZc2KW09NgGOculIOD+jvhnQ=@vger.kernel.org
X-Gm-Message-State: AOJu0YzPDbyaHArxA5ZNbkg/0kv25aia3R5miV92OZz9y/R3XeYG1VEF
	IqnDmGYHQUZTJ8rn3gxHyQlwHwFcDGE/fibbe0rrwisNRAjI/eY9Z0NJ
X-Gm-Gg: AfdE7cnPfNr8IldkQZh04RSxrzAWFhAuO68VZYdwx6MvFZTQ9QhdqG4gEPt3B6xo1uK
	aMGuAbWBX2dXravdNG17eMnJY3AXbMZt3yHDMjUSaxOCbw0lE0Tm2Z6kaNLl1hFGlkMN8MOxclP
	s8vEgNIxhNL8+uPVN0yWxGH0Ciibi5tZ3RhNvW98DaqDFZG0DqNHf8iwChFS/qdXGv3+ieYKVB5
	06h1BO8nEKrhkP7OzF7oWP2hZlIfoGUfRo3w6i2ClJXPXohvXsvh1ZfE42Xd0F5hytdcqrq1DcO
	IOehBQE1FFcdmvnYzgZ2RukTi5l3tp2OqcBR8fl1vmuqRH9oe8p5uo1gcDRBMTEU4Hnvjda14tz
	dJcnzwVeqtHXNgcc44N6B+LK/VRFGeztJkY4BeJ0UzRHRT24qcG60f74NoIuex9pVqpk6G8Tz09
	6/IOwTVlvKqlRZPw==
X-Received: by 2002:a53:ac83:0:b0:664:d671:bff4 with SMTP id 956f58d0204a3-665915ae8e7mr4442469d50.4.1782983355137;
        Thu, 02 Jul 2026 02:09:15 -0700 (PDT)
Received: from houminxi ([61.170.226.21])
        by smtp.gmail.com with ESMTPSA id 956f58d0204a3-66624026c3asm837487d50.13.2026.07.02.02.09.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 02 Jul 2026 02:09:14 -0700 (PDT)
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
Subject: [PATCH net-next] selftests/net/openvswitch: add SCTP flow key test
Date: Thu,  2 Jul 2026 05:09:08 -0400
Message-ID: <20260702090908.1253688-1-houminxi@gmail.com>
X-Mailer: git-send-email 2.54.0
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Register OVS_KEY_ATTR_SCTP in the flow key parser so that sctp()
can be used in flow specifications. The ovs_key_sctp class already
exists (with src/dst fields matching the TCP/UDP siblings) but was
not wired into the parser, so the token was silently dropped and the
kernel rejected the flow.

Add test_sctp_connect_v4 exercising the SCTP flow key with
port-specific matching: sctp(dst=4443) for client-to-server and
sctp(src=4443) for server-to-client, mirroring the SCTP four-way
handshake direction. The test verifies connectivity with flows
installed, confirms failure after flow removal, then reinstalls
and verifies recovery.

Signed-off-by: Minxi Hou <houminxi@gmail.com>
---
 .../selftests/net/openvswitch/openvswitch.sh  | 92 +++++++++++++++++++
 .../selftests/net/openvswitch/ovs-dpctl.py    |  5 +
 2 files changed, 97 insertions(+)

diff --git a/tools/testing/selftests/net/openvswitch/openvswitch.sh b/tools/testing/selftests/net/openvswitch/openvswitch.sh
index 2954245129a2..dd4d0b3bcc23 100755
--- a/tools/testing/selftests/net/openvswitch/openvswitch.sh
+++ b/tools/testing/selftests/net/openvswitch/openvswitch.sh
@@ -32,6 +32,7 @@ tests="
 	dec_ttl					ttl: dec_ttl decrements IP TTL
 	flow_set				flow-set: Flow modify
 	action_set				set: SET action rewrites fields
+	sctp_connect_v4				sctp: SCTP flow key matching
 	psample					psample: Sampling packets with psample"
 
 info() {
@@ -443,6 +444,97 @@ test_action_set() {
 	return 0
 }
 
+# sctp_connect_v4 test
+# - sctp(dst=4443) matches client-to-server INIT
+# - sctp(src=4443) matches server-to-client INIT-ACK
+# - remove flows and verify connection fails, reinstall and recover
+test_sctp_connect_v4() {
+	local t="test_sctp_connect_v4"
+
+	which ncat >/dev/null 2>&1 || return $ksft_skip
+	modprobe -q sctp 2>/dev/null || return $ksft_skip
+
+	sbx_add "$t" || return $?
+	ovs_add_dp "$t" sctp4 || return 1
+
+	info "create namespaces"
+	for ns in client server; do
+		ovs_add_netns_and_veths "$t" "sctp4" "$ns" \
+		    "${ns:0:1}0" "${ns:0:1}1" || return 1
+	done
+
+	ip netns exec client ip addr add 172.31.110.10/24 dev c1
+	ip netns exec client ip link set c1 up
+	ip netns exec server ip addr add 172.31.110.20/24 dev s1
+	ip netns exec server ip link set s1 up
+
+	# ARP forwarding
+	ovs_add_flow "$t" sctp4 \
+	    'in_port(1),eth(),eth_type(0x0806),arp()' \
+	    '2' || return 1
+	ovs_add_flow "$t" sctp4 \
+	    'in_port(2),eth(),eth_type(0x0806),arp()' \
+	    '1' || return 1
+
+	# SCTP port matching: dst for request, src for reply
+	ovs_add_flow "$t" sctp4 \
+	    'in_port(1),eth(),eth_type(0x0800),ipv4(proto=132),sctp(dst=4443)' \
+	    '2' || return 1
+	ovs_add_flow "$t" sctp4 \
+	    'in_port(2),eth(),eth_type(0x0800),ipv4(proto=132),sctp(src=4443)' \
+	    '1' || return 1
+
+	echo "server" | \
+		ovs_netns_spawn_daemon "$t" "server" \
+				ncat --sctp -l 172.31.110.20 -vn 4443
+	sleep 0.1
+
+	info "verify SCTP association with port-keyed flows"
+	ovs_sbx "$t" ip netns exec client \
+	    ncat --sctp -i 1 -zv 172.31.110.20 4443 \
+	    || return 1
+
+	ovs_del_flows "$t" sctp4
+
+	info "verify connection fails without flows"
+	ovs_add_flow "$t" sctp4 \
+	    'in_port(1),eth(),eth_type(0x0806),arp()' \
+	    '2' || return 1
+	ovs_add_flow "$t" sctp4 \
+	    'in_port(2),eth(),eth_type(0x0806),arp()' \
+	    '1' || return 1
+
+	echo "server2" | \
+		ovs_netns_spawn_daemon "$t" "server" \
+				ncat --sctp -l 172.31.110.20 -vn 4443
+	sleep 0.1
+
+	ovs_sbx "$t" ip netns exec client \
+	    ncat --sctp -w 2 -zv 172.31.110.20 4443 \
+	    >/dev/null 2>&1 \
+	    && { info "FAIL: connection should fail without flows"
+	         return 1; }
+
+	info "reinstall flows and verify recovery"
+	ovs_add_flow "$t" sctp4 \
+	    'in_port(1),eth(),eth_type(0x0800),ipv4(proto=132),sctp(dst=4443)' \
+	    '2' || return 1
+	ovs_add_flow "$t" sctp4 \
+	    'in_port(2),eth(),eth_type(0x0800),ipv4(proto=132),sctp(src=4443)' \
+	    '1' || return 1
+
+	echo "server3" | \
+		ovs_netns_spawn_daemon "$t" "server" \
+				ncat --sctp -l 172.31.110.20 -vn 4443
+	sleep 0.1
+
+	ovs_sbx "$t" ip netns exec client \
+	    ncat --sctp -i 1 -zv 172.31.110.20 4443 \
+	    || return 1
+
+	return 0
+}
+
 # psample test
 # - use psample to observe packets
 test_psample() {
diff --git a/tools/testing/selftests/net/openvswitch/ovs-dpctl.py b/tools/testing/selftests/net/openvswitch/ovs-dpctl.py
index e1ecfad2c03e..7cfc29ec7e59 100644
--- a/tools/testing/selftests/net/openvswitch/ovs-dpctl.py
+++ b/tools/testing/selftests/net/openvswitch/ovs-dpctl.py
@@ -1982,6 +1982,11 @@ class ovskey(nla):
                 "icmp",
                 ovskey.ovs_key_icmp,
             ),
+            (
+                "OVS_KEY_ATTR_SCTP",
+                "sctp",
+                ovskey.ovs_key_sctp,
+            ),
             (
                 "OVS_KEY_ATTR_TCP_FLAGS",
                 "tcp_flags",
-- 
2.54.0

