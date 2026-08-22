Received: from fout-b6-smtp.messagingengine.com (fout-b6-smtp.messagingengine.com [202.12.124.149])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C00093B7B8C;
	Sat, 22 Aug 2026 12:03:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=202.12.124.149
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787400220; cv=none; b=N1nwHPHUkEGBTzSfTgaL/lgJAK8UAmsGAXLSuQxttCrHi1nGs7chcOgkaRMj8bDPya7awLhSmWam5JjoA3+6oJ0rgwvm3jzm4/0NQvKW3U6+to2i+OTRU4oiQpUufopQu0dz+xZ9BC9sUP5VrqH0IZ2Ank8fN3Hw4VnB9FaxJvA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787400220; c=relaxed/simple;
	bh=NtmFVeW4kka0SmGN5xNAMDqOjqpQKVa6ihfiQCp798c=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=dwj05l/b3UBl3PIzxXvXrq+lWkl/CVuFvnoRviHYRFe2kSMlw5v9KjogO7u2Zak2iw0uAimJvapgAmDpl6ahq0SRbkFD9/5zo8o8GlnC4UV71GLPMFKLEFE6ID/eMTAOqbD53CKxJFJXiAWFN8lIeAhTCXsyz49JctV8nrhI1iw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=fastmail.im; spf=pass smtp.mailfrom=fastmail.im; dkim=pass (2048-bit key) header.d=fastmail.im header.i=@fastmail.im header.b=RyzlJ4mw; dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b=T7hd0wDT; arc=none smtp.client-ip=202.12.124.149
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=fastmail.im
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=fastmail.im
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=fastmail.im header.i=@fastmail.im header.b="RyzlJ4mw";
	dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b="T7hd0wDT"
Received: from phl-compute-02.internal (phl-compute-02.internal [10.202.2.42])
	by mailfout.stl.internal (Postfix) with ESMTP id E21E31D000D6;
	Sat, 22 Aug 2026 08:03:37 -0400 (EDT)
Received: from phl-frontend-03 ([10.202.2.162])
  by phl-compute-02.internal (MEProxy); Sat, 22 Aug 2026 08:03:38 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=fastmail.im; h=
	cc:cc:content-transfer-encoding:content-type:date:date:from:from
	:in-reply-to:in-reply-to:message-id:mime-version:references
	:reply-to:subject:subject:to:to; s=fm3; t=1787400217; x=
	1787486617; bh=32UVSnM0pjaiOP5dmLZiUJErmQ+QeG77+593Av3g+Go=; b=R
	yzlJ4mwTrW9weoskRcvsNpwq8LbPsEacgb8llts2cL+qsH8/EWUTqaSA/ktaRcmA
	GgmwpkOxJYNl/AkZGKZRLMaEaUkFwquCiMbSmXrDFTlaKAmLt1J2hfminaw0UM+b
	FTv9IYdtbz48B1VBMBiGhd7g21rQmXUt1/dJmuH60VCGlLda4nCmOJOWBTp1Jsri
	9K3Chmn4T+qT6dvH0LV37rlHKTbwBGGoDHTTvkIGiMfJYkZRDz/DWYbDgBlIRD6t
	2TDimSTYzkJQLTYmo9zO1M4VyF0ZsFXzJNeS7c+wTIzBt+1NdUDpUJdkrTKrZ+Dx
	OVgf/k6i0nRp85XPmdmog==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:date:date:feedback-id:feedback-id:from:from
	:in-reply-to:in-reply-to:message-id:mime-version:references
	:reply-to:subject:subject:to:to:x-me-proxy:x-me-sender
	:x-me-sender:x-sasl-enc; s=fm3; t=1787400217; x=1787486617; bh=3
	2UVSnM0pjaiOP5dmLZiUJErmQ+QeG77+593Av3g+Go=; b=T7hd0wDTmYlcch/vY
	jC5QGDng5eGevNDurBGTEpeiIT16j2QB1s3M/5lnCuVlc/bPRuHAOLsmrIAfaxSi
	2/HkmeJhMRt2VFTcug9ukgBAZp6zZdKG/ozjQ4DNINMPc4bsjG1vHaJaDO0B0qZ9
	xVixjXtOFfZi+dE0Vt9NG1ScA1VFAoqPkn4dC6vggC/t/M+Bae4kWYbbsY+uCTiz
	Avdm3dKirnYbTA1h72hpBERPb+l7BM+cRdnRPoQHS4EpYmZ0/r30rlrPpgcSwyPV
	XXwllVcuePv4q3f8CpmZUNB2Eq2E0rx0Z5kW0tCzGc3rxYPUefL+wNHCOtdoLgmi
	45ddw==
