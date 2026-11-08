Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=100.103.45.18
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1794148796;
	b=GePeFijHVKvAFXXJhQ6PSna43bawr3mYwjLUur0BigEk4GbEbckzPNC6A/aPtQrvXtCD
	 UfaFbwRhbIrDB9iizb9lqg6+k9bj4yHDZ5Peiy6JRcsFMjMerSHEq9L6+QljUZTbQo6ps
	 +Ct0teLdyU6lHVRHn5Orxfll9Sl2lQ9Bz6Kl7R5Ir2JIQhTbyiLBaVtaq3wrzSOTu1R+s
	 UGB0LKkG5EpmBEn0Im9nb+QVMmVMIFSfD2gSsY1ItcAlVM4eS1Em8rfUKT4RxVCayruU/
	 KrWyPLwZJCI/ouFU5/02wQnJmpMnUg4MkM7KSeqHtZ6Ea03ZgzG4TikW2tAk83N3+HQ==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794148796;
	h=Received:DKIM-Signature:Received:From:Subject:Date:Message-Id:
	 MIME-Version:Content-Type:Content-Transfer-Encoding:X-B4-Tracking:
	 X-Change-ID:To:Cc:X-Mailer:X-Developer-Signature:X-Developer-Key:
	 X-Endpoint-Received:X-Original-From:Reply-To;
	bh=umoo2Lp9rUq60YFsX4JKM8uqEu+Er3Yh7U0wKuiM0Qk=;
	b=cboiNzR09Y4D9hwglDfjqoWWHvgQ+3b25kLp4+/ec7taqhuF7nuWBEL903PkiJuqgyCw
	 T4RPvnz+wB0Q03d1d2WA9W7hHKvajsMMxU1qhRVqcE7gd7XAyBfseByE2UE448lClCChl
	 wIn4grcvh/ARFQfI3iSyg0z7hLr02uxNokKrcQ10tahrvLhnL5OmxA4KroBCiGHy0dkOx
	 vzs7w37e9R4CUqGLvLfJvRaFLjYxg2xDRVEET2MjMqqT3G+4WoOwoiby7owEtTGIn7Nf+
	 8vtSUEl4AFBwFZ0zDkGwmZpCflEidABaoOfgxHFvkKjeUXkIhgEmgL2mo9DjllYbZ3A==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=hfpG0vNe;
	arc=pass header.oldest-pass=0 smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B2C7A606A338;
	Sun,  8 Nov 2026 14:39:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=hfpG0vNe
Authentication-Results: smtp.kernel.org; arc=none smtp.remote-ip=100.80.115.77
ARC-Seal: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256; cv=none;
	t=1794148795;
	b=CQUzYCzE7DqCq9BTNj6kch5R5SBMntyR3d2Gmd9qbFyafa6CNlKROKJihfO3Y8uaff87
	 ydr6feGKOsXD+Wt2bE+rCx2SIu3dhvIPAZ58vRKNd5XVxACdD97Zu8U6KEd2Uwm5CZmVL
	 g0V3E71kYt59Ie0PyE9UCq2aTUyhWt4cZxthaE+jV2HBOkLoXWWFZ94bSggzXRI8STSTY
	 0kIoKnkdSBsMRvFuJszkl71nQhDgTV6LTt/DWUp2ebLSrKmlr2IBhTjeeBpOuyRKxyf/Y
	 tLH0Rj3RX/W/yGNFdU/kzrM4h0+km6H12QmL2rJzFFscN+HAxXMNJFSFM0XWS9Uf1Pg==
ARC-Message-Signature: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256;
	c=relaxed/relaxed; t=1794148795;
	h=DKIM-Signature:Received:From:Subject:Date:Message-Id:MIME-Version:
	 Content-Type:Content-Transfer-Encoding:X-B4-Tracking:X-Change-ID:To:
	 Cc:X-Mailer:X-Developer-Signature:X-Developer-Key:X-Endpoint-Received:
	 X-Original-From:Reply-To;
	bh=umoo2Lp9rUq60YFsX4JKM8uqEu+Er3Yh7U0wKuiM0Qk=;
	b=AOQMJAfpAFjW9ZIZw1rD6Qa1Flba+L9zbi/94DOnVysC37BCyaYYcBMOCi26FTmKdfVN
	 BboFcZMHXYa0baoq8jQsEDAdYrToGIGIQ8fLooSQ9NYd6ad6zHFVhPBovbrJvWDgSj06Z
	 wb8ODqmIkLBwWpKCRjwky3Qi8qcrQVBS8mPGGujJLmJR+1WbJ0RszJLXnMsnAPnKriCHK
	 E9seTA7wsZp/d82r278UZ38xem94dsBYBArnB+ycA5I+KDT7V2MH0puMoFr3I0Q1CEFSV
	 dRpTodFP7kMrB93mteyWk248PyR9pvBcc6uSP0qSc2iWoz5QjR6HTjMs4po1LoUw89w==
ARC-Authentication-Results: i=1; smtp.kernel.org; 
	arc=none smtp.remote-ip=100.80.115.77
