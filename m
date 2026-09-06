Received: from mail-qt1-f175.google.com (mail-qt1-f175.google.com [209.85.160.175])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D461523B63E
	for <linux-kselftest@vger.kernel.org>; Sun,  6 Sep 2026 16:53:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.160.175
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788713589; cv=none; b=Q9QpDBnIii3DhhqtUZPz4Rd8aNZWaCCBEAp02gnTkFkW+MBkrwpO+oz33H0HItUT7QY7/jNRh6d9R+aZib6/Sji6uOVGWWypQ4SmCR0tVFMql7AarwM9O4VlF4UX+7tNlzB0HGz9blxs4tkRYupsfpOJDtAnpiPYCue/IW7q140=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788713589; c=relaxed/simple;
	bh=ASPfh3iJ1tX5yUI4Gv1ABWtKsTILmr4muRRC95jwNJ8=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=ho0xcbnfDHuc2OM7BmS7UAsMh7DDad72HDbkDjHrEfjRbVZZTx6RdaGSxXP92a8Vt6vbemr6T/AjP2j8H6C4CbRuzAyB1smz8N3cU6INYzT2WGvH37VOphCSwdnCcUMCErD/j6MjUn8BcWEI8tGj8jkBbgCihHJEf+cN4yKFd5A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=g/32tv0t; arc=none smtp.client-ip=209.85.160.175
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="g/32tv0t"
Received: by mail-qt1-f175.google.com with SMTP id d75a77b69052e-51c08df8513so17185671cf.3
        for <linux-kselftest@vger.kernel.org>; Sun, 06 Sep 2026 09:53:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788713587; x=1789318387; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=lbEkG+jsjWOuH3MATlfWsZQcOIqn6b6BNzWaW7HR5fc=;
        b=g/32tv0tFLWM5OoJxUUC7RYzVzoxORVaOJNfPTIBW0Nketww+WxxRE3xNsa0uFgg1T
         8yWcKG7bqeSjlT+6K6rbLysOWB4S/ooULyRld04QuOCvbFpQ7dozxf/mrB/e9xZkQIG5
         JTgovSHwTJCHFBoDGx0RP6k5Nvb7yKeJFtBxwkjm8xE7sGnkeMDopKXL5XkOSnft5twD
         79JKA3/MY9YokFOGfEmRssHfPNGLDpgfzB9SPq8l/5e2atis3IS7CnTkonNNTKmQCKf1
         Q/lZL6T9yARWWkmoSQMsCSibAJ67nM803zqcgE+kctb81uhFJoHtHRz8oZYREpTRJjFY
         9zZg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788713587; x=1789318387;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=lbEkG+jsjWOuH3MATlfWsZQcOIqn6b6BNzWaW7HR5fc=;
        b=Qm3FWJwEXYrGEwyTrHU6trSuo445ybsR0etbf5GAyvjywUS5oOhWGae/LJnRYIq/xv
         GdnJ7/buVVYD3ckgjSVQIOIuYNDSuV/Ff94lPhGWQHGZsBdhd02XLdJDZRPM2n6RyzrN
         Dgy5q0A1DbsdhKWyL9wpMYImNkpIBvJWhiSuQddwBmbbOxgNw/3cgfHnnq5yeoee66k4
         a0TPrDI86xWibDw6TbuG9xLxFgOdWYdZ3MZQw4xGv03ywhTWCS75DfMAFeHU2CnV/rCl
         2VqxWVC4WCX25jYDXIzvabnK4fplSgbZPuhsQFcVBvYpUFKb9WMUQDuNHCo9ZDXOrD3O
         nevg==
X-Forwarded-Encrypted: i=1; AKwUvBxwdpxa6mw6RIPZGRCtUkJDBUCxPVqiZNHyrUY8qiMv6EUoifA+xCq/iewi2oYM7cWN9F0RewfzxQx9Tuhxj5U=@vger.kernel.org
X-Gm-Message-State: AFuF++mMV/h7hyZDbTSdfQ48BKToIKnu3JwJJUplkOkMLr2knijt8tLO
	eF9i7M6w5m0vuCWkqlNjGyW7cJOwpOGoH/8SE3BLRvP/uZmmUkfzisgY
