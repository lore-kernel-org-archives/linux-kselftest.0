Received: from mail-pj2-f13.google.com (mail-pj2-f13.google.com [74.125.227.141])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2BA8F493635
	for <linux-kselftest@vger.kernel.org>; Wed, 16 Sep 2026 21:38:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.227.141
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789594721; cv=none; b=RZI5Dbe6u1AKyu6p7/i7TG5l9S5yDj0oaAnmbj3WCyXuqzdWZlye+6Vu50UZ2WBAYyzHtokaYFg5NQ25+C3nrDC7UC02M2MJNBL8iLRD8pqzfok5OP01PYgtgBMp4Wmjc4kHB0zwjmgty/v0Fcq5vgm9scDIZwF8y8mbfZtSCwY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789594721; c=relaxed/simple;
	bh=1V7NAVhDtdqfQFve7uz10cEy94SG92SANc77UF7mCsE=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=r99YoE4t9Esf2IsyF+SY/ZKq9gmqp06br2rEiixkZV7bGmaSgT8WrfyEJK2PIIfrorz64YaY0aAsyHHxc87y7lURznPUdLay3Qkl4/NWrglXIeyAN68SLm8I4wP32+loK7VrxpiEi5oqGLLnolJ/ulNDLBIvOfRwBH3Ys1rGCaA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=EhwYfTIs; arc=none smtp.client-ip=74.125.227.141
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="EhwYfTIs"
Received: by mail-pj2-f13.google.com with SMTP id 98e67ed59e1d1-398a147688bso142997a91.1
        for <linux-kselftest@vger.kernel.org>; Wed, 16 Sep 2026 14:38:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789594697; x=1790199497; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=8b7NmZ7yoxdeKfo/UCXE/FVCiKRGZaH7RDhem89BcjA=;
        b=EhwYfTIsUsrUmQo3YUCeBuAc1ztxy72XlbzWnMfoTQ7V6YILnFkBKjnX8n2M8lY0Rc
         NOI61kKKjjcjS2XKqzmrbiuT+6X/smSukQspcjrYiqXsdJgRNDWB49oz1UyZU++y8Dbg
         gEPkxj5WTb1Dc7DODjwZKCyWbbUQ1n71nlj4J/cTSDKpLE3yFqs2OXZ9E2HHUE2u1Vrg
         NgS/BIoj07ONGhZQE+07xO8MrSn7QCNQlaMo5NvWeMABzMouGX+8QnlFlaYgUYICtIot
         8m9McIDEaHiFuLCXZGBqLcR05UJKPJSOv+Q0oziGBI4r/ZeV3i8K3VEhMZ1ua7MbBwNi
         dHUQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789594697; x=1790199497;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=8b7NmZ7yoxdeKfo/UCXE/FVCiKRGZaH7RDhem89BcjA=;
        b=zIaxN30clQKF67pvt2i/CW1rZSKjL59VxnDmFWNoqDnGOYLGHS+NMl4q+RELWDXsh+
         rRdBYHerPAT2cm4CYCIe03Jzs+Vl3zAhsC2PFTXNfKz4Oypn4XgkKPpez/sNJ1NvoHfr
         TocUBzI5ZW+TnhLTEeUNGZhZF5na+QDQHCEcYH2+6/NILnuCMwjDlz79cFDI4poZ9EPD
         /yDvYZ+tmoa3FM69lvmmAFzxoEspbnMMEjXm8DDgrHl93eaRvv7pB7xA6CSiPk3eQRjS
         +Yh9bjaGAlHA3gfwxh7tFA258AimiDl8El/4BYXheMH3k9N2AwCpbTO41IKClV4tiAZf
         8yAw==
X-Forwarded-Encrypted: i=1; AKwUvByNOsD1blzqVNB3HM49bF5sA7oFNI+fMtaqidjNXnr81HbjogYMLxYDvwT6yOynrMo3cKJPHXHEBI7V8Dqn4gI=@vger.kernel.org
X-Gm-Message-State: AFuF++k3KM66fJfCWQlKbMNcY9zSg0UzOt7u9F/TU2amC5ewV+3/qVbM
	nclHDbwfkpCDyFX7Xv4/tjigSB0WO0XWvQorRxce1l0n1N6n9wcZkRoB
X-Gm-Gg: AYBFou2u0aC6Se6L+EDCmxMCOiOr9eQY8AOw97ABpFWYmXnRaGaoKkohko23lTK076k
	dfxy5gRM7V5ltW0bneANzgkCocRSOPFZS/bGBXA8co2viQVE9vTE6JKfh/Vd2pC6B2z4QZD7fRi
	PkCoofjXK5jJx6tG7vVKOJ5XuAJfA47runQaYLhLAS4mkBst4/TnxGX7gxmP8PMLbS6gR8SmC9a
	6uiFYIDPopJOOa+7fj7dkPMwOiKikmt8QgE9RR8cpL65ol6WMXQ3o922KpjemU1SmMKPQ9GRyON
	pcfSIFpSvuqNC49VIDsNR8Bz2K9R3+wKp+1h60bGU4l15l5jX5Zb99AwuxuKLjzsM82ImwMJ0rn
	0/ZtLy0BsWRlKcYcq16Mhf7oYyyUZmrNDtwV6j+VAP9DNcpOD5sr9QweW3BDqQ5HXjQJQM4Xst5
	3fdnZYKcke6vk2XMXETWobC/mdGsOHdMKpv/qlMWdQqXmlG18pBkVz1mm/1N6aRfAA+ElzYfVOi
	ZAMeRQq6w==
