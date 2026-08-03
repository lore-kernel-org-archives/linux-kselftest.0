Received: from mail-wr1-f51.google.com (mail-wr1-f51.google.com [209.85.221.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 144F634D382
	for <linux-kselftest@vger.kernel.org>; Mon,  3 Aug 2026 22:22:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785795737; cv=none; b=f78v2lZ2jc0yU16gk/+G8LXsoo1ZoUUGF4AVY/SRPrSTsDZApTnHp8uR6eW71MCYBZp3UGizDWhAc49HAayI9SqXHtD/6Q8d8eFZsx/T11EXBSf6Rc/xrUwEGtWpDCM4Veedekpdnt7q+p6eM+LKbey1h86m9a7xyDosCP4UzeU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785795737; c=relaxed/simple;
	bh=L32eEk+AigImqaI9Q3Qd9blnSll3e0y4JFG4WoijinY=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version:Content-Type; b=ixJhrwZPefRZIAt7YkC86MSIW7aywUhhEGeNZXkEpf5EqvfrDqfJMWFFZ9IUUsclOZSilySW2r/HkgPt8cbuhtITjlqKv+MNmMIy48XbIzTJgObOpB2hmS0DgRoe/9W8yNggHKA678l4QyL9E60jlaUIq2YMkPehbxi3djv1Wbs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Y9MODDh6; arc=none smtp.client-ip=209.85.221.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Y9MODDh6"
Received: by mail-wr1-f51.google.com with SMTP id ffacd0b85a97d-473987fc217so243829f8f.0
        for <linux-kselftest@vger.kernel.org>; Mon, 03 Aug 2026 15:22:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1785795734; x=1786400534; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:message-id:date
         :subject:cc:to:from:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=xu1jtT5ad/3aIuWjkcapvBTalwstqcPff6mpQ3x0HLc=;
        b=Y9MODDh6X48DN5xFSDMSUVd/F6I/08NuXsCwGkC9gWgAA9guylYvTMtLP2FnAs1aIa
         Jbpvb1NPpW2Q6idwzXewdrJJKi1stDPiI6KqNd+J10+6elT3uL2CpX+h/LWNOy8B0FoM
         PIMG1Y8vD/vi51bC4fqbGsEUAqng4lxKulPLCFcZjAFQj08us7m8Zka/LgQnFjbaX13R
         eOE2rNy41dhjGgYBuWY38P45de6kORc3npQpbJyyHTj5Y0grzs5/ALLjDLa1JjSgpw6N
         GqfwZ8rofcWxvDNBIk/ZwXHrdsq0e7jSKLwCvsCUIiiLC8R8+mgSxrpJNDbH58BzPkK8
         KaCw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785795734; x=1786400534;
        h=content-transfer-encoding:content-type:mime-version:message-id:date
         :subject:cc:to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=xu1jtT5ad/3aIuWjkcapvBTalwstqcPff6mpQ3x0HLc=;
        b=hrVmCFLnHUYf4nbTGzR5EICb+BORYRZv9gxT2iw5qDG/GLHre3rIw+aYtPNHUFSpwi
         9Op90rPw7yP4BQm57l3RE7hOHwc0DTtp88I1X+lbFxDPxJNV5qdji6ghh1ppxlHsUsI8
         P3+Ob251Y7SD01nkV5Xm3GtXZ31tPlnFtdYuP7KHrefS+TDvd+0rjGbuMKBqjlJ/bvhD
         V1rF8zt9H1d4mPe4GepObrWNH6xnz37W4b98FsAIvvjtbqo0RXhO0SYmthQjEItQcqLH
         j368Sw852oA8hWdVl8784NMce5XtjhF6rcPH6e4coA3tc/kuKOo/w0bIiAsurS64ZfYw
         pUaQ==
X-Forwarded-Encrypted: i=1; AHgh+RpqCdEZTOcLFx40psArwK0K5jE0k27f3m4NtxZ0dW1NqicN0bZ4oAqH4MBhJaJrO6ipCg/sI3+UqM7KxuF8TBk=@vger.kernel.org
X-Gm-Message-State: AOJu0YzsixV9US2Qe2MS2Ql8+LAUT5R+8bZP1dlM05nuTyOboJ+5eFT+
	wMvTxZhF601QIX1KT+CPkcTLCeVBLPWkkG0hPJCdAoIEiA5RToWV6cIv
X-Gm-Gg: AR+sD12ZmTV4KnasuO8KRQNcMbgEUx38SZbfPJU7815otL1NbOpdMpPpooXDuK/7tt7
	xKTBgMvdA/hNflO7c2ppsAw6YnfnkSCcdw9wbjdbxrHECU2K2tNVppgONVnOQG0xveVcQrCazQ+
	pzno4bEH3kAzubr2cW88IK0OlZyLsU5yA4UPB1CBlPRWUGQ3MaDVUJarQL3M3yKLPG6Q/b3RWfU
	qqRZ9ne97vPSJmIdb8JBnC/qo57pLwr52VXB/3B14j2mLvNDsfhOPOvCuyClYfKVqYpfuNd8/mb
	D+kN/E5KD4NEF/HnKQMbuLD5z6WFOCgtik2hdgNlSmVgxKdAwvm71f9NNfyJelCcnqvK1LPGoaB
	G4HBfsof8Cb/6iaDKUWGHBJspZlbaX3FckcgmOIxBgDZOuqUyK0P4dNGZ4NuCtHiFSv+/foR0MM
	e9Py4ipqXa8kMv0c5biIOoo9x4FNyKorj1/sF/v0uoCuSzPFXhMamlqpHO92kBelUk8IHvLBA6U
	RWjEbXkc7yl1UIblCrAOQxlTr+Z9mHbcOsZ/5TpNKdoGxZS4WvZB3VEIf0g8o06rt2UN6mmk3NT
	fOw9gcA0n6LZw2khaHg=
X-Received: by 2002:a05:600c:35d0:b0:496:bbce:ef with SMTP id 5b1f17b1804b1-4980c694208mr146408445e9.3.1785795734106;
        Mon, 03 Aug 2026 15:22:14 -0700 (PDT)
Received: from L-022584.energy.envision.com (dynamic-077-012-149-099.77.12.pool.telefonica.de. [77.12.149.99])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49949fc2da2sm31668145e9.3.2026.08.03.15.22.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 03 Aug 2026 15:22:12 -0700 (PDT)
From: Xin Xie <xiexinet@gmail.com>
To: netdev@vger.kernel.org,
	linux-kselftest@vger.kernel.org,
	linux-kernel@vger.kernel.org
Cc: davem@davemloft.net,
	edumazet@google.com,
	kuba@kernel.org,
	pabeni@redhat.com,
	horms@kernel.org,
	andrew+netdev@lunn.ch,
	shuah@kernel.org,
	kees@kernel.org,
	petr.wozniak@gmail.com,
	qingfang.deng@linux.dev,
	fmaurer@redhat.com,
	luka.gejak@linux.dev,
	bigeasy@linutronix.de,
	xiaoliang.yang_1@nxp.com,
	skhawaja@google.com,
	stable@vger.kernel.org,
	sdf.kernel@gmail.com,
	Xin Xie <xiexinet@gmail.com>
Subject: [PATCH net v4 0/4] net: hsr: fix GRO/GSO super-packet handling
Date: Tue,  4 Aug 2026 00:22:07 +0200
Message-ID: <20260803222211.877-1-xiexinet@gmail.com>
X-Mailer: git-send-email 2.47.3
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

HSR/PRP requires per-wire-frame tags/RCTs and sequence numbers, and
duplicate discard is per frame. RX GRO and TX GSO can present
multiple frames as one skb and violate that assumption: a super-skb
is either rejected by a constrained lower device, or forwarded
without valid per-frame trailers and sequence numbers.

Patch 1 adds netif_disable_gro()/dev_disable_gro() and disables
GRO and GRO_HW on lower devices at HSR/PRP enslavement time,
mirroring the existing LRO treatment.

Patch 2 shrinks hsr->seqnr_lock from whole hsr_forward_skb() calls
to the sequence counter updates, so the segmentation work of
patch 3 never runs under the global sequence lock. The outer lock
also incidentally serialized the tx statistics updates in
hsr_forward_skb(); those now use the atomic DEV_STATS_* helpers.

Patch 3 unfolds the remaining GSO super-packets at the forward
entry with the top-level GSO dispatch (__skb_gso_segment()), so
each wire frame gets its own tag and sequence number. The HSR
master also drops NETIF_F_GSO_MASK from its advertised features so
locally generated traffic is segmented as early as possible.

Patch 1 provides the normal setup-time default. Patch 3 is the
fail-safe when a privileged override or another source still
presents a GSO/GRO super-packet: plain-Ethernet super-packets from
the master or the untagged SAN side are segmented, while
super-packets from tagged LAN ingress are rejected by ingress-port
policy.

Patch 4 adds a kselftest covering the series.

Patch 1 is independent. Patch 3 depends on patch 2, and patches 2
and 3 are selected for stable only on 7.0 and newer, where
sparse-bitmap duplicate discard accepts out-of-order arrival.
Older branches need adapted backports.

Validation:
* the v4 kernel builds cleanly, and W=1 allmodconfig/allyesconfig
  base-vs-patched shows no new warnings;
* hsr_gro_superpacket passes on the v4 kernel and fails on the
  base kernel with the expected mechanism;
* hsr_ping, hsr_redbox, link_faults and prp_ping all pass;
* no kernel WARN/BUG/Oops, no leftover namespaces.

Note on the contest report: the contest conflict is with the
already merged PRP RedBox work.

- In send_prp_supervision_frame(), preserve the Type-30 RedBox-MAC
  TLV and EOT construction, release seqnr_lock immediately after
  the sequence-number update, and remove the later stale unlocks.
- Insert hsr_gro_superpacket.sh at the sorted Makefile position.

This composition builds and both the GRO/GSO and PRP RedBox
selftests pass on the tested net-next tree (69963a0678a3).

---

Changes in v4:
- Patches 2/3: the four tx statistics updates affected by the
  seqnr_lock shrink now use DEV_STATS_*, so they cannot lose
  increments on the concurrently callable forwarding paths.
- Patch 4: three namespace variables are explicitly initialized
  (empty), clearing the ShellCheck SC2154 findings.
- Patch 1 is payload-identical to v3 and carries Ali Ahmet
  Memis's Reviewed-by and Tested-by from the v3 thread; his
  Reviewed-by is not carried on the modified patches 2-4.

Previous postings (newest first):
v3: https://lore.kernel.org/netdev/20260731090224.18-1-xiexinet@gmail.com/
v2: https://lore.kernel.org/netdev/20260724161253.79-1-xiexinet@gmail.com/
v1: https://lore.kernel.org/netdev/20260722171836.196-1-xiexinet@gmail.com/

Xin Xie (4):
  net: hsr: fix packet drops caused by GRO superpackets
  net: hsr: shrink seqnr_lock to sequence counter updates
  net: hsr: unfold GSO super-packets at the forward entry
  selftests: net: hsr: add GRO super-packet forwarding test

 include/linux/netdevice.h                     |   2 +
 net/core/dev.c                                |  18 +
 net/core/dev_api.c                            |  16 +
 net/hsr/hsr_device.c                          |  17 +-
 net/hsr/hsr_forward.c                         |  59 ++-
 net/hsr/hsr_slave.c                           |  12 +-
 tools/testing/selftests/net/hsr/Makefile      |   1 +
 .../selftests/net/hsr/hsr_gro_superpacket.sh  | 465 ++++++++++++++++++
 8 files changed, 563 insertions(+), 27 deletions(-)
 create mode 100755 tools/testing/selftests/net/hsr/hsr_gro_superpacket.sh

-- 
2.43.0

