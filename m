Received: from mail-ej2-f41.google.com (mail-ej2-f41.google.com [74.125.228.169])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 48D0746EF64
	for <linux-kselftest@vger.kernel.org>; Sun,  4 Oct 2026 17:16:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.228.169
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791134201; cv=none; b=DG4LZPbUb6qdTsk04kqqQqiAlBND14r/KN2j0VjFikCDXV3uZ/uTd5m0rUwhyiqixqjWrpIPqyZIDiDBg7LqCpJqIiPgoloHt09yApPmiFTlAkSAdHqyrx7YGNAgRPsu7HZWPRj3v71XA6DK89CZueQf08cGhhtNfV8v2sCFcD4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791134201; c=relaxed/simple;
	bh=o2jtQj2OHXY/6owvSxAwiCPLhU1mv6LvtL3CrbNafTI=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=Eo29MLDNg2yVyuCqZmV8YxEdAk4GD5fhMXidw+A0Oz6C7AOc81Xe4YDZgdH8/WLvJXEJSegf1G9vxg2FMdwP5OWZUbsTVxY0ghuAskeUuITdhLBE8IobYhGa6kckAjiFV/IcuCiNOikE3W4qVQCKhPwt6QbBvTq3560OYBC//E8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bairaktaris.de; spf=pass smtp.mailfrom=bairaktaris.de; dkim=pass (2048-bit key) header.d=bairaktaris.de header.i=@bairaktaris.de header.b=wtHi+Nmp; arc=none smtp.client-ip=74.125.228.169
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bairaktaris.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bairaktaris.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bairaktaris.de header.i=@bairaktaris.de header.b="wtHi+Nmp"
Received: by mail-ej2-f41.google.com with SMTP id a640c23a62f3a-c2e3dcfe205so157965966b.0
        for <linux-kselftest@vger.kernel.org>; Sun, 04 Oct 2026 10:16:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bairaktaris.de; s=google; t=1791134193; x=1791738993; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=+bqyPjoRf7iBEIUgxbf57WQODywLy9nIG08b3lo6o1E=;
        b=wtHi+NmpZ551fCDywJJyI4la05CKLKTZBQQjTmR4d5x9DA1AUt6lvv0VPcDWFuIeaG
         ni9NvMmw1JAAREcGSLz/4Denmv7Y6YfNeq2abzlxrACYALFiW47+FmRvPgw2uvfwtNYL
         sT3cEWrU03xoijwLauCzEhcT+invUb28ENQof69s88FyMX5NWaYRVZRNCVZyHeqGVO2J
         +zb6t+bZqfC7Hj6KHYfJMUKZtlPVOMDgHAUKH3nmV8sE9s/JkCNqePsJNI3yP1Tk59n5
         ybQwhOPV4FcfETIus11kqR6huE/BoRZIl45/2DBj+5w/v82utBRFkcwYNTIl64N765rm
         V90w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791134193; x=1791738993;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=+bqyPjoRf7iBEIUgxbf57WQODywLy9nIG08b3lo6o1E=;
        b=lvkgWFaiDhpEunx+n4e3kw1PYyiTVW5KqnGIc9tMiG5yTmJbCT6qkynWqfC2OnsiH7
         WFkT0XRBolJJ4m4P2Ah5OWze120006aa5A54Vc2ME5XYBZDska4CIgrTr1BsAQGEOiYI
         W6hOUlLZBkn3ZZqF4j2gFDdKuePOEqGJP65hk6gfBk/A85AtKIAr/73UQ7MVtHBTlJe9
         8hG02ozhYvLAB/oZHF01sMJIKY0NtuZFN7NEIYGRfzgIehYtHJ2/6p5HZViGjz0k/Ssz
         yYXOWFYQn4u20+/Hj0CIFVvC7iuZZ4KDG54GxEKoMQ8WLLLU6Y0ijTbi+djpAR7TieA/
         2y0g==
