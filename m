Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.222.200
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795566720;
	b=xC/HfxfS3gbKhhoDJRG5VXXA5KV+BTX0oVShp+hkUYd7XM82tF2Akg6IHAggSU2xRY1v
	 Mbme6fTBIUNU/C2ArP0/RTMfIJNpT81HokU8658t1G9+ELIpFXhuG+yys83kdSP4/ILX+
	 yDx4SVzi17dA7Meyk3hvf4Igb4UVC5RW151SFuisHUtMcivrT/OArByMpfEooXwBDRM+c
	 hvyErr7pPxxA3ynG2D6rO2e7t8LW/bMiAyrUQagZ/C/ZCOjiBiUL+NC9oulwi7Ozz1BMk
	 rxT7CKa0dgMcqVqCBaqSTesvH26fXqy8inZsMuvv6iS0omOdyNsWbNWbEw5ZIRTQreQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795566720;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Received:Date:In-Reply-To:
	 Mime-Version:References:Message-ID:Subject:From:To:Cc:Content-Type;
	bh=Gcn9k5RyT2SrLf7rw1mzgR9U0hO9J3AKAxDoC8pAHaE=;
	b=SDHug11MQacmbHXjRtyzjsW9nYi3C/ujkoYvyqR9QaB7eQ4SvW09poFEHdNV22LJ/69m
	 8Z7o077RM57hDsJt0ilZiuVWuiiuLr9wUs54KgwRlmJFEGvnB1vX4KeUMM4xlhZh/a8Ac
	 hS8vwPZ2eJujg459MCU01gdb9GeceUJLB4V+ChqLMAjNE6GDKX61/1qGxN4kZ7my5oODJ
	 O53GVpwP+9q6V0ksJBAHdKZvCWU+/gM03ANw5A0vffV40rgi8aq9YwzBUTnYYJINlYIdb
	 w8VCsMFAqz8ZYGOxWWf67S97n0vGVLt3SCMXkPMlejq1u1y6kKDaR4Li546hOsRjWcw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=google.com;
	spf=pass smtp.mailfrom=flex--willemb.bounces.google.com;
	dkim=pass header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=XQwmHO9u;
	arc=none smtp.remote-ip=209.85.222.200
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com [209.85.222.200])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 25348606A321
	for <linux-kselftest@vger.kernel.org>; Wed, 25 Nov 2026 00:32:00 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 25348606A321
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--willemb.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=XQwmHO9u
Received: by mail-qk1-f200.google.com with SMTP id af79cd13be357-94960bd17b5so846179385a.0
        for <linux-kselftest@vger.kernel.org>; Tue, 24 Nov 2026 16:31:59 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20260707; t=1795566719; x=1796171519; darn=vger.kernel.org;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Gcn9k5RyT2SrLf7rw1mzgR9U0hO9J3AKAxDoC8pAHaE=;
        b=XQwmHO9u+G4hYbfjQQeoBtP0836u6rFMOum3quZGgd8jUKrOktAJVwEQuog3RtOmR0
         /ry4sUgmBhTa0VJ+gsXi2il8IjEVQbkCKgqIxFm4In+weX8rQHoGRHvzFqFzB3Kd6WtV
         Z5pZ94I09jYptL+vsSsRoXLBbi0yhwV3eCUMhQmYwmHJdSpC5cWLLWezW+If2da9/l9s
         9IP7EBTwCDSaVwLhAYHmD5Pd5QyzOhLzNqf9+H1zdirHMjrf4TBLtNCd/Ni65Rxt0TfX
         vS8nYnwvKz0RUdhL+Obbgtl1ieYbZFd82+sbfUP9wroXnbE4hVHL3U7XXMoLZ43y2iQJ
         uO5g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795566719; x=1796171519;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Gcn9k5RyT2SrLf7rw1mzgR9U0hO9J3AKAxDoC8pAHaE=;
        b=KBH8Qp+buKTlhcEUoRJshTDz0EaHRptndQl4Wn6PVuvFTrOENOqcZloZWqmZVM5xTb
         gt2sjaYOR54M+tHqWWPZnDdWy4ehM+rukN3oWx8XPFVbhgD9Ro9tFIlu4ehzNpRseH/P
         ffCmsG/ZSpZXzwLT9myDKNuRrtBkCPUoOiSh+r/RETc2zOl3Elzshb3EmLGinpBi+wVZ
         +k8lDe8+vOkMN+a0oDRIZb2AtoWtzmTkuyqX0/EXnSZHhL8+TlDUPx0WRj58tgzjAI6Q
         s04YdHeozvLt1rIVgTDM9fR/r3yLUnAWTjKkrWG3CPMNkd3ev5MFveU4OTMo/eHMko0p
         QhOw==