X-ME-Sender: <xms:GZCJagd4s33_xUram9LU8HasHSgSsqf-Xc1-f9epQyCCWcm8y7JhLg>
    <xme:GZCJagfrLN4DZnOUuhROYnRv3P8zzZZSrqnJrAZRtWyOpCi9A3BtybtE6T7mH0wKn
    zn-7yeVau-dOF4tHVNU46j6zWm0ARrmye8-FzsqwrjSTKCys9_J1A>
X-ME-Received: <xmr:GZCJaq2fCqgFgo8hMrQBvsB74uwBANX4KS079J2041831gKxC4UHiIE3H9_J8w>
X-ME-Proxy-Cause: dmFkZTGtKJOb/1ErzFcRrgcqczqx38F/Dp1etLm/xtgm+4L59eUlbk8wR34hQg39CMJOx9
    7EXAzcsth20bS7P88c2kw+IvEVs13toeM5GJkH4ltW2CZjCF1Szvv5F31rXlIkUtWTAAkV
    jAHaDP/Erx+8iJPZwd87d8ns+6JCZX85WN4ekQrawHiR5m21u9gVT8TyCvTF6CUsY2x8Pc
    cdjb9phLV+q5cpbiEeUDZJ4lcoVGCwEaIQm4DsPcfjwLHrqGDepjJy6DvKloM5xLTFXgea
    QukG15OgrMMnI63W1MhzqM7oB0HrlmZdzZH8rhU2BX84M/th0OPJIxowms3dZxNyxWB2Q0
    ByQqWBnc2HlW4ZBIAmee/Lic78rJkIhHXasf8EjfRZE7nv/qS6F0TN9NOxLVYfDhgtL365
    iaaF+9aiDht4btvjWRGJwYGq2YN21+gjer374xLSoxUTdFlIANCO2ANb5JOhG6yyNxAu/C
    rSlKAf+hB5cNfHc+ce74g2O8x2IvGUgoZi2UpcEPkIawUZxYCqzR7Z6JUnjiNTKhERhFiQ
    tPKtSEcT90osDoX3kgu6Jgz852nTm38lr633WickK/aSZ2kY0f/FHX/ueFsgPEUDCSvLS5
    CM6nbqJIpFoCfRjiw79PENTwuQcrpfK5peXd4chBh/1vWQKL9QkZLfeTvFHg
X-ME-Proxy: <xmx:GZCJao89XEiMe67xXmyS1RaMr_MvCNeSUrGm4guj0n8NOw14p1zO2g>
    <xmx:GZCJav7KM0BL04sZNZnMKQ3pagGHmkhpPCjEJ-Bo4RcFfWTmXcO5Qw>
    <xmx:GZCJagsNxwGvqnf4-H37Mcb_BK5HOB11C_0Cxq1M1Giz7FOE3KQSEg>
    <xmx:GZCJah2p7e9zJkJf2seCmdJaspTVBVYyPEZYbjjTeigO09WNRxPpJg>
    <xmx:GZCJaga9N15Zjp-Vrw0M3s3IB3cv2cpZAg9ifuep77_hBlqsocw1CMom>
Feedback-ID: i559e4809:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Sat,
 22 Aug 2026 08:03:37 -0400 (EDT)
From: Alice Mikityanska <alice.kernel@fastmail.im>
To: Matthieu Baerts <matttbe@kernel.org>,
	Paolo Abeni <pabeni@redhat.com>,
	Jakub Kicinski <kuba@kernel.org>
