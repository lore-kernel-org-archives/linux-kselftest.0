Received: from mail-wm1-f53.google.com (mail-wm1-f53.google.com [209.85.128.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5717044E65F
	for <linux-kselftest@vger.kernel.org>; Tue, 28 Jul 2026 14:36:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785249374; cv=none; b=iXoQro8cZAWBGvtjlFSZFFTePdfWP18y7y01jVEQtkVS6Hh3sA5fGFtjJXXeZpdF7FHjoPegcu9oDdpp/kS/HeyX7yBtfi55jRTp6/r8758jdQym4FvJ9NhW42lSFOwp307TMMDkGGoxHAq/t2wdcrO9jIpIHH/kVZe8N2+eeBE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785249374; c=relaxed/simple;
	bh=lMvHwdjXU/tguKBCDnl57L4KlTAZg6CmyfTitAknuRQ=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=p3ytXhpX+XXIpSOqBnGDFmsx68WcCx7jU0rpBJKXACJJf9bN9SveXH+VptsL7keDZr0YJuSqHZkW6DPvc6ah1d/XHpeAR4CfnoLIMaETk7QKDRtgOdy4k5ugySLhMgOL37nCVX0I37ZdjA0mVpdH2ej7UDRaxZ9bLTittCMUMCw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=qhLuSrJr; arc=none smtp.client-ip=209.85.128.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="qhLuSrJr"
Received: by mail-wm1-f53.google.com with SMTP id 5b1f17b1804b1-495522bc0e2so530435e9.2
        for <linux-kselftest@vger.kernel.org>; Tue, 28 Jul 2026 07:36:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1785249367; x=1785854167; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=gV+baTkVnmeIvpucnWX4cYoPM8VqelkCbFJAKxVz2bc=;
        b=qhLuSrJrB0NRb5qbPWM08Mm2ZLmErhg1wPYwMOsamGMR3uk3pG2plkPotTY8ygDsgb
         p6Fx952FDjoVUVsouOVtm9Ens2Fue3bKcQr6O8nkjn+8ZRS1dCA3TBGxaAyfq4NhSOD+
         /H+9LBIvg16YE83f3aTQBJ2gyEGsQKsVoS0h5S9E6C+HcI9Tj15MF05tiWqDii8rEGOb
         pl7KxQoLsJ0y9bO/6JBPzfASNLVWBXRjSFxa5gxTWKsCfr1FBLJlx7WggTvede0d7h+Z
         ppUUGptz4A7ws0gdYzR0qglRKXo4mjSou0vPGSuMj+Hq2zt8f+WCWvKv+NE1s40K1p68
         iYBg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785249367; x=1785854167;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=gV+baTkVnmeIvpucnWX4cYoPM8VqelkCbFJAKxVz2bc=;
        b=R3a7Lr0PjTxjmivLsUPUdq3BqbJs2llJDZPBRVyt2nPojwJLNTcaxB1R8IlARyZ0oR
         eixVTXPFSk5qkSlGQ4ZaV7VeSmuztZPx6v3TwIQ4lmK0MZ8pFg+9P1zuXrLfh5dNbF6F
         oV8YCykgzThOoGQA8gydkcQLYJVJDjBPJtWys8YGBmVpjixeGd9kMbCvj9uQO+TD9aiV
         HrrRrX0EKZvCTAPzoK7/PRxC/29RqtcCoDNbThi5rGuMY6EcP5iFhULu+KzzFTBWzFl0
         9nCZmZz3tOeKTYNnz5C+9+N4og0pUGliZT5Yd/xRA4QMOs0Cl4Cm9tDMbym2yBZ5VUhG
         6kZQ==
X-Forwarded-Encrypted: i=1; AHgh+RrOZIun/MpkM4x9WiB8hWIIyhkML5g7dfvE4pkaL/3KVhjk3YfLTA3VqiRLO+xGsGlHoCZDU2XWBxJsqIW81Yw=@vger.kernel.org
X-Gm-Message-State: AOJu0YyzUbXOJGx5aHyrHGHSck34aKEV4LPQ3eX/7sXO20x31ncUuFQV
	ZHoAqLzwAXy1Bgvc74lNcS9u/JCNa9NNCEIPDxtkdBJzMTY/Mhr/hXvB
X-Gm-Gg: AR+sD11ghfdhBJWx5wJ2OfArJhIzDyGKGRW7Nw6vSF4RGQME6O9B6/LmsLeowMxaqZI
	UJPDMk1fPXrIC/jihfMKoTIRzc1YkOiG/2YuBkSFo6TbzIuDWAoqYnMd0zQUEQ8G1uq9pODdqll
	eXLKQzadVGGSshdc4PrzA1oxuXy72g4/RQOVwXr9KwG7L+6rO0JpU58ziHyD6cDRlwhV81FWczn
	tvX9ub8fThkjgOsrR2WRg6xeFSg9YHsooz0N/iEmcQP8ukPO960n45Nq13fqxQtiyUKPKmEiIZ1
	rnPCNCrYnE5bUtZeFJhO1TyPR7u2r2zLl/kHkx56vUxnmZprh4aw3t05pEtesUagEIEQ4ZuaJyT
	UCROBbWq5ahgKc/J/igw9/FDtXdqh1juFEqzJIEtn6qP+fl+tyJsCx2jBfqD4Acc6DrNFqmWw+b
	QsNAnt0T/ygpXOn9aGEL/nNEg67RY95ZLdVWasUPVbafDMUYqgNMHfCWIdlIrZILVaWy50BaCAv
	kjdUcoFayGDj8uO3OkSCY4h80TYBn6/8MapYsA=
X-Received: by 2002:a05:600c:1d0c:b0:495:6e5f:3961 with SMTP id 5b1f17b1804b1-496c9da4de7mr12963385e9.1.1785249366551;
        Tue, 28 Jul 2026 07:36:06 -0700 (PDT)
Received: from L-022584.energy.envision.com (dynamic-077-179-168-074.77.179.pool.telefonica.de. [77.179.168.74])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4957bfe07e1sm303390105e9.3.2026.07.28.07.36.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 28 Jul 2026 07:36:06 -0700 (PDT)
From: Xin Xie <xiexinet@gmail.com>
To: davem@davemloft.net,
	kuba@kernel.org,
	pabeni@redhat.com
Cc: edumazet@google.com,
	horms@kernel.org,
	shuah@kernel.org,
	lukma@denx.de,
	m-karicheri2@ti.com,
	netdev@vger.kernel.org,
	linux-kselftest@vger.kernel.org,
	Xin Xie <xiexinet@gmail.com>
Subject: [PATCH net 0/3] net: hsr: fix shared-skb mutations in the forwarding path
Date: Tue, 28 Jul 2026 16:36:01 +0200
Message-ID: <20260728143604.26-1-xiexinet@gmail.com>
X-Mailer: git-send-email 2.47.3
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

During the review of the PRP RedBox v4 series (Simon Horman forwarding
the sashiko AI review), shared-skb-data mutation issues in the
existing HSR/PRP forwarding code were raised. They concern
pre-existing code, and we promised independent fixes for net. An
independent source audit then confirmed two distinct defect classes.
This series fixes both.

Patch 1/3 (interlink address mutations): on an HSR RedBox, frames
forwarded to the interlink arrive in hsr_xmit() as clones of a shared
skb. A tagged multicast or broadcast from a slave is also delivered
to the master through another clone of the same buffer, so the node
MAC written by hsr_deliver_master() and the RedBox MAC written by
hsr_xmit() land in the same six bytes; the local stack receives the
RedBox MAC instead of the originating node's. Master-originated
frames alias the original TX skb (taps may hold it), so the
master-origin substitutions and the RedBox rewrite would share data
too. The interlink-bound skb is now privatized with skb_cow() before
any address mutation: for all master-originated frames, and for ring
frames the master also consumes. On the hardware tag-insertion path,
the selected master-originated and locally consumed ring frames are
now isolated before the interlink address write. Ring frames the
master does not consume retain their existing zero-copy behavior and
pre-existing aliases; the pre-existing slave-side packet-tap alias is
explicitly not addressed here.

Patch 2/3 (path/LAN ID alias): hsr_create_tagged_frame() and
prp_create_tagged_frame() wrote the path/LAN ID into the received
skb's shared buffer and then skb_clone()d it per slave, so the
second slave's ID landed in the first slave's still-queued clone.
With a 200 ms netem delay, all 200 injected frames left slave A
carrying slave B's LAN ID. The helpers now clone first, privatize
with skb_cow(), reacquire the pointer, then write.

Patch 3/3 adds a regression selftest covering both classes:
pre-tagged PRP injection (base: 200/200 wrong-lan; patched:
isolated) and an HSR RedBox tagged-multicast case (base: the master
receives the RedBox MAC; patched: the master keeps the node MAC and
the interlink keeps the RedBox MAC).

Each code patch carries its own independently identified Fixes:
commit (5055cccfc2d1, RedBox introduction, v6.10; 451d8123f897, PRP
support, v5.9). The PRP RedBox v4 feature series is unaffected and
benefits when rebased.

Relationship with the in-flight GRO v2 series ("net: hsr: fix
GRO/GSO super-packet handling",
https://lore.kernel.org/all/20260724161253.79-1-xiexinet@gmail.com/):
full revised series vs full GRO v2 series verified applying cleanly
in both orders (selftest Makefile merges identically either way);
no textual or semantic dependency.

Validation (raw logs in the series' evidence archive):

- both shared-skb mutation tests: base failed, patched passed
- all executable HSR/PRP selftests of the base: pass
- create/delete loop x10: clean
- checkpatch --strict: 0 errors (one routine new-file MAINTAINERS note)
- W=1 base-vs-patched: allmodconfig + allyesconfig, 0 new warnings

Xin Xie (3):
  net: hsr: privatize interlink-bound skbs before address mutation
  net: hsr: clone before updating path and LAN IDs in tagged frames
  selftests: net: hsr: add shared-mutation regression test

 net/hsr/hsr_forward.c                         |  51 ++++-
 tools/testing/selftests/net/hsr/Makefile      |   1 +
 .../selftests/net/hsr/hsr_shared_mutation.sh  | 213 ++++++++++++++++++
 3 files changed, 260 insertions(+), 5 deletions(-)
 create mode 100755 tools/testing/selftests/net/hsr/hsr_shared_mutation.sh


base-commit: 53658c6f3682967a5e76ed4bc7462c4bdcddaec3
-- 
2.43.0

