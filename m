Received: from mail-wm1-f46.google.com (mail-wm1-f46.google.com [209.85.128.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7032B40EB91
	for <linux-kselftest@vger.kernel.org>; Fri, 16 Oct 2026 21:42:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792186953; cv=none; b=oOnZco0e/p/cGN9lPYnut4ul1/IF20f2C63HJG6/ggCiQX7Eq8orSxNgUH9a3k1hPZhGXcIHirichC2hHxyDwR4qOsChhQjOylx4DTvBMHUwiafaqf7r7Mz9SvjTuSJvxh7+TtFFXEz2HTVv77KgqxwAScHxFJp8irxB7wLvOdk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792186953; c=relaxed/simple;
	bh=dii8AXBOk3+Az7UsFHXFPwZ3TOzk3cjgGLtibgvjexE=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=FssLqcrHfvyjZeyt+cEahSl1jAxzxu90YkV2le/uImxHmC8kba6nSmbu9qfB/23Dces2P76VchrlAhOF7Cygvds6aAF9NYqTainBU6xM7z/02831Ne19dQLy1gJ24t2fZTaXmpKL1dGFTCRra4fVEkAoOlZYLSmC8qvg+RenBxs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=cloudflare.com; spf=pass smtp.mailfrom=cloudflare.com; dkim=pass (2048-bit key) header.d=cloudflare.com header.i=@cloudflare.com header.b=UVKKBRgV; arc=none smtp.client-ip=209.85.128.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=cloudflare.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=cloudflare.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=cloudflare.com header.i=@cloudflare.com header.b="UVKKBRgV"
Received: by mail-wm1-f46.google.com with SMTP id 5b1f17b1804b1-4a16aaf2067so4935225e9.0
        for <linux-kselftest@vger.kernel.org>; Fri, 16 Oct 2026 14:42:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=cloudflare.com; s=google09082023; t=1792186950; x=1792791750; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=nkSrmZ/rIJfb7LmuhXOuls+EtRmQ4jlpcUCCFqAgFDk=;
        b=UVKKBRgVfcn3Gy27jj8bvS0Ot4oUCctL8Z14vhYod5b0d0ZTdC8df1dhdJV5BMlTHP
         /hJC1udtx0mhN7Wwqoep+mgRmo1yrwDxrUjn8bHczRbrcGH1wdFbD7WGazLTNOPJdjIm
         8plkOh38iLcmuYC9ATgV2zbPG8iE5BKofWLOmOhAwe9+t1az8e09mEt1m3ZP26TEQJfi
         rcbsIlwplMr9VoE1WfmSMVVRWzW5pGFgBiLbm8jlkekiKg4mnMq+ACGNzb/msS2LC5vh
         4eboH3e/j+xlHwQEq0cL4ZNKLgbHD14IBwyt2qij5YuHwaHxh4TtiqAT9u4+FrqXbQlh
         EHCA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792186950; x=1792791750;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=nkSrmZ/rIJfb7LmuhXOuls+EtRmQ4jlpcUCCFqAgFDk=;
        b=UyOUPwkm06kCObfSIbpQ132iBrMj2irXZNt6e9iDzycGOuT+xWlG8XfmuiYZc1fEjf
         66br70RnJdx/8C4IAk92/RC80+i255pdaBiDc4TE/ufgXryPqgtqqXlAnUiPMV8envnk
         +M4LdbRfuXR1d/0Z3JOgzxH1b0uTB1v2gLVE/ygCYdzcAZJCmCvIuFYQr2xOPTIOClxE
         9LIbwUOt2kMzi0cVm0FiKBs9mqGD/AN0qmcNBwubXRSwEF8S08rNwFeZs221eW5XWvhw
         2fdO5y3frJjMO0RS1+Q4XV7t0xvUYFvVnq3js1zujwRuNRtqt/6kFnvqtMFdTiACrNL0
         yU5w==
X-Forwarded-Encrypted: i=1; AKwUvBwbDv9WVkddumqsPczULlpHg+UmLdKiRGuP286HH2fPsYFtH8kgAKjtjjHljd0gewdli8utwvpkvy+355QlpIc=@vger.kernel.org
X-Gm-Message-State: AFq9FYIkpnMsS4XjkiThLA2D56LQTF6J7KXxbKaVZmPdwEBhW5Sdse9Y
	C7NK02/ckFxGB4y4KK7VRkSTY4uIRe28lvJ4nBkTNp3g9JzFXfPtk75DHquWgzUPc8A=
X-Gm-Gg: AYBFou2wp+zVhjFWOOiyy9AugkZwG4QsFCVnC78esAbYVXMhCVM3v3FT2jlD3lkyAop
	uVcbJBvTqCSRJKBDR5bFlOhenMjbWRUI9gv9UftZ6kZhtIZc+5jKQ61VDxz5uf0lI5Kww1IJH7i
	Z/oeorocR9nt/tG5xEnrR3N7zpOAIZJmalUuriKsMNKqyHc0zIkw2xcLgslxc2ZVnDk8rjUDdJG
	K2ds80d/6BI+vUPtJZH6wmydvzrwlmbSeZMLLpcH5AB/twQQEDP4BmnUiG7wdT3YXIoPKtIgjAI
	9ud7rxsiAUJf1WHxnzF1BMar//Waac51Pq0fHSo+9foSkTjHDslnvLNtzm6j7RllWDTcsj6SCi8
	STgE27Esy9geG+qpbJgwmrTx413smrDNp+vRZ3BTkk5NTZOUzBKMbv5RnN7h8Zces0/Vmy/3sdG
	wcmnU7f9xtEv4sFId0pJ6xij2lIP9DYaCzqVnaKbnCsYTWmK4UCiAVm3urOPHIpiuTI8QwOuXKV
	0Q7+2tmLKvs61oO2qxrasRucMNg
X-Received: by 2002:a05:600c:1c09:b0:49c:fc6e:8caf with SMTP id 5b1f17b1804b1-4a1d7614ff4mr24321255e9.19.1792186949688;
        Fri, 16 Oct 2026 14:42:29 -0700 (PDT)
Received: from D90XRJJJNQ ([2a09:bac6:37af:ec8::179:190])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48dfd4f8bb6sm7975417f8f.34.2026.10.16.14.42.26
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Fri, 16 Oct 2026 14:42:28 -0700 (PDT)
From: Tianyi Gao <tianyi@cloudflare.com>
To: netdev@vger.kernel.org
Cc: andrew+netdev@lunn.ch,
	davem@davemloft.net,
	edumazet@kernel.org,
	kuba@kernel.org,
	pabeni@redhat.com,
	toke@redhat.com,
	horms@kernel.org,
	bpf@vger.kernel.org,
	shuah@kernel.org,
	hawk@kernel.org,
	kernel-team@cloudflare.com,
	ast@kernel.org,
	daniel@iogearbox.net,
	john.fastabend@gmail.com,
	sdf@fomichev.me,
	linux-kselftest@vger.kernel.org,
	bochaolucky@gmail.com,
	toshiaki.makita1@gmail.com,
	lorenzo@kernel.org,
	Tianyi Gao <tianyi@cloudflare.com>
Subject: [PATCH net 2/2] selftests: net: veth: test XDP_TX to a peer with GRO enabled
Date: Fri, 16 Oct 2026 22:42:17 +0100
Message-ID: <20261016214217.16942-3-tianyi@cloudflare.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20261016214217.16942-1-tianyi@cloudflare.com>
References: <20261016214217.16942-1-tianyi@cloudflare.com>
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Test that XDP_TX frames reach a peer that has GRO enabled and no XDP
program. GRO enables NAPI on the peer, so the frames are queued on the
peer's ring, and the peer's NAPI must be scheduled to process them.

Attach a program that returns XDP_TX for every frame, send 5 echo
requests and check that all of them were sent back and that the peer's
NAPI received them, as counted in its xdp_packets statistic. IPv6 is
disabled on both devices, so that only the echo requests are counted.

Add the program to xdp_dummy.bpf.c in a section of its own, so that the
tests that load "section xdp" still get XDP_PASS.

Signed-off-by: Tianyi Gao <tianyi@cloudflare.com>
---
The XDP_TX program goes into xdp_dummy.bpf.c as a new section instead of
a new file, since it is a single line; 75cc19c8ff89 ("selftests:
drv-net: add xdp cases for ping.py") added the xdp.frags variant there
the same way. libbpf does not know the section name "xdp_tx", but
iproute2 loads it, as tc loads the custom sections in nat6to4.bpf.c.

 .../testing/selftests/net/lib/xdp_dummy.bpf.c |  6 +++++
 tools/testing/selftests/net/veth.sh           | 25 +++++++++++++++++++
 2 files changed, 31 insertions(+)

diff --git a/tools/testing/selftests/net/lib/xdp_dummy.bpf.c b/tools/testing/selftests/net/lib/xdp_dummy.bpf.c
index e73fab3edd9f..95abd67cc184 100644
--- a/tools/testing/selftests/net/lib/xdp_dummy.bpf.c
+++ b/tools/testing/selftests/net/lib/xdp_dummy.bpf.c
@@ -16,4 +16,10 @@ int xdp_dummy_prog_frags(struct xdp_md *ctx)
 	return XDP_PASS;
 }
 
+SEC("xdp_tx")
+int xdp_dummy_tx(struct xdp_md *ctx)
+{
+	return XDP_TX;
+}
+
 char _license[] SEC("license") = "GPL";
diff --git a/tools/testing/selftests/net/veth.sh b/tools/testing/selftests/net/veth.sh
index 8b867e0675a7..0167f78604ef 100755
--- a/tools/testing/selftests/net/veth.sh
+++ b/tools/testing/selftests/net/veth.sh
@@ -334,6 +334,31 @@ ip netns exec $NS_DST ethtool -K veth$DST rx-udp-gro-forwarding on
 chk_gro "        - aggregation with TSO off" 1
 cleanup
 
+create_ns
+ip netns exec $NS_SRC sysctl -qw net.ipv6.conf.veth$SRC.disable_ipv6=1
+ip netns exec $NS_DST sysctl -qw net.ipv6.conf.veth$DST.disable_ipv6=1
+ip netns exec $NS_SRC ethtool -K veth$SRC gro on
+ip -n $NS_DST link set dev veth$DST xdp object ${BPF_FILE} section xdp_tx
+# veth$DST sends every frame back, so neither ARP nor ping gets an answer
+mac=`ip netns exec $NS_DST cat /sys/class/net/veth$DST/address`
+ip -n $NS_SRC neigh replace $BM_NET_V4$DST lladdr $mac dev veth$SRC
+ip netns exec $NS_SRC ping -qc 5 -i 0.01 -W 1 $BM_NET_V4$DST >/dev/null
+tx=`ip netns exec $NS_DST ethtool -S veth$DST | \
+    awk '/rx_queue_[0-9]+_xdp_tx:/ {s += $2} END {print s + 0}'`
+rx=`ip netns exec $NS_SRC ethtool -S veth$SRC | \
+    awk '/rx_queue_[0-9]+_xdp_packets:/ {s += $2} END {print s + 0}'`
+printf "%-60s" "xdp_tx to peer with gro on"
+if [ $tx -ne 5 ]; then
+	echo " fail - $tx frames sent back, expected 5"
+	ret=1
+elif [ $rx -ne 5 ]; then
+	echo " fail - $rx frames received by the peer NAPI, expected 5"
+	ret=1
+else
+	echo " ok "
+fi
+cleanup
+
 create_ns
 
 CUR_TX=1
-- 
2.55.0

