Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=91.218.175.250
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795096543;
	b=4zl/rn5TXdoa8GNtGHH/pIrYJHfr6H6i63QSsPuSbyTgF/n4bN9W3pKl9fHtvpt1iNze
	 EQ0aRseBTsreDIwMfpg0Ph1Jpyws1Lu8sJab5Vllbi9Fm3bQgx3Blc5wfjRCHeQ5wqqsw
	 /B7oYXP+UMT8/3ZtVUGIo63WZaQi+l2sDNy1F2GWNbH8wh0e1t9slr/xixMzUL1qPiA2s
	 +Go8KTEn+dcjUwJwAPaIgWgs28X83ef1qPNyd6yQmErjKR/0uglpLHz+8bh8y4LrB3+Vz
	 Bbd/zMYjiYSG09cnBJ6RmBqXqbdV/nIM2pblxZH+YLk6YSrTilJ9H8HaaGpx1+kr+FQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795096543;
	h=DMARC-Filter:X-Envelope-To:DKIM-Signature:X-Envelope-To:Received:
	 X-Mizu-Trace-ID:X-Migadu-Flow:From:Subject:Date:Message-Id:
	 MIME-Version:Content-Type:Content-Transfer-Encoding:X-B4-Tracking:
	 X-Change-ID:To:Cc:X-Mailer;
	bh=G0aOGc/ks5PLcqUi+hwLdKUzXjjRzZ8ni3LQ8m9/fZw=;
	b=iy+cCIi2yc+9Ky0Re/A77hLLvOakpJ3OjlMBtOMRXss/mdXEEAKlKv1rZl4qqy7tSUAB
	 dYxfRqjIU+foxy92Qcfp7uBEXmRUz47+REi6Q8J23lp4Znl+vflaG4WCdW/WwayC/kuBk
	 o1/OhxESE+rTva3XJysGIe0EJkcVKT5BmW9Vikgexo/l1AR50ICdpkyCe5WF6X+06vL+I
	 rd+nsxkDI07hCs69UYwFjFENiayEDNnXGsQFgryPmQWLytz41eghzH0xV4GXcOQpV97Av
	 3w/6D7/gKRyYXN8EGYEE71UH8VY+RLZUmkd6PzsCyLWCxxE/LzphlfbDBwwlcoJnaSw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=linux.dev;
	spf=pass smtp.mailfrom=linux.dev;
	dkim=pass header.d=linux.dev header.i=@linux.dev header.a=rsa-sha256 header.s=key1 header.b=eKqC19I8;
	arc=none smtp.remote-ip=91.218.175.250
Received: from mta0.migadu.com (out-250.mta0.migadu.com [91.218.175.250])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5A1DF606A330
	for <linux-kselftest@vger.kernel.org>; Thu, 19 Nov 2026 13:55:41 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 5A1DF606A330
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=linux.dev header.i=@linux.dev header.a=rsa-sha256 header.s=key1 header.b=eKqC19I8
X-Envelope-To: linux-kselftest@vger.kernel.org
DKIM-Signature: a=rsa-sha256; bh=FCj/8e9uTCKrDhQ6r5pdxrylYSNXp0DbqY8XBBvdTHo=;
 c=simple/simple; d=linux.dev;
 h=from:to:subject:date:message-id:mime-version:content-type; s=key1;
 t=1795096540; v=1; x=1795701340;
 b=eKqC19I8BBAD/rfADbj4zML9MMELDqsDwWZ2ofBgh/+6Niz3jvFxa6HhSRY2IDfw6RYbNT19
 8fcclBDj1s8j5GkiKqyhp1pLMjwy70Lh6AkcV1y52etV2mb8sHEkGaTLu5HDVNgdb1eYFg60NBh
 7pjAZR68M/TAuzrhUD71QHnw=
X-Envelope-To: linux-kselftest@vger.kernel.org
Received: by mta10.migadu.com with ESMTPS id f7765eaebbe975a7;
	Thu, 19 Nov 2026 13:55:37 +0000
X-Mizu-Trace-ID: f7765eaebbe975a7
X-Migadu-Flow: FLOW_OUT
From: Hangbin Liu <hangbin.liu@linux.dev>
Subject: [PATCH net-next v4 0/5] seg6: add End.X PSP flavor support and
 selftests
