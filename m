Received: from mail-wm1-f54.google.com (mail-wm1-f54.google.com [209.85.128.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 02ED642254B
	for <linux-kselftest@vger.kernel.org>; Tue,  7 Jul 2026 13:59:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783432783; cv=none; b=iQRcZNLI3KjMY8EU1QzAcA4pVlE4pcYHAR3CcziDwIlXBuFncIXvCcNw4ZpQwoQ3zJ8XbTn7PtTQns98sOmP91O2dV0trRJJenP5TY+wT35Cy8M33eNB2ZXe72PtsfxNXwAvKli+HCOvkLvUfx+G+STOY35HFyWh4kv2qmijMdg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783432783; c=relaxed/simple;
	bh=Rl43uplBn455YhFwjo/vcc9PHxz7zLwspe271+LXUrw=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=K8i60r2qBfS6ydbE7BpQybMEEuJe7x49oi2o+O8296qtj2qo2ba5E9r7zZT19P2ClIvA7AL2Rj0mmuhQQegi+fFAEpQxlCybqZkBJjh+BF8Zofh0CEuAZOru3HZdG7EP/+QTddJikImIzd1Djb6YLSlp3fm/+6Q6lhGRJY5Vrwo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=XzF99Pqn; arc=none smtp.client-ip=209.85.128.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="XzF99Pqn"
Received: by mail-wm1-f54.google.com with SMTP id 5b1f17b1804b1-493c30f5347so4389415e9.0
        for <linux-kselftest@vger.kernel.org>; Tue, 07 Jul 2026 06:59:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1783432780; x=1784037580; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=vstUOUhJFF2dnlTmkQFQ2pW4YjUnMuVRw9ylmAWYSnU=;
        b=XzF99PqnB39O4ARUaL5bXUJJzPSE86UgCTfKi2TIX44budyaKd/+xCI643Qe4wE4/8
         shrnoG7TyFQEgXPGL3jyTARjkshjMTIFEQ1L8p9NskFRbiOBNxcZhzukvbd7JQudKOUO
         bBCkF8GaYysb/TlWnaGsc0BgocG45jH580krARzHoLesnP37Ji4S1MMtcN9DIps1MGIi
         kETMAyAcxPxWYQwcO/xFpCupyR9/Fuuz6qKzCmAbZS7IlbVPIYOU5aE/UWP0EZy9oZWb
         2PxdHJU2pvj/Ee1SRcc2yVqgGDQTyyEtv85WquUU78SsavhZ1TMmn30/z/dNN1uG/DAT
         591Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783432780; x=1784037580;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=vstUOUhJFF2dnlTmkQFQ2pW4YjUnMuVRw9ylmAWYSnU=;
        b=VGNsAEFXWl52jXI4w6eMHGXwZBQRp7qIS7qLXOVE2U5kajhrndpDsKAuVI8jqTNa9A
         Hj2XPO39ek7PQjrg8RuxAvKNYd8C8e6KNuL+5Ci/S+uoI5nc8D9sQkxMsq5GaKFl/Fva
         hM8uLJ3kxN/C5d3rBES/nZlprngFHtVaiK8oDmpt26/KnmSx8dW7PLbrg3SBk7nteaGQ
         AQ2VqfX/LjhFf4exikuXDPdCeJ6HzmSWl1KXLhBQ7cmlEGvEyeTNB73pado/WgiEgGHb
         T48fn53iwVRxvRJEwmDM1wN5X/3mDySOPfdtQ+HXlrXKNeVb8BR5Rqvc6CV+oQqRtBi1
         0SEw==
X-Forwarded-Encrypted: i=1; AHgh+Rpy0oNQy9AM18MhGOJJ2yroWYQm+OwAUXJc717Uy3Hg7Sdp5rClNvpFADCKRj6QuIYVdgS2OEvlGwli09XWycQ=@vger.kernel.org
X-Gm-Message-State: AOJu0YzceTafJY+pyAe66nmH69AWqRSNz1FDhO55UckOatGGM0Ev+kK+
	1AZyNkPpi5+xh3TqCH2a5QuMCOTwmxQjdSx8Exq+nVARx42Q31CkW3Zx
X-Gm-Gg: AfdE7cmzzrK2j0hCfkRiIM+pHfbiIZOzNn4QccmrIyyV9BptA3Sd3zDvO7x2RfiTZH+
	wn4nnVCsgZlX7rdoBYKjZjxNCyTFBN7bdB9HeL1/f0HovIzKKZG6fvXtlxxmObjxh0gK3T6sKp3
	b47x5JrT4clWkjd4nHcSjQGKjt53HRKihakABOFPCvlquKZMn2eBE0RKViQaxAW5Po9wC/p4JJN
	LEs32l9y6OY6QlfKrVaTdVMhRUWJJkKbGSKYzvJVzzT3P7wfVtEED6G5vagL9KA6dhZPLa2DjTQ
	7pBfq3yh6nUF7TIZ7VApvi7fiOF6OBdqopsJZdE7jM7srCPu0QkOP2rNNSnUyfYgioVX3/tTHTT
	7SaXzQNgBiH9v0mT/kq+/HumyM6AT5ygaHPbCMNHSsPNwMrjBvPBZoMQ3tq4qDqZY1iUBWuVC81
	yvTgvmcUkan1G101N2s8Uay3QUE2MEcBQ92rAq2JnIW6nUKAggIOfLWhYfkv5DsYvWi0c2rxMji
	6Ic0/u+QYfk/0hvbkZ1tF5Ki5ra/V28WTgLzUnrm5Dft3hazLo=
X-Received: by 2002:a05:600c:c0cb:b0:490:b227:da9b with SMTP id 5b1f17b1804b1-493e0b9071emr12356505e9.1.1783432780094;
        Tue, 07 Jul 2026 06:59:40 -0700 (PDT)
Received: from L-022584.energy.envision.com (dynamic-077-189-165-250.77.189.pool.telefonica.de. [77.189.165.250])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-493e0f40d50sm67409615e9.5.2026.07.07.06.59.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 07 Jul 2026 06:59:39 -0700 (PDT)
From: Xin Xie <xiexinet@gmail.com>
To: netdev@vger.kernel.org
Cc: "David S . Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>,
	Paolo Abeni <pabeni@redhat.com>,
	Simon Horman <horms@kernel.org>,
	Shuah Khan <shuah@kernel.org>,
	Sebastian Andrzej Siewior <bigeasy@linutronix.de>,
	Felix Maurer <fmaurer@redhat.com>,
	Luka Gejak <luka.gejak@linux.dev>,
	Fernando Fernandez Mancera <fmancera@suse.de>,
	linux-kselftest@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Xin Xie <xiexinet@gmail.com>
Subject: [PATCH net-next v3 0/4] net: hsr: PRP RedBox (PRP-SAN) support
Date: Tue,  7 Jul 2026 15:59:33 +0200
Message-ID: <20260707135937.18-1-xiexinet@gmail.com>
X-Mailer: git-send-email 2.47.3
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

This series adds PRP RedBox support to the hsr driver: a PRP node that
proxies one or more SANs sitting behind an interlink port (IEC 62439-3,
PRP-SAN). HSR-SAN has been supported since commit 5055cccfc2d1 ("net: hsr:
Provide RedBox support (HSR-SAN)"); this extends the equivalent capability
to PRP, reusing the existing protocol-neutral proxy machinery
(proxy_node_db, hsr_proxy_announce(), hsr_prune_proxy_nodes()).

A SAN behind the interlink does bidirectional unicast with peers on the PRP
network, its source MAC is preserved on the wire, the PRP RCT is correct,
and the RedBox announces each proxied SAN with the RedBox-MAC TLV (Type 30)
in its supervision frames.

The series is bisect-safe: the datapath, duplicate discard and supervision
support are added first; the rtnetlink rejection of "type hsr ... interlink
<dev> proto 1" is removed only in patch 3, once the feature is complete.

Design notes:

 - prp_drop_frame() does not walk the node tables. The destination
   classification (PRP-network node vs proxied SAN) is resolved once per
   frame in fill_frame_info() and cached in struct hsr_frame_info, so the
   per egress-port drop decision is O(1) in the softIRQ path. The
   classification is gated on PRP RedBox devices (prot_version == PRP_V1 &&
   hsr->redbox), so HSR RedBox traffic is not affected.

 - The LAN A/B duplicate test is factored into prp_is_lan_dup() so the new
   PRP interlink rules in prp_drop_frame() do not change hsr_drop_frame()
   behaviour, including the NETIF_F_HW_HSR_FWD path. This is software PRP
   RedBox only; it adds no new hardware-offload contract.

 - The supervision emitter uses pre-reserved tailroom (hsr_init_skb() +
   skb_put()) on the existing GFP_ATOMIC path; no skb_linearize() or
   pskb_expand_head(). The RedBox-MAC TLV is followed by an explicit EOT
   (Type 0, Length 0); padding via skb_put_padto(ETH_ZLEN) and the 6-byte
   PRP RCT remain at the absolute tail of the egress frame.

 - The hsr_get_node() hsr_ethhdr length guard is relaxed only for PRP
   supervision frames (prot_version == PRP_V1 && ETH_P_PRP && is_sup), which
   are untagged with mac_len == ETH_HLEN. HSR (ETH_P_HSR) supervision is
   front-tagged and keeps the original length requirement, so HSR
   malformed-frame filtering is unchanged.

Testing (on a net-next v7.2-rc1 kernel built from this base, x86-64):
 - checkpatch.pl --strict: patches 1-3 clean; patch 4 reports only the
   expected "added file(s), does MAINTAINERS need updating?" note, which is
   ignorable here -- MAINTAINERS already lists
   tools/testing/selftests/net/hsr/ under HSR NETWORK PROTOCOL.
 - git diff --check clean; the series git-am's onto the base commit.
 - tools/testing/selftests/net/hsr/hsr_prp_redbox.sh: PASS on the patched
   kernel (bidirectional unicast, SAN MAC preservation, RedBox-MAC TLV +
   EOT in the proxy-announce).
 - HSR regression on the same kernel: hsr_redbox.sh (HSR-SAN/RedBox),
   hsr_ping.sh and prp_ping.sh all PASS, confirming the PRP changes do not
   regress the existing HSR/PRP paths.
 - netns checks: peer<->SAN 0% loss with no duplicates and a valid PRP RCT
   on the wire; a silent SAN is pruned from the announce; zero driver
   WARN/BUG/Oops/RCU-stall during the run.

Beyond the in-tree selftest, this exact series (applied to this base and
running as the net-next kernel on x86-64 hardware) was also validated with an
out-of-tree IEC 62439-3 conformance harness (supervision TLV chain, duplicate
discard, cross-LAN rejection, seqnr rollover, VLAN/multicast/GOOSE frame types
with the RCT verified at the absolute frame tail), and interoperability-tested
against a commercial PRP RedBox (Siemens SCALANCE X204RNA) over 100 Mbit/s
Fast Ethernet with NIC hardware (PTP) timestamping: a mid-stream single-LAN
outage of ~2 s at 10 kpps was bridged with zero lost and zero duplicate frames
(seamless PRP failover), and the duplicate-discard window held zero lost /
zero duplicates under netem asymmetric delay up to 100 ms (~1000 sequence
numbers in flight), 25% reorder, and 5% single-LAN loss. The failover and
impairment matrix was additionally repeated on a KASAN + lockdep + kmemleak
instrumented build of this kernel, including a 72-carrier-event link
flap-storm with deliberate double-LAN cuts: zero KASAN, lockdep, or kmemleak
findings. This out-of-tree testing is supplementary and not required to
evaluate the series.

v3:
 - no code changes; repost as a new thread (v2 was incorrectly posted
   in reply to v1)
v2: https://lore.kernel.org/netdev/20260706134131.61659-1-xiexinet@gmail.com/
 - publish the RedBox state before lower RX handlers can learn nodes:
   fixes an initialization-ordering race where a node learned during
   device setup got a single-port sequence block, breaking interlink
   duplicate discard and letting the supervision merge read beyond the
   source node's allocated sequence bitmap (reported by the NIPA Sashiko
   review)
 - harden the supervision sequence-block merge against mismatched
   seq_port_cnt
 - align macaddress_redbox for ether_addr_copy() on strict-alignment
   architectures
 - selftest: kill the background ping by exact PID and wrap an overlong
   line
v1: https://lore.kernel.org/netdev/20260704234704.4297-1-xiexinet@gmail.com/

Xin Xie (4):
  net: hsr: add PRP interlink (RedBox) datapath and duplicate discard
  net: hsr: emit RedBox-MAC TLV in PRP RedBox supervision frames
  net: hsr: allow PRP RedBox (interlink) creation
  selftests: net: hsr: add PRP RedBox test

 net/hsr/hsr_device.c                          | 44 ++++++++-
 net/hsr/hsr_forward.c                         | 49 +++++++--
 net/hsr/hsr_framereg.c                        | 27 +++--
 net/hsr/hsr_framereg.h                        |  2 +
 net/hsr/hsr_main.h                            |  2 +-
 net/hsr/hsr_netlink.c                         |  8 +-
 tools/testing/selftests/net/hsr/Makefile      |  1 +
 .../selftests/net/hsr/hsr_prp_redbox.sh       | 99 +++++++++++++++++++
 8 files changed, 207 insertions(+), 25 deletions(-)
 create mode 100755 tools/testing/selftests/net/hsr/hsr_prp_redbox.sh


base-commit: b73bc9ca3686b78b642fb35dcc1fdf874ecb74a1
-- 
2.53.0

