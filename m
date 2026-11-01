Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.218.45
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793551568;
	b=V5cepe5zMIldyEQ4oVnBPNdZ3klTdsf7x6evXDkrEjBc+6mU2hJnGhQHbxsOe2AMwgqg
	 tG4K+FU/xrUrVu1c6CSKTRg6EfhoDMvd2FjIRClCbnQybyqrS+vwKXu6GA3dAHn0WhIsd
	 1EG6O3yUP4ubJ0IflwzOMdOPj1ICxUgQTNtZseITjmd+6IVoGjPPNZi+7IeKQ6l9I86zb
	 Zi3a25scN1GzWtRQoxTBZwCTIM1nGjMN1Yl8YxUcaq0fBt0MAc2o1ZLODAERFgzaEiX/t
	 SOHVPR6+k5G3kF2pQLUS9IrD97VML4qLKq7brhm2sSI2ZYMrT74CVFhPmGHvPSW60wg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793551568;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding;
	bh=iEErhRDl3S56+aNPJWVUQgzwmxLxife0dB/9v8Rdiiw=;
	b=XDKU56dE3mHeEIWVW2SA+hpM3yh9tLuyCe2gqL3E+xyv9H+alGWam4TKpk3jQKsAED9n
	 JnntYHA+GyJWXzcrB0Z2SMC76Tp6BNk7j988tHoPGdEmktcA0ggB9/0ncO3vVwLjHqqp9
	 Yz7jUD3vRyetoc4lRZLPpJY1L0JoJLCX5CQ/iD35bG6UZTmIRaTI6rUpKVG2dy9ApkTLa
	 IePfXH+36frzhSsiG3gBqHRUduxxRd0edArsaSd4X7sXYDpi0o9+wYPREeI32063JdrWM
	 fLt+WvktBq5IY6JYHzn7NzcE59RnyMzBPszm7Gk9oltqZ3Ad+D6KEFf3Ktk5VRbnvaw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=bairaktaris.de;
	spf=pass smtp.mailfrom=bairaktaris.de;
	dkim=pass header.d=bairaktaris.de header.i=@bairaktaris.de header.a=rsa-sha256 header.s=google header.b=Mo1VfA1Q;
	arc=none smtp.remote-ip=209.85.218.45
Received: from mail-ej1-f45.google.com (mail-ej1-f45.google.com [209.85.218.45])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AF0F1606A325
	for <linux-kselftest@vger.kernel.org>; Sun,  1 Nov 2026 16:46:07 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org AF0F1606A325
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bairaktaris.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bairaktaris.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=bairaktaris.de header.i=@bairaktaris.de header.a=rsa-sha256 header.s=google header.b=Mo1VfA1Q
Received: by mail-ej1-f45.google.com with SMTP id a640c23a62f3a-c423b145922so293493666b.3
        for <linux-kselftest@vger.kernel.org>; Sun, 01 Nov 2026 08:46:07 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bairaktaris.de; s=google; t=1793551566; x=1794156366; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=iEErhRDl3S56+aNPJWVUQgzwmxLxife0dB/9v8Rdiiw=;
        b=Mo1VfA1QYS7med+7h5C2VSJWUvErjNDQBkiMVwcSRop+V16SphII3OJte2cUBPuAAr
         C8BxL3wPOI3Ky8AhF0wkCfP3ORb3XvxQaceMLD7ffw/UtUYG/wbM7k78/u5Pf4glpx81
         Fqn2aLbG0GQnnQayVcf6JUGvz7OPIfCcBPlIs2FrxS1fSHoHKiDs1OuEuv6z5coc9JB6
         DFpWyK1uLvNXJSZVI4HyUj/iAVHfJSx9LF9rX+JqQXVZDS4vg3Wal83xLp46YguuOWX7
         Pu+f3MhVPkO842hG1GXmkAQt4ghJBd26E/ujEws2yX4c54RnIKcVS1Jngr/RZvIYI8af
         LmHw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793551566; x=1794156366;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=iEErhRDl3S56+aNPJWVUQgzwmxLxife0dB/9v8Rdiiw=;
        b=jFfP5XRR6lduf5tLxU/dn50JAU4NpZBaclwujTju3p5TNVKNS5IweToyDs1pMBo1a1
         +IWJufeyFRgOuM594Lf95Bp42nv5xO2QEynATJrGCztwtCFy4DY72G+r5WY9XssQ7Dmp
         vQyvs3gn8u62KGNUZoVWaFOgPHdu+sSWtI9mtDguztyjfU27FCeVw41GejGBswiJD5Ae
         qyyB2VpycLseDgEa4KlvV3tRVtSrxH+EOjvqtQEGBdDLNbj83ZRjxjx+TAhFvJjMfF5u
         N2btz8LaM0uxgj3o3N8e2cGqQjicmdk8m1u9ebinXib+Lqh0ZVpAh+vQu3bQAOARQe5J
         PFhQ==
