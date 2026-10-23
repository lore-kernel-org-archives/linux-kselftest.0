Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=100.103.45.18
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1792754770;
	b=zlX2C5V/7Z+8WgREvBMo3A4jVVurqK8yyFaF38uJit1gWHCGdiweFuv0iuYyanETJ0F9
	 HIDmvUb+YV3mns3G/X1ke3nfQQTsIDF+SD1yM8zbHmMkXPLPdn3bgFT50SLiuFxtqSMHC
	 c7rXuuGrhfxoEAGZCNRjJ0D4f5d2RsypiEAMQ8C9LNrLqw/JOZYozRqhwNo4EykEQB32c
	 qdr8mSTY+hdZgYep3VCIXaVINYPwtaqIhd/XnzcqOf+6qqFgFyjnJTqbhHLxOIWSLWzhW
	 mu1ZLtveR+hwhB3fwEuZmz9xtr2QcllrkAXSgGzw4/wvOdKqQeI8F1DuWk1EOdKqvbQ==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792754770;
	h=Received:DKIM-Signature:Received:From:Subject:Date:Message-Id:
	 MIME-Version:Content-Type:Content-Transfer-Encoding:X-B4-Tracking:
	 X-Change-ID:To:Cc:X-Mailer:X-Developer-Signature:X-Developer-Key:
	 X-Endpoint-Received:X-Original-From:Reply-To;
	bh=Hl6OwVZ5bfma7dS04u2M8Jjs+LO+1NmT4CFYhcIGnKw=;
	b=a8rOZHjxi2lXpLer+qNrjoSVBg2NcV1/YQIZ1obWBIRFHPfCEx9pgWl9+BbQ2ehBnDQK
	 ATUq0S5GMat54512t+Jh9STzjNUavDQmHY/ktN5gXqrmay2PkXmRG6dzF0U0w+80iJ7zQ
	 ay4L4sznNXmobgYnYGUGlFeqeO8VY7auzRUaJK6QK5CRGwEBnP8Sh2DS5exkuq5zZbpCl
	 tFNpGt6E4x4387BbDU8fludf9WFCtPL8QhSSPsoduNOU/GbcHmiK3eNqTJGxMciNEEI2x
	 6ssHZAzDIU2T5F9m+5E1nfSdnY+a9d3MmKJj14d1DAZOsG2YtmIZiHIpaMd5vGoCPLg==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=gn7xKKDL;
	arc=pass header.oldest-pass=0 smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9761B606A320;
	Fri, 23 Oct 2026 11:26:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=gn7xKKDL
Authentication-Results: smtp.kernel.org; arc=none smtp.remote-ip=100.80.115.77
ARC-Seal: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256; cv=none;
	t=1792754770;
	b=HAlkIuiO3pLskaN6bTRxPJUvDHrvgi2lytPezK5VrkFPIrsn+VJcVC2i+cAj1abjBEy2
	 38zbFmxKecgDy5+6fjt7y6CDsR5ytwmegwRnqJZNTRwFBKQb9hO9/A5Lbu667k+ZFFok3
	 o5lrvWALfGvedd5T3oUgHNaWV5YmRvEiANWhPDbRzyX8KfoaPBCgeYzgPreLO4fsJXRkl
	 Z1mViKCsT01PZB0g0kRIIIFuCE917nUb4GGmvIU27YzEInfQCWUdB5AVm8JJ2NK8IjwW7
	 9RaLpx1Ejwo3iqq2jT0GbevyYHt0rkYh/2pEtUhZ6wbhCeLPl3eiOVFvql3v9Cu/fRw==
ARC-Message-Signature: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256;
	c=relaxed/relaxed; t=1792754770;
	h=DKIM-Signature:Received:From:Subject:Date:Message-Id:MIME-Version:
	 Content-Type:Content-Transfer-Encoding:X-B4-Tracking:X-Change-ID:To:
	 Cc:X-Mailer:X-Developer-Signature:X-Developer-Key:X-Endpoint-Received:
	 X-Original-From:Reply-To;
	bh=Hl6OwVZ5bfma7dS04u2M8Jjs+LO+1NmT4CFYhcIGnKw=;
	b=EzjQPkKfnd9wU5fOrvhCfKjtT0JkT/godhynxe7E8CRRJRczDR74YAHNgbRZbREJSD2s
	 bONiu1N6k4r7PTE1dW7YgwxjJ5HjjlYv4de56pDKd+3cE2pgPmU10xdQ8bP8Oqe0HySTi
	 oigU0hG+y8HcQ0Yw7deNZFDQ/TIFpw6YjjWmmC3n6UUEt+11Ji1weO3RoPGirRVJ1UigG
	 iEtRwBFLmkOtA7DRRP8Vij4fhKvbhDBZlYlwyashQTE3ywZbZuPVWEHV2rGqC0zrvueZC
	 cMJ7rmXuckS74miHVTWFb7yJk3wbXEOW6fkZ2m5VGOohJFjkLCLkRAaDJ0vtZcM919w==
ARC-Authentication-Results: i=1; smtp.kernel.org; 
	arc=none smtp.remote-ip=100.80.115.77
