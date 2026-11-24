Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.44
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795560667;
	b=xnYNNdqBPoSDRU6fSaZDsy4aJ1akMBamuX+A0Rt6fAhI3B8X3fAJv9MH6bw/9AMwIoOL
	 Tb9zdv6rLIXocNT15DiB53lTa3exBCRsKAvFv7tfvxjHlX8fFfJTAFeHmVBwef1gNTLz6
	 xD7LO3l0hFhWXip319x4ZIL8nqZ9bZzC1q2Lozuaz8p4mHZpZlxb2mxn/lf7LP2HRShwk
	 QRs/v8RBf/ZodUAzCnbzrxUZnh2DmlsoWxKVO2SQFBqva5D9O2Ge93lQ0W0ABRxXhcLgR
	 ThXOwR/a3jm5mRBgsZXPtlrVBYpE+XqZBItEviQRtf8GGUF6wQBh+UyTIji30KB37LQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795560667;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:MIME-Version:Content-Type:
	 Content-Transfer-Encoding;
	bh=ODGhYIIYNFU8UQMeuzcpsug8h5Njy7gCjB7swzLesxY=;
	b=HVLaE1VxQ1ranUcAKwJG6Lzu4UNyFn2rBRpGbCXWzFHNlt80UET7xUfX/gUNaRenFhEV
	 MLYAcAYF9baA+Fg11J1sBSGCaKgp9yIMlDAJ7C9NXxRYBZ1WcFBu3dJ1mIU/leu8zn96o
	 3P1paprg1Cp747QCskrouY+x4P364j06k2txkTDqsGacsAv+vApK/TyHW1EyjX4f2N1uA
	 DaNEMgo30Z/lR2ZgARRBRMi1F2Ea+Wx3Zn4by/d+ncHMqTZUcnijDnS0YO775og6VX3Jk
	 ifAVcwwvq6gTN5yr1L4I935Ap7TVR8X2TO8c1nTHSoQZhteDBT23gUdcYkMb4CVFWSA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b="qTp/BsIc";
	arc=none smtp.remote-ip=209.85.128.44
Received: from mail-wm1-f44.google.com (mail-wm1-f44.google.com [209.85.128.44])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 55BB8606A326
	for <linux-kselftest@vger.kernel.org>; Tue, 24 Nov 2026 22:51:06 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 55BB8606A326
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=qTp/BsIc
Received: by mail-wm1-f44.google.com with SMTP id 5b1f17b1804b1-4a2153c8525so41013765e9.3
        for <linux-kselftest@vger.kernel.org>; Tue, 24 Nov 2026 14:51:06 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795560665; x=1796165465; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:message-id:date
         :subject:cc:to:from:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=ODGhYIIYNFU8UQMeuzcpsug8h5Njy7gCjB7swzLesxY=;
        b=qTp/BsIc4HSUr/a/efb4ZfI8s76HJe2q/L3mrsg6HT+xfczyQ422bq9vkIWYaGphRu
         OEovo9d47tz5RxgXJKea2DfI0kqymDyuRWooJWiJqfUKVJeIvFvkQ5RNIzv/FgyN/kY2
         MSdpzvEl4WrPPpaJy2oKUviyBM3mFa7DmMcyiak4lN9PkElw/iFlonkEp8uiP2UL+k+s
         GMyYokK7Murf/aKXahzFTG+Y9TlJajJlOgY+HX8PmmSB8hcB5wpXlLNg4cMdTqe2Nf9W
         QDeVbdaWbkhsB3ch/LqwHdcKEkdxxvHvmHruhICT9EnPF1D7RwS2w2OoOLjyIWcA352s
         TmQg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795560665; x=1796165465;
        h=content-transfer-encoding:content-type:mime-version:message-id:date
         :subject:cc:to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=ODGhYIIYNFU8UQMeuzcpsug8h5Njy7gCjB7swzLesxY=;
        b=dLIEvtgRz9MzPSuy3KE1IpztPjC654eVwAh9qH/rNftqTmkyE0UoLh7JffGG5Esku0
         EIL2eeySkXVdwamlJZe9/7UJeUWEIj1qpno4h69yQfHUuiPv3ygR296e00K1/zG3l7jj
         4z6677d4kap0AGJeCeKza0G+SlN0hnawpur7BxDb41qrgy40hQOP9ivmlZUQIZox6ZcW
         ZYhB/KRktNQJZEVbbuVY6npr4exAuV/xrhWieWffSbyjCoZH2lekrhPITV/8oJaBXYt3
         dlaMGAi9XnnVV6jaeaK4RaEY+r2BpOD2BlrZ64FvPlO5/DmV2FBgctoj+8FOxw9A+yA/
         1Jdw==
