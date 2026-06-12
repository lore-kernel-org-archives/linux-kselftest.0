Received: from mail-dl1-f74.google.com (mail-dl1-f74.google.com [74.125.82.74])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EED26407CC2
	for <linux-kselftest@vger.kernel.org>; Fri, 12 Jun 2026 17:36:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.82.74
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781285811; cv=none; b=FNgGrUKejv/E87Cv3Zry9tnG50VEpetZ9b2Kushj8YhtGzvZSX62fTsyEpSVohG7e+ve5TEidVcLoaHqdObM+aNpwiGncvXwybx+siD3HSNPmKxm09Ynqusw7IeCOe6MEinaZzMpvPMUH2+Uu3DNLJgr9MObkc/3McTGYq39CFI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781285811; c=relaxed/simple;
	bh=EDZfpL0WwzkQ8hq0Wdv9p5cHlrRrzU/QFy+XGloNPb0=;
	h=Date:Mime-Version:Message-ID:Subject:From:To:Cc:Content-Type; b=Byzl9KnO3nyOP+vYTYpnqILc+HS/meoKBGNQwup75amJ83eoleSlfv0hDRlff3fLeM1Mhp7mihTUbmVFX6XdueWsd8d3dp0ku+THLcACg91Z8jDSD1aJALFsILQHPfqjPUflDjJf1zcnB2dsgqBMwL2FlJ5coDd1Mbiy5YGWlmg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--tanshuhao.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=WyYuE+97; arc=none smtp.client-ip=74.125.82.74
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--tanshuhao.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="WyYuE+97"
Received: by mail-dl1-f74.google.com with SMTP id a92af1059eb24-138acbc0e69so90521c88.0
        for <linux-kselftest@vger.kernel.org>; Fri, 12 Jun 2026 10:36:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1781285809; x=1781890609; darn=vger.kernel.org;
        h=cc:to:from:subject:message-id:mime-version:date:from:to:cc:subject
         :date:message-id:reply-to;
        bh=m0AdHFT5n0KXuYQG6JAlkPd+J0hfnrhnYB6jEfLYTzA=;
        b=WyYuE+97EJ9bsa7IhWc9y/6IJIl0afFpUBghlu8gynTlgDbeAQqzm4TgVQjEbjwTYn
         sBGUn73BwAwBqfCeUq2SPoan8RwrSlWb86c8FJ5palTE3hiqLudeCMfps+ztW3vOHreL
         UQi48/iNfNW9+H6Y/zdF27+ToZFJw+dZneqvZ8R3AIAB6GE2hMS8iV0s2fyuCVFbclY+
         zJLlD0Eywmg2//4U8qH7lzrPMLrnR0zS68mGE9yIOjGLhD+N2fJEEkE4yX3fGcFSZgQO
         avdaeG1ozxJZDxcB7ASEWN0fvi8crrP3qrYIDUPKKLJy974BRO0bS34mtXDE1Mt8QdVc
         hpVQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781285809; x=1781890609;
        h=cc:to:from:subject:message-id:mime-version:date:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=m0AdHFT5n0KXuYQG6JAlkPd+J0hfnrhnYB6jEfLYTzA=;
        b=T+epGMzuPqvw58jbBdRRUjTTtEA0+Bp6+JL35w3r6GQZZkXZK/rFjgELAiOTjI5KyD
         h1rJ8Wa0yk02452CgyF9Gu8WBAQeGqUwPrHqNCGCgZfixRdnfEjm0c7jnI+M53/72QBh
         U0n1wW275239MHG5qBnsqtyvS3fi4vfaG7JAc9RUmE+OY0URA5ZcVRPLToAZzaIYvcnP
         lMJvSB1AocxIbVB375NvWP99ZwxiCR88DKMQvh2WDgAp51sGTS/GYC6Ku+29A3I0i5gP
         ZvfJe2LqYA52lqpdgwFxPvokojJkOAhH13O7vmMSSKM1SpP1AHCgxfqxix47yMNk5YqA
         gckQ==
X-Forwarded-Encrypted: i=1; AFNElJ/jqB4207iPDmRTNTQtbVivT0qKNnVw+QLu+3X4exVNZ/eQ5OckT28xEDykg030SCq435EH0loMpqRaf7b3yRw=@vger.kernel.org
X-Gm-Message-State: AOJu0YxamTZ2YguvBxJ5vbHlN5gmNQHiF9H0mr4H3fVQkl4yZeyUkzuN
	SgklBBQvhww2oYBdu7SuGVy/FSxBXC/V1dYAZidO66OocoMHX43+qP1fQP4YRQiKtalUDE9X2Lj
	HFgEdJaJp3M0m6LkeLA==
