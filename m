Received: from mail-ot1-f44.google.com (mail-ot1-f44.google.com [209.85.210.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D4F13347523
	for <linux-kselftest@vger.kernel.org>; Tue, 17 Mar 2026 06:51:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773730310; cv=none; b=YJg710YlCk9jCWYi+sK1+awhUIyz+zppXtjDYOq9+kLuCJnXs7teuPiHoY3nueEIkxuOro01XOfRmVaz8EVBekFdv9G2Kvok5X94zHQUZdSCZlxNZo26yCPgzOO7jxn+woUi2n5MMjgSss+V4bxNIp24cH2oTb+rF1Wvc4tn/8I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773730310; c=relaxed/simple;
	bh=lQepeT2k5Fl+bQiBTdo/2RKQeJqwOuJNKIE68wRejzg=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=mGR89Lhj0roINcecD70YG9aO3+JL4+SH75qzOITK/3TPW19ugf8eIvSU5eVEer/YlJSDRJ6wFuHXUXiAWhanZG0o1D/RO1AyFjOp1G6QO2ZZf3hN49t3FtZQSvfGbqzaAXd565pJPuC1HfUYUqpYhSKaqqbVbQVvw4mKdCkQM/4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=MTteQ1J8; arc=none smtp.client-ip=209.85.210.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="MTteQ1J8"
Received: by mail-ot1-f44.google.com with SMTP id 46e09a7af769-7d1872504cbso471977a34.0
        for <linux-kselftest@vger.kernel.org>; Mon, 16 Mar 2026 23:51:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1773730308; x=1774335108; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=qtZywvH13a+APguVp2Hp2i8RvJD5haTPVdtJ4uElfYY=;
        b=MTteQ1J8C1UOOsadyvZkzxhhzWq4e6J80QNolx6BDnVMOryMC/iakMZhAsbr9AZumZ
         OJoQg2+wmr2QiZIliQxAkkLhk6vDG7ZmMsBkdWNQ1kW4pVKUm3FStSk17n/7FApNdFpz
         /bOs00J3L02OcsDt9FJ9CrOXUZOs2QSGaPTQXO3RGgjkfmr8n0i8aAZg6ySeqcdK+AWp
         EI7QfbhB4/PHw+ac86fnXaWlMZeV45QR7H+8v/I+noAOGOB/7gHcM1S0UmyVf+6vyqhe
         59JS9cBTNeK1LvnpvGOOR69v7j0pNUmjyOtTmeCykXOtRMSv4thDgQkDTy+2RQDJ6LFf
         Liwg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1773730308; x=1774335108;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=qtZywvH13a+APguVp2Hp2i8RvJD5haTPVdtJ4uElfYY=;
        b=PJIlnh2ClN4z5csl6bNfqkRLFMoX5Q4gL7aWCL8l4oNZv3S6hgIpo+PBM/I1ObG0X+
         r9ifUooluG+DFmmSl4L+W4QOoHzi3fY/BfJS/oyvuhgI2OPu3tt0og8W4YNiqNLgcFKD
         gx+o5ruj2mIQ8t23EbWP9xPQbIdPM4YXqsPEJ/MvHbfDTMATGPcScYELb0Dew9Qfs95X
         HqcHkP2eZvNAus+/cPgwS/vdB8SBmfd7+emdb+CfbW3jdaFW3XZnBv9SBtmRCdET8RxK
         L1KFhTjU/VFqZZHCwcr8ZcRfHBRqX+aUPxxGMShO9STa74uFaQYnkNPehndwGFmBiUu3
         afzw==
X-Forwarded-Encrypted: i=1; AJvYcCWmbGyg1HdCphSjoqL73IiSHorcju95skru0kSLkcwtGITDWhU1r+/3D98ySRd/mCEmWnignfIhiZrf2I5w7vg=@vger.kernel.org
X-Gm-Message-State: AOJu0Yw54AlA157xzRLxWt3Z8iZEo5YSV4kFBfg+8sRJTbr6uP2HCQOu
	P7BTclp7DAgtFdcwRHOviMlg5558in3UUznbOZ3QKOenbuQUffNFRSL5
X-Gm-Gg: ATEYQzyYz+sTgt2tBzqVsvhHRRxwS+FmC3XnFIuFpYXn4lOvMqslcBEaSpWfgVO27/o
	FhAF0hN/be6DzQWzXnF9d+LWrvAN3I6Ja9zv66KoxfAdQJXVuwpj3jDQKGOKO1OCCGdajURzwHr
	5XOtDedINMEIt4lRWnoPi7YBsjXRYP2ILYJdUVR7HwjZWr1rU6G+oYnUUZQ01c461AM1JsohuTZ
	+T2SR7qkIdFXuP2FdiIxVtN3AYtqylQviBib7Pzj47p6h0hpjcuIqRy0OAHGbKcDUlYZ9TuXIqk
	KkZwcWtlQH/RlOV9hJhkRlWRLjDP3xp5/IS657Aqg6eyHy/vi4/5JemX7+H3jdIg7kBH8S46vp1
	7D1Ogwbx3agy064L2oco//+j9DsXCqEQG3qsV1Qo3ByCxMCh4NqWpcsUrb9Vhgq8qge+nm+W1PP
	53Ge5C9qfx27lO7QCVo3k+dvo/puzgtd3uywE8sdEVcAbRmBKQsJL+RH6/HXLX6gZLDK+mnDjKm
	mIp/8QFknBN2fjb2Y2aVigee/382yiDJ/43m85rzQ==
X-Received: by 2002:a05:6830:3d95:b0:7d7:45b7:ed8a with SMTP id 46e09a7af769-7d7bb6c0f7cmr936737a34.5.1773730307840;
        Mon, 16 Mar 2026 23:51:47 -0700 (PDT)
Received: from Atwell-Laptop.. (108-212-132-20.lightspeed.irvnca.sbcglobal.net. [108.212.132.20])
        by smtp.gmail.com with ESMTPSA id 46e09a7af769-7d76ae68a4bsm14058432a34.19.2026.03.16.23.51.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 16 Mar 2026 23:51:47 -0700 (PDT)
From: Wesley Atwell <atwellwea@gmail.com>
To: netdev@vger.kernel.org
Cc: linux-kernel@vger.kernel.org,
	linux-kselftest@vger.kernel.org,
	davem@davemloft.net,
	dsahern@kernel.org,
	edumazet@google.com,
	horms@kernel.org,
	kuba@kernel.org,
	kuniyu@google.com,
	ncardwell@google.com,
	pabeni@redhat.com,
	shuah@kernel.org,
	Wesley Atwell <atwellwea@gmail.com>
Subject: [PATCH net-next 0/3] tcp: fix scaled no-shrink rwnd quantization slack
Date: Tue, 17 Mar 2026 00:51:34 -0600
Message-ID: <20260317065137.1533226-1-atwellwea@gmail.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Hi,

this is a new, narrow series for one specific receive-window problem in
the scaled no-shrink path.

The earlier larger receive-window accounting series tried to address
multiple cases at once: quantization slack, live scaling-ratio drift,
retracted windows, repair state, MPTCP state, and extra test plumbing.
Review on that version was useful, but it also made clear that the
series was trying to carry more mechanism than the currently proven
problem justified.

This repost keeps only the part with a clear fail-before/pass-after
story today, and it keeps the stored receive-window state representable
so later no-shrink decisions continue to reason from a right edge the
peer could actually have seen on the wire.

Problem
=======

In the scaled no-shrink path, __tcp_select_window() rounds free_space up
to the receive-window scale quantum:

  window = ALIGN(free_space, 1 << tp->rx_opt.rcv_wscale);

When free_space sits just below the next quantum, that can expose fresh
sender-visible credit that is not actually backed by the current receive
memory state.

That is not just a presentation artifact. Later hard admission can still
reject data which is within the sender-visible offer.

A narrower first rework that stored raw free_space would not have been
safe either. Later no-shrink preservation derives the current offer from

  tp->rcv_wup + tp->rcv_wnd - tp->rcv_nxt

so the stored window still needs to remain representable in scaled
units.

Approach
========

Instead of rounding larger raw windows up in the scaled no-shrink path,
keep only the cases we actually need:

  - relax one unrelated packetdrill test which was pinning an
    incidental advertised window
  - keep tp->rcv_wnd representable in scaled units by rounding larger
    windows down to the scale quantum
  - preserve only the small non-zero case that would otherwise scale
    away to zero
  - rely on the existing tcp_select_window() no-shrink preservation
    logic for already-exposed credit

That removes the larger-window quantization slack from rounding
free_space up, while preserving the small non-zero case needed to avoid
scaling away to zero.

Tests
=====

The packetdrill reproducer exercises both the immediate quantization
case and a follow-on ACK after a small OOO receive-memory change.
Before the TCP change, it fails on the first outbound packet with the
advertised window one scaled unit too large:

  expected: win 84
    actual: win 85

After the TCP change, the reproducer passes and the follow-on ACK also
stays at 84.

Series layout
=============

  1/3 selftests: packetdrill: stop pinning rwnd in tcp_ooo_rcv_mss
  2/3 tcp: keep scaled no-shrink window representable
  3/3 selftests: packetdrill: cover scaled rwnd quantization slack

Thanks,
Wesley Atwell

---
 net/ipv4/tcp_output.c                              | 16 +++++---
 .../selftests/net/packetdrill/tcp_ooo_rcv_mss.pkt |  8 ++--
 .../packetdrill/tcp_rcv_quantization_credit.pkt   | 45 ++++++++++++++++++++++
 3 files changed, 61 insertions(+), 8 deletions(-)

-- 
2.43.0
