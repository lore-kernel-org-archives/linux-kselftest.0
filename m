Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.208.51
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795529541;
	b=mmEPePAUGhUEQAHS1+BVVkanDGl/FUvaoFMVgWTRKFTKErG/tUhRg8yegV6mtpSzaVH+
	 h3GMFhG5GJA38uJ2E72dq/74WQeYH2wvjuPZjaRIvmf284oqmOHxRF74ev9bC5RdNpxLm
	 bba7E+iTeU3qWOl2bHYsWS4zx1pchIizeq1Qk25puHITSl6/0/Y96f+oDJmzITjsm569r
	 Dy8M8he74Gtx0MFzezgcuDt0ms7BV6yzZ25S6R7FawHcCV3AMzgRebSbn6kzkfkMfWPD3
	 lvd1Iox2zOepxAxNxOSgRA2cHOLhLrfQqaSo7UtNQZeOgF5mBOsZobIpMm5F77ZnNpA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795529541;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-Id:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding;
	bh=1xGMs6jT7TfzD1rWb/wp0MZUHeeMb6G/nblIX2zqKoc=;
	b=Ti1fBWBzjGWcxLFZV1StkHo7K5blRGs7k+uGGumxuJr7r8a41l+i4q8FUY8IDqH3JXz1
	 ZIpb/jaVy0ySs3ER4V+B2eQNGIDZWzcePB+s5q1bcVaun7O34+0bgsjOrPf582cvintA6
	 eQVMKw7ToGT6rUyowScJQ/H/m+BfZDRYxFvNI08IigZrcNFQAN3v6kNy3bbIAzHQMtmct
	 yKZbHXXjrBCBPBZ6DHrOrRGBif6PReFoMBM0XuKt1ko43E4rcl7USqNaKdQB0udWDbDOK
	 UmkyyT/fFCZP9J4LPENcJOVIjIpq98B/6AYauq1WbxSJpSMJXPxBhqNUuMEnZYKrg2g==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=mojatatu.com;
	spf=none smtp.mailfrom=mojatatu.com;
	dkim=pass header.d=mojatatu.com header.i=@mojatatu.com header.a=rsa-sha256 header.s=google header.b=c+5KiT+9;
	arc=none smtp.remote-ip=209.85.208.51
Received: from mail-ed1-f51.google.com (mail-ed1-f51.google.com [209.85.208.51])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E00AA606A335
	for <linux-kselftest@vger.kernel.org>; Tue, 24 Nov 2026 14:12:19 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org E00AA606A335
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=mojatatu.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=mojatatu.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=mojatatu.com header.i=@mojatatu.com header.a=rsa-sha256 header.s=google header.b=c+5KiT+9
Received: by mail-ed1-f51.google.com with SMTP id 4fb4d7f45d1cf-6b8b20b2538so5394307a12.3
        for <linux-kselftest@vger.kernel.org>; Tue, 24 Nov 2026 06:12:19 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=mojatatu.com; s=google; t=1795529538; x=1796134338; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=1xGMs6jT7TfzD1rWb/wp0MZUHeeMb6G/nblIX2zqKoc=;
        b=c+5KiT+93GkBxGQDnZLhMfbzB4uOpSJpkhB557s6VSmMDjh/WdWRmKGYd9rfHEpK83
         LLjyPPVRzMGVtn/owlTnBaSun1o3TfKtlYqcIUt88P9eCh4VtBNAbSTMfk1DKYHPfoGJ
         8/U/ct1dPt4Z+AdpQeggupLl8qwi8szv+PsUA=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795529538; x=1796134338;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=1xGMs6jT7TfzD1rWb/wp0MZUHeeMb6G/nblIX2zqKoc=;
        b=Su81QdmlFqO+gBhDeQTpb3K59x/i2NH0mpxjlklLIijTUiANZVChx2WAJf8n3/mLqw
         E6d9XKBb5I9Q8Rci+qQoTyQyBCQ77ah3xh5a0IxFc1GZsTl9HVv/SpjUQ+PI4NfWJUQX
         EVjuxWILdl5TXWwtp/k0sr1GXICf4UPdFNFGiYOVIAdMmYzZQNkTCNJnuYhzg6VtHRkw
         DNQKija9qIDwyoF/9XSH3ChiirnNDZ8db1Uu+J2W0NcDIFH+Ao6SL8HXHkRH7VN6tB/W
         nAUZIqFJIJKp0LplDtfGU4w8supStXCLZlmSU1ROey8zzNaHuyJGAsN2zkAA91XoaQKJ
         lBIQ==
