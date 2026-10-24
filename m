Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.178
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792843622;
	b=yd/6a2JBEgKEthlzSDVrKybQCjBPnGRYO+NozZDdjLXLCTydy5GA2plvbwnu00iFmpmV
	 7AlDJQ+jpY3auEGyDHlzDKTiuWGGRbGwdn6uswpXfKH7raC0XcmAwh/G9uu2uK6BWjajD
	 HJRfvPRkWKIWEm2KZHv9+ifTEttU2yMFNTq5ORPEueA/nYW+n52T+5sA8mFH4W9H9aY/S
	 +No7sghw8LKRGP64VFT2nMRuBRSyW2oU1bBIUjJszYVQDQS8e1nlNrFFUbY97Eh8Olq6p
	 zhovG4a0nfWndG3KZW/L1JBapKiZusao7s44Vfign1wZSm8zx0YhI/XaCf5jtdr0R2g==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792843622;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-Id:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding;
	bh=iLsBpvRM6v0Gbb8cMHaG5f+AOPaNIuJwM/Pen4fkwPY=;
	b=le0r1sZe/7X790U/eD6LB8hchctOvA4C1Ftx/cuCdyu7XN/lOd0yplptYSxEK25Vmji3
	 BYFDjgtTLALTLytpmhdq7c3UZ28q5gAFMt5/BRb0J9v814/F9L35GfvC9VIT/hWxwC0mz
	 iJG+b5IbIYmRIoW20mq7sa+wkAtKramW3DqJIggFpI3BI3fLIl43PKRPniQvFo7tYmNqD
	 pF+djQ3VQV3U/Dhk1ohpRXKh+HFRZ+IwVxVLqbLKty8Xs7nuLU52lZjCcjxMmEzbtSsWc
	 kgZKnNWex5IeDKyGzvHXAgkdDU7m08FgRbUbQ2tY/a2flYepAtKOV1PeiofmdQHiU3g==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=h62IlHUu;
	arc=none smtp.remote-ip=74.125.82.178
Received: from mail-dy1-f178.google.com (mail-dy1-f178.google.com [74.125.82.178])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9937E606A31D
	for <linux-kselftest@vger.kernel.org>; Sat, 24 Oct 2026 12:07:01 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 9937E606A31D
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=h62IlHUu
Received: by mail-dy1-f178.google.com with SMTP id 5a478bee46e88-35c76e9614aso2589383eec.0
        for <linux-kselftest@vger.kernel.org>; Sat, 24 Oct 2026 05:07:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792843621; x=1793448421; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=iLsBpvRM6v0Gbb8cMHaG5f+AOPaNIuJwM/Pen4fkwPY=;
        b=h62IlHUump8BEvauKAFZHnhoaGbJ/hyhck/aoKcgDoZ5C1TEK8cxIkbEhnKnRf7Upo
         bPjJuVKv6gv3duQ3NumZBkD/LOywZ5UPAwqrA03cNam+tMfYYPgx/ZAo1MSugRNvZczn
         Vd5pEbZ0KbuQP4rJEO1JAVghK3gxOkfJmQAnQxWg031KNksY72F3Rm7Ks5bnl+WwO6SB
         N/YMZG/5dUMXys+LfgpjcyJmdY4ntE467u8aAtW/dB3TIlWB7IOqDOJPCPVkQpLND5Hq
         K1CsB7bhJJ4nXHscagOHXuX4CH9SkfR+c0iFjNYzTAJfYUyqVZbu40cWRlgYpEISf3H7
         sO8g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792843621; x=1793448421;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=iLsBpvRM6v0Gbb8cMHaG5f+AOPaNIuJwM/Pen4fkwPY=;
        b=166XFdSlfJlVBVFxi9Oh6HvNpRfttsH8gBtFWksEXb+xEdXCv7U9/LgOrTEcxj3W67
         o4MaUmWf+p16DHX31DzMSKmDRzztCPf851qKLnJ3eJmrpDT4OzGwawCDi25/b69yhSSj
         NI8+BLsKyGfHk64N1XPAYYXI8/6fg8LHvdsXMxbWb00MqZSDyMDPwYXR8UUk+jKPgxMH
         tHo6Ki+KZZD/iTCYI3/+jtXM+DJiaph6xkrUyILWQ9Z9m3Xr1XVgAIG9Na3MgXCbjSS5
         pPaOJD5tspK18tLtbMkKpBmRfTkSFEdHSA1yKM6rUTCx3sbhginn/ZZfbuLBZQ13DtJg
         ANWw==
X-Forwarded-Encrypted: i=1; AKwUvBxJFHu4SgRtAaq9cBnvHRSNNHzZh8v+oj9JKqQzmNqptRShLrDyOXcDb3WLYkcqg9D3Vf8dA8Z55UAJ7MNiCc0=@vger.kernel.org
X-Gm-Message-State: AFq9FYKcXzOgWN/OfoPnA8UakgpmZrnTc+WOxPAPPpRc2z/+saPuqY7A
	1wmMK+Q3U6DykhUEG41uM+GkI5dc8Qq1f2g7WUyGowbhNz8jKkBi6vOB
