Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=82.195.75.108
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793702521;
	b=5EckAz6lX/uFf0XOakGCclEI3StV5VUPXEJnHhbL+41tcTynfwo4Y9QlvBBZgIiwjbXi
	 skV0aJJt+rigE6hhYTw7dvJClahRDrNECBM53a4y/wYwn1wqkESQKw0nH9YQRfQLH/6P0
	 YmSMKpnrLaJZY6GO4iWwPXnZGVa37cajNZ8gfVYOFdK+Oovte7wxo37Ss+3BpCSwXlRwk
	 PTNF27TnV7k16RXAPVM0+yBBZgwKvAL80IMLbNZq1PN3ANG4K0ezaNEhwuYAs8jD+udrp
	 MUqnPIR7dYPnTEpviigiF3/8kdBN0UeUATdJw/CuUWF0QMNezKMKxeUuu/6/czcRHCA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793702521;
	h=DMARC-Filter:DKIM-Signature:Received:From:Subject:Date:Message-Id:
	 MIME-Version:Content-Type:Content-Transfer-Encoding:X-B4-Tracking:
	 X-Change-ID:To:Cc:X-Mailer:X-Developer-Signature:X-Developer-Key:
	 X-Debian-User;
	bh=VSDsUrD53VF2t98EvwwDFFjioKsd8qtnZe3AArbBIyM=;
	b=ChX88Nd9TFwW6hmXyXXy3dl9qciPNHO73o/ej1/4q5obgoDCxVCEUWziUjtd36TMWP5P
	 CUkCUbYyPPZ5rLIxClC/UhfO51iMOE3PybqCULR+T9pH4JzF+TTcJrVQyUIv1C4bSVOUu
	 6arGRdxa9ekl15liElRLWbWQImZs/ZC5rJ0Kf+iiR9CyR9ezfdkiPHAV1RjIdm3JQrl1Z
	 /ygw6kCDpBhppR8djyXg0bhA+JgRiZcnJ+uBf0PSi7uy3Jte76nFsrElTO7VkfGyKHOSQ
	 nkVuDXfNViL/CXb827WbSl5uU3gbw8qNyQqaRIz0z6YyOOimvu7BWrw6bdWxvjXfheA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=debian.org;
	spf=pass smtp.mailfrom=debian.org;
	dkim=pass header.d=debian.org header.i=@debian.org header.a=rsa-sha256 header.s=smtpauto.stravinsky header.b="Rs/A1rXE";
	arc=none smtp.remote-ip=82.195.75.108
Received: from stravinsky.debian.org (stravinsky.debian.org [82.195.75.108])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3F279606A33A;
	Tue,  3 Nov 2026 10:42:00 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 3F279606A33A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=debian.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=debian.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=debian.org header.i=@debian.org header.a=rsa-sha256 header.s=smtpauto.stravinsky header.b=Rs/A1rXE
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=debian.org;
	s=smtpauto.stravinsky; h=X-Debian-User:Cc:To:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Message-Id:Date:Subject:From:Reply-To:Content-ID:
	Content-Description:In-Reply-To:References;
	bh=VSDsUrD53VF2t98EvwwDFFjioKsd8qtnZe3AArbBIyM=; b=Rs/A1rXESEcKVlaN7cF1HsGUaT
	qX6OkhgpYXsR91gqpuBdIVjO+VRC3x/L7Nsbncg3JdOyWUvjCk04tci0TOptIozchnup97uHeNZEv
	q2RW63NDa/zICFzEGW4W555ANgkErX7Mp95693+rNKSl07dUkTx3pHE3fV6bgXjFJp58okw5pq/4Y
	cwRYl/39dNCSB7PlPyTbNMEIsSICnuJv90txY69OfkUJwR5QQR+vP3E9+x7skpHVc632axkVTIq4y
	B+DRhxL2X3IIcJvPTbuaszEt2qZFQXdwaQG6E2EGr/TGXhi17VqpL7SO3dH3Tw1pEAuB4GQBot1qr
	zhs3KKCg==;
Received: from authenticated-user
	by stravinsky.debian.org with esmtpsa (TLS1.3:ECDHE_X25519__RSA_PSS_RSAE_SHA256__AES_256_GCM:256)
	(Exim 4.96)
	(envelope-from <leitao@debian.org>)
	id 1xOBxh-006sN6-0e;
	Tue, 03 Nov 2026 10:41:54 +0000
