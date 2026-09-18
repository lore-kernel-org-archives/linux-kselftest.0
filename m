Received: from mail-qk2-f13.google.com (mail-qk2-f13.google.com [74.125.230.205])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5C6923BE642
	for <linux-kselftest@vger.kernel.org>; Fri, 18 Sep 2026 14:47:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.230.205
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789742833; cv=none; b=Nlr88hLCfan7iyto5dzYBPfqm6SYRWLBCyxEdV++HVBLieaPs8OtQL5H2G194fluxqDjjFYh6eBJPfDLo1a1T6NWfvoIQK478YYlQP2hbb9uYcG/Iu2SOj54wJBWaKBoP1W2SF7T90mQCGq08A+C3m0miWLVCLy9oxakqPyAMLk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789742833; c=relaxed/simple;
	bh=kabummar7TcOBbR8WOovCzVRA0h4gTnJhHCEM2ioMB8=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=D0otkWgWeLOJMsgXlnTRvvVnRSQnIRmoLoi75oeMvTmUxxOGBCY2/JCxxNa1FnM05ZYUggeIY/J0M1QLH3pvl1GRZUhTi0AhVVEybcfrttpY7thExIlMb2j9Z4DokwGWJH/zfVVlzsD80soQizhjuAVlE4aDeVxMSXZncPhWHUc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=F6ctjVyb; arc=none smtp.client-ip=74.125.230.205
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="F6ctjVyb"
Received: by mail-qk2-f13.google.com with SMTP id af79cd13be357-93910cadeafso63251885a.3
        for <linux-kselftest@vger.kernel.org>; Fri, 18 Sep 2026 07:47:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789742830; x=1790347630; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=gdoP+rUbwhLKVifGH/eIk06aBELievehbEDqjuiaFwM=;
        b=F6ctjVybJ3pVlLgHlo7+sWzL8Lt3V8TnMCaf1rQUnbjyybFSVCDdMT2sjMu9cURrV2
         0eQ2wWkEbdiFEykdc07+Qkg8+vsauAfMks9mMTMQmhLF5SPXIpLTwZxDvlS+0obg15Ip
         uqvgmKKC2jVY8rwT6vl2VNK5JP74Zv9PViIOKbe+VyrNS/AuAnOj8d5UGGucQcmLj0sV
         kVFYvHFhbO7XtkMj03AZiPKqrXig94S1ddsUjYi44LeoZYOIC+PpxygP5xCH+opZRJ8V
         +JjtHDURvVS69pjtDNu/jVb7YiKyHItszE46UDoi+kuuII9MKR7HTShlpucZjD7lA0H+
         o5cA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789742830; x=1790347630;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=gdoP+rUbwhLKVifGH/eIk06aBELievehbEDqjuiaFwM=;
        b=MLPicbmpg7/V++GGPsvZFh0jM4pwQ8IhSgay9GaXzZkFCp9az7BImvUrvqtyCcCgfd
         YIy3VGM3z4VpPyxBqtiCZcaqIy5lqol6WRHq1Dq2+4Og2BeoPamFBCMF7wr4CpLxCMqK
         5Z5r4erik4++eXhfsUzU5rddIRcGdM1iBgLmB8kWo0dB1db3su2GZ1a35I8WMcSHT5Qj
         v4sAqHw6HAL76TNq4bV/cUiDm8h1iBv+vFzP5CgQ9xqns2tdQ6/8qUavKVK3n08Vh/8a
         WpfzuSdPDc5+gCxb4cbTTG4XHHZaflrkUY5CoWsbRLTQTRnfvKdrxXFoHmeuYGJOIfBY
         oq1Q==
X-Forwarded-Encrypted: i=1; AKwUvBwrtla2c5xl+c+Gv4b0BaSKe8z7NPvLEay1Z/eAVdG5Ku231A6vuiD3SxGsrNMzPKU7VpTdL0hJkGbtwtwMAek=@vger.kernel.org
X-Gm-Message-State: AFuF++mi8fkrkE1rT6R88tXKTxDX5qPByl3Wsd1O1pUGEF2c1mDtiHac
	NKJ/qYwaXmGQnvDYsPbzqigcBenxwwXYOq6tFq+KDtCMs/NOb6SWS2Y/
X-Gm-Gg: AYBFou2sajB/hFtySVtpPtXaO8AM2acdkRHn17DdIEyQOqclDARcfcwIyHIYlq3eEPi
	nXB+88m7o2RVoSdmuxJdyrGJwy7xoxYSiDWN7s7sn2uNRlaKWKIgONmihQHtMtdbp1tPpoiQfIQ
	1pXV2lWGdgnQtSDgYw30KXq07p8vl0bz0FRjre/M6mWYJvtnQ6ar38PBnbbg+LqF/u3EmTYL1Za
	rRAK4PxJFbY4RzXMa3xhSVZLRAbX2JJ0ZcEt/aF1Mkb6uzKEuhkiSPLDZC9Gy8BLuDptngky4E8
	R4MmRVwiM/CsVKIPisND7War8Bj9hY9ZCDKN+cdkv+idHkhl1MhSyayIdRv7iUVDuIoHwnrqThf
	nNgNLiRg+j1OxX/byjJD+bQRO6no1bgji6T/EiPvnzHJJEainiadbp4VLDt+H0LKZCKLxu4E7Gq
	Gk9Ut6eNcNMapOxx7NU9vO10RJ5uXimJDjrfuS/iTqBoyqqXAWeL1Hir4d/nzEWCYQDi41bWkvb
	aMs
