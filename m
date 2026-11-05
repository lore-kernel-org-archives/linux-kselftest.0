Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.51
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793854966;
	b=3J6CA9Bj5kK6HOzwG0BiA7pp74PeRA3u4Sl2qQJqO9qA3MHxMKbPPGuRDpyejnxJOAke
	 Al2K6Al4QpVL8YOiNI+MdXMQgGjL1bop+w/ocGkix55+1Wg0XJKGSuesZ4vV6kS0F5+J5
	 E+Ab3s17uSoEnc4LXGePbuD+hKYMdY3OoDDuRt679ji7Pnxh3xog2y5mpRW+dUQum66/M
	 qaimzAqef320eeoBAoPwU+x7NjjHDkapk1Yyw0GeS8VrvscdAZI5xWOJYQDFkPU15aIg6
	 pFVDGL9c8xkbiLG3zaYB0jap6Dw2cZwb+bqQRk71DdqsGDGzriid7wU/JWa49O2oCIA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793854966;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-Id:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding;
	bh=LO7efjMzYzRkjGuKwYuy78sqey9ql9fr/9N15oGP1+E=;
	b=WdbjV72e9kpEWSMknwxHQOLNAIYTA9pXjoSdOhoF4D7xVrlRlrZ9dyweDBC/zxbp3uAz
	 4MVhN0S7F0gi/We1XDSPNLP7cqOkk9NlbL/mNV8aqHVeyhRuErFavLbsWRfbYqkUO4VVv
	 k0c31jFD0yj8c+N3khq524Povx/yiLJO1m9u+zvlg91bnkVOTq0JTxp9qYe/DULODZeo7
	 Lqfv4sUsRPhf+fJio1M639BAmZzvs3OW7YwH6gkL9czi1Lx7tBygJLSJfF1RB+H42h7Vu
	 9oMpYYRV17VxdI1Ep0N/z630rIRhz1CaEAy2sM+grmnUgXTGfeqvSsCQdqOG80JfSig==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=jF7FxoT5;
	arc=none smtp.remote-ip=74.125.82.51
Received: from mail-dl1-f51.google.com (mail-dl1-f51.google.com [74.125.82.51])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 19B25606A32E
	for <linux-kselftest@vger.kernel.org>; Thu,  5 Nov 2026 05:02:45 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 19B25606A32E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=jF7FxoT5
Received: by mail-dl1-f51.google.com with SMTP id a92af1059eb24-1a2761c69fbso491207c88.0
        for <linux-kselftest@vger.kernel.org>; Wed, 04 Nov 2026 21:02:45 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793854965; x=1794459765; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=LO7efjMzYzRkjGuKwYuy78sqey9ql9fr/9N15oGP1+E=;
        b=jF7FxoT5DUg01XPIQKoII/OIFbtaJhSE+kxslDbtQi8ukCE5stYLsOAhskPoTIgNV4
         KPiGf4+2+3TUevvlXRzzG2m0TVoBuh59xEyZV8LnWMjKra/CdRtmUOV3UdwebYef+P6H
         q/o7DrNDs2VQ+OQTqtHTJDZt/ovdO081CU0+rVWeAFMTewQq4GuCWnBbiVGe9TwO4oWB
         EzpfIDj3EfODbbmeob+53wJwIZiffNjxyLfRuyMLZi86bYlmRCEHziFhzmpLpWID7rit
         AlZ6igJ+iLGQ90COXYesZV8tOfofedFcGr6Y1iQRiedMROzO5vqnQU3e3rfN//wYTyvV
         Jqtw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793854965; x=1794459765;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=LO7efjMzYzRkjGuKwYuy78sqey9ql9fr/9N15oGP1+E=;
        b=KED55aX28oQtlxwJoZfKA32pDRaB86HgJUCoHP/gLCRmD9sNQBVUbp4tKJ1/UwZgo8
         IyhEY1dg1MTZ1iFTYhiqgUWhHwtWUgEx/6C2c+Ib154lUEfrJLHPMPRWsAPI0ecbUgvB
         z0cI3hyqAjpva3IAy0erNopEVe6tV+BPMLy4ZPArzjHp13NcoATh8o5Qm3m1u0fthDv0
         46J05bxqJbkGykyzybpKEwiMoih0HUToT2fIC2iK6RyWpXxhZbUVJRZkwcV6LJ14zqEU
         NgYEYEryrvEoeLQZg9W/kirgBVkF38VaeaLFivxfCuJ1/QB+v8/D9d+A4m29PyuigMzy
         iM9g==
