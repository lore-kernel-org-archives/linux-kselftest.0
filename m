Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=100.103.45.18
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1795444259;
	b=pcMPjUN6Puc9w2glIje7cy9ZtNAF6Xe+IRfveUls8Dx8ITaNyLsb9tmre8e9rP1FmhAK
	 JM+grJ70wezEVCTXp2mX0gEce09BVefgdZ2o2Z8pSWUbUEp5braVOkMYajyTOkEMawOu3
	 60hzpo/UOdoJchqosRdTt8mdEcpfVDvJ1dnYgjKwmMRDImfgm0jAvon5IzzEbCjaGaGpC
	 uHem82U2/YEB9u5y6Ibb5K+XEMH5zB/jsNM9Oxz5BCmqA2R135xpXa32vqtdBgkC3RSMU
	 tBHoRWxr23jMcHMk1ASJjo21yXxtIVDHqSENCfnP7KHWG6hNC1OjICx2fY5bNnz83Rw==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795444259;
	h=Received:DKIM-Signature:Received:From:Date:Subject:MIME-Version:
	 Content-Type:Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key:X-Endpoint-Received:
	 X-Original-From:Reply-To:Content-Transfer-Encoding;
	bh=YpQWtFa83ovXMaGUTAuU4K1uHoQoSXre+B8cs94dP0k=;
	b=YOhGgxaELhI1tcvJraCqSGcXGu4wwHxjHsIv/SYfUXK4VXvwiRjVPr78WO2ooYTbHYET
	 nhwzuFBcP2KX1S6JCEwY8m0jjb8NXk4XyY9xeuRteHSTZNx28fSH5N8cZkBhlfd5VS1zJ
	 9a26hXg+NRCykDDBAm9hCnV7ty/fFQwdBkKn81bTqaWJgDAa/cS1BM+91Ly4sJ53VCNIC
	 GtOZf8jpvw7t1DSO7EQs1ZyEpYXwOxGSffpTsgB5jHlugGKwlyBrD5O2YpciScQlvmIxa
	 5A187r47fFtKVCos+sVF/myD6+hM+kElryZXhI+hSmXVv3yBHuh3tHNxYOwiySDTq3Q==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=HJvPObtI;
	arc=pass header.oldest-pass=0 smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 68BE6606A31E;
	Mon, 23 Nov 2026 14:30:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=HJvPObtI
Authentication-Results: smtp.kernel.org; arc=none smtp.remote-ip=100.80.115.77
ARC-Seal: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256; cv=none;
	t=1795444258;
	b=f1Z4qJl6ly2yW1TxtNtjTsK3jPycPl2zaydogG5dnxLPfAMInni+0EVbaXfCfqyp4Lif
	 P7O/5DnswoAuOtvD89xxs52O/sNgqFn2hUBwsilEexr4IOY/JXfg+VRY0lZfQ032X33M6
	 nVuqNBQLs+0KNNflzrnjialfUfpMW8HG6ktGKt7Zy24qRxDwmpbtQd/y39P0ZUSxRF8j7
	 jQrTb8I1mPdrLI1Sh0PZheQMLxzzSVO/w5/zJunzghe6P3Ln8PeNQtCZUXRCeBwi8KVD0
	 iQLKtTJLVuPlaUQPexKNKCk6/S+Tcapw3CBNEhrpBsYxPgEDOrN5kvWb4tjHYLwQr6g==
ARC-Message-Signature: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256;
	c=relaxed/relaxed; t=1795444258;
	h=DKIM-Signature:Received:From:Date:Subject:MIME-Version:Content-Type:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key:X-Endpoint-Received:
	 X-Original-From:Reply-To:Content-Transfer-Encoding;
	bh=YpQWtFa83ovXMaGUTAuU4K1uHoQoSXre+B8cs94dP0k=;
	b=0zriazBEz8iMn58LKPiMb7B0IkvxtoWC9pIvD1Mta/qlxJY6tugxJSJd5jTuzNeNKMWl
	 XBMQx2sOIhQSfF0rGhbr6whif4wf74BulWwkXpsYDnrgI9cn+lqd68tflk1Eiiaq2HKm6
	 oc9KGPe1Gx7Fg0SmwfD4cyIMR5tyjH9W0jnnZBUACw3Xr3mSldaURBYxFNHJY/w0aQ26J
	 sev7ZDcTqaCvzAvT+pGi2/TPtfvdf+J8dnmQXg8VdkEvUQOi81FBTIUS3eV9fwVLcShqB
	 Phri/U0LwihpcQBcc13sr2RrjDGLJNn+yoU8ESGM8mP2b1z0dkpQ4SOpSz0xMXV4L7A==