X-Forwarded-Encrypted: i=1; AL+hErGWa2M6+4WfKDOz4eml0b+UI7Fid4HwHqj5iUD6PNG1+kyRG5RAYehmgsbsDWsSorkI1BXLwR8mgZxKuHCBL5c=@vger.kernel.org
X-Gm-Message-State: APuU4Z9G57BBtlGSDICyg3lnUpZHHSZISmPGGvuR/rNFGzeGbGM93P4u
	CP/lBoiXwWqrWJYlVLZuwZ5geUjG2VkPZVScHA7X+XVLQO6fQnp8rvYpkDQaq6Q/kQ==
X-Gm-Gg: AZFdTZckyqH2P5u/cY/zP4tCZkQzAftJ/8BCDOALFrm+jEw767mrZGtiwJ2AxxwiRkK
	204rfuUurjZMwWJyj6qqaizmOwubOJXSD53Qxb5V1ux8aV6IwnGCCcQg355L4kgRdj7yAC9H0Zz
	sX42A4n/ibroGD20nenzWCfGLqKieCMUin4iAIUMVwTZS5qUHChN0dPsQbk9OxlgqkjsVnp5p75
	WYfx7jIRaF+4/0Nt9RWdcvmlgpEmHWNrJ0hKwfnWO/yo6suD5/OQRNnlG4desFtmBYGmtfa7sQ/
	UNez5Xl3oBMoSGd2u4OtYwNiGDgSi4wdr3CalKYD8pnD6odjDSjdjWSEVCxtqHGsiO3Go4ngFJq
	iJDxLB4PQgZc/kJ6AZfR8BL/PQE/tjYBuSEpRIjh4M1gi9N5beWTVU8khPEKMeIUqWCXiwTjzXv
	eZUskLlT8mq3xoV1C0opmTxLP9bJyrhLq4olp2OwHRdNbJ80i32xqMtUjKVZcZxEajU6laca19I
	x+ExupTkrrPHemrrrljpMkmKKHJgLsYbW/OYwWKqW9HT0HQnAwXakSxt4nz/hZebt6tSuE23z87
	BbjI3jFeUDVOLFzTKiGGy3hxwJdjuAx4gjTWi6Z0eODcGTg4Pv1lYHCw0jU7+iZMf9/6B1TklP4
	b46Mz9p4/7ikzTOotOS00
X-Received: by 2002:a05:6402:1596:b0:6bb:6c8:c4d2 with SMTP id 4fb4d7f45d1cf-6bb06c8ce30mr1085338a12.31.1795529537654;
        Tue, 24 Nov 2026 06:12:17 -0800 (PST)