X-Received: by 2002:a17:90b:33c9:b0:39e:1bff:b383 with SMTP id 98e67ed59e1d1-39e1e51bdf8mr9529767a91.24.1789594697296;
        Wed, 16 Sep 2026 14:38:17 -0700 (PDT)
Received: from [163.43.103.131] ([163.43.103.131])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-39e35d9f81asm1379913a91.3.2026.09.16.14.38.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 16 Sep 2026 14:38:16 -0700 (PDT)
From: Yuya Kusakabe <yuya.kusakabe@gmail.com>
Subject: [PATCH RFC net-next v3 0/2] seg6: add support for the SRv6 End.MAP
 behavior
Date: Thu, 17 Sep 2026 06:38:11 +0900
Message-Id: <20260917-seg6-mobile-end-map-v3-0-9890a60ac6a7@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAEMMq2oC/22OMQ7CMAxFr4IyYxSnJSVMSEgcgBUxNKkpQTRFT
 YmKqt6dNAwwMH7b/z2PzFNnybPtYmQdBett62LIlgtmrqWrCWwVMxNcSL4WGXiqJTSttncCchU
 05QOUISNyVLjBgsXmo6OLHRL1xI6H/Txz1IOjoWfnz4F/6huZfmbP66v1fdu90h8BUzEpC+R/l
 QGBg1KauKjkBvNsVzelva9M2yRDEF+G4vifISIDpVD6YlBK0r+MaZrep6G7Hh0BAAA=
X-Change-ID: 20260523-seg6-mobile-end-map-9cec24191817
To: Andrea Mayer <andrea.mayer@uniroma2.it>, 
 Andrea Mayer <andrea@common-net.org>, 
 "David S. Miller" <davem@davemloft.net>, Eric Dumazet <edumazet@google.com>, 
 Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, 
 Simon Horman <horms@kernel.org>, David Ahern <dsahern@kernel.org>, 
 Ido Schimmel <idosch@nvidia.com>, Shuah Khan <shuah@kernel.org>
Cc: Justin Iurman <justin.iurman@gmail.com>, 
 Florian Westphal <fw@strlen.de>, 
 Fernando Fernandez Mancera <fmancera@suse.de>, linux-kernel@vger.kernel.org, 
 netdev@vger.kernel.org, linux-kselftest@vger.kernel.org, 
 Yuya Kusakabe <yuya.kusakabe@gmail.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=4019;
 i=yuya.kusakabe@gmail.com; h=from:subject:message-id;
 bh=1V7NAVhDtdqfQFve7uz10cEy94SG92SANc77UF7mCsE=;
 b=owEBbQKS/ZANAwAIASrX0XUqXRtNAcsmYgBqqwxELTmJz2ms0DOECTQHhPqlyRBZDfdvxB1ic
 F4bv24nMvmJAjMEAAEIAB0WIQTaB7usAfxNKMeqa6Yq19F1Kl0bTQUCaqsMRAAKCRAq19F1Kl0b
 TcUsD/9wXFp+TUEYjZXodCo3uWdvpU1kf6wfPSZIYESbrnL/oxsgwh1rp0hMeIX9z5o4/TDut3m
 wG9Kgog3LBoKj5Lmz/fFFsVsVM/ExSu2Y43sFqD5InkgTYmQ5TJzO05yGCbq9S0krV6ElAt8wBA
 D/8Ps8kfMDyfWDxYmKr8f+Swk6uYXJWRZYL1A8FAKly9vZao0H4j9T0QIABDjqnqsJ7QCuy7oQ5
 VTcDxDZwFELPeQlh+rnsYZyHZJHJy9QSEByjwOdhgydTzsmYtMeFInoo1RMAgYpAm8yeeFDYhHJ
 cPF1KMlGMdIGtXwkDFjbZT4ec2JytFqkNsMnYas7mEfCOq0+zNG6CXNm6aW2tkWZP0LwH5tn4jx
 lyBQeHzzbr2MwElJwBq7537pFuImZLg3YXwwekFSSoosGEsFP2iIrG57sq4E74j6mxpQs8ZuVqC
 Om9IPY2WJP1SvYdQkYJxCK8w1uLF+hWgokywudmyo930QRt1KCK50ZDKF4FXU6bhMkMWL3fAJdd
 zguXS3+jP4tpIEFwLq+qauVa3rYe8r3MFBQSSDys30tk8MHh+xskbAeaMVxUEHGW+f5Zi2AQOWG
 9oEkoVKwEHLXE/3kOINM7KznxxZPuMBd6D6wyGopXEWHSjboy6NahOGZFnq5+SEpeKej70ib1Xs
 sG5HD0cgijmR0Kg==
