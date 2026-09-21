Received: from mail-qk2-f13.google.com (mail-qk2-f13.google.com [74.125.230.205])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B27A83C871D
	for <linux-kselftest@vger.kernel.org>; Mon, 21 Sep 2026 22:26:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.230.205
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790029578; cv=none; b=mhW+OWbQr58ukvcsciVP6gUaiolfwUG5Tc/9+vt4NXlz7pryKHz1l9iL+SbhFTNTRHbQ+DgZpq4mF/oUBo5csbh7A8Gsi1mBmlGFjvGb5XnE07Q8Hw8XjcrjDIntaosGYj21ydiGzEqSakUlMFCXFQoWqQseN+zTHJFD+x4IvV4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790029578; c=relaxed/simple;
	bh=aBLxqyZQhOgf3TAzDDSInDb/QDQQM1Qyy+q82xgwgH4=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=KKjOcemO8+l9XYmQO8hUeIPmgHZPd+3iYUrN2ivVwzvcWgM0hJldg8UxK5nku1N7JfuzVFyEfXZeEPunDzPSwlPQ5dY1CzvcW/5C3PZejw5fdVOrIbGo9OiCg9PwOoKF9CWWh5/cEU3ZZLl7ULMop47lGUGWbWgqgvp612iLjqs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=openai.com; spf=pass smtp.mailfrom=openai.com; dkim=pass (1024-bit key) header.d=openai.com header.i=@openai.com header.b=DUt7jjus; arc=none smtp.client-ip=74.125.230.205
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=openai.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=openai.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=openai.com header.i=@openai.com header.b="DUt7jjus"
Received: by mail-qk2-f13.google.com with SMTP id af79cd13be357-939656ff6d9so370673885a.1
        for <linux-kselftest@vger.kernel.org>; Mon, 21 Sep 2026 15:26:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=openai.com; s=google; t=1790029574; x=1790634374; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=kl4CFPtvedlEQovzhe8+gmEaMeiG5otby+pF0tKzS3A=;
        b=DUt7jjusJzKHbyHkfJrLE8Kitpfl3IV+gffh0uu/8x1cFwfeSXTXdtGvLT72cK6IO9
         +gsAq8lp+dFKdx+3S0E7zSs6txQ2TJfkmyDxSTKw3IJXTzDh3fTOrnbPkytD9Bw5YGxj
         /0QwtgwPirrsDRldQg89E7vuy+XmzWYoq9nss=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790029574; x=1790634374;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=kl4CFPtvedlEQovzhe8+gmEaMeiG5otby+pF0tKzS3A=;
        b=eLWrYB9HDqN2ET7BPvSKuRlprB+Qqo9ayfpyaLOePo1r70bI9NmbJUXvgF0buDwej/
         b5d75UOWVlT7Xx/wOiwExJiqm+/dAPI5K8zk30Zpha5lIK0NdCzvPw4wldU6D+MpPmsM
         N7S3QYv9XUfV8uUeqv2Rrex5MVgaE+5lwXH+/UyqHvBVH+jmsW7ZPTy25cCck83N2bJr
         73DU3fzp3waTr8jWaxy/IlDQS/Z9wx9WpM3IJYZqKHAFke/4imdiBdVxPJEcVUwN0yXp
         AG1KvDfg8Cr+vI1fs/VSLX5MQGtIwu1enkZkgmqTzK+i3EQViXVuI4LEPWIKI7NBJuXQ
         h2qA==
X-Forwarded-Encrypted: i=1; AKwUvBzU0OVSAPu23eGp3d0bTcBf+AJx72GXlyxqx/yzVf545B9wPUrkLFMITXJWbz6tXr4nhNks3Nfij7VdSNuosAs=@vger.kernel.org
X-Gm-Message-State: AFuF++mvyXb/GtjOKbrPU0vJRnWkIgyu2Wb2fcYbgFU+IhRj9mpeK3jC
	ln2PwykdzjFSENzvPMMFX30APhrycH1HXgvYt9+SHOgoxvjRBBTwgnPOwlyQUc3R6n8=
