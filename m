Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.221.43
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794694533;
	b=d4rNuhx2GsXiwS5yUJVZUF3jT4072ZLGAcEGjX5bmv3+3Fo9azkQSHpq8uNeRcy66npi
	 Hr7rMGgMUi/cm7HBeL+oxBsjDCwmOjM+gqX2yGvI345KcWb10NDZoi2zWOYAYJwyuqNUg
	 triatnwDUEHn/vovfgW034MNNThF/25P4qZJ6JhqdHJqDV2M2yVnDCep9hYWrpReO7Z+i
	 LDGu1cDmEtdsU5HwwZPV3WiYdVTwNe9/6U1oWqkiJTLJY2xNWHQeZnEpClGC/AgOddApl
	 gsKFmQrmHY+GH/+haFDcFAvwLergwJLV6AxB85eRk7iUIIicRGLxCb+LCtt8a5oBoEg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794694533;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding;
	bh=LY7eD84jpNGnFeoeMGuVlBCAW3DX6pueb3GVbU+lSFc=;
	b=z4PYeNYsnNoo94psiZIRAeH8GuzZrKCIruR92aKKEQ6HeSTWiKqbGTYu/GBSPV0WjQUx
	 xTkVe0rroAM5YPaT2krKU1ZnYleCzVLdfrrMXCaiCmpaDDt+s7MdxKgvXi9qFLuwvacnH
	 lO0Krb8ZW3GGPj5k10TJ0LmfqY3B2mlX1Ii6qbkkzhrC6/00imGOnsGqaNxF5zWGwN7iP
	 7BtkMYNH2KqZf2SJoztWxLw4Ylva2WtJ5CJz4ggVA/qqFzMDLaO4nP84pXNPYdIFvpsj5
	 ACfG2JBxxi+uLSgZBd2WgcNYs7b4bpl4umD36TDZqLUuNX0aNYeqBJHwGMP/sXD/1dg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=bIUgpIcB;
	arc=none smtp.remote-ip=209.85.221.43
Received: from mail-wr1-f43.google.com (mail-wr1-f43.google.com [209.85.221.43])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A0789606A32D
	for <linux-kselftest@vger.kernel.org>; Sat, 14 Nov 2026 22:15:32 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org A0789606A32D
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=bIUgpIcB
Received: by mail-wr1-f43.google.com with SMTP id ffacd0b85a97d-490d59c3edaso1240030f8f.1
        for <linux-kselftest@vger.kernel.org>; Sat, 14 Nov 2026 14:15:32 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794694531; x=1795299331; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=LY7eD84jpNGnFeoeMGuVlBCAW3DX6pueb3GVbU+lSFc=;
        b=bIUgpIcBjIUBAC3uRiK9ymS3TlnITIof7oCzsH9wDiUZdq3RIbgjQe8L+pJu0Qq9PN
         1FW2rWyEuatqc0Pr9g8ezsjyXEeTK61iL9QPG2ia96kYG+z0dQIk7J0PZkZaeGqYNq1c
         iaIuLsr8Eq3NiXkiEhbbPk5rMg5In8xQypAaK/EWxPLSKsqFDdV/loQvPArd5PgxfacB
         G6dtMYAILXeIxB0fO0VOGU2JSifcbvnKgx/lQk29IMOuvFN8+FOWFeSBQaf6iH8kWtOG
         mU2Xi9b7h/xakcGjREiWlFwfTPObvLY0InDfWvYpWo9K7YcLG333qY306+3o203CMXmx
         AQIA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794694531; x=1795299331;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=LY7eD84jpNGnFeoeMGuVlBCAW3DX6pueb3GVbU+lSFc=;
        b=EXrvBls07IexAKMzkbGfCfzt9boqFJDfBFuYHgfEhM22liYTclIR3VRnWD7WGFE0kO
         wWxZV0owPIn1dzdadg7eUWi4DhI/POA5eR73h5YF7tTXVIGTBfJHDEW7xZbzzn2skNdw
         U4W95erKdDw4XEpev+gDND54hEc17GsVirc6TIT1psSglnWJ4WVcWsKgENmxm0eOdo8z
         piv09lqsCPqZtSQ07tbTy3t1tPFiKRAF3NOLNeWNHXPciSpRAauV1q5odFnc7viTM3/8
         2g3n8oYZHg7x3vephP25SA0BLD3KCvp14J7mCFMaMtj/oqsGOxe3KQVR2b2qvzeWxbpm
         k7nA==
