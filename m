Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.42
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795081984;
	b=tn+jw9HukUrAH0Idi5tULx8dgPt8Ai++8ymvSabdUB/f4seKTAAtsnrr3Eo3kx1NrTgn
	 kP3VFdfDNX48xBKcKdriHEPMdxY500KCNcla8qr7nSOBQ3nAl/uUNkECTjq/r5Gtxl58l
	 v6Nb3LNBClWmXSrFv8kjxgykjZ/VJKUCs4mDaJcZyawITIfwkgOXBbBlv+cWzafnN6r2L
	 xa/R2Of7ls3i5A4lyU9KiqzMgHQFfFWmtu96U4EnXSRVf+dSeos2kIn+wHR+OH7E3fJt5
	 sXGh2x34UkZZIBvLlUJc3klclLJYscSyxk6FVphq/S2PpB5UPgmkp7dhgQWrZBccBLw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795081984;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding;
	bh=EgNLea8vZO6m18gQw1Vww9H/46h/BYth1Gj/oZAEz8o=;
	b=DXj/1w2PZ0MRlFhL3rOObvDW2OeHcylPT+HGHe/jIfxNzLav1sOiN4VmvxMonnRho88o
	 aWAx/oqoIn9C1bo4w5U+fB5uHVnVAezcXlW7h793+tamMYT0Z0Qp6oWNvkFSvY1BVuwJW
	 TT0Dxz0zPNePbUQBp4SqlSqs3zZ/FRl0Cf0KqZDRGGUlGqH/v9ngYe+Ewc9GGBGkZCrbj
	 41kdEDm4QCnKFtBPzUSC8Mt7y3PBXeBQIetJcapXcey1KNsM0YCiX5KAEzfk60OoCTT2w
	 UTlxS1jMxPsnc6lNYuUmuNes6ntd+nFZOtQF7NkNmIU8QmqQowaZYtyVelgm2DrCg3A==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=EaCQQp1S;
	arc=none smtp.remote-ip=74.125.82.42
Received: from mail-dl1-f42.google.com (mail-dl1-f42.google.com [74.125.82.42])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A8E2E606A325
	for <linux-kselftest@vger.kernel.org>; Thu, 19 Nov 2026 09:53:03 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org A8E2E606A325
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=EaCQQp1S
Received: by mail-dl1-f42.google.com with SMTP id a92af1059eb24-1b24f4b15c4so250386c88.1
        for <linux-kselftest@vger.kernel.org>; Thu, 19 Nov 2026 01:53:03 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795081983; x=1795686783; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=EgNLea8vZO6m18gQw1Vww9H/46h/BYth1Gj/oZAEz8o=;
        b=EaCQQp1SGNgIq0h2I/HDc1TcyiWT5R1jSfv6KltPDpAxVK5hGpm3kIi27ruW+0xAtf
         WAw3l+B1w+EmmhzGJBlgxdPmOW5Uz22LoZJGHOKbuw6UBY/ovrxR1i3OFRbq9xloURxZ
         m2QE9rJiR3Z+Jwvek/MbbnOaRrIuTPgsYkfNhcWrv1r/aPdyNc6kRzxTVKrWnCj9gCj5
         yaNa4LTuk1rOOSxLmMRND31aDwQsR1XFyc81G6wgQ3Lhh5le+CEDsItmLPNa/Bt1YoBz
         vP9otV9x/Qw1POQ/PLVTnDNnbe44DaYAS9Qlbovn6t8kcmw2dY0AzBW6o7hzzYCwqWO3
         YfRA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795081983; x=1795686783;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=EgNLea8vZO6m18gQw1Vww9H/46h/BYth1Gj/oZAEz8o=;
        b=Rvz4un5dsoQs4nqgN6iecCE08OzBF44L9VM/8nknHqCLaDOMxTsM3mS3VfakzueHVn
         b6gSpa5RBDC8Uh/sBHLxp716FwUiKNNnuvAdkqRWdCV0WBnL1vlvdIA7QhB3LsDphDjt
         N6Oqhw4sFrF1PjDkRAIYGX7AVxGXvTf2/rR7xs9QbKHAO828uPSfP3B6PH9fJv5/6akQ
         MQWq7Lr6NbJ9C1akyHO/8HSwGsWRZUPlLxuUrcOM/JhjtiveUnQQUv3n0hvC8LsZXY0r
         HWoU49pvxnvvYbUpBIZClOxlXDapQwtHlGjlvG0/VdjGqlmK714iY1owB2GLuKeuySLY
         ju8w==
X-Forwarded-Encrypted: i=1; AL+hErGgbPZ2mB3Y31sDNQqnUXbC8s/uXW9mcOK/jw3lrH0YDw+BcYmna9+sSRqraD+Kgrud0c/Dex79dLJL0+vlcc4=@vger.kernel.org
X-Gm-Message-State: APuU4Z8WsxgGFESdTVVHhB6rDMI3CZcLCRKOVZTCYSnQSJ/3e6WkUq08
	XU/KTX6RHpBJuwwIfxWV+HbSH45IvSG2zfvgIFAvGJK3YmDCefuEZKwX