From: Breno Leitao <leitao@debian.org>
Subject: [PATCH net-next v4 0/5] netconsole: Support messages ratelimit-ing
Date: Tue, 03 Nov 2026 02:37:45 -0800
Message-Id: <20261103-netcons_ratelimit-v4-0-b554c27ba27a@debian.org>
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
X-B4-Tracking: v=1; b=H4sIAH+56WoC/23O24rCMBSF4VcJ+7qRJK1N0qt5DxHJYasbNB2SU
 BTpu4tF0GF6veBb/wMKZsICA3tAxokKjQkG1jUMwtmlE3KKMDBQQvXCSM0T1jCmcsiu4oWuVHm
 vrBed023YamgY/GY80m0xd5Cw8oS3CvuGwZlKHfN9OZvksr9ds+JOkgtuwjaqKLU2NvxE9OTSZ
 synhZvUh7BSrBGKC47+KGK0ElWP/4j2m+jWiPZVgUZ6bazzrf5DzPP8BGs6O61DAQAA
X-Change-ID: 20260817-netcons_ratelimit-629b04a73c57
To: Andrew Lunn <andrew+netdev@lunn.ch>, 
 "David S. Miller" <davem@davemloft.net>, Jakub Kicinski <kuba@kernel.org>, 
 Paolo Abeni <pabeni@redhat.com>, Simon Horman <horms@kernel.org>, 
 Jonathan Corbet <corbet@lwn.net>, Shuah Khan <skhan@linuxfoundation.org>, 
 Shuah Khan <shuah@kernel.org>, Eric Dumazet <edumazet@kernel.org>
Cc: Randy Dunlap <rdunlap@infradead.org>, paulmck@kernel.org, 
 gustavold@gmail.com, asantostc@gmail.com, netdev@vger.kernel.org, 
 linux-kernel@vger.kernel.org, linux-doc@vger.kernel.org, 
 linux-kselftest@vger.kernel.org, Breno Leitao <leitao@debian.org>, 
 kernel-team@meta.com
X-Mailer: b4 0.17-dev-ce4c1
X-Developer-Signature: v=1; a=openpgp-sha256; l=4223; i=leitao@debian.org;
 h=from:subject:message-id; bh=iSFr3IO8ZX8tkbgj4TQ8oYkMUZWF0ooVz0A5jscI1B0=;
 b=owEBbQKS/ZANAwAIATWjk5/8eHdtAcsmYgBq6bpqkNy7rrrbt1MpB5f+ec37IsXoxfKu4IGYn
 GCq1ivl54OJAjMEAAEIAB0WIQSshTmm6PRnAspKQ5s1o5Of/Hh3bQUCaum6agAKCRA1o5Of/Hh3
 bfLlD/9ZdMq0ay4lnxg/P+cU3WSp24WjEz5O+lnuPEEAaoSWMqk5ixbnVrHe3t2JI8nQVSGgwRS
 sVVxafOPsvksO1R4Ij5sO/ctCf85UOFQW7UQKyUi5V4dEWqamsS4qzF2Ppu6G4MfKSOU9uqDTGM
 WsnqQMT6nHYkEnbzzt/RTqf4+NQC1R5zqnQKunmLt/FQ3Ne54b/V5ONd5zGJiS3lyc4Y41GID3P
 h16wFdvJKJ+lUeeJxMMBvY3HPeJdG7VVDGncEefn6oPaoFKvmsCA1gxSDIn4U03QsR4eCbP8sUp
 kkE13YE8kXKOT4R42KNI373quMPV7cWTl4liO6gQOeUE5jdOQJDrJjoAafLudj8k/khUBnTILcZ
 TG0wv/8DMoJBFg6mXgiZ8T7PzoUi9V/oTwRVAtx7gRFFt+fLDg53cmqRsqZSoIWs4wDOzzaVjN5
 igG5CPfgLbvFXxKql07R3Hqh2t2qcDvwBvUDT7HgPaSRGdyfnr+d7oQfnBx/FbTugyHsJc+Jd8v
 eHIfcL0DkGi89WavK4k5dHeSSo9RPdfEHa3dviKm0mfbUjLUC+73OwCxrskj/GGCWTenTYe9/5H
 xcNA1NAVErUGvYV9efkon4QO1r0tNSCFMKlUHil1YmS5p4mJHzPnNquSUt1Tx0tt0A8kwEn+l+F
 yZYwgd2lTMo2LDA==
