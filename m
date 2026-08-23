Received: from mail-pj1-f47.google.com (mail-pj1-f47.google.com [209.85.216.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 87D4D37DAD7
	for <linux-kselftest@vger.kernel.org>; Sun, 23 Aug 2026 02:09:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787451002; cv=none; b=p1a7XeYea/xinpjkb5ILle4s8gGxYKi3Z6yDduStcIP61Fb0vOBmZvYZoqA/wF7ISvdiJf91l9wBt1IeN1sesumn9oL9zX0z1qqvlk7Usq4k0ykQzqD4DEWD5LrBiKqoDO9pgNqZNsD7Fj2Guu0JEBqndYHlxv3A8ywr/7cycfc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787451002; c=relaxed/simple;
	bh=2Ty2mpcEhGgNSz5GN77057gLiDTsvFjbxF+GBfR/yuc=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=YyoTRH5Xu3aW2vCHpqvP2kXtMOk3jNexKU3OXOUJ56DwIWGxzWzxD39qrIC6ODMb7ttHuB900ikRGf5ayNzC9jkJiwzxzirVCQpjTwZPMe/wQWyW7v1l6g63Ya54p1uj45TQuzWgC6iJJPZIQI/6DDjtyiTqKGKc5SN4OGk1TY0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=M7YvbYXb; arc=none smtp.client-ip=209.85.216.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="M7YvbYXb"
Received: by mail-pj1-f47.google.com with SMTP id 98e67ed59e1d1-38125cebfdaso3262758a91.1
        for <linux-kselftest@vger.kernel.org>; Sat, 22 Aug 2026 19:09:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1787450998; x=1788055798; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Ka7AUYqkvnad6cVVx0OUSmQE7kC7pkR2H7Mh+6aLu4I=;
        b=M7YvbYXb01wsN0k4MON0ACZPg+L7J+GxWH43aEXWQo9++o683dSQAStvXF2sSsTawV
         k/IuPJW1VHcjmZLmIdOPiZ7LDi+YaFv6QhlCCgzLm2IDQDE4bDALHinXzTQgz99ZWFwj
         OvF2nRVU8cAIHka4ADj4LSWsnwI2Slyb/TUTg2yGzSBueZa0tqhXtcCKGMTricN1Hak3
         VXDAKAda6A45z6A0T8qdUC8eXIWIxF1vWDp8iRDNHdA/jVtkPJ62SQQav11/TCQXrVFe
         5oRj1oQvu+vgVzuV/+Ion95pCOnOnYaNX0kC6qFWBswH3MfyVTktEFVSDTk8LqVnuDOQ
         TedQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787450998; x=1788055798;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=Ka7AUYqkvnad6cVVx0OUSmQE7kC7pkR2H7Mh+6aLu4I=;
        b=klJn/vHmKShxuSHq79u++oFyFzVCk8EgC1ruWFX2z8K7FR/CQEaDjpJJ3psk7QKBA2
         BoNt01SckgYoHrhVNERmOBPpfUw8tG9C5wgZX/RIDSBJZWux4A0H0F94kb1n/bZ9W3N+
         Idto8rLsF/pDTL2t2DDMV6UeoBGMNF39p8/VK98pe3E3pBjVe1f6y+pbqp49TD6UrlaP
         bR/ta/580OncaM6Kytb7I6GHrcstWQHsCkJx++LobuusqG/uUDPMEOhLkcm9VYqwRME1
         0OesOS27vAF3sdp6NtyLDZzLxVhSjt2Kwvavo0jqlHeyYr0Tn6ApfuowtTwJMHy0Kuat
         SENw==
X-Forwarded-Encrypted: i=1; AHgh+Rq8AWTAL3xJ82wf2kn17k4t8wpp2Y6QUh4BRDEmpTRVsKUQKytnCCFDojXhXt9p0cm/kukfq4e77PY9wQKT0hc=@vger.kernel.org
X-Gm-Message-State: AFuF++mbVTcNp/JdFb6cepOSXu7w5mCchYbK4ieU0QRywNVI/KSN5+xn
	FKCaDTiETwDNfGdJOc21Nxcixsh++J+V/wl1YZOr8Ih91gagXDEHIovM
X-Gm-Gg: AR+sD105wn9qRIVFpffAECIObgXTFru8BKrlnmzygrhg8P/9vN26Gd431zjEVO+gRBI
	6Y81L4tqnZU9FHVayIYAdexVmJ9RCQ4mUjqROhOf9hJwq5dr/gWyPT14PphnaOTHLlqbLKn4X1I
	NA1/bLVRRBymyW3J+G2E1nfDV2Y0itXXHBdXvpubkNE13OiASTvHgRGtX6x0t4eWOwc9qtkh6Yt
	KRRkx+UJDULPtSlOIgf6BxLV/7T++ajFPxWJDzvL5cyjOcmnwshmWjg9MqMeZsmwUd7LMW/fQlx
	DD40og23/L6d0AQUuGY5gwPFL4HQ9Uz8Jj6lmN4+sL1pDkL5+7C0lJwWVBLn2807gHeMmpmlGsQ
	r9C/pn9H3Hu628MmKqs6dXKyIn5iMJEbiozkIRPbjKZKDZgn7qCFGtsq8EqUKUHgn7GQfjY+8Jo
	sXDJNnEK5yTxX9bLWLOSojUdpjAri/paQYLpVXaXSzLMEnMf53tDrJ
X-Received: by 2002:a17:90b:1d49:b0:38e:70d5:b12d with SMTP id 98e67ed59e1d1-395c3566ba6mr33799117a91.6.1787450998171;
        Sat, 22 Aug 2026 19:09:58 -0700 (PDT)
Received: from houminxi ([61.170.217.176])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-141861732f8sm11371949c88.10.2026.08.22.19.09.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 22 Aug 2026 19:09:57 -0700 (PDT)
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
Subject: [PATCH net-next 1/2] selftests/net/openvswitch: add SCTP flow key test over IPv6
Date: Sat, 22 Aug 2026 22:09:41 -0400
Message-ID: <20260823020942.3101898-2-houminxi@gmail.com>
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

The merged SCTP test covers only IPv4. The IPv6 extraction path
(parse_ipv6hdr walking extension headers, then the proto=132 branch in
key_extract) and the v6 side of the SCTP netlink validation have no
selftest coverage at all, so a regression there would ship silently.

Add test_sctp_connect_v6 mirroring the v4 test: NS/NA forwarding flows
stand in for ARP, and ipv6(proto=132),sctp(dst=4443)/sctp(src=4443)
flows gate the association in the same three phases (flows installed,
flows removed, flows reinstalled). After the association succeeds the
test also pushes a known payload across and verifies the listener
received it, so a flow-key bug that matches handshake packets but
breaks DATA chunks is caught too. Skips when the sctp module is
missing, socat lacks SCTP support, or IPv6 is unavailable; an
association or DATA failure with the flows installed fails the test.

Signed-off-by: Minxi Hou <houminxi@gmail.com>
---
 .../selftests/net/openvswitch/openvswitch.sh  | 97 ++++++++++++++++++-
 1 file changed, 96 insertions(+), 1 deletion(-)

diff --git a/tools/testing/selftests/net/openvswitch/openvswitch.sh b/tools/testing/selftests/net/openvswitch/openvswitch.sh
index a31f7fb6882d..06bd98d80a08 100755
--- a/tools/testing/selftests/net/openvswitch/openvswitch.sh
+++ b/tools/testing/selftests/net/openvswitch/openvswitch.sh
@@ -33,7 +33,8 @@ tests="
 	action_set				set: SET action rewrites fields
 	trunc					trunc: output truncation
 	icmpv6					icmpv6: ICMPv6 echo type match
-	sctp_connect_v4				sctp: SCTP flow key matching
+	sctp_connect_v4			sctp: SCTP flow key matching
+	sctp_connect_v6			sctp6: SCTP flow key matching over IPv6
 	psample					psample: Sampling packets with psample"
 
 info() {
@@ -700,6 +701,100 @@ test_sctp_connect_v4() {
 	return 0
 }
 
+# sctp_connect_v6 test
+# - sctp(dst=4443) matches client-to-server INIT
+# - sctp(src=4443) matches server-to-client INIT-ACK
+# - icmpv6 NS/NA flows forward neighbour discovery
+# - remove flows and verify connection fails, reinstall and recover
+test_sctp_connect_v6() {
+	local t="test_sctp_connect_v6"
+	local v6="eth_type(0x86dd),ipv6(proto=132)"
+	local payload="SCTP6_DATA_OK"
+	local rxfile="${ovs_base}/${t}/sctp-rx.txt"
+
+	modprobe -q sctp 2>/dev/null || return "$ksft_skip"
+	socat -V 2>&1 | grep -q "define WITH_SCTP" || return "$ksft_skip"
+	[ -e /proc/sys/net/ipv6 ] || return "$ksft_skip"
+
+	sbx_add "$t" || return $?
+	ovs_add_dp "$t" sctp6 || return 1
+
+	info "create namespaces"
+	for ns in client server; do
+		ovs_add_netns_and_veths "$t" "sctp6" "$ns" \
+		    "${ns:0:1}0" "${ns:0:1}1" || return 1
+	done
+
+	ip netns exec client ip addr add fd00::1/64 dev c1 nodad
+	ip netns exec client ip link set c1 up
+	ip netns exec server ip addr add fd00::2/64 dev s1 nodad
+	ip netns exec server ip link set s1 up
+
+	# NS/NA forwarding
+	ovs_add_flow "$t" sctp6 \
+	    'in_port(1),eth(),eth_type(0x86dd),ipv6(proto=58),icmpv6()' \
+	    '2' || return 1
+	ovs_add_flow "$t" sctp6 \
+	    'in_port(2),eth(),eth_type(0x86dd),ipv6(proto=58),icmpv6()' \
+	    '1' || return 1
+
+	# SCTP port matching: dst for request, src for reply
+	ovs_add_flow "$t" sctp6 \
+	    "in_port(1),eth(),$v6,sctp(dst=4443)" \
+	    '2' || return 1
+	ovs_add_flow "$t" sctp6 \
+	    "in_port(2),eth(),$v6,sctp(src=4443)" \
+	    '1' || return 1
+
+	ovs_netns_spawn_daemon "$t" "server" \
+	    socat -u -t 1 SCTP6-LISTEN:4443,fork \
+	    OPEN:"$rxfile",creat,append
+	ovs_wait sctp_eps_has server 4443 || return 1
+
+	info "verify SCTP association with port-keyed flows"
+	ovs_sbx "$t" ip netns exec client \
+	    timeout 3 socat -u STDIN "SCTP6-CONNECT:[fd00::2]:4443" </dev/null \
+	    || return 1
+
+	info "verify SCTP DATA chunk crosses the datapath"
+	ovs_sbx "$t" ip netns exec client \
+	    timeout 3 socat -u STDIN "SCTP6-CONNECT:[fd00::2]:4443" \
+	    <<< "$payload" || return 1
+	grep -q "$payload" "$rxfile" 2>/dev/null \
+	    || { info "server did not receive SCTP DATA payload"
+	         return 1; }
+
+	ovs_del_flows "$t" sctp6
+
+	info "verify connection fails without flows"
+	ovs_add_flow "$t" sctp6 \
+	    'in_port(1),eth(),eth_type(0x86dd),ipv6(proto=58),icmpv6()' \
+	    '2' || return 1
+	ovs_add_flow "$t" sctp6 \
+	    'in_port(2),eth(),eth_type(0x86dd),ipv6(proto=58),icmpv6()' \
+	    '1' || return 1
+
+	ovs_sbx "$t" ip netns exec client \
+	    timeout 3 socat -u STDIN "SCTP6-CONNECT:[fd00::2]:4443" </dev/null \
+	    >/dev/null 2>&1 \
+	    && { info "connection should fail without flows"
+	         return 1; }
+
+	info "reinstall flows and verify recovery"
+	ovs_add_flow "$t" sctp6 \
+	    "in_port(1),eth(),$v6,sctp(dst=4443)" \
+	    '2' || return 1
+	ovs_add_flow "$t" sctp6 \
+	    "in_port(2),eth(),$v6,sctp(src=4443)" \
+	    '1' || return 1
+
+	ovs_sbx "$t" ip netns exec client \
+	    timeout 3 socat -u STDIN "SCTP6-CONNECT:[fd00::2]:4443" </dev/null \
+	    || return 1
+
+	return 0
+}
+
 # psample test
 # - use psample to observe packets
 test_psample() {

base-commit: 91ec2035134982b98fab0609a9fd8480e8217dc1
-- 
2.55.0