X-Forwarded-Encrypted: i=1; AL+hErFTlcVFNl8UWZFCUFAOil9yaPjLX4pM7ciRfmonugvs70MS7xrDvVZuLFlEBsV+0qO4gIK9KwCbPUTyPwgGrMs=@vger.kernel.org
X-Gm-Message-State: APuU4Z9grqQMM2oD6QEYMOlQPd3ye8ztrdHLIJlQK9xaACGAqaCF/f4+
	GllpEgMcmQ5ugk3c3R6W3EEyAMFzYxhZo7WuHlRF1YMQtAaZZw53rHm6
X-Gm-Gg: AYBFou17Nm+O0Fm7DRqvbwivpfmeVGrRuiVnNnTADjQW77cWJ8Vb1oS3NZvuvPuaoOX
	WNkRcSi192oJ1PqzkyyiYQiXhWu6Ehyg6iaHiLWLUVqpizy57Is1H6n2csW4J/9wxfoWV1fQPs5
	QFfwRYhflyMH+/qv6R6Bdaae7s62eDZd5shaiGfjpdjPKPVcC9C4SJ/UlfbIqWlovBjIxpHYn6I
	VwZ6YvmnYGeNP/djuPLNlcgY6n7BnqUcFf4nvqybjzbtx8kOm1bCQFbvHfkhpklWOtmhv6XSrof
	Ww11O0bs4vppZYN8DoCKxbgkVCoSAdckzqsCfZZ4oqpIKKb1TASUpyC3SxRnEY+UqSVXnEdBytr
	ESU4nHnY41l4evSELhJONLCAv4rhapT2029KKqG0QE9vf9iEUl2FweN5ml6G/I4uVCAqOMqBZwb
	bSSUm/l9lPVwTTadhlxn1J4sZq7DC5qs2wSlF1/OAL3hWMPzgFff1x60/lorVb585VsV+2peXbp
	Btxr3wWJsHI1AtoGFBBG6ak5RgU0VzmVFTtqnqI2xKg6czen2E8sK8MCgeBmE/pEa/Rky0+bUbn
	mk4VKvOBjuuQhwRxI5x+hCs=
X-Received: by 2002:a05:6000:383:b0:48e:d40:a87c with SMTP id ffacd0b85a97d-49b023a7e61mr22572636f8f.16.1794694530775;
        Sat, 14 Nov 2026 14:15:30 -0800 (PST)
Received: from kali ([169.224.126.250])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-49c5d223a29sm13514941f8f.8.2026.11.14.14.15.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 14 Nov 2026 14:15:30 -0800 (PST)
From: Ali Firas <alishmery18@gmail.com>
To: netdev@vger.kernel.org,
	idosch@nvidia.com
Cc: kuba@kernel.org,
	pabeni@redhat.com,
	davem@davemloft.net,
	edumazet@kernel.org,
	andrew+netdev@lunn.ch,
	horms@kernel.org,
	razor@blackwall.org,
	roopa@nvidia.com,
	kuniyu@google.com,
	petrm@nvidia.com,
	aroulin@nvidia.com,
	shuah@kernel.org,
	linux-kselftest@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Ali Firas <alishmery18@gmail.com>