ARC-Authentication-Results: i=1; smtp.kernel.org; 
	arc=none smtp.remote-ip=100.80.115.77
Received: from lkml.kernel.org (nexus.subspace.kernel.org [100.80.115.77])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id C39C01F000CA;
	Mon, 23 Nov 2026 14:30:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795444258;
	bh=YpQWtFa83ovXMaGUTAuU4K1uHoQoSXre+B8cs94dP0k=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To;
	b=HJvPObtIxM3vQI5HbUEbV7YeJFPPm5bl2cvj9PL1GhZxyD16zj8DSrHO1kW9URSvQ
	 Spnztbg97kCis2IPjSx6lxE5PbUDLhRypaJYbbPlh356hHZtvVVJIOOa32A6Cd/BbP
	 w/M0Popo538HIZXzzcpmhDQwPGqJjhcxRAA5DQJG6w+lUKCRkK0n729vTpH5KBxUjU
	 EwNRsuFaYXgsmZZNlefNqemekMxAXriurUS1VOyXEqyHtoMfFRVFPXemyTya54MRev
	 JQ3Qkpru/ZUOEpl6e5dJHav7HzTA/DwaqXZk90Ohf3VbmoIGbPQSQTOIgJWhwr4A7Z
	 OEGQx2Ky3QoHA==
Received: from nexus.subspace.kernel.org (localhost [IPv6:::1])
	by lkml.kernel.org (Postfix) with ESMTP id 5087D4C4E6;
	Mon, 23 Nov 2026 14:30:52 +0000 (UTC)
From: Vincent Jardin via B4 Relay <devnull+vjardin.free.fr@kernel.org>
Date: Mon, 23 Nov 2026 15:30:44 +0100
Subject: [PATCH net 2/2] selftests: fib_tests: test IPv6 source address of
 a VRF
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Post: <mailto:linux-kselftest@vger.kernel.org>
List-Help: <mailto:linux-kselftest+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kselftest+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Message-Id: <20261123-for-upstream-ipv6-vrf-saddr-scope-v1-v1-2-f667ab150ade@free.fr>
References: <20261123-for-upstream-ipv6-vrf-saddr-scope-v1-v1-0-f667ab150ade@free.fr>
In-Reply-To: <20261123-for-upstream-ipv6-vrf-saddr-scope-v1-v1-0-f667ab150ade@free.fr>
To: David Ahern <dsahern@kernel.org>, Ido Schimmel <idosch@nvidia.com>, 
 "David S. Miller" <davem@davemloft.net>, Eric Dumazet <edumazet@kernel.org>, 
 Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, 
 Willem de Bruijn <willemb@google.com>, Simon Horman <horms@kernel.org>, 
 Nicolas Dichtel <nicolas.dichtel@6wind.com>, Shuah Khan <shuah@kernel.org>
Cc: netdev@vger.kernel.org, linux-kselftest@vger.kernel.org, 
 Vincent Jardin <vjardin@free.fr>
X-Mailer: b4 0.13.0
X-Developer-Signature: v=1; a=ed25519-sha256; t=1795444251; l=2772;
 i=vjardin@free.fr; s=20260525; h=from:subject:message-id;
 bh=0STye+l3ERrEJAJtqNrYiXotiM7u53bz2yrMtrVkjkw=;
 b=qiwPhBIlFTL8P4Yn34sxtIoj06Mm3Ue5AhtHH4xD9ba9H8BugQcMgpAc8QVmOoq6hpBtK//VX
 +mjKP9j5lUoDgwNA+YSJGRgPe1HzSz+3LwFEWhEyaGjg/4eurXAuvy1