Cc: Eric Dumazet <edumazet@google.com>,
	"David S. Miller" <davem@davemloft.net>,
	Simon Horman <horms@kernel.org>,
	Shuah Khan <shuah@kernel.org>,
	Nikolay Aleksandrov <razor@blackwall.org>,
	netdev@vger.kernel.org,
	linux-kselftest@vger.kernel.org,
	Alice Mikityanska <alice@isovalent.com>
Subject: [PATCH net v2 4/4] selftests: net: Fix slow configurations in big_tcp_tunnels.sh
Date: Sat, 22 Aug 2026 15:03:08 +0300
Message-ID: <20260822120308.1165200-5-alice.kernel@fastmail.im>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20260822120308.1165200-1-alice.kernel@fastmail.im>
References: <20260822120308.1165200-1-alice.kernel@fastmail.im>
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Alice Mikityanska <alice@isovalent.com>

The combination of checksum offload disabled (that causes software GSO)
and a debug kernel is inherently slow. Depending on the CPU power and
load, RTT may increase, limiting sk_pacing_rate, so tcp_tso_autosize
caps SKBs at around 40 segments, and zero BIG TCP packets are produced.

Increase sysctl net.ipv4.tcp_min_tso_segs and set a bigger initial value
of CWND in these configurations to force BIG TCP.

Fixes: 5cb53743e1ff ("selftests: net: Add a test for BIG TCP in UDP tunnels")
Signed-off-by: Alice Mikityanska <alice@isovalent.com>
---
 tools/testing/selftests/net/big_tcp_tunnels.sh | 17 +++++++++++++++++
 1 file changed, 17 insertions(+)

diff --git a/tools/testing/selftests/net/big_tcp_tunnels.sh b/tools/testing/selftests/net/big_tcp_tunnels.sh
index 003878df7415..cc0875e52fb9 100755
--- a/tools/testing/selftests/net/big_tcp_tunnels.sh
+++ b/tools/testing/selftests/net/big_tcp_tunnels.sh
@@ -49,6 +49,8 @@ setup() {
 
 	ip netns exec "$SERVER_NS" netserver >/dev/null
 	wait_local_port_listen "$SERVER_NS" 12865 tcp
+
+	DEFAULT_TCP_MIN_TSO_SEGS=$(ip netns exec "$CLIENT_NS" sysctl -n net.ipv4.tcp_min_tso_segs)
 }
 
 setup_tunnel() {
@@ -135,6 +137,21 @@ do_test() {
 		IPTABLES_SACK=ip6tables
 	fi
 
+	if [ "$3" != 'on' ] && [ "$KSFT_MACHINE_SLOW" = yes ]; then
+		echo 'Slow configuration; increasing net.ipv4.tcp_min_tso_segs and initcwnd'
+		ip netns exec "$CLIENT_NS" sysctl -w net.ipv4.tcp_min_tso_segs=52
+		if [ "$2" = 4 ]; then
+			ip -netns "$CLIENT_NS" \
+			    route change 192.168.2.0/24 dev tun0 initcwnd 100
+		else
+			ip -netns "$CLIENT_NS" -6 \
+			    route change 2001:db8::2:0/112 dev tun0 initcwnd 100
+		fi
+	else
+		ip netns exec "$CLIENT_NS" \
+		    sysctl -w net.ipv4.tcp_min_tso_segs="$DEFAULT_TCP_MIN_TSO_SEGS"
+	fi
+
 	ip netns exec "$SERVER_NS" "$IPTABLES" -w -t raw -I PREROUTING -i "${CAPTURE_IFACE}1" -m length ! --length 0:65535 -m comment --comment "bigtcp"
 	ip netns exec "$CLIENT_NS" "$IPTABLES" -w -t raw -I OUTPUT -o "${CAPTURE_IFACE}0" -m length ! --length 0:65535 -m comment --comment "bigtcp"
 	ip netns exec "$SERVER_NS" "$IPTABLES_SACK" -w -t raw -I OUTPUT -o "tun1" -p tcp -m tcp --tcp-flags ACK ACK --tcp-option 5 -m comment --comment "sack"
-- 
2.55.0