Received: from lkml.kernel.org (nexus.subspace.kernel.org [100.80.115.77])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 2FB961F01825;
	Fri, 23 Oct 2026 11:26:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1792754770;
	bh=Hl6OwVZ5bfma7dS04u2M8Jjs+LO+1NmT4CFYhcIGnKw=;
	h=From:Subject:Date:To:Cc:Reply-To;
	b=gn7xKKDLwn8H0xl/njw3q3rdkUUI19SWcznrivux7PZgZoKvZDdkOBmbDKNRdhsNs
	 JwJJvk70yfU8y8wFwHiUpHqM71hdXJJIr8FH7st7vUlN18rxdZaK4I+bfuujqQEtvg
	 xmhIoXKoUczDIzLvXffOugu1Ja9XtF1+mGvRRSiu15WOhkZgEPMjUDeA+xQwnCWfJL
	 cron273w/+fWYbllKOBsvLOJSb38uN4hzwZjLNLNs8e09pPH6OnbRWt+2HyKsufa0c
	 mxLCUfZHn9FlrgnaFlDnkmW6k4tISYDnmsbLR8hgrYKp8JyXWBKq07zESrXKi54y6U
	 WOinIHTQwuyKg==
Received: from nexus.subspace.kernel.org (localhost [IPv6:::1])
	by lkml.kernel.org (Postfix) with ESMTP id 8837F444E3;
	Fri, 23 Oct 2026 11:26:08 +0000 (UTC)
From: Jhonata Poma-Hansen via B4 Relay <devnull+jhonata.poma.gmail.com@kernel.org>
Subject: [PATCH net 0/2] netlink: fix a dump livelock with a notification
 queued
Date: Fri, 23 Oct 2026 13:26:06 +0200
Message-Id: <20261023-netlink-dump-livelock-v1-0-478214a635d2@gmail.com>
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
X-B4-Tracking: v=1; b=H4sIAE5E22oC/yWMQQqDMBQFryJ/3Q8mgVq9SulC40v7axolUSmId
 ze2yxmY2SghChI1xUYRqyQZQwZ1Kci+2vAES5+ZdKmvqtSGA2YvYeB++UzsZYUf7cC4GeuUcXV
 VtZTbKcLJ9/e9U07o8Zdp6d6w83mkfT8A6i94qX4AAAA=
X-Change-ID: 20261023-netlink-dump-livelock-e83cf13f977a
To: "David S. Miller" <davem@davemloft.net>, 
 Eric Dumazet <edumazet@kernel.org>, Jakub Kicinski <kuba@kernel.org>, 
 Paolo Abeni <pabeni@redhat.com>, Simon Horman <horms@kernel.org>, 
 Shuah Khan <shuah@kernel.org>
Cc: netdev@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-kselftest@vger.kernel.org, Kuniyuki Iwashima <kuniyu@google.com>, 
 Jhonata Poma-Hansen <jhonata.poma@gmail.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=1647;
 i=jhonata.poma@gmail.com; h=from:subject:message-id;
 bh=UT0ToEDk7Z7G4Gj0wKFXaMDLxsm+hOMUG0sgMAFq9eI=;
 b=owGbwMvMwCX21S6Y7aK9oS7jabUkhqzbLv5Gktuebv9ufmJaWvKHSO97p1pyn3etSgnK2jQ1Y
 9WCg4+XdJSyMIhxMciKKbL4nH3cw634ccf/hzsuw8xhZQIZwsDFKQAT2fWH4Z+WKmu2XcWpknWb
 Eq3XvjvEnnXQwMrh9Y4Fvy1NDnEcjzjHyPDr4cYzvueNNZiL78YfMqrbslzMz//xhK7Eqw1fdjL
 OOcsBAA==
X-Developer-Key: i=jhonata.poma@gmail.com; a=openpgp;
 fpr=4CCDE38C0B21F1B8FFE1B8D3F53E5306D13F312D
X-Endpoint-Received: by B4 Relay for jhonata.poma@gmail.com/default with
 auth_id=1288
X-Original-From: Jhonata Poma-Hansen <jhonata.poma@gmail.com>
Reply-To: jhonata.poma@gmail.com

A netlink dump that starts while data is still charged to the reader's
socket fails with ENOBUFS when the reader's receive buffer is small,
even though a minimum size skb would fit. The dump stays marked as
running, every recvmsg() retries it, and a reader that peeks before
reading, as libnl does, spins forever.

I hit this with "iw dev wlan0 scan" on an arm64 board with a 6.6 based
kernel: iw hung at 100% CPU in 5 to 10 scans out of 15. A kprobe trace
showed the scan dump starting with the NEW_SCAN_RESULTS notification
still charged to iw's 16KiB socket, because iw had preempted the sender
before netlink_broadcast() returned.

Patch 1 retries the dump skb with the minimum size before failing.
Patch 2 adds a selftest which starts a link dump with a link
notification queued and reads it like libnl does.

Tested on net 734bef548a96 in a KVM guest: without patch 1 the new test
fails and a standalone reproducer livelocks in 3 runs out of 3; with
it, netlink-dumps passes 5 of 5 and the reproducer completes. The
existing netlink-dumps tests pass with and without the fix.

---
Jhonata Poma-Hansen (2):
      netlink: retry a dump skb that does not fit with the minimum size
      selftests: net: netlink-dumps: start a dump with a notification queued

 net/netlink/af_netlink.c                    | 11 ++++
 tools/testing/selftests/net/netlink-dumps.c | 93 +++++++++++++++++++++++++++++
 2 files changed, 104 insertions(+)
---
base-commit: 734bef548a96e8774d6eef5dfa2026c6edc4e80b
change-id: 20261023-netlink-dump-livelock-e83cf13f977a

Best regards,
--  
Jhonata Poma-Hansen <jhonata.poma@gmail.com>


