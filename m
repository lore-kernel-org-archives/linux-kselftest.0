Received: from mail-wm2-f13.google.com (mail-wm2-f13.google.com [74.125.225.141])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E670E3C553B
	for <linux-kselftest@vger.kernel.org>; Sun, 27 Sep 2026 21:53:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.225.141
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790546035; cv=none; b=lTNm59EKwsjzA2elVqeeztuEhzf3m8QaegbdzPgLuQnqJqcGnsYu1lCTx4ggQIiSr+uRQJIw8Tl9qt8+EBq5c1th7qdKmbbo22fk8QpY0mqoEeq3z50nAycAQIV/pmm/G0muUhZDOxvY2IZIDZDkriuNtKjkAGhowYmskGxUZjI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790546035; c=relaxed/simple;
	bh=cPwSEWpsOxxHrQ7YrGZg29yb6xZCjbKc4iJtnoT2xjc=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=gDyaNt6cJHaTWzqv4SkrakNqjO16KY3rknby2s/j4cTy8iaQ1fV8bmrAc2i2XlpCRuaKVM6U69M9UX9Uz95JnoUyrlUxPcNJetHshozmP4W3Q9vkHppVLxMf3HNzI44XJvfQA00oEqUo3NoS/Gu6u9v5s9J1eb5sl2j3f/O5hOA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Jg/x0HWK; arc=none smtp.client-ip=74.125.225.141
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Jg/x0HWK"
Received: by mail-wm2-f13.google.com with SMTP id 5b1f17b1804b1-49ffa15f67fso6432285e9.2
        for <linux-kselftest@vger.kernel.org>; Sun, 27 Sep 2026 14:53:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790546032; x=1791150832; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=H3FM5h6XaUxXXvfmNME4Bh4GS6uG4DTAgTWJ51phUDQ=;
        b=Jg/x0HWK2FYLiMzPXV/zF8wNN4burbdkVl3SUM9nYL0CvP5PNOFLFlw81BJrQ/leKV
         mGm9D03QlAKbpm2+pJwxf37gw/k90NxycGiEZphqhfuvlw13caSb8qaK3r6JllON+NyE
         PhuwcpDFdkPuu/ds9+HcuxfKTo6VaGY6k/D7pChjekVA6trLrkq3amPRJvN3ZxfKVZfH
         kSllJSl+zFrmcDhm8pW+gUR421wTYnuNCKGt7GaVXUMkI2dTrvI0STZrzb9p+eiGJ89V
         dGGp9ZF7HM5KXqwevMPJYnRkXjlFef4sQTYWwLydcZ/+vctqzH672tGqgz0C9b7X5wbm
         A7XQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790546032; x=1791150832;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=H3FM5h6XaUxXXvfmNME4Bh4GS6uG4DTAgTWJ51phUDQ=;
        b=sHLA/MG9nsRoJSPhS8DkDzGcGLNJlcZ9wDeTA0x8juQlolKgGpv9ad7M3r97+j6tGb
         IQRWvDvbGZYqRIhqJBVJSQFCXGDf+lnGTCZDUt6i+UGtTuNfRJ2Xvn2fKF1XomXyXgIK
         hibXbvhAgCb7zWRCP0PjQNObfVegVUkmZnn0bWiXh0lt8zwt57VYkbS7UcS+ClzMFAMi
         tEQCQKkJ+I+MuV3gY2YYjT9uxt8Uh+vmLcyj97w/sJqHCnQI9WTEWmnI6hM0MjQNTgC4
         M918eXJHsUPSH8xmy51JylyPk3H8KoSEVux6qVjekltH+VOA+LIKQZyWNRSKBb7cKvM1
         +nLA==
X-Forwarded-Encrypted: i=1; AKwUvBwMj2AM8CPZTJ5Gt3w3C2uP/GM5roZFl8hPJQyUorkWEHga+Ych4y8kvceYfA3/vxlFPXFr6e3W0p7L0ks+y9c=@vger.kernel.org
X-Gm-Message-State: AFuF++kbB4iMTQ0sBItyN9yXybM0SZEUcwwUPZV2qWQx8jIZNWdj7ikw
	wYWTswvCs+Gvlam5PD4DryLhOa7dIjqWDvi9qML3AoHdGqZhm7Za+yRmiNw5shgOn+4=
X-Gm-Gg: AYBFou1wVVvKFtMrBjCkyfLGolrSkocN7jypOOCbV3qGzcg9v7iq98eG74Z7K+L1RTO
	sm9CNr1VdMvdRQkh0HtutNPrcz0mZyv3ijyRhM8rwTP/u36KZi8B+Zrb+1AX4/iZnfNRDtctlJA
	yq7pTW5i34t+GGYucl5R+EF2cuL21Bz5yiOtiGEB7WSTi27eBAKyU1XibcdITj6U+v5HFyoDJ0Q
	Xwl9eVV8sYyC416TQd1EkcGdFVS098HfdMxiSAqzAq7mQAeigH1WBZY1rb18BjbwlZ1Nlfryo7k
	6mgCQicxJlQPY+GjSwsADmu/tphKkVqTmfRanUtdl3GP3G1DsAEAl+YtoM9NBOihjOaQYVGCzUe
	zfdEcKwoX7QXJEAscYeKKyoKw/DB6j7RMnfV7R62B7gIyecMXAPxhRqaJKlZ7NPhv7mbut78QfB
	ElCJ7pGAHYsTv0CT0rg/PAl9a7BiqC9+0C3i+x1FwOV1iPY4zIiiv1KQh2gjcDmldO1wA/chGfi
	g==
