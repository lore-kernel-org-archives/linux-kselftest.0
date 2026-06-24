Received: from mail-pl1-f172.google.com (mail-pl1-f172.google.com [209.85.214.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B55E92F290A
	for <linux-kselftest@vger.kernel.org>; Wed, 24 Jun 2026 03:05:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782270344; cv=none; b=IapeYY1Tr5aBoUkGEJDrEewKFZcVPz4C3V1i+IN/sv771pjKLsWC5a4M5Kif0H6AmCytK8/YIgk84F246z4C357OkcbM/9QFFXGXpSZVMoUVBTEnMRjojNTNAC/109qlpGs7X+pqt4/OhcFJtTaWuplZS+8ru6eAtbb7Xy+Bhqc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782270344; c=relaxed/simple;
	bh=UkOS4Zij6j47d8xWr8CqnA6kmSLbAZgrAlBfbN4T7y8=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version:Content-Type; b=qDpa/ddjDlmsSOIRKVs+PqvmBOg2Iz/B6OSXND/r7iPS9YqYjj5h/aKrrz3PySt3hk104C/F+WLqeIO8dQWRzPsS6fvIYwBxhR9ai/ePHlcpHkjq+r/zvg8GU7sq3MYO19Hfu1PNellxB72A2ay+9HZ3YETZ8i19WnAxQSmil/g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=KRzBYztp; arc=none smtp.client-ip=209.85.214.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="KRzBYztp"
Received: by mail-pl1-f172.google.com with SMTP id d9443c01a7336-2c68190ade4so11400185ad.0
        for <linux-kselftest@vger.kernel.org>; Tue, 23 Jun 2026 20:05:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1782270343; x=1782875143; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=BbdGJn9JmuxiPTTq09yI7QrKKiSHAVg6js7lpX16usU=;
        b=KRzBYztpv4IwdLgtSVWmRumi4sDjafdTRv5xsYjiTA0wWCVYBWCJVxVileX/VQXfpH
         e1zziuvOixQkH9PmcjJV5KJC9f7nyt/tKRNb4oz5IH16TE6kkBa/1a4f7k0tV2swYNHw
         keg3J/ZA6WJwi4jgUrDcPq1ec36OZanKIQeQYNy3+RmZS53p6exuGpsXC50KSXERP5rw
         jIPQFW8h77VxpygmNDRZtNn64ff+OgXRjBiUeSPE+IFw3UDHsiEXBSbH7iDB4+vrFTXT
         UOVGFzFUn5EQnc6iexUzIB+KtomLy9A1VQbSU3ywLU2b94RVMmJnnheKJahjOor4T2uz
         7gxA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782270343; x=1782875143;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=BbdGJn9JmuxiPTTq09yI7QrKKiSHAVg6js7lpX16usU=;
        b=IPrZnR/1elpGj3CLv84W84R24bUW/UogEgUDZTQJhVddn1uDbzTmuZAGciSKJ9UmCY
         Jz6lAxUbCPlU7vG9A+LE6HOFNda/7vm7jjVNOsZHmh+G4Lo4CTPUojYxLHN+Qvw1DqT4
         g/LF1O7zBMSExqXn7sG/FXh+ZI6clsajSUZOTZKCWg+NS7/2hAZSVQ4jnGIo1YSwWaQb
         hRsRRkztuWi5E2FheNlLqT6rlT89WAMXB4c1+kycEGxZwT6+J6N7pjmKfTwu2dqFdsYQ
         w3W6XJ7yIuw1ryAkKyWovIsHenZIvgEpjedxhQDiBTUTDc469oRLwStKiu1xMNY/v5si
         1lww==
X-Forwarded-Encrypted: i=1; AHgh+Rpg/Nl+plGvPNHh9/hmeQrgekioSebgrjxZUIIzNRg0E6GOfWUl2ZKzXQv1V3WY13rgDuZwc3czlHTlhZQIV54=@vger.kernel.org
X-Gm-Message-State: AOJu0Yxf+soQnHjroZ9X/6Zz02kFT3Dq3MJhaaQAhN/6BrpaATjQd23K
	ihf2SWEbdJjD3H5vWJAxlQtzD4v+ZGwG35GCGUWyELwD+Zk+aRCUNeld
X-Gm-Gg: AfdE7ckQpBbKQ4REQ+FT8BZQR9oJZNQ39du+HYvGPnfFRphIwmI9ZV9Reh7ErSoiwpY
	VRXcJMCnI8Icxq2YAGNLlNXk6eRn9TlpbXBWAg0QoJdO6HhN2pH+bXVOmiWFWJ0RD5SuXYKdmKW
	i3j4QZJDQLyjB6Ias0/tQI4QRytF5rAGKXneub36G+iyVc1Mx3wMD85K3vHyxwvtZsDZwP0pZc8
	GAtXPdZ+iHmiVr7oDb2IoXgbXwuT6ppTVs0EojRM5gruHky2NYumpyDRdqg67nNw3Ik+we4lXYA
	3cAXROEInTdcJP7oo99npMa1yxca+kK4E1kpC9bQo/MWbdGC93oxymzSSL+gsixLDubO2+F3tvz
	foihxB4dmfyCHTjqeufDIPRWUdvuW5hkZZsC1HADrBKVEkaL22PcJ3zhCSEB4faRjqAtecwcAeJ
	cY6RlczsJ20PHvw/yPKj6uBStRAxkhribjKoKNVVQ+PnYaVWj3ogVQ+8A5F5LQ
X-Received: by 2002:a17:903:fa6:b0:2c1:6ed:513b with SMTP id d9443c01a7336-2c7c3eea98bmr53061155ad.16.1782270342806;
        Tue, 23 Jun 2026 20:05:42 -0700 (PDT)
Received: from r912.tailbb6e1e.ts.net ([182.70.116.80])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2c7436d6c16sm122243995ad.23.2026.06.23.20.05.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 23 Jun 2026 20:05:41 -0700 (PDT)
From: Avinash Duduskar <avinash.duduskar@gmail.com>
To: ast@kernel.org,
	daniel@iogearbox.net,
	andrii@kernel.org
Cc: eddyz87@gmail.com,
	memxor@gmail.com,
	martin.lau@linux.dev,
	song@kernel.org,
	yonghong.song@linux.dev,
	jolsa@kernel.org,
	emil@etsalapatis.com,
	john.fastabend@gmail.com,
	sdf@fomichev.me,
	davem@davemloft.net,
	edumazet@google.com,
	kuba@kernel.org,
	pabeni@redhat.com,
	horms@kernel.org,
	shuah@kernel.org,
	hawk@kernel.org,
	yatsenko@meta.com,
	leon.hwang@linux.dev,
	kpsingh@kernel.org,
	a.s.protopopov@gmail.com,
	ameryhung@gmail.com,
	rongtao@cestc.cn,
	eyal.birger@gmail.com,
	bpf@vger.kernel.org,
	netdev@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-kselftest@vger.kernel.org,
	toke@redhat.com,
	dsahern@kernel.org
Subject: [PATCH bpf-next v5 0/3] bpf: bidirectional VLAN support for bpf_fib_lookup()
Date: Wed, 24 Jun 2026 08:35:27 +0530
Message-ID: <20260624030530.3342884-1-avinash.duduskar@gmail.com>
X-Mailer: git-send-email 2.54.0
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

This series adds VLAN awareness to bpf_fib_lookup() in both directions.
BPF_FIB_LOOKUP_VLAN resolves a VLAN egress to its underlying real device
plus the VLAN tag (XDP programs need this because VLAN devices have no XDP
xmit), and BPF_FIB_LOOKUP_VLAN_INPUT runs the lookup as if a tagged frame
had arrived on the matching VLAN subinterface, for iif policy routing and
VRF table selection.

The independent l3mdev/VRF flow-init fix, patch 1 in v1 and v2, was split
out and merged to bpf separately.

An unreducible VLAN egress (a QinQ egress, or a parent in another
namespace) returns BPF_FIB_LKUP_RET_VLAN_FAILURE rather than a best-effort
SUCCESS, so an XDP program cannot mistake it for a physical egress and
silently blackhole the frame at xdp_do_flush(). The code is appended after
BPF_FIB_LKUP_RET_NO_SRC_ADDR (nothing renumbered, tools/ mirror updated)
and is returned only when BPF_FIB_LOOKUP_VLAN is set, so no existing caller
can observe it. On that failure params->ifindex is left at the input; a
program that wants the VLAN device's own ifindex re-issues without the flag.

Changes v4 -> v5 (Toke's review,
https://lore.kernel.org/bpf/87y0g5ca7x.fsf@toke.dk/):

- Patch 1: BPF_FIB_LOOKUP_VLAN only makes sense for XDP, which cannot
  redirect to a VLAN device; a tc program can redirect to the VLAN device
  directly. So bpf_skb_fib_lookup() now rejects the flag with -EINVAL, and
  the fwd_dev out-parameter added in v4 is dropped: with the flag gone from
  the skb path there is no swap to preserve, so the deferred mtu check
  returns to the original dev_get_by_index_rcu(net, params->ifindex). The
  VLAN_FAILURE rewind moves into bpf_fib_set_fwd_params() via an input
  ifindex parameter, so each lookup ends in a plain
  "return bpf_fib_set_fwd_params(...)". The early params->ifindex =
  dev->ifindex that NO_NEIGH and NO_SRC_ADDR report stays where
  d1c362e1dd68a ("bpf: Always return target ifindex in bpf_fib_lookup") put
  it. Dropping fwd_dev also removes the i386 W=1 unused-variable warning the
  kernel test robot reported, since net is used again.

- Patch 2: no code change; add Toke's Reviewed-by.

- Patch 3: the BPF_FIB_LOOKUP_VLAN cases assert the tc helper returns
  -EINVAL and check the egress result on the XDP path, including dmac and
  (for tot_len cases) the route mtu_result; the cross-netns egress case
  runs through bpf_xdp_fib_lookup(); the obsolete skb-mtu-after-swap arm is
  dropped.

Changes v3 -> v4:

- Patch 1: return BPF_FIB_LKUP_RET_VLAN_FAILURE for an unreducible VLAN
  egress, leaving params->ifindex at the input, per Toke's v3 review.

- Patch 3: QinQ-egress and cross-namespace-egress arms expect VLAN_FAILURE;
  an escape-hatch arm re-issues without the flag; and a live-frames arm
  asserts a reducible egress is delivered and a QinQ egress is passed to
  the stack.

Taking the tag as lookup input follows the approach David Ahern suggested
in the 2021 fwmark discussion:
https://lore.kernel.org/bpf/6248c547-ad64-04d6-fcec-374893cc1ef2@gmail.com/

v4: https://lore.kernel.org/all/20260623025147.1001664-1-avinash.duduskar@gmail.com/
v3: https://lore.kernel.org/all/20260617224729.1428662-1-avinash.duduskar@gmail.com/
v2: https://lore.kernel.org/all/20260616223426.3568080-1-avinash.duduskar@gmail.com/
v1: https://lore.kernel.org/all/20260609172052.81613-1-avinash.duduskar@gmail.com/

Avinash Duduskar (3):
  bpf: Add BPF_FIB_LOOKUP_VLAN flag to bpf_fib_lookup() helper
  bpf: Add BPF_FIB_LOOKUP_VLAN_INPUT flag to bpf_fib_lookup() helper
  selftests/bpf: Add bpf_fib_lookup() VLAN flag tests

 include/uapi/linux/bpf.h                      |  50 +-
 net/core/filter.c                             |  97 ++-
 tools/include/uapi/linux/bpf.h                |  50 +-
 .../selftests/bpf/prog_tests/fib_lookup.c     | 717 +++++++++++++++++-
 .../testing/selftests/bpf/progs/fib_lookup.c  |  36 +
 5 files changed, 936 insertions(+), 14 deletions(-)


base-commit: a975094bf98ca97be9146f9d3b5681a6f9cf5ce3
-- 
2.54.0

