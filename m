Received: from mail-pf1-f181.google.com (mail-pf1-f181.google.com [209.85.210.181])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 327F53E3146
	for <linux-kselftest@vger.kernel.org>; Mon,  4 May 2026 16:30:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.181
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777912222; cv=none; b=msNdtr1PJeZq81rbRpTYyPfMVY5QK7gDbevEG9QUvZDK6S9YRFnIUbqKIUV8oRSdmL1UhS2a6IyNUyvL2pwSL+d0tZbEKzQkXChV92sfdjO9WZG6vqV99ElkYwAGI6K3XpSmSbNIsplsz+iZ6QYwT2ZmzeP5RPXF5oQGOr+16Ds=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777912222; c=relaxed/simple;
	bh=t/WDX834jlVF7DP9Ia8VfOzsGAXwCxpfBKZASbwEbQI=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=qLRoINLRE/lI8fuS2ziSO0y5cKPgVZ0rPcAnfSRDgpIsVLc/IYjar25GQZ8du0w/4ZMZxayj1saq09vyqsfD9mVQ6HsY4NWYHWFg9dRzQCDiLf42TAha8Blw20MXxkfKNKyuKFWNAXZf+sd8TTQPsdO5iGzegyS5VVhwi7fyWqw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=dqp/CT2o; arc=none smtp.client-ip=209.85.210.181
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="dqp/CT2o"
Received: by mail-pf1-f181.google.com with SMTP id d2e1a72fcca58-82f8bf96b46so1939385b3a.2
        for <linux-kselftest@vger.kernel.org>; Mon, 04 May 2026 09:30:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1777912218; x=1778517018; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:from:to:cc:subject:date:message-id:reply-to;
        bh=3qM+FJU1H6+E/i7TldQkDydNXf9wDxrZlqG3KlzPKhQ=;
        b=dqp/CT2oVY/cprtvk0NRc4TNsmnl6ojCgqBHJxBkXedqee7k5lUTf9I8F4DGHNAYZo
         vRcJyMGqATpYngx+p6gnjPggxMFlD+ckIAoL5BeXB1z5WQRw1rvOiGNwvXpxO0YLXSh4
         jqI+8vvJSK2zmgNG0BJT4rCtCYmCtxuvvhbhwxbAXlKfpHoYvsoWY9O1IXhxE8pYzFXJ
         o7VzgdOu393T+zXVAlNOETDfqlnfARVtIcsGkiWUlex81kLzokZcpW0SlVHOxM4+5dZX
         MlhTMhic/S8ImWFOjhU4k5VE0CBrtJG9I+dXDcbG/kJ0pZBmCtdVMy/gIe/NvKrLFYKw
         kc7g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777912218; x=1778517018;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=3qM+FJU1H6+E/i7TldQkDydNXf9wDxrZlqG3KlzPKhQ=;
        b=dIwNHnu43GfAzSPshWBFXq36hhugZ+EdeajijQNHe8xuAVUUTlt/eRPuJTqyMwIFK7
         g/Y2g2qyGOpgX+BGqhY9jFDVUtUo9bX+ErjRGxTUqXEA92KdGUWSR/nAP5RFCMP5rhdd
         Ysvi1CAs+Xqo5yZ6XwxxAcbiKfMXQPod2oTd8Sudko2xrm7OMiWaRgD9CO33htWfCNsv
         PfqxbU65veU4ZBO/4TV1DEyJuWG1tmeGwH1xZUueV9Lw29PiyyDEgNBIRYPnu8rN/x9v
         f0zC6MyqdPtGgWXz+Da2oamQhfIvTyjT8dLQyjYuz3iBsFBC7cDqsSYHOHoqJpirtc31
         IlxQ==
X-Forwarded-Encrypted: i=1; AFNElJ8OnwIaIexADIaj1CNtVxm4XORVX2NslYXzS0hBUhYm2wZUNN+mKoIHLPfZzU3vfkQ5cW7NOK292b6po9w1Hfc=@vger.kernel.org
X-Gm-Message-State: AOJu0Yyr9ltz2V/DO18m1LxLAZV4DgzHn904FmXRIHBsffPVK0yTMH3G
	lJlsvfpFYos5imExmqZkJBu8r/QaysZBqgRoJaIIfr9c7II31zrTdihJ
X-Gm-Gg: AeBDieuLBzRa5HMsuVlT/rcIaWuku7QuiJ54FIoHVJiENMJ1G0P7fyKAylPQuxpHc5c
	fIVl+n5/Pg/nq7gLDi1XpY+bLeQ8oOOc/pyJXt53k3gF7tvsR+3U2eysE7ImKGIK5Rkb0/MV/pB
	DxT+s85fgPo3OluE3FIm9KVnznXJtKFxqvYRSuhG0Oh+WPc0X/JpCNgTbqSEErcKclz2gKF6P+N
	aWJdTTCEgTOGMbwtVQjrdddJ02a/diG1M/1VGdZK4VUyQqDmFwdXTKOX7iJ6DjIyBIYcz+XMqk3
	jvUKOjgltJ816qn8wqIKV+95ZZkeppdtEiUOGbbVub37+Ax3pPNNT/ZWpyDMWrkYYxNBAzQGYCZ
	ob5S+c3tQR5tuXInHrtbYTyPAIcbQTHIPDMyb2n1kwk66/bXSmxEZWsegr55mALXtvN3SHcmazA
	5PpADcje//v831vKuPl9rcHXfeqIDrkMGcYDSgYt3cxoVj
