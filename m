Received: from mail-ot1-f47.google.com (mail-ot1-f47.google.com [209.85.210.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5481F4EA36F
	for <linux-kselftest@vger.kernel.org>; Tue, 12 May 2026 06:39:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778567970; cv=none; b=gmBU2AzKHqghWFNaeNfocmcayMYdMyfFtTp45AFfCZG3k7CG8b6ExA2tZ8t/4+3FRtnS2ZdGt6h14sGVB0kXRWdsFzImwTWb5W8bxWGgvyNN97yuCBjy32wkzhRL2IW8Zhz5fJPf6sdujVSvjzTTH726HO7Pec3liYwrEDwjUiM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778567970; c=relaxed/simple;
	bh=GQeOcJ4x5WRRquDnsAee0Zm2Twr2g7DVIbPAVoTtP+o=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=kSnB3tqrsGHocT11LffKL6J/6TChmxZQEKp294LKhaB0jmqcbEzxoO6ddsCGV7rXEQ7JG5GECNT77YvFsXQVzWWa+GxFwF0CpOn405rhSPEdLKv9I314kvQ8hIEUzi7+C+Xp3afuo4e5DGtgZD6JxnhbD5lbuLb2OmEv0Yx9bPs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=QbCCn2/o; arc=none smtp.client-ip=209.85.210.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="QbCCn2/o"
Received: by mail-ot1-f47.google.com with SMTP id 46e09a7af769-7de4e6c5a30so5627825a34.0
        for <linux-kselftest@vger.kernel.org>; Mon, 11 May 2026 23:39:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1778567956; x=1779172756; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=CzF0t66wEszl2BcU24gnomwmHovPmL+M9vg4PdgRwyk=;
        b=QbCCn2/o24e7gJIgYYugmJ3OwDw7113fUb0SMJUpYXErZhIRwXp6LOVWgqTF3teBfE
         iZXSbTUwt3g/5uim69DPkAC5HXRZ1zyJDUAgMbW5tR2sOX7Yl8wJXokkSJVFNwsQ2xwR
         S+GCf4W4rI8tvAc+F7zZZiBWDY/YAmTIslrJeMrF4Fd9Cin8Ys+Z2DgFfh6JmQuhD+vZ
         iJunyOmOdnW9Wk9MQSSpK5RSzSj7mi2Lk1gWwQGnMExQ7hxWv2Y5DkX5smU/m9aji/Ws
         3OLOxMuNj5zWFsH2UnIP59fnpKRM6y/50TENEwPEgOEBY6Sj5qsXIVTbCqSGWre9kurV
         VC7Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778567956; x=1779172756;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=CzF0t66wEszl2BcU24gnomwmHovPmL+M9vg4PdgRwyk=;
        b=eNr+ni/oWj6BRIpLA9iYhKv4ht6wu8S+G2vlqcujooU0DkAT98+ed8kNJkdrC/sXUv
         xUkgqAqDR9BPehI23/1p+VaiVPDEWXzMjbUSEJUNCHv5Pgd13Y/scMqPr6DPp5PVJP62
         JGtWBuz0ELd9QR/C87IFmOANH9FCqQVc5ccObIm+buhC/zC5Bo/etSDsnvvBgDXIKgRp
         3y401HwxGKQ7+do3iHG17MdI6mUnRJRwHg54uH3JQGJnIf5OKqIOekQaEw6fWb5KpLuk
         I8utpYkhZy5TKyjel01uk/de/W4Told24w6cXcTOUrTVzwj9AogBT36LFegWjmmANh+5
         eOEA==
X-Forwarded-Encrypted: i=1; AFNElJ/6SocezzoPgQtzuKlCdIm9Wp8qZyP5io6XHsp895wt2OyKI0n3OpARcNPu11uzh1ib7MHIR+nEQ77QQDHXuUM=@vger.kernel.org
X-Gm-Message-State: AOJu0YyaLTgYuBiuDoD2mpagte4BPX+C449Ew0ypoUOWTyK423aGf75l
	nbIJRlJSRDHJoNP/zxWfMiSvLOcNn/2wLY5N4N7SsHjeT1xbfMjKTVHP
X-Gm-Gg: Acq92OGITuhxDQXfoANvEnOCw6JoJlfV1j7zPPpgarLEqJXAFF3dCn6/ONzSe2MrpEL
	8xxfvjnnYrdeNwikwwEAQYqmYvKfiZ+h1uDDWHJOXjavtSIAlbDb1fENdRfHd/c95XLK5HzXUsc
	jYoEiHncXK23WrzGq/f2LDVnavMpGV4mP0rCUXPXRq41YRU0HpjfkRQJW1n9dNNS3aqTOhHRBkx
	ipKDMOSF9eq51fc5oC4q+nlv3prPk7C74kYGbX1I9YFkUNmz8YWceluXsqAZs5rdFQzOn/PFLMN
	tjb8UHCTSAbRrR60VMPntGlqShb1+GDcQ3M+Ju7CqTIulmKwOVSI3UiL51Z0AUbK1Vs/4m6fGtN
	jDIUTeibqaxzBl3kEZe/Qa8ukTAyXm1gw4k4mP9sD1Dw4bNI2j4M9HWu2gZY4MOilY3OqnPHyW9
	YKm70AA2vhWno6fFcqCcaWJkSi1g==
X-Received: by 2002:a05:6830:6d48:b0:7dc:d0cc:922 with SMTP id 46e09a7af769-7e1df194678mr16537449a34.27.1778567956356;
        Mon, 11 May 2026 23:39:16 -0700 (PDT)
Received: from houminxi ([72.244.37.221])
        by smtp.gmail.com with ESMTPSA id 46e09a7af769-7e367d9d788sm8183783a34.24.2026.05.11.23.39.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 11 May 2026 23:39:15 -0700 (PDT)
From: Minxi Hou <houminxi@gmail.com>
To: netdev@vger.kernel.org
Cc: dev@openvswitch.org,
	linux-kselftest@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	aconole@redhat.com,
	echaudro@redhat.com,
	i.maximets@ovn.org,
	davem@davemloft.net,
	edumazet@google.com,
	kuba@kernel.org,
	pabeni@redhat.com,
	horms@kernel.org,
	shuah@kernel.org,
	Minxi Hou <houminxi@gmail.com>
Subject: [PATCH v10 2/2] selftests: openvswitch: add pop_vlan test
Date: Tue, 12 May 2026 14:38:50 +0800
Message-ID: <20260512063850.1133046-3-houminxi@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260512063850.1133046-1-houminxi@gmail.com>
References: <20260509135423.3433910-1-houminxi@gmail.com>
 <20260512063850.1133046-1-houminxi@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Add test_pop_vlan() to verify OVS kernel datapath pop_vlan action
correctly strips 802.1Q VLAN tags from frames.

Test structure:
- Baseline: untagged forwarding validates basic connectivity.
- Negative: forward without pop_vlan, tagged frame is invisible
  to ns2 (no VLAN sub-interface), ping fails.
- Positive: pop_vlan strips tag on forward path, push_vlan
  restores tag on return path, ping succeeds.

Use static ARP entries to avoid VLAN-tagged ARP complexity.
Rely on ping success/failure for verification -- no tcpdump or
pcap files needed.

Signed-off-by: Minxi Hou <houminxi@gmail.com>
Reviewed-by: Aaron Conole <aconole@redhat.com>
---
 .../selftests/net/openvswitch/openvswitch.sh  | 78 +++++++++++++++++++
 1 file changed, 78 insertions(+)

diff --git a/tools/testing/selftests/net/openvswitch/openvswitch.sh b/tools/testing/selftests/net/openvswitch/openvswitch.sh
index 3cdd953f6813..8cd5b3d894ab 100755
--- a/tools/testing/selftests/net/openvswitch/openvswitch.sh
+++ b/tools/testing/selftests/net/openvswitch/openvswitch.sh
@@ -28,6 +28,7 @@ tests="
 	tunnel_metadata				ovs: test extraction of tunnel metadata
 	tunnel_refcount				ovs: test tunnel vport reference cleanup
 	drop_reason				drop: test drop reasons are emitted
+	pop_vlan				vlan: POP_VLAN action strips tag
 	psample					psample: Sampling packets with psample"
 
 info() {
@@ -864,6 +865,83 @@ test_tunnel_refcount() {
 		ovs_wait dev_removed dp-${tun_type} || return 1
 		ovs_wait dev_removed ovs-${tun_type}0 || return 1
 	done
+
+	return 0
+}
+
+test_pop_vlan() {
+	local sbx="test_pop_vlan"
+	sbx_add "$sbx" || return $?
+	ovs_add_dp "$sbx" vlandp || return 1
+
+	ovs_add_netns_and_veths "$sbx" vlandp \
+		ns1 veth1 ns1veth 192.0.2.1/24 || return 1
+	ovs_add_netns_and_veths "$sbx" vlandp \
+		ns2 veth2 ns2veth 192.0.2.2/24 || return 1
+
+	# Baseline: untagged bidirectional forwarding
+	ovs_add_flow "$sbx" vlandp \
+		'in_port(1),eth(),eth_type(0x0806),arp()' '2' || return 1
+	ovs_add_flow "$sbx" vlandp \
+		'in_port(2),eth(),eth_type(0x0806),arp()' '1' || return 1
+	ovs_add_flow "$sbx" vlandp \
+		'in_port(1),eth(),eth_type(0x0800),ipv4()' '2' || return 1
+	ovs_add_flow "$sbx" vlandp \
+		'in_port(2),eth(),eth_type(0x0800),ipv4()' '1' || return 1
+	ovs_sbx "$sbx" ip netns exec ns1 ping -c 3 -W 2 \
+		192.0.2.2 || return 1
+
+	# VLAN topology: ns1 uses VLAN sub-interface, ns2 is plain
+	ip -n ns1 link add link ns1veth name ns1veth.10 \
+		type vlan id 10 || return 1
+	on_exit "ip -n ns1 link del ns1veth.10 2>/dev/null"
+	ip -n ns1 addr add 198.51.100.1/24 dev ns1veth.10 || return 1
+	ip -n ns1 link set ns1veth.10 up || return 1
+	ip -n ns2 addr add 198.51.100.2/24 dev ns2veth || return 1
+
+	ovs_del_flows "$sbx" vlandp
+
+	# Static ARP: avoids VLAN-tagged ARP complexity
+	local ns1veth10mac ns2mac
+	ns1veth10mac=$(ip -n ns1 link show ns1veth.10 \
+		| awk '/link\/ether/ {print $2}')
+	[ -z "$ns1veth10mac" ] && \
+		{ info "failed to get ns1veth10mac"; return 1; }
+	ns2mac=$(ip -n ns2 link show ns2veth \
+		| awk '/link\/ether/ {print $2}')
+	[ -z "$ns2mac" ] && \
+		{ info "failed to get ns2mac"; return 1; }
+	ip -n ns1 neigh replace 198.51.100.2 lladdr "$ns2mac" \
+		dev ns1veth.10 nud permanent || return 1
+	ip -n ns2 neigh replace 198.51.100.1 \
+		lladdr "$ns1veth10mac" \
+		dev ns2veth nud permanent || return 1
+
+	local vlan_match='in_port(1),eth(),eth_type(0x8100),'
+	vlan_match+='vlan(vid=10),'
+	vlan_match+='encap(eth_type(0x0800),'
+	vlan_match+='ipv4(src=198.51.100.1,proto=1),icmp())'
+
+	# Negative: forward without pop_vlan -- tagged frame
+	# is invisible to ns2 (no VLAN sub-interface), ping fails
+	ovs_add_flow "$sbx" vlandp "$vlan_match" '2' || return 1
+	ovs_sbx "$sbx" ip netns exec ns1 ping -I ns1veth.10 \
+		-c 3 -W 1 198.51.100.2 >/dev/null 2>&1 \
+		&& { info "FAIL: ping should fail without pop_vlan"
+		     return 1; }
+
+	ovs_del_flows "$sbx" vlandp
+
+	# Positive: pop_vlan strips tag on forward path,
+	# push_vlan restores tag on return path -- ping succeeds
+	ovs_add_flow "$sbx" vlandp \
+		"$vlan_match" 'pop_vlan,2' || return 1
+	ovs_add_flow "$sbx" vlandp \
+		'in_port(2),eth(),eth_type(0x0800),ipv4()' \
+		'push_vlan(vid=10,pcp=0,tpid=0x8100),1' || return 1
+	ovs_sbx "$sbx" ip netns exec ns1 ping -I ns1veth.10 \
+		-c 3 -W 2 198.51.100.2 || return 1
+
 	return 0
 }
 
-- 
2.53.0

