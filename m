Received: from mail-ot1-f51.google.com (mail-ot1-f51.google.com [209.85.210.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A636939023A
	for <linux-kselftest@vger.kernel.org>; Wed, 15 Jul 2026 01:54:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784080499; cv=none; b=L9hLIjz+xszbFt78Vq4SFj7zA4VMHBwv5eJ5eV/XpEDqm+DDGsv5IL8b5lFAu5S8R1yMgQWvgId76Dqw+GZIVA03qJ8xHLHz7AzuqGkYKRePmoqOsXdoyFQTHwPRywCK5Z9BbeYlyOspSaUYYWu5eEcmUXRQ6+lY7C0RbqsHQC4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784080499; c=relaxed/simple;
	bh=QNQN46jr8AgeT+M0xf+mVU4LpUPUrkqGcEjYCEmR+HM=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=qfxLlRXKlEZyRqKFPVVhwZBKaJZnYHeVElHYivApPpFSj4cXezzQfkLmTMzj9vpGEYCOV66ZbaWF0Lyo1EplYvZMmOnvq9plwXauHoDX2eff1JIpHsMPwsELgdUYhNYuvzs3sjNBzcQKRoO1YrCvNIQ7VuRtUJFSkoRQJ7HxPP4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=iSwTP0Xf; arc=none smtp.client-ip=209.85.210.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="iSwTP0Xf"
Received: by mail-ot1-f51.google.com with SMTP id 46e09a7af769-7ec1e9d3359so1671787a34.0
        for <linux-kselftest@vger.kernel.org>; Tue, 14 Jul 2026 18:54:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1784080495; x=1784685295; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=u/0I1HYJ2xHf0BHOz9366yIszPgKtlusu4Q0Xz6+ags=;
        b=iSwTP0XfJjJ5bv5m5ei6Y6zlE+7+hQgkuvClbzkZ8LonccRKoYdhoBJLwJlo5jov82
         0x6kGLB2Fq/Qq8rYNN26xoNbyvGeKmaf1Mc1Uezj4sa5aqwGg+VRkMceGGHgaB6x5fDF
         8zZk0OO6pblzdC4BIMyqOXLRp0O6lNTmFfvLGj5vOnBXbGTy0TREDHApYOo1RSiyYxdz
         UJkUpeu/h99VV3IeoVygSJZcaFQlYJ8GzeMoE6Khp+8sX9mkWDdk+Ow5su5hFknsYoe+
         KF35hzud/OcJn/ks1h/vEDkKRV6j1QYRlkNI2SICz2LDCzh0Yj/B9f2oQfDj28FnyIAv
         kr4w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784080495; x=1784685295;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=u/0I1HYJ2xHf0BHOz9366yIszPgKtlusu4Q0Xz6+ags=;
        b=N176Ehu8OHKHtuN3RG1tVuinL3ozzjGr/mbP8xplW9/WFxE4LfEIuKwx11CygHA4U4
         VwtdXienXsEI4EjdvdW3ABuqV0XRWzzAJtdccjM/NHLT3r79po1Ke692KtgHzIQX6DUf
         YL3M0vHvChRCL0iD+6fmJwY2gBLCvC4s0gFeVlgTwmp9stGGtzY+3b8bfHkI2IbIKTCU
         Y8T8TvNo79BR8UZ/QaZ3HQKwkxRM/L9ffT9OP68RADVJlPlkeOdmXzzn6CkXVxjFBZlb
         cAjsiJDYomzB6Jvs6nyBavW7Ymh4gV0vLMCNpf7wr5kf5D5rOpUppYpZFKHG3oq2kaux
         iNMw==
X-Forwarded-Encrypted: i=1; AHgh+RqO0MYDKbixb77yJL5nPg0BGB4qgzuF8oa/tvFX8UGz0PHy5u8vCWgpyz+f/KdxgK+YjuZz0hptfgjoMvIu6VY=@vger.kernel.org
X-Gm-Message-State: AOJu0YyyHY1mI7gcBSh0R1isfUTtpgbCMSm5CGr6WKh61dN3HqhKOPT6
	VybAYyi5Y9N6RI1yzX+pWOimJkp/KjwVywFRrIJw84pePMn5Gp2zZGRz
X-Gm-Gg: AfdE7cmuE+yE2Ou7BO5KKrgigWx+WAHLxrfy7G0imS6Vc4CNr9a5geB7ZJNRp3pzSjH
	DVYpLmkFLnLF6L93UKZJN7DytZiJ0qMjTnfxHHr6Hu4Jmmq+f/6i6eMeycgDJ1fVvYETR3toQSV
	TD9dpqai6Vdou+DXNTaiSlCaLEnx6bnmu6I3KaCor87wQ+Q0/jX1JAS+0UYLtsFmcjs3f8mpl6j
	3PjwMHWcnMwds3EhqX1v1OvQeVWvwnLyQMyh5XjEhXJnN5oBzgdysob9pE7pd14TKgIQi3JGwcE
	RaE/ZCBkngwZW9xaS2E7owtAJTXM3XokN+tBL5y5oYWYiRjJ5i93ZmdVUNCYfP/os5Oh2/o4skR
	ZsJDPK9xEvb5kvEkDN/qOt39ekipbaWSsdSdFwj/mmasofgdRBPRUsZFSojK/bTmpVFqy65Yop1
	AYnSaCQhYK7qLdGVoEt4GgswsB4g==
X-Received: by 2002:a05:6830:290a:b0:7e9:e19f:c015 with SMTP id 46e09a7af769-7ec423e1b9amr3680873a34.30.1784080495328;
        Tue, 14 Jul 2026 18:54:55 -0700 (PDT)
Received: from houminxi ([61.170.160.153])
        by smtp.gmail.com with ESMTPSA id 46e09a7af769-7ebcb262db2sm16331598a34.16.2026.07.14.18.54.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 14 Jul 2026 18:54:54 -0700 (PDT)
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
	linux-kernel@vger.kernel.org,
	Minxi Hou <houminxi@gmail.com>
Subject: [PATCH net-next v3] selftests/net/openvswitch: add SCTP flow key test
Date: Tue, 14 Jul 2026 21:54:46 -0400
Message-ID: <20260715015446.530018-1-houminxi@gmail.com>
X-Mailer: git-send-email 2.55.0
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Add test_sctp_connect_v4() to verify OVS can match on SCTP flow keys
(sctp src/dst port).

The test sets up client and server namespaces connected through an
OVS bridge, installs port-keyed flows, and verifies:
  - sctp(dst=4443) matches client-to-server INIT
  - sctp(src=4443) matches server-to-client INIT-ACK
  - removing flows drops the connection
  - reinstalling flows restores connectivity

Signed-off-by: Minxi Hou <houminxi@gmail.com>
---
 .../selftests/net/openvswitch/openvswitch.sh  | 105 ++++++++++++++++++
 .../selftests/net/openvswitch/ovs-dpctl.py    |   5 +
 2 files changed, 110 insertions(+)

v2 -> v3:
  - replace ncat with nc for consistency with other tests in the same
    file (per Ilya Maximets' review)
  - add wait for killed daemon processes (per sashiko review)
  - replace 'Ncat: Listening' stderr grep with ss port-based readiness
    check

diff --git a/tools/testing/selftests/net/openvswitch/openvswitch.sh b/tools/testing/selftests/net/openvswitch/openvswitch.sh
index 2954245129a2..0ec9c969cd0a 100755
--- a/tools/testing/selftests/net/openvswitch/openvswitch.sh
+++ b/tools/testing/selftests/net/openvswitch/openvswitch.sh
@@ -32,6 +32,7 @@ tests="
 	dec_ttl					ttl: dec_ttl decrements IP TTL
 	flow_set				flow-set: Flow modify
 	action_set				set: SET action rewrites fields
+	sctp_connect_v4				sctp: SCTP flow key matching
 	psample					psample: Sampling packets with psample"
 
 info() {
@@ -443,6 +444,110 @@ test_action_set() {
 	return 0
 }
 
+# sctp_connect_v4 test
+# - sctp(dst=4443) matches client-to-server INIT
+# - sctp(src=4443) matches server-to-client INIT-ACK
+# - remove flows and verify connection fails, reinstall and recover
+test_sctp_connect_v4() {
+	local t="test_sctp_connect_v4"
+
+	which nc >/dev/null 2>&1 || return $ksft_skip
+	nc --sctp -z 127.0.0.1 1 </dev/null 2>/dev/null || return $ksft_skip
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
+				nc --sctp -l 172.31.110.20 -vn 4443
+	local server_pid=$pid
+	ovs_wait ip netns exec server \
+	    ss -lnH sport = :4443 \| grep -q . \
+	    || return 1
+
+	info "verify SCTP association with port-keyed flows"
+	ovs_sbx "$t" ip netns exec client \
+	    nc --sctp -i 1 -zv 172.31.110.20 4443 \
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
+	wait $server_pid 2>/dev/null
+	echo "server2" | \
+		ovs_netns_spawn_daemon "$t" "server" \
+				nc --sctp -l 172.31.110.20 -vn 4443
+	server_pid=$pid
+	ovs_wait ip netns exec server \
+	    ss -lnH sport = :4443 \| grep -q . \
+	    || return 1
+
+	ovs_sbx "$t" ip netns exec client \
+	    nc --sctp -w 2 -zv 172.31.110.20 4443 \
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
+	wait $server_pid 2>/dev/null
+	echo "server3" | \
+		ovs_netns_spawn_daemon "$t" "server" \
+				nc --sctp -l 172.31.110.20 -vn 4443
+	ovs_wait ip netns exec server \
+	    ss -lnH sport = :4443 \| grep -q . \
+	    || return 1
+
+	ovs_sbx "$t" ip netns exec client \
+	    nc --sctp -i 1 -zv 172.31.110.20 4443 \
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

