Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.208.44
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1793876667;
	b=DpFmOv2wBq200N81JH2u1LK0gwamw/EtkAvIiBG71AqqNQaEX7j6lVb3PylvdJrYtDvU
	 6MLC+PMNMyUXILAnpg9DrMhplL8UvUdizS4F4GtlweVovMl0mdz2yD+jQc3vZlL2dzw8Y
	 SyEN3/4F6gHk+xON/+fHogJvqtwqj8IedaQYnd8mNnT2uNqfAXuyPBDzmfShWMplz6nEW
	 5EO2el9RjUXpRWvO9zBqYFcZqC274RW2vAqfwBpXHgfRbokZoIXefgnk6D7Tvrvi8yeiW
	 GEOK+xExabTD/wybiVLmyGhA747C3MTvip2Q72EnSiUJMOACzDphgRxoRgBk02QjHbQ==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793876667;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Received:MIME-Version:Received:Received:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type;
	bh=ckdVqbZ+XEiDBjZjIcTqcZqx2pMHFmdH+FxX3UjOWxI=;
	b=HlXBSX9dG3j2/UIReZCOj3wGLtG7QeDKNm5FjJoA6n3nvLhEP20Ez+91v16nKH5UoU/f
	 Q9iYiWUjyfMPQ7InPGAduy1zBWJZSYMy1a/eMCng2aZLPqUua5ch2ntarA2/sSZ8Tef6D
	 qFqa66BjV3luesNIJBjxR0kMQ1ti4zr+AZmEyPJOMkyqH2tUFLJ2e3B9Agn9mKb6QvrXj
	 MQGktdY0hzZaL2x5G+Quxpbi/0Y4g4vpN9Si7h9VE0NjWYTp1Xe4zsqIODsuC+gPN7fmT
	 mobdc7/Mx1z+Go1M6ylU3ApHLn5VXAf/qAnPGpYRsKjcrHQN8mETFGDft55IGr7aStQ==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=kQOnU6vb;
	arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.208.44
Received: from mail-ed1-f44.google.com (mail-ed1-f44.google.com [209.85.208.44])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 06E05606A326
	for <linux-kselftest@vger.kernel.org>; Thu,  5 Nov 2026 11:04:26 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 06E05606A326
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=kQOnU6vb
Received: by mail-ed1-f44.google.com with SMTP id 4fb4d7f45d1cf-6b566cf56c1so1433662a12.2
        for <linux-kselftest@vger.kernel.org>; Thu, 05 Nov 2026 03:04:26 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1793876665; cv=none;
        d=google.com; s=arc-20260327;
        b=TO0CvQei7eSC9UgVouutz4vyTLj+/haENcGB28taBTcvI9MP2cOdGfHQg7pCuhsIz8
         9QeM6j9BOQERdG6IUme7yUc6sHwIKhxgTMr9rFf5BZk0+Ahu7+I9fYi9TgnrOADinvEY
         0ylVQyYdRvBwDAeCZt2eZ6v7z5j3w+uYEV1sMa7EkZ2u8/UlHUg1qp+QgFPsobtCbALh
         CifUIfzfvIjlfVyoo9VpnUt7cqJKPZ9XZnnAMnph1nmXl6VanRM3CYZCVNdntrBb9h9/
         vj7ZhwaxjY/vPq7o5sH0AWsBkoVFj6rrLiWtNz+/QIIv1jcN5ZMcYoNtZromrL/5VDod
         71ow==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:mime-version:dkim-signature;
        bh=ckdVqbZ+XEiDBjZjIcTqcZqx2pMHFmdH+FxX3UjOWxI=;
        fh=35gOuqF/srJ6/g3pstWyXr/FU64M/UJb1RGU9Cm6DTI=;
        b=UYIk+oUpA7VYf+0zXtRxq1mC2vbeFfwVi1MBdcHm1sFvxf9Me3XvEP31KCcI19sa0e
         JfcjfvGze8f55+oa/a50CQZlAx/U8CLv00BBXlk7nyENm/IXdCXCInNgt9PDh7c9dZx4
         kwlJsdCHZwWnvHkRrDRbf2m2HHTnFaNxNg1xVGKtjZx9BH/Lwwo0XNwgB8D3ddwpX9uK
         7VV1xz7jxL2zDuUkignZurgZmaEzk8TKPXkb6fVSO2SvsdRhLSY+IgWHo76Q2tSPdrSS
         5kKriPkSv6JozH8aHOwQ9ghNEK0pLL2LLffXmHoWMW2pgaqR9+jBTpJEhAUPbe4TrYUY
         IWGg==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793876665; x=1794481465; darn=vger.kernel.org;
        h=content-type:cc:to:subject:message-id:date:from:mime-version:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=ckdVqbZ+XEiDBjZjIcTqcZqx2pMHFmdH+FxX3UjOWxI=;
        b=kQOnU6vbvBlzv2wUJZDtjXRES4K22AB+2nCtRX+9Xrj9zVV7catumRxrq4w97sScb+
         D0b/k0GCpvaD2/yHptMwAWWemtEc2miD9yMmOdPGKZyoXQRWrb7rVbK3AYMZ9Rc3Jash
         KgMuYB3j70JjdeTrhGL/vU25V+8nNDgBITbzwCtnf2tErJXYLI46v62dA1BU+HGThpGN
         1G/kJTSyYfH6nbzUhhKlwieUnsmdxAu/4jcsFZbJljniPT/49bgCMotpjT5vdZc6YsYs
         hv2N69uuAr7wFzNj7MmI7Em1zZl+SqYMwevSeUFgqwJLDwbzaYuVMlfPGPxr94IdTClQ
         pmgA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793876665; x=1794481465;
        h=content-type:cc:to:subject:message-id:date:from:mime-version
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=ckdVqbZ+XEiDBjZjIcTqcZqx2pMHFmdH+FxX3UjOWxI=;
        b=W5NXQ6/BF+I5gVbuX0pylEDSoAZSWg/y+XoRyeeIAZo+rk0I+RuOVn6tvpfil/YXOs
         VKjAspZurIOOy4Cu2hzv/CAry4MLQ9XcP6b6WH1msEBzJBPK7uiZAZ5dZSA1xyO1pNB1
         jgUGUU/RaJhHR4aew5H2AZKgUiFdrQbdxsShlP5eIqQgxjSWnbzDRWGrO7kbqSnh+SJv
         IV3auEFQNcoHh8lFiBAvdRKPctwi24kSmgr2yRKifU3n72Ec2/8Y4ocoluw4b+OR8Zn0
         O+FTtsFHZz2tXNeLYYqbqTHIQStce59TrlKCsWGOWjG/F8XLEp6TjICkplsNrxL+la9J
         M4Tg==
