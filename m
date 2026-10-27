Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=100.103.45.18
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1793109845;
	b=MPaPDv1wkmaYZP8bf2LYQzMyreeTgI399+RDsNui4C8pdDKvcFhm8ALTjx+kTT2A7OJU
	 BqBcSDEr+uDp6I/P0db5z90md8RZxGrIWi7971LOMHYbzAYVbSZZDVTGVpRo0t+c6ws72
	 0UoufBaiHw+81f7BZSVO1IiO1iv0wNd8oGkgN0uLjNNgvyPqwfh6NCmcyMuz8C0OsW9PP
	 8+SrVWcl5ykPQuwZjCRYO2StPgOS+ol1qkDa59OgoOaMFqx+ndt4RABcCGxArt0aDlQre
	 3SG9yo4dCkyqAPSkJJtRO1Lq6Q/2GrVprWMf4uD0I1zKjfGn3D2XIdeOUuW/7lSDfjA==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793109845;
	h=Received:DKIM-Signature:Received:From:Subject:Date:Message-Id:
	 MIME-Version:Content-Type:Content-Transfer-Encoding:X-B4-Tracking:
	 X-Change-ID:To:Cc:X-Mailer:X-Developer-Signature:X-Developer-Key:
	 X-Endpoint-Received:X-Original-From:Reply-To;
	bh=PbJrwzyUK0pW3BmVe/ZETXHMHaNg37K20YRVtMW8l/4=;
	b=UkEfgIe7gI8e9UHapx5ILO7+eIgD1HsY/VxKP7vdZdiaBWbzRlBFcCK6WW0nPSHibVle
	 PcYRu0X9GmT3tEFWCGiBHoGosYTzlr9JLPCzMcsWA6MFnnerVbbxk49Lrkjh5nLWez8Fu
	 0n1G+UrXTr1FAh0L2ceyYjU2jWlmShLFj8WeVY97dhEMZl7cUV/rbRLAzp4txkcRiKtf2
	 /V5o4ut2wwveudKPD4VQYY14H/Yw49s5e9BdKnDWH+B4gPZyg2wfsCDm2q9H8ncYB0ucm
	 odZEZfDVVZRDn6BLuFFCeaoPQKlz1hDBMKh+oUIonR7t5hiKOHXzGhcr3eNRjVUiBqg==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=OpPrBUvE;
	arc=pass header.oldest-pass=0 smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BC1E5606A322;
	Tue, 27 Oct 2026 14:04:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=OpPrBUvE
Authentication-Results: smtp.kernel.org; arc=none smtp.remote-ip=100.80.115.77
ARC-Seal: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256; cv=none;
	t=1793109844;
	b=q/D+njv2AxlG18Szs1VErOz04jfRRRJQfwbTLtYAOyPdIiEO9Fi/AFKZf6AazkN5SwPL
	 O8XgevTMpkijuuQAal83xTGIxSd52fZBhPI1hz5uT8ku+SJ2hskeJepQOVxI2vyW/Z9Pf
	 yp3ffVAzbIxt302l9zzOe3TyZI1VB5zlMbFiVDf7MHVm6qcQc1vQVPm1/QdsyBdJGhpnw
	 DSLBe2bhPJ5bsQPrp3b1FtPqhuFxLgl3+cpnpLIQ28H94wsxyS4iNM7XTAe0R0+TJe47v
	 meGB4HoTxcDshbaQ9bads7sgv8QaXsk+J5PADI46eURXM/akKKxKH+6+N9ugDEKujfg==
