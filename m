Received: from mail-dy1-f175.google.com (mail-dy1-f175.google.com [74.125.82.175])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 11D7536607D
	for <linux-kselftest@vger.kernel.org>; Mon,  1 Jun 2026 11:53:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.82.175
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780314810; cv=none; b=qh0klOQZ8yAymd+9HIlVOzUJgp+x2fz/GokqJp02pNBBJVKrTIWrbCOhAS1WoXSG4WcjGUxln2X/Y08g/bWzyK6MChoW7zl1VJqgjFIFo6adYreW2I+hJxlMlYa8Wx0STLvucKYdSrAKYOfE4nch8/y85a9g9X2lUe/7ptdyX4g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780314810; c=relaxed/simple;
	bh=vjcSHu3SEn3zw1F72ieiZBESgN6+HtFjGQ33EPazq4k=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=U9niN/4Pzb2b4YTVx62B8R+ZWAX0L3boeIfigSUNS9fjAnVI9l6U3/E3oyiNe1hv/gz66JUWo+IqE7b4Mb7j4/jygz8x7x4m9miSjNe8wr0YQD9y9zP48IPqjJbOEKn9IFNEvVqFXQk0F3Ge9j1wvjB6C+GNNqmTmuAe5Z/clQc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=I+38rvAD; arc=none smtp.client-ip=74.125.82.175
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="I+38rvAD"
Received: by mail-dy1-f175.google.com with SMTP id 5a478bee46e88-304ec41197bso2716896eec.1
        for <linux-kselftest@vger.kernel.org>; Mon, 01 Jun 2026 04:53:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1780314807; x=1780919607; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=yvmTG9qbl7v0LMiRxV9jUkuqNSrPO0HlW1meTsVlSmM=;
        b=I+38rvADVD0yWOCdbE3kvfw0xgTmakjc2kOOmRQfVU4nI+p5RbX29Tyu7xBf+fR+Fj
         SXpGEym8Slh1Jk9dEfHOtzRa66Q+rI4/nQIbdaOAHBPz19EQ4euq+rVcrj+Yzq1K1TrH
         NEgDyFluBNhwQPjEeNkhEW5coNLxmkC56blb15yugRhy1o2XZpKlAywPEQcn3USJdx5t
         fm3iIX1QROqzJkzQ2Jzo2T0+5DjCgq3HLNESURDJkBwbTh1CPw0MU08U/f+Bbx85ylSN
         6CCwqlo4oPw0ghmo4Hsr8xKkF5C9i3UCdJVMhwMtsnygQB8CBISBVHSjCxF5FD0sLpy7
         kJMA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780314807; x=1780919607;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=yvmTG9qbl7v0LMiRxV9jUkuqNSrPO0HlW1meTsVlSmM=;
        b=NNfWExAUF/F0VTwJsKh5rFFDD6jLUopRgw+ofTTEsJ6QEBgjSPCNC3hW7YTph3unga
         PaO3awJ/PUkYrrP9R3tRsZ0N6DI1TWFskzs1EE55yEmgLEWKfO7shYiwi/3YwRhYDJ1n
         6aOK3KGjKO87JPNKeefZxcnXHG0tLq1DsnpEDlS32oRd6ty0FN6YyUXZIy34bO9hi2qL
         b9PtLZqmddXBB6SdpbWqwkLeBNhBtC9vymORbWdoL7rlNIOuOwDFGm/jX4HxOmkLFKGY
         Hh3++yLgFtOnoMFa1DraHDpAMm2eyv38eGKukPBgl/i3mjbSSh6qFyc1pvEWLZUjnSu3
         heEw==
X-Forwarded-Encrypted: i=1; AFNElJ9BeLrF+8Lk3nbMGy72ybwDORbC+R13G9mDV8QyBM2jISUhum/jLowoo0PE9sJEbjuEbzn+iZMkD5kfgwVneQE=@vger.kernel.org
X-Gm-Message-State: AOJu0YwkIc4Ppor01TPuPHO0fh/tHaUJZwrWVSM0MHaAmj7Fug4HnDaU
	0X3s+LNiuVHRFFs+l6raDJMOgFJ54kpK5/oBDDJfpc254FqeWyU4wzb+
X-Gm-Gg: Acq92OGVSKoM8vSK6dcWg5jvxm18KuGnIiq3ZG7RviinIX+UFeLc4+lX7MdoT5tCneA
	hZC6EgiomJUSiY2/spWoF9LkkQbEdyKKkzudIbpsSw8KJVm4EMmILvKRibbu7+yz5FShxLJ/xh+
	JZHtSqpaDsSsuNLKSO9olZsgBNDB/IdSzufwSFWodaQSwoTdeZvijtHn7sWob9bNCbDHFM4CIcS
	ZtNducLEUNWKPhuSw/s5I8X25lvn5IfS6rPAenHmwRUgLJqfQXLIslpzCwtV10jz05LsGWffCiD
	mEsGdRqEHVLucEJG04IOe6qTtmsbZ+NpBjQ0WMrqE+1jaYAftnU9/sYjG+kzCVJ8PSN+XPvCqnY
	uCKQyCh/BIHxOARPEIMDB94tdVyj6wj6eJQGS7l3DiTU94YxbWinoKt2JoZxx6VmhyGmVjPKEPr
	JyJCcc5bwLP/xObw5emv/n9B/9zi4ddMiYyhI0
