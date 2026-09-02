Received: from mail-qk1-f169.google.com (mail-qk1-f169.google.com [209.85.222.169])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1371D49CF2D
	for <linux-kselftest@vger.kernel.org>; Wed,  2 Sep 2026 12:51:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.169
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788353518; cv=none; b=ExZBYjSOyUz5V4CINAN3tiQoOAk62Rxaur6znkxI+7GEZXNjWlHhWqYJguzScTLRHPvfm04TpBV3hNchZ4lS91fI7+zNAeDg/+1plNzBZaFGoB6LH462ipo9yzYOj1COaWe2Amo9wVxiXf0aHXzDfv8Rc2AzjLpV1qgyJLiCCZw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788353518; c=relaxed/simple;
	bh=jBNvlzUaRiS232EjWIrRtjgtFSrGAKhiDNQV/F9j27Y=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=XxhLcILfNMQz0bVXwGlGW+5ZgTn1EChYK8ct5ENPlPBFjEsWXHHSvlqkfLmrSwEFh6f+T2Y4Pvj+HbCjmyaqvI7Xl0bJDuFsR3otif9UwYpfapM1J07lRzOmweoWwrW+v/OlUGjjKddKktlaVfGFp3Ny41iuMV7sdvT0GLkKYBk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=cbG7AaUp; arc=none smtp.client-ip=209.85.222.169
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="cbG7AaUp"
Received: by mail-qk1-f169.google.com with SMTP id af79cd13be357-93900ed2925so100305985a.0
        for <linux-kselftest@vger.kernel.org>; Wed, 02 Sep 2026 05:51:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788353514; x=1788958314; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=MjuXSyizsZB4ec8YrEJh10x9e4pUjwQ2Rq3ifalYYck=;
        b=cbG7AaUpWdHIStdUuRAtca+FgOw0lu3ztURFIktkcYnoxdachXrjrau2AHqNWkVR5z
         ag9NNeB+fJcXOmO1cDelVdJVAckDxSE9bi2ZZulqe+Jzpqj+PWCESGsDq7HN3w+UJIf5
         m+x9NqBTCDv4JCGvZfF2dF5Y6YEexhekc9FR/5uQOqR0ulsziTf/8PNGQTB3VCdSs4iL
         NLxFwKxt8aTcPRipG68h+zyBJC0Q9X3cuerzNNHmLWkFWyWBAmEzWoUtxn8VYObSxTJr
         tnme+kLIAXDDrFnRvQ9NXPWvKS1MR/dtca7W4Utno6d1FT+YSUEYYkLFKdbcPmP84KPC
         NaxQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788353514; x=1788958314;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=MjuXSyizsZB4ec8YrEJh10x9e4pUjwQ2Rq3ifalYYck=;
        b=cThsU149XKLSZaskzStGruR1vWhehSCy94saOGSQeSaiYx/Ncl2gEfF0c2rRalhFoH
         Bk6rGxMRF1KoPgevbTzI+idT1RCIBfSwdzVThlIhghKEvcCG82E/3qrZHUDLOQ6rPHzZ
         B9nlDaG0TPHRRXs5aR2LRVGkNi0HeG9VQ1J7VmSNEQ2cG9ce8U8d7n+nS/r7sM1VHWOu
         hD+E1ekq7SBJ/MzM64tCVKPNZmZneN3n4yAjVbh6vnLkpp2su/m61xqtufVD72AsBe8R
         lMWStwllZf+mpWJlZ5D91XQ76SLwPz3SAGz/PyIVFr696Yj43jtPmn8HzViy9uAk9cGu
         Y/Lg==
X-Forwarded-Encrypted: i=1; AHgh+Ro4bf7rgCIhWp1qNl4cybBshaB2ieDzi4OV3eo0G41qz4MlyF9Isaq/F6eAjqrDV3u3oIE7p4PAsjAAeHjIMoo=@vger.kernel.org
X-Gm-Message-State: AFuF++lxpdlT7NU2fT6CyhQZeSr0LIrvQ2iE7eWf615D4KYUmLPA+4Jh
	qyKbFJlQfIdylgWRWQvx4sqRnw+jjjq3Ty15JO46GLvd0mdX/bJVPFig
X-Gm-Gg: AR+sD11AIUOZwwmlt015Zcm3LJK9JNbl8tFN2XjHHH6a1DCbB8ib6YuDrk065FahIf3
	fxF9o0iZjWtincVZIjf2dEVVM0OA7gr8/NlQG8SRPD4RMOl23m3g/Jp6367kwgkjOW671ePclhG
	l7j+dDTzdS81/SQH7NgahCh2JBAHbI8Z9CwkX8A0l/sc0F3jfUh0itIq7h0RZyccONTbvHdf5ZE
	Z4uC60v6b4OBi01VNnq4wqyuEMT0W6mDYE8COg6eKW7r22V/gh6repDyJlF+Ki9cjXAcFJ1PHUF
	o03T+YGbJoFPuUPYJpvtxHiX6FeNaGUN/KuG3K7rD3eLyKB0gZgtw10nDS4r3ve1WILSGkFLH2R
	rZoGYDgoAYB+ZX+Wz/q+O6lWAjgrVNKTuFvkFIW/5Bi/dVF6sb6sOUxRnd7R6cUZBZk1y/92NZR
	Z7XGJjVI965hVVtLh4Cic1L6ykpm0DEvBcR7tDcMiePh/LR9iyaDUuWw==
X-Received: by 2002:a05:620a:90d2:20b0:936:df48:d507 with SMTP id af79cd13be357-93960e05a05mr420981885a.18.1788353514371;
        Wed, 02 Sep 2026 05:51:54 -0700 (PDT)
Received: from houminxi ([61.170.217.176])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-9395f35d823sm198612785a.25.2026.09.02.05.51.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 02 Sep 2026 05:51:53 -0700 (PDT)
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
Subject: [PATCH net-next v2 2/2] selftests/net/openvswitch: add SCTP flow key test across conntrack NAT
Date: Wed,  2 Sep 2026 08:51:33 -0400
Message-ID: <20260902125133.1828572-3-houminxi@gmail.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20260902125133.1828572-1-houminxi@gmail.com>
References: <20260902125133.1828572-1-houminxi@gmail.com>
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
v2: rebased onto current net-next, no code changes
 .../selftests/net/openvswitch/openvswitch.sh  | 86 +++++++++++++++++++
 1 file changed, 86 insertions(+)

diff --git a/tools/testing/selftests/net/openvswitch/openvswitch.sh b/tools/testing/selftests/net/openvswitch/openvswitch.sh
index 06bd98d80a084..d5acdca0a0ac1 100755
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

base-commit: d0ec95a8a4e79f2fd6063fc8932415db8c227689
prerequisite-patch-id: a3848bf8ef3803b528f964b8e866dd3622e5b154
-- 
2.55.0

