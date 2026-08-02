Received: from mail-wr1-f41.google.com (mail-wr1-f41.google.com [209.85.221.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0B867311973
	for <linux-kselftest@vger.kernel.org>; Sun,  2 Aug 2026 20:25:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785702310; cv=none; b=FqKTpl5YJmLulL9wmltK0BEFPLKaoa/uWXb8vP8E2YDvIC4W7x5drxXZhX1pvb0wN8gHp7aduQvDn0V4D3Z2u4EV5+kUOtGyCXKL2AvpF4Ka6J3gvtUuvTN0kr0CTmbwr1ok6xiM4Vtb77zXH8mmeLqtWwuPItSS0pmhPohMSro=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785702310; c=relaxed/simple;
	bh=+QqG82HTr1gD1Wo/F1BUi4MNI6MZZMgjFyonBzjlVD8=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=VfFiV0tXDX9V/0JRuc2neV3xeEeQvIVpgiKxBg7t0PpMdLjXnqzVJ2VnJ0UXiMaLqpwC+2TifAfjrqeg+Tsal2vLPqp0XFjtLkIfMShU/WzMsodaVPx5rUZFe0rGrYc8Z9qCqMnutcEVZBd6Rc3Usu/ply+pDWQatSYXmEOdy2w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=TKyQeHEV; arc=none smtp.client-ip=209.85.221.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="TKyQeHEV"
Received: by mail-wr1-f41.google.com with SMTP id ffacd0b85a97d-47fe45db360so2986f8f.2
        for <linux-kselftest@vger.kernel.org>; Sun, 02 Aug 2026 13:25:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1785702307; x=1786307107; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=rZMIgVcvE7FnWcucx12joSA06YbiyH69EY/cN15w71Y=;
        b=TKyQeHEVAcYD14/k/6i+/N+d+xRryGP1/RGw5BBz7eu+DTlApvNLWfjj/pEbZAlWCw
         bV+DqRJSRhphN/lxjCSaMY1srsPhytiuLnjLgvamOd44mvGUSzMrjRO0jtx5K8m/OYey
         6uWB+HB1+J3BvPhzeR6ypUXrUXjsPr4h2bejroK9jkgLJbzTM1ICt0CAfcuuk+01dfU1
         mtr3PTRq7Cf5eEFrTOZ6niDI11NHAtK8XLlQcdU9C0tIWEL62Ksn8S+cmlezajnG0CY+
         c8dT1MMXiZwPPQszxfgqHAaoxIzrf6LGSZG6I8JPUsSPwlgT3JPODIh6lo705yiPTgmv
         y4qQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785702307; x=1786307107;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=rZMIgVcvE7FnWcucx12joSA06YbiyH69EY/cN15w71Y=;
        b=K4ZVKH3smKpXGAWvPzqiEOyeAwW1LT9TOx98V7zfGpR3JFkKL9VRI+6Zl5W5eaN18Y
         UJ8Ej8UgoohIm7KsNn6SiQAcovTVv/fosUyOzQgMXdOaw5wC2yYpw7flbqHTjPpD6aLn
         dOUjukCNhUjsM0Bt+vvPF+H/ZEHvLS1UmVbnjBbk8cJPxu0KSUaVRxqlGTcoSQ1tlwwT
         GVGdRdAwQ8wr+jnb+gZrVKlzN6E3cKLQhwrZuCc/DoIRNxI0vKQGfUxTxDp6Sx1Orcev
         ZuK77h0PKzWkkUfGU+PISZ+Eu4vrtzVUeD+ZZij4WbaMiLTnJ/ZOvHh1BA4eHKd+TuXT
         Jstw==
X-Forwarded-Encrypted: i=1; AHgh+RohKTEkxWUqU/YBYiS6TR3FrzNClxz0vqaeGi2Cg9wpVMlCgWNvqOZeITaWvVn5r7j+qa1ihyYgV0HRaPbggms=@vger.kernel.org
X-Gm-Message-State: AOJu0Yzk4USV0qfbBvaoURmflf9I0OWp5QjSa4ozvLlUNaoIfDzLx1Yv
	kgrB8CVXmtBJfMINcedQwufSeHbZ6sklx5d4SXjiBOdRZjJzmvbGzcW3
X-Gm-Gg: AR+sD10GUaa4byPwKdn9XuYRiYwY4r5qIMDz3dwWXJ5dOF0VYJZKUdaEh8xsQl79M+7
	yYuKzyO6reP8X4umNJfydsxB2g1wUSmnVfarXPRS2C6siW1wkTR043zhse75WvTLIR/STM5ryU+
	8aGvvwsoI8mE5hCN3Q3Fl5UXNMZWpvmffexuq1PqQPfhyKicLqiJ2uOiSyr6z0IOpb4yoiqAeNk
	uyo/XKwMGU8M36qDuUCkMNoCRhlN4iYmlJ4i1qNkOTvETGAUOFeZ4CbvXwmryAgUucUYFDwITCP
	uc+dYDnxbxAyQFiFvDHI1tKmRd394DN1gaiBexfM3pNMU/qaX2aFPra5buazC5rZnvWyhbNGauT
	5hKxS4L78i8Tb/puEOiVSVA4Q0ub1GKFQwQVPemZnx2kmemEr/FMUoTF7Y53bdYSOCKBX5En0XX
	51/ZFRMOIi1KFkeu60Y/rn4d4DXs5wu77+xzaMxDVes2aO02005wEy6eTTDByoNqekMoTaaOSOd
	deUbAGTfBza1lxV6qAlegzYJUrvA40yB8uXhUPeAj2+sBbDbEEt3Pk0WaEzXRMP6Z4+0HDxriqu
	sCAXiYVSVtAwDLK9MMM2Uni2epQA+70=
X-Received: by 2002:a05:600c:4687:b0:495:650b:4c61 with SMTP id 5b1f17b1804b1-4980c68e3f1mr80054415e9.3.1785702306979;
        Sun, 02 Aug 2026 13:25:06 -0700 (PDT)
Received: from L-022584.energy.envision.com (dynamic-078-051-143-142.78.51.pool.telefonica.de. [78.51.143.142])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49807b23f6fsm132234365e9.0.2026.08.02.13.25.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 02 Aug 2026 13:25:06 -0700 (PDT)
From: Xin Xie <xiexinet@gmail.com>
To: davem@davemloft.net,
	kuba@kernel.org,
	pabeni@redhat.com
Cc: edumazet@google.com,
	horms@kernel.org,
	shuah@kernel.org,
	lukma@denx.de,
	m-karicheri2@ti.com,
	fmaurer@redhat.com,
	luka.gejak@linux.dev,
	bigeasy@linutronix.de,
	ali@iusegentoo.com,
	netdev@vger.kernel.org,
	linux-kselftest@vger.kernel.org,
	Xin Xie <xiexinet@gmail.com>
Subject: [PATCH net v2 0/3] net: hsr: fix shared-skb mutations in the forwarding path
Date: Sun,  2 Aug 2026 22:25:01 +0200
Message-ID: <20260802202504.2962-1-xiexinet@gmail.com>
X-Mailer: git-send-email 2.47.3
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

During the review of the PRP RedBox v4 series (Simon Horman forwarding
the sashiko AI review), shared-skb-data mutation issues in the
existing HSR/PRP forwarding code were raised. They concern
pre-existing code, and we promised independent fixes for net. An
independent source audit then confirmed two distinct defect classes.
This series fixes both.

Patch 1/3 (interlink address mutations): on an HSR RedBox, frames
forwarded to the interlink arrive in hsr_xmit() as clones of a shared
skb. A tagged multicast or broadcast from a slave is also delivered
to the master through another clone of the same buffer, so the node
MAC written by hsr_deliver_master() and the RedBox MAC written by
hsr_xmit() land in the same six bytes; the local stack receives the
RedBox MAC instead of the originating node's. Master-originated
frames alias the original TX skb (taps may hold it), so the
master-origin substitutions and the RedBox rewrite would share data
too. The interlink-bound skb is now privatized with skb_cow() before
any address mutation: for all master-originated frames, and for ring
frames the master also consumes. On the hardware tag-insertion path,
the selected master-originated and locally consumed ring frames are
now isolated before the interlink address write. Ring frames the
master does not consume retain their existing zero-copy behavior and
pre-existing aliases; the pre-existing slave-side packet-tap alias is
explicitly not addressed here.

Patch 2/3 (path/LAN ID alias): hsr_create_tagged_frame() and
prp_create_tagged_frame() wrote the path/LAN ID into the received
skb's shared buffer and then skb_clone()d it per slave, so the
second slave's ID landed in the first slave's still-queued clone.
With a 200 ms netem delay, all 200 injected frames left slave A
carrying slave B's LAN ID. The helpers now clone first, privatize
with skb_cow(), reacquire the pointer, then write.

Patch 3/3 adds a regression selftest covering both classes:
pre-tagged PRP injection (base: 200/200 wrong-lan; patched:
isolated) and an HSR RedBox tagged-multicast case (base: the master
receives the RedBox MAC; patched: the master keeps the node MAC and
the interlink keeps the RedBox MAC).

Each code patch carries its own independently identified Fixes:
commit (5055cccfc2d1, RedBox introduction, v6.10; 451d8123f897, PRP
support, v5.9). The PRP RedBox v4 feature series is unaffected and
benefits when rebased.

Relationship with the in-flight GRO/GSO series ("net: hsr: fix
GRO/GSO super-packet handling", currently at v3,
https://lore.kernel.org/all/20260731090224.18-1-xiexinet@gmail.com/):
both series touch net/hsr/hsr_forward.c and the HSR selftest
Makefile; they verify as independent - full series applied in both
orders on current net (and the v2 selftest Makefile entry merges
with GRO's at their respective sorted positions); no textual or
semantic dependency.

Apply note: on net the series applies cleanly with plain git am. On
net-next, which already contains hsr_prp_redbox.sh in the HSR
selftest Makefile, the Makefile hunk of patch 3 needs git am's
three-way fallback (git am -3); the automatic merge inserts
hsr_shared_mutation.sh at its sorted position and the merged result
passes the upstream Makefile format validation.

Validation:

- both shared-skb mutation tests: the frozen v2 script (SHA-256
  9096d2c9050b052bc0355bce969fdea248382c90d92103f17b5e3cc32102a852),
  which differs from v1 only by the behavior-preserving CI edits
  listed in the changelog, failed on the base kernel and passed on the
  patched kernel
- independently reproduced and tagged on the v1 thread by Ali Ahmet
  Memis (Tested-by on the series, Reviewed-by on both code patches)

Changelog:

v1 -> v2 (patches 1/3 and 2/3 C payloads and technical descriptions
unchanged; identical patch-ids):
- carried trailers from the v1 thread: Reviewed-by and Tested-by of
  Ali Ahmet Memis <ali@iusegentoo.com> on both code patches;
- patch 3/3 selftest CI fixes only (no behavior change):
  - two SC2181 rewrites to direct exit-code checks,
  - register the new test at its sorted TEST_PROGS position,
  - rewrap the twelve >80-column lines reported by NIPA checkpatch;
- Cc the hsr_forward.c area authors and the v1 reviewer.

Previous postings (newest first):
v1: https://lore.kernel.org/all/20260728143604.26-1-xiexinet@gmail.com/

Xin Xie (3):
  net: hsr: privatize interlink-bound skbs before address mutation
  net: hsr: clone before updating path and LAN IDs in tagged frames
  selftests: net: hsr: add shared-mutation regression test

 net/hsr/hsr_forward.c                         |  51 +++-
 tools/testing/selftests/net/hsr/Makefile      |   1 +
 .../selftests/net/hsr/hsr_shared_mutation.sh  | 223 ++++++++++++++++++
 3 files changed, 270 insertions(+), 5 deletions(-)
 create mode 100755 tools/testing/selftests/net/hsr/hsr_shared_mutation.sh


base-commit: 2195424c3da2ef1829a63b807e3a900a90e57d85
-- 
2.43.0

