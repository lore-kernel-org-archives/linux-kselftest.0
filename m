Received: from mail-vs1-f44.google.com (mail-vs1-f44.google.com [209.85.217.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1D92D202C48
	for <linux-kselftest@vger.kernel.org>; Tue,  7 Jul 2026 03:47:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.217.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783396054; cv=none; b=jN8zEfqQFDGetBzx86ozLPxxInPQx/UXuNacnPY8idbJDwYu1xIrHtKbwhdqtPBBUqoJKvjuyyC7sPiorT2j6EIhI5wDTbBtTlOD0kZIrzQBLW+HvARZKog3OFQ6DWn30rJ7Kk+eZ/v0ScApfHUTs+b6C2rO/V3dXy1v+TdXgA0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783396054; c=relaxed/simple;
	bh=bIpel2MisZarxPESn/8XO7PTy6ZrPetEUgx8Jkn5Qic=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=JGLktDlK/G9tIsOt9ZTyqeXQN3nhT3+0sUQQJmcuo+iW0M4dRZl/e0vJrEApdliuDE1EwiMIpWXiNSkM1Izc/3VFTqWOBFP/T+T8rraYOSyj8pCiUT5qCxNd2xb6K4buI+YoZ1QFKaswAWyFHW+T6J4XJbiGKWJ9qruoWJ7O+vs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=g5QYT0VT; arc=none smtp.client-ip=209.85.217.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="g5QYT0VT"
Received: by mail-vs1-f44.google.com with SMTP id ada2fe7eead31-7387ac7d28cso924797137.1
        for <linux-kselftest@vger.kernel.org>; Mon, 06 Jul 2026 20:47:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1783396052; x=1784000852; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=7eoG/lm2vamJEnKh3aUV46HcL7smzTZx56E3ZGcUYAQ=;
        b=g5QYT0VTkobFNkhLAvT+n3q8rKdazVZJ1hK14hvFaapSWuAeR7PrmyJVcYMpNEtKsG
         BurxxjOAKFPMsBW8yi51nRsbKwP3jEFta1pJDghdQJCDzXX7k1aZGyMFcrtAIS5L+KsF
         eDncPMPuDxk1tQEZ4hRP8tSG8fUwwvzIxwwks+LMduTg9Tdt1CE0bx+A3jSofGHIrXw8
         pG+CHp6HC8r0Zdx4PWnjwkHT5IW1gcrHoglDfQ11wbjCiZUb+UJ4pC5Yd2v0H3BsAR+t
         yom9ertYNW3iBjfRvnCCMVYZbIWXLn6Kl6pEJrAynnwyLOiBxH4G4GY3JgB6q4/07DEC
         R67Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783396052; x=1784000852;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=7eoG/lm2vamJEnKh3aUV46HcL7smzTZx56E3ZGcUYAQ=;
        b=GBN2HSiHXTyYfYHGJlt91PU8xQkhOwhbpgwHlqPbd5H9A87WjBX/QxNL52r06Qbljd
         fXlxQyvJUHdMAozUklEzgAA0cfaTSTcIIS/15+0YjvPUjCi8nXz2sS8bgxv3LT4chwpi
         aN+u5qQQX0xJP0x6sARNv8EmaeXkMl6cX+QH7DdmODAzjSV4T5fFtz3zbk4+LxkX8Hh/
         +tvbe8+w0UgNheA8INEOMDsLbUxI2S9MVedr8tXZJVlcBnaI3djaboCTHCLT0RLhKqAS
         Yx/IkU0tvyhJo7pO576Ij+ztI9q4l17XBBIOYmL3pfNYzCxjRqaCv1qhRT36B+K/ckJc
         uPOQ==
X-Forwarded-Encrypted: i=1; AHgh+RpnVkPf1L7vjkQO956PextI1nPtz1ap98TFbyKn22oMjYgPKQzR5WZPH2A6zHqXTlvSelY4WhquT7632jSHLV0=@vger.kernel.org
X-Gm-Message-State: AOJu0YxOprAKPHwfcgveqUTjvUocO7x1QKGgdFPrZAPr8kIcMImgHm0l
	8WZz3Wlsmj7uyvrik5KpbloGzyfYOSHv52792K+9pL9Qi+RbzQUXoiBq
X-Gm-Gg: AfdE7cl1r/oD5GK5ABwq0g7E1wqLH95UydPni5Acr5OlkmfDDVSOVrD7MCE2PkMQYVT
	vdtUQvIBux+9Lz3S7sdWFfq+rlkWiOw502m/zKzEFK5E1WNUbcUTI/GedFTAXfoVqpkmnYevv6X
	oxHp/hsbgobpjKf2Okfr9isjxZO8ryy34SmeA6anO0iZCoid61YvKZSnixluqYPUIIgxSxvCqud
	1xuVCa8bqItg5ImFg+2FfwZ+sEBrLkRs/x5XMpZOWJo7fgZC71GILVJCs+h3lqmTQaA2WvgGC+1
	k0GUXF6fwzoEM6JpryA1M8oGVrBuhCiAx+7+gy0j+WLOa5CK+uZuYoy7WUNA7GHjFa3tOuJB2eM
	j2ZfNFE6aMEAkRg6Z2Zu0RL9dmssAwnOvMGPauLVxFbjVZUheN1uJEgiIjuV/ZeoAOQ+wewDjAR
	Wl7zqZG0FrABpLXA==
X-Received: by 2002:a05:6102:6898:b0:631:2dc6:2f5c with SMTP id ada2fe7eead31-744b7853919mr1736452137.0.1783396051770;
        Mon, 06 Jul 2026 20:47:31 -0700 (PDT)
Received: from houminxi ([61.170.226.21])
        by smtp.gmail.com with ESMTPSA id ada2fe7eead31-73e19f3f781sm6597392137.2.2026.07.06.20.47.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 06 Jul 2026 20:47:31 -0700 (PDT)
From: Minxi Hou <houminxi@gmail.com>
To: netdev@vger.kernel.org
Cc: aconole@redhat.com,
	echaudro@redhat.com,
	i.maximets@ovn.org,
	i.maximets@redhat.com,
	davem@davemloft.net,
	edumazet@google.com,
	kuba@kernel.org,
	pabeni@redhat.com,
	horms@kernel.org,
	shuah@kernel.org,
	dev@openvswitch.org,
	linux-kselftest@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Minxi Hou <houminxi@gmail.com>
Subject: [PATCH net-next v2] selftests/net/openvswitch: add SCTP flow key test
Date: Mon,  6 Jul 2026 23:47:18 -0400
Message-ID: <20260707034718.2717982-1-houminxi@gmail.com>
X-Mailer: git-send-email 2.55.0
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
sctp(src=4443) for server-to-client.

Wait for ncat readiness with ovs_wait instead of a fixed sleep so
the test does not race against ncat startup. Use grep -c on the
listening message to distinguish between successive ncat instances
that share the same stderr log. Kill the previous server before
respawning to avoid EADDRINUSE on the SCTP port.

Signed-off-by: Minxi Hou <houminxi@gmail.com>
---
v1 -> v2: replace sleep with ovs_wait on ncat listening output,
          kill previous ncat server before respawning to avoid
          port conflict (Aaron review feedback)

 .../selftests/net/openvswitch/openvswitch.sh  | 102 ++++++++++++++++++
 .../selftests/net/openvswitch/ovs-dpctl.py    |   5 +
 2 files changed, 107 insertions(+)

diff --git a/tools/testing/selftests/net/openvswitch/openvswitch.sh b/tools/testing/selftests/net/openvswitch/openvswitch.sh
index 2954245129a2..9c364eeb2ec2 100755
--- a/tools/testing/selftests/net/openvswitch/openvswitch.sh
+++ b/tools/testing/selftests/net/openvswitch/openvswitch.sh
@@ -32,6 +32,7 @@ tests="
 	dec_ttl					ttl: dec_ttl decrements IP TTL
 	flow_set				flow-set: Flow modify
 	action_set				set: SET action rewrites fields
+	sctp_connect_v4				sctp: SCTP flow key matching
 	psample					psample: Sampling packets with psample"
 
 info() {
@@ -443,6 +444,107 @@ test_action_set() {
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
+	local server_pid=$pid
+	ovs_wait sh -c \
+	    "[ \$(grep -c 'Ncat: Listening' ${ovs_dir}/stderr) -ge 1 ]" \
+	    || return 1
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
+	kill -TERM $server_pid 2>/dev/null
+	echo "server2" | \
+		ovs_netns_spawn_daemon "$t" "server" \
+				ncat --sctp -l 172.31.110.20 -vn 4443
+	server_pid=$pid
+	ovs_wait sh -c \
+	    "[ \$(grep -c 'Ncat: Listening' ${ovs_dir}/stderr) -ge 2 ]" \
+	    || return 1
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
+	kill -TERM $server_pid 2>/dev/null
+	echo "server3" | \
+		ovs_netns_spawn_daemon "$t" "server" \
+				ncat --sctp -l 172.31.110.20 -vn 4443
+	ovs_wait sh -c \
+	    "[ \$(grep -c 'Ncat: Listening' ${ovs_dir}/stderr) -ge 3 ]" \
+	    || return 1
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
2.55.0