Received: from lkml.kernel.org (nexus.subspace.kernel.org [100.80.115.77])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 15F6D1F008A7;
	Sun,  8 Nov 2026 14:39:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794148795;
	bh=umoo2Lp9rUq60YFsX4JKM8uqEu+Er3Yh7U0wKuiM0Qk=;
	h=From:Subject:Date:To:Cc:Reply-To;
	b=hfpG0vNe+S9Jx5aSw0hBg7p88/9121tNdvVQyRvsmB7Xl6CKxH5Yuu29V8fUvlSDs
	 n50onqQE5IfUtKngr0kLN3FModgseTU5BiDCu8ylHxM7VxyYY0kA+O4yzHBqjoo9CU
	 bUZI0oYCjTuwbbLms/EaS0OLlclItp8qR57WVFMYh+dXuf28s/kxeaN0A8dD2UZ6uY
	 EK2uiVWx6+FiionQYsBKE+vtIZ+mKg8LUk4BufcaHCXvX5yloqugjBvT9HriyTWvRA
	 5NXhgw0jpYBTD7LrUSGTM6kdbhaewo9/UtISxxbTG2jm9s517R/2bmOPmYObntq8zG
	 yZQ781u8AZ5lQ==
Received: from nexus.subspace.kernel.org (localhost [IPv6:::1])
	by lkml.kernel.org (Postfix) with ESMTP id 6039B47FB7;
	Sun,  8 Nov 2026 14:39:53 +0000 (UTC)
From: Yongjian Wang via B4 Relay <devnull+echoowall.gmail.com@kernel.org>
Subject: [PATCH net-next v2 0/4] tcp: fix tcp_base_mss on passive
 connections and test MTU probing
Date: Sun, 08 Nov 2026 22:39:50 +0800
Message-Id: <20261108-mtu-probing-series-v2-0-355d6490c3db@gmail.com>
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
X-B4-Tracking: v=1; b=H4sIALaJ8GoC/32NzQ6CMBCEX4Xs2TVtiQKefA/DoYUF1khL2kIwh
 HeXn7vHycw33wKBPFOAR7KAp4kDO7sFdUmg6rRtCbneMiih7lKKFPs44uCdYdviyaLOM5MWTW2
 obmADB08Nz8fpCyxFtDRHKM8mjOZNVdw/923HITr/PfyTPIh/qkmiQK1yUVCmblrrZ9tr/lwr1
 0O5rusP5Xx3w9AAAAA=
X-Change-ID: 20261103-mtu-probing-series-a87b39fdbedf
To: davem@davemloft.net, pabeni@redhat.com, ncardwell@google.com, 
 horms@kernel.org, kuba@kernel.org, kuniyu@google.com, shuah@kernel.org, 
 edumazet@kernel.org
Cc: linux-kselftest@vger.kernel.org, linux-kernel@vger.kernel.org, 
 panweiping3@gmail.com, netdev@vger.kernel.org, 
 Yongjian Wang <echoowall@gmail.com>
X-Mailer: b4 0.16.0
X-Developer-Signature: v=1; a=ed25519-sha256; t=1794148792; l=1935;
 i=echoowall@gmail.com; s=20261026; h=from:subject:message-id;
 bh=19c4Gk3Gwmmdf6hcqazZwt4ILAXYtGIkiZQuAikm1yE=;
 b=lsncIAFuU5jy3vx7rFvzCCDrgzTHmMBJXO9pb8CuTOJIbro6eZmufAC0uCoBMgQMAujaU2d0m
 AhkcMvtSmitAqXR5SheoluhamBWjXdtlJYOE25fEXTuQJY3BI+yU6T+
X-Developer-Key: i=echoowall@gmail.com; a=ed25519;
 pk=9XP6JhqjjPsHCF6UZZZTeqTRnXIa4+ufggnxXtTJ+no=
X-Endpoint-Received: by B4 Relay for echoowall@gmail.com/20261026 with
 auth_id=1323
X-Original-From: Yongjian Wang <echoowall@gmail.com>
Reply-To: echoowall@gmail.com

With tcp_mtu_probing=2, passive TCP connections can start at the full
MSS because they sync MSS before initializing MTU probing. Patch 1
moves initialization next to the existing MSS sync in the passive
paths and in the active SYN-ACK path. Patch 2 adds a regression test.

Patches 3 and 4 add coverage for black hole detection and the MTU
search on active connections.

Tested on x86_64 KVM with all 496 packetdrill cases passing, plus
targeted checks for simultaneous open and Fast Open with MTU probing
enabled. The three affected TCP objects also build with W=1 under
allyesconfig and allmodconfig.

---
Changes in v2:
- Move tcp_mtup_init() before the existing MSS sync in IPv4 and IPv6
  passive opens and in the active SYN-ACK path. Remove the late
  initialization from tcp_init_transfer() (Kuniyuki and Neal).
- Keep the three packetdrill patches unchanged.
- Link to v1: https://lore.kernel.org/netdev/20261103-mtu-probing-series-v1-0-a2809e725aaa@gmail.com/

---
Yongjian Wang (4):
      tcp: initialize MTU probing before syncing MSS at connection setup
      selftests/net: packetdrill: test tcp_base_mss on passive connections
      selftests/net: packetdrill: add TCP black hole detection test
      selftests/net: packetdrill: add TCP MTU probing test

 net/ipv4/tcp_input.c                               |  2 +-
 net/ipv4/tcp_ipv4.c                                |  1 +
 net/ipv6/tcp_ipv6.c                                |  1 +
 .../net/packetdrill/tcp_mtu_probing_blackhole.pkt  | 37 +++++++++++++++++++
 .../net/packetdrill/tcp_mtu_probing_passive.pkt    | 27 ++++++++++++++
 .../net/packetdrill/tcp_mtu_probing_search.pkt     | 43 ++++++++++++++++++++++
 6 files changed, 110 insertions(+), 1 deletion(-)
---
base-commit: fa5196392691051963726787944db872420dfa75
change-id: 20261103-mtu-probing-series-a87b39fdbedf

Best regards,
--  
Yongjian Wang <echoowall@gmail.com>