X-Developer-Key: i=vjardin@free.fr; a=ed25519;
 pk=hppgLeFpGpKOi7LNwGEZ4jOYofJCoGd4Jf1ltAabiLw=
X-Endpoint-Received: by B4 Relay for vjardin@free.fr/20260525 with
 auth_id=871
X-Original-From: Vincent Jardin <vjardin@free.fr>
Reply-To: vjardin@free.fr
Content-Transfer-Encoding: 7bit

From: Vincent Jardin <vjardin@free.fr>

Check the IPv6 source address of a route of a VRF through a device
that only has an IPv6 link-local address:
  - the address of another device of the VRF
  - then the one of the VRF device once it has one
  - then the one of the output device

Signed-off-by: Vincent Jardin <vjardin@free.fr>
---
 tools/testing/selftests/net/fib_tests.sh | 47 +++++++++++++++++++++++++++++++-
 1 file changed, 46 insertions(+), 1 deletion(-)

diff --git a/tools/testing/selftests/net/fib_tests.sh b/tools/testing/selftests/net/fib_tests.sh
index d7ac3c727f704..e211ea5a945ef 100755
--- a/tools/testing/selftests/net/fib_tests.sh
+++ b/tools/testing/selftests/net/fib_tests.sh
@@ -14,7 +14,7 @@ TESTS="unregister down carrier nexthop suppress ipv6_notify ipv4_notify \
        ipv4_mpath_list ipv6_mpath_list ipv4_mpath_balance ipv6_mpath_balance \
        ipv4_mpath_balance_preferred ipv4_mpath_oif ipv4_mpath_oif_nh \
        ipv4_mpath_oif_vrf ipv6_mpath_oif ipv6_mpath_oif_nh ipv6_mpath_oif_vrf \
-       fib6_ra_to_static fib6_temp_addr_renewal"
+       ipv6_saddr_vrf fib6_ra_to_static fib6_temp_addr_renewal"
 
 VERBOSE=0
 PAUSE_ON_FAIL=no
@@ -3228,6 +3228,50 @@ ipv6_mpath_oif_vrf_test()
 	cleanup
 }
 
+ipv6_saddr_vrf_check()
+{
+	local saddr="$1"
+	local desc="$2"
+	local route_get="$IP -6 route get 2001:db8:10::1 vrf vrf-123"
+
+	run_cmd "$route_get | grep -q 'src $saddr '"
+	log_test $? 0 "$desc"
+}
+
+ipv6_saddr_vrf_test()
+{
+	echo
+	echo "IPv6 source address selection with VRF test"
+
+	setup
+
+	if ! $IP link add name vrf-123 up type vrf table 123 &> /dev/null; then
+		echo "SKIP: Could not add a VRF device."
+		cleanup
+		return
+	fi
+
+	set -e
+	$NS_EXEC sysctl -qw net.ipv6.conf.all.keep_addr_on_down=1
+	$IP link set dev dummy0 master vrf-123
+	$IP link add dummy1 up master vrf-123 type dummy
+	$IP -6 route add 2001:db8:10::/64 vrf vrf-123 dev dummy1
+	set +e
+
+	ipv6_saddr_vrf_check "2001:db8:1::1" \
+		"Output device with a link-local address only"
+
+	$IP address add 2001:db8:100::1/128 dev vrf-123 nodad
+	ipv6_saddr_vrf_check "2001:db8:100::1" \
+		"Address of the VRF device before those of other devices"
+
+	$IP address add 2001:db8:2::1/64 dev dummy1 nodad
+	ipv6_saddr_vrf_check "2001:db8:2::1" \
+		"Address of the output device first"
+
+	cleanup
+}
+
 ################################################################################
 # usage
 
@@ -3320,6 +3364,7 @@ do
 	ipv6_mpath_oif)			ipv6_mpath_oif_test;;
 	ipv6_mpath_oif_nh)		ipv6_mpath_oif_nh_test;;
 	ipv6_mpath_oif_vrf)		ipv6_mpath_oif_vrf_test;;
+	ipv6_saddr_vrf)			ipv6_saddr_vrf_test;;
 	fib6_ra_to_static)		fib6_ra_to_static;;
 	fib6_temp_addr_renewal)		fib6_temp_addr_renewal;;
 

-- 
2.43.0


