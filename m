Received: from mail-pf1-f178.google.com (mail-pf1-f178.google.com [209.85.210.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A61453A0EA6
	for <linux-kselftest@vger.kernel.org>; Tue,  9 Jun 2026 10:02:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.178
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780999349; cv=none; b=NPwcyiNtLgtdOz3H1bJn5gW4AH3/yALdDbW0cWRxBv9k0DHBEA6j51IybsQXNn5Lc0V2v4RxuzrzrkCvDYAAsPx3vseznAxreHvwg5eFFK48s5+L3y1vqpfZPBGVudKzWcJAP5g1PjR4OwmflzmcglHJe5MW2fOrOyiHsKbIvZE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780999349; c=relaxed/simple;
	bh=nzrDL90bsBsB7WBv1krwtYWNciI5KVTJUXqrlhwrMKI=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=FCXbUoeEZN7wnyHYg4l6mdUbeQIVzvyKP/SR9dsVQHZXEJqNnCVFoDWYR8+asIX+ohue3HWoeFV57gbffa0xeBjW3DymwW6P8v279NvXHVajhSdjtkgog7R8eEvoZ7U9aN+mLZbZiM6eA12aiehK8BDmKAPhd0sh4JN3upUHT0w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Wz5V17dK; arc=none smtp.client-ip=209.85.210.178
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Wz5V17dK"
Received: by mail-pf1-f178.google.com with SMTP id d2e1a72fcca58-8422524cb38so1783801b3a.0
        for <linux-kselftest@vger.kernel.org>; Tue, 09 Jun 2026 03:02:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1780999346; x=1781604146; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=c5QAVN7p+JjAGllf82nuL6xsG4iI4YYCey6nu5LA5pQ=;
        b=Wz5V17dKhlowDP4Ul5hWJA9qKji/zC23EReD2SoZjbpwMOVwEpam9c8URHo8RJAZEJ
         BvYgLIvQaBr7hQISlFPL7UajfM5hQvYD1iEa8t0vKImAHBxKrSmgHQrUfQoNDHVxDv2/
         4YMQVxIITDlBFS3y4MObYz+ZVD6msXfOpsgIYEYgnhyUSj5szUS65RPeRJN55MSzN6Dq
         PGPhY7Xxdo0xwmfkUW9JSUDk/JTxItIlhyvzJ9lnQaC2LTCut6VnFKxirWd5hFCaviJz
         6u8hM+AXXZH9sWdyy9pwADbSS0waopVEpPXhw0cU4wIXDDQM596a0oHNkMC6Lul6xRLC
         MvbQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780999346; x=1781604146;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=c5QAVN7p+JjAGllf82nuL6xsG4iI4YYCey6nu5LA5pQ=;
        b=i6Lzyen1t0uH9swyv89rFYZw7JLQmBgGC4tHajlnDntpuwhnVHec5QVrEM8YzvyJMR
         naYLNskoI7TFQclQSV0HVOC3tPfHq5Z1jMBAgGAWXIR8aQpv9QSgHA2Mfye7MG2+WBpU
         SERJmJrOW5k3u9kt0gi7K6PnNvkDbSaCSQGjA7nqIirYnw+vUIHgLbPFtG1bFPzs/6q/
         is8s34A92Ho46zdzQNSUn9R8yaZRL7SMNC72DdCpb/q6TTsdFas1GwX1RR0uGJQVVJSD
         jT90VGIQtfEMoyxclEBfaJmEv/2FE6YNtBr3DQKhLA7qC5uN1JuI1NGdojToNyxN+8x2
         D4iw==
X-Forwarded-Encrypted: i=1; AFNElJ9bb8cuZMd6VI2uMvZt0a+MYMdNz1t9lCSEW1vTeH2dt2KV/IcYCnqL9YqbB04/nhPq0/OnwvQnQLoXAZYFMOo=@vger.kernel.org
X-Gm-Message-State: AOJu0YzHlcMOdiRtXuKsPxANWL50ZlkaMQFVMBh1wLq6/tvAii5ys0Kv
	Xmqv9XR3sCwSyOr8CIoc7sUe1kKu7q2fA+dTdomRlsKH+CGoLkDVaqND
X-Gm-Gg: Acq92OH8HhwZ4BpnzPtjNiblR2Ue36iz4w6rMVdpFxd0bvhCPAuY/8HoF0bQPdGOC2h
	cvpkBXgR40p3tnxbjWNR54xi6wTehXw3rS78/UfcjXnPS6gT9e64GodZa+RIbyEhWeiuxUftfMo
	54Ptg8R9xpdVDNh77Mle+264U2N0FZKhJQDQikJdXA39yVi36i9aMLeJaR2NRov0txJkzOgo491
	WxeQSmxPi1uMLP4OOOpNMQK51WSy1XFlsSLW6Jf1hxfkBPWB0NzSnov9hn4lYtrru9ph8s/2kbg
	LxUjCwyVeqipBDogaCBnApQon1fswD1JX3bCz60dxjzMCwRLdniXDe7fQjM6Yr5YoCD7IOT5yjS
	DO8wSrOK4JdaEitK1jMWLTG00QN+34z++7Qo3AZVssYOtzjZmXfICCDIQfw4Kzex1I6e2UkgZY9
	Kq7/Ta7YXsGwzGURxySb8MvTTV613KfhOaAGvzPpOg2ABY1/s3kNYlQn3Q5rXOWQR1Kgd1CHkSB
	aJx8AHHv4nLux48Zj76OtcylxDz
X-Received: by 2002:a05:6a00:4407:b0:837:e9cc:d470 with SMTP id d2e1a72fcca58-842b0e84bbamr20569193b3a.20.1780999345960;
        Tue, 09 Jun 2026 03:02:25 -0700 (PDT)
Received: from u2404-VMware-Virtual-Platform.localdomain ([2a12:a304:100::109f])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-84282378986sm21365151b3a.22.2026.06.09.03.02.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 09 Jun 2026 03:02:25 -0700 (PDT)
From: Sun Jian <sun.jian.kdev@gmail.com>
To: bpf@vger.kernel.org
Cc: netdev@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-kselftest@vger.kernel.org,
	ast@kernel.org,
	daniel@iogearbox.net,
	andrii@kernel.org,
	martin.lau@linux.dev,
	davem@davemloft.net,
	kuba@kernel.org,
	hawk@kernel.org,
	john.fastabend@gmail.com,
	sdf@fomichev.me,
	shuah@kernel.org,
	liuhangbin@gmail.com,
	Sun Jian <sun.jian.kdev@gmail.com>
Subject: [PATCH] bpf: Unshare cloned skb before devmap egress XDP program
Date: Tue,  9 Jun 2026 18:02:14 +0800
Message-ID: <20260609100214.337538-1-sun.jian.kdev@gmail.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

dev_map_redirect_clone() uses skb_clone() when redirecting a generic XDP
skb to multiple devmap destinations. The cloned skb can share packet data
with other clones.

If the destination devmap entry has an egress XDP program, that program
can modify packet data. Such modifications can then be observed by other
clones sharing the same packet data.

This can be reproduced by strengthening xdp_veth_egress to configure a
different source MAC for each egress device and checking that store_mac_1/2
observe the MAC configured for their own egress devices. Without the fix,
the SKB_MODE subtest observes store_mac_1 receiving the MAC configured for
the next egress device.

Fix this by unsharing the cloned skb before running the devmap egress XDP
program. Limit the extra copy to destinations with an attached egress
program.

Tested with:
  ./test_progs -t xdp_veth_egress
  ./test_progs -t xdp_veth
  ./test_progs -t xdp

Fixes: e624d4ed4aa8 ("xdp: Extend xdp_redirect_map with broadcast support")
Signed-off-by: Sun Jian <sun.jian.kdev@gmail.com>
---
 kernel/bpf/devmap.c                                 |  6 ++++++
 .../selftests/bpf/prog_tests/test_xdp_veth.c        | 13 ++++++++++---
 2 files changed, 16 insertions(+), 3 deletions(-)

diff --git a/kernel/bpf/devmap.c b/kernel/bpf/devmap.c
index cc0a43ebab6b..4ae65d44f9d6 100644
--- a/kernel/bpf/devmap.c
+++ b/kernel/bpf/devmap.c
@@ -730,6 +730,12 @@ static int dev_map_redirect_clone(struct bpf_dtab_netdev *dst,
 	if (!nskb)
 		return -ENOMEM;
 
+	if (dst->xdp_prog) {
+		nskb = skb_unshare(nskb, GFP_ATOMIC);
+		if (!nskb)
+			return -ENOMEM;
+	}
+
 	err = dev_map_generic_redirect(dst, nskb, xdp_prog);
 	if (unlikely(err)) {
 		consume_skb(nskb);
diff --git a/tools/testing/selftests/bpf/prog_tests/test_xdp_veth.c b/tools/testing/selftests/bpf/prog_tests/test_xdp_veth.c
index 3e98a1665936..52d79d5c5629 100644
--- a/tools/testing/selftests/bpf/prog_tests/test_xdp_veth.c
+++ b/tools/testing/selftests/bpf/prog_tests/test_xdp_veth.c
@@ -456,7 +456,11 @@ static void xdp_veth_egress(u32 flags)
 			.remote_flags = flags,
 		}
 	};
-	const char magic_mac[6] = { 0xAA, 0xBB, 0xCC, 0xDD, 0xEE, 0xFF};
+	const unsigned char egress_macs[VETH_PAIRS_COUNT][ETH_ALEN] = {
+		{ 0xAA, 0xBB, 0xCC, 0xDD, 0xEE, 0x01 },
+		{ 0xAA, 0xBB, 0xCC, 0xDD, 0xEE, 0x02 },
+		{ 0xAA, 0xBB, 0xCC, 0xDD, 0xEE, 0x03 },
+	};
 	struct xdp_redirect_multi_kern *xdp_redirect_multi_kern;
 	struct bpf_object *bpf_objs[VETH_EGRESS_SKEL_NB];
 	struct xdp_redirect_map *xdp_redirect_map;
@@ -512,7 +516,7 @@ static void xdp_veth_egress(u32 flags)
 						 &net_config, prog_cfg, i))
 			goto destroy_xdp_redirect_map;
 
-		err = bpf_map_update_elem(mac_map, &ifindex, magic_mac, 0);
+		err = bpf_map_update_elem(mac_map, &ifindex, egress_macs[i], 0);
 		if (!ASSERT_OK(err, "bpf_map_update_elem"))
 			goto destroy_xdp_redirect_map;
 
@@ -531,13 +535,16 @@ static void xdp_veth_egress(u32 flags)
 
 	for (i = 0; i < 2; i++) {
 		u32 key = i;
+		__be64 expected = 0;
 		u64 res;
 
 		err = bpf_map_lookup_elem(res_map, &key, &res);
 		if (!ASSERT_OK(err, "get MAC res"))
 			goto destroy_xdp_redirect_map;
 
-		ASSERT_STRNEQ((const char *)&res, magic_mac, ETH_ALEN, "compare mac");
+		/* store_mac_1/2 run on the second/third remote veths. */
+		memcpy(&expected, egress_macs[i + 1], ETH_ALEN);
+		ASSERT_EQ(res, expected, "compare mac");
 	}
 
 destroy_xdp_redirect_map:
-- 
2.43.0