X-Forwarded-Encrypted: i=1; AL+hErEis8It57/ACrRL8xaIXKtPiNtaOrLCKEJVaOZAyGgYml1JtB1/pwgXTI6VqStyjPH473xt3U/kB9RZQEf+QoM=@vger.kernel.org
X-Gm-Message-State: APuU4Z/6kWOG/h8p8zozF0t5y27umeD7sggwC8JGesCRZIiagNVYYeru
	5DtH5gCevaMJxUUd10QPPHYCES/JNJazTxh9f0uTxATJQNp5d2wD4zU=
X-Gm-Gg: AZFdTZcUHFonpgkGhaftVXwk6LpXVqdDAWGYh/feuIKoWlRo7zVKHLAo1mQvWzTsaqy
	P9LB1tTshaFkPuvbT160xVlSGrbW42yzdlL64j0ytlYy3nh7BfANKBa1zd73z3yjwCxbBgwKbrk
	ePf54WB5Xz5YG1I0FfInmqP6kbc1qgfCPnG/l6FKGGwm9bsmhF9spwfUL3ZcGmpynawRIAcJw8s
	CSPGtJ2s/ETZocSPX55X//mKM2+kbgn1/8KeicDSq/nwWFeGRLs2vc3lcXAA0JqO0TbW0XOUByB
	DevhLlia9QpM+DMqbdvbCUJDJTkmkSmvczh50RMf1KOakX3AdurAv2i3xT/8LqFnQ89d0TtpiUO
	K2dzboB94MjkljdskwLWa6NnjdG69qQBcY9r6dbIPekwNephReZmnRr0FHypQr27riK/wtaUicm
	kx1L7Bo9D24ISC5L3lUGygXaydKj9FeH70l1pe84wd1ZyrkbhpJVIBpTbVZCYBuszY0SLOiDSTf
	lqP2pvGP3DU7DekSBa7rA1xc5xXmETSKhLj+OVcOWvcdvH6HOAAUD1+6UGfukzUvV8IfB+agb4y
	loo7eq8v0eTr7/z+G2AQu4sqvVSOYI57Gub3qMn9dqnMoYXE4zMyAL8Tcq/DJjwbIUUzERwAfjq
	GcLJRRnjf3yzlKkGM6yCF9qUYYFeWAL/U90zmJG23ZPSkO6aZeNampJzMwxg8phyplO2fm4Ne2U
	0PvD5Mu8dggDz4Yb7bLeKrCKqEDQIlf3h1
X-Received: by 2002:a05:600c:848d:b0:4ac:86c9:b09c with SMTP id 5b1f17b1804b1-4bb88811da9mr336204505e9.13.1795560664476;
        Tue, 24 Nov 2026 14:51:04 -0800 (PST)
