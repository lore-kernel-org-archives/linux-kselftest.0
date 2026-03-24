Received: from mail-oa1-f44.google.com (mail-oa1-f44.google.com [209.85.160.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8A8642EBB84
	for <linux-kselftest@vger.kernel.org>; Tue, 24 Mar 2026 20:53:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.160.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774385591; cv=none; b=u36ddlX+8mJ5LaQxG3iyw1Y/2StGFTUSEwt3J4AGxjBRW8BAGtIbzqPS463RH6qqLd7KRXAFcyrwWEjHQVLbaLTxEQlUIG2FYu+7Gfxgxxppu94s3jAkBZoyNr4rdYazoP0Q0Pyy96fxqISD4eCxRI5PyMAVXLJIsMthj3DaA7E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774385591; c=relaxed/simple;
	bh=R0mrHTGbw4Ix7XXgHgOG4FbxSqBpU9OPj78Ihtveh44=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=uv+1K4LErAzB3NXLWqy3B5Lt1srHm6m0hiQrLh/XwQ6YVcdQo3Qd66eJRXHWpnQIfGhKoHg9HRtk9lPsVqMTYY6sJujnZAspMB3H6hpw32UoH8nVm2EatPlg9rp3Zi3+nAdvx4tmiduWdoOo9cL/cq06VyjkxZuhM++tIhjfYj8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Xd1kvhRj; arc=none smtp.client-ip=209.85.160.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Xd1kvhRj"
Received: by mail-oa1-f44.google.com with SMTP id 586e51a60fabf-40427db1300so3054319fac.0
        for <linux-kselftest@vger.kernel.org>; Tue, 24 Mar 2026 13:53:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1774385589; x=1774990389; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=mxUsUi/VC6SYiOs+1SMSLid4Prb4oKr5DoI5DWzEhbg=;
        b=Xd1kvhRjt6w4qA8UpvQFQioCFbzbay+KjCP62M09ss21RMhNip9v3uqHhAsI8OyJjW
         XGh96Xzo7ROihX3A7rFHs8FN9QQOdMvoX+l52F4xGl+iKyT2HEW7kXhncn3RL++1HZLA
         VUmLMJ6Oy4Vz54FHyg3ygXkEvPr8AaHLzV0GW2NO+toFuwXv2VDcxLnVR3IiCgEiMhr7
         Sa/LLiYfjeYN5wSJMyjXkijdLpzlyM8hQvESF65KS+ciV4r1iD9cJFqcdKqeMKLSpIkj
         aRdkXKmu2c8BzPkK+KDwjm0ZJ15LFtapWgtFwlRTYlc4GMG4d5IG1bnf8Vka7QfjrAZ/
         VtOA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774385589; x=1774990389;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=mxUsUi/VC6SYiOs+1SMSLid4Prb4oKr5DoI5DWzEhbg=;
        b=jop+keGuqYV/3edoxHXMUELKnmuiRgr9Wzh2FXVm2jQbzrhNDlW9MSvcUcklVTZkzp
         gPYSxtSPzK5U+ZRWipHuaAVp2ScqStW8UiiPSiTF87AT3dGBNkjChsqWeEZlOY9Ro7p5
         OEQeNGlrkeyqak2bTRUOAuaVKN8yTC8udCeZzLAVrKgVRe/5JHFH0NXw06b4iFXS6An3
         Jfsna7ue1aiD1FiQmPlnDGHoZWdk1HvMxYwvZoBBy4uyTKojAFUOCy046haymQV7VJQG
         ZwpVpRp43h6vVXVsKnR9ouQcCS4IhdRy/l55qiAbGGFNCm0Ey+fg9QeahZTOzoeYCo3r
         nIjA==
X-Forwarded-Encrypted: i=1; AJvYcCW9Rvpzj0f5HlkIujHxnAJbfLXNQ7StVQDF7ua9GUsKmpiXW4mhLTSfUFvdGGbxzmye1B66ooZYamFHmbhqFp0=@vger.kernel.org
X-Gm-Message-State: AOJu0Yxi4fPZrfZMalEJ9IG7j3RvPffsDafsLrycPn+s8PkX4NvP1PE8
	AGo6e1LN9n1fDM8pDJD//rDpZRYI/0gTrGSkTIhkGuZC4GPcwFpZqfod
X-Gm-Gg: ATEYQzy7kE+q4aRtLJTBwSJ+5K453tlno/sT0i+W2Xzv0Qp82h/aVm5fSHNju51atgu
	/sCLf4YM+pSlmAlcYsQRBzKZChatG81wMQvxmjqv1G9wW9AMRdyaomx5i/2mU08b44cNpBcnx7/
	fKUdW/U0TBFnlZVIkQfne53HKpiS72ltTownwjldzAbqOZPm/ZgaL+oGs12X5h+oObg/1wd9UbW
	kQ71tTdZXJA/QG+mTNjMsvEWT+4+roC6LAS9OMIVjWEwYnzzBMnGx/dXpKkxlTkHSwsbqAepN/t
	diNSSCthPLpv01MVgCStF8y89kn9eUyeKKfarCqrbnd7EPLCNRWtnSlwxWgE0W1lSqQgtrwGY2o
	vqqP79k10HzSrgFs3FRU8Dtt5idbbPQOyUAOShjkpBtKdm8DdOZsKyG3iEn8od6OT9oe916jM69
	8CXVcmm2P9zopdPORLvIknij1dvS59DHUL7kXNE9CyP8MjkUT/T8AuieWndCIEInoovm21BKhDn
	bOxxmsXn/MFKr0V69goGARp6luoQ//cfnPB93HvlQ==
X-Received: by 2002:a05:6820:4d05:b0:67c:2d5e:e9dd with SMTP id 006d021491bc7-67dff512746mr703832eaf.41.1774385589422;
        Tue, 24 Mar 2026 13:53:09 -0700 (PDT)
Received: from Atwell-Laptop.. (108-212-132-20.lightspeed.irvnca.sbcglobal.net. [108.212.132.20])
        by smtp.gmail.com with ESMTPSA id 006d021491bc7-67c252c91d0sm9125161eaf.5.2026.03.24.13.53.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 24 Mar 2026 13:53:09 -0700 (PDT)
From: Wesley Atwell <atwellwea@gmail.com>
To: netdev@vger.kernel.org,
	"David S. Miller" <davem@davemloft.net>,
	Jakub Kicinski <kuba@kernel.org>,
	Paolo Abeni <pabeni@redhat.com>
Cc: Eric Dumazet <edumazet@google.com>,
	Neal Cardwell <ncardwell@google.com>,
	Kuniyuki Iwashima <kuniyu@google.com>,
	David Ahern <dsahern@kernel.org>,
	Simon Horman <horms@kernel.org>,
	Simon Baatz <gmbnomis@gmail.com>,
	Shuah Khan <shuah@kernel.org>,
	linux-kselftest@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Wesley Atwell <atwellwea@gmail.com>
Subject: [PATCH net-next v3 0/3] tcp: fix scaled no-shrink rwnd quantization slack
Date: Tue, 24 Mar 2026 14:52:58 -0600
Message-ID: <20260324205301.1361608-1-atwellwea@gmail.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Hi,

This v3 addresses the follow-up review on v2.

Eric pointed out that 1/3 does not need the added packetdrill comment
and that 2/3 compared signed free_space against an unsigned
granularity.

This revision drops the extra in-file comment from 1/3 and keeps
the scaled-window granularity in int space in 2/3 so the comparison
stays type-safe. The overall approach and reproducer remain unchanged
from v2.

Simon was right that the original 3/3 only showed the explicit
rcv_ssthresh-limited ALIGN-up behavior. For v2, 3/3 was replaced with
an OOO-memory-based reproducer that first grows rcv_ssthresh with
in-order data and then drives raw backed free_space below
rcv_ssthresh without advancing rcv_nxt. In the instrumented
old-behavior run that shaped this test, the critical ACK reached
free_space=86190, rcv_ssthresh=86286, and still advertised 87040
(85 << 10). With 2/3 applied, the same ACK stays at 84.

That follow-up also clarified why the broader 2/3 change is required.
A narrower variant that preserved the old rcv_ssthresh-limited ALIGN-up
behavior was not sufficient: earlier ACKs still stored 85 in tp->rcv_wnd,
and tcp_select_window() later preserved that extra unit because shrinking
was disallowed. Keeping tp->rcv_wnd representable across the scaled
no-shrink path is what lets later ACKs settle at the correct
wire-visible edge.

Problem
=======

In the scaled no-shrink path, __tcp_select_window() rounds free_space up
to the receive-window scale quantum:

  window = ALIGN(free_space, 1 << tp->rx_opt.rcv_wscale);

When raw backed free_space sits just below the next quantum, that can
expose fresh sender-visible credit that is not actually backed by the
current receive-memory state.

Approach
========

This repost keeps the part with a clear fail-before/pass-after case:

  - relax one unrelated packetdrill test which was pinning an
    incidental advertised window
  - keep tp->rcv_wnd representable in scaled units by rounding larger
    windows down to the scale quantum
  - preserve only the small non-zero case that would otherwise scale
    away to zero; changing that longstanding non-zero-to-zero behavior
    would be a separate change from the bug proven here
  - prove the actual raw-free_space case with a packetdrill sequence
    that reaches free_space < rcv_ssthresh without changing SO_RCVBUF
    after the handshake

Tests
=====

Local validation included:
- git diff --check
- checkpatch on the touched diff
- /home/wes/nipa/local/vmksft dirty --tests
  'net/packetdrill:tcp_ooo_rcv_mss.pkt
   net/packetdrill:tcp_rcv_quantization_credit.pkt'
  passes in run 20260324-202158-4929 for ipv4, ipv6, and
  ipv4-mapped-ipv6
- the same quantization packetdrill fails on HEAD without 2/3 with:

    expected: win 84
      actual: win 85

Changes in v3
=============

- drop the unnecessary explanatory packetdrill comment from 1/3
- keep 2/3 granularity in signed int space to avoid the free_space
  signed/unsigned comparison bug Eric pointed out
- keep 3/3 unchanged

Series layout
=============

  1/3 selftests: packetdrill: stop pinning rwnd in tcp_ooo_rcv_mss
  2/3 tcp: keep scaled no-shrink window representable
  3/3 selftests: packetdrill: cover scaled rwnd quantization slack

Thanks,
Wesley Atwell

---
 net/ipv4/tcp_output.c                              | 16 +++++++++++-----
 .../selftests/net/packetdrill/tcp_ooo_rcv_mss.pkt |  5 ++---
 .../packetdrill/tcp_rcv_quantization_credit.pkt   | 62 ++++++++++++++++++++++
 3 files changed, 75 insertions(+), 8 deletions(-)
 base-commit: 5446b8691eb8278f10deca92048fad84ffd1e4d5

-- 
2.43.0