X-Forwarded-Encrypted: i=1; AKwUvBwfYKj5HHAcwllFehbJk53JFN22jkwxhrHYxV2L3VDFRZefGGmMFg0PK087UY2CPOog2fu/+Vzri763Q8jHwt4=@vger.kernel.org
X-Gm-Message-State: AFq9FYJZx3QplJi18drg3lhRqbCqs9HBIIBz16q39yv9GEYdT9LSWttW
	tx5riIEPDubBAHooZ6gZCDIaOWSa8rRPGarj2bFcrv3SKl/vTHMvDcKmz1hDVm/SNQ==
X-Gm-Gg: AYBFou0UTIvXaJQfu5MqjNgkGuZVdeiaB6NKIDTSWGAQCXvS/1Rd/vq/j/1Yn0I3BDy
	OJ5K1io5l+MqDcdyBgXUzGtU3Lv8Vdb1Uk7jFnufAh7TERoCYrshISpLWqeEF+wvJcfudWDyWEa
	NXIW5zfr1izdgUJm4gM+mMObIGsPQl5Sw07qe2i2Zc7qib3FaqBtpVsAUpC4qyCM824qS0bmIDm
	hxFBPBs3B+OG1ZEV7UWaocIckRbnnTibo+4bhn3cR3o9+onpuDDN0ZQsasg6UuYprkyOq69ygA+
	Kh8Ihx3WpbhUsJA71N9YJwsMYJF30Jyxfx2NYyLLy4dEJfWfeDUaws/3OV2GPIVcWtCQxJhXp2T
	wTgprvf1OPbq45hpcyXTaO6pSj/m4ofEPCk7hFXNH2WCQ2CNFimfzm6eK6FKbzkBXpJfXLwncXA
	TK3V6RRHHgxPpTAo+26ZB5Mi5DQ9d+ySAPLs6HZ1MieVXzzoHEFEG9MZTYiZxVsJ7EVqnolmm+8
	cZUwRWSHxsmYr1eayZvrFS47utdJxZ4kevISmZqgetIeLFsp7bYacpxFH/9Q9LrT5fm7AN2McqK
	xH3sVMMnF/60rFv0uN/HVcsVByvamtc2A721zmRO9baGOyZDWAYgnPKfCeThiqp0HJSmo9KkM1T
	0pd50Y6MhVnqjoZecBSvGgtlZ0wZ5b8Hlp05Y6oqbLZNKnG9rg38CbvExHRL19Ok1wKmgCRy2l6
	E1rjdgssigokqUmhy99tE+zsSAfpiNAaRMNq36DfwsjOYyDF9H7yWzJFDcgIDTlASE2QMgP+aHZ
	WqiJqo867Zl4cpYUjCNsFkW42BGqnTWFNuPKxSzIcHZzpDbwSzlI4riZ2rOWIQRnu/VyuFjs/FJ
	WuFoRMNHQS3R3kJiI1Z7LpXAFMLdnOea6WuETc3p
X-Received: by 2002:a17:907:3e9b:b0:c2d:bd87:7fa7 with SMTP id a640c23a62f3a-c4ca7a88866mr599588666b.24.1793551566094;
        Sun, 01 Nov 2026 08:46:06 -0800 (PST)
