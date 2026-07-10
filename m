Received: from mail-pj1-f45.google.com (mail-pj1-f45.google.com [209.85.216.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F0D75341ADF
	for <linux-kselftest@vger.kernel.org>; Fri, 10 Jul 2026 08:58:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783673902; cv=none; b=pc9xMhtHABV0E4elOR1c2koO8jVSEj6KDkdlWi8kMhUa4X2xxqdFSDI0Ff2WgDBVam5gxRCYTcZisJLXD7viwLpOAr2PQPG8pD8I4mPpquH3qPGqZQrQGkYhU0ekd2/Od9O2CEIP+V0pvsf4k60KSHSNY/KlIw4TD/gQr/3Q1mM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783673902; c=relaxed/simple;
	bh=x0PDnUbmbST57fVde3MCSNyBQGCvCEtUe+N9UTz3/aI=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=Z0QxY2rm446vvOAJ2U33r0cp+jvP9F65p9d5cDUZITMC97KMLL6EXcURpcUHTylHWasuQDTrlnTEnmv6lA1hkd9uezmcueg9H8gVRMdIOajMFgggJidYbfXld50yoL8ymAgIBXz+CK/9A3bYrirOuEJ2lMoVM+ALXI87t8G2yfY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=oq7emSAB; arc=none smtp.client-ip=209.85.216.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="oq7emSAB"
Received: by mail-pj1-f45.google.com with SMTP id 98e67ed59e1d1-3811e59df58so485240a91.1
        for <linux-kselftest@vger.kernel.org>; Fri, 10 Jul 2026 01:58:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1783673900; x=1784278700; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=SkRSQsv1PTfc+Fy5UiQqK3wcmODgXgxN9h+0UhNs/H8=;
        b=oq7emSAB72SF4RtUrwP0ekEjBP07hl1N5n7ZPnbkSedgcXb6K1Upv4+abbe5MZJnEt
         ka4Nu913MOwmHQTc5U8p0vWgHTcPq8b34jY0bWtnWOTLHgRy3DW+TmRlVqvhq0G7c4VQ
         JCXwxdqZCnyPhegL/nxfVgnVxpgscmWaqNBj4YEsA6V/Tge5bJD3JqKCBJNgWHC4dWmJ
         3M5n0gMOT0eQmZ/m29KDgJFGD7HmtaLQk/9OMkB3l3M6MSMZuX5m2DrgGpBNChe5HaBc
         4ykSAJiLsFpzB98mbemZyw5eQYAoFy2rQhHlFG+TISf4hI8zAPRBKipvz39FccPs6Ivg
         qxUw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783673900; x=1784278700;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=SkRSQsv1PTfc+Fy5UiQqK3wcmODgXgxN9h+0UhNs/H8=;
        b=rg+iIRrb/dKcYqj4woD2LJgGRF2BUOr5+LFl1Aj6hGiXEjnuqf3wsxDfsz6JKCi3Uf
         tzXo6wjQ3xUVT6A34V+z0fYdgBxu0XBoZi2uMTasWdg78v9xJBr58nvANTNDJIDfq9ag
         gicnINZbjvmdCMiMUbqP5QZ9bOFFnOjsKHo+vCVWz8WM+/fxxZCi28wCdiZa1/AQbguJ
         W01bvPXdslXSCugATk6OinKGieTHyGaRF/0sWF7rZLnH0x6PiKPbqkWExMvN8ulg167D
         77gFkrS4biotJ7/IjIaMGKcGnqyS9+6LWiyQLPp0FyvcaVkTI0tiIYkU3dWFk/59LbTi
         hazA==
X-Forwarded-Encrypted: i=1; AHgh+RoQyTKh55EPuXow65nAl3n64Fv3cF7c5C70MMsNpmwaE1jM46sjihITOr3Vv/BrcmYV0IhIEBwcx/40+cOMs10=@vger.kernel.org
X-Gm-Message-State: AOJu0Yy3i3snIGDvqymse64nxSQ2+jqhSnJGzJgAPLWMKUiK+AzkDVGr
	492M4R9I7WCZZqJRMyNDfKB3/9gzcxUIwfDJaeOGMfazG+wXevYPUWIs
X-Gm-Gg: AfdE7cn7rYs1IvsvZ12t8tPpxsJZXjVAKtKGYjLFEYsx0YSG/A5zq06M60+unmcec9l
	DhcBTX8xfHubRmDp0JnI4xT9v4kG3aR27jWLDt4oxhZOpymaFtNo2k95Yi2G3tYe/Y+znj6n0tR
	Z1l2Dqs/QoWUWTBhtqaciwolJW0P3sartYFPMdfuqylWhJwDqJrSpqK21/Z8C/Eh1CPVr539C5Y
	U06Vm/Er9bobGLywNLsGmNcnQt3ENM9nRTwB9Wrl4mQk0zE7GbtFz0u1CrqgbQo7KuVRdRTJq7t
	qEOHT3iasBjFzgoNfSoCd8gS6fM/INSjM49AwF4U1gIyzFXrezwCS+pgPI/p7P/IsatS8dstEwh
	fk+ifbPck/rxsJipddq44AM7OjaCIt8kJTCVeTAAGBDz8TBGM48jtm+uVMMF630qPXN/U9vqNOi
	RtFyKP0Ys/Dajcx8zCYNRxyudDwyKPmMI82Q==
X-Received: by 2002:a17:90b:384f:b0:37f:f4ae:5f25 with SMTP id 98e67ed59e1d1-38941ad3910mr9822608a91.20.1783673900201;
        Fri, 10 Jul 2026 01:58:20 -0700 (PDT)
Received: from [163.43.103.131] ([163.43.103.131])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2ccc9d3da55sm56674275ad.71.2026.07.10.01.58.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 10 Jul 2026 01:58:19 -0700 (PDT)
From: Yuya Kusakabe <yuya.kusakabe@gmail.com>
Subject: [PATCH RFC net-next 0/2] seg6: add support for the SRv6 End.MAP
 behavior
Date: Fri, 10 Jul 2026 17:58:15 +0900
Message-Id: <20260710-seg6-mobile-end-map-v1-0-99be02d68143@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIACe0UGoC/yWMQQ6CMBBFr0Jm7SS0KopbEg/g1riA8sUxMpC2G
 hLC3S26fD//vZkCvCDQKZvJ4yNBBk1gNhm5R60dWNrEZHNb5Hu75YCu4H5o5AWGttzXI5cOzu5
 MaY7mQMkcPe4y/apXupyrdVNEVkyRbv9DeDdPuLi2aVm+aEHcm4gAAAA=
X-Change-ID: 20260523-seg6-mobile-end-map-9cec24191817
To: Andrea Mayer <andrea.mayer@uniroma2.it>, 
 Andrea Mayer <andrea@common-net.org>, 
 "David S. Miller" <davem@davemloft.net>, Eric Dumazet <edumazet@google.com>, 
 Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, 
 Simon Horman <horms@kernel.org>, David Ahern <dsahern@kernel.org>, 
 Ido Schimmel <idosch@nvidia.com>, Shuah Khan <shuah@kernel.org>
Cc: linux-kernel@vger.kernel.org, netdev@vger.kernel.org, 
 linux-kselftest@vger.kernel.org, Yuya Kusakabe <yuya.kusakabe@gmail.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=2679;
 i=yuya.kusakabe@gmail.com; h=from:subject:message-id;
 bh=x0PDnUbmbST57fVde3MCSNyBQGCvCEtUe+N9UTz3/aI=;
 b=owEBbQKS/ZANAwAIASrX0XUqXRtNAcsmYgBqULQoLc2xzwmtsRFIir7X9o6cANVW2zLbMLZ19
 os0VH2gqBSJAjMEAAEIAB0WIQTaB7usAfxNKMeqa6Yq19F1Kl0bTQUCalC0KAAKCRAq19F1Kl0b
 TSXtD/9qGpo2LcqrxjsF3CCZ3ud3qNABK7BhCMZmtgPn5sa6AxNXBZKgYNQvGS3DwJ2+N3mfyuS
 8l931d7zS5KvIwIeSdROJQhwjeyFtqSyMT8Dk2jVa9dgQy0etvU+fo99+HxKadYYP6YNSJAZdq3
 ekVdZWXEMpsj4etE5X1PXDtKKFaAdgpSQGkhvEGi3PzAFu9AMt0O5K8mCpOZDb42XoTaHdrZL4x
 0Po0yvu3/1TGQo1JKnld2O2PNBxROMcZMjVy7o4Ku43aV67GZZ1nylmRo/8euQgzv6mH+hKJYIY
 ErE15/DOtn6GxOTSzAvE1swJRo7mpmkO8P8CliPXCU9POdCnATxIjFqsEVxtCFFNplXlZvh+RMF
 IWzc6SW6Ulda/Sum7WxNpMN81kaOXstRziRvt/fOmUl6AxHN2f4U7YDdZq/wChJBjhbrRDioCeT
 c3Nz9lZTqMZJ0WtcOtpE9vS7VkrtwOLpn1epclGl1wBLd1uoICV6WsC+yIAb/YJjvTPNH3Vw1Jt
 QqGuze1GpdITuzVa/U1S5agT6g51PwKuhKElrBxxIzchDJkrghP9LTREqDU1PwWj8nhsVCJh70l
 7J7VIlJ138qr/k2504STgMl4zDwj8fvZqhes7Py2tyKkfbtuwg18x65d14MONNC9qxIUg82POqS
 O5ozTETgGkHarRQ==
X-Developer-Key: i=yuya.kusakabe@gmail.com; a=openpgp;
 fpr=DA07BBAC01FC4D28C7AA6BA62AD7D1752A5D1B4D

End.MAP is the simplest of the SRv6 Mobile User Plane (RFC 9433)
behaviors: it replaces the outer IPv6 destination address with a
configured next SID and forwards via the IPv6 FIB without consuming
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

This layout follows the discussion on the v2 thread.  The encap type
and the attribute namespace are UAPI that cannot be reduced once
merged, so feedback on this direction from the lwtunnel side is
particularly welcome.  Per the same discussion, netfilter hook
integration, VRF support and SRv6-specific drop reasons are left out
of this initial series and will be revisited separately.

A matching iproute2 series adding the "seg6mobile" encap keyword
follows shortly after this posting, since the selftest needs it to
run.

[1] https://lore.kernel.org/netdev/20260505-seg6-mobile-v2-0-9e8022bdfdb6@gmail.com/

Signed-off-by: Yuya Kusakabe <yuya.kusakabe@gmail.com>
---
Yuya Kusakabe (2):
      seg6: add support for the SRv6 End.MAP behavior
      selftests: seg6: add selftest for End.MAP behavior

 include/net/seg6.h                               |   8 +
 include/uapi/linux/lwtunnel.h                    |   1 +
 include/uapi/linux/seg6_mobile.h                 |  58 ++
 net/core/lwtunnel.c                              |   2 +
 net/ipv6/Kconfig                                 |  12 +
 net/ipv6/Makefile                                |   1 +
 net/ipv6/seg6.c                                  |   7 +
 net/ipv6/seg6_mobile.c                           | 725 +++++++++++++++++++++++
 tools/testing/selftests/net/Makefile             |   2 +
 tools/testing/selftests/net/srv6_end_map_test.sh | 360 +++++++++++
 tools/testing/selftests/net/srv6_mobile_send.c   | 139 +++++
 11 files changed, 1315 insertions(+)
---
base-commit: 08030ddb87b4c6c6a2c03c82731b5e188f02f5b9
change-id: 20260523-seg6-mobile-end-map-9cec24191817

Best regards,
--  
Yuya Kusakabe <yuya.kusakabe@gmail.com>

