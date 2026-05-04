Received: from mail-pj1-f50.google.com (mail-pj1-f50.google.com [209.85.216.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7B2BD1A683E
	for <linux-kselftest@vger.kernel.org>; Mon,  4 May 2026 12:37:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777898245; cv=none; b=evBWuWU06md2T3z2gFetKGhnAtuVIAgOR2IC8+k1vXX4YzE8ckAdmXVjFipZHRszn2zc784RMSPrczVojwHs2ps64Qy7Q802RMYv0CX0zk4CWgnSmmuQeRti4Pe6OeqX6XuSFmfjTC7bEutb+HJNjBwBiRXPT0LCkFHvHigM/Jg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777898245; c=relaxed/simple;
	bh=bTuKn1DdihsBzgZCLCw2WFo+hdCwIzZvIiVGWxyeO0M=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=UEtc8WypxJk53sDFdH/QTAxU96gKFGu1NqUegzN+3WtNLZMeJXmX43Tu1yDGpYknCWegnjIZlkSsQbD7IhkQ5R4g0RUEqIiibG7eBU2TmqmRIuHoicZ/bcm/IdELx0rrxcbwHeeaMzOeQEuAhtiWbrZlPa22D6TAdpFWKraX9S0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=HDSKrjF4; arc=none smtp.client-ip=209.85.216.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="HDSKrjF4"
Received: by mail-pj1-f50.google.com with SMTP id 98e67ed59e1d1-364f65f6eaeso2714392a91.0
        for <linux-kselftest@vger.kernel.org>; Mon, 04 May 2026 05:37:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1777898244; x=1778503044; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=c9T1i7FdZhwacHJsq1bHlPf1QctcwfXVB2lsLVY3Qpg=;
        b=HDSKrjF4S8DSUoB8amkx3Rts699x/Td14Z+oU2a+E6DkNlk1x3+JuPNUby8Yv8F3Li
         /cBKY07/TtGAmd0v4F3Uhks/bgDqQRVI3iYNPHffv5ZuVFXbcNLWfeDxCsqyBoFtgs5p
         UKY6S4Tykv9u8QDcPx6TsLlTA53FARBlpwBUwIvG/J1MS+pZDNZWnoQMt/1ebalcEpsS
         zyjgui4e4OfI93OzaXsdsrOJSLBTuPc7njAqH/6po/fhYOMhrCAgVfj4rOBPW7CHWstX
         SiIOK7mW01vttTXNgErJyZ5pZfEkb+ZJrMl7TcE2US+ydWEUl/Bme2BF3ytbV5KJMjtG
         CqsQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777898244; x=1778503044;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=c9T1i7FdZhwacHJsq1bHlPf1QctcwfXVB2lsLVY3Qpg=;
        b=LwWA/bnYUYte9qB1E2uBuunj7EymWhoU7rgsquVObFoSezSqtirbidNqMEBHDk21KB
         hKr61FSIjtFgciyQ8TqKlnp2E1sEOIjvIzxcAlgDcO1it62gP5pei7eeFBt3x//5ufke
         azLdoteS4ocSARfOHKNThLvgeDpTjKsDcRZOz823/9YUAVAERt0BMZEn8iZiPLV3bycq
         WKRRETYxYjv/1zjZO727nlnCPoMqlA6ZkYR1xMFZTsJuZ2HyrSWIsgZemYortLV188GT
         j+DVzpdcDk2fVNYwHs3KwEwJ04x3LNVF9JZC9kebksYWtN4rjUzA8O9U3cD3dxqinY5N
         i34w==
X-Forwarded-Encrypted: i=1; AFNElJ8y1+BuKsHk5Q6atuMxo5AEIMp3g3Na71VLb8TIKXSkbt6AhMQbIMVQfOv7VSs0+pNpffnibcH780gntG06/6E=@vger.kernel.org
X-Gm-Message-State: AOJu0Yxy3Er/4u5xrS9UXTPL1T9h9gkYLHeyOeXjItyVC5+h10dwoI2U
	vFJwfo0o214wAAa4IG1d+OUpWymOnbQEy4wwTlMPEFhYZG8METKfFINJ
X-Gm-Gg: AeBDievWmQP5/JHmYc6A5js1CdDN6IOJOVnSPqWCHScSO7KKBXrGUCpmSP5MG9i6f5m
	+2CPinKDVwCLSyNFBaNvFMvHIWlWfLFKrnYDj6Gl6xh6TQ+y+NRPzhNYUxnCLkw59k2J5WEiCaw
	M3x2LrhzcFpOM84g+Ia+xuDmH94sloumNnAZPVQ0C8oPFxDSiwUjcfmgSrBQBubpjPaWyva1Kw4
	sPRFv1rwx7iY6KjDJvorLmBa6p8hYBC72sOyzowAWkYCH4avPWugVuIZwSBoKisqV5/esW1TL3R
	YItUBkDs7gsOjGjI3HDqzkHvb50JA4l5N8NURokrrlq3Xh8k8O5+tItjj7xyDYyb5QPlfqY8W2D
	xJUTrcy60XwOtA5tnxcDRn42FHXctEA2Lwzb9pbt7Ck1/vZnWULUPRfFcgct1JNT6MA0jdCLehw
	Ba2mOxvxooLgcAl2Xuk/MDVyjNn85L9TGTh4VVQQ==
X-Received: by 2002:a17:90b:44:b0:35f:b348:63e with SMTP id 98e67ed59e1d1-3650cdd0f75mr9531724a91.9.1777898243721;
        Mon, 04 May 2026 05:37:23 -0700 (PDT)
Received: from houminxi ([151.242.165.70])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-364f4558e0dsm5883550a91.2.2026.05.04.05.37.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 04 May 2026 05:37:23 -0700 (PDT)
From: Minxi Hou <houminxi@gmail.com>
To: netdev@vger.kernel.org
Cc: aconole@redhat.com,
	echaudro@redhat.com,
	i.maximets@ovn.org,
	davem@davemloft.net,
	edumazet@google.com,
	kuba@kernel.org,
	pabeni@redhat.com,
	horms@kernel.org,
	shuah@kernel.org,
	dev@openvswitch.org,
	linux-kselftest@vger.kernel.org,
	Minxi Hou <houminxi@gmail.com>
Subject: [PATCH net-next v4 0/2] selftests: openvswitch: add pop_vlan test
Date: Mon,  4 May 2026 20:37:11 +0800
Message-ID: <20260504123713.555461-1-houminxi@gmail.com>
X-Mailer: git-send-email 2.53.0
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Add test_pop_vlan() to verify OVS kernel datapath pop_vlan action
correctly strips 802.1Q VLAN tags from frames.

Patch 1 extends ovs-dpctl.py with vlan(vid=X,pcp=Y,cfi=Z) formatting
and parsing, plus an encap_ovskey subclass for safe ENCAP NLA decoding.
Patch 2 adds the selftest with baseline, negative, and positive checks.

Tested with vng on x86_64, all OVS selftests pass (including new
test_pop_vlan).

v4:
  - fix all checkpatch line-length warnings in new code
  - fix pylint W0707: use explicit exception chaining (from exc)
v3: https://lore.kernel.org/netdev/20260503120946.51869-1-houminxi@gmail.com/
  - encap_ovskey: MPLS type "ovs_key_mpls" -> "array(ovs_key_mpls)"
  - encap_ovskey: PRIORITY/IN_PORT set to "none" (metadata, not in ENCAP)
  - _vlan_dpstr: cfi=0 falls back to tci=0x%04x for round-trip safety
  - encap parse(): check return value for unrecognized trailing content
  - vlan parser: boundary check + raise-from for exception chaining
  - start_capture: || return $? to propagate ksft_skip correctly
  - on_exit: moved after resource creation, not before
  - ping success: changed from NOTE to FAIL + return 1
  - VLAN interface creation: added || return 1 error propagation
  - netns probe: distinguish EEXIST from missing CONFIG_NET_NS
  - sbx_add: || return $ksft_skip -> || return $? (match sibling tests)
v2: https://lore.kernel.org/netdev/20260501133924.3100680-1-houminxi@gmail.com/

Minxi Hou (2):
  selftests: openvswitch: add vlan() and encap() flow string parsing
  selftests: openvswitch: add pop_vlan test

 .../selftests/net/openvswitch/openvswitch.sh  | 196 +++++++++++++
 .../selftests/net/openvswitch/ovs-dpctl.py    | 268 +++++++++++++++++-
 2 files changed, 456 insertions(+), 8 deletions(-)

-- 
2.53.0