X-Forwarded-Encrypted: i=1; AKwUvBxxgePnWbDALLKZNYEWofZCynCjAbRqQLDLidTOtDWCiOJvYbo3xvf13/Gh7nDQfPM77vmxjjGlWhn7y4p/P78=@vger.kernel.org
X-Gm-Message-State: APuU4Z9KTfErwSe2nExI2vrXcwsSMjZbn8MiIYgop/fdZS/VY86+Epia
	iKrBEjxgNxJlI8gtOkPUFaJbsqO/zOc+w9QXHtAebP0G4Fe4H/lSv+78
X-Gm-Gg: AYBFou3rWnYLZHhjdxxaUglewod+m/U+nqt+vjYSwl/uIUa61tmVClbua26Q9Auc9+Q
	uh+CNp0cFaMFnfOm7QvhwURg/4KxPlBcauC6DKS8WYdY3ZEF0hAIm4e0JfxY+E8T/AyGPm12+MA
	jYJ8VbASzZ5ypO/ZuCksFLRgNWLpoSgpNnsJeOL8xstLI6+HbCKGDSUMSW6sLdEb6TZXrUv6tjT
	N25yJ6KGx+JXjIAOv3OTxqwlAnzUvq7G6WgcxstlIX7XXLQ2MsilEdAOh8K7V9zq+z6jJAb8jyH
	doMHTbKxPo5u2gmF15SyBoJMRtpJFmcDOmg0MKomlBUMMMLkGa0KFwYtgiUigxrV6tuksZ+g0mQ
	YeyCxD6EYNw4mTqhBSsmEAajNRIFwV/DOWlmKz+bCNvhxWhhLHa9fO668LiqDIoHUx1L58hpQYS
	84ZdD/thwwLjUyRKKB7ixS20la28IJ3/nMm9wLkByIn99d7IurIdLxXbev5g6WO7UHUBspNwxKl
	UO48/QXoXsfmJ66b7RCsgsWo4yYhPvqJKqUqoLlJevF7JN6VwsanrDO6yj9v0vwgCihbKdLlcat
	kGrw+9Rjexsg3Q0RY7a+GsuHiHebbUpHPAcjiWRrcWyIn1Y/hBCjpz2sFWcNbgyGjCuJv5kNybc
	=
X-Received: by 2002:a05:701b:2084:20b0:153:21e5:4328 with SMTP id a92af1059eb24-1ac5a9670abmr29178715c88.17.1793854964836;
        Wed, 04 Nov 2026 21:02:44 -0800 (PST)
Received: from localhost.localdomain ([136.25.42.214])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-1b245c1c283sm13626735c88.4.2026.11.04.21.02.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 04 Nov 2026 21:02:44 -0800 (PST)
From: Tim Budding <tim.budding@gmail.com>
To: netdev@vger.kernel.org,
	linux-sctp@vger.kernel.org
Cc: lucien.xin@gmail.com,
	marcelo.leitner@gmail.com,
	davem@davemloft.net,
	edumazet@kernel.org,
	kuba@kernel.org,
	pabeni@redhat.com,
	horms@kernel.org,
	shuah@kernel.org,
	linux-kselftest@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Tim Budding <tim.budding@gmail.com>
Subject: [PATCH net v2 0/4] sctp: fix I-FORWARD-TSN handling with user message interleaving
Date: Wed,  4 Nov 2026 21:02:21 -0800
Message-Id: <20261105050225.49292-1-tim.budding@gmail.com>
X-Mailer: git-send-email 2.34.1
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