X-Received: by 2002:a05:620a:2b91:b0:939:3b56:c416 with SMTP id af79cd13be357-93bdc6bfcf0mr379420485a.8.1789742830041;
        Fri, 18 Sep 2026 07:47:10 -0700 (PDT)
Received: from houminxi ([61.170.217.176])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-93be0ed50b2sm160197485a.32.2026.09.18.07.47.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 18 Sep 2026 07:47:09 -0700 (PDT)
From: Minxi Hou <houminxi@gmail.com>
To: netdev@vger.kernel.org
Cc: Aaron Conole <aconole@redhat.com>,
	Eelco Chaudron <echaudro@redhat.com>,
	Ilya Maximets <i.maximets@ovn.org>,
	"David S . Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>,
	Paolo Abeni <pabeni@redhat.com>,
	Simon Horman <horms@kernel.org>,
	Shuah Khan <shuah@kernel.org>,
	dev@openvswitch.org,
	linux-kselftest@vger.kernel.org,
	Minxi Hou <houminxi@gmail.com>
Subject: [PATCH net-next v5 2/2] selftests/net/openvswitch: add SCTP flow key test across conntrack NAT
Date: Fri, 18 Sep 2026 10:46:47 -0400
Message-ID: <20260918144647.2024095-3-houminxi@gmail.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20260918144647.2024095-1-houminxi@gmail.com>
References: <20260918144647.2024095-1-houminxi@gmail.com>
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
of failing. The config fragment sets CONFIG_NETFILTER_ADVANCED=y so
CONFIG_NF_CT_PROTO_SCTP is visible, CONFIG_NF_CT_PROTO_SCTP=y, and
CONFIG_NF_NAT=m so the reference build actually has those pieces.
After the association succeeds the test pushes a known payload
across and waits for the listener to log it.

Signed-off-by: Minxi Hou <houminxi@gmail.com>
---
 .../testing/selftests/net/openvswitch/config  |  3 +
 .../selftests/net/openvswitch/openvswitch.sh  | 93 +++++++++++++++++++
 2 files changed, 96 insertions(+)

diff --git a/tools/testing/selftests/net/openvswitch/config b/tools/testing/selftests/net/openvswitch/config
index a825e0b5c88e..15685d242813 100644
--- a/tools/testing/selftests/net/openvswitch/config
+++ b/tools/testing/selftests/net/openvswitch/config
@@ -3,10 +3,13 @@ CONFIG_INET_DIAG=y
 CONFIG_IP_SCTP=y
 CONFIG_IPV6=y
 CONFIG_NETFILTER=y
+CONFIG_NETFILTER_ADVANCED=y
 CONFIG_NET_IPGRE=m
 CONFIG_NET_IPGRE_DEMUX=m
 CONFIG_NF_CONNTRACK=m
 CONFIG_NF_CONNTRACK_OVS=y
+CONFIG_NF_CT_PROTO_SCTP=y
+CONFIG_NF_NAT=m
 CONFIG_OPENVSWITCH=m
 CONFIG_PSAMPLE=m
 CONFIG_VETH=y
diff --git a/tools/testing/selftests/net/openvswitch/openvswitch.sh b/tools/testing/selftests/net/openvswitch/openvswitch.sh
index aa84fafc3201..21444657a040 100755
--- a/tools/testing/selftests/net/openvswitch/openvswitch.sh
+++ b/tools/testing/selftests/net/openvswitch/openvswitch.sh
@@ -35,6 +35,7 @@ tests="
 	icmpv6					icmpv6: ICMPv6 echo type match
 	sctp_connect_v4				sctp: SCTP flow key matching
 	sctp_connect_v6				sctp6: SCTP flow keys over IPv6
+	sctp_nat_connect_v4			sctpnat4: SCTP NAT translation
 	psample					psample: Sampling packets with psample"
 
 info() {
@@ -1200,6 +1201,98 @@ test_nat_connect_v4 () {
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
+		'ct(commit,nat(dst=172.31.110.20:5555)),recirc(0x1)' \
+		&> /dev/null
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
+		"ct_state(-trk),in_port(1),eth(),eth_type(0x0800),"\
+"ipv4(dst=192.168.0.20)" \
+		"ct(commit,nat(dst=172.31.110.20:5555)),recirc(0x1)" || return 1
+	ovs_add_flow "test_sctp_nat_connect_v4" sctpnat4 \
+		"ct_state(-trk),in_port(2),eth(),eth_type(0x0800),ipv4()" \
+		"ct(commit,nat),recirc(0x2)" || return 1
+
+	ovs_add_flow "test_sctp_nat_connect_v4" sctpnat4 \
+		"recirc_id(0x1),ct_state(+trk-inv),in_port(1),eth(),"\
+"eth_type(0x0800),ipv4(dst=172.31.110.20,proto=132),"\
+"sctp(dst=5555)" \
+		"2" || return 1
+	ovs_add_flow "test_sctp_nat_connect_v4" sctpnat4 \
+		"recirc_id(0x2),ct_state(+trk-inv),in_port(2),eth(),"\
+"eth_type(0x0800),ipv4(src=192.168.0.20,proto=132),"\
+"sctp(src=4443)" \
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