X-Received: by 2002:a05:600c:4fcc:b0:49f:ce78:3560 with SMTP id 5b1f17b1804b1-49fe66f1a05mr207012045e9.17.1790546031943;
        Sun, 27 Sep 2026 14:53:51 -0700 (PDT)
Received: from kali ([169.224.126.44])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4a001922102sm89556865e9.15.2026.09.27.14.53.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 27 Sep 2026 14:53:51 -0700 (PDT)
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
Subject: [PATCH net-next v3 0/6] vxlan: vnifilter: bound a single request and account per-VNI memory
Date: Mon, 28 Sep 2026 00:52:03 +0300
Message-ID: <20260927215209.2581830-1-alishmery18@gmail.com>
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

Since v2, Jakub asked that the VXLAN_VNIFILTER_ENTRY nest be linked to
its policy with NLA_POLICY_NESTED() as patch 1:

  https://lore.kernel.org/netdev/20260921150904.65a704eb@kernel.org/

Patch 1 does that. Without it the entry attributes were validated only
as each entry was dispatched, so a multi-entry message whose later
entry was invalid had the earlier entries applied and notified before
the message was rejected. With the nest linked the whole message is
validated up front and a bad entry rejects the message as a unit and
installs nothing.

Patches 2 and 3 bound a single request: patch 2 range-validates both
endpoints to the 24-bit VNI space, and patch 3 caps the number of VNIs
one request may add or delete, summed over its entries, at 4096. Both
add and delete walk the span one VNI at a time under rtnl_lock, so both
are bounded; that walk is the cost, not the memory.

Patch 4 clamps the dump. vxlan_vnifilter_dump_dev() coalesces a
contiguous run with no bound, so a device populated by several requests
could dump a single entry that patch 3 then refuses on replay. Patch 4
clamps the merged run to the same limit, so dump output is always
re-enterable; the selftest installs more than the limit, dumps it, and
replays what the dump reported.

Patch 5 charges the per-VNI node and its per-CPU stats block to the
cgroup of the task that created the VNI, so the memory a device grows one
VNI at a time is accounted the way the device's own queues, ethtool
state and NAPI config already are (commit c948f51c1654 ("memcg: enable
accounting for net_device and Tx/Rx queues")).

Patch 6 adds the selftests.

The cap is symmetric, applied to add and delete alike, which is what
Ido asked for when he agreed to a 4k limit. Patch 4 is what makes that
safe: because the dump is clamped to the same constant, the kernel never
reports a contiguous run that its own input path would reject, so a
device holding more than 4096 VNIs can still be torn down by replaying
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
    into several entries instead of one (patch 4); the set of VNIs it
    reports is unchanged.

This is a policy and hardening change, not a fix for a crash or
corruption; it targets net-next and should not be backported.

One pre-existing semantic is worth review: an entry that carries only
END and no START is treated as the range [0, END], so a lone END near
the top of the space is a whole-space request that the cap now rejects;
whether END-without-START should mean that is left as an open question.

Not addressed here:

  - vxlan_vni_add_del() still leaves the earlier VNIs of a range
    installed if an allocation fails partway through it; with the cap
    that is now bounded to fewer than 4096 VNIs. A fix needs a
    transaction and overlaps a separate rollback change, so it is left
    out.
  - a lone VNI 0 dumps as a START-only entry the input path refuses
    ("vni start nor end found"), and a stats dump carries per-entry
    stats the input path refuses; both predate this series and are
    unrelated to the limit.

Changes since v2:
  - patch 1 is new: link the VXLAN_VNIFILTER_ENTRY nest with
    NLA_POLICY_NESTED(), as Jakub asked, so the whole message is
    validated before any entry is acted on;
  - patch 4 is new: clamp the dump to the same limit so its output
    replays, which is what makes the symmetric cap safe;
  - patch 5 accounts the per-VNI node and its per-CPU stats in
    vxlan_vni_alloc();
  - rebased onto current net-next.

v2: https://lore.kernel.org/netdev/20260916193449.2552039-1-alishmery18@gmail.com/
v1: https://lore.kernel.org/netdev/20260909092645.3105263-1-alishmery18@gmail.com/

Ali Firas (6):
  vxlan: vnifilter: validate the VXLAN_VNIFILTER_ENTRY nest
  vxlan: vnifilter: reject VNIs outside the 24-bit space
  vxlan: vnifilter: bound the number of VNIs one request may touch
  vxlan: vnifilter: clamp the dumped VNI range to the request limit
  vxlan: vnifilter: account per-VNI memory to memcg
  selftests: net: test the vxlan vnifilter request limit and dump replay

 drivers/net/vxlan/vxlan_vnifilter.c           | 110 ++++++++++++++---
 .../selftests/net/test_vxlan_vnifiltering.sh  | 114 +++++++++++++++++-
 2 files changed, 209 insertions(+), 15 deletions(-)


base-commit: 014d795c73837ea2339a4ea8e8f82c6e959b845d
--
2.53.0