With user message interleaving (RFC 8260), fragments of messages on
different streams share the TSN space. When a PR-SCTP message is
abandoned, the receiver still frees queued fragments by the
I-FORWARD-TSN's New Cumulative TSN, which loses fragments of messages
still being received on other streams:

  TSN  stream  MID
    0    0      0    B   64KB reliable message on stream 0
  ...
    5    0      0
    6    1      0    BE  PR-SCTP message on stream 1, lost, abandoned
    7    0      0
  ...
  I-FORWARD-TSN new_cum=6 skip=[sid=1 mid=0]

The stream 0 fragments with TSNs 0-5 are freed with the abandoned
message, are never retransmitted, and stream 0 stays blocked.

Patch 3 frees fragments by the skip entries instead of by TSN, and no
longer treats an I-FORWARD-TSN that reaches the highest TSN seen as a
reset. Such an I-FORWARD-TSN is then handled by sctp_intl_skip() alone,
which has two partial delivery bugs of its own: an unordered partial
delivery is not aborted when its own message is skipped, and
PARTIAL_DELIVERY_ABORTED reports the highest skipped MID rather than
the one being delivered. Patches 1 and 2 fix these first, so the three
fixes should be backported together and in order. Patch 4 adds a
selftest.

Patch 3 has a cost, as discussed on v1 [2]: an unordered fragment of an
abandoned message that first arrives after the last I-FORWARD-TSN
naming that message is no longer freed by a later, unrelated
I-FORWARD-TSN. It keeps its rwnd and receive buffer charge until a
later unordered skip on its stream, a reset, or teardown. Dropping such
fragments on arrival needs new per-stream state and is left to a
follow-up [3].

Changes since v1 [1]:
 - Fold "sctp: don't treat an I-FORWARD-TSN as an association reset"
   into the purge patch, now patch 3, as Xin suggested [3].
 - New patch 2, from Sashiko's review of v1 patch 3.
 - Move the unordered partial delivery fix first.
 - Selftest: add leading_edge_nopd, reset_pending_srv/cli and
   pdapi/pdapi_uo; wait for conditions rather than fixed times,
   including all data being acked before the queue check.

Tested with the new selftest, sctp_vrf.sh and the lksctp-tools
functional tests, also on a kernel with KASAN, lockdep and kmemleak.
W=1 and sparse show no new warnings.

Initial bug observed in use, root cause identified with AI-assisted code
inspection. Related bugs found and fixes implemented with AI assistance.
All reviewed and tested by me.

[1] https://lore.kernel.org/all/20261024120627.837568-1-tim.budding@gmail.com/
[2] https://lore.kernel.org/all/20261026052706.187296-1-tim.budding@gmail.com/
[3] https://lore.kernel.org/all/CADvbK_du=-oT19kKBKYSjFKYscnQSH1mekRKMXgmLPMXTEH_=w@mail.gmail.com/

Tim Budding (4):
  sctp: abort unordered partial delivery when its message is skipped
  sctp: report the partially delivered MID in PARTIAL_DELIVERY_ABORTED
  sctp: fix I-FORWARD-TSN handling of fragments on other streams
  selftests: net: add SCTP I-FORWARD-TSN tests with message interleaving

 net/sctp/stream.c                           |   2 +
 net/sctp/stream_interleave.c                |  38 +-
 tools/testing/selftests/net/.gitignore      |   1 +
 tools/testing/selftests/net/Makefile        |   2 +
 tools/testing/selftests/net/sctp_ifwdtsn.c  | 699 ++++++++++++++++++++
 tools/testing/selftests/net/sctp_ifwdtsn.sh | 233 +++++++
 6 files changed, 951 insertions(+), 24 deletions(-)
 create mode 100644 tools/testing/selftests/net/sctp_ifwdtsn.c
 create mode 100755 tools/testing/selftests/net/sctp_ifwdtsn.sh


base-commit: 6baae996ecf6a3f57b08ea6f6786e29af9260f51
-- 
2.34.1