X-Developer-Key: i=leitao@debian.org; a=openpgp;
 fpr=AC8539A6E8F46702CA4A439B35A3939FFC78776D
X-Debian-User: leitao

netconsole hands every console message to every enabled target, with no
bound on the rate.

At Meta, a few hosts caused some DoS and netconsd was OOM killed in
some regions, fed by 3 billion RCU messages from thousand hosts and by
a swap fault that retries forever, which logged 6 million copies of one
line on a single host in a few hours.

Both floods are being fixed where they are printed, by Paul and me for RCU
Tasks [1][2] and by me for the swap fault fix [3], but that only ever
covers the flood already found, not new issues that might be happening.

Use the ratelimit in the kernel to ratelimit messages from netconsole.

Give each target a token bucket, consulted once per message so that a
message split into several ncfrag packets is sent whole or dropped
whole.

It starts with a zero interval, which struct ratelimit_state treats as
unlimited, so nothing changes until ratelimit_interval_ms and
ratelimit_burst are written.

What the bucket discards leaves nothing on the wire. An extended target
sees the loss as a gap in the sequence number the header carries:

	7.2.0-rc7-01460-g75848acaf136,13,628,252392647,-;netconsole selftest: netcons_AGujw 1
	7.2.0-rc7-01460-g75848acaf136,13,629,252392782,-;netconsole selftest: netcons_AGujw 2
	7.2.0-rc7-01460-g75848acaf136,13,678,254742125,-;netconsole selftest: netcons_AGujw 1

Crash output is exempt. The bucket is skipped once
netconsole_kernel_dying() is true, which the first patch adds:
oops_in_progress covers panic(), TAINT_DIE covers an oops or a BUG(),
whose records only reach netconsole from the printer thread, after
oops_end() cleared the flag.

A target that has seen the kernel die stays unlimited until reboot.

[1] https://lore.kernel.org/all/anw8Qw8lfeIykski@gmail.com/
[2] https://lore.kernel.org/all/20260810-rcu_task_shrink_lruvec-v1-1-4d9f7d5251cb@debian.org/
[3] https://lore.kernel.org/all/20260813-swap-v2-0-4a625ccabdae@debian.org/

Signed-off-by: Breno Leitao <leitao@debian.org>
---
Changes in v4:
- Rebased and resend, no change at all.
- Link to v3: https://patch.msgid.link/20260914-netcons_ratelimit-v3-0-8e81b789ab37@debian.org

Changes in v3:
- New first patch, a fix that stands on its own: oops_only=1 receives
  nothing on an oops today, because the backtrace reaches netconsole
  from the printer thread, after oops_end() cleared oops_in_progress.
  It tests TAINT_DIE too, behind netconsole_kernel_dying(), which the
  bucket then reuses so that a limit cannot truncate a crash either.
  (Sashiko)
- Restart the interval when either knob is written. A target is
  configured while it floods, with the bucket already empty, and the
  new limit only applied one interval later. (Sashiko)
- Reject an interval above INT_MAX ms. msecs_to_jiffies() saturates
  below INT_MAX on 32-bit, so checking the jiffies value alone took a
  write there that a 64-bit kernel turns down. (Sashiko)
- List both files in the target parameter table, and qualify the rule
  underneath it, which says that only a disabled target can be updated.
  (Sashiko)
- Link to v2: https://patch.msgid.link/20260910-netcons_ratelimit-v2-0-ebf0dd91e26e@debian.org

Changes in v2:
- Drop the patch that sent a "N messages dropped by rate limit" notice
  to the target. (Gustavo Luiz Duarte).
- Link to v1: https://patch.msgid.link/20260818-netcons_ratelimit-v1-0-8c5d2d17789c@debian.org

---
Breno Leitao (5):
      netconsole: send the oops when oops_only is set
      netconsole: add a per-target message rate limit
      netconsole: allow configuring the rate limit interval through configfs
      netconsole: allow configuring the rate limit burst through configfs
      docs: netconsole: document rate limit feature

 Documentation/networking/netconsole.rst |  71 ++++++++++++++----
 drivers/net/netconsole.c                | 126 +++++++++++++++++++++++++++++++-
 2 files changed, 181 insertions(+), 16 deletions(-)
---
base-commit: 2637bdec0535a2044cd830eba9a79363651d9043
base-tree: git://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git master
change-id: 20260817-netcons_ratelimit-629b04a73c57

Best regards,
--  
Breno Leitao <leitao@debian.org>