Date: Thu, 19 Nov 2026 21:55:16 +0800
Message-Id: <20261119-srv6_flavors_endx-v4-0-284cdb484eee@kylinos.cn>
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Post: <mailto:linux-kselftest@vger.kernel.org>
List-Help: <mailto:linux-kselftest+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kselftest+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAAAAAAAC/33O0QqDIBQG4FcZXs/hMdPc1d5jjCi1JQsdGlJE7
 z7pYmMsdvnzc77/LCiaYE1E58OCgkk2Wu9yYMcDUn3j7gZbnTOihHIiKcUxJF53Q5N8iLVxesK
 SVRKA65IohvLdM5jOTpt5Rc6M2JlpRLfc9DaOPszbWIKt/+MmwAQzTUCRUjHRistjHqzz8aTcx
 iX6JoAQuUfQTJS8UaKriqpj8EMUHwJg94siE0qCEG3basnLL2Jd1xdo66GZQwEAAA==
X-Change-ID: 20260922-srv6_flavors_endx-9489116d50c4
To: Andrea Mayer <andrea.mayer@uniroma2.it>, 
 Andrea Mayer <andrea@common-net.org>, 
 "David S. Miller" <davem@davemloft.net>, Eric Dumazet <edumazet@kernel.org>, 
 Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, 
 Simon Horman <horms@kernel.org>, Shuah Khan <shuah@kernel.org>
Cc: Hangbin Liu <hangbin.liu@linux.dev>, netdev@vger.kernel.org, 
 linux-kernel@vger.kernel.org, linux-kselftest@vger.kernel.org, 
 Hangbin Liu <liuhangbin@kylinos.cn>
X-Mailer: b4 0.16.0

This series adds End.X PSP flavor handling in seg6local and extends the
SRv6 selftests to cover it.

Patch 1 splits the final forwarding step out of end_flv8986_core() so
RFC8986 flavor logic can be reused outside the End path.
Patch 2 uses that to add End.X PSP support through the same
end_flv8986_core() path.
Patches 3-4 refactor the PSP selftest setup/cleanup so flavor tests can
be added more cleanly.
Patch 5 adds End.X PSP connectivity coverage and updates the selftest
policy parser to accept an explicit action field.

The goal is to make End.X PSP behavior consistent with End PSP, while
keeping the selftest structure easier to extend for later flavors.

Run all srv6 selftests on debug kernel. All passed without error.

Signed-off-by: Hangbin Liu <liuhangbin@kylinos.cn>
---
Changes in v4:
- Thanks for Andrea' reviewing. All the changes are based on Andrea's suggestion
- Patch 3:
  - always report on every setup error
  - keep adding proxy entry __setup_rt_policy
- Patch 4:
  - update commit subject and description
  - defer proxy route
  - defer setup_hs_lo_addr
- Patch 5:
  - add helper __get_srv6_node_id() and __get_srv6_adjacent_id to get
    node id and adjacent id. Remove __get_srv6_rtcfg_all_id.
  - merge three __get_*_func() to one __get_func() helper
  - update build_csid() to use the 2 new add helper
  - __setup_rt_policy
    - add a check to drop incorrect policy
    - use get_rt_sid() to get the policy
    - read the element once, and pass only what setup_rt_endpoints() needs
  - add a check of the kernel support for End.X PSP.
  - add a own SID for each adjacency
  - add consumed SRH testing for End.X
- Link to v3: https://patch.msgid.link/20261112-srv6_flavors_endx-v3-0-c9177bbbd965@kylinos.cn

Changes in v3:
- Rebase on Andrea's "seg6: fixes for the PSP flavor of SRv6 End"
- Update selftest to support the new SID format
- Link to v2: https://lore.kernel.org/r/20261009-srv6_flavors_endx-v2-0-56ac7f838f41@kylinos.cn

Changes in v2:
- rebase on Andrea's "seg6: ensure packet data is writable before modifying SRH and IPv6 DA"
- Patch 2: Update end_flv8986_core() comment for End.X
- Patch 3: Move ret check in this patch
- Patch 4: Do not remove noflv route
- Link to v1: https://lore.kernel.org/r/20260922-srv6_flavors_endx-v1-0-4d01c05c47b7@kylinos.cn

---
Hangbin Liu (5):
      seg6: split final End process out of flavor processing
      seg6: add RFC8986 flavor support for End.X
      selftests: seg6: move SRv6 End PSP setup into its own helper
      selftests: seg6: explicit cleanup for SRv6 End PSP test
      selftests: seg6: add PSP flavor testing for SRv6 End.X

 net/ipv6/seg6_local.c                              |  31 +-
 .../testing/selftests/net/srv6_end_flavors_test.sh | 408 +++++++++++++++++----
 2 files changed, 365 insertions(+), 74 deletions(-)
---
base-commit: c88fd6989aea9237a60a4859139a265bfb7ddc0b
change-id: 20260922-srv6_flavors_endx-9489116d50c4

Best regards,
--  
Hangbin Liu <liuhangbin@kylinos.cn>

