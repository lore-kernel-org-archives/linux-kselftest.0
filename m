Received: from mail-pj1-f54.google.com (mail-pj1-f54.google.com [209.85.216.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D04073A8722
	for <linux-kselftest@vger.kernel.org>; Tue, 16 Jun 2026 22:34:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781649290; cv=none; b=Q9ygrF7JVm73h+ekcVSebOWmko/md3B7jzz9xVHNPtqkwadsU2n6stTXrGDKB7JIBOq0D7L2o7JVSaHLqIF9baVBpK5pKN4+G4qIbW6177fIIwze1Agy0jbxJToXiKuu5+bB2fnzzztkYrCZcNZuMv+HrsslHCLuSp3qr96LrdE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781649290; c=relaxed/simple;
	bh=MREMlX9+LgltRptf+kqR2KqPhCAifCYS3oH3GLnZZxs=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=bmtgFY1wDN7s+/iJyzDNgbBC2kzAmoWP/hmgax/GJ7t3Kd6JXdx0/lmLtc1qOFfgKXyUEdL54kSo7F3qMCuJaSkzhR+G1u5BAVHmdbOEu66fTPPN2Af+TZwtwg9BB+bSbf3vX5sNBtNodqTKCuNmgWjuvaGqDi2rVAsU27wPFl0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=i0GawATe; arc=none smtp.client-ip=209.85.216.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="i0GawATe"
Received: by mail-pj1-f54.google.com with SMTP id 98e67ed59e1d1-36bdda53d99so1942485a91.0
        for <linux-kselftest@vger.kernel.org>; Tue, 16 Jun 2026 15:34:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1781649288; x=1782254088; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ipTVbRJPrzwAu2tBqpowbpcPQxDZEeCQYuQNdgsgv14=;
        b=i0GawATehAtCjIJ0YgoTI1ZrS8nOQXtGatbWqSQFLsXgEoRhWnO4RHVqUWv3miNwgZ
         rz4AYj4ZeOyWSy+PGklpZ/shTz/EAz/YKiFAHyS9g31hAjfbEveczIDwnoVtjcj8TMIV
         8ocGN6YViRoX/D0kj6fG5SxHi9+Fn5KvnYNz4kgJPCjOqXySJ5y5Ab7a5HkxhljyZYyD
         6lc0RBJzQNqYPPog1v3/znpqMtpmW6Xu2Rpb+vAqabEYXOnV2cW4TLWIbH2M/9dqOUCu
         bXRdalvDHrXRDYR+YOSTSEW2DZ6J7bf18gqEwjzuT8tgoRzsYOCY8h4YBHHLZrQ/53hB
         LMFg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781649288; x=1782254088;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=ipTVbRJPrzwAu2tBqpowbpcPQxDZEeCQYuQNdgsgv14=;
        b=U7N+3PwZMGrSx/8Y3X0g2tosvZLQ6zIhCCcAYvHJ8jFjbPFGqNUgkVjpA8qu8p7trr
         +OXCU/tk6iEArOauog1AAhqJidUqUhhHVnMBTmqa8I15Pw9eSMdI0en5EBU35WAz1on3
         G89r3KDojhXUxZOtBqtSra1epsNCLAGaVKFDLmLAiYZptYyRd+EZnWtyDXbkW/N9XUVJ
         sVTYbAvbK8Q+L63CUfxlZj84a/U7GVC2Sm5IP5VK8NKPinGubxpYIQ2GeMTEC6qSYVg7
         TVD/5ZhmYLs6WBLn8GKfcLHKPkdM7jzQQ9yfeQW3LOvYnqOnthUzDEOC8QF5dmEyOhQZ
         kA1A==
X-Forwarded-Encrypted: i=1; AFNElJ8oPqdi/5HiYnSpoI8divuhL+wbhCwxlvMr4zI51oUBMxr2nciGkeaJQhifViiD/CQiPLxK/m07GeY+hqoKCXQ=@vger.kernel.org
X-Gm-Message-State: AOJu0YzipOvXLUPcFnyWhTAyvexVWDGZ/pf6jr5QwsLXohmcRX3/+Z8E
	6i+w6028XMiSowEbldxaKjBx12HOMvdNkYVl26+mkDka6bfsGCl6XqTI
X-Gm-Gg: AfdE7cmBjx4mU3FdpBDHpuQFlMWH2BJT06jsT2XXEg7wuvJHzfhTBOnE27W9k7jcGCs
	e2H3iLfxUNxduW3pjJ0x7NRd0++5wJeH6AV8wCnH0e+da90EdmBFEmNL+DQJOHkMYatNiiJ9QY4
	D0wMFdj9apgvfgF0rJ3hlcqU1e4mqKMl8D3co1Pgg2esf/+sU3bUN7WMxf0jQNmmjY/Roobc9Oy
	3ZArJsVcXTovaDOsap9pJwDpxqexFYPbwVVdw96dC/rhx5114+jfL8bdHYq+Lr9IQCxtrl5uahq
	1BGkjCfBrp2qkbS0Tq8Njeqd4dImko6QiJF+KiOlbFpUvFm3ZW+XS7WYPuJ5uU5RF4xVMjDOO7P
	FUnm1Mu8YJTLOsgM1Rc/DEWcrB8f0Q+yF6ma/ZhJrBvVJ8gjScQvoF/0kqs4Y3QFC2Hw16Ri2y2
	7CS3O9144sUCFvb9yariJLdHH/xq3QB5qWC0W7HvalNH4CRm4yxFtt4jYjbrdGbDMXwO75eh4=
X-Received: by 2002:a17:90b:2583:b0:35e:d015:d675 with SMTP id 98e67ed59e1d1-37c9345bc79mr1251791a91.7.1781649287777;
        Tue, 16 Jun 2026 15:34:47 -0700 (PDT)
Received: from r912.tailbb6e1e.ts.net ([182.70.116.80])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-37c52092ee3sm4216898a91.0.2026.06.16.15.34.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 16 Jun 2026 15:34:47 -0700 (PDT)
From: Avinash Duduskar <avinash.duduskar@gmail.com>
To: Alexei Starovoitov <ast@kernel.org>,
	Daniel Borkmann <daniel@iogearbox.net>,
	Andrii Nakryiko <andrii@kernel.org>
Cc: Eduard Zingerman <eddyz87@gmail.com>,
	Kumar Kartikeya Dwivedi <memxor@gmail.com>,
	Martin KaFai Lau <martin.lau@linux.dev>,
	Song Liu <song@kernel.org>,
	Yonghong Song <yonghong.song@linux.dev>,
	Jiri Olsa <jolsa@kernel.org>,
	Emil Tsalapatis <emil@etsalapatis.com>,
	John Fastabend <john.fastabend@gmail.com>,
	Stanislav Fomichev <sdf@fomichev.me>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>,
	Paolo Abeni <pabeni@redhat.com>,
	Simon Horman <horms@kernel.org>,
	David Ahern <dsahern@kernel.org>,
	Shuah Khan <shuah@kernel.org>,
	Jesper Dangaard Brouer <hawk@kernel.org>,
	Mykyta Yatsenko <yatsenko@meta.com>,
	Leon Hwang <leon.hwang@linux.dev>,
	KP Singh <kpsingh@kernel.org>,
	Anton Protopopov <a.s.protopopov@gmail.com>,
	Amery Hung <ameryhung@gmail.com>,
	Eyal Birger <eyal.birger@gmail.com>,
	Rong Tao <rongtao@cestc.cn>,
	=?UTF-8?q?Toke=20H=C3=B8iland-J=C3=B8rgensen?= <toke@redhat.com>,
	bpf@vger.kernel.org,
	netdev@vger.kernel.org,
	linux-kselftest@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH bpf-next v2 1/4] bpf: Initialize the l3mdev field for the fib lookup flow
Date: Wed, 17 Jun 2026 04:04:23 +0530
Message-ID: <20260616223426.3568080-2-avinash.duduskar@gmail.com>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20260616223426.3568080-1-avinash.duduskar@gmail.com>
References: <20260616223426.3568080-1-avinash.duduskar@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

bpf_ipv4_fib_lookup() and bpf_ipv6_fib_lookup() build the flow key on
the stack with a bare "struct flowi4 fl4;" / "struct flowi6 fl6;" and
fill it field by field, but never set flowi4_l3mdev / flowi6_l3mdev.

On the non-DIRECT path the lookup goes through the fib rules whenever the
netns has custom rules, which a VRF installs:

	bpf_ipv4_fib_lookup() -> fib_lookup() -> __fib_lookup()
	  -> l3mdev_update_flow()   reads !fl->flowi_l3mdev
	  -> fib_rules_lookup() -> fib_rule_match()
	       -> l3mdev_fib_rule_match()   uses fl->flowi_l3mdev

l3mdev_update_flow() resolves the l3mdev master from the ingress device
only while the field is still zero:

	if (fl->flowi_iif > LOOPBACK_IFINDEX && !fl->flowi_l3mdev) {
		dev = dev_get_by_index_rcu(net, fl->flowi_iif);
		if (dev)
			fl->flowi_l3mdev = l3mdev_master_ifindex_rcu(dev);
	}

Left at a nonzero stack value the resolution is skipped, and
l3mdev_fib_rule_match() then tests that value as an ifindex, so the VRF
master is not resolved and the rule fails to match: an ingress enslaved
to a VRF can fail to select its table. The same value is also read just
before that, by FIB rules matching on an L3 master device
(l3mdev_fib_rule_iif_match()/_oif_match()), so an "ip rule iif/oif <vrf>"
mismatches the same way.

The helper already initializes the other flow fields the rules path
consumes (flowi4_mark, flowi4_tun_key.tun_id, flowi4_uid and the v6
counterparts); flowi*_l3mdev was added to that set afterwards and this
helper was never updated to match. ip_route_input_slow() likewise zeroes
the field before its input lookup. Do the same here.

CONFIG_INIT_STACK_ALL_ZERO masks this by default, but it depends on
compiler support (CC_HAS_AUTO_VAR_INIT_ZERO), so INIT_STACK_NONE builds,
including older toolchains that fall back to it, are exposed. Built with
INIT_STACK_ALL_PATTERN, a plain bpf_fib_lookup (no VLAN, no DIRECT) over a
VRF slave whose destination is routed only in the VRF table returns
BPF_FIB_LKUP_RET_NOT_FWDED, and resolves with this patch; reverting these
two lines flips it back. The series' VRF selftests pass on the default
config either way, so they do not exercise this fix.

Fixes: 40867d74c374 ("net: Add l3mdev index to flow struct and avoid oif reset for port devices")
Signed-off-by: Avinash Duduskar <avinash.duduskar@gmail.com>
---
 net/core/filter.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/net/core/filter.c b/net/core/filter.c
index 9590877b0714..6fa172cb1348 100644
--- a/net/core/filter.c
+++ b/net/core/filter.c
@@ -6162,6 +6162,7 @@ static int bpf_ipv4_fib_lookup(struct net *net, struct bpf_fib_lookup *params,
 	fl4.flowi4_dscp = inet_dsfield_to_dscp(params->tos);
 	fl4.flowi4_scope = RT_SCOPE_UNIVERSE;
 	fl4.flowi4_flags = 0;
+	fl4.flowi4_l3mdev = 0;
 
 	fl4.flowi4_proto = params->l4_protocol;
 	fl4.daddr = params->ipv4_dst;
@@ -6307,6 +6308,7 @@ static int bpf_ipv6_fib_lookup(struct net *net, struct bpf_fib_lookup *params,
 	fl6.flowlabel = params->flowinfo;
 	fl6.flowi6_scope = 0;
 	fl6.flowi6_flags = 0;
+	fl6.flowi6_l3mdev = 0;
 	fl6.mp_hash = 0;
 
 	fl6.flowi6_proto = params->l4_protocol;

base-commit: 140fa23df957b51385aa847986d44ad7f59b0563
-- 
2.54.0