X-Received: from dlec6-n2.prod.google.com ([2002:a05:701b:4286:20b0:138:4e1:4728])
 (user=tanshuhao job=prod-delivery.src-stubby-dispatcher) by
 2002:a05:7022:ea24:b0:128:d4be:7438 with SMTP id a92af1059eb24-1384bbc646fmr2287331c88.30.1781285808673;
 Fri, 12 Jun 2026 10:36:48 -0700 (PDT)
Date: Fri, 12 Jun 2026 10:36:40 -0700
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
X-Mailer: git-send-email 2.54.0.1136.gdb2ca164c4-goog
Message-ID: <20260612173644.380972-1-tanshuhao@google.com>
Subject: [RFC net-next v1 0/2] Reuse threaded NAPI kthread across napi_del()/napi_add().
From: Shuhao Tan <tanshuhao@google.com>
To: Andrew Lunn <andrew+netdev@lunn.ch>, "David S . Miller" <davem@davemloft.net>, 
	Eric Dumazet <edumazet@google.com>, Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, 
	Simon Horman <horms@kernel.org>, Shuah Khan <shuah@kernel.org>
Cc: Shuhao Tan <tanshuhao@google.com>, Mina Almasry <almasrymina@google.com>, 
	Samiullah Khawaja <skhawaja@google.com>, Kuniyuki Iwashima <kuniyu@google.com>, netdev@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-kselftest@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

Currently the lifetime of the kthread of a threaded NAPI is tied to
the napi_struct. netif_napi_del() stops the kthread when it destroys
the NAPI struct.

This patch series reuses the same kthread (thus preserving all of its
attributes) across napi_del/napi_add. This series now tie the lifetime
of the kthread to net_device instead of napi_struct.

A normal use case for threaded NAPI will be "enable threaded" ->
"configure the thread". Driver reset (that can be caused by a NIC
configuration change) often destroys the configuration and causes a
usability issue. This series aims to solve the issue.

There is a downside of this approach: If a device reduces number of
queues while its NAPIs are threaded. The kthread associated with
removed queues will not be stopped. Since the mapping between the
index passed to napi_add_config() and NAPI is an implementation
detail of individual drivers, it is not straightfoward to perform
a garbage collection and stop kthreads that are no longer associated
with a queue. This patch series tries to minimize the effect by
parking the kthread in napi_del. The kthread still shows up in
/proc, but should not consume CPU cycles.

There was a discussion
https://lore.kernel.org/CAAywjhR0TPKZ-xzqjSP709OVmZWUisDNv2CVc_VxgOrXRtop+g@mail.gmail.com/
around what to do with the kthread between napi_disable/napi_enable.
It seems that there was an intention to keep user configuration for
the kthread across NIC configuration change. This patch series extends
the effort to cover more NIC configuration changes. Roughly tracing
through the call hierarchy of napi_del reveals that at least the
following drivers will not preserve the user configurations:
- idpf: idpf_set_channels(), idpf_set_ringparam()
- mlx4: mlx4_en_set_ringparam(), mlx4_en_set_rxfh(),
  mlx4_en_setchannels()
- bnx2: bnx2_set_ringparam(), bnx2_set_channels(), bnx2_change_mtu()
- gve: gve_set_channels(), gve_set_ringparam()
- ena2: ena_set_ringparam(), ena_set_channels()
- (non exhaustive)

These drivers destroy and recreate queues during configuration
changes. If a NAPI was threaded before destruction, during the
creation, a new kthread will be spawned for the NAPI.

Some drivers do not have this problem, e.g. fbnic, netdevsim. But
these drivers and the drivers mentioned above will still lose kthread
during link flap (ndo_stop/ndo_open).

Because the kthreads before and after these configuration changes are
different, all the attributes associated with the kthread are lost.
These include CPU mask, priority, scheduler policy, etc.. If the
threaded state is preserved for a NAPI, it makes sense to want to
preserve the attributes of the thread as well.

Link: https://lore.kernel.org/CAAywjhR0TPKZ-xzqjSP709OVmZWUisDNv2CVc_VxgOrXRtop+g@mail.gmail.com/

Shuhao Tan (2):
  net: Save kthread of threaded NAPI in napi_config in napi_del and
    restore in napi_add
  selftests: net: Add kthread preserving test in napi_threaded and
    busy_poll_test

 include/linux/netdevice.h                     |  13 +-
 net/core/dev.c                                | 151 ++++++++++++++----
 net/core/netdev-genl.c                        |  12 +-
 .../selftests/drivers/net/napi_threaded.py    |  41 ++++-
 tools/testing/selftests/net/busy_poll_test.sh |  24 +++
 5 files changed, 203 insertions(+), 38 deletions(-)

-- 
2.54.0.1136.gdb2ca164c4-goog

