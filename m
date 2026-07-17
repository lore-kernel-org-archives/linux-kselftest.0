Received: from mail-wr1-f49.google.com (mail-wr1-f49.google.com [209.85.221.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BC6773890EF
	for <linux-kselftest@vger.kernel.org>; Fri, 17 Jul 2026 20:15:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784319305; cv=none; b=gIu3DcSuNHLTpTHEA4E1q3wWiYXxzltJ07dtsp5D1JpDCUMhltvbQp4Y8jnDZ2wAwQH52lkRxrtcVscB5segzrxXqBcf/nkejpog6TFIXMTRrkopfCNTyvpPdXGsK9NoNEYl/sc59FlTVx/qaqZh3cJaw2cCmDXSlfWgvklpXSU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784319305; c=relaxed/simple;
	bh=GV1srDi4kDItYUj6rQIiIuZChYX2kOnVWv7DoMb6S8s=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=sMgzENV/CrIPW+cDZs3isc24n6xW5pwv+oOVTQgEj+OaL9feAm+p8Adg2nYwJpddy/CUDQjqwZW+Z0aTKIyxoQg5/zbHtNr1bHTz28UcqnTsv9DJnC+vDysgGieL4XglhFLWIF2XNzMG5HSwftxemC2wudWbWjuBCu1ksr46plg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=HsQJqp7v; arc=none smtp.client-ip=209.85.221.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="HsQJqp7v"
Received: by mail-wr1-f49.google.com with SMTP id ffacd0b85a97d-4706f016316so542963f8f.3
        for <linux-kselftest@vger.kernel.org>; Fri, 17 Jul 2026 13:15:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1784319301; x=1784924101; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=l3e9Y+jrV2F0gWW87vf3L0ZYdrhYMVp2UOwkFO3dd0E=;
        b=HsQJqp7vFDS7NgqVAZSxXOvNcSNT2RKOBm9GSO1SpU4lOC4gXXoNLhQ/Lz8cAyVyFy
         hRK3+mT4tsRj6VOOIWLixdYtA5wZL5o5ituncckShDIVNN8H5K/675wTClJFhfDesNFJ
         cZPIzA6l0VljPymMQ4Bgm8XTulzU1joyBYtpDSvfQlIuCRY8krzEPnV5ImF3RlZaY7Ur
         lWZ4qFFQlX2umUzzkB6UHE3jyycLsVGoazrg56ufcl9dy1ljukukNydgRbawtg6F6M21
         apsXuSvtpmf4bK2Bemh33VaTomsPv0wxS6/viSGhMXLEmu5j8qfwIUj1O8h1ueW/yZF6
         VPeA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784319301; x=1784924101;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=l3e9Y+jrV2F0gWW87vf3L0ZYdrhYMVp2UOwkFO3dd0E=;
        b=Gl8ay+RJIHpX8T3JQ5IAIWytrboME/Osibm2Ly12mtA03ZGFxYASfDYaxVFnbNF6Jm
         vVD7uL1bzn/8WP0eFAF1a6lGRrxDEONAvK6ypddRbvKe1sLrnuWiw03mLHrw+0QOSnSo
         O5srEuakYsiErTC4aAA2PHD9xX5WKZGcJSL9QsKb41cqCq4qLlpd/0YvDCIhOGsDpt5J
         uXDsZKE5b0OXeOMTtoOdxbOu+vls0ZIIFiuZ9W72I3lSkSSmrsdv0poCuqtPrRZBup2s
         SLW/1YoiKT7OZBX8rl6rIa1WPg0LAP4tl21jZM6RON53ZThaKbOC0k9+FTrdu9seVHjC
         q86Q==
X-Forwarded-Encrypted: i=1; AHgh+RoBFaPgGFfQDTTjR3ryf1BiCP5exxaMKrsb7MO3zQh9qKo2S7oTK2c4pGN3YuRW5VtXXSjxdGn4wsUzPMMjwEM=@vger.kernel.org
X-Gm-Message-State: AOJu0YzP7JSkjDQQnMiRayvtNA7rI5Wwc//ACTYI0Y+Wv0fcnRPdRnQV
	Po4eMy+bNn8jq2vuxmtoLq7hqj1aHN1+xzXMIfT3I2/4J1oHMNgTZSJc
X-Gm-Gg: AfdE7ckpX6/AoWq2ivEzFALc3L35ijwaQf14v+NmTI9BVYCNVbD8DjIehBo3sE3+l0T
	7qLP2nk57fQ22gCHk6vcD055BlY3iCO8HnZokknLH99hf3yBLoIa4qqTKJXQvuVf35HHk0Xl8JM
	l9XpGWTcAvSpGr/ttyiHVjVK6FwRp0qhs9tf+75mzzk/3ZlWvsjGrUDb4QCs5NymhB4jd8eg5kO
	92sun3shKOx9jT35jJdIK11gxXADJ4GUws705QZL9BQUTGir9k2A+wJctl+vPL88JkIppdh9q0q
	WsgLhfBBK22SdMcbILm4AL8grJFKMjss4GThtsJvG6BxZWoiww+oj0Ixtqi8YMM48g1inh69JMx
	SGxPBLJ6nS+vwuMc0RQP8nhwGAWvNvgnr3ZECFyh1ems/obkFL8nEDcd0i6XvjR82EkVlJ+CYY0
	MuRn6GC57ZFBHkLlVhCKqOzxBJaUCe055rizCW+WyF7vKeWGEeCL8Uhw1LjTtdnLffItZ8zxAZb
	euq07o4eIc4w8roNgAq9ZhUkHJ1Yi84St1wVLM=
X-Received: by 2002:a05:600c:4e94:b0:493:ec89:db4a with SMTP id 5b1f17b1804b1-4954a38f5e6mr28817545e9.0.1784319300516;
        Fri, 17 Jul 2026 13:15:00 -0700 (PDT)
Received: from L-022584.energy.envision.com (dynamic-077-179-077-126.77.179.pool.telefonica.de. [77.179.77.126])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-495499a5847sm53179335e9.2.2026.07.17.13.14.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 17 Jul 2026 13:14:59 -0700 (PDT)
From: Xin Xie <xiexinet@gmail.com>
To: netdev@vger.kernel.org
Cc: davem@davemloft.net,
	edumazet@google.com,
	kuba@kernel.org,
	pabeni@redhat.com,
	horms@kernel.org,
	wsa+renesas@sang-engineering.com,
	jie.luo@oss.qualcomm.com,
	shuah@kernel.org,
	linux-kernel@vger.kernel.org,
	linux-kselftest@vger.kernel.org,
	fmancera@suse.de,
	bigeasy@linutronix.de,
	fmaurer@redhat.com,
	luka.gejak@linux.dev,
	Xin Xie <xiexinet@gmail.com>
Subject: [PATCH net-next v4 0/4] net: hsr: PRP RedBox (PRP-SAN) support
Date: Fri, 17 Jul 2026 22:14:53 +0200
Message-ID: <20260717201457.54-1-xiexinet@gmail.com>
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

Testing (on a net-next v7.2-rc2 kernel built from this base, x86-64):
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

v4:
 - pass rx (enum hsr_port_type) to prp_is_lan_dup() instead of the frame
   (Fernando Fernandez Mancera)
 - restore the original macaddress_redbox indentation (Fernando Fernandez
   Mancera)
v3: https://lore.kernel.org/netdev/20260707135937.18-1-xiexinet@gmail.com/
 - no code changes; repost as a new thread (v2 was incorrectly posted in
   reply to v1)
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
 net/hsr/hsr_forward.c                         | 46 +++++++--
 net/hsr/hsr_framereg.c                        | 27 +++--
 net/hsr/hsr_framereg.h                        |  2 +
 net/hsr/hsr_main.h                            |  2 +-
 net/hsr/hsr_netlink.c                         |  8 +-
 tools/testing/selftests/net/hsr/Makefile      |  1 +
 .../selftests/net/hsr/hsr_prp_redbox.sh       | 99 +++++++++++++++++++
 8 files changed, 204 insertions(+), 25 deletions(-)
 create mode 100755 tools/testing/selftests/net/hsr/hsr_prp_redbox.sh


base-commit: f6f3b36c15ed44de1fbb44e645e4fae8c4a4453e
--
2.53.0