X-Gm-Gg: AYBFou1PgMsCoPxhGcdwjw0rU6OGdrj/eky4k1wpyWJawL36kkgNVNIujgoD6KROXNc
	Gu8tXZ91es+7KTUQhxsnPuFoD+UMXWXqH6lih7Y/AkG3HxzeM8NF+/u3lb1DZjp0+A2tcmssVcL
	FiiRzj0BJ2XAkhhsFlEmWIjg4jOSp6IwzWke9gYi5Ydcvc8AITnP1D11RkC1rVZoavKYtFSWQzo
	pa5lHS43yJ3aPNu38pj9hce1TUf0GTi5DlpVONtX78AM7mJgNiYCGjcJeRyxjYrBRgHkK0qXDge
	ncTt9XmlSKHpVfV6QlQEW6V7W2a+zf0OdfAZxz631oOu7IGDmqEuUnDB9KiqdbKw3BEvdmbq2v1
	e3Xjb8qpwPrRMPcb3gM5ndzGzykoJVHl0ykMxRd1BTzxauUyjqxut5uiY2NJBymrMRqAG8haty4
	AOmqYAMQs49y71Gkd0NzXonulALWgos15lhcczVRLxaidH8BseI+LbWzOSfvotcHAwhtjvrVpsJ
	+njpQRx3ZtYkzCn/dUC9V9IuFb5x1A7K86QwWZ4egqmRS1p7+K6lD0pz0HbCNaAnuiGLcFJKb7t
	xL6Dk62Y9cYqvjyKLzgg9PtlszTKFWC5wWAbZBBA46cjsBGy0KsNsIu+VxgtzlGhY/hic89wrWW
	E609bWLei/sWRBg7PthqeuWdR
X-Received: by 2002:a05:701b:4588:10b0:1b3:be0d:696c with SMTP id a92af1059eb24-1b5520d7006mr494326c88.1.1795081982331;
        Thu, 19 Nov 2026 01:53:02 -0800 (PST)
Received: from localhost.localdomain ([116.88.205.165])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-1b5447c5b02sm12862850c88.6.2026.11.19.01.52.58
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Thu, 19 Nov 2026 01:53:01 -0800 (PST)
From: Zhefu Peng <ilskdw@gmail.com>
To: netdev@vger.kernel.org
Cc: andrew+netdev@lunn.ch,
	davem@davemloft.net,
	edumazet@kernel.org,
	kuba@kernel.org,
	pabeni@redhat.com,
	horms@kernel.org,
	kuniyu@google.com,
	mschiffer@universe-factory.net,
	nicolas.dichtel@6wind.com,
	shuah@kernel.org,
	linux-kselftest@vger.kernel.org
Subject: [PATCH net v6 0/2] vxlan: reset the remote's dst cache when snooping moves a MAC
Date: Thu, 19 Nov 2026 17:52:54 +0800
Message-ID: <20261119095256.42005-1-ilskdw@gmail.com>
X-Mailer: git-send-email 2.54.0
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

When a learning VXLAN device snoops a known MAC from another VTEP, it
rewrites the remote's IP address in place but keeps the remote's
dst_cache and remote_ifindex. Traffic to the moved MAC can then use the
route cached for the previous remote and be blackholed. Patch 1 updates
the remote the way vxlan_fdb_replace() does, under vxlan->hash_lock,
and compares remote_ifindex in the early return only for link-local
sources, so a "via" device set on a dynamic entry is kept. Patch 2 adds
a selftest.

Results on net with 1, 2 and 4 CPUs, per selftest case (move behind a
router, move to link-local, via kept):
- without patch 1: 0/7, 0/7, 7/7
- with v5 of patch 1: 7/7, 7/7, 7/7
- with this version: 14/14, 14/14, 14/14
- with this version and CONFIG_PROVE_LOCKING: 7/7 for each case, no
  lockdep splats

v6:
- update the remote under vxlan->hash_lock and check the entry again
  once the lock is held, so concurrent snoops cannot mix remote_ip and
  remote_ifindex (Sashiko)
- selftest: pin pings to an allowed CPU instead of CPU 0, skip when
  setup_ns fails, and drop the CPU pinning from the IPv6 case, which
  does not test the route cache (Sashiko)

v5: https://lore.kernel.org/netdev/20261115040609.61134-1-ilskdw@gmail.com/
- compare remote_ifindex in the early return only for link-local
  sources, so traffic from the same remote no longer resets a "via"
  device to 0 (Sashiko)
- selftest: add a case for the above and keep lines within 80 columns

v4: https://lore.kernel.org/netdev/20261113155133.75090-1-ilskdw@gmail.com/
- add the selftest (Nicolas Dichtel)

v3: https://lore.kernel.org/netdev/20261111180001.2475-1-ilskdw@gmail.com/
- use my real name in From: and Signed-off-by:

v2: https://lore.kernel.org/netdev/20261110153020.9635-1-ilskdw@gmail.com/
- also update remote_ifindex and clear offloaded, as vxlan_fdb_replace() does
- add the IPv6 link-local case to the changelog and a second Fixes tag

v1: https://lore.kernel.org/netdev/20261106144406.66035-1-ilskdw@gmail.com/

Zhefu Peng (2):
  vxlan: reset the remote's dst cache when snooping moves a MAC
  selftests: net: add a test for vxlan snooping moving a MAC

 drivers/net/vxlan/vxlan_core.c                |  59 ++++-
 tools/testing/selftests/net/Makefile          |   1 +
 .../selftests/net/test_vxlan_snoop_move.sh    | 222 ++++++++++++++++++
 3 files changed, 274 insertions(+), 8 deletions(-)
 create mode 100755 tools/testing/selftests/net/test_vxlan_snoop_move.sh

-- 
2.54.0