ARC-Message-Signature: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256;
	c=relaxed/relaxed; t=1793109844;
	h=DKIM-Signature:Received:From:Subject:Date:Message-Id:MIME-Version:
	 Content-Type:Content-Transfer-Encoding:X-B4-Tracking:X-Change-ID:To:
	 Cc:X-Mailer:X-Developer-Signature:X-Developer-Key:X-Endpoint-Received:
	 X-Original-From:Reply-To;
	bh=PbJrwzyUK0pW3BmVe/ZETXHMHaNg37K20YRVtMW8l/4=;
	b=GHTT9bD1nPwaAurCjMudOzwbOjQVEr3lo3pL4koUo1krP1+OjmgI+m7hDwKKO3OLcYmW
	 MveNOzC1Ruwa6EpMT7UlRj5a+S2BaVRuta9gFq8u+dL1CPIKq6brmisTcF5wgmx5NV14i
	 SCo5cFLWDKnvcMncZW9T/jSEPNGkKZPQsd+/o3nOoxpS/FTNsm1lfWBG/dD0u+XIryDlH
	 HcpKWJxwFlM0Qzjz0OkUg6AfJJJst1som9s7l2iae0mer7VX0b22Cw1VfhBe+dCF1azNM
	 CsCDN56mFBoCcNUSG14d31K+7I40F/DJQzkpXlz3FGAZMGNoEzjHeKkK/KEmdCtZ/rA==
ARC-Authentication-Results: i=1; smtp.kernel.org; 
	arc=none smtp.remote-ip=100.80.115.77
Received: from lkml.kernel.org (nexus.subspace.kernel.org [100.80.115.77])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id E5D2C1F031E0;
	Tue, 27 Oct 2026 14:04:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1793109844;
	bh=PbJrwzyUK0pW3BmVe/ZETXHMHaNg37K20YRVtMW8l/4=;
	h=From:Subject:Date:To:Cc:Reply-To;
	b=OpPrBUvE0wHpCTvBBIBWzgdIi5dsupihMH02xrzrHHFqv2UeeVylQedSAcfeggLEe
	 G9wpREw32vQHQP5c9RAMqlawnOX8wZHw2ZKwcV75u3miaJLf85lhAx8KfCpluptFL9
	 DK55mzZ/iJnJeYTMaJtVo0Kw1ipkF6i1JkO1md0Yyk+nQj/Aw5BWN8lVScvqKoHzuq
	 BRemGtctHzr1jrIoiYrNAtV8N1zvCGo5ZzNaGuu6kAfmxVXzhJh5Zr0cCerjDS5IPi
	 0JrqBdNX6ueImP61kZe2FN/E8SBqagUFw+OhbSSlQw2kKN4KySfNAR8stmYDydJZV/
	 Q+o8S1FHOHYwA==
Received: from nexus.subspace.kernel.org (localhost [IPv6:::1])
	by lkml.kernel.org (Postfix) with ESMTP id 3D89D4510A;
	Tue, 27 Oct 2026 14:04:03 +0000 (UTC)
From: Jhonata Poma-Hansen via B4 Relay <devnull+jhonata.poma.gmail.com@kernel.org>
Subject: [PATCH net v2 0/2] netlink: fix a dump livelock with a
 notification queued
Date: Tue, 27 Oct 2026 15:04:00 +0100
Message-Id: <20261027-netlink-dump-livelock-v2-0-c4bb05352a33@gmail.com>
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
X-B4-Tracking: v=1; b=H4sIAFCv4GoC/4WNQQ6CMBREr0L+2hraIqAr72FY1PKBL6UlFBoN4
 e4WPIDLmbx5s4LHidDDLVlhwkCenI1BnBLQnbItMqpjBpGKnKdCMouzIduzehlGZiigcbpnWEr
 dcNlci0JB3I4TNvQ+vA+IE6h+pV+eL9Tzbtyxjvzsps/xHvgB/zkKnKUsK0rBM5XLSy3u7aDIn
 LUboNq27QtWzWty0QAAAA==
X-Change-ID: 20261023-netlink-dump-livelock-e83cf13f977a
To: "David S. Miller" <davem@davemloft.net>, 
 Eric Dumazet <edumazet@kernel.org>, Jakub Kicinski <kuba@kernel.org>, 
 Paolo Abeni <pabeni@redhat.com>, Simon Horman <horms@kernel.org>, 
 Shuah Khan <shuah@kernel.org>
