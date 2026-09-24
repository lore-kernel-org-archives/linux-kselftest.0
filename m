Received: from mail-qk2-f12.google.com (mail-qk2-f12.google.com [74.125.230.204])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1605A457E7A
	for <linux-kselftest@vger.kernel.org>; Thu, 24 Sep 2026 22:45:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.230.204
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790289910; cv=none; b=PUJ0ZBagsgsM3AeZ6Odxfkfp6EG5s+LD6GA0s4vGS+bfMD+PD9JSS6DIg4RltUMLKn6+LeoML/Y2Q170FhWyti97iZlcY/8qb17vVwRUf0jXyzBAeRJQCDLoZur37182fVjyfFw7lptsD1Ep24WZOZD86UWl6ZFXP1hy+Pdzg/M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790289910; c=relaxed/simple;
	bh=N3ArG0FtVdhqv3LvSvrNCF+6nzhiFEZAYFGg2uDLeJI=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=f0Ic2Di+lVsWeebfDNr9cZ9xFZGfXeTOopz1BkT/GOBs3UBPugizDTHdqmSJ0kFoe0oXzGDppH7wkb4MZ9trNKTj9eB7ve6MND6rPWD+2iz2PfDwyY6ZWAAj2USvwGJycyCJl/LqhJwmxVs5qnlrWArnz/49N9Knyz89r2epL8I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=openai.com; spf=pass smtp.mailfrom=openai.com; dkim=pass (1024-bit key) header.d=openai.com header.i=@openai.com header.b=Kau4Kyqb; arc=none smtp.client-ip=74.125.230.204
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=openai.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=openai.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=openai.com header.i=@openai.com header.b="Kau4Kyqb"
Received: by mail-qk2-f12.google.com with SMTP id d75a77b69052e-530c602630bso4132141cf.3
        for <linux-kselftest@vger.kernel.org>; Thu, 24 Sep 2026 15:45:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=openai.com; s=google; t=1790289907; x=1790894707; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=th0F4bTG9L9yRKCDhmCjjQ66FZz/ksySg4oF2oEn74w=;
        b=Kau4Kyqboz2OTBPqol0k92U3VpSIUbdRi+KUUrTvBTWN7snFfp/yB9CG8ZmavQg/sa
         SKQyJQ2BK6GdLlxiamxSTP9S23zBTwRpwKh7rh6YKUn7xIusIkKWpBMmC72OpCA1rfyM
         tmC+3DPjxe8j3O5Ua+kckDZI/Mjth9pTBkewg=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790289907; x=1790894707;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=th0F4bTG9L9yRKCDhmCjjQ66FZz/ksySg4oF2oEn74w=;
        b=q5P5/jEYyTrkYYG/YDe3Z2xD+u/oLh7Y3dGnUFWRkbDvdtOgbmkbSLlzIm5hQCbE0+
         TKoO6ECFDg8FlOUgVtgzWkIjRWZgr2RSnoWp37kBSxz42vWiM+PR4xPhA7vN75AQEHDr
         nOiBCBppqXyhEp2okS6zgnmoWj0fMURPj7mKSZPVmKpzqj8Eo0+G4R1Tg0Wo8VMKjFLI
         h1K8m1VniC4jzNimWLfBWkX3WNduRrNOmorfOJz/lP1cRpE0L8DE2x4ScEHrElugzuNH
         fHZIX4ETu1X9uiI563Xg0zb2768K+JEbxjQ628bFMAcVipjP9rZPeqQlxA9ZenCUieul
         QwVw==
X-Forwarded-Encrypted: i=1; AKwUvBxHEzRubvmkVm8FPGitYVInwkFufwSizkKj2pGiPq6KtClOytBQh/vIouvPO52n7DmzXbFOaowj+xMQ6R0yOLE=@vger.kernel.org
X-Gm-Message-State: AFuF++kU0Uc3/lfX7uq0ZO6xdVO59NxCu+9CCm3/yrDcBq8fsJyZRE/T
	WlJYoUt5LKw8bi+OULzzfokVyItXFxPp3fMv4/1GFzNOl9gWqRAjti3DFmgM3OkSJk0=
X-Gm-Gg: AYBFou0SCHYFo1OhVoVK+66KJY9+w5/keVAjZtqPN57g74Fb4mnvucF2iCJklRLIblA
	KZL8/o0tJqUgq/ZFVUODEmkCbwaCOvnMlbn4dbWxFPdXY62N2JgsiRYJ2S56OyGLqR7NFAMl2M5
	qiIxo9Pz80g1cBACMphMJImvUyBaiy3dyKAbWh79FVgHbJJ/CYRfa2eZrkE8+zz6GRIUhyaGorK
	3GpFlJA4QKiLayH2IHPcWUBn261NF2I05+DwtCC4kYtFHL2B/IAjgnq7yXjU+JMbimlO5bOrPKj
	/ontJI5RCiaisc1URvOgEGRlbG4U2mG6bTaNo9i3ixXrT1JI10fIsx2jkbV9DyCXa764ehhBe1Z
	CIbuVCQg7gg77Y/XDUG+5zcvEAbQ+s2sBRXb/h4iyZqpYBw9IKD3Bcikh+ZLvBv0zKbQnetot58
	rA7Tln1+dqoPyiZYCpX2/M03oST7+wNxv0DysECSVX8AyoKZINklbw2uAe5a4J82KweYH/SaoLy
	CHULWLMyuLCSGbeEfHvetS81xjuIYAwql7gm4IBUnu6XPdc6QoqKTwDz9sH2+yPdAr6/kPWqLo=
X-Received: by 2002:ad4:5948:0:b0:912:517b:40e7 with SMTP id 6a1803df08f44-9142f930e42mr13421266d6.46.1790289906813;
        Thu, 24 Sep 2026 15:45:06 -0700 (PDT)