X-Forwarded-Encrypted: i=1; AKwUvBwf3q/TP/bM+ele2xMcj+KxzOo803t7FQQA1XHW9T1CA+F5iOkjpqlPvAfNIm9H26z3N5kws5tG8VUW1M1Q3bw=@vger.kernel.org
X-Gm-Message-State: AFuF++lx2muteidcYQ4+2hRLFfhpoE9oh2nrmvCKvHB3/IrCZUdHxBVK
	HRGUke8Gx5+q4sXU2Sgea8irOU8bepxrF47fbJnS4VswzJqAOxVBxrQq0o5dUqMs6Q==
X-Gm-Gg: AYBFou30MverjZsUsm02dUaL4vtpnWgX778sw7PABiERRU4vDtIQBlNlY3qRBt+gFY8
	BWdC3gmrYx4XK2lzPV/J2gReGeOv8AFc3Av2BL7QtgWo0/vXQQ359ax7OaHsXu85ptrtiI59qFO
	KezJJb26AxgT22PVo0Bm8pytuv2eJah9jeAa0evW6/lbcBMLv3BM8ofYKlQBoCM8cgqjbH7x6eG
	1q90OOKYGWtGaX9Xkixm0mhPjgerWE5JilhwYvZziGYjlod82LdsdY5CgKltyrr1SdmiY0Y4F4N
	4QvKL0ynCcc3ItxZkLTpG8CLiCRwgQslPYN6O/CRRmNRFRLKedtkg9XQXgzXsNm1DkCw/ZUYj2c
	COr/TC34LtzW2b9tJMxdzIt0JErhDeY97hDc34jqREjbvBzdY1/HsdVInUNr+MZlchjjmFaZ4Sr
	WrkzeUyFQrlsxsep9eo9B2UAC7uU5LOyOJa04SWSYWteGi4Pd0a3Azh5xK5ekw5bfSXhgB8a2uv
	mcj8r81mCF7KLlXaWB2gUUlJf+rQIwxxDlgKJivYSSoDLSSURf+EqA3D7lME45Y7Hek1ghtgv2T
	79fBV414SII6qlbbojA8IYH7WPzlQ2yM0Tn+Rg7Sk5Ft0bPlGGR5lk0lZ67LDMCWIpWqCrF+wtz
	lv+kDVSKBqGT64SzszupfB0wVlXU21uBl0h8dHSp0VHzjKLiiJmjkp7DMuqO0jNijaWTszhIAiM
	0nIeiSv94dtkob1UTIRkVN8Kw=
X-Received: by 2002:a17:906:4fc5:b0:c26:1649:47b4 with SMTP id a640c23a62f3a-c2e4afee0demr740206366b.42.1791134192866;
        Sun, 04 Oct 2026 10:16:32 -0700 (PDT)
Received: from Desktop (pd9513667.dip0.t-ipconnect.de. [217.81.54.103])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c2e4cf9ddbesm317345166b.69.2026.10.04.10.16.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 04 Oct 2026 10:16:32 -0700 (PDT)
From: Julius Bairaktaris <julius@bairaktaris.de>
To: pablo@netfilter.org,
	netfilter-devel@vger.kernel.org
Cc: kadlec@netfilter.org,
	fw@strlen.de,
	coreteam@netfilter.org,
	netdev@vger.kernel.org,
	geldot@protonmail.com,
	shuah@kernel.org,
	linux-kselftest@vger.kernel.org
Subject: [PATCH nf-next v2 4/4] selftests: netfilter: cover a TCP flow whose reply is never seen
Date: Sun,  4 Oct 2026 19:16:28 +0200
Message-ID: <20261004171628.3544978-5-julius@bairaktaris.de>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20261004171628.3544978-1-julius@bairaktaris.de>
References: <20261004171628.3544978-1-julius@bairaktaris.de>
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Add a case where ns2 answers over a direct link, so nsr1 only sees the
original direction. The forward hook must count less than half of the
transferred bytes, which only happens when the flowtable takes over the
connection.

Assisted-by: Claude:claude-opus-5
Signed-off-by: Julius Bairaktaris <julius@bairaktaris.de>
---
 .../selftests/net/netfilter/nft_flowtable.sh  | 75 +++++++++++++++++++
 1 file changed, 75 insertions(+)