X-Received: by 2002:a05:6a00:1826:b0:82c:9f7e:518c with SMTP id d2e1a72fcca58-8352d2029a7mr11070469b3a.25.1777912217603;
        Mon, 04 May 2026 09:30:17 -0700 (PDT)
Received: from [163.43.103.131] ([163.43.103.131])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-837081abadfsm4998663b3a.42.2026.05.04.09.30.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 04 May 2026 09:30:16 -0700 (PDT)
From: Yuya Kusakabe <yuya.kusakabe@gmail.com>
Subject: [PATCH v2 0/7] seg6: add SRv6 Mobile User Plane (RFC 9433)
 behaviors
Date: Tue, 05 May 2026 01:30:10 +0900
Message-Id: <20260505-seg6-mobile-v2-0-9e8022bdfdb6@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAJLJ+GkC/02NQQ6CMBREr0L+2pq2sQVdeQ/DotQPfAOUtNBoC
 He3xY3JbF4y82aDgJ4wwK3YwGOkQG5KIE8F2N5MHTJ6JgbJpeaKX1jATrPRNTQga8sKZSVRC2U
 hLWaPLb0P26P+cVibF9olK3Kjp7A4/znuosi9P7OPybzOLIoczpAbXV6FKpVt7t1oaDhbN0K97
 /sXNrrPNLgAAAA=
X-Change-ID: 20260504-seg6-mobile-f78e282e615c
To: "David S. Miller" <davem@davemloft.net>, 
 Eric Dumazet <edumazet@google.com>, Jakub Kicinski <kuba@kernel.org>, 
 Paolo Abeni <pabeni@redhat.com>, Simon Horman <horms@kernel.org>, 
 Andrea Mayer <andrea.mayer@uniroma2.it>, Shuah Khan <shuah@kernel.org>, 
 Jonathan Corbet <corbet@lwn.net>, Shuah Khan <skhan@linuxfoundation.org>
Cc: linux-kernel@vger.kernel.org, netdev@vger.kernel.org, 
 linux-kselftest@vger.kernel.org, linux-doc@vger.kernel.org, 
 Yuya Kusakabe <yuya.kusakabe@gmail.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=4494;
 i=yuya.kusakabe@gmail.com; h=from:subject:message-id;
 bh=t/WDX834jlVF7DP9Ia8VfOzsGAXwCxpfBKZASbwEbQI=;
 b=owEBbQKS/ZANAwAIASrX0XUqXRtNAcsmYgBp+MmUQ4uOSFqsLABgLmDA8N1QVqzEsjuuzcydr
 OUus2wHYGSJAjMEAAEIAB0WIQTaB7usAfxNKMeqa6Yq19F1Kl0bTQUCafjJlAAKCRAq19F1Kl0b
 Td83D/9GDmmQ/cP9O1v5vS9LMuoKdTKQR+f0681wFU1mdnXDZ06hGhkVw1X4bAxCXfNcVN7dtVX
 H/d3CLCYXEf69WAKByDWhE32nRCiEu+YhfT1J/8DxHQrrIC5UBfG3V3tLSHRhk1Pwu8gfY97/sT
 J+0hhla376kMaRymSW28ZzV0qEd3euKLipVgYakvf9NPZVgFy54NTdjLRoL+enROqSx1Ge4Xt02
 frxwNRaPNcvUL2PpZ1eRTRVeaudwRKm0Rv+0WK3P/FvpZnpbUPLidt+3LcjVLaNRTigCqXStCmA
 vQq5SVYv3+i1OBNvSKUs3CtvEmvD6nndY92/z20OErmG/r10QlYJro5+iOs3b9MeuQKaOoO0dfE
 wsKUps2XJK/j+SBUKGHCibJ/XkiVQMMBsXe30NPRrmIMo0KNuf4AYcjDWhIeIHvj+OCp1nPhjum
 vDZLGtqOnE/UtmarlQx9pFzJrlyP3T9NmcPhT8Xm4bp3qsTF4e1Htr5iJaOmHDvuuoVwM75uFSp
 vUY2fJv6WD09narTNivy8rG7RsGe5douEBRiW/jd0ykyD/bgEBMBFnl0gbO6mlahIy4VUQptPMV
 5B9jP4de03ndLKS80KD9kv2HSPbluxsyCDm7WJV22/kWe3F2jpu6WVbaRivkFzeAztPRNH8mkJ+
 ZJ4APW8Grq+4LWg==
X-Developer-Key: i=yuya.kusakabe@gmail.com; a=openpgp;
 fpr=DA07BBAC01FC4D28C7AA6BA62AD7D1752A5D1B4D