X-Developer-Key: i=yuya.kusakabe@gmail.com; a=openpgp;
 fpr=DA07BBAC01FC4D28C7AA6BA62AD7D1752A5D1B4D

End.MAP is the simplest of the SRv6 Mobile User Plane (RFC 9433)
behaviors: it replaces the IPv6 destination address with the
configured mapped SID and forwards via the IPv6 FIB without consuming
the SRH.  This series is the first per-behavior rebuild of the SRv6
Mobile User Plane v2 submission [1], split one series per behavior
following upstream review.

Because End.MAP is the first behavior to land, this series also
introduces the SRv6 Mobile User Plane lwtunnel framework that the
subsequent per-behavior series plug into:

  * a new LWTUNNEL_ENCAP_SEG6_MOBILE encap type with a
    CONFIG_IPV6_SEG6_MOBILE build option,
  * net/ipv6/seg6_mobile.c, which hosts the action dispatch table,
  * include/uapi/linux/seg6_mobile.h, a dedicated SEG6_MOBILE_*
    attribute namespace, so that attributes whose semantics differ
    between the mobility behaviors and the RFC 8986 behaviors do
    not overload the SEG6_LOCAL_* table.

This layout follows the discussion on the v2 thread; feedback on it
from the lwtunnel maintainers is particularly welcome.  Per the same
discussion, netfilter hook integration, VRF support and SRv6-specific
drop reasons are left out of this initial series and will be
revisited separately.

The LLM review of v2 flagged that seg6_hmac_validate_skb() reads the
SRH from skb_transport_header(), which on this path still points at
the first extension header.  seg6_local.c reaches the helper the same
way, so End.MAP inherits the behavior rather than introducing it; a
fix, if wanted, belongs outside this series.

A matching iproute2 series adding the "seg6mobile" encap keyword
follows shortly after this posting, since the selftest needs it to
run.

[1] https://lore.kernel.org/netdev/20260505-seg6-mobile-v2-0-9e8022bdfdb6@gmail.com/

Signed-off-by: Yuya Kusakabe <yuya.kusakabe@gmail.com>
---
Changes in v3:
- Silence the shellcheck SC2154 reports for the namespace variables
  setup_ns assigns
- Fix the checkpatch alignment and __func__ reports in the selftest
  helper
- Link to v2: https://lore.kernel.org/r/20260901-seg6-mobile-end-map-v2-0-1629bfc166eb@gmail.com

Changes in v2:
- End.MAP: patch the L4 checksum also for an SRH with no segments
  left and for first fragments; selftest cases added for both.
- Use nla_parse_nested() for the nested attributes.
- Rework the selftest helper and cases; wait for counters instead of
  sampling them; add CONFIG_IPV6_SEG6_MOBILE to the selftests config.
- Rename the SEG6_MOBILE_NH6 attribute and the nh6 keyword to
  SEG6_MOBILE_MAPPED_SID/mapped_sid to match the RFC 9433 "mapped
  SID" wording and avoid clashing with the SEG6_LOCAL_NH6 nexthop
  semantics.
- Trim the Kconfig help; add Assisted-by tags.
- Link to v1: https://lore.kernel.org/r/20260710-seg6-mobile-end-map-v1-0-99be02d68143@gmail.com

---
Yuya Kusakabe (2):
      seg6: add support for the SRv6 End.MAP behavior
      selftests: seg6: add selftest for End.MAP behavior

 include/net/seg6.h                               |   8 +
 include/uapi/linux/lwtunnel.h                    |   1 +
 include/uapi/linux/seg6_mobile.h                 |  61 ++
 net/core/lwtunnel.c                              |   2 +
 net/ipv6/Kconfig                                 |  10 +
 net/ipv6/Makefile                                |   1 +
 net/ipv6/seg6.c                                  |   7 +
 net/ipv6/seg6_mobile.c                           | 701 +++++++++++++++++++++++
 tools/testing/selftests/net/.gitignore           |   1 +
 tools/testing/selftests/net/Makefile             |   2 +
 tools/testing/selftests/net/config               |   1 +
 tools/testing/selftests/net/srv6_end_map_test.sh | 400 +++++++++++++
 tools/testing/selftests/net/srv6_mobile_send.c   | 262 +++++++++
 13 files changed, 1457 insertions(+)
---
base-commit: 87b80c2f6b05cad9f0ff9136709c62a0f59923e3
change-id: 20260523-seg6-mobile-end-map-9cec24191817

Best regards,
--  
Yuya Kusakabe <yuya.kusakabe@gmail.com>