diff --git a/tools/testing/selftests/net/netfilter/nft_flowtable.sh b/tools/testing/selftests/net/netfilter/nft_flowtable.sh
index 449c518bd947..2c2669b8fccf 100755
--- a/tools/testing/selftests/net/netfilter/nft_flowtable.sh
+++ b/tools/testing/selftests/net/netfilter/nft_flowtable.sh
@@ -516,6 +516,81 @@ else
 	ret=1
 fi
 
+# Asymmetric path test:
+# ns2 answers over a direct link, so nsr1 sees the original direction only.
+# Such a connection never becomes assured, but the flowtable is expected to
+# take over the direction that nsr1 does see.
+check_orig_offloaded()
+{
+	local what=$1
+
+	local orig
+	orig=$(ip netns exec "$nsr1" nft reset counter inet filter routed_orig | grep packets)
+	local orig_cnt=${orig#*bytes}
+
+	local fs
+	fs=$(du -sb "$nsin")
+	local max_orig=$(( ${fs%%/*} / 2 ))
+
+	# the flowtable takes over after the first few packets, so the forward
+	# hook must see a small fraction of the transferred file.
+	if [ "$orig_cnt" -gt "$max_orig" ];then
+		echo "FAIL: $what: original counter $orig_cnt exceeds expected value $max_orig" 1>&2
+		ret=1
+		return 1
+	fi
+
+	echo "PASS: $what"
+}
+
+test_asymmetric_path()
+{
+	ip link add name eth1 netns "$ns1" type veth peer name eth1 netns "$ns2"
+	ip -net "$ns1" addr add 10.0.9.99/24 dev eth1
+	ip -net "$ns2" addr add 10.0.9.98/24 dev eth1
+	ip -net "$ns1" addr add dead:9::99/64 dev eth1 nodad
+	ip -net "$ns2" addr add dead:9::98/64 dev eth1 nodad
+	ip -net "$ns1" link set eth1 up
+	ip -net "$ns2" link set eth1 up
+
+	# ns1 keeps sending through nsr1, ns2 answers on the direct link.
+	ip -net "$ns2" route add 10.0.1.99 via 10.0.9.99 dev eth1
+	ip -6 -net "$ns2" route add dead:1::99 via dead:9::99 dev eth1
+
+	# with PMTU discovery the endpoints size their packets for the
+	# router's link, so the fast path forwards them unfragmented
+	ip netns exec "$ns1" sysctl -q net.ipv4.ip_no_pmtu_disc=0
+	ip netns exec "$ns2" sysctl -q net.ipv4.ip_no_pmtu_disc=0
+
+	ip netns exec "$nsr1" nft reset counters table inet filter >/dev/null
+
+	if test_tcp_forwarding "$ns1" "$ns2" 1 4 10.0.2.99 12345; then
+		check_orig_offloaded "flow offloaded for ns1/ns2 without reply"
+	else
+		echo "FAIL: flow offload for ns1/ns2 without reply" 1>&2
+		ip netns exec "$nsr1" nft list ruleset 1>&2
+		ret=1
+	fi
+
+	ip netns exec "$nsr1" nft reset counters table inet filter >/dev/null
+
+	if test_tcp_forwarding "$ns1" "$ns2" 1 6 "[dead:2::99]" 12345; then
+		check_orig_offloaded "IPv6 flow offloaded for ns1/ns2 without reply"
+	else
+		echo "FAIL: IPv6 flow offload for ns1/ns2 without reply" 1>&2
+		ip netns exec "$nsr1" nft list ruleset 1>&2
+		ret=1
+	fi
+
+	ip netns exec "$ns1" sysctl -q net.ipv4.ip_no_pmtu_disc=1
+	ip netns exec "$ns2" sysctl -q net.ipv4.ip_no_pmtu_disc=1
+
+	ip -net "$ns1" link del eth1
+	ip netns exec "$nsr1" nft reset counters table inet filter >/dev/null
+}
+
+test_asymmetric_path
+
 # delete default route, i.e. ns2 won't be able to reach ns1 and
 # will depend on ns1 being masqueraded in nsr1.
 # expect ns1 has nsr1 address.
-- 
2.53.0