Received: from Desktop (p54aff790.dip0.t-ipconnect.de. [84.175.247.144])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c4cabcfd254sm296928266b.29.2026.11.01.08.46.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 01 Nov 2026 08:46:05 -0800 (PST)
From: Julius Bairaktaris <julius@bairaktaris.de>
To: netdev@vger.kernel.org
Cc: davem@davemloft.net,
	edumazet@kernel.org,
	kuba@kernel.org,
	pabeni@redhat.com,
	horms@kernel.org,
	dsahern@kernel.org,
	idosch@nvidia.com,
	richardbgobert@gmail.com,
	willemb@google.com,
	ecree.xilinx@gmail.com,
	daniel@iogearbox.net,
	john.fastabend@gmail.com,
	sdf@fomichev.me,
	martin.lau@linux.dev,
	ast@kernel.org,
	andrii@kernel.org,
	eddyz87@gmail.com,
	memxor@gmail.com,
	song@kernel.org,
	yonghong.song@linux.dev,
	jolsa@kernel.org,
	emil@etsalapatis.com,
	ihor.solodrai@linux.dev,
	shuah@kernel.org,
	bpf@vger.kernel.org,
	linux-kselftest@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH net 0/2] net: keep the TCP fixed-ID flags on the header they describe
Date: Sun,  1 Nov 2026 17:46:02 +0100
Message-ID: <cover.1792857378.git.julius@bairaktaris.de>
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

GRO sets SKB_GSO_TCP_FIXEDID for the outer IPv4 header of a TCP packet
whose IDs do not change, and SKB_GSO_TCP_FIXEDID_INNER for the inner
header of an encapsulated one, since commit 3271f19bf7b9 ("net: gso:
restore ids of outer ip headers correctly"). Encapsulation,
decapsulation and the GRE and UDP tunnel segmentation paths do not keep
the flags on the header they describe, so a TCP stream that GRO merged
and that crosses a tunnel boundary is segmented with the fixed-ID state
of the wrong header. Sashiko found this in review of an ipmr series:
https://lore.kernel.org/netdev/cover.1792293419.git.julius@bairaktaris.de/

Patch 1 moves the flag on encapsulation and decapsulation and keeps the
encapsulation level below GRE and UDP tunnels. The three changes are one
patch because each alone loses fixed IDs in a case that works today.
Patch 2 adds a selftest.

Tested in QEMU (KASAN) with the selftest, 17 cases, 400 segments each:
- net (7076f684d513): 5 cases fail: fixed inner IDs incremented after
  IPIP over IPv4 and IPv6 (40 distinct inner IDs), outer IDs repeated
  after GRE and VXLAN over IPv4 (10 distinct outer IDs for 400
  segments), and a VXLAN stream with fixed outer IDs whose outer state
  survives decapsulation into IPIP. The same 5 failed in 3 runs of an
  earlier version of the test.
- this series: 17 of 17 pass, 3 of 3 runs.
- with only the decapsulation part, or only the encapsulation and
  segmentation parts: 8 and 5 cases fail, among them every
  encapsulation followed by decapsulation without segmentation, which
  passes on net.
- fou_gre_gro.sh and bareudp.sh pass on net and with the series;
  gre_gso.sh and udpgro_fwd.sh (3 paired runs) show the same failures
  on both, which come from the slow emulated machine.

I used Claude (Anthropic) to help write these patches.

Julius Bairaktaris (2):
  net: keep the TCP fixed-ID flags on the header they describe
  selftests: net: check TCP IP IDs across tunnels after GRO and GSO

 include/linux/skbuff.h                     |  30 ++
 include/net/ip_tunnels.h                   |   2 +
 net/core/filter.c                          |  11 +-
 net/core/lwt_bpf.c                         |   1 +
 net/ipv4/gre_offload.c                     |   1 -
 net/ipv4/ip_tunnel_core.c                  |   5 +-
 net/ipv4/udp_offload.c                     |   1 -
 net/ipv6/exthdrs.c                         |  11 +-
 tools/testing/selftests/net/.gitignore     |   1 +
 tools/testing/selftests/net/Makefile       |   2 +
 tools/testing/selftests/net/tcp_fixedid.c  | 396 +++++++++++++++++++++
 tools/testing/selftests/net/tcp_fixedid.sh | 291 +++++++++++++++
 12 files changed, 744 insertions(+), 8 deletions(-)
 create mode 100644 tools/testing/selftests/net/tcp_fixedid.c
 create mode 100755 tools/testing/selftests/net/tcp_fixedid.sh


base-commit: cb284914e749388eef402938bdb3115fe1f6d337
-- 
2.53.0

