Received: from mail-ot1-f48.google.com (mail-ot1-f48.google.com [209.85.210.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C3BBC402424
	for <linux-kselftest@vger.kernel.org>; Tue, 12 May 2026 07:09:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778569759; cv=none; b=actYmBS2TMYM+laSecSte8ibDDJI+uZ9WOUtFPE6hsf6EAal+0wRIDAgiVwUyCYY+yb8rGnrncIgjvYkuUB6G9hCpivAMJVWOHK+OXB9K5oJqIkoSLjCJ1SURPUsJnYfrUuqri4eEoPfnQTz3sbuiwM1q7/gaTCR0PfHqWHsoQg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778569759; c=relaxed/simple;
	bh=GQeOcJ4x5WRRquDnsAee0Zm2Twr2g7DVIbPAVoTtP+o=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=g3QMR9z5LjBF4iPvC+cfKJ+hGCEBk/HkLJ7F1nn+WaQZTssXlDcz0gwUl5cFAE91k0T6WtkcLIX70OIAWy/ayzsCvCtrXHZ1kH2Qokvu8n3uHFeGMidKuejXzryINNN3KXcnEvHp0mCYEweEqbQdOEnD7oocfuymY/VkO945MXs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=IoY5bW/s; arc=none smtp.client-ip=209.85.210.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="IoY5bW/s"
Received: by mail-ot1-f48.google.com with SMTP id 46e09a7af769-7dcdd1b492eso4650281a34.1
        for <linux-kselftest@vger.kernel.org>; Tue, 12 May 2026 00:09:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1778569754; x=1779174554; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=CzF0t66wEszl2BcU24gnomwmHovPmL+M9vg4PdgRwyk=;
        b=IoY5bW/sfWTh5wk4leCRcGmEgbvQNkK/BMPCEUhqCi/+y6F3X5AGO3RTwN/D+pkozh
         iImJOTeK4S2/cmKNHxq2mM+ggay7qOePV8W+aSh7tKIlGgTCxSCcp6LNRLOXMn3O5rcM
         F+iajYmse97EZlNLBuEJBMmn9yuAXNBAhEpRHqNmJ/dV3AhQeD0uS3hs7GDS62tHjyRy
         Q78Fc7cwCLfLqgTb3jCpeYUkrB6eNbpz1w85XqebkAaIQ4r7rLxQSpcxPqe9GLdhr0RA
         d4D/sZm/KbooAjF4P8txgNVWQdjD6wP+T8ul3lRqKOS59ZWn3eeccKgjORW/BxMDbTEB
         siGQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778569754; x=1779174554;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=CzF0t66wEszl2BcU24gnomwmHovPmL+M9vg4PdgRwyk=;
        b=FX0wPzLNQr7FmWE1il0oziGwuDTTKI8Yty+IcyRPwc2uGbNPzWxkDT0G+SmMc+HdeO
         0YWips7FITEjRlJrpQdw5NorurJsbZ0+4yXyakI0oh+Eg9nFweY+CKwOuSQet/g0Hzsw
         t8zlf800D9BjV7pD1wxV6Wkzo4KNG3DDKqcfySBM0+NETs5fRKCTTQ0Zi/9SKN1Egbvy
         j1b683pHgrI5ezwAeq0qQ21HW0q3ZnH2/4zoP9FMH+Tp4818JOuJjPYMMwSFbott0npS
         tGvOBFbisXFU6+T5c4cUQKwU/Z4fUE+aBsUyKcNRYUJcnGVZ3Mm8mt7bWq6QIaG58+w4
         9wag==
X-Forwarded-Encrypted: i=1; AFNElJ/Od9RULHA5JDJMRA0ZxtVIi5S0b5JPNYC55BO0Ifb/Zba5+JN9uhdwMx6p+XUe6Muwq2vyCKILPKQUIo0ghyQ=@vger.kernel.org
X-Gm-Message-State: AOJu0Yxl/HNOu8pcy2sdSg8S71qpCWcFQcKFgPGnyot+rvAk8HYab1/v
	GK/weoaXlH+LeG6Pqb6aoSmu9Rxxu5QlMAnjKeaMy2+oRatIYkGD/LOT
X-Gm-Gg: Acq92OF05IFvvOVB6RQKsBHLljNj31kVGIJzzqEDHSSHTH0LlilDYVX/3sXDX9F0y7e
	bPhjhroqYaIIcJ7tQqUu0qcnGVP4UkEzTy/4Dc55WDx+nmoQgz+S67JRkPfR967ouAasLiyyWTI
	+dx/2EcoXHa1vgjCL7FnLe5qIPZ/TYd8T7g+whUQ5b7JBTKvnGbK8s2j2gDzxV8BsiHSy5RR1a3
	DKT3qA/Nk2hZib/WLtWd/azke7Lvn2BGFJaC+9czw60Z+TsTWBgfHxLBJdSVjR7rENwXiAYVhlw
	XE/hZo9Tb1BbddNWzFnSBS/zU3N9xEXy1K/dcpiMCN6nz8XiejaJMzswn9KttHuiDdZWviCoeNU
	A5giFVoaxazbV/IhUDiSvAhIxUWKWRcLYmWiCsKsVchawvpHBz0EN3R9SdQVYk85stp8G/eOqHb
	GMEMlACXyY8vUwIUs=
X-Received: by 2002:a05:6830:c8d:b0:7dc:d7b8:aa80 with SMTP id 46e09a7af769-7e3bd3a1d5cmr1022984a34.17.1778569754252;
        Tue, 12 May 2026 00:09:14 -0700 (PDT)
Received: from houminxi ([72.244.37.221])
        by smtp.gmail.com with ESMTPSA id 46e09a7af769-7e367a18481sm8417658a34.0.2026.05.12.00.09.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 12 May 2026 00:09:12 -0700 (PDT)
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
Subject: [PATCH net-next v10 2/2] selftests: openvswitch: add pop_vlan test
Date: Tue, 12 May 2026 15:08:41 +0800
Message-ID: <20260512070841.1183581-3-houminxi@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260512070841.1183581-1-houminxi@gmail.com>
References: <20260509135423.3433910-1-houminxi@gmail.com>
 <20260512070841.1183581-1-houminxi@gmail.com>
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

