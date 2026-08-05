Received: from mail-oi1-f170.google.com (mail-oi1-f170.google.com [209.85.167.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ED8693921E0
	for <linux-kselftest@vger.kernel.org>; Wed,  5 Aug 2026 03:45:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.170
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785901513; cv=none; b=QqJBHA/pMnHFPtMfXvECUhiDmCsbd9gN4ZiUcunSewycwtSb8p3G9KsxH27775LW9HJ9O+se5DdE+mkR05gMI1z9ilrewOu2OjPn5of6n/GUvVVn/qxSwxBn/cVClHAxdOndrZEeCAQ1fsU9eaOT2PFGGNisyarlozpbE4vDmes=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785901513; c=relaxed/simple;
	bh=U+z/4iF7dLn7wGHOoBz5qUFcqiQYdBXkAO1mR5snXRU=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=oY47f4Xgm5QwkuoW2FifUZ0hpwHEwyohqfagY2LXQRdYTnYa1HoDDSVsSuyf6eH91twyeipaB1lExlmKU8iBpYbYgpMOy1Gmmg3e4IWcd6gVyzHH6+nBnhvhT/kF/emwzbBFv//53Ty8g0gHIibQ4sk9GvXF6f/QJEy2pYVwUpw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=FB3Lq59X; arc=none smtp.client-ip=209.85.167.170
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="FB3Lq59X"
Received: by mail-oi1-f170.google.com with SMTP id 5614622812f47-4ab70b882c5so398291b6e.2
        for <linux-kselftest@vger.kernel.org>; Tue, 04 Aug 2026 20:45:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1785901509; x=1786506309; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=PHpDSgHOxnQkt6S9yu1hrAJQyOFDAQp/KapLQ0XCJPY=;
        b=FB3Lq59XQiH9AKjU2LiitFEOPs4f6i2zRe7Q0kbLG7FOE55t+oJfELHePIhxN8RWvd
         +v1WmxFSGi9cJ/WaLt5QT1xn3J2CsPRJcxo/JOloVNehf3IIqDj9pPI6BeIK9cb8nkj/
         2PRuHIJfJZwCEBjDVZydTSnUFVq61E8TKAdMm4g9fk4nHyENawFhfTWNMI7fW2V+gtPd
         viAhep50xhKnXsHxM+9iZ3uFYlOrj+h8hHfsCkA0OohSKAqTagcix+ga6SHZ2DpuNqRN
         jANlSCe5jIMWZQSnbzQ/3+eiH0z/uV3Kz+DcboplaBGJLSBcR3WSTrXCtW32Dgbw37g6
         VODA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785901509; x=1786506309;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=PHpDSgHOxnQkt6S9yu1hrAJQyOFDAQp/KapLQ0XCJPY=;
        b=NMOFUdalF9CytM+UXQREqRvHD8wADxC/ViXMcEdGEp8b5KIwM62FxApw7xcusKDjLF
         WUyXlfKyI+ijW5obtndT2giRqduB+2XgN9QhDsCZMDUZPsbcEiatBv0sc6yGovJrJrfm
         B3dWLFWeIwup62ENw0AeO9wHxsVdRKARPg0BVsjcydljTIWdny5A85syemvj1wf3a3cx
         EVYIYp5hVxkoYmzX+rPTMK5d6oZNCNj30nejlFZzoRETG6GE7y3rQImdyh7IQvDuB4A1
         nZHeU/V8NNSUf/30MvGGgT+eTp2Jarbiv7pk8EPsxSfRmMjAzJOERGJLngPS3JRtlCBk
         iOLw==
X-Forwarded-Encrypted: i=1; AHgh+RrkiFV6ivZh1eGdMVAYwC5rCaZhpjJy88X2GKbma5Wxhv7PGQUyHvCOcH728uQyF9Aa9KdqJY5orut28qfZcg8=@vger.kernel.org
X-Gm-Message-State: AOJu0YxjW+VTJonl4LFT5Ejj4meAS6N0tQpdGeBewKQH9AqNJPxUq5TM
	aOO7xFeJ8z+QKYipx18ihCRxnqNpLFPpuTIAuDJsYZGLTUWoRIJfJIw/
X-Gm-Gg: AR+sD13K95hFbqbafwecNFMF7gWNVaA7J0YIqpxo59RbNuq1B1ZeFgls43xw+0R+JJA
	tSdJEeHMO60VGxjWW7m7y3fuGc/A1XT6w9m+cR58Ixr2I5YwlxqJHatjW6wAK7AfQyVMhVUONZc
	0qDoWwJAJEH9yAUQnzBD/z/0LSqbMMY2oeFQCu+91+U+kae6JEkXSyjZGtw3KpbxB9g3XwsaMc0
	IgkoVTh9ydfDEDlu/V9PgyLwh2BLIftriw79IGaOERONZcbRlqyid6Ug6SUjScwdAjyrkAkDg2L
	654CucSrf4YSCg8ZzJAZ9/5qzCs6G16KP1EilW/uTGlXxu4XNkzMYMXRHZZxd+WGCM5djGSGtbL
	vea3TlG9wmiQ9oTz1MV5T9a20ge3XmMyQKxqesipG19B7LYw+NSXm5HhgI5+riUneAv3wddnhZr
	fG175cXinPaQREGCNuNAZuhrcFW3UydVUh1EuhznVjwKDzoDIimPLz+VogoxbmVeBY
X-Received: by 2002:a05:6808:3a0f:b0:495:fecb:bf9c with SMTP id 5614622812f47-4afadf2df58mr2216612b6e.6.1785901509343;
        Tue, 04 Aug 2026 20:45:09 -0700 (PDT)
Received: from houminxi ([72.244.37.221])
        by smtp.gmail.com with ESMTPSA id 46e09a7af769-7f1df2fd13fsm2005505a34.4.2026.08.04.20.45.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 04 Aug 2026 20:45:07 -0700 (PDT)
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
Subject: [PATCH net-next v9] selftests/net/openvswitch: add SCTP flow key support and test
Date: Tue,  4 Aug 2026 23:44:59 -0400
Message-ID: <20260805034459.1460015-1-houminxi@gmail.com>
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
underneath them.

A forking daemon outlives the pid ovs_netns_spawn_daemon captures,
because the child handling an association is not signalled when only
that pid is killed. Start spawned daemons in their own session so
each leads its own process group, and signal the group on cleanup.
setsid ships in util-linux-core; selftests/vsock/vmtest.sh already
calls it unconditionally in this same tree, so this isn't a new class
of dependency for a kselftest shell script.

Also enable CONFIG_IP_SCTP in the selftest kernel config. The config
checker strips underscores before comparing keys, so the entry sorts
before CONFIG_IPV6 rather than after it.

Signed-off-by: Minxi Hou <houminxi@gmail.com>
---
v9:
  - one forking listener for the whole test instead of restarting it
    between phases (Aaron)
  - signal the daemon's process group on cleanup so the children a
    forking listener leaves behind are reaped
  - sort CONFIG_IP_SCTP the way the config checker compares keys

One property of the test worth stating, found by removing the
parse-table hunk and re-running. The probe at the top of
test_sctp_connect_v4 adds a flow with an sctp() key and skips when
that fails. A parser that drops the key gives the same -EINVAL as a
kernel without SCTP flow key support, so a missing parse-table entry
makes this test skip rather than fail: v5 dropped the ovs-dpctl.py
hunk while keeping the test, and that gap is exactly why the loss
did not show up as a failure. dec_ttl, icmpv6, psample and
drop_reason probe the same way, so I kept the pattern rather than
diverge from them here.
v8: https://lore.kernel.org/netdev/20260731062655.4088575-1-houminxi@gmail.com/
v7: https://lore.kernel.org/netdev/20260729064549.3647518-1-houminxi@gmail.com/
v6: https://lore.kernel.org/netdev/20260724150624.3457427-1-houminxi@gmail.com/
v5: https://lore.kernel.org/netdev/20260723084203.3483560-1-houminxi@gmail.com/
v4: https://lore.kernel.org/netdev/20260719162657.3263089-1-houminxi@gmail.com/
v3: https://lore.kernel.org/netdev/20260715015446.530018-1-houminxi@gmail.com/
v2: https://lore.kernel.org/netdev/20260707034718.2717982-1-houminxi@gmail.com/
v1: https://lore.kernel.org/netdev/20260702090908.1253688-1-houminxi@gmail.com/
---
 .../testing/selftests/net/openvswitch/config  |   1 +
 .../selftests/net/openvswitch/openvswitch.sh  | 110 +++++++++++++++++-
 .../selftests/net/openvswitch/ovs-dpctl.py    |   5 +
 3 files changed, 113 insertions(+), 3 deletions(-)

diff --git a/tools/testing/selftests/net/openvswitch/config b/tools/testing/selftests/net/openvswitch/config
index c659749cd086..1c8f0a51905c 100644
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
index 853dbc1b00d7..d11e89b54312 100755
--- a/tools/testing/selftests/net/openvswitch/openvswitch.sh
+++ b/tools/testing/selftests/net/openvswitch/openvswitch.sh
@@ -34,6 +34,7 @@ tests="
 	action_set				set: SET action rewrites fields
 	trunc					trunc: output truncation
 	icmpv6					icmpv6: ICMPv6 echo type match
+	sctp_connect_v4				sctp: SCTP flow key matching
 	psample					psample: Sampling packets with psample"
 
 info() {
@@ -143,13 +144,17 @@ ovs_netns_spawn_daemon() {
 	shift
 	netns=$1
 	shift
+	# Give the daemon its own process group. A daemon that forks a
+	# child per connection leaves those children running when only the
+	# pid captured here is signalled.
 	if [ "$netns" == "_default" ]; then
-		$*  >> $ovs_dir/stdout  2>> $ovs_dir/stderr &
+		setsid $*  >> $ovs_dir/stdout  2>> $ovs_dir/stderr &
 	else
-		ip netns exec $netns $*  >> $ovs_dir/stdout  2>> $ovs_dir/stderr &
+		setsid ip netns exec $netns $* \
+		    >> $ovs_dir/stdout  2>> $ovs_dir/stderr &
 	fi
 	pid=$!
-	ovs_sbx "$sbx" on_exit "kill -TERM $pid 2>/dev/null"
+	ovs_sbx "$sbx" on_exit "kill -TERM -$pid 2>/dev/null"
 }
 
 ovs_spawn_daemon() {
@@ -611,6 +616,105 @@ test_icmpv6() {
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
+	# The listener forks a child per association, so one instance serves
+	# the whole test and the flows stay the only variable.
+	ovs_netns_spawn_daemon "$t" "server" \
+	    socat -u SCTP4-LISTEN:4443,fork STDOUT
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
index f3edd198223f..ce790d936832 100644
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

