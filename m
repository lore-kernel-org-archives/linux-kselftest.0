Received: from mail-pg1-f179.google.com (mail-pg1-f179.google.com [209.85.215.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A0F293F5BFA
	for <linux-kselftest@vger.kernel.org>; Tue,  1 Sep 2026 02:03:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.179
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788228212; cv=none; b=vAKlQtYz2YkqYTwCOzmU1EPKzKXNT7w7XcMFvOmGfwJqVheZ0QHU4YipGYVSbw3H36QofGLzJC2iH1rWVu6Ixo/alontGMcnZDFEMp+sRcDGNPBsc98ZmLAWfUlGE2LlM0xO1pFVYgSPYAycIGvHTZjK0KCyD91eIj75esXRZTc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788228212; c=relaxed/simple;
	bh=hJ24dHwYNskkMzJQOdxprEVRtyGXL1/rtztojA+8fug=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=oxUvpKl6AB3/vkM8cS6+A/cPX5o5yZW+y6bvrYtaB8eJRX7FtyL2gDltk4RiieR5cQxRGKw7O5WmR5Wkg4FZn0Yxn04F9PLVtmLVCdrCZjVpI7bWMgwPLpSMmaRI9cFMV/a3/bVeRgXzmxMGD/9xBTwNU5qfpbcDALac/AbKzZ8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=CyVvVHha; arc=none smtp.client-ip=209.85.215.179
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="CyVvVHha"
Received: by mail-pg1-f179.google.com with SMTP id 41be03b00d2f7-cbedf433a99so501271a12.2
        for <linux-kselftest@vger.kernel.org>; Mon, 31 Aug 2026 19:03:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788228204; x=1788833004; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=rCEYFhj1mjK96Rv2xJZjQiJk6x21bXoFnt8xqzOlIK8=;
        b=CyVvVHha7W+LGIdV+Bo/F+X0pL34h2tK6SdsnxJ+yLLXzah98L/a6ioyPubAZxD19U
         FpD33w949/fdYyBZrPca+ZzRjYiyh8sYMWizq0S2vGn/d6Q6wupl0UMQPiI+/Hpn4IXS
         Auj4NgBO8kBUlK2pVf501JFj7QINudyiDGCAaXRdnMsP3bJC6u3P4YJ7Ttsx+C7bM7ds
         LWVLyR05Gj7+5AtbsvdfAGGh6sJKR2fgM/5dp8AIHhptWA93XHJ499ju8b4a15gdPTlB
         foDaW4G+tQb0Rf1s6b2iUmoltlDDWYBd8pp9O/qixaTcWI22DMnNvC04DL4qQ+6qbZEA
         ZRmg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788228204; x=1788833004;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=rCEYFhj1mjK96Rv2xJZjQiJk6x21bXoFnt8xqzOlIK8=;
        b=E91Pt+Cth/5OJHTigeTbQgaBET6APNRkwqUb3mdbS+JaRoVUxoTUzaniBaO7epWBDi
         wZfxv30xnIsAWaOE+PNND5pI8udsw/jzTHoCbe2UOVsG0sPxQpXIGRVgYG+5MK0coiYn
         DthZX99971Vq6aUTWtoYvV/zCO+2a7AuzbP1TjpKt9ETUYko+KeZktY2TskV7T+VRcHY
         ExbRdvC1eIxRkZiQBuZfeIJrvQKlQgis0f9KDscS02Y9ml8OA7vBzeU32PZcAPPhihnZ
         t0lXIKBttggqKcQWjzymYu9g61i6GPXnY43H3nrkRDWM8jzhqIkY1/6nO2/1kdkVMTg0
         OhNw==
X-Forwarded-Encrypted: i=1; AKwUvBy2EjI5Zs0hFP82kdzYRzt4eHgfgamBQnW/5Iu/YBfbFN7EIAjeZ0fEOljWKinAWcsYfYrJhhEz69iMqINoHhE=@vger.kernel.org
X-Gm-Message-State: AFuF++ntHkJPGdgqWuZZoXoqL0FfqvUovanbi8KGw1zKhNskbdaEUQbZ
	cyWUFdjPJRxSPuinNJgKODgyOV+lCT2dY2ojD03VNtSNTriO1Y3KQZXl
X-Gm-Gg: AYBFou3jlR//6izjG34JoOHB2B3aSs5cC1/xAVXdz21OQFeMOkZMSXGZIn65wcHV3zF
	bWF7KJLuXnk133mZwzJ6bSL9dzWjD4zBpNQZv8pKOsPdF31HJ4zU6CGIAogFPQ0CDYIildX4bWO
	A88vmFF6kYi3cO0CgpvSNYSa4QHJe3EO5OpzgywC5Q48bWJZ7xM9fVA49FNpkPU56WoK1WEopI3
	MOJ+wavdc2rVh9m0lcUSd2is+lZM0gz/nTZb26Ac9AyfFb5x5wpczXRHnRgYTTTZ0uEDkzqmFM+
	DfQamcJgfCoFg4eIf2uX+QsZ8GOi3WeBWOCa92uKTmo9HGX8+u345uA+rMrOijhbRZbULukBtQ8
	0jByLiblKm19lVcfeG27zbBUc8KRURkD+JO2r+apuu3lX8rbNIN7zjQlCHmqg2CKDUoSsMHQhRB
	7ZiGkVBvqf7Fb6wj++C4YWZ4i6lwJg8fwFFJ4NUp+p7dJSG1VIJhNVB5Tyb6kYID19dDJZeYY=
X-Received: by 2002:a17:90b:17cc:b0:398:d8eb:cb2a with SMTP id 98e67ed59e1d1-398d8ebcd21mr13893358a91.23.1788228203814;
        Mon, 31 Aug 2026 19:03:23 -0700 (PDT)
Received: from [163.43.103.131] ([163.43.103.131])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3990bd46185sm3020899a91.5.2026.08.31.19.03.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 31 Aug 2026 19:03:22 -0700 (PDT)
From: Yuya Kusakabe <yuya.kusakabe@gmail.com>
Subject: [PATCH RFC net-next v2 0/2] seg6: add support for the SRv6 End.MAP
 behavior
Date: Tue, 01 Sep 2026 11:03:17 +0900
Message-Id: <20260901-seg6-mobile-end-map-v2-0-1629bfc166eb@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAGUylmoC/21OSw6CMBC9Cpm1Y9qCfFyZmHgAt4YFlBHG0JZQJ
 BjC3QXcunz/N4OnnsnDOZihp5E9O7sCdQhAN4WtCblaMSihYnFSIXqqYzSu5JaQbIWm6DDTpFU
 kM5nKBNZk19OTp731AffbdeMsDWhpGiD/Gfy7fJEetu5NbtgPrv/sP0a5B/fJRIq/k6NEgVlWk
 lBVnMoovNSm4PaonYF8WZYvj/FCYdkAAAA=
X-Change-ID: 20260523-seg6-mobile-end-map-9cec24191817
To: Andrea Mayer <andrea.mayer@uniroma2.it>, 
 Andrea Mayer <andrea@common-net.org>, 
 "David S. Miller" <davem@davemloft.net>, Eric Dumazet <edumazet@google.com>, 
 Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, 
 Simon Horman <horms@kernel.org>, David Ahern <dsahern@kernel.org>, 
 Ido Schimmel <idosch@nvidia.com>, Shuah Khan <shuah@kernel.org>
Cc: Justin Iurman <justin.iurman@gmail.com>, linux-kernel@vger.kernel.org, 
 netdev@vger.kernel.org, linux-kselftest@vger.kernel.org, 
 Yuya Kusakabe <yuya.kusakabe@gmail.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=3407;
 i=yuya.kusakabe@gmail.com; h=from:subject:message-id;
 bh=hJ24dHwYNskkMzJQOdxprEVRtyGXL1/rtztojA+8fug=;
 b=owEBbQKS/ZANAwAIASrX0XUqXRtNAcsmYgBqljJnrqPYNPJVnghNuErK3bsL7HSG2Fh371Tz5
 WwFYlvsRpuJAjMEAAEIAB0WIQTaB7usAfxNKMeqa6Yq19F1Kl0bTQUCapYyZwAKCRAq19F1Kl0b
 TScrEADWSUE0T5JaaKxPdV7j4zjWEsUKkbwaWxAa8bOdnw8SqTH0e0p6P3III9H17W+VnDNe9JB
 r32rGiRZXhBm/p0BtjGyPMq4/dPqRRpbsuqWpix+7JgFWzIkFFBejXJTfB67bRPXYRwaEWNFQdQ
 ZIuMjtdcamvYalhKkeigGu1x8Jcz5EejrHn8QgL90YmUDmcr+uPT8U2mSXCJl9dMLFjz8ZMq09D
 CUeha4moj5pN/1qx6bADSVIQVNE9AdYickPZ1zKLzwMM3D2gSLKL0v3DbIikG14fPMXkez+jjVU
 k+E8cQ0Kb4vJtDZ3Fk9msZQQO99cWPIBN4zkt1JAfRbsBmXx4ROXSJmJjYPCEJLoD5KRaGAiKEL
 sr5Puki9Ho7Rnh8UAaJeyfCPgzT8h8KGyHXC6zrJxTZJjb2hUhi/zEgTVL40RWdAamHuYV+F7n/
 g4foQ9+s6hnRsl1Qe3gRwy6s9Woe+5EhvDMDoaZsEd4b1dFrbOD4Vl58zViJv3tA7/iV8h/zXF1
 A+eHjXfafh9+YT4gn/Lb2Nw41UyYVqkBwyz3scPOAsJi8YlV7UnGn8Ay2w19CXLLPBXlgS0so2F
 V+5bLrRy+o/APUS6SfVZNTeXfVE1O5ag1ZqRDAqnA6MJyxcduGECkczB7Y6fwcZGMr0Eb3Agj4o
 YHQ6/FoeUqMbjmw==
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

A matching iproute2 series adding the "seg6mobile" encap keyword
follows shortly after this posting, since the selftest needs it to
run.

[1] https://lore.kernel.org/netdev/20260505-seg6-mobile-v2-0-9e8022bdfdb6@gmail.com/

Signed-off-by: Yuya Kusakabe <yuya.kusakabe@gmail.com>
---
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
- Link to v1: https://patch.msgid.link/20260710-seg6-mobile-end-map-v1-0-99be02d68143@gmail.com

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
 net/ipv6/seg6_mobile.c                           | 700 +++++++++++++++++++++++
 tools/testing/selftests/net/.gitignore           |   1 +
 tools/testing/selftests/net/Makefile             |   2 +
 tools/testing/selftests/net/config               |   1 +
 tools/testing/selftests/net/srv6_end_map_test.sh | 399 +++++++++++++
 tools/testing/selftests/net/srv6_mobile_send.c   | 262 +++++++++
 13 files changed, 1455 insertions(+)
---
base-commit: 1bb784eb6e38fd73143f021608e4ef3095d0c0d7
change-id: 20260523-seg6-mobile-end-map-9cec24191817

Best regards,
--  
Yuya Kusakabe <yuya.kusakabe@gmail.com>

