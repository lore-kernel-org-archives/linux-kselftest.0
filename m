Received: from mail-vs1-f45.google.com (mail-vs1-f45.google.com [209.85.217.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B7759448384
	for <linux-kselftest@vger.kernel.org>; Fri, 24 Jul 2026 15:06:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.217.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784905611; cv=none; b=KElsPiM1mlD1ocuW/6Oap195RYujBufbSYRe/FVLGhv5n/pYxjWQBOXSfhypeQ/hQlctJdYUafaeifsSaCIpYIGFeMK9AYCs+9OFwcqt82XakB60zrHz73enABayHN5f2xFKmShdUvpKyUXLqlSZHcIBrZ78aZ9a3LXZeaOHaZY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784905611; c=relaxed/simple;
	bh=aLvrgUhovUotbgq1yV5E5nzK8hKbIYLBa8oT5Q49nik=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=U9ltr5QIQEHljSaPYaIpPMYK+bjTB5FsWz76k8yHseE4n4LV6wwwt/W1T3ysYeqd4nU/zh+Cq5SdB2iXKDnrwTlLZLQDVJNkHY9D18uzVSh7SvaAGRvFcQ0/qcMZE0QkE+BWe5B6aG9U6GtQNebRBzLaOLDlBWREhRBYaDszLJc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=ATVgZt5R; arc=none smtp.client-ip=209.85.217.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="ATVgZt5R"
Received: by mail-vs1-f45.google.com with SMTP id ada2fe7eead31-738a5cc517eso364645137.2
        for <linux-kselftest@vger.kernel.org>; Fri, 24 Jul 2026 08:06:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1784905601; x=1785510401; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=5ElNQLPF+IOEJVGx3X6HzWFOmVSfbkgUy77zg9FdrcY=;
        b=ATVgZt5R23l2x1nh786HIA6mHuK11Zjb1jbVX8J0IaP8348yzH5cs1fMLQeq4dZlSd
         WtnK11qid36y4lHDi4ambFRy3Iu40g0MwAiMh8lfsIYw1JBu/NZMLgxamEPXil49WoJs
         oo5JGNY0i/5nkhwz1nY655IFTdJdxSLqCziRdJjMFutKjPfQdF/pFpn95l6/hxFVaAYz
         01XpqWmJUGJ57ex7NIeB+ct7vng8PaCi4v9Tihn/0qQQPrO5/C+ueSmc7UpqCk9ar1IS
         CT3eL+XJhUP4yGhR7Jd/9luCHdocXcDoSimVifcpztLsk1iX1a3KV5QokWwU3QA9Q9o/
         I6IQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784905601; x=1785510401;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=5ElNQLPF+IOEJVGx3X6HzWFOmVSfbkgUy77zg9FdrcY=;
        b=Zp8dfavOxf8wNuFRy4nnDHcnDQmvPCEYoztUjEesG7c847Xw+1okufV3a5ib5Ltscp
         RvwgfwPNa1eGRV6YG3AzN2Tm5TQ9E9bZkWBwTxQ8Nao9yjQaV0ETlNGo+mDHexjZkfA6
         tOshwQnJ3vzL1CXriUhUbHtEiSA62YYMvyHt295c7i5KzJwpwt8QSFv4ohnTd8pDuMZQ
         v6nPPS7xCOyJxRLG0vSU86SvcxXvJltY4Jdw7LnRq8G5pBFznXqnKftMEct6/H+0lqtB
         vOXWSOby/WWEmjGqugn0Fm0E7VFXnuT/VCGuy+GpH6X/Ybd7oufm4jK03QpffUwW1RyD
         j48A==
X-Forwarded-Encrypted: i=1; AHgh+Ro4BosJaLqIrAQnZfmDwZ/Y/o7VFLxIttbTKjx+0kDk78vk9BoqDojV271Hadb0aV4GKgKYWyXjsLoDfmuY8oQ=@vger.kernel.org
X-Gm-Message-State: AOJu0YxwNk+YBS4zUsjoLKRTHUla9HNW0sCOkT/kR348BerrfNU6fJmU
	oBCcQT7qsejkpcSmrHo9oXie6JSUp6/9TKnhKs7rZ6uCTKPMEo1UlWN/
X-Gm-Gg: AR+sD10KBwNyDRIbLOKMdNAccfEHBppdugFBpBoh9482KNhEGZKEPmK7TU1aMeNuF7G
	mgRHYULh50ySJ6JPzntEJ8/fMC9N8O40jEscVJMmuUWvLFY37Fs46WD65p6T63YtAK+Ij3mrbNO
	0c4r8gkzkYy6xFj+4TYldlBZmEYkeS2BG2R1PX/wyQOAw98SKyAMV/aioBU3Di5mcN3y5bABPof
	okBa52zcCOo8++hXs9K8oGbwyT0KVfip811dTHxJ47IH3s9Un0uNvXz92M81YRvbnD98d1ZOOcO
	NXPirRRqCYnaNJjfq67fjNiuI3n1GVyLYZsUt73LYXOLYzj476+kikS8sBkXd2LDxcRn9j0YEje
	bKz9vFOS+qACPlw4g630/6ygJBayvqrN/F22BZTwb1ZpgVYxyOG2C3bo68B/lT26EezlACg==
X-Received: by 2002:a05:6102:3f87:b0:74a:9ac9:792c with SMTP id ada2fe7eead31-74d5e3cb58dmr4397247137.12.1784905601146;
        Fri, 24 Jul 2026 08:06:41 -0700 (PDT)
Received: from houminxi ([72.244.37.221])
        by smtp.gmail.com with ESMTPSA id ada2fe7eead31-74ad32165f4sm7744810137.6.2026.07.24.08.06.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 24 Jul 2026 08:06:40 -0700 (PDT)
From: Minxi Hou <houminxi@gmail.com>
To: netdev@vger.kernel.org
Cc: davem@davemloft.net,
	edumazet@google.com,
	kuba@kernel.org,
	pabeni@redhat.com,
	aconole@redhat.com,
	echaudro@redhat.com,
	i.maximets@ovn.org,
	i.maximets@redhat.com,
	dev@openvswitch.org,
	linux-kselftest@vger.kernel.org,
	shuah@kernel.org,
	horms@kernel.org,
	linux-kernel@vger.kernel.org,
	Minxi Hou <houminxi@gmail.com>
Subject: [PATCH net-next v6 2/2] selftests/net/openvswitch: add SCTP flow key test
Date: Fri, 24 Jul 2026 11:06:24 -0400
Message-ID: <20260724150624.3457427-3-houminxi@gmail.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20260724150624.3457427-1-houminxi@gmail.com>
References: <20260724150624.3457427-1-houminxi@gmail.com>
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