X-Gm-Gg: AYBFou3hJV/wsQn3J/c2PrRwDTFyV3Gnk9eTB2KeyWSIH/zJheJhCqFlyddhCUUweiw
	PV3zJbyIDZU7WsFRVrt2J3Aslz8CWsYa3ERJE76MGUQoiLxQjfgWxYUSjT7nkxBOkVCBItG7TD4
	d0CRNMn1Ra1BQI6nx46l6PLfWWTnSsMWfGFramjdfmDx8c8TjrPs3J8oMgmd/TNXB2SAbbPg8ZI
	JS0tJSkgfU151KOpk+1vxGjfyUxpiJle45k/LFiWz25BZE3FMnkFE4Jnao8pcdUxcG1dhFGOvKl
	M+yLs/dbFR6hIWC2TvmdjdOlFqsIDx0/NxSq+lpbG7F42sqsX6T/+57I6ueV5KDd3o2/Sg6lJSI
	a/ixOzgLRHoNySIkduq1CMkujUlcXiJzZOmzkxRp1AeRdNAuqxnVbFGCvXu/a/SeP81jhUxyOya
	G4UqSLgz2MhaeWPfRHGsq7gDqRWHyMC74RYxg+eIMVDBXw/JxqCa0RS7Rp/4dUds28jtn4zbGwo
	xsRX1r6MfRb7XZYacR1D5lEFYfL58cfWFiIuQH3VQ7kifmxuyUgDtw7soqI+kkun7Z/6la8Yl4Y
	aSLZdeg1EqMhTYuPUFvzMtFGXg==
X-Received: by 2002:a05:693c:8943:10b0:368:9553:f2da with SMTP id 5a478bee46e88-369e85074b2mr2972965eec.31.1792843620562;
        Sat, 24 Oct 2026 05:07:00 -0700 (PDT)
Received: from localhost.localdomain ([136.25.42.214])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-369e8d95e91sm8120722eec.15.2026.10.24.05.06.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 24 Oct 2026 05:07:00 -0700 (PDT)
From: Tim Budding <tim.budding@gmail.com>
To: netdev@vger.kernel.org,
	linux-sctp@vger.kernel.org
Cc: Xin Long <lucien.xin@gmail.com>,
	Marcelo Ricardo Leitner <marcelo.leitner@gmail.com>,
	"David S . Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@kernel.org>,
	Jakub Kicinski <kuba@kernel.org>,
	Paolo Abeni <pabeni@redhat.com>,
	Simon Horman <horms@kernel.org>,
	Shuah Khan <shuah@kernel.org>,
	linux-kselftest@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Tim Budding <tim.budding@gmail.com>
Subject: [PATCH net 0/4] sctp: fix I-FORWARD-TSN handling with user message interleaving
Date: Sat, 24 Oct 2026 05:06:23 -0700
Message-Id: <20261024120627.837568-1-tim.budding@gmail.com>
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
different streams can be interleaved in TSN space. When a PR-SCTP
message is abandoned, the sender reports it in an I-FORWARD-TSN, which
carries a New Cumulative TSN and the stream, U bit and MID of the
skipped messages. The receiver still uses the New Cumulative TSN as if
it delimited messages, which loses or corrupts unrelated messages:

  TSN  stream  MID
    0    0      0    B   64KB reliable message on stream 0
  ...
    5    0      0
    6    1      0    BE  PR-SCTP message on stream 1, lost, abandoned
    7    0      0
  ...
  I-FORWARD-TSN new_cum=6 skip=[sid=1 mid=0]

The receiver frees the stream 0 fragments with TSNs 0-5 together with
the abandoned message. They have already been acked and are not
retransmitted, so the stream 0 message is never delivered and the
stream stays blocked.

Patch 1 frees reassembly fragments per I-FORWARD-TSN skip entry (stream,
U bit and MID) instead of by TSN. Patch 2 aborts an unordered partial
delivery when the message being delivered is the skipped one, instead
of merging it with the next unordered message on the stream. Patch 3
stops treating an I-FORWARD-TSN as an association reset when its New
Cumulative TSN is the highest TSN seen, which aborted partial delivery
on all streams and could abort the association. Patch 2 comes first
because the code that patch 3 removes also aborted that unordered
partial delivery in the leading edge case.

Patch 4 adds a selftest. Its ordered, unordered, leading_edge and uo_pd
tests fail without the corresponding fix and pass with it; its reset
test checks that an SSN/TSN association reset still works.

Tested with the new selftest, sctp_vrf.sh and the lksctp-tools
functional tests, also on a kernel with KASAN, lockdep and kmemleak
enabled. W=1 and sparse show no new warnings.

The first bug showed up as message loss in real use, and I found its
cause by AI-assisted code inspection. An AI assistant found the other
two while I was fixing it. The assistant also helped write the patches,
the selftest and these messages; I have reviewed and tested all of it.

Tim Budding (4):
  sctp: purge abandoned I-DATA fragments by stream and MID, not by TSN
  sctp: abort unordered partial delivery when its message is skipped
  sctp: don't treat an I-FORWARD-TSN as an association reset
  selftests: net: add SCTP I-FORWARD-TSN tests with message interleaving

 net/sctp/stream.c                           |   2 +
 net/sctp/stream_interleave.c                |  34 +-
 tools/testing/selftests/net/.gitignore      |   1 +
 tools/testing/selftests/net/Makefile        |   2 +
 tools/testing/selftests/net/sctp_ifwdtsn.c  | 538 ++++++++++++++++++++
 tools/testing/selftests/net/sctp_ifwdtsn.sh | 141 +++++
 6 files changed, 696 insertions(+), 22 deletions(-)
 create mode 100644 tools/testing/selftests/net/sctp_ifwdtsn.c
 create mode 100755 tools/testing/selftests/net/sctp_ifwdtsn.sh


base-commit: 7076f684d5132e6a6145e1da2fa74771ecd052e5
-- 
2.34.1