Received: from localhost.localdomain (dynamic-2a02-3100-2ec1-8a00-a10d-4335-1e05-e7ae.310.pool.telefonica.de. [2a02:3100:2ec1:8a00:a10d:4335:1e05:e7ae])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4bb853a1e8bsm393839525e9.9.2026.11.24.14.51.01
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Tue, 24 Nov 2026 14:51:02 -0800 (PST)
From: Tobias Philipp <tphilipp@gmail.com>
To: bpf@vger.kernel.org
Cc: Tobias Philipp <tphilipp@gmail.com>,
	Alexei Starovoitov <ast@kernel.org>,
	Daniel Borkmann <daniel@iogearbox.net>,
	Andrii Nakryiko <andrii@kernel.org>,
	Martin KaFai Lau <martin.lau@linux.dev>,
	Eduard Zingerman <eddyz87@gmail.com>,
	Kumar Kartikeya Dwivedi <memxor@gmail.com>,
	Song Liu <song@kernel.org>,
	Yonghong Song <yonghong.song@linux.dev>,
	Jiri Olsa <jolsa@kernel.org>,
	John Fastabend <john.fastabend@gmail.com>,
	Stanislav Fomichev <sdf@fomichev.me>,
	Emil Tsalapatis <emil@etsalapatis.com>,
	Ihor Solodrai <ihor.solodrai@linux.dev>,
	Jesper Dangaard Brouer <hawk@kernel.org>,
	"David S. Miller" <davem@davemloft.net>,
	Jakub Kicinski <kuba@kernel.org>,
	Shuah Khan <shuah@kernel.org>,
	Felix Fietkau <nbd@nbd.name>,
	=?UTF-8?q?Thibaut=20VAR=C3=88NE?= <hacks@slashdirt.org>,
	Stijn Tintel <stijn@linux-ipv6.be>,
	Daniel Mack <daniel@zonque.org>,
	netdev@vger.kernel.org,
	linux-kselftest@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH bpf-next v2 0/4] bpf: Fix 8-byte alignment of map values
Date: Tue, 24 Nov 2026 23:50:51 +0100
Message-ID: <20261124225055.87344-1-tphilipp@gmail.com>
X-Mailer: git-send-email 2.54.0
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Post: <mailto:linux-kselftest@vger.kernel.org>
List-Help: <mailto:linux-kselftest+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kselftest+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

The verifier checks the alignment of BPF_DW atomics and 64-bit
load-acquire/store-release on PTR_TO_MAP_VALUE only against the offset
within the value. It assumes that the value itself is 8-byte aligned.
That does not hold for all map types. Address of the value mod 8, as
measured on bpf-next (see Testing below):

                                    64-bit    32-bit
  lpm_trie, key_size 8 (IPv4)          4         0 (by accident)
  lpm_trie, key_size 20 (IPv6)         0         4
  hash, rhash (BPF_F_NO_PREALLOC)      0         4
  devmap, devmap_hash                  4         4 (harmless, see patch 3)

On arm64 the JIT emits LSE atomics or LDXR/STXR loops, LDAR and STLR
for these instructions. All of them fault on misaligned addresses.
FEAT_LSE2 relaxes that for LSE atomics that stay within a 16-byte
block, and for LDAR/STLR only if SCTLR_EL1.nAA is set, which Linux
does not do. On arm32 the interpreter uses atomic64_*(), i.e.
LDREXD/STREXD, which require 8-byte alignment. On x86-64 a locked
8-byte access at 4 mod 8 that crosses a cache line is a split lock,
which is fatal in kernel mode on CPUs with split lock detection. None
of these faults is fixed up.

Patch 1 is Felix Fietkau's fix for bpf_mem_alloc on 32-bit [1]. It was
posted in July and is not applied yet. It is included unchanged apart
from a rebase, because patch 2 depends on it. It fixes the hash and
rhash rows and the node alignment of lpm_trie on 32-bit. The Sashiko
review of that posting points out a pre-existing 8-byte load of the
4-byte percpu pointer in the bpf_per_cpu_ptr()/bpf_this_cpu_ptr()
fixup on 32-bit. Patch 1 neither causes nor fixes it, and this series
does not address it. Among the 32-bit JITs only x86 supports kfuncs,
so only x86-32 can reach it. Using BPF_SIZEOF(void *) for that load
would fix it.

Patch 2 pads the lpm_trie key to a multiple of 8 bytes, like hashtab
does.

Patch 3 aligns the devmap value.

Patch 4 adds a selftest that checks the address of the value returned
by bpf_map_lookup_elem() for lpm_trie, hash and devmap. It executes no
instruction that needs alignment, so on an affected kernel it fails
instead of crashing.

Patches 1 and 2 have to be applied together: on 32-bit, either one
alone misaligns the IPv4 lpm_trie value (see "arm32 + patch 1" in the
table below), and both commit messages say so. I kept them separate to
keep Felix's authorship; they can be squashed if that is preferred.

The other map types that hand a value pointer to programs return 8-byte
aligned values. cpumap has its value at offset 20 on 32-bit, but the
verifier does not let programs look it up.

Testing, in disposable QEMU VMs:

