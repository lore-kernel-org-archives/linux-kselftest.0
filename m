Received: from mail-pg1-f172.google.com (mail-pg1-f172.google.com [209.85.215.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C2ABB1A681C
	for <linux-kselftest@vger.kernel.org>; Sun, 23 Aug 2026 02:10:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787451007; cv=none; b=OyR90t47G/1BpPbpkqrSeZCffHipuuyN44t2kbuQAB4DwFYeQ6aJWC1FZE1oPT3tr3egUalg7YMSYe1aVn8ggWXh3dblrufP0qkM2lsA7/McB5CzbFmhcL2/1rwFAK74hkuEsK0yXOHHWaY6Oou6rlnmm0CSaPO+B1CSyayF8TA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787451007; c=relaxed/simple;
	bh=5ZPukh/6LctPDDPDNCfHtOkGcl/OJW8EN+TJ+HoVGXs=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=IokTPrqZHxp1B9pdrwkpqJaNnGEAAPi1O+1s0dVJBlwHUWL8fCuVbwKDHDmBJQIkpWNJkEDQet6p+JS3hBYo1YXNFsq3UseqgCZpT8BChSkOnkZnQvdRDTgHy7VhSEGDe4Snsf7xMvyLA9iPe4QsWH/5N2nFuqGKPb8fzlQRs7w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=bOhzwPyO; arc=none smtp.client-ip=209.85.215.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="bOhzwPyO"
Received: by mail-pg1-f172.google.com with SMTP id 41be03b00d2f7-c999f162c9aso1643722a12.3
        for <linux-kselftest@vger.kernel.org>; Sat, 22 Aug 2026 19:10:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1787451002; x=1788055802; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=scTvdoEp04s2Y6O6t+Ud8V+kZB5jubb1ONRHy8MkK5E=;
        b=bOhzwPyODkDmNwLMJtQXpJwvZDav/WnZVNOkk7Kbm5a653fSu2rzdN6CehhAFDe8yX
         x8sbLjuArydxj2j8bFihcZSFK7YVyJISyHE66b7Mh+ADhKgWv9NDSfQW1dEqkJPTjy/d
         3rb5Y2GC7N0WKho+vhA5Iku6hi8IX9DgnWzVuAnmwE+yUWW8w7I2zfbtgppGTEc1IP4B
         vtlj6xc9ajAKzdimWJEWUakdsGWlhh5t8cbriWbgQEqnfIuwSCY5GcC2deGt30Er5LCM
         ZDe2OPdFx/dNZwnX+S1E3VLyBKgPlblNejmpbSgaTpkEBplNxE4JIUMpe9lwl1grfA/m
         JAFQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787451002; x=1788055802;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=scTvdoEp04s2Y6O6t+Ud8V+kZB5jubb1ONRHy8MkK5E=;
        b=Sl20ABCZYmrp5HvGdHY4TVFzChnsaP6BvjaSWejFpgFiDEZVAW4cdphxcX6vyhEOW+
         oFeZmddBo9VvC2gCNCwhiDXWLiX1S4qvuQN+54mlcJ8OavlXu28tnfDKrvjwo3oYGDPD
         t7kmiafCEWkP2lnDBsj9k3gy8Mst8C7C0SSTKqeAr/i7SR/eMDX4+d3zAC7GQsFgiwgG
         P/Xu0NlGhjVRaRJVXgK/KqZxSO9k6Xt5zJvUpzVm0llElAvi/KJ89sLOWRxrkhw6nrgx
         0AAm3HMwI4jjRa6g+FtypjvtVv/gGWSP7kVvPtFlR5okkw9s89723+sWR3G3sH2iSIAK
         Gntg==
X-Forwarded-Encrypted: i=1; AHgh+RpScn6ZuOmgX5J1Ia9n+lD/I7I1h/zxONTLy05ZuPaz37e0O2FII65KpX5dAP1tmrtOS98D4WD3gAzt5BJ0wwY=@vger.kernel.org
X-Gm-Message-State: AFuF++kNIQvZ/VcKoevMZGnu/Fk3DaMoxQAYI9zHiidi+OLVqHHib6ip
	HQdh+s4tlQEUlfIc8h75u8zxMrBXgZvf0aNIP+L+hYn59EPcsxXkWSIG
X-Gm-Gg: AR+sD11L/vkuvyO14wAJm8DtQo3nQx74TW1LWqdpCsfENgW3GGqfPTPL2TaNzuLz5Gx
	DG44i/12alL7CVXnqLNOxygNSSQkBsBHi8hJiuXefPBOxIsbvHT6cD1U+5/TKFsdiXe07XcQvKu
	+i48A0uQBiH2353++gBIDeTZl1LwX4KPdmKG5Q7L0/vFCb92GFM4afXSg+7T+DumpAbEZZd7hR1
	6UyvpAHykRa1Ov49oIobOCURozAf+bm7wGdNCVKjE97hy3GW8jYvUvudcYv/3rW8f7WWPTtvP2d
	2dxe3h8/SFioNydgJtCfPxCl+yz7FLtStuGf70PiPiZyox8AWfpOjfEFEqmFq3K34oNt1udXLBF
	uEDFl3gJv0eDKnblmYVAIpwjwcetQELPppp2x12tbntOAtUJxuzf0+D+Mi6DLdCyRoEiUwd8MQu
	bHlCFggQ3O0truNlnHnNiuI9ItX1mG6dDfXFurn4g60yQzPdEo2yV7
X-Received: by 2002:a17:90b:3985:b0:380:71eb:4014 with SMTP id 98e67ed59e1d1-395c357d3a3mr27931519a91.15.1787451002184;
        Sat, 22 Aug 2026 19:10:02 -0700 (PDT)
Received: from houminxi ([61.170.217.176])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-141861732f8sm11371949c88.10.2026.08.22.19.09.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 22 Aug 2026 19:10:01 -0700 (PDT)
From: Minxi Hou <houminxi@gmail.com>
To: netdev@vger.kernel.org
Cc: aconole@redhat.com,
	davem@davemloft.net,
	dev@openvswitch.org,
	echaudro@redhat.com,
	edumazet@google.com,
	i.maximets@ovn.org,
	i.maximets@redhat.com,
	kuba@kernel.org,
	linux-kernel@vger.kernel.org,
	linux-kselftest@vger.kernel.org,
	pabeni@redhat.com,
	shuah@kernel.org,
	horms@kernel.org,
	Minxi Hou <houminxi@gmail.com>
Subject: [PATCH net-next 2/2] selftests/net/openvswitch: add SCTP flow key test across conntrack NAT
Date: Sat, 22 Aug 2026 22:09:42 -0400
Message-ID: <20260823020942.3101898-3-houminxi@gmail.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20260823020942.3101898-1-houminxi@gmail.com>
References: <20260823020942.3101898-1-houminxi@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Conntrack NAT rewrites the packet between the first-pass and recirc
passes, and OVS re-extracts L3/L4 on the recirculated skb via
ovs_flow_key_update_l3l4(). Nothing in the suite exercises SCTP key
extraction on that post-NAT path: the existing nat test drives TCP
over nc, and the merged SCTP test has no conntrack in the path.

Add test_sctp_nat_connect_v4, reusing the nat4 fixture with the SCTP
socket pair from the v4 SCTP test: untracked ipv4 traffic hits
ct(commit,nat(...)),recirc, and the post-recirc flows match
ct_state(+trk) with the extracted sctp(dst=4443)/sctp(src=4443) ports.
A probe for the SCTP conntrack sysctl turns a kernel without working
SCTP conntrack into a skip instead of an opaque timeout. After the
association succeeds the test pushes a known payload across and
verifies the listener received it, so a flow-key bug that matches
handshake packets but breaks DATA chunks is caught too. If ct+nat is
accepted but the association or DATA fails, the test fails.

Signed-off-by: Minxi Hou <houminxi@gmail.com>
---
 .../selftests/net/openvswitch/openvswitch.sh  | 86 +++++++++++++++++++
 1 file changed, 86 insertions(+)

diff --git a/tools/testing/selftests/net/openvswitch/openvswitch.sh b/tools/testing/selftests/net/openvswitch/openvswitch.sh
index 06bd98d80a08..d5acdca0a0ac 100755
--- a/tools/testing/selftests/net/openvswitch/openvswitch.sh
+++ b/tools/testing/selftests/net/openvswitch/openvswitch.sh
@@ -35,6 +35,7 @@ tests="
 	icmpv6					icmpv6: ICMPv6 echo type match
 	sctp_connect_v4			sctp: SCTP flow key matching
 	sctp_connect_v6			sctp6: SCTP flow key matching over IPv6
+	sctp_nat_connect_v4		sctpnat4: SCTP flow key across conntrack NAT
 	psample					psample: Sampling packets with psample"
 
 info() {
@@ -1186,6 +1187,91 @@ test_nat_connect_v4 () {
 	return 0
 }
 
+# sctp_nat_connect_v4 test
+#  - SCTP association crosses a ct(commit,nat(dst=...)) translation
+#  - post-recirc flows match ct_state(+trk) plus the extracted SCTP ports
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
+	# Check if the ct action can be configured.
+	ovs_add_flow "test_sctp_nat_connect_v4" sctpnat4 \
+		'in_port(1),eth(),eth_type(0x0800),ipv4()' \
+		'ct(commit),recirc(0x1)' &> /dev/null
+	if [ $? == 1 ]; then
+		info "no support for ct action - skipping"
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
+		"ct(commit,nat(dst=172.31.110.20)),recirc(0x1)" || return 1
+	ovs_add_flow "test_sctp_nat_connect_v4" sctpnat4 \
+		"ct_state(-trk),in_port(2),eth(),eth_type(0x0800),ipv4()" \
+		"ct(commit,nat),recirc(0x2)" || return 1
+
+	ovs_add_flow "test_sctp_nat_connect_v4" sctpnat4 \
+		"recirc_id(0x1),ct_state(+trk-inv),in_port(1),eth(),eth_type(0x0800),ipv4(proto=132),sctp(dst=4443)" \
+		"2" || return 1
+	ovs_add_flow "test_sctp_nat_connect_v4" sctpnat4 \
+		"recirc_id(0x2),ct_state(+trk-inv),in_port(2),eth(),eth_type(0x0800),ipv4(proto=132),sctp(src=4443)" \
+		"1" || return 1
+
+	ovs_netns_spawn_daemon "test_sctp_nat_connect_v4" "server" \
+		socat -u -t 1 SCTP4-LISTEN:4443,fork \
+		OPEN:"$rxfile",creat,append
+	ovs_wait sctp_eps_has server 4443 || return 1
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
+	grep -q "$payload" "$rxfile" 2>/dev/null \
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

base-commit: 91ec2035134982b98fab0609a9fd8480e8217dc1
prerequisite-patch-id: a3848bf8ef3803b528f964b8e866dd3622e5b154
-- 
2.55.0