Subject: [PATCH net-next v5 0/8] vxlan: vnifilter: bound a single request and account per-VNI memory
Date: Sun, 15 Nov 2026 01:14:04 +0300
Message-ID: <20261114221412.255825-1-alishmery18@gmail.com>
X-Mailer: git-send-email 2.53.0
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Post: <mailto:linux-kselftest@vger.kernel.org>
List-Help: <mailto:linux-kselftest+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kselftest+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The VNI filter interface accepts a VNI range with no bound on either
endpoint or on how many VNIs one message may ask for, and the memory it
allocates per VNI is not charged to the caller's cgroup. Charging it
makes adding a VNI, or changing its remote, fail routinely at a cgroup
limit, which exposes two error paths that leave configuration state
inconsistent; patches 5 and 6 fix those first.

  1: range-validate both endpoints to the 24-bit VNI space.
  2: end a dumped run, and a dumped message, at the request limit.
  3: cap one request at 4096 VNIs, summed over its entries.
  4: charge the per-VNI node and its stats to the caller's cgroup.
  5: leave an FDB entry's state and flags unchanged when an update fails.
  6: roll back a VNI add that fails.
  7: charge the VNI's default FDB entry to the caller's cgroup.
  8: selftests.

uAPI changes:

  - a VNI at or above 2^24, previously accepted and stored (and
    truncated on the wire), is rejected with -ERANGE;
  - a request asking to add or delete more than 4096 VNIs, summed over
    its entries, is rejected with -EINVAL; "bridge vni add dev X vni
    1-10000" used to be accepted;
  - "bridge vni show" splits a contiguous run longer than 4096 into
    several entries, and across several messages; the set of VNIs it
    reports is unchanged;
  - a VNI add that fails no longer leaves the VNI installed or sends
    RTM_NEWTUNNEL for it;
  - an FDB update that fails, including an RTM_NEWNEIGH, no longer
    leaves the entry's state and flags changed;
  - in a cgroup at its memory limit, adding a VNI, or adding or
    changing a VNI's remote (RTM_NEWTUNNEL), fails with -ENOMEM instead
    of charging past the limit; like any GFP_KERNEL_ACCOUNT allocation,
    the per-VNI node can first invoke the cgroup's OOM killer. A new
    remote may instead be installed without its per-CPU dst cache, whose
    allocation failing is not fatal, as before.

Patches 5 and 6 fix error paths that predate the series, and carry Fixes
tags. Neither is a memory-safety issue; both leave configuration state
inconsistent. They ride here because patch 7 makes those failures
routine at a cgroup limit, and for the earlier rollback posting Jakub
suggested net-next [1]; either can be split out to net if a maintainer
prefers. The group-join failure that patch 6 fixes is deterministic at
the default net.ipv4.igmp_max_memberships (20): the VNI stays published
and notified although it never joined its group, and a retry returns 0
without joining it. The rest of the series carries no Fixes tags. The
request cap is hardening, and Jakub asked for it to target net-next
without one [2]; of the earlier range-only patch he said it was either a
security fix needing a stronger check or something making things
slightly better that did not deserve Fixes or stable [3].

[1] https://lore.kernel.org/netdev/20260915174836.464fae55@kernel.org/
[2] https://lore.kernel.org/netdev/20260914173103.539d8838@kernel.org/
[3] https://lore.kernel.org/netdev/20260905123900.23984eda@kernel.org/