X-Gm-Gg: AYBFou3Ec3lUpBonLJhbh9NGAnaEUlqOXc4q1+sbRwPn/WkjB8v2RKLnRp0p1U5yZYB
	3whoi6SqYWf0frNRma3pJZPLMt32q5/Cq2LiDrZ3dxTHF2WvPFCuC7oHtrvZgGhF/RSRouXVVyt
	0u4uEItzGM57hiO8NQG+u58FpGakxEAQsYx8sevyyRnvJFmuXkr6ljxXNjOROOAdepun2CgLv7m
	bK4XOBWiXZL/yQ7VPrnhdVi4wsMf65fFvA3zEie2DzhLhyZgXTVaGFWDbwXNafxm4mPIMHQ9WBu
	j2xTP5lCgUuCld1/T6UXZbyDVLnrw8EXFRAYVUkhZcFlmZtlYDfurpstg+FrX64DXNu82B3GW0E
	1ncidbaPrpLJjoKZGEaMckEtgq1774eD4CjixXfxEOXESSRX+2kpVGB1Fow3bZ4CpCQr8yfTnHN
	x+vDtwhYrjwQUQXGITCD++dQ83bnHOCinBD9CcL/rH7SF+mSQDaTZGXMH75h1vxyU=
X-Received: by 2002:ac8:5d11:0:b0:528:3d62:16c8 with SMTP id d75a77b69052e-53054956e2bmr197421281cf.31.1788713586626;
        Sun, 06 Sep 2026 09:53:06 -0700 (PDT)
Received: from houminxi ([163.123.141.225])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-91040595f81sm72195696d6.2.2026.09.06.09.53.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 06 Sep 2026 09:53:06 -0700 (PDT)
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
Subject: [PATCH v3 1/2] selftests/net/openvswitch: add SCTP flow key test over IPv6
Date: Sun,  6 Sep 2026 12:52:50 -0400
Message-ID: <20260906165251.1176875-2-houminxi@gmail.com>
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

The merged SCTP test covers only IPv4. The SCTP branch of the IPv6
extractor (the proto=132 walk after parse_ipv6hdr) and the v6 side of
the SCTP netlink validation (match_validate() requires the sctp() key
whenever ipv6(proto=132) is matched) have no selftest coverage.

Add test_sctp_connect_v6 mirroring the v4 test: bare icmpv6() flows
forward NS/NA, and ipv6(proto=132),sctp(dst=4443)/sctp(src=4443)
flows gate the association in the same three phases (flows installed,
removed, reinstalled). After the association succeeds the test also
pushes a known payload across and waits for the listener to log it,
proving the datapath carries the association's traffic end to end,
not only its handshake. Skips when the sctp module is missing, socat
lacks SCTP support, or IPv6 is unavailable; an association or payload
failure with the flows installed fails the test.

Signed-off-by: Minxi Hou <houminxi@gmail.com>
---
 .../selftests/net/openvswitch/openvswitch.sh  | 95 +++++++++++++++++++
 1 file changed, 95 insertions(+)

diff --git a/tools/testing/selftests/net/openvswitch/openvswitch.sh b/tools/testing/selftests/net/openvswitch/openvswitch.sh
index a31f7fb6882d..0926e304ed88 100755
--- a/tools/testing/selftests/net/openvswitch/openvswitch.sh
+++ b/tools/testing/selftests/net/openvswitch/openvswitch.sh
@@ -34,6 +34,7 @@ tests="
 	trunc					trunc: output truncation
 	icmpv6					icmpv6: ICMPv6 echo type match
 	sctp_connect_v4				sctp: SCTP flow key matching
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
+	ovs_wait grep -q "$payload" "$rxfile" \
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
-- 
2.55.0