This series adds the in-kernel data path for the SRv6 Mobile User
Plane (MUP) architecture defined in RFC 9433.  SRv6 MUP integrates
GTP-U mobile traffic into an SRv6 transport domain by mapping the
5-tuple (TEID, QFI, R, U, PDU Session ID) into a single SID, allowing
operators to replace the GTP-U overlay between the gNB and the
upstream UPF with native SRv6 forwarding while keeping the radio side
unchanged.

The series implements the six MUP behaviors that an SRv6 MUP gateway
typically needs:

  End.MAP         (RFC 9433 Section 6.2) -- swap DA with the next SID
                                            without consuming the SRH
  End.M.GTP6.D    (Section 6.3) -- IPv6/GTP-U to SRv6 headend encap
  End.M.GTP6.D.Di (Section 6.4) -- drop-in mode variant of the above
                                   (preserves the original outer DA at
                                   SRH[0] and discards TEID/QFI)
  End.M.GTP6.E    (Section 6.5) -- SRv6 to IPv6/GTP-U egress encap
  End.M.GTP4.E    (Section 6.6) -- SRv6 to IPv4/GTP-U egress encap
  H.M.GTP4.D      (Section 6.7) -- IPv4/GTP-U to SRv6 headend encap

End.Limit (RFC 9433 Section 6.8) is intentionally out of scope.

All behaviors plug into the existing seg6_local lwtunnel framework, so
they are configurable through the standard "ip route ... encap
seg6local action ..." interface.  No new netlink families are
introduced -- the new SEG6_LOCAL_MOBILE_* attributes extend
SEG6_LOCAL_MAX in an add-only way, and the new SEG6_LOCAL_ACTION_*
values are appended.

The egress behaviors (End.M.GTP4.E and End.M.GTP6.E) accept an
optional per-route pdu_type attribute that is the sole control
for inserting the GTP-U PDU Session Container (3GPP TS 38.415 Section
5.5.2).  When pdu_type is set (dl/ul/0..15), every emitted GTP-U
packet carries the container with that PDU Type and the QFI extracted
from Args.Mob.Session.  When pdu_type is unset, the egress emits
a short GTPv1-U header with no container.  pdu_type must be
configured on egress routes serving 5G N3 traffic; omitting it is
intended only for LTE-only / S1-U-style deployments where no PDU
Session Container is exchanged.

The matching iproute2 patch series has been posted to iproute2-next:
https://lore.kernel.org/netdev/20260505-seg6-mobile-v2-0-93291b7b0134@gmail.com/

Link: https://www.rfc-editor.org/rfc/rfc9433

Signed-off-by: Yuya Kusakabe <yuya.kusakabe@gmail.com>
---
Changes in v2 (all reported by netdev CI, except the End.MAP one
which was caught while reviewing v1):
- patch 1 (End.MAP): drop the explicit hop_limit decrement and
  the hop_limit <= 1 ICMPv6 Time Exceeded check; ip6_forward()
  on the way out already does both, so the explicit ones caused
  a double decrement (verified hlim=64 -> 62 instead of 63).
  Now consistent with End / End.X / End.M.GTP*.
- patch 3 (End.M.GTP6.E): add missing #include
  <net/ip6_checksum.h> to fix clang / allmodconfig build.
- selftests: silence shellcheck false positives (SC2034/SC2154)
  and sort TEST_PROGS entries alphabetically.
- Link to v1: https://lore.kernel.org/netdev/20260504-srv6-mup-v1-v1-0-e0a6791575cb@gmail.com

---
Yuya Kusakabe (7):
      seg6: add End.MAP behavior
      seg6: add End.M.GTP4.E behavior
      seg6: add End.M.GTP6.E behavior
      seg6: add End.M.GTP6.D behavior
      seg6: add End.M.GTP6.D.Di behavior
      seg6: add H.M.GTP4.D behavior
      Documentation: networking: add seg6_mobile guide

 Documentation/networking/index.rst                 |    1 +
 Documentation/networking/seg6_mobile.rst           |  236 ++
 include/net/dropreason-core.h                      |   40 +
 include/uapi/linux/seg6_local.h                    |   17 +
 net/ipv6/seg6_local.c                              | 2660 ++++++++++++++++++--
 tools/testing/selftests/net/Makefile               |    6 +
 .../selftests/net/srv6_end_m_gtp4_e_test.sh        |  486 ++++
 .../selftests/net/srv6_end_m_gtp6_d_di_test.sh     |  427 ++++
 .../selftests/net/srv6_end_m_gtp6_d_test.sh        |  497 ++++
 .../selftests/net/srv6_end_m_gtp6_e_test.sh        |  402 +++
 tools/testing/selftests/net/srv6_end_map_test.sh   |  103 +
 .../testing/selftests/net/srv6_h_m_gtp4_d_test.sh  |  487 ++++
 12 files changed, 5155 insertions(+), 207 deletions(-)
---
base-commit: 98878ed91b68a3150126fccef125ee7b1bb86ab2
change-id: 20260504-seg6-mobile-f78e282e615c

Best regards,
--  
Yuya Kusakabe <yuya.kusakabe@gmail.com>