X-Received: by 2002:a05:7300:cc0e:b0:2f2:c336:7736 with SMTP id 5a478bee46e88-304fa694de5mr4462843eec.29.1780314806950;
        Mon, 01 Jun 2026 04:53:26 -0700 (PDT)
Received: from houminxi ([166.0.188.190])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-304ed53f316sm8335330eec.19.2026.06.01.04.53.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 01 Jun 2026 04:53:26 -0700 (PDT)
From: Minxi Hou <houminxi@gmail.com>
To: netdev@vger.kernel.org
Cc: aconole@redhat.com,
	davem@davemloft.net,
	echaudro@redhat.com,
	edumazet@google.com,
	horms@kernel.org,
	i.maximets@ovn.org,
	kuba@kernel.org,
	pabeni@redhat.com,
	shuah@kernel.org,
	dev@openvswitch.org,
	linux-kselftest@vger.kernel.org,
	Minxi Hou <houminxi@gmail.com>
Subject: [PATCH] selftests/openvswitch: guard command substitutions against empty output
Date: Mon,  1 Jun 2026 19:53:07 +0800
Message-ID: <20260601115307.1411211-1-houminxi@gmail.com>
X-Mailer: git-send-email 2.54.0
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

When ip-link output is unavailable, when the upcall daemon log has not
been written yet, or when pahole does not know the OVS drop subsystem
ID, the affected command substitutions silently produce empty strings.
The caller then passes empty sha= or pid= arguments to ovs_add_flow,
or matches against wrong drop reason codes, all without a diagnostic.

Add [ -z ] guards immediately after each assignment. For test_arp_ping,
also align the MAC extraction to use awk '/link\/ether/' as in
test_pop_vlan. The drop_reason guard returns ksft_skip because an
absent subsystem ID is an environment issue, not a test failure.

Signed-off-by: Minxi Hou <houminxi@gmail.com>
---
 .../selftests/net/openvswitch/openvswitch.sh     | 16 ++++++++++++++--
 1 file changed, 14 insertions(+), 2 deletions(-)

diff --git a/tools/testing/selftests/net/openvswitch/openvswitch.sh b/tools/testing/selftests/net/openvswitch/openvswitch.sh
index 8cd5b3d894ab..67f508facc91 100755
--- a/tools/testing/selftests/net/openvswitch/openvswitch.sh
+++ b/tools/testing/selftests/net/openvswitch/openvswitch.sh
@@ -305,6 +305,8 @@ test_psample() {
 	# sFlow / IPFIX.
 	nlpid=$(grep -E "listening on upcall packet handler" \
             $ovs_dir/s0.out | cut -d ":" -f 2 | tr -d ' ')
+	[ -z "$nlpid" ] && \
+		{ info "failed to get upcall PID"; return 1; }
 
 	ovs_add_flow "test_psample" psample \
             "in_port(2),eth(),eth_type(0x0800),ipv4()" \
@@ -338,6 +340,10 @@ test_drop_reason() {
 	ovs_drop_subsys=$(pahole -C skb_drop_reason_subsys |
 			      awk '/OPENVSWITCH/ { print $3; }' |
 			      tr -d ,)
+	if [ -z "$ovs_drop_subsys" ]; then
+		info "failed to get OVS drop subsys ID"
+		return $ksft_skip
+	fi
 
 	sbx_add "test_drop_reason" || return $?
 
@@ -436,13 +442,19 @@ test_arp_ping () {
 	# Setup client namespace
 	ip netns exec client ip addr add 172.31.110.10/24 dev c1
 	ip netns exec client ip link set c1 up
-	HW_CLIENT=`ip netns exec client ip link show dev c1 | grep -E 'link/ether [0-9a-f:]+' | awk '{print $2;}'`
+	HW_CLIENT=$(ip netns exec client ip link show dev c1 \
+		| awk '/link\/ether/ {print $2}')
+	[ -z "$HW_CLIENT" ] && \
+		{ info "failed to get client hwaddr"; return 1; }
 	info "Client hwaddr: $HW_CLIENT"
 
 	# Setup server namespace
 	ip netns exec server ip addr add 172.31.110.20/24 dev s1
 	ip netns exec server ip link set s1 up
-	HW_SERVER=`ip netns exec server ip link show dev s1 | grep -E 'link/ether [0-9a-f:]+' | awk '{print $2;}'`
+	HW_SERVER=$(ip netns exec server ip link show dev s1 \
+		| awk '/link\/ether/ {print $2}')
+	[ -z "$HW_SERVER" ] && \
+		{ info "failed to get server hwaddr"; return 1; }
 	info "Server hwaddr: $HW_SERVER"
 
 	ovs_add_flow "test_arp_ping" arpping \
-- 
2.54.0