Received: from com-94485.corp.openai.org ([199.47.143.14])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-91430e09ce4sm3858566d6.28.2026.09.24.15.45.05
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Thu, 24 Sep 2026 15:45:06 -0700 (PDT)
From: Jeff Jo <jeffjo@openai.com>
To: netdev@vger.kernel.org
Cc: edumazet@google.com,
	ncardwell@google.com,
	kuniyu@google.com,
	davem@davemloft.net,
	kuba@kernel.org,
	pabeni@redhat.com,
	horms@kernel.org,
	shuah@kernel.org,
	linux-kernel@vger.kernel.org,
	linux-kselftest@vger.kernel.org
Subject: [PATCH net v2 0/2] tcp: correct timestamp echo for accepted old ACKs
Date: Thu, 24 Sep 2026 15:44:57 -0700
Message-ID: <20260924224456.55690-4-jeffjo@openai.com>
X-Mailer: git-send-email 2.55.0
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Linux can acknowledge newly received data while echoing an outdated
TCP timestamp. This happens when a reordered packet fills a receive gap
but carries an older acknowledgment for traffic in the other direction.
If the sender uses this echo to measure round-trip time after a long idle
period, the stale timestamp can inflate its estimate and slow its sending.

Changes in v2, following Eric Dumazet's review:
- Remove the redundant SYN_RECV condition and unused flag accumulation.
- Replace the log-parsing wrapper with a plain packetdrill test that checks
  the timestamp echo directly, using the existing selftest runner.
- Rebase on net fc6d80eb5044.

v1: https://lore.kernel.org/netdev/20260921222609.50824-4-jeffjo@openai.com/

In this example, S sends the reordered data and R is the Linux receiver
being patched. All packets shown belong to the same TCP connection, with
overlapping requests in both directions. Each illustrated request fits in
one TCP packet; request/response names describe application
messages, while ACK numbers acknowledge TCP bytes. The numbers are
illustrative: TS and echo use S's millisecond clock, and byte numbers are
relative to the first post-idle byte in each direction. ACK=N acknowledges
bytes before N.

  Before idle:
    S -> R: sender request 1, TS=999
    R -> S: response to sender request 1, echo=999
    S -> R: TCP ACK, TS=1000             (R saves timestamp 1000)

                   ... 300 seconds idle ...

  After idle (byte ranges include both ends):
    S -> R: sender request 2, bytes 1-17, ACK=1, TS=301000
            (delayed in the network)
    R -> S: receiver request 1, bytes 1-17, ACK=1
            (initiated by R while sender request 2 is still in flight)
    S -> R: sender request 3, bytes 18-34, ACK=18, TS=301005
            (arrives before sender request 2)
    R -> S: TCP ACK=1, SACK for sender request 3, echo=1000
    S -> R: original sender request 2 arrives, still ACK=1, TS=301000
    R -> S: TCP ACK=35, echo=1000 (bug) or echo=301000 (fixed)

R initiates receiver request 1 while sender request 2 is still in flight;
its ACK=1 means it has not received sender request 2. S receives R's
request before sending sender request 3, so that packet carries ACK=18.
Sender request 3 reaches R first, making sender request 2's ACK=1 old.
The earlier ACK with SACK correctly echoes 1000 while the gap is open.
The bug is retaining 1000 in ACK=35 after the gap closes, instead of
echoing sender request 2's timestamp, 301000.

If S falls back to timestamp-based RTT measurement for ACK=35, subtracting
echo=1000 from its current timestamp (about 301000) produces a roughly
300-second RTT sample, mistakenly counting the idle period. The inflated
smoothed RTT lowers the sender's calculated pacing rate and, when pacing
is enforced, unnecessarily delays outgoing packets and slows the transfer.

Patch 1 refreshes the saved timestamp while preserving existing validation.
Patch 2 checks that the ACK closing the receive gap echoes timestamp
301000, in IPv4, IPv6 and IPv4-mapped IPv6. It requires packetdrill's merged
TSecr verification fix, commit 83f72d3f9085, linked below. Once CI uses a
packetdrill version containing that fix, the timestamp assertion will
reject the stale echo on an unfixed kernel and pass with this kernel fix.
Older packetdrill versions ignore the comparison and incorrectly pass both.

https://github.com/google/packetdrill/commit/83f72d3f9085d0e26eb4d206fe4d7cfab5b6d872

V1 passed 68 focused/control cases on normal and KASAN/UBSAN/lockdep
ARM64 kernels, with no new diagnostics from W=1 allyesconfig/allmodconfig
builds or Sparse. V2 passed the same checks with equivalent results.

Earlier C-socket repro on net 46bc52d13594: after 300 seconds idle, with
controlled reordering, retransmission and fq pacing, a 1 MiB transfer takes
22.02 seconds without the fix versus 0.38 seconds with it (one run per arm).

AI assistance: Codex generated and revised the fix, reproducers, selftest,
analysis and patch messages. The user directed the investigation, asked
for real-socket and upstream-kernel comparisons, and requested broader
testing. A separate Codex reviewer challenged the v1 code and evidence.
Sparse supplied static analysis.

Jeff Jo (2):
  tcp: refresh TS.Recent for accepted old ACKs
  selftests: net: check timestamp echo after an old ACK

 net/ipv4/tcp_input.c                          |  6 +++++
 .../net/packetdrill/tcp_old_ack_ts.pkt        | 22 +++++++++++++++++++
 2 files changed, 28 insertions(+)
 create mode 100644 tools/testing/selftests/net/packetdrill/tcp_old_ack_ts.pkt


base-commit: fc6d80eb504458d6416b75a94188b268c95c6533
-- 
2.55.0

