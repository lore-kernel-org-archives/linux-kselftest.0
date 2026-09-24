Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CB9154825B9;
	Thu, 24 Sep 2026 13:00:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790254850; cv=none; b=s40Q2zq/9qNT4pqQmDEr+eLLOpKYTGVvpvtY01mt2FfZY7WWy35/1bsdZ6LJhsWAodIIWDna3yvfJD1Q9wsrhPYFuE19KJ7s438ThNjX5GRAXw/azdLDZch/J0nTQuRF0UOFqQGk4oVNnhhskBnp056sl5E2G0EZbjlXr2uECt0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790254850; c=relaxed/simple;
	bh=Dp12ffDQvZe2JNuqrIWDdlcnmCileR+T4ECkbmUDTTo=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=IjG2UxnG6DFlK8r7tUG8gASiIfoeC57FSwdByt41Nf/CGtLr6StslNEP7NKbX5nR36wsuLOzvjj3W5EfQazLEPf93f1ia0ZATBLmpuRCdcfkgU317aRiEeUMRFzX/HFVX/IFbQC8fjzKtxKZEDSG9QEvlYwYO7SdOH72T4di+PM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=fTzpeJsv; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="fTzpeJsv"
Received: by smtp.kernel.org (Postfix) with ESMTPS id 5D6B6C2BCB3;
	Thu, 24 Sep 2026 13:00:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1790254850;
	bh=Dp12ffDQvZe2JNuqrIWDdlcnmCileR+T4ECkbmUDTTo=;
	h=From:Subject:Date:To:Cc:Reply-To:From;
	b=fTzpeJsvR7DH8skp9bvkueOY8S3D1cha2EHM9djHUzPZuTGWMiJTNmge3rzNk2hDV
	 JFcN7mwT9A9CJEkioalGbkzZDUh1tjIhqRgOoiWqLdS8O94WbS6/K/zShUsrcCMszb
	 P8zGCm9CdC1rlAmEJ0+cSQN3Rshti7oR/LwHEXpwA0stRcPdEmU7kJLy2b9eABQn7B
	 V33xBwH/wt2/0yza4IDdTBZRQdyOR0iRtYfEc0mr7mfmamTM7T39kAm5BJunw6sT14
	 Yf/Jt6b9nFEA06JPp2ColUFsEDHCI8Nmufxx2N2/BIvkmnW4k9p0yU0aX67wk0qIyq
	 RGu3OdOeFBGeg==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 48177C98317;
	Thu, 24 Sep 2026 13:00:50 +0000 (UTC)
From: Alireza Asgari via B4 Relay <devnull+alireza.asgari.net@kernel.org>
Subject: [PATCH net 0/2] Fix UDP splice checksum alignment across fragments
Date: Thu, 24 Sep 2026 13:00:23 +0000
Message-Id: <20260924-fix-udp-splice-checksum-v1-0-fe61d65447a8@asgari.net>
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAOcetWoC/02MSw4CIRBErzLptZ0gflCvYlxAT4/ghyH0YEwmc
 3dBNy6r6tWbQTgHFjh1M2R+BQljrGG96oC8jVfG0NcMWum9OuotDuGNpU8o6RGIkTzTXcoTzWD
 cbmP0gRRDfafMFf2azxB5gsuvlOJuTFNzNsxZYXTZRvKt+jO3BZblA5XUjOeiAAAA
X-Change-ID: 20260924-fix-udp-splice-checksum-7f7b53728c0e
To: "David S. Miller" <davem@davemloft.net>, 
 Eric Dumazet <edumazet@google.com>, Jakub Kicinski <kuba@kernel.org>, 
 Paolo Abeni <pabeni@redhat.com>, Simon Horman <horms@kernel.org>, 
 David Howells <dhowells@redhat.com>, Shuah Khan <shuah@kernel.org>