X-Forwarded-Encrypted: i=1; AL+hErH443xTjY2kFM4q6cdLnSq3QxPiNPiSCIviTW04bJGFQYdx38RBqsLkOHJJpdQ3RTDnPmrjM0Y1CcQ0mxg6KZI=@vger.kernel.org
X-Gm-Message-State: APuU4Z+eiRE8hqpYCxzxUB/5oUzydPn6W7yubdH+mDYqRdPoMI4Y99IA
	eIdhYfbOXkg+S0NJHQqmsX86fjgI4R5BBWckApjJGIOg9jIRaRfyZy+3FsxweoYR2ehcDwBLIIk
	LCr8qrZV2SA==
X-Received: from qvbld10.prod.google.com ([2002:a05:6214:418a:b0:921:2ee8:44dd])
 (user=willemb job=prod-delivery.src-stubby-dispatcher) by 2002:a05:620a:6f0d:b0:939:6dea:374d
 with SMTP id af79cd13be357-949ba9d1fa6mr2800574685a.49.1795566718729; Tue, 24
 Nov 2026 16:31:58 -0800 (PST)
Date: Tue, 24 Nov 2026 19:31:58 -0500
In-Reply-To: <20261118143500.dualpi2.1.543a9a1be910-zhiqizhangg@gmail.com>
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Post: <mailto:linux-kselftest@vger.kernel.org>
List-Help: <mailto:linux-kselftest+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kselftest+owner@vger.kernel.org>
Precedence: list
Mime-Version: 1.0
References: <20261118143500.dualpi2.0.543a9a1be910-zhiqizhangg@gmail.com> <20261118143500.dualpi2.1.543a9a1be910-zhiqizhangg@gmail.com>
Message-ID: <willemb.4158a0ba73d8@google.com>
Subject: Re: [PATCH net 1/2] net/sched: dualpi2: refresh head timestamps after trimming
From: willemb@google.com
To: Zhiqi Zhang <zhiqizhangg@gmail.com>, netdev@vger.kernel.org
Cc: jhs@mojatatu.com, jiri@resnulli.us, davem@davemloft.net, 
	edumazet@kernel.org, kuba@kernel.org, pabeni@redhat.com, horms@kernel.org, 
	shuah@kernel.org, koen.de_schepper@nokia-bell-labs.com, 
	linux-kernel@vger.kernel.org, linux-kselftest@vger.kernel.org, 
	stable@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"; format=flowed; delsp=yes

Zhiqi Zhang wrote:
> Reducing limit or memory_limit in dualpi2_change() removes packets with
> qdisc_dequeue_internal(), bypassing the timestamp refresh performed by
> dequeue_packet(). The cached c_head_ts and l_head_ts can therefore refer
> to a packet that has already been removed. If a queue is drained, its
> timestamp remains nonzero.

> get_queue_delays() continues reporting an increasing delay for the empty
> queue, and calculate_probability() uses that delay as input to the PI2
> controller. Partially trimmed queues also report the delay of the old
> head instead of the retained head.

> Refresh both cached timestamps from the internal queue heads after the
> trim loop, while still holding the qdisc tree lock. head_enqueue_time()
> returns zero when the corresponding queue is empty.

> I identified this issue and reviewed the fix. I used OpenAI Codex for
> root-cause analysis, drafting the fix and this changelog, and assistance
> with regression-test development. Codex also performed automated
> validation; the archived results are described below.

> I reproduced the issue using Codex-assisted automated tests on an
> unmodified arm64 net-tree kernel in QEMU, with real AF_PACKET traffic
> in an isolated network namespace and HFSC ls/ul shaping to retain
> packets. No source changes or fault injection were
> used to trigger the bug. The companion kernel selftest covers C/L
> dequeue, full and partial trimming, mixed queues and no-trim changes:
> the baseline passes three controls and fails eight trimming checks;
> the fixed kernel passes all 11. Runtime coverage is this DualPI2 selftest
> on arm64. I also used Codex to build arm64 Images and compile the modified
> object with W=1; additional build coverage is in the cover letter.

> Fixes: 8f9516daedd6 ("sched: Add enqueue/dequeue of dualpi2 qdisc")
> Cc: stable@vger.kernel.org
> Signed-off-by: Zhiqi Zhang <zhiqizhangg@gmail.com>

The selftest flagged checkpatch issues. It is also many LoC if only
testing a single small issue. LLMs are good at generating tests, we
cannot include all.

Let's also include the original author.

pw-bot: cr