X-Forwarded-Encrypted: i=1; AKwUvBwf3vFS1JmEEFoC7h1sAhFukb29d8qHRU/l1WMaDkatMsDAj9lAbPjR2VbcUwo/Cyx9lIj1ogIOkKYeSbk6P98=@vger.kernel.org
X-Gm-Message-State: APuU4Z/+wsrZIkONf6pRHUIeJl/zjCaqdF4bpFg1xPG/mR6KQLn5pumV
	grmqVzhnd7DeLuyX8I1mqLbxwno7FoCFXACW5Eh4JFoZFSbXUaabrZyuaTssuSfOKtRQNbWJMqH
	+qZ70ryea5M644O21Zr6I2J0WEg0X6lQ=
X-Gm-Gg: AYBFou1+uucZEDqDdBGFdTPfeE4Vdhd0xS5WAY+w6jBMeSMh9zi8KD1giS3tiBDzYz+
	1CgzWoxEbryesb1ELHH3RIHmCI4Vkuymu06KtPETfTH3iuyS3pFDqXLzxPZAeEuvzqKHL0l3eoK
	eX5RT1G6G+F+85jJyU8vtOuXU2ir+a1BdGzzvnE+yXOgKsPD8BYJ/tbcEswuvRwJsAeAj1VnqFD
	rlFZHtm1f82eCAHgdnOIJ2M3koNrTprkptmbvWiTacJx3fz5+KKx/z/tg87tjfmBf+6AnEn+ZZ8
	Q1mUX0TfHQmkxwL69sEr3eQjhX7Nq/QntbxaavkkdGYZ7vKK+rjAZc5lLoOtAXzIVpjEp208BHC
	IVc6PqUIFztVmykZEHzLnyYKY/gJ6Nv0K6gh6gXk5pD29ii8nGWBur2HV+SZbg2XMdJbpgRu66s
	iMtDtyt1HeAj+xbSG1rZ2QxQ7xD17WNamSaVqk5hzgtFOpH0qYSl8DUICnPp9aNR4CoD5W2a6QP
	0SyG3uFJJyqt5gyJA==