Not addressed here:

  - the device-wide default-remote change (RTM_NEWLINK) reaches the
    same per-VNI FDB entries outside the request cap, and patch 7
    force-charges them rather than hard-bounding them. Its error unwind
    re-adds old entries without checking the result, so bounding the
    walk first needs that unwind fixed;
  - vxlan_vni_add_del() still leaves the earlier VNIs of a range
    installed if a later one fails; the cap bounds that to fewer than
    4096 VNIs;
  - changing the group of an existing VNI records the new group before
    joining it, so a join that fails there leaves the VNI with no
    membership, and a retry returns 0;
  - RTM_NEWNEIGH with NLM_F_APPEND on the all-zeros or a multicast MAC
    adds a remote per request with plain GFP_ATOMIC, uncharged and not
    counted against maxaddress; accounting it is planned as a follow-up,
    building on the gfp plumbing of patch 7;
  - in QEMU (production builds, 2 and 8 vCPU), adding VNIs with remotes
    up to a 32 or 128 MiB limit left 73 to 100 bytes per VNI uncharged,
    5 to 11% of what was charged: the rhashtable bucket arrays behind
    the VNI and FDB hashes, and the per-object metadata memcg keeps for
    every accounted slab object;
  - an entry carrying END without START is read as [0, END]; whether it
    should be is left open.

Tool use: AI coding and review tools were used for code analysis, patch
preparation, review and test development. The changes were validated
with QEMU reproductions, fault injection, the kernel selftests, KASAN,
KCSAN and lockdep builds, and per-commit builds.

Changes since v4:

  - v4 patch 1 was applied as commit 599d0e97610f; these are the rest.
  - new patches 5 and 6, with Fixes tags, ordered before patch 7, which
    makes their failures routine at a cgroup limit (review of v4). Patch
    6 supersedes the separately posted rollback series.
  - patch 1 states its dependency on commit 599d0e97610f (Paolo).
  - patch 7: the vxlan_changelink() rollback keeps plain GFP_ATOMIC,
    like the call it reverses; the changelog no longer claims a clean
    failure on its own (review of v4), and says a remote can be
    installed without its dst cache at the limit.
  - patches 2 and 3: the VXLAN_VNI_FILTER_MSG_MAX comment says what the
    dump does and names vxlan_vnifilter_check_msg(); patches name each
    other by subject (review of v4).
  - patches 1, 3 and 7 say how each gap was found and what it did in
    QEMU (sinfo bot).
  - patch 8: absence probes fail when "bridge vni show" fails; the dump
    is checked against the literal split; START-only and END-only
    out-of-range cases; rollback cases driven by maxaddress and the IGMP
    membership limit (review of v4).
  - patch 8: a refused replace of a VNI's permanent default entry must
    leave it permanent through an ageing pass.
  - lines wrapped to 80 columns; rebased onto net-next, which now has
    commit 7308ef8b4a67 ("vxlan: Stop rejecting dynamic FDB entries with
    a nexthop ID"); it removed a check next to patch 5's change.
  - the Assisted-by trailers are dropped; tool use is described above
    instead, following commit 1e035297ffda ("docs: remove Assisted-by
    references").

v4: https://lore.kernel.org/netdev/20261014123814.388557-1-alishmery18@gmail.com/
Superseded rollback posting:
https://lore.kernel.org/netdev/20260911215203.3054653-1-alishmery18@gmail.com/

Ali Firas (8):
  vxlan: vnifilter: reject VNIs outside the 24-bit space
  vxlan: vnifilter: clamp the dumped VNI range to the request limit
  vxlan: vnifilter: bound the number of VNIs one request may touch
  vxlan: vnifilter: account per-VNI memory to memcg
  vxlan: leave FDB state and flags unchanged when an update fails
  vxlan: vnifilter: roll back a VNI add that fails
  vxlan: vnifilter: account the default FDB entry to memcg
  selftests: net: test the vxlan vnifilter request limit and dump replay

 drivers/net/vxlan/vxlan_core.c                |  87 ++++---
 drivers/net/vxlan/vxlan_private.h             |   7 +-
 drivers/net/vxlan/vxlan_vnifilter.c           | 192 +++++++++++---
 .../selftests/net/test_vxlan_vnifiltering.sh  | 246 +++++++++++++++++-
 4 files changed, 461 insertions(+), 71 deletions(-)


base-commit: fa5196392691051963726787944db872420dfa75
-- 
2.53.0