Received: from mbili.waya ([64.203.83.2])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-6ba7b9570e9sm5032739a12.36.2026.11.24.06.12.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 24 Nov 2026 06:12:17 -0800 (PST)
From: Jamal Hadi Salim <jhs@mojatatu.com>
To: netdev@vger.kernel.org
Cc: Jamal Hadi Salim <jhs@mojatatu.com>,
	Jiri Pirko <jiri@resnulli.us>,
	"David S . Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@kernel.org>,
	Jakub Kicinski <kuba@kernel.org>,
	Paolo Abeni <pabeni@redhat.com>,
	Willem de Bruijn <willemb@google.com>,
	Simon Horman <horms@kernel.org>,
	Sebastian Andrzej Siewior <bigeasy@linutronix.de>,
	Clark Williams <clrkwllms@kernel.org>,
	Steven Rostedt <rostedt@goodmis.org>,
	Alexei Starovoitov <alexei.starovoitov@gmail.com>,
	linux-rt-devel@lists.linux.dev,
	Victor Nogueira <victor@mojatatu.com>,
	Edward Adam Davis <eadavis@qq.com>,
	Po Liu <Po.Liu@nxp.com>,
	Shuah Khan <shuah@kernel.org>,
	linux-kselftest@vger.kernel.org,
	stable@vger.kernel.org,
	syzbot+0054fed3dc9085390f51@syzkaller.appspotmail.com,
	shaos <shawnq1@163.com>,
	sashiko-bot@kernel.org
Subject: [PATCH net v4 0/3] net/sched: act_gate: bound the cycle time and refuse schedule entries shorter than 10 us
Date: Tue, 24 Nov 2026 09:12:07 -0500
Message-Id: <ACT-WEXM.v4.r0.20261124074514@mojatatu.com>
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

An act_gate schedule is armed from TCA_GATE_BASE_TIME and
TCA_GATE_CYCLE_TIME, both unchecked u64 attributes that are read into a
signed ktime_t.  A cycle time above S64_MAX turns negative on that read
and the cycle arithmetic that follows wraps.

That arms the timer in the past.  Every expiry then recomputes the same
past time, so the timer softirq never finishes and the task that
installed the action spins until the watchdog reports a soft lockup.

A schedule entry of a few nanoseconds reaches the same state from the
other direction: the entry interval is the period the hrtimer runs at, so
the handler is always behind its own next expiry and the action holds a
core for as long as it exists.

  1/3  cap base_time and cycle_time at KTIME_MAX, and make every
       start-time computation saturate instead of wrapping.
  2/3  require at least 10 us per schedule entry.
  3/3  cover the refusals, the largest accepted base time and cycle time,
       and both sides of the interval boundary in the tdc action tests.

Edward Adam Davis posted a v3 that capped cycle_time at S64_MAX and moved
the attribute to NLA_S64.  That refuses the reported value but leaves the
invariant to the wrap: base_time is read the same way into the same
arithmetic and stays unbounded, so an accepted pair can still compute a
start the timer was never meant to take.  The type change is also
unnecessary; S64_MAX is a fine range for NLA_U64.

Alexei Starovoitov traced the stall to this action on the syzbot thread
and sketched the saturating arithmetic used here:
https://lore.kernel.org/netdev/DN37NBGPJJG9.2DSVDCKS3UYTV@gmail.com/

This series keeps NLA_U64 for both attributes and bounds the computed
start time rather than one input's value.  cycle_time = 0 stays accepted:
it means "derive the cycle from the entry intervals".

The 10 us entry floor comes from the measured cost of one expiry rather
than a device's frame time, and 2/3 states the margin it leaves.  The
100 us floor proposed for taprio was withdrawn for narrowing working uAPI
and for a margin it never explained; this floor answers both.

Changes in v4:
- Reworked as a three-patch series on the current net tree.
- Bound base_time and cycle_time at KTIME_MAX, keeping NLA_U64.
- Saturating start-time arithmetic, shared with the catch-up path.
- Minimum entry interval, with its measured cost and its tdc coverage.

v1 -> v2: reject an out-of-range cycletime instead of clamping it.
v2 -> v3: move the range check into the netlink policy.

Jamal Hadi Salim (3):
  net/sched: act_gate: bound the cycle time and start time arithmetic
  net/sched: act_gate: refuse schedule entries shorter than 10 us
  selftests: tc-testing: act_gate: cover the new cycle time and interval
    limits

 net/sched/act_gate.c                          |  45 +++--
 .../tc-testing/tc-tests/actions/gate.json     | 189 ++++++++++++++++++
 2 files changed, 217 insertions(+), 17 deletions(-)

-- 
2.43.0