X-Received: by 2002:a05:6402:5007:b0:6b1:da03:d01d with SMTP id
 4fb4d7f45d1cf-6b4d553643amr14135108a12.34.1793876665167; Thu, 05 Nov 2026
 03:04:25 -0800 (PST)
Received: from 77377267392 named unknown by gmailapi.google.com with HTTPREST;
 Thu, 5 Nov 2026 03:04:23 -0800
Received: from 77377267392 named unknown by gmailapi.google.com with HTTPREST;
 Thu, 5 Nov 2026 03:04:13 -0800
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Post: <mailto:linux-kselftest@vger.kernel.org>
List-Help: <mailto:linux-kselftest+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kselftest+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Received: from 77377267392	named unknown	by gmailapi.google.com	with HTTPREST;
 Thu, 5 Nov 2026 05:59:25 -0500
Received: from 77377267392	named unknown	by gmailapi.google.com	with HTTPREST;
 Thu, 5 Nov 2026 19:57:54 +0900
From: Florin Badita-Nistor <baditaflorin@gmail.com>
Date: Thu, 5 Nov 2026 03:04:23 -0800
X-Gm-Features: AclHuK-4Nom9RDl4FW6BHaQMolk43Eurezlxzr6YWIJOrxIPsqAN2ihEbuJFFYo
Message-ID: <CADnh+D0zSzAyYCLo5cXU56o9X-P3RG3N2ix7ARPrP95d8sBXmg@mail.gmail.com>
Subject: [PATCH net 0/2] tcp: fix false exhaustion of odd-sized bind port ranges
To: netdev@vger.kernel.org
Cc: edumazet@kernel.org, ncardwell@google.com, kuniyu@google.com, 
	davem@davemloft.net, kuba@kernel.org, pabeni@redhat.com, horms@kernel.org, 
	shuah@kernel.org, linux-kernel@vger.kernel.org, 
	linux-kselftest@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

TCP and MPTCP can reject an automatic bind with EADDRINUSE while an
eligible port is still free in an odd-sized local port range. For a
three-port range with its first two ports occupied, automatic binding
always fails although explicitly binding the final port succeeds.

Patch 1 keeps the complete range length in inet_csk_find_open_port().
Patch 2 adds regression coverage for each free-port position in three-
and five-port ranges, with both lower-bound parities and all existing
protocol/IP fixture variants.

The issue was triggered while extending port-range tests with Codex
assistance, then isolated using userspace reproducers on unmodified
kernels. No kernel instrumentation or fault injection was used.
Codex assisted with analysis, reproducers, patch/test code and commit
messages. The task was to find a small networking contribution relevant
to high-concurrency workloads; the missed-port case emerged during that
investigation. An independent model review found no correctness blocker.

Built and booted the exact net base below and that base with the fix in
separate x86-64 KVM guests using the same configuration and binaries:

  New regression test: 4 failures before, 0 afterwards (8 cases).
  Full port-range suite: 4 failures before, 0 afterwards (80 cases).
  Two existing SCTP late_bind XPASS outcomes are unchanged.
  Go net.Listen with a three-port namespace range and two listeners:
    IPv4: 100/100 failures before, 0/100 afterwards.
    IPv6: 100/100 failures before, 0/100 afterwards.
  Explicitly listening on the free final port succeeds in both kernels.

Even-sized candidate sequences are unchanged. This is a correctness fix
for odd-sized ranges, without a general throughput claim.

The userspace selftests were compiled with -Wall. The boot-tested kernel
builds used W=1. The changed allocator object also compiled with W=1
under allyesconfig and allmodconfig (object builds, not full builds of
those two configurations). The baseline W=1 build emitted an existing
Synaptics input-driver format warning outside these changes; the changed
allocator object compiled without diagnostics. Both emails were sent
through a self-only transport test,
read back as raw messages and applied with git am, reproducing the exact
expected tree with preserved author identity and threading.

Florin Badita-Nistor (2):
  tcp: avoid false bind exhaustion with odd-sized port ranges
  selftests/net: cover odd-sized local port ranges with one free port

 net/ipv4/inet_connection_sock.c               |  2 -
 .../selftests/net/ip_local_port_range.c       | 67 ++++++++++++++++++-
 2 files changed, 64 insertions(+), 5 deletions(-)


base-commit: c6b41de4dd9f2d6856d8d8d292348f7961034152
-- 
2.51.0
