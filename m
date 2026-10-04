Received: from mail-ed1-f47.google.com (mail-ed1-f47.google.com [209.85.208.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5B25B46EC8E
	for <linux-kselftest@vger.kernel.org>; Sun,  4 Oct 2026 17:16:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791134175; cv=none; b=VPYRG7Ex7itVgbK86zk6X5+42GdMIpFXm2fk/oX84JmViTrSDZ/lMwQTKhZ9z8+d+YZMdQWwZvlaVpdQ/DSkuD4o+0LQatpIhs7eWCw59Z+kYUC0TnztFfZsh4W0RgJCb3g9qipR6vaz3A1Q4ZKctx0nuGRjnFn9kGljYfkiSqM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791134175; c=relaxed/simple;
	bh=0Cs4zrnnVG2zonxBmEKav2BwiHYawFvIfcq1geDWiBI=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=aeeD9h8VOvmn3NYRm/y7vNOnzJBPLrIwqSlHYyshEDkDETws3zDBdLLN+HWDOYheWD+MlehwLJfuvmYQVtJKTUz7DKpu3247bk1V2D9JZFkGemH37/vgRrnqfPYN6UN1UbMZrDitzTfYiRcpujXm7vSSdmPWpHP0QQhBgxTjtm4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bairaktaris.de; spf=pass smtp.mailfrom=bairaktaris.de; dkim=pass (2048-bit key) header.d=bairaktaris.de header.i=@bairaktaris.de header.b=XzIU5F0g; arc=none smtp.client-ip=209.85.208.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bairaktaris.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bairaktaris.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bairaktaris.de header.i=@bairaktaris.de header.b="XzIU5F0g"
Received: by mail-ed1-f47.google.com with SMTP id 4fb4d7f45d1cf-6acb57c2b88so1457423a12.2
        for <linux-kselftest@vger.kernel.org>; Sun, 04 Oct 2026 10:16:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bairaktaris.de; s=google; t=1791134170; x=1791738970; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=OkK+h93XRbt6A9Ld2PTPhQyOSjSsHyteIeOtRQLuYbM=;
        b=XzIU5F0gjHcuYR3cYd2wLM3W0all+f1MI57rrbHGkKipP4Hs5rbwLO/ac6tR62AGeJ
         BtlraQQYa+3NO7xUB1e5jUlK3CYr61VWoZnmcuAIHX9rM1TRZEPU/i1bI6MJTBm1jOX7
         zre6IP+P7tgVN6ek3jGeiFUIzOifS79P/hwVuXnwx1DHF9kKv8QL3kV8JkZEAWA6nd2N
         p7PbX6X8HxWt76MD5Iq7pIEPYBDcWmCTvDyT/E1ElVFtAeYoFqFshjMOW1FXGCwN45+6
         YlIf0vI3gXvNL+zlKDdJrm5wY9k+WC+y8Zyv1D8k9vjqAoOcKMyRJTlvR5K3xUFF08l0
         jxMw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791134170; x=1791738970;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=OkK+h93XRbt6A9Ld2PTPhQyOSjSsHyteIeOtRQLuYbM=;
        b=EdK9TUgMuKpSwcXxj54bA4FFLKd8FYPTH+x7XIfrmV0bEKJBlFtry5b/JnaQxIVumy
         Dg4fcIhyfmZa2Sj0tO85HlVx1XOaOeirP6BXgkAPCggy2uy8tLyS4T+/jcrh0GuGIJ0v
         2LZBjxdBx29pGYD4tmo5AGj/rQrZPfr/bGIZAI75qfP/U4Tj4Ann1d3uEPXX1mUcPqch
         C5MtdnVJ9Ml4WlfOCSCOw2AjbMO7PD80I/K5sKPizNIuQwvXrvCCemYtuT8QD51aJ4m0
         T9lfn5+FSbGPvZUzS596uWEQShQwwv9r9IYknfgDThSx4cctZBul3PlLsq0quyYa4l+o
         pOfg==
X-Forwarded-Encrypted: i=1; AKwUvBxSx0U+8RhnyaISTipywilK42CSBrN6yPWwpX6luGPn+5fwHUWXSVJj143XyPzAgI61AkX31yHK7l+0OyM5jF0=@vger.kernel.org
X-Gm-Message-State: AFuF++k8C5RwnBSk0F3CftemUluJfgvOk8oXBJUurESjSlmzjD+W9p53
	YVaKTL8Vxhi5jGMHUu21eKDZk2iqVXTxZ71K9XNPK3N9VTue/nqT4ceE0xnYtXmRJA==
X-Gm-Gg: AYBFou3xFQ5GiIi2+BS0LaUMPbBVgrl+eL9x7lu/X1nVs0cJBakTMN8Zkz/d5njrVql
	TidHMQO7myCORGZABvdML4izczoXVN/aQUsbm/thxusOfePyF7dbxOAhP6jw1DSHBcUeofvyn+J
	BQfpCYbd5/LFWvNkz9wkneZJAAROXeDdhZAC2t86Aru5aNdJADDZ/j4HcX6gl3pJF83GXh6n++O
	x6/sMDl6pop/6QMLJnAGd1gjQPHS6V5MVKRV28+la4fSdSRifmUglqv0gvVRBftifT7Op1tFYXc
	Z/ukeHRFqEMcMEhFTJpVR11htD13bP9Oi2gE/8+SfgL4b2ARUw2JyURGMoWckuyU5tx+HIJISvN
	bWAjrDJv4Tc6M/19vlNTHrSdbMZeKyOii3T4LnAFyyhvLdxWxLzU6KOwt3eNRFSzIZ9iAinjzYo
	IixaVR+dqiYqnMfk4aGRlDG5/KFO2Uzy6daYTu6J1jpKewyHErpX4Ki0Sm1+N2olc2yIeGxA+VX
	GPEAvKghmFwVmrIsJvQBbwmniJse9GlGBTynk9S/9BQIOG+gKglO+RBWA4o0l+XN5Hq1PlFzta+
	zu3gaAEXFdfVLccLu52LzuzSnnL0hlmVtgYLUv1eSgX0ZsL6M9JAbwZ9k5ObrphlWIEKnICQ46f
	qBbC4pefrO7LJzpyjekqSPxQL7BG8frrpfDKOPP5DBmZaXukBzIj0fuwB10J94oStvlHMjPNCge
	ob8apXbSr5bmyZhP/vkIQFVFo=
X-Received: by 2002:a17:907:97d3:b0:c2e:3ed7:7db4 with SMTP id a640c23a62f3a-c2e6ed3f0fcmr390646666b.23.1791134170344;
        Sun, 04 Oct 2026 10:16:10 -0700 (PDT)
Received: from Desktop (pd9513667.dip0.t-ipconnect.de. [217.81.54.103])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c2e878b0e05sm82284366b.5.2026.10.04.10.16.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 04 Oct 2026 10:16:09 -0700 (PDT)
From: Julius Bairaktaris <julius@bairaktaris.de>
To: netfilter-devel@vger.kernel.org
Cc: pablo@netfilter.org,
	fw@strlen.de,
	kadlec@netfilter.org,
	phil@nwl.cc,
	horms@kernel.org,
	davem@davemloft.net,
	edumazet@google.com,
	kuba@kernel.org,
	pabeni@redhat.com,
	shuah@kernel.org,
	razor@blackwall.org,
	ericwouds@gmail.com,
	dqfext@gmail.com,
	netdev@vger.kernel.org,
	coreteam@netfilter.org,
	linux-kselftest@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH nf-next v6 2/2] selftests: netfilter: nft_flowtable.sh: roam a host between two bridge ports
Date: Sun,  4 Oct 2026 19:16:05 +0200
Message-ID: <20261004171605.3544792-3-julius@bairaktaris.de>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20261004171605.3544792-1-julius@bairaktaris.de>
References: <20261004171605.3544792-1-julius@bairaktaris.de>
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Move a host to another port of a bridge on the router while its flow is
offloaded, and check that the transfer continues and is offloaded again.
The cases are plain and vlan bridge ports, "bridge fdb replace", a
pinned and then deleted fdb entry, an aged out entry (the flow must
stay), and the plain case over IPv6.

Without the gc check the transfer stalls when the host moves.

Assisted-by: Claude:claude-fable-5-1
Assisted-by: Claude:claude-opus-5-5
Signed-off-by: Julius Bairaktaris <julius@bairaktaris.de>
---
 .../selftests/net/netfilter/nft_flowtable.sh  | 201 ++++++++++++++++++
 1 file changed, 201 insertions(+)

diff --git a/tools/testing/selftests/net/netfilter/nft_flowtable.sh b/tools/testing/selftests/net/netfilter/nft_flowtable.sh
index 449c518bd947..51e17ffce114 100755
--- a/tools/testing/selftests/net/netfilter/nft_flowtable.sh
+++ b/tools/testing/selftests/net/netfilter/nft_flowtable.sh
@@ -851,6 +851,207 @@ test_ipip
 
 test_bridge
 
+# Roam a host between two ports of a bridge on the router while its flow is
+# offloaded, as a station moving between two access points attached to ports
+# of one bridge. The host keeps its address and mac on a bridge of its own
+# and roams by moving that bridge's port, so only the fdb changes. With a vid
+# the bridge ports are vlan devices, whose ifindex differs from the device
+# the flow transmits on. With "replace" the router's fdb entry is sticky and
+# the move is a "bridge fdb replace". With "del" the host stays, its entry is
+# pinned to the other port and then deleted, and a ping relearns it. With
+# "age" the host stays and its entry ages out, which must not tear the flow
+# down. A flow that stays on the fast path leaves no more than a few packets
+# in the forward chain, the counter tells offloaded from slow path. The
+# plain roam also runs over IPv6.
+test_bridge_roam()
+{
+	local vid=$1 how=$2 fam=${3:-4}
+	local p0=sr0 p1=sr1 r0=rr0 r1=rr1
+	local mac=02:00:00:09:01:99
+	local what="roaming on bridge${vid:+ with vlan ports}${how:+ by fdb $how}"
+	local hn=10.9.1 wn=10.9.2 dot=. len=24 nodad= ip6= srv=10.9.2.99
+	local min=10000000
+	local dev old new slow lpid cpid max=100 win=2
+
+	if [ "$fam" = 6 ]; then
+		hn=dead:9:1 wn=dead:9:2 dot=:: len=64 nodad=nodad ip6=-6
+		srv="[dead:9:2::99]"
+		what="$what over IPv6"
+	fi
+
+	setup_ns rns1 rnsr rns2
+
+	if ! ip -net "$rnsr" link add br0 type bridge 2>/dev/null; then
+		echo "SKIP: could not add bridge for $what"
+		[ "$ret" -eq 0 ] && ret=$ksft_skip
+		return
+	fi
+
+	ip link add sr0 netns "$rns1" type veth peer name rr0 netns "$rnsr"
+	ip link add sr1 netns "$rns1" type veth peer name rr1 netns "$rnsr"
+	ip link add rw0 netns "$rnsr" type veth peer name w0 netns "$rns2"
+	for dev in sr0 sr1; do
+		ip -net "$rns1" link set "$dev" up
+	done
+	for dev in rr0 rr1; do
+		ip -net "$rnsr" link set "$dev" up
+	done
+
+	if [ -n "$vid" ]; then
+		for dev in sr0 sr1; do
+			ip -net "$rns1" link add link "$dev" name "$dev.$vid" type vlan id "$vid"
+			ip -net "$rns1" link set "$dev.$vid" up
+		done
+		for dev in rr0 rr1; do
+			ip -net "$rnsr" link add link "$dev" name "$dev.$vid" type vlan id "$vid"
+			ip -net "$rnsr" link set "$dev.$vid" up
+		done
+		p0=sr0.$vid; p1=sr1.$vid; r0=rr0.$vid; r1=rr1.$vid
+	fi
+
+	ip -net "$rnsr" link set "$r0" master br0
+	ip -net "$rnsr" link set "$r1" master br0
+	ip -net "$rnsr" addr add $hn${dot}1/$len dev br0 $nodad
+	ip -net "$rnsr" link set br0 up
+	ip -net "$rnsr" addr add $wn${dot}1/$len dev rw0 $nodad
+	ip -net "$rnsr" link set rw0 up
+	ip netns exec "$rnsr" sysctl -q net.ipv4.ip_forward=1
+	ip netns exec "$rnsr" sysctl -q net.ipv6.conf.all.forwarding=1
+
+	ip -net "$rns1" link add stbr type bridge
+	ip -net "$rns1" link set stbr address $mac
+	ip -net "$rns1" link set "$p0" master stbr
+	ip -net "$rns1" link set stbr up
+	ip -net "$rns1" addr add $hn${dot}99/$len dev stbr $nodad
+	ip $ip6 -net "$rns1" route add default via $hn${dot}1
+
+	ip -net "$rns2" addr add $wn${dot}99/$len dev w0 $nodad
+	ip -net "$rns2" link set w0 up
+	ip $ip6 -net "$rns2" route add default via $wn${dot}1
+
+	# no neighbour probes, so the host only sends when it receives
+	ip -net "$rnsr" neigh replace $hn${dot}99 lladdr $mac nud permanent dev br0
+	ip -net "$rns1" neigh replace $hn${dot}1 nud permanent dev stbr \
+		lladdr "$(ip -net "$rnsr" -br link show br0 | awk '{print $3}')"
+
+	if ! ip netns exec "$rnsr" nft -f - <<EOF
+table inet filter {
+  counter roam_repl { }
+  flowtable f1 { hook ingress priority 0; devices = { rr0, rr1, rw0 }; }
+  chain forward {
+    type filter hook forward priority 0; policy accept;
+    meta oif "rw0" tcp dport 12345 flow add @f1
+    meta iif "rw0" tcp sport 12345 counter name roam_repl flow add @f1
+  }
+}
+EOF
+	then
+		echo "SKIP: could not load ruleset for $what"
+		[ "$ret" -eq 0 ] && ret=$ksft_skip
+		return
+	fi
+
+	# the host discards what it receives, its socket byte counter is read
+	rx_bytes() { ip netns exec "$rns1" ss -tin "dst $srv" 2>/dev/null |
+		grep -o 'bytes_received:[0-9]*' | head -1 | cut -d: -f2; }
+	rx_started() { local n; n=$(rx_bytes); [ "${n:-0}" -gt 0 ]; }
+	# forward chain packets of the reply direction since the last call
+	slow_pkts() { ip netns exec "$rnsr" nft reset counter inet filter roam_repl |
+		grep -o 'packets [0-9]*' | cut -d' ' -f2; }
+	roam_listener_ready() { ss -N "$rns2" -lnt -o "sport = :12345" | grep -q 12345; }
+
+	roam_stop() { kill "$cpid" "$lpid" 2>/dev/null; wait "$cpid" "$lpid" 2>/dev/null; }
+
+	timeout "$SOCAT_TIMEOUT" ip netns exec "$rns2" socat -u \
+		OPEN:/dev/zero TCP$fam-LISTEN:12345,reuseaddr &
+	lpid=$!
+	if ! busywait "$BUSYWAIT_TIMEOUT" roam_listener_ready; then
+		echo "FAIL: $what: listener did not start" 1>&2
+		ret=1
+		kill "$lpid" 2>/dev/null; wait "$lpid" 2>/dev/null
+		return
+	fi
+	timeout "$SOCAT_TIMEOUT" ip netns exec "$rns1" socat -u \
+		TCP$fam:$srv:12345 OPEN:/dev/null &
+	cpid=$!
+
+	if ! busywait "$BUSYWAIT_TIMEOUT" rx_started; then
+		echo "FAIL: $what: transfer did not start" 1>&2
+		ret=1
+		roam_stop
+		return
+	fi
+	sleep 2
+	slow_pkts > /dev/null
+	old=$(rx_bytes)
+	sleep 2
+	new=$(rx_bytes)
+	slow=$(slow_pkts)
+	if [ -z "$slow" ] || [ $((${new:-0} - ${old:-0})) -lt $min ] ||
+	   [ "$slow" -gt 100 ]; then
+		echo "FAIL: $what: not offloaded before the roam:" \
+		     "$((${new:-0} - ${old:-0})) bytes, ${slow:-no} forward chain packets" 1>&2
+		ret=1
+		roam_stop
+		return
+	fi
+
+	if [ "$how" = age ]; then
+		# ageing_time is in centiseconds
+		ip -net "$rnsr" link set br0 type bridge ageing_time 200
+		max=0 win=10
+	elif [ "$how" = del ]; then
+		bridge -n "$rnsr" fdb replace $mac dev "$r1" master static sticky
+		sleep 2
+		bridge -n "$rnsr" fdb del $mac dev "$r1" master static
+		ip netns exec "$rns1" ping $ip6 -c 2 -W 1 -q $hn${dot}1 >/dev/null 2>&1
+	else
+		# roam: move the host bridge to the other port and send on it
+		if [ "$how" = replace ]; then
+			bridge -n "$rnsr" fdb replace $mac dev "$r0" master static sticky
+		fi
+		ip -net "$rns1" link set "$p0" nomaster
+		ip -net "$rns1" link set "$p1" master stbr
+		ip netns exec "$rns1" ping $ip6 -c 2 -W 1 -q $hn${dot}1 >/dev/null 2>&1
+		if [ "$how" = replace ]; then
+			bridge -n "$rnsr" fdb replace $mac dev "$r1" master static sticky
+		fi
+	fi
+
+	# the bytes in flight at the roam drain within the first seconds; a
+	# stale flow delivers nothing after that, a torn down one resumes and
+	# is offloaded again.
+	sleep 4
+	old=$(rx_bytes)
+	sleep 4
+	new=$(rx_bytes)
+	slow_pkts > /dev/null
+	sleep $win
+	slow=$(slow_pkts)
+	roam_stop
+
+	if [ "$how" = age ] &&
+	   bridge -n "$rnsr" fdb show br br0 | grep -q "$mac.*master"; then
+		echo "FAIL: $what: the host's fdb entry did not age out" 1>&2
+		ret=1
+	elif [ $((${new:-0} - ${old:-0})) -lt $min ]; then
+		echo "FAIL: $what: transfer stalled after the roam" 1>&2
+		ret=1
+	elif [ -z "$slow" ] || [ "$slow" -gt $max ]; then
+		echo "FAIL: $what: $slow forward chain packets after the roam" 1>&2
+		ret=1
+	else
+		echo "PASS: flow offload for $what"
+	fi
+}
+
+test_bridge_roam ""
+test_bridge_roam 100
+test_bridge_roam "" replace
+test_bridge_roam "" del
+test_bridge_roam "" age
+test_bridge_roam "" "" 6
+
 KEY_SHA="0x"$(ps -af | sha1sum | cut -d " " -f 1)
 KEY_AES="0x"$(ps -af | md5sum | cut -d " " -f 1)
 SPI1=$RANDOM
-- 
2.53.0