Cc: netdev@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-kselftest@vger.kernel.org, Alireza Asgari <alireza@asgari.net>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1790254849; l=3414;
 i=alireza@asgari.net; s=alireza-kernel; h=from:subject:message-id;
 bh=Dp12ffDQvZe2JNuqrIWDdlcnmCileR+T4ECkbmUDTTo=;
 b=tA6tvWeFe6XaDsVtaPWEplgDShCKNTRQbLNJ+PUHQig/yXCuke4r8Ju9YUr+Wy4X/zUiMuFw1
 9+4g54CkjMqDVR85dONGMklYBvP9vLP1tFjw+1Ckq+PsLIIe6Li41fw
X-Developer-Key: i=alireza@asgari.net; a=ed25519;
 pk=wuQ0/M69FqoVnrCMUJ13EQCwrCwVjCrtz75k15vW8tw=
X-Endpoint-Received: by B4 Relay for alireza@asgari.net/alireza-kernel with
 auth_id=1055
X-Original-From: Alireza Asgari <alireza@asgari.net>
Reply-To: alireza@asgari.net

When skb_splice_from_iter() appends several pipe fragments, it updates
skb->len only after the loop. The software-checksum helper nevertheless
uses that unchanged length as the checksum position for each fragment.
An odd number of bytes already appended during the call therefore gives
later fragments the wrong checksum alignment.

A standalone reproducer primes a UDP socket with sendto(MSG_MORE), splices
distinct pipe buffers, then uncorks the datagram. The send succeeds, but
the receiver drops the packet and increments its checksum-error counter.

Patch 1 passes the actual cumulative offset to the checksum helper without
changing the final length update or partial-progress handling. Patch 2
adds a loopback selftest covering IPv4, IPv6, IPv4-mapped destinations,
connected and unconnected sockets, prefixes and fragment boundaries.

Based on net/main at e47a1958e12abc3a17b5231a4f21c8f1bf662e08.
Validation on x86-64 with GCC 11.4.0:

  - Unmodified net kernel: 12 passes, 42 failures; 28 IPv4 and 14 IPv6
    checksum errors. Patched kernel: all 54 pass, zero checksum errors.
  - Ubuntu 6.8.0-138-generic reproduces the same failures. The host's
    5.15.0-187-generic kernel passes all cases.
  - Patched kernel with restricted pipe growth: 42 passes, 12 expected
    skips, no failures or checksum errors.
  - Complete small runtime kernels built and boot-tested before and after
    the fix. net/core/skbuff.o built under allmodconfig and allyesconfig.
  - Full x86-64 allmodconfig build and link completed with W=1 and
    CONFIG_WERROR disabled. The initial strict builds encountered unrelated
    warnings also reproduced on the unpatched base. No warning was emitted
    for the changed kernel object.
  - The full allyesconfig build was interrupted and I chose not to complete
    it because of the additional build time. Only the changed object has
    completed that configuration; no full allyesconfig pass is claimed.
  - Standalone and kernel-Makefile selftest builds pass. Checkpatch finds
    only the generic new-file MAINTAINERS warning for the selftest;
    existing networking/selftest ownership covers it.
  - After converting the selftest to kselftest result helpers, rebuilt it
    separately and repeated the host and before/after VM runs using the
    existing kernels, with unchanged case outcomes. Also checked mixed
    pass/skip and all-skipped runs in isolated network namespaces; the
    latter reports exactly 54 skips and exits with status 4.

AI assistance: Codex and Astra were used during investigation,
implementation, selftest development, validation, and preparation of the
submission text. I reviewed the resulting changes and take responsibility
for the submission.

---
Alireza Asgari (2):
      net: fix checksum offsets in skb_splice_from_iter()
      selftests: net: cover UDP splice checksum fragment alignment

 net/core/skbuff.c                                 |   8 +-
 tools/testing/selftests/net/.gitignore            |   1 +
 tools/testing/selftests/net/Makefile              |   1 +
 tools/testing/selftests/net/udp_splice_checksum.c | 378 ++++++++++++++++++++++
 4 files changed, 385 insertions(+), 3 deletions(-)
---
base-commit: e47a1958e12abc3a17b5231a4f21c8f1bf662e08
change-id: 20260924-fix-udp-splice-checksum-7f7b53728c0e

Best regards,
--  
Alireza Asgari <alireza@asgari.net>


