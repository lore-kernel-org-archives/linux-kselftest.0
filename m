Received: from mail-pj2-f43.google.com (mail-pj2-f43.google.com [74.125.227.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6271932E151
	for <linux-kselftest@vger.kernel.org>; Sun, 20 Sep 2026 13:23:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.227.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789910632; cv=none; b=njwlPzFJcvbLnHTvh/rI3wjYRcqm2z3F5Ikf0zyZiKDY8obuXJYGywx0Xtygn5nN2bZysRIoPilF2CIDZyWl8R/zYLDu9dfuGUhrvEFqMBboCu3X/iJcieRYVd20DkIns4fbJQ3jbK2kz0fUGfS9Khdaiy+oEAwm3KFOA4MJNOA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789910632; c=relaxed/simple;
	bh=BFRJNjLUzJzfA/8a04/wk9tNDyU84TQV78mHxEY4ptI=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=oO5tNXKsDhvMLXVJy+5fKzUOd3nPUhkKR67/xGQ6CQPAwB1fZnli3AwM2KYdiG+7TRAZVMCLSiYc90ZyTdkSUyQg0KzOCUR97nozvHLGJ/r44M6hcYyijhbcce4Lisul/K+tqHrCEUuDxPcrbVve2m9qdTTJvtyp+4UCApsnio8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=OF2o0hfn; arc=none smtp.client-ip=74.125.227.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="OF2o0hfn"
Received: by mail-pj2-f43.google.com with SMTP id d9443c01a7336-2d747ed6d6eso21294655ad.2
        for <linux-kselftest@vger.kernel.org>; Sun, 20 Sep 2026 06:23:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789910626; x=1790515426; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=A5OtWrGtaPspTRm2sx0yEDn3GrMGiAo7FKIGCtfn1P8=;
        b=OF2o0hfn0ImRlCgZZhYSu6a1oRLt19qdkNM+GBvu5nfR4f0Oun2Lq4ZEVAGKROh0Ur
         0/8zfeBOK0hcthTAvk2A0prIGSA+HIlHWpljt8C4j5BBdpYE6zQqcelHwP+auHaAdEZB
         kEaD1YFp1fAQFH0ZaQlTri8ABmqwVYe575v3LPlXf7OQXZOBA+lS69Ir/+7BCInzkD+3
         Y+dosLm6v9T0i3GqBe6u1cYhpq1LmL5fUhwn810DjMjQaaRD/EiT03lXDO6hNfxF81+j
         2MZtRHRFRzzwrtKJoTU+bCDkDKU4ddq5v9EL3op1qd6dvqwUKSoC2AtzwVlJzTozxOo4
         0cvg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789910626; x=1790515426;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=A5OtWrGtaPspTRm2sx0yEDn3GrMGiAo7FKIGCtfn1P8=;
        b=XKWeG9XlH8xsA8LlTCyUO8rbsxhrgWiCKPZvCErEjORpK9bCR+WDTADbAlRkCz/a3D
         9WrU40+8Zguk7ZXujcZl4kn8KaZ9jL1FZM9cU2oFU0ulwrC5B2YLFRz0B/37W1yMIz2V
         tPZ6SoJq1wTL6m8QnE52WtxWFiHW2lJfxTd3lkb6jMaBk/qgPnB+Z1PBOyRC/VQDtUoY
         5K2sx03Xob6OpQKuohoQyRj9fzUwXfU0wvrCIrviQdHEDDlF7JgYoWOoh9yxT2zrOOcA
         zR2W6MBGZhEfL4mKlsrQ/JgIYB5HnB9TJUwsdF6Vp7U3luQrZBq7ZyvPBmJ5NUJy/kCn
         6/tA==
X-Forwarded-Encrypted: i=1; AKwUvBw5z2Qeu5EMh4qFMFQEX1RXxORHGYkTC5D9tZHKuRFcu/+E+kN8sTgeFfZgJQOk/b7ZE280mDwF6sXcZGRqBgI=@vger.kernel.org
X-Gm-Message-State: AFuF++mF8LiJ/Hk02nFh4rxl+d7tsIOhhXEGbDg0hM4YCfzv6wdlOrrz
	UozBixNSCIONe0xxaaY1nUiOFyvedrfEG9IldO3KCwWZPsKHQt/vxIbU
X-Gm-Gg: AYBFou0wpwwLSlFld6EWivSCgTPy/3hpf9E7EMeLn2o3bNPIWphchc29LLy0Hhmr+51
	tW+K/UGWFPsUO7hwQuYp2tbJVkzj9ZOpKOVPBxgUOKa6JqFcSlqgg3g+SP+gcMBr2SCsXGWAHRF
	MYe3esaRew4EOZJAto1oxq18GrXCzubENsXlqHKjiRKXtPKYg5rVLYR4q/1crL+kZCT8M8FHmm1
	SmmHsubL2/5J7OO1C+RG67IS3g0ZckgjkRKG30635GpHPmAbqr9W2TlHOm3j0xGV8VCRTlAqufz
	153mYr+kacX4TjGQqZIbmj/gFRQ71ugBd1FiLL0nkGq3OoIecqEpiJw+SaQ4MQ6FMHg8nfFnAxN
	+b8hhhil3HwO98VhsE55UHzrop/cX8M5VrdbSPTvPou2YCIUhuiR11H8vlpTGlEIdZvYe0ShJAX
	dIP4ZvjFz2HBOd3oeikZzR6+AsmIQugQwcMwm09ulzWSjYAKOEJhpVLP6znpAFNQGd/TfToZC6h
	tmRE+P/adQ00A3IA1hx2Vptoguw0gG1
X-Received: by 2002:a17:902:e806:b0:2dd:c053:d742 with SMTP id d9443c01a7336-2ddc053d7ebmr70642425ad.41.1789910626267;
        Sun, 20 Sep 2026 06:23:46 -0700 (PDT)
Received: from 192.168.50.3 ([198.176.50.208])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2df44393990sm4857795ad.20.2026.09.20.06.23.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 20 Sep 2026 06:23:44 -0700 (PDT)
From: Weiming Shi <bestswngs@gmail.com>
To: Alexei Starovoitov <ast@kernel.org>,
	Daniel Borkmann <daniel@iogearbox.net>,
	Andrii Nakryiko <andrii@kernel.org>,
	Eduard Zingerman <eddyz87@gmail.com>,
	Kumar Kartikeya Dwivedi <memxor@gmail.com>,
	Martin KaFai Lau <martin.lau@linux.dev>,
	Song Liu <song@kernel.org>,
	Yonghong Song <yonghong.song@linux.dev>,
	Jiri Olsa <jolsa@kernel.org>,
	Emil Tsalapatis <emil@etsalapatis.com>,
	Ihor Solodrai <ihor.solodrai@linux.dev>,
	"David S. Miller" <davem@davemloft.net>,
	Jakub Kicinski <kuba@kernel.org>,
	Jesper Dangaard Brouer <hawk@kernel.org>,
	John Fastabend <john.fastabend@gmail.com>,
	Stanislav Fomichev <sdf@fomichev.me>,
	Eric Dumazet <edumazet@google.com>,
	Paolo Abeni <pabeni@redhat.com>,
	Simon Horman <horms@kernel.org>,
	Shuah Khan <shuah@kernel.org>
Cc: bpf@vger.kernel.org,
	netdev@vger.kernel.org,
	linux-kselftest@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	co+ac0a8c41de69121d@bugs.sh,
	Xiang Mei <xmei5@asu.edu>,
	Weiming Shi <bestswngs@gmail.com>,
	stable@vger.kernel.org
Subject: [PATCH bpf v2 RESEND 1/2] bpf: reject dev-bound-only programs on other devices
Date: Sun, 20 Sep 2026 21:23:04 +0800
Message-ID: <20260920132303.4109240-3-bestswngs@gmail.com>
X-Mailer: git-send-email 2.55.0
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

__bpf_offload_dev_match() falls back to comparing offdev pointers after an
exact netdev mismatch. Bound-only programs normally have NULL offdevs, so
unrelated netdevs compare equal. A bound-only program on an
offload-registered netdev can instead inherit a real offdev and match a
sibling port. With CAP_BPF and CAP_NET_ADMIN, a caller can use
bpf(BPF_LINK_CREATE) with a different target ifindex to run metadata kfuncs
specialized for the bound driver on the target driver's xdp_buff. Running a
veth-bound program on tun reads beyond tun's bare stack xdp_buff as a
veth_xdp_buff.

  Oops: general protection fault, probably for non-canonical address
  KASAN: null-ptr-deref in range [0x0000000000000010-0x0000000000000017]
  RIP: 0010:veth_xdp_rx_timestamp (drivers/net/veth.c:1673)
  Call Trace:
   ...
   tun_build_skb (drivers/net/tun.c:1739)
   tun_get_user (drivers/net/tun.c:1856)
   tun_chr_write_iter (drivers/net/tun.c:2091)
   vfs_write (fs/read_write.c:595 fs/read_write.c:687)
   ksys_write (fs/read_write.c:739)
   do_syscall_64 (arch/x86/entry/syscall_64.c:84)
   entry_SYSCALL_64_after_hwframe (arch/x86/entry/entry_64.S:121)
  Kernel panic - not syncing: Fatal exception in interrupt

Restrict non-offloaded programs to exact netdev matches and retain the
shared-offdev fallback only for genuinely offloaded multi-port programs.

Cc: stable@vger.kernel.org
Fixes: 2b3486bc2d23 ("bpf: Introduce device-bound XDP programs")
Reported-by: <co+ac0a8c41de69121d@bugs.sh>
Link: https://lore.kernel.org/bpf/20260917161335.1020405-2-bestswngs@gmail.com/
Assisted-by: LLM
Signed-off-by: Weiming Shi <bestswngs@gmail.com>
---
Resend:
- Start a new thread after the previous v2 was threaded under v1; no patch
  changes.

Changes in v2:
- Drop the redundant offdev NULL check.
- State the capability requirements instead of using attacker wording.
- Move the regression test to patch 2.

 kernel/bpf/offload.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/kernel/bpf/offload.c b/kernel/bpf/offload.c
index 0d6f55695..d85539981 100644
--- a/kernel/bpf/offload.c
+++ b/kernel/bpf/offload.c
@@ -698,6 +698,8 @@ static bool __bpf_offload_dev_match(struct bpf_prog *prog,
 		return false;
 	if (offload->netdev == netdev)
 		return true;
+	if (!bpf_prog_is_offloaded(prog->aux))
+		return false;
 
 	ondev1 = bpf_offload_find_netdev(offload->netdev);
 	ondev2 = bpf_offload_find_netdev(netdev);
-- 
2.55.0
