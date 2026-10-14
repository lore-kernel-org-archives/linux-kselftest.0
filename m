Received: from mail-wm1-f41.google.com (mail-wm1-f41.google.com [209.85.128.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 333CC4DEC3B
	for <linux-kselftest@vger.kernel.org>; Wed, 14 Oct 2026 12:39:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791981600; cv=none; b=cxRnxipAfKL4Sgv37xIkslF4zQckACuQ0K2oi4+9Ec+pYF6I7XAJ+o3nW6W5Utykmfc93sIjIW1KOhgLQWy4iw2WQV5yle72TdIqVQlY+uH/5tiYS+D/IbhNafoaoBxCUkHmWfY8sMQNxdX2uNGz2SJkNaVXxE3K758FvDERQzc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791981600; c=relaxed/simple;
	bh=ueZWchNj/Lz3TiOXq+clvkm8rqxC7TxpZzgWXvnFqeA=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=uI2lCHW7b4pVKWHs20L1ukyLFhP/Jy7gAqcYfhnn/dKsoPrLiXlQM2KWFXymG4v18XJ4AKWwtc47OvSfj9oR16lwUFqMNdoeb8fsyWL3uevBDI6PurfQ4XS1mZqfcaakfeJiQForDhpz5JTRaL4n7i3oW1u8HyRi2jLP+YUl/84=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=i9wgFdfx; arc=none smtp.client-ip=209.85.128.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="i9wgFdfx"
Received: by mail-wm1-f41.google.com with SMTP id 5b1f17b1804b1-49ff680331aso10649455e9.3
        for <linux-kselftest@vger.kernel.org>; Wed, 14 Oct 2026 05:39:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791981596; x=1792586396; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=ru12IB60eacMB9ePCFsbXWKxugJjfmaSHcqsAJxz9P8=;
        b=i9wgFdfxWPBXsrB79Q8OZ5WRdc1LQkqWvn4B7bua+M9JogioTevC+H9UjWJsXMhSAb
         L0WWprWXGzhW5fZ483z9tFU7R0uEsQqk1+vhtrwEY69KJPuqC0M2E+K5S6nEOOMMpkB9
         DzD1jHv7vEV/ibFUUmviMItIPvWk6LiRow27K+GB8xnkhA/p+aNsJc+AELlixXHzr0g7
         1Q2N4+VdCTf2JMV/N/RazOX/urI552Oo2/vFgp11UgE32yjUoZRp+MkK+fj9Iggq2w/z
         ZAb+q34QcHoA/HtydJWbQ6vHQ+RdkRYJtldemmFeOYzJ/xDSJghDeUfY0dU5nIQtR1ul
         +fqw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791981596; x=1792586396;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=ru12IB60eacMB9ePCFsbXWKxugJjfmaSHcqsAJxz9P8=;
        b=UHi8v6yBvBnFNKzs22hNNYE6U8R0xmOKBDTnAjkObId+K56Kp8zF/OrNWbbp6kw9yj
         euvv3A/nqUpZqDAhErrvWUP4HuDGkraCpL4tvpvSTUlyOxKBolh+f0Sm9kVuZMTtaXGF
         m+y3LGPOGAYPJenVktjSCBVH7E4icLGIfgTz7HARe9mdC4kQRpaMOLJ+cGrFGj3PCPGa
         RNzEQbUPbpoN6lR9jaPUN/THzGY4vggfU5FnE1eS/HMMz2Qkw/Ij6DAQu8PdlYcCY2qJ
         XKXKNdN8dNGdiTSFxDF5s2XVYoHcoHEybWSBecUlNxlJKEXTDm32B7vMbUFseHYMU56b
         1jqA==
X-Forwarded-Encrypted: i=1; AKwUvBzFrfzdxpYicGB/OGNURgFd8cv0EUjST8t9SJtQ+uoTzmEW4uvbeY+DIADrb1WPrQyYNX6hmzvxbx/AcPZxzRo=@vger.kernel.org
X-Gm-Message-State: AFq9FYLYrQ6vB4ZCTgI5qBUbt8s4BRzQSENU60/ANIOBvervxrxJq6s2
	VpfhRNIA99a3YHfYpvMMzWrRpj8hAlDcGNJA1EL4se9ClwXAVHAAxRpMn9Ey0zUDl/I=
X-Gm-Gg: AYBFou3K/cvs1lzLUiixsVKnWkZ6Hjg2AWqWkZjBJ+XuSDY6b0kM+4RZCJ/hGQs7NRo
	yHwZbNasUsgFzN+zjY1i/1onGVkgeSgq/VpZVC4dYku7w5/ZIS8VIkupDhcjmnGXnxc7P8KxEsL
	0EydyHHq7wDgXHZYssDjgrzMFyVFsamgq4D6fTQqLAxmnhBNrQOKnXCAzd40CZka1YKIiBGAuiE
	62c+qj2B4eLtatY3gfEtkYes2fqIjhKtmO/Vdbcwy/fhkfk8xJPC2/8JSUvZyQNlWgB30W0L+k2
	5HEKqy/lm39LHopmIy6mzOG5CWrb2qSTTq+wfKGaM+0nvesO5YLH1bUsuOaOdE0bl7D/MkcFKUC
	T3rBy2DwYSolfV28FQTkDNIqIJlFMlaPM0NxTJHF3wLZAhu76VELXqo3AC4Jl4aM675+6knYh1x
	Vq0OFk1LYAVCLdKPprEvdUWFhBYL2j4eBgU4YKOiBsl67S/SVrdskjUZnF92dIVe0=
X-Received: by 2002:a05:600c:4fd5:b0:4a0:5b:7bc0 with SMTP id 5b1f17b1804b1-4a18e49a7e3mr323462585e9.21.1791981596093;
        Wed, 14 Oct 2026 05:39:56 -0700 (PDT)
Received: from kali ([169.224.126.44])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4a1b2ec47fcsm54163165e9.1.2026.10.14.05.39.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 14 Oct 2026 05:39:55 -0700 (PDT)
From: Ali Firas <alishmery18@gmail.com>
To: netdev@vger.kernel.org,
	idosch@nvidia.com
Cc: kuba@kernel.org,
	pabeni@redhat.com,
	davem@davemloft.net,
	edumazet@google.com,
	andrew+netdev@lunn.ch,
	horms@kernel.org,
	razor@blackwall.org,
	roopa@nvidia.com,
	shuah@kernel.org,
	linux-kselftest@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Ali Firas <alishmery18@gmail.com>
Subject: [PATCH net-next v4 0/7] vxlan: vnifilter: bound a single request and account per-VNI memory
Date: Wed, 14 Oct 2026 15:38:07 +0300
Message-ID: <20261014123814.388557-1-alishmery18@gmail.com>
X-Mailer: git-send-email 2.53.0
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The VNI filter interface accepts a START/END range with no bound on
either endpoint and no bound on how many VNIs one message may ask for,
and the memory it allocates per VNI is not charged to the caller's
cgroup.

Patch 1 links the VXLAN_VNIFILTER_ENTRY nest to its policy with
NLA_POLICY_NESTED(), as Jakub asked in v2:

  https://lore.kernel.org/netdev/20260921150904.65a704eb@kernel.org/

Without it the entry attributes were validated only as each entry was
dispatched, so a multi-entry message whose later entry was invalid had
the earlier entries applied and notified before the message was
rejected. With the nest linked, an entry the policy rejects refuses the
message as a unit; faults the policy does not cover are still handled
one entry at a time, as before.

Patch 2 range-validates both endpoints to the 24-bit VNI space.

Patch 3 makes the dump re-enterable, and does so before patch 4 caps the
input, so no commit in the series reports a range its own input path
would reject. vxlan_vnifilter_dump_dev() coalesces a contiguous run of
VNIs, and packs as many entries into a netlink message as the skb holds,
with no bound on either. It introduces VXLAN_VNI_FILTER_MSG_MAX and
bounds both: it ends a coalesced run at the limit, and carries a
per-message VNI budget that ends the message once its entries would sum
past the limit, the same way the loop already ends it when the skb is
full. The same resume path (cb->args[1], counting nodes dumped) drives
both; the dump does not drop or repeat a VNI.

Patch 4 caps the number of VNIs one request may add or delete, summed
over its entries, at VXLAN_VNI_FILTER_MSG_MAX. Both add and delete walk
the span one VNI at a time under rtnl_lock, so both are bounded; that
walk is the cost, not the memory.

Patch 5 charges the per-VNI node and its per-CPU stats block to the
cgroup of the task that created the VNI, the way the device's own struct
and its Tx/Rx queues already are (commit c948f51c1654 ("memcg: enable
accounting for net_device and Tx/Rx queues")).

Patch 6 charges the default FDB entry a VNI with a group or remote
installs -- the vxlan_fdb, its vxlan_rdst and the per-CPU dst cache. It
threads a gfp argument through vxlan_fdb_update() down to
vxlan_fdb_alloc()/vxlan_fdb_append(), on both the create and the
remote-change paths, and a second gfp through
vxlan_update_default_fdb_entry() so each caller picks it. A per-request
add or change (RTM_NEWTUNNEL) passes GFP_NOWAIT | __GFP_ACCOUNT, which
is non-blocking like GFP_ATOMIC but hard-bounded by the memcg: at its
limit the request fails with -ENOMEM instead of charging past
memory.max, and because the new entry is allocated before the old is
freed, a failed add leaves the existing entry intact. The device-wide
default-remote change (RTM_NEWLINK, via vxlan_vnilist_update_group())
keeps GFP_ATOMIC | __GFP_ACCOUNT; that pre-existing walk is not bounded
here ("Not addressed" below). Every non-vnifilter caller --
vxlan_fdb_add(), vxlan_snoop(), vxlan_dev_create(), vxlan_changelink()
and the switchdev vxlan_fdb_external_learn_add() -- keeps plain
GFP_ATOMIC, so the data path and unrelated callers are untouched.

Patch 7 adds the selftests.

This is the reasoning of commit e2c8d550a973 ("netfilter: ebtables:
account ebt_table_info to kmemcg") and of the net_device accounting
above: memory whose lifetime is tied to the net namespace rather than to
the allocating task cannot be relieved by the OOM killer, so a
container's netadmin must not be able to grow it outside the memcg that
bounds the container.

What this series does and does not account, measured on production
builds (no lockdep/KASAN) in a memcg at 2 and 8 vCPU:

  - every persistent per-VNI allocation the vnifilter path creates is
    attributed to the cgroup of the task whose request allocates it, and
    bounded by it on the per-request path. Patch 5's node (128 B) and
    per-CPU stats (64 B/CPU), and patch 6's FDB entry -- vxlan_fdb
    (128 B), vxlan_rdst (96 B) and a per-CPU dst cache -- on the
    per-request path (RTM_NEWTUNNEL) are hard-bounded: the node and stats
    use GFP_KERNEL_ACCOUNT and the FDB entry uses
    GFP_NOWAIT | __GFP_ACCOUNT, so a cgroup at its limit fails the
    create, the first remote, or a remote change with -ENOMEM, and
    memory.current does not exceed memory.max (measured at 2 and 8 vCPU
    in an 8 MiB cgroup). Failure is clean: the new entry is allocated
    before the old is freed, so a failed add leaves the existing entry
    intact and returns the error -- no established state is destroyed and
    no false success is returned. The at-rest footprint is one node, its
    stats and one FDB entry per VNI; this memory has device and net
    namespace lifetime, not task lifetime (killing the cgroup's tasks did
    not release it, only deleting the device did), so it must be charged
    rather than left to the OOM killer;
  - the rhashtable bucket tables backing the VNI and FDB hashes are not
    charged. That is ~32 bytes per VNI across both tables, generic
    infrastructure shared by every rhashtable user, O(entries) with
    automatic shrinking (an add/delete cycle returns it, measured), and
    the series does not address it.

The cap is symmetric, applied to add and delete alike, which is what Ido
asked for when he agreed to a 4k limit. Patch 3 is what makes that safe:
no dumped message carries more VNIs than one request may ask for, so a
device holding more than the limit can still be torn down by replaying
what "bridge vni show" reports. Device teardown itself
(vxlan_vnigroup_uninit()) is not a netlink message and is not subject to
the cap.

uAPI changes, all of them:

  - a VNI at or above 2^24, previously accepted and stored (and
    truncated on the wire), is now rejected with -ERANGE;
  - a single request asking to add or delete more than 4096 VNIs, summed
    over its entries, is now rejected with -EINVAL -- "bridge vni add
    dev X vni 1-10000" used to be accepted;
  - a request rejected by the entry policy, aimed at a missing or
    non-vnifilter device, now returns that policy error rather than
    -ENODEV or -EOPNOTSUPP, because the nest is validated before the
    device is resolved (patch 1);
  - "bridge vni show" now splits a contiguous run longer than the limit
    into several entries, and across several messages, instead of one;
    the set of VNIs it reports is unchanged;
  - in a cgroup at its memory limit, adding a VNI, or adding or changing
    a VNI's remote (RTM_NEWTUNNEL), now returns -ENOMEM instead of
    charging past the limit; the existing entry, if any, is left intact.

This is a policy and hardening change, not a fix for a crash or
corruption; it targets net-next and should not be backported.

One pre-existing semantic is worth review: an entry that carries only
END and no START is treated as the range [0, END], so a lone END near
the top of the space is a whole-space request that the cap now rejects;
whether END-without-START should mean that is left as an open question.

Not addressed here:

  - the device-wide default-remote change (RTM_NEWLINK) reaches the same
    per-VNI FDB entries outside the request cap and force-charges them
    rather than hard-bounding, so this series narrows the exposure to
    the per-request route rather than closing it. Patch 6 does charge
    those entries to the requesting task's cgroup, where before the
    series they grew unaccounted host memory; bounding the walk is left
    to a follow-up.
  - vxlan_vni_add_del() still leaves the earlier VNIs of a range
    installed if an allocation fails partway through it; with the cap
    that is now bounded to fewer than 4096 VNIs. A fix needs a
    transaction and is left to a follow-up.
  - the rhashtable bucket memory described above.

Changes since v3:
  - rebased onto current net-next.
  - the dump patch (now patch 3) is ordered before the input cap (patch
    4) and introduces VXLAN_VNI_FILTER_MSG_MAX, so every commit is
    self-consistent; it also carries a per-message VNI budget, not only a
    per-entry clamp, so a dump of a run longer than the limit splits into
    messages the input path accepts (demonstrated with raw netlink).
  - new patch 6 accounts the default FDB entry, scoped to the vnifilter
    call site via a gfp argument so the data path stays on GFP_ATOMIC;
    the gfp is threaded on both the create and the remote-change paths.
    The per-request path (RTM_NEWTUNNEL) uses GFP_NOWAIT | __GFP_ACCOUNT
    so the charge is hard-bounded (fails with -ENOMEM at the cgroup
    limit); the pre-existing device-default walk (RTM_NEWLINK) keeps
    GFP_ATOMIC | __GFP_ACCOUNT.
  - patch 5 reworded to cover the node and stats only, with its
    net_device-accounting reference narrowed to net_device and its Tx/Rx
    queues.
  - patch 1 reworded to scope the "rejected as a unit" claim to entries
    the policy rejects.

Changes since v2:
  - add patch 1 linking the nest to its policy (Jakub);
  - the request cap applies to both add and delete (Ido).

Ali Firas (7):
  vxlan: vnifilter: validate the VXLAN_VNIFILTER_ENTRY nest
  vxlan: vnifilter: reject VNIs outside the 24-bit space
  vxlan: vnifilter: clamp the dumped VNI range to the request limit
  vxlan: vnifilter: bound the number of VNIs one request may touch
  vxlan: vnifilter: account per-VNI memory to memcg
  vxlan: vnifilter: account the default FDB entry to memcg
  selftests: net: test the vxlan vnifilter request limit and dump replay

 drivers/net/vxlan/vxlan_core.c                |  47 +++---
 drivers/net/vxlan/vxlan_private.h             |   5 +-
 drivers/net/vxlan/vxlan_vnifilter.c           | 132 +++++++++++++++---
 .../selftests/net/test_vxlan_vnifiltering.sh  | 119 +++++++++++++++-
 4 files changed, 270 insertions(+), 46 deletions(-)


base-commit: 05b5019b01fb9443b09ae4ed34af1135a80a84c8
--
2.53.0
