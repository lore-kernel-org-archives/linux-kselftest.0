Received: from mail-yw1-f171.google.com (mail-yw1-f171.google.com [209.85.128.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 58E85376BE2
	for <linux-kselftest@vger.kernel.org>; Tue, 11 Aug 2026 18:16:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786472217; cv=none; b=L5G08J3w5Uc2urn0RdOXekMnWERDhDKFiImySzSq+lob97/2SZBmGxCyRt/K4bU7YgUK+C6yYfUptYMP7SC+GED99eMqbtVrONFedndD3lKfy2CGJd4NHLEyXeNdzx4qsO8GG9tu+TEkw68Xf96jd3iBCQESQHoJYKyBhxs8y9g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786472217; c=relaxed/simple;
	bh=AumMWY1ubn4SyyhsX+ZeHNFSWmr0ptQKDNdlTMYytNk=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=VzYWGOBa6DpbvyKC1TjakWGs3Xqdz1NLYhIoKOtQYI2WTmY5qtdACZKIPMsPyFY/c4s6h/b83yVlwyBkXFAVc5EgB6QHU0gjYp9YdpzyIN6eh4gVgJkwhWqa3HLoXg7xQt1Q1ooaDNKjQHrAE7/HVu9y1PojhEaly2caVujK0ag=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=qgIQ/YuO; arc=none smtp.client-ip=209.85.128.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="qgIQ/YuO"
Received: by mail-yw1-f171.google.com with SMTP id 00721157ae682-8143daf89c7so1208597b3.1
        for <linux-kselftest@vger.kernel.org>; Tue, 11 Aug 2026 11:16:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1786472215; x=1787077015; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=FmmD1hAxyqj/8ubLIuskVYDVdJ5Fqw/YM97R28jKxTg=;
        b=qgIQ/YuO3fp+Q0/Kr5PPfHNIsk6Jmjl5wIT6XLF73coTeC7jFBvFgeL1/gUz9LQLtG
         7+jiRct3pSq/EJMAp/16oSMskri0Y7HXTkpbQQxUS1Nzbi7n5+VB54ogpQrffqynhNyU
         mFovD6iSDVyxpitKEI/fcXKEqEbMv32luCaZFubg90SPUFSUeeEUQCs6atXblQGxv4Tu
         04ET2qh+vCMD21h8/4TVxVrETKFR46XnpjG2YemBas1Dg/E2g3l98Q3Dwud5KxCrPnK7
         ZMRSnTWvfEthRFLIS0HE2jE3Z1YsxxeOZwG67Zzn38nWSDHVIadC0dIPpz2L6lS4KA86
         nipA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786472215; x=1787077015;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=FmmD1hAxyqj/8ubLIuskVYDVdJ5Fqw/YM97R28jKxTg=;
        b=ZLCPqFK+E1KZTBtU0gHeDjqBJz/W4VQIP106YpqiGF9kgf4pdwKrp9XJTKi/FlFgs/
         9wRtjgbD3NgSY5rYkqBc0gb3hhvqQ4yW2dN8RaFhPGH5ut1xi6RSYgAAjpwozRTyxXbW
         ok5Bgzg4ghIMq809XRFtzvSv+I1jNuvd1I8S6+ChwaktPywbLTF5Z1JuFEetV7rvIWpU
         Nh+hD0Txo4pSGWSGmhOvaCcO2TREC6nMpRmF3lycH3z+BsOIauOmCZ4gpAF//VAUCrv2
         xp4RZAHESKFT3DyLMHS+m5evjqy/54YtlHkmBUWbYiP5wmmhejddZjjPuFO3gRE97G4m
         vY5A==
X-Forwarded-Encrypted: i=1; AHgh+RpPPxXU8e9j/Kgn1SAXcSOwPhmZklKOOrNlkzX0O+RQiHW824+NkYTPoENe90jjptGwxZI4Kul/nrKsJaBIgy4=@vger.kernel.org
X-Gm-Message-State: AOJu0YyYESOD7L8QtvqXjajltyHTftJtRWk4hVPp0uzChc++Te0DyN/N
	elq/kn1b0pOeUmxPblb+3klXd8UiXAg6pcMbOZnFRpawhIDWUgnTNFkxPdaluvPJ
X-Gm-Gg: AR+sD12BeaNT76GlHdnQ9j2XJwvoNbZDxt0ddSn70yparYyUj2mxi9Uhqsi2ZtMGY0n
	JgMI6/nfEbbpcYfYA4npNUO3K406S20jfIx2R8iQxSElMxFuC8zquizQZEqw+ZTIvcAGZQNmeO7
	Wn51XWQfbuPsPTChmwpmeVLitqXadcpFLm4XqpHYAJrzCSkyzKrA0wRh8yFiUBnrKbljoj3zwrE
	Cohk/XYW33oNaJMtj9NYsyLsYE/ZxbWxPw0OG6pFES6iQaVsAl4dWajRCmyTLwKcYQtHPQDUYjx
	rI0f77E43btiM8NOoHK10XX+TXEJMOT4tpGrnSHszshI3POgoHUX0ZNDiGU51WiP0Ns4a5VRFCY
	htlHLnYfEvbwl327WJp2kLRh8sOLneNqunlX2L7hUjL9ZCsvubpGFDPy8w5awe2RNyww1g2CBN+
	ns0vQr9hRfOS+EUd1+EzSXIJdZrBwzy2z8DbXAcspUgtqe5WKHW3nY4+W0kAWaVss5HQ==
X-Received: by 2002:a05:690c:e204:10b0:81d:d035:eb4b with SMTP id 00721157ae682-82f2d2d09ebmr31608757b3.19.1786472215123;
        Tue, 11 Aug 2026 11:16:55 -0700 (PDT)
Received: from houminxi ([163.123.141.225])
        by smtp.gmail.com with ESMTPSA id 00721157ae682-830a9631445sm1414527b3.29.2026.08.11.11.16.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 11 Aug 2026 11:16:53 -0700 (PDT)
From: Minxi Hou <houminxi@gmail.com>
To: netdev@vger.kernel.org
Cc: aconole@redhat.com,
	davem@davemloft.net,
	dev@openvswitch.org,
	echaudro@redhat.com,
	edumazet@google.com,
	horms@kernel.org,
	i.maximets@ovn.org,
	i.maximets@redhat.com,
	kuba@kernel.org,
	linux-kernel@vger.kernel.org,
	linux-kselftest@vger.kernel.org,
	pabeni@redhat.com,
	shuah@kernel.org,
	Minxi Hou <houminxi@gmail.com>
Subject: [PATCH net-next v10] selftests/net/openvswitch: add SCTP flow key support and test
Date: Tue, 11 Aug 2026 14:16:45 -0400
Message-ID: <20260811181645.1918420-1-houminxi@gmail.com>
X-Mailer: git-send-email 2.55.0
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The ovskey flow-string parser has no OVS_KEY_ATTR_SCTP entry, so a
flow string containing sctp(src=.../dst=...) parses without error but
silently drops the L4 key. The resulting flow carries only
ipv4(proto=132), and the kernel rejects it: match_validate() in
flow_netlink.c requires OVS_KEY_ATTR_SCTP when the IP protocol is
IPPROTO_SCTP and returns -EINVAL for the missing key.

Register OVS_KEY_ATTR_SCTP in the parse table and add a matching
selftest that verifies SCTP flow key matching (sctp src/dst port).

One listener serves the whole test. socat's fork option handles each
association in a child, so the flow rules are the only thing that
changes between the three phases and the listener is never restarted
underneath them. -t 1 bounds how long a forked child lingers after
its association closes, and the existing kill -TERM of the captured
pid on teardown removes the listener itself.

Also enable CONFIG_IP_SCTP in the selftest kernel config. The config
checker strips underscores before comparing keys, so the entry sorts
before CONFIG_IPV6 rather than after it.

Signed-off-by: Minxi Hou <houminxi@gmail.com>
---
v10:
  - drop the sctp() key probe. OVS_KEY_ATTR_SCTP is unconditional in
    the kernel datapath (no kconfig gates it in flow_netlink.c), so
    the probe only ever fired for a missing ovs-dpctl.py parse-table
    entry and turned that regression into a skip: the same gap that
    hid the v5 loss. A parse-table regression now fails the test
    instead of skipping it (Jakub)
  - drop setsid. The forked children exit when their association
    closes, socat -t 1 bounds how long they linger, and the existing
    kill -TERM of the captured pid removes the listener itself (Jakub)
  - bound listener child lifetime with socat -t 1 (Jakub)
v9:
  - one forking listener for the whole test instead of restarting it
    between phases (Aaron)
  - signal the daemon's process group on cleanup so the children a
    forking listener leaves behind are reaped
  - sort CONFIG_IP_SCTP the way the config checker compares keys
v8: https://lore.kernel.org/netdev/20260731062655.4088575-1-houminxi@gmail.com/
v7: https://lore.kernel.org/netdev/20260729064549.3647518-1-houminxi@gmail.com/
v6: https://lore.kernel.org/netdev/20260724150624.3457427-1-houminxi@gmail.com/
v5: https://lore.kernel.org/netdev/20260723084203.3483560-1-houminxi@gmail.com/
v4: https://lore.kernel.org/netdev/20260719162657.3263089-1-houminxi@gmail.com/
v3: https://lore.kernel.org/netdev/20260715015446.530018-1-houminxi@gmail.com/
v2: https://lore.kernel.org/netdev/20260707034718.2717982-1-houminxi@gmail.com/
v1: https://lore.kernel.org/netdev/20260702090908.1253688-1-houminxi@gmail.com/
---
 .../testing/selftests/net/openvswitch/config  |  1 +
 .../selftests/net/openvswitch/openvswitch.sh  | 90 +++++++++++++++++++
 .../selftests/net/openvswitch/ovs-dpctl.py    |  5 ++
 3 files changed, 96 insertions(+)

diff --git a/tools/testing/selftests/net/openvswitch/config b/tools/testing/selftests/net/openvswitch/config
index 05ca6affb510..a825e0b5c88e 100644
--- a/tools/testing/selftests/net/openvswitch/config
+++ b/tools/testing/selftests/net/openvswitch/config
@@ -1,5 +1,6 @@
 CONFIG_GENEVE=m
 CONFIG_INET_DIAG=y
+CONFIG_IP_SCTP=y
 CONFIG_IPV6=y
 CONFIG_NETFILTER=y
 CONFIG_NET_IPGRE=m
diff --git a/tools/testing/selftests/net/openvswitch/openvswitch.sh b/tools/testing/selftests/net/openvswitch/openvswitch.sh
index f63001dc2510..a31f7fb6882d 100755
--- a/tools/testing/selftests/net/openvswitch/openvswitch.sh
+++ b/tools/testing/selftests/net/openvswitch/openvswitch.sh
@@ -33,6 +33,7 @@ tests="
 	action_set				set: SET action rewrites fields
 	trunc					trunc: output truncation
 	icmpv6					icmpv6: ICMPv6 echo type match
+	sctp_connect_v4				sctp: SCTP flow key matching
 	psample					psample: Sampling packets with psample"
 
 info() {
@@ -610,6 +611,95 @@ test_icmpv6() {
 	return 0
 }
 
+# Check for an SCTP endpoint via /proc, which works without sctp_diag.
+sctp_eps_has() {
+	ip netns exec "$1" awk -v p="$2" '$6==p' /proc/net/sctp/eps | grep -q .
+}
+
+# sctp_connect_v4 test
+# - sctp(dst=4443) matches client-to-server INIT
+# - sctp(src=4443) matches server-to-client INIT-ACK
+# - remove flows and verify connection fails, reinstall and recover
+test_sctp_connect_v4() {
+	local t="test_sctp_connect_v4"
+	local srv_ip=172.31.110.20
+
+	modprobe -q sctp 2>/dev/null || return "$ksft_skip"
+	socat -V 2>&1 | grep -q "define WITH_SCTP" || return "$ksft_skip"
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
+	ip netns exec server ip addr add "${srv_ip}/24" dev s1
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
+	# The listener forks a child per association, so one instance serves
+	# the whole test and the flows stay the only variable. -t 1 bounds
+	# how long a child lingers after its association closes.
+	ovs_netns_spawn_daemon "$t" "server" \
+	    socat -u -t 1 SCTP4-LISTEN:4443,fork STDOUT
+	ovs_wait sctp_eps_has server 4443 || return 1
+
+	info "verify SCTP association with port-keyed flows"
+	ovs_sbx "$t" ip netns exec client \
+	    timeout 3 socat -u STDIN "SCTP4-CONNECT:${srv_ip}:4443" </dev/null \
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
+	ovs_sbx "$t" ip netns exec client \
+	    timeout 3 socat -u STDIN "SCTP4-CONNECT:${srv_ip}:4443" </dev/null \
+	    >/dev/null 2>&1 \
+	    && { info "connection should fail without flows"
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
+	ovs_sbx "$t" ip netns exec client \
+	    timeout 3 socat -u STDIN "SCTP4-CONNECT:${srv_ip}:4443" </dev/null \
+	    || return 1
+
+	return 0
+}
+
 # psample test
 # - use psample to observe packets
 test_psample() {
diff --git a/tools/testing/selftests/net/openvswitch/ovs-dpctl.py b/tools/testing/selftests/net/openvswitch/ovs-dpctl.py
index 3ece07d47281..1615843c225e 100644
--- a/tools/testing/selftests/net/openvswitch/ovs-dpctl.py
+++ b/tools/testing/selftests/net/openvswitch/ovs-dpctl.py
@@ -1984,6 +1984,11 @@ class ovskey(nla):
                 "udp",
                 ovskey.ovs_key_udp,
             ),
+            (
+                "OVS_KEY_ATTR_SCTP",
+                "sctp",
+                ovskey.ovs_key_sctp,
+            ),
             (
                 "OVS_KEY_ATTR_ICMP",
                 "icmp",
-- 
2.55.0

