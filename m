Received: from mail-qv1-f45.google.com (mail-qv1-f45.google.com [209.85.219.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C1FF623B63E
	for <linux-kselftest@vger.kernel.org>; Sun,  6 Sep 2026 16:53:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788713594; cv=none; b=gXBOSFL6qxqPKqE+uTwy8kZvESR/d/pTicdxSsRNABJ/LJfLZjcg6n4JJo2tWhiTq+KyqV3cNsntXhzk0SZjCSj79ginKaQRYWv201GPnPgd1b7WyJv16F6PiRlP25mOBIUkrpZ5BhWRTrRd5ivOlleH0M/gIj42sfq6y3X6jrQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788713594; c=relaxed/simple;
	bh=KuLX5nFd6sKvpOw24HCW5pPqc7gmdWxBz/dxA8XmQXs=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=Ro+PrOKUOGlqErahj2OXmJcFr4Z4v+HBvUWsI9Qiyfd9CkO3+8maRCeAAaPYD/OMbVUeITfEt75cR+reGcFRhhzprD66Gz5WTPClxhDxvZW1p/8XgnsJALkPRJNxDnkdkYEY8MV+HaLapNzl0AAw9SBjSmT8lkPStiNbz2QUGeY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=NJCgHhFI; arc=none smtp.client-ip=209.85.219.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="NJCgHhFI"
Received: by mail-qv1-f45.google.com with SMTP id 6a1803df08f44-90cc107c451so17550196d6.0
        for <linux-kselftest@vger.kernel.org>; Sun, 06 Sep 2026 09:53:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788713592; x=1789318392; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=ZZiMeD/Io3WtmguEFZgA5/+B6qbs9KLh5cpu9F1ku0A=;
        b=NJCgHhFI67dm+OqHPvxTQWDpfDgLkY5b0CaIPL8jQQtD+hO3du/UoFnOasWuwhkZWU
         Z625q3gdGHms+U5e8pPKjRd7O8cAjFMH6NBVBju0UgPTRlhNTL4ZXNDF2ZXKecYrWbis
         Gm3UxlSGO2YrJCUAgGcqVaYonBJ7GuoAS8Oct66mKPigD4LPyAP2JKyrli0OBpwSa3r+
         T/5TaVEYj0SILYFBQdJpHSWzW05986mWRy2TXX5dFWFY2sDYaDM1QoFB54XOZ0l45XcI
         AlRVwFOqE4913VRcl0jEgUYalMva7rof6m6p0xIeu6PbP41snkesGUYO6zFhKhMJalOS
         yAug==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788713592; x=1789318392;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=ZZiMeD/Io3WtmguEFZgA5/+B6qbs9KLh5cpu9F1ku0A=;
        b=jAXNeARGto+3ucB85lYacbT2qC7ZB6H0SmlifiTaCQjqOV9z1R8e9Z8XHYrhuurDdb
         vD/6hVW1VmBDagZygGLawA1C5Gaa6FK9cfUycFiQeg0tK9022VAQBCplRe1ZFLp3q/yk
         edQH9cPxXVdWOKWCol7bWW3VgySVeMcP9zIcx9CGVc3bdKXunTLLKWRcGVCvyYIc+h8W
         1UmVf6PnCUvrj0TsJxxLyhUMQWIjKJ4/hKGSDUpo23sxlnJUtyI9JQtlkjN+OdFchKpn
         4aNF0PgZ213fI0P9pzlHW5foXO66fI9QuP2Y1rNGC5MCaLmzQUNSUaR11T5GeksP8WvB
         f4dQ==
X-Forwarded-Encrypted: i=1; AKwUvBx2WjjNob0zvj43k3dz6Izco0E6wo2e+wiMlGXXEpagCcwuvo0/QvD4edMmR0FczFjS80ByMWgDnvHS74C079I=@vger.kernel.org
X-Gm-Message-State: AFuF++mj9ddVo3M/OL3cDn9yIye2DvcBEaJLkDwXDbZi/8xP0221A/KL
	syTSk9/Mm3LbOjq4yxMoPMjeuXMSAOvZH7VqRN+evOMlyPDgeFzbc/bC
X-Gm-Gg: AYBFou02X8B4nppSBNvHAKRp+pNvo0fkZ50EpWKcY1pXXT4mZNlocAECCPcmVor8fmk
	pwOq32At7Uh3EuYw9Tvq6uKHRfpsXQmq7HAheYTHQ+pUqcOhX4c/cKIIt4ZD8UtHqOe+KKmx6rP
	E8qlnfxAjF3mhARyfAgFmqqvI5go4csj+iOyhT0VyGnj7lvbJ8sOQSWrFPNe7jqm9dGY7C5JBEs
	pzew54opCpGUTBqtbdqxxiabuEdkPBtJ/Fx3ZT6uRqOTmXQYwTETGCzA/8IZbujEa8F0ER2Klka
	lu4XyPXytTSXbHJJ4oL0SkTZon+TF1QSQegHW34d5BW5s92fyMFrtzaNf7hLWc+kE1HrIrpZa4J
	TB5MQW2qAiT2Cf/FcMsgQJWsVVtUJXeB5uU70wLM5PY3b5riiqtzeNaXC9YukR8uxaZE1bLwAeQ
	oM0/bvQUa0dMOwmzpk6CD3nBj2uS6/1gBitn9Ci8iZ7mSmLJbZjg4z0AlkBBE33/U=
X-Received: by 2002:a05:622a:449:b0:530:23cb:cac with SMTP id d75a77b69052e-530547d5adfmr206552741cf.6.1788713591570;
        Sun, 06 Sep 2026 09:53:11 -0700 (PDT)
Received: from houminxi ([163.123.141.225])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-91040595f81sm72195696d6.2.2026.09.06.09.53.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 06 Sep 2026 09:53:11 -0700 (PDT)
From: Minxi Hou <houminxi@gmail.com>
To: netdev@vger.kernel.org
Cc: aconole@redhat.com,
	echaudro@redhat.com,
	i.maximets@ovn.org,
	davem@davemloft.net,
	kuba@kernel.org,
	pabeni@redhat.com,
	edumazet@google.com,
	horms@kernel.org,
	shuah@kernel.org,
	linux-kselftest@vger.kernel.org,
	dev@openvswitch.org,
	Minxi Hou <houminxi@gmail.com>
Subject: [PATCH v3 2/2] selftests/net/openvswitch: add SCTP NAT test with port translation
Date: Sun,  6 Sep 2026 12:52:51 -0400
Message-ID: <20260906165251.1176875-3-houminxi@gmail.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20260906165251.1176875-1-houminxi@gmail.com>
References: <20260906165251.1176875-1-houminxi@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

After conntrack NAT rewrites a packet, OVS refreshes the cached flow
key in ovs_nat_update_key(), which has a per-protocol branch for the
L4 ports (UDP/TCP/SCTP, conntrack.c). Address-only NAT cannot tell a
working SCTP branch from a missing one: the ports survive unchanged
either way, so a post-recirc match on the original port stays green
even with the branch deleted. The suite's NAT coverage drives TCP
over nc, and the merged SCTP test has no conntrack in the path, so
the SCTP branch goes unexercised.

Add test_sctp_nat_connect_v4: untracked client traffic to
192.168.0.20:4443 hits ct(commit,nat(dst=172.31.110.20:5555)),recirc,
and the post-recirc flows match the translated tuple,
ipv4(dst=172.31.110.20),sctp(dst=5555). Reply traffic is matched on
the restored original tuple, sctp(src=4443). With the SCTP branch
broken the translated port never reaches the key, no post-recirc
flow matches, and the association fails. The probe flow uses the
same ct+nat action as the real flows, so a kernel without
CONFIG_NF_NAT rejects it at flow-add time and the test skips instead
of failing; CONFIG_NF_CT_PROTO_SCTP=y is added to the config fragment
for the same reason (the symbol is user-visible only with
NETFILTER_ADVANCED=y). After the association succeeds the test pushes
a known payload across and waits for the listener to log it.

Signed-off-by: Minxi Hou <houminxi@gmail.com>
---
 .../testing/selftests/net/openvswitch/config  |  1 +
 .../selftests/net/openvswitch/openvswitch.sh  | 87 +++++++++++++++++++
 2 files changed, 88 insertions(+)

diff --git a/tools/testing/selftests/net/openvswitch/config b/tools/testing/selftests/net/openvswitch/config
index a825e0b5c88e..fa90475dc388 100644
--- a/tools/testing/selftests/net/openvswitch/config
+++ b/tools/testing/selftests/net/openvswitch/config
@@ -7,6 +7,7 @@ CONFIG_NET_IPGRE=m
 CONFIG_NET_IPGRE_DEMUX=m
 CONFIG_NF_CONNTRACK=m
 CONFIG_NF_CONNTRACK_OVS=y
+CONFIG_NF_CT_PROTO_SCTP=y
 CONFIG_OPENVSWITCH=m
 CONFIG_PSAMPLE=m
 CONFIG_VETH=y
diff --git a/tools/testing/selftests/net/openvswitch/openvswitch.sh b/tools/testing/selftests/net/openvswitch/openvswitch.sh
index 0926e304ed88..fb37b6ab2ec1 100755
--- a/tools/testing/selftests/net/openvswitch/openvswitch.sh
+++ b/tools/testing/selftests/net/openvswitch/openvswitch.sh
@@ -35,6 +35,7 @@ tests="
 	icmpv6					icmpv6: ICMPv6 echo type match
 	sctp_connect_v4				sctp: SCTP flow key matching
 	sctp_connect_v6			sctp6: SCTP flow key matching over IPv6
+	sctp_nat_connect_v4		sctpnat4: SCTP flow key across conntrack NAT
 	psample					psample: Sampling packets with psample"
 
 info() {
@@ -1186,6 +1187,92 @@ test_nat_connect_v4 () {
 	return 0
 }
 
+# sctp_nat_connect_v4 test
+#  - SCTP association crosses a ct(commit,nat(dst=ip:port)) DNAT
+#  - post-recirc flows match the translated address and port, so the
+#    SCTP branch of the post-NAT flow key update is load-bearing
+test_sctp_nat_connect_v4 () {
+	local t="test_sctp_nat_connect_v4"
+	local payload="SCTP_NAT_DATA_OK"
+	local rxfile="${ovs_base}/${t}/sctp-rx.txt"
+
+	modprobe -q sctp 2>/dev/null || return "$ksft_skip"
+	socat -V 2>&1 | grep -q "define WITH_SCTP" || return "$ksft_skip"
+	# SCTP conntrack is compiled into nf_conntrack.ko, so check that
+	# loading it actually exposed the SCTP conntrack sysctls.
+	modprobe -q nf_conntrack 2>/dev/null || return "$ksft_skip"
+	[ -e /proc/sys/net/netfilter/nf_conntrack_sctp_timeout_established ] \
+	    || { info "no SCTP conntrack support - skipping"
+	         return "$ksft_skip"; }
+
+	sbx_add "test_sctp_nat_connect_v4" || return $?
+
+	ovs_add_dp "test_sctp_nat_connect_v4" sctpnat4 || return 1
+	info "create namespaces"
+	for ns in client server; do
+		ovs_add_netns_and_veths "test_sctp_nat_connect_v4" "sctpnat4" \
+		    "$ns" "${ns:0:1}0" "${ns:0:1}1" || return 1
+	done
+
+	ip netns exec client ip addr add 172.31.110.10/24 dev c1
+	ip netns exec client ip link set c1 up
+	ip netns exec server ip addr add 172.31.110.20/24 dev s1
+	ip netns exec server ip link set s1 up
+
+	ip netns exec client ip route add default via 172.31.110.20
+
+	# Check if the ct and nat actions can be configured.
+	ovs_add_flow "test_sctp_nat_connect_v4" sctpnat4 \
+		'in_port(1),eth(),eth_type(0x0800),ipv4()' \
+		'ct(commit,nat(dst=172.31.110.20:5555)),recirc(0x1)' &> /dev/null
+	if [ $? == 1 ]; then
+		info "no support for ct/nat actions - skipping"
+		ovs_exit_sig
+		return $ksft_skip
+	fi
+
+	ovs_del_flows "test_sctp_nat_connect_v4" sctpnat4
+
+	ovs_add_flow "test_sctp_nat_connect_v4" sctpnat4 \
+		'in_port(1),eth(),eth_type(0x0806),arp()' '2' || return 1
+	ovs_add_flow "test_sctp_nat_connect_v4" sctpnat4 \
+		'in_port(2),eth(),eth_type(0x0806),arp()' '1' || return 1
+	ovs_add_flow "test_sctp_nat_connect_v4" sctpnat4 \
+		"ct_state(-trk),in_port(1),eth(),eth_type(0x0800),ipv4(dst=192.168.0.20)" \
+		"ct(commit,nat(dst=172.31.110.20:5555)),recirc(0x1)" || return 1
+	ovs_add_flow "test_sctp_nat_connect_v4" sctpnat4 \
+		"ct_state(-trk),in_port(2),eth(),eth_type(0x0800),ipv4()" \
+		"ct(commit,nat),recirc(0x2)" || return 1
+
+	ovs_add_flow "test_sctp_nat_connect_v4" sctpnat4 \
+		"recirc_id(0x1),ct_state(+trk-inv),in_port(1),eth(),eth_type(0x0800),ipv4(dst=172.31.110.20,proto=132),sctp(dst=5555)" \
+		"2" || return 1
+	ovs_add_flow "test_sctp_nat_connect_v4" sctpnat4 \
+		"recirc_id(0x2),ct_state(+trk-inv),in_port(2),eth(),eth_type(0x0800),ipv4(src=192.168.0.20,proto=132),sctp(src=4443)" \
+		"1" || return 1
+
+	ovs_netns_spawn_daemon "test_sctp_nat_connect_v4" "server" \
+		socat -u -t 1 SCTP4-LISTEN:5555,fork \
+		OPEN:"$rxfile",creat,append
+	ovs_wait sctp_eps_has server 5555 || return 1
+
+	info "verify SCTP association across NAT"
+	ovs_sbx "test_sctp_nat_connect_v4" ip netns exec client \
+	    timeout 3 socat -u STDIN "SCTP4-CONNECT:192.168.0.20:4443" \
+	    </dev/null || return 1
+
+	info "verify SCTP DATA chunk crosses NAT"
+	ovs_sbx "test_sctp_nat_connect_v4" ip netns exec client \
+	    timeout 3 socat -u STDIN "SCTP4-CONNECT:192.168.0.20:4443" \
+	    <<< "$payload" || return 1
+	ovs_wait grep -q "$payload" "$rxfile" \
+	    || { info "server did not receive SCTP DATA payload"
+	         return 1; }
+
+	info "done..."
+	return 0
+}
+
 # nat_related_v4 test
 #  - client->server ip packets go via SNAT
 #  - client solicits ICMP destination unreachable packet from server
-- 
2.55.0

