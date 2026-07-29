Received: from mail-vk1-f173.google.com (mail-vk1-f173.google.com [209.85.221.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3E2453793D5
	for <linux-kselftest@vger.kernel.org>; Wed, 29 Jul 2026 06:46:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.173
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785307575; cv=none; b=ESVF30W1YRcmPS2tNQwU8xMs+P1Jz1g08bZCq644nB6pe5Fp8VULfMWARak/mshB15IpJPrSvwM/e5oYsqeudUfSKMmnWQUjGL7vgApU4M+QVEr4am9vcr5Q48FVcrxm+ibux2kK4Z9EcfA7lWr1/ZyrYxU+elEqRaOAMCUYdhc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785307575; c=relaxed/simple;
	bh=aLvrgUhovUotbgq1yV5E5nzK8hKbIYLBa8oT5Q49nik=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=t9y7w3uQIWO7LjscVQHJCalpYncxWb1eQcMjyk1Y6eFpkxkOh6jOvMkRVeMeeq+5E58N+pSHe6NX18UR5/FmWw0aw9VeSyD32yRz5eLDc1Q/OIGsDKq/X0NBwuEb90L07dsQD6YRQJEF3CKKAx7kvFDxyKX0cmPpcGcyxtXdvqc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=hvnE6OkW; arc=none smtp.client-ip=209.85.221.173
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="hvnE6OkW"
Received: by mail-vk1-f173.google.com with SMTP id 71dfb90a1353d-5bfb3347ce0so186869e0c.2
        for <linux-kselftest@vger.kernel.org>; Tue, 28 Jul 2026 23:46:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1785307573; x=1785912373; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=5ElNQLPF+IOEJVGx3X6HzWFOmVSfbkgUy77zg9FdrcY=;
        b=hvnE6OkWI4tJmZAVpcStzZALlc1mrRnGMLuV+OKuzjOQMO3pt3NRRQIjs4vkHjGYH0
         T8s4bOonQvkCWYPuWH/YHID58vg0VwfuCmW5DYf/HOEIyMJt1aC6qU6kFGzqpD6tnmyE
         dCRFeDUhK7hre2ExvlXKbCiYENP/4Ip6QMuxoOed+trnhH8HgZcSJy6yAPZEfozr83YQ
         OqBjJh4EhuB4xAmtJlW47wyKeJw4g3k9JO4e4lqqALXBLAYwpJgRBzFxK2CJLV2eOJiq
         MhKNe02dt5PgDMLl0pmAeu6HqWRscoLW/0Iruu1IVQSZDbNrHCSlnfhxXm7X5WTRD84G
         JbeA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785307573; x=1785912373;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=5ElNQLPF+IOEJVGx3X6HzWFOmVSfbkgUy77zg9FdrcY=;
        b=aCFy/1yKp+8LKq3q2NWjIleEyS4F2n5WknTMXLsN2OQu/vn+IAHgu5fHD8uC7dZFxy
         humlyF72xU7SbsaW82CQG4PRvxDbWxwGjEQ0D4So3PauYpTHgX2f1jnohQCkTn6QEYf/
         2FJ08qvEgcAzlGWhhRiDCzX7OwUWdoETfz6oaVVuLfqKkDw9Z6p1gLqK0lts4oRuzgBQ
         Fvcv/ptVvl0Dc0cvqvUHrFjIw5X6zdQ0ZY8ZJ49bBLw/NYO1OzREr3GggH3EmzxWAnjL
         h740Hhi5VPC3RMdJRwbm3/34w9nhrzsZfD9ugEHQpZUQEuWDcOSaPYUUteDZVNUfvOE6
         VPNQ==
X-Forwarded-Encrypted: i=1; AHgh+RqHhyunhXXV1NsWkkBxn5jrYT7uVPs7y/RglY/nJVzJOVOkwa+VNosVjqXasoIg0MC4YhcIQxgpFtHMUiVXHow=@vger.kernel.org
X-Gm-Message-State: AOJu0YxcAw6Aeskj7pdtqKCHsHnZtTQtsm/5T/eCCdT9v52KB3w9OGAa
	7yIbDtKTwsA4mRA2GKcndYy797LOkohktMplr2LZ9FcynO4F1Tna5vaX
X-Gm-Gg: AR+sD12RWpmDI3TjmR618+y1gSyJfOAhfcWs9PmetRaER0Y55eKKl1Pwj//5cEAoHlo
	xm+maxdRhFxvxJgbBNiCRzGF1ezyfPfTptOy/nvwyrTvpiCAOCjUVTizIdLoUmR7b8ZyTr18ckX
	1Nm9NdnP3cSeOCRMct2ghTE+RHLPpkXVC7iPy7JQUyAqYJrs9zc2Hk8j+fqDaCcN38dbrQsD3OF
	YbdRltbWqMyOBJMNmBg57xRtlIRSj50UPDiZZhfKatW9qqB6um2y2NQuRpBKumEHqrULXlyhMDI
	YcyPi4SybjdUQD0KlCwHlsnpwibEbwiE3jUyCWhZ+TH3eS+YvBApvoNKpNjZ0R6c62rmiNpU6JW
	L2aeV42LvQ6+nqU4jT4bGX7dtIN1TOrXKLeXUyEPolclOKZQsiJIHNGI+JvpELOUAOZlhl5Rtqa
	dS5gEuhplIGHeB8BxUGN6D1YMsKtZ/Uytqh2TqTe5d63WpP8UdNJqv
X-Received: by 2002:a05:6122:1815:b0:5c1:706d:aec3 with SMTP id 71dfb90a1353d-5c33fa9be2cmr2218891e0c.11.1785307573078;
        Tue, 28 Jul 2026 23:46:13 -0700 (PDT)
Received: from houminxi ([61.170.216.249])
        by smtp.gmail.com with ESMTPSA id 71dfb90a1353d-5c34ef4dcf5sm1548090e0c.6.2026.07.28.23.46.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 28 Jul 2026 23:46:12 -0700 (PDT)
From: Minxi Hou <houminxi@gmail.com>
To: netdev@vger.kernel.org
Cc: davem@davemloft.net,
	edumazet@google.com,
	kuba@kernel.org,
	pabeni@redhat.com,
	aconole@redhat.com,
	echaudro@redhat.com,
	i.maximets@ovn.org,
	dev@openvswitch.org,
	linux-kselftest@vger.kernel.org,
	shuah@kernel.org,
	horms@kernel.org,
	linux-kernel@vger.kernel.org,
	Minxi Hou <houminxi@gmail.com>
Subject: [PATCH 2/2] selftests/net/openvswitch: add SCTP flow key test
Date: Wed, 29 Jul 2026 02:45:49 -0400
Message-ID: <20260729064549.3647518-3-houminxi@gmail.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20260729064549.3647518-1-houminxi@gmail.com>
References: <20260729064549.3647518-1-houminxi@gmail.com>
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

The listener readiness probe reads /proc/net/sctp/eps instead of ss:
ss requires the sctp_diag interface, which is not enabled on all
kernels, while /proc/net/sctp/eps exists whenever SCTP is loaded.

Signed-off-by: Minxi Hou <houminxi@gmail.com>
---
 .../selftests/net/openvswitch/openvswitch.sh  | 121 ++++++++++++++++++
 1 file changed, 121 insertions(+)

diff --git a/tools/testing/selftests/net/openvswitch/openvswitch.sh b/tools/testing/selftests/net/openvswitch/openvswitch.sh
index 853dbc1b00d7..b448324527d8 100755
--- a/tools/testing/selftests/net/openvswitch/openvswitch.sh
+++ b/tools/testing/selftests/net/openvswitch/openvswitch.sh
@@ -34,6 +34,7 @@ tests="
 	action_set				set: SET action rewrites fields
 	trunc					trunc: output truncation
 	icmpv6					icmpv6: ICMPv6 echo type match
+	sctp_connect_v4				sctp: SCTP flow key matching
 	psample					psample: Sampling packets with psample"
 
 info() {
@@ -611,6 +612,126 @@ test_icmpv6() {
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
+	# Probe: check if kernel supports sctp flow key.
+	ovs_add_flow "$t" sctp4 \
+	    'in_port(1),eth(),eth_type(0x0800),ipv4(proto=132),sctp(dst=4443)' \
+	    '2' &>/dev/null
+	if [ $? -ne 0 ]; then
+		info "no support for sctp key - skipping"
+		ovs_exit_sig
+		return $ksft_skip
+	fi
+	ovs_del_flows "$t" sctp4
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
+	ovs_netns_spawn_daemon "$t" "server" \
+	    socat -u SCTP4-LISTEN:4443 STDOUT
+	local server_pid="$pid"
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
+	kill -TERM "$server_pid" 2>/dev/null
+	local i=0
+	while kill -0 "$server_pid" 2>/dev/null && [ "$i" -lt 5 ]; do
+	    sleep 0.2
+	    i=$((i + 1))
+	done
+	ovs_netns_spawn_daemon "$t" "server" \
+	    socat -u SCTP4-LISTEN:4443 STDOUT
+	server_pid="$pid"
+	ovs_wait sctp_eps_has server 4443 || return 1
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
+	kill -TERM "$server_pid" 2>/dev/null
+	i=0
+	while kill -0 "$server_pid" 2>/dev/null && [ "$i" -lt 5 ]; do
+	    sleep 0.2
+	    i=$((i + 1))
+	done
+	ovs_netns_spawn_daemon "$t" "server" \
+	    socat -u SCTP4-LISTEN:4443 STDOUT
+	server_pid="$pid"
+	ovs_wait sctp_eps_has server 4443 || return 1
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
-- 
2.55.0