Cc: netdev@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-kselftest@vger.kernel.org, Kuniyuki Iwashima <kuniyu@google.com>, 
 Marek Szyprowski <m.szyprowski@samsung.com>, 
 Jhonata Poma-Hansen <jhonata.poma@gmail.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=2041;
 i=jhonata.poma@gmail.com; h=from:subject:message-id;
 bh=dyqos+YZiGmpIof18fo47Wd6gwZ5wp6SPtEj3CzE5a0=;
 b=owGbwMvMwCX21S6Y7aK9oS7jabUkhqwH64PYTj4Le+I0Kzus1qYz6/xRntUi/1eUnck3+yGeq
 pBYYlzUUcrCIMbFICumyOJz9nEPt+LHHf8f7rgMM4eVCWQIAxenAEzk/BpGhklR7/M+J/vouVrp
 1YQUd2zg///CziE568YvZ8mkuZ7Vdgz/1EIv7hCNzhM7semvuN+rf4t2hCcuULxU9MbJvWJ2Za4
 eLwA=
X-Developer-Key: i=jhonata.poma@gmail.com; a=openpgp;
 fpr=4CCDE38C0B21F1B8FFE1B8D3F53E5306D13F312D
X-Endpoint-Received: by B4 Relay for jhonata.poma@gmail.com/default with
 auth_id=1288
X-Original-From: Jhonata Poma-Hansen <jhonata.poma@gmail.com>
Reply-To: jhonata.poma@gmail.com

A netlink dump that starts while a notification is still charged to a
socket with a small receive buffer fails with ENOBUFS, and every retry
from recvmsg() fails the same way. A reader that peeks before reading,
as libnl does, never consumes the message at the head of the queue and
spins forever. I hit this with "iw dev wlan0 scan" on an arm64 board.

Patch 1 goes back to checking sk_rcvbuf before charging the dump skb,
as before commit ae8f160e7eb2. Patch 2 adds a selftest; it fails
without patch 1 and is skipped without the privileges to create a
netns.

---
Changes in v2:
- Patch 1: check sk_rcvbuf before charging instead of retrying with
  the minimum skb size, which could still be rejected (Sashiko), and
  refuse a skb that would take sk_rmem_alloc past INT_MAX.
- Patch 1: say how the bug was found and how the fix was tested.
- Patch 2: use SO_RCVBUF 2048, which also fails with v1, check the
  NLMSG_DONE status and that a link was dumped, and skip without
  privileges (Sashiko).
- Link to v1: https://patch.msgid.link/20261023-netlink-dump-livelock-v1-0-478214a635d2@gmail.com

To: "David S. Miller" <davem@davemloft.net>
To: Eric Dumazet <edumazet@kernel.org>
To: Jakub Kicinski <kuba@kernel.org>
To: Paolo Abeni <pabeni@redhat.com>
To: Simon Horman <horms@kernel.org>
To: Kuniyuki Iwashima <kuniyu@google.com>
To: Shuah Khan <shuah@kernel.org>
Cc: netdev@vger.kernel.org
Cc: linux-kernel@vger.kernel.org
Cc: linux-kselftest@vger.kernel.org

---
Jhonata Poma-Hansen (2):
      netlink: check sk_rcvbuf before charging the dump skb
      selftests: net: netlink-dumps: start a dump with a notification queued

 net/netlink/af_netlink.c                    |   6 +-
 tools/testing/selftests/net/netlink-dumps.c | 102 ++++++++++++++++++++++++++++
 2 files changed, 107 insertions(+), 1 deletion(-)
---
base-commit: 734bef548a96e8774d6eef5dfa2026c6edc4e80b
change-id: 20261023-netlink-dump-livelock-e83cf13f977a

Best regards,
--  
Jhonata Poma-Hansen <jhonata.poma@gmail.com>