- arm64, defconfig + selftests/bpf config, QEMU with HVF on an Apple
  M-series host (FEAT_LSE2): map_value_align fails on bpf-next
  (lpm_value_align: 4, devmap_value_align: 4) and passes with the
  series. With the series, test_maps passes the lpm_trie basic_ops,
  batch_ops and get_next_key tests and the hash and array tests, and
  test_progs passes pinning_devmap_reuse and xdp_devmap_attach
  subtests 2 and 3.

- arm32, multi_v7_defconfig + BPF_SYSCALL, QEMU virt with Cortex-A15
  (TCG): test_progs is hard to cross-build for armhf, so a small static
  program does the same check as the selftest: an XDP program looks up
  each map and stores the value pointer in an array map. Address mod 8:

                         lpm IPv4  lpm IPv6  hash  rhash  devmap
    arm32 bpf-next           0         4       4     4      4
    arm32 + patch 1          4         0       0     0      4
    arm32 + patches 1-4      0         0       0     0      0
    arm64 bpf-next           4         0       0     0      4
    arm64 + patches 1-4      0         0       0     0      0

- pahole matches the layouts in the commit messages: devmap val at
  offset 52 -> 56 (arm64, size stays 64) and 28 -> 32 (arm32), and
  lpm_trie_node data[] at 24 (arm64) and 16 (arm32).

- W=1 builds of the four touched kernel files on x86_64, arm64 and
  arm32 produce no warnings.

Not tested: runtime on x86_64; test_progs on arm32; selftests that need
CONFIG_FTRACE or bpf_testmod, which my configuration lacked. That
includes xdp_devmap_attach subtests 1 and 4 and the bpf_obj_new and
percpu allocation tests; they failed to load in the same way with and
without the series. Patch 1 does not change anything on 64-bit. The
LDAR/STLR behaviour with FEAT_LSE2 and the x86 split lock case come
from the Arm ARM (SCTLR_EL1.nAA) and arch/x86/kernel/traps.c; I did
not trigger them.

The lpm_trie bug was found with AI assistance while trying to verify
the correctness of map value accesses with formal methods. Patches 2-4
and this cover letter were written with the help of an AI coding
assistant (Claude Opus 5.5).

[1] https://lore.kernel.org/all/20260717183632.99195-1-nbd@nbd.name/

Changes in v2:
- Target bpf-next (Alexei).
- Fix the 32-bit node misalignment at its root in bpf_mem_alloc by
  including Felix's patch. v1 rounded data_size up on top of a node
  at 4 mod 8 on 32-bit and so misaligned the IPv4 value there, which
  is aligned today (Alexei).
- Drop "data[] __aligned(8)". data[] is at offset 24 or 16 already and
  the annotation changed nothing (Alexei). Add a BUILD_BUG_ON() for
  that offset instead.
- Add the devmap fix (Alexei).
- Add a selftest (Alexei).
- Correct the commit message, which claimed that the IPv4 value is at
  4 mod 8 on all architectures.

v1: https://lore.kernel.org/bpf/20261119155317.11469-1-tphilipp@gmail.com/

Felix Fietkau (1):
  bpf: Fix alignment of memory allocator objects on 32-bit archs

Tobias Philipp (3):
  bpf: Align lpm_trie map values to 8 bytes
  bpf: Align devmap values to 8 bytes
  selftests/bpf: Check that map values are 8-byte aligned

 kernel/bpf/devmap.c                           |  5 +-
 kernel/bpf/hashtab.c                          |  2 +-
 kernel/bpf/lpm_trie.c                         | 19 ++++---
 kernel/bpf/memalloc.c                         |  8 +--
 .../bpf/prog_tests/map_value_align.c          | 51 +++++++++++++++++++
 .../selftests/bpf/progs/map_value_align.c     | 48 +++++++++++++++++
 6 files changed, 121 insertions(+), 12 deletions(-)
 create mode 100644 tools/testing/selftests/bpf/prog_tests/map_value_align.c
 create mode 100644 tools/testing/selftests/bpf/progs/map_value_align.c


base-commit: a58375b858fac35afb78a3dd68ad6a19c01799eb
-- 
2.54.0 (Apple Git-157)