X-Gm-Gg: AYBFou0OclaUli6AHMcFGwECS1ZpDhoSjFTiocW5gV5RenO2FgfwjO0CYUVEnwux2C2
	Y6xKTB8E2DvVm0heLV7Bs2VQZpiwO1snm35WjwV7u36SDkgsyPFJOb64tf3NYyN3VaCE2FwToZK
	jRyHf8sKqf12pi6DQ6gvw69nyqSwVhLx4e2UtjRSlqH02uJ6tGoj/SQiCpkGvg6tTaJ85Nqd3j5
	lwiwZoiW7wmrNBnB8oQ//oeXjEzVaQhznT8tpZpxvI7cHN18W+FoesSIbEk40YLxl2B0V0Dx+lY
	BlY43+JKKR+GmNfqpI8JS7CppMmaOLESMl11bqT7Ubb6pr54Kc5ctgUXDtd5XIDjndTvL1feoE8
	rf7REWZtIcg5B6z1+Heth9g6Ib3WEG6/jZ/DZTIVD22osjoZI5qqVB8w8fcg1mXx+w62Q2Q5E1T
	QvlqKJSG7JDxbSABGMhwQftDza46rtz895X5kb2eJFKpn/pMjlW9mGdBdiTXs0p5iHq7MUIf0yv
	z4Qx4AW/ENwto6lJycIei0d0bqkv0CFwFJ6JEBzBXKsyhMtMDuE+ayULpCgt9A72bUwEK+UXzo=
X-Received: by 2002:a05:620a:6f0a:b0:93b:c350:a31e with SMTP id af79cd13be357-93c15e9c840mr255119485a.38.1790029574432;
        Mon, 21 Sep 2026 15:26:14 -0700 (PDT)
Received: from com-94485.corp.openai.org ([199.47.143.14])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-93c19bc6f4bsm30675085a.44.2026.09.21.15.26.12
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Mon, 21 Sep 2026 15:26:14 -0700 (PDT)
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
Subject: [PATCH net 0/2] tcp: correct timestamp echo for accepted old ACKs
Date: Mon, 21 Sep 2026 15:26:10 -0700
Message-ID: <20260921222609.50824-4-jeffjo@openai.com>
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

Patch 1 refreshes the saved timestamp while preserving the existing
validation and handshake behavior. Patch 2 adds a regression test for
IPv4, IPv6 and IPv4-mapped IPv6. A shell wrapper checks the timestamp
echo because packetdrill does not currently compare that field.

Testing on net dd47bcf279f1:
- ARM64/QEMU, normal and KASAN/UBSAN/lockdep: all 68 focused/control
  cases and three selftest address modes pass with the fix; baseline
  reproduces the stale echoes.
- ARM64 W=1 allyesconfig/allmodconfig builds and Sparse: no new diagnostics
  (patched builds incremental; existing warnings require -Wno-error).

Earlier C-socket repro on net 46bc52d13594: after 300 seconds idle, with
controlled reordering, retransmission and fq pacing, a 1 MiB transfer takes
22.02 seconds without the fix versus 0.38 seconds with it (one run per arm).

Limits: previous broad-suite timing failures and feature gaps remain
unresolved; those suites were not rerun on this base.

AI assistance: Codex generated and revised the fix, reproducers, selftest,
analysis and patch messages. The user directed the investigation, asked
for real-socket and upstream-kernel comparisons, and requested broader
testing. A separate Codex reviewer challenged the code and evidence.
Sparse supplied static analysis.

Jeff Jo (2):
  tcp: refresh TS.Recent for accepted old ACKs
  selftests: net: check timestamp echo after an old ACK

 net/ipv4/tcp_input.c                          |  7 +++
 .../selftests/net/packetdrill/Makefile        |  5 +-
 .../net/packetdrill/tcp_old_ack_ts.pkt        | 23 ++++++++
 .../net/packetdrill/tcp_old_ack_ts.sh         | 57 +++++++++++++++++++
 4 files changed, 91 insertions(+), 1 deletion(-)
 create mode 100644 tools/testing/selftests/net/packetdrill/tcp_old_ack_ts.pkt
 create mode 100755 tools/testing/selftests/net/packetdrill/tcp_old_ack_ts.sh


base-commit: dd47bcf279f1083f09bf5266890b26263361022b
-- 
2.55.0

