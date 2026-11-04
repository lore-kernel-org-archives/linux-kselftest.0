Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.214.173
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793758816;
	b=EhDbfqcZv/YbhxYT/cjyNXiSX6mYndnOhLxe9uuciFrNLEOOMWJimVD1On2Q/0KcalC1
	 Wni68zONHLy3eX0CXSe3Dy1ZUPRQIJ0pCUMDzuz4sDE1V+5+ugvcBGNOCuSld2B0CPY06
	 EEQWi0XaPQrgiMLxwtjjHKgUZSVJ44wHRear92BZ+8xNm2WSLLRQw5QtVU2uSRTGD8RC5
	 80byCIMoYMnA66HZryl8nTEQPJIlAR37deYc5ej8szKaUx2cQzqFXGL4NPQKrDJfDBwXg
	 IB09/2UtiLY/om5HEX3bYdDcznYh+jA2aO1ln2oH8NyvpY9MobUfDp6vGal7gI0H9cA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793758816;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Content-Type:Date:Message-Id:Cc:Subject:From:To:In-Reply-To:
	 References:Content-Transfer-Encoding:MIME-Version;
	bh=xCk3/rz0DOELcqiOfP0DbefR1Tzq2eC/yEUTX368PGI=;
	b=j14OpgJZEg4EwJdrOu2Ug/gp3gBJlYCxiwp8gUOZuXYdati1mo7kdYrQxgeIehHax1Qi
	 tjfNcsrs8hytMSZers9f8eOL3dvk00bicIcehmdTKg/QZoy6WHeJDg/l5JT/x+l9vUTF8
	 gkuyA7vIyUpCCZ3UZlhO2fnQ5R1Yzs51na/BSUNHW18GXJMmx/q1eazLoM5nj6aTAbL6M
	 td5DhdbquYwiZAMzT1lv0ojC2xO6TW8HMVx0aXsMMHeyzNACqrIk0F6auEcehwClZx7ve
	 HDX4NDU9rLfep2eygHE2SEQPcRKGQKRjyf852/gd8xyVt5mpUqrs1shB0UfDUAjqZgg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=knxxNkEU;
	arc=none smtp.remote-ip=209.85.214.173
Received: from mail-pl1-f173.google.com (mail-pl1-f173.google.com [209.85.214.173])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E9F9C606A335
	for <linux-kselftest@vger.kernel.org>; Wed,  4 Nov 2026 02:20:15 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org E9F9C606A335
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=knxxNkEU
Received: by mail-pl1-f173.google.com with SMTP id d9443c01a7336-2e5fb79ce82so839825ad.0
        for <linux-kselftest@vger.kernel.org>; Tue, 03 Nov 2026 18:20:15 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793758815; x=1794363615; darn=vger.kernel.org;
        h=mime-version:content-transfer-encoding:references:in-reply-to:to
         :from:subject:cc:message-id:date:content-type:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=xCk3/rz0DOELcqiOfP0DbefR1Tzq2eC/yEUTX368PGI=;
        b=knxxNkEUj3H/maGy1vZXbPObigq0Lw5pTZSJ5WLraaakJIetgxF5pQYW9ISHAV4Yu7
         w162WqmqRsmINLrlMKRhnZsEHYO5Ny+wPBhy4p0NmmPaptph09DN4lxLAeeEuwXrsUSY
         YA2Tos0G/jghorJ0jf8BLfBbx0GuRKnlfFmLMd3pbUxvI/HsgYLfGKvwHp8wbcVUU7ag
         oOuFW0i9TJDGNHJdy4zkSIpWViNpdB0yyBVd3t1+otpHke60espzZqQv6Zk+UbcqwikY
         qh4yMRQkM7HQg5CFfuxNswKhZrrESU1bxxElr508pMjB7kwYJ0H1M0xHLrOae2rweqnC
         hDfw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793758815; x=1794363615;
        h=mime-version:content-transfer-encoding:references:in-reply-to:to
         :from:subject:cc:message-id:date:content-type:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=xCk3/rz0DOELcqiOfP0DbefR1Tzq2eC/yEUTX368PGI=;
        b=b9qUrbszdCkG+5BKBzfrDg8ARgt80JMbZVOc+bwKCiDkkbSmG41bQFKmG4X3h6yRpR
         Mtj5EHwMjXG/uIxaNO5d7Hg8oF22n01BeUn0FZhVk6pQPU3rIBdfOlorujVYeeWlXC0c
         Xt/JcOquKeIuAUHozy3FeedW4hqACD8PYzuIZ3X+ue6Qg327qeam3mLolxRynJGuBN87
         4a47ZuCrgnD1Qjn6GfHEmZSw8AZ8Q1J4rwh0xQROVTXEhoVkWSTo5dFB0YN9U6Xfbiv5
         31HpYYV4Z2tWzj1j5Zz8kVaXmdJZ7+JY2IGCra3IXFTc5NEwvibyrt5NF6JOiA8zuqAe
         r2tQ==
X-Forwarded-Encrypted: i=1; AKwUvBxImvFqYizSiO77SaZg81dtSwgHrG2ZgQFx79tpglttlnnImTdsOwncBM3XDHL0ymjNb7H+HPnhXp6ziu+tHVI=@vger.kernel.org
X-Gm-Message-State: APuU4Z+KP/rdjrMjV9ckDQ3tNTfJkk1xU29tlbfyvynYyOaPPkqiOiMB
	kTrn7dDeS3inxhT3WDxWgiIN9lHBayhXy1E4yOP3CLcFqTm8Htt5Diq1
X-Gm-Gg: AYBFou1p+CN2Y5Cr5N+y0INm0fCl/lnvTgEjw9El7QnKen97OR0nK6VqifUhFySTKlq
	b2rqmTq4njVmfoht+2dlcUY6LMYwFFEta4Oe/g+9WX6tuRtCQ8VafICBv7tX9gcI+2JvipqjShC
	HZHJ5wOHsNz+UHLFe9LlYeUnUqiPalrBoCZPU+U87dCH3IjOTbS8fyjwj/rTGBzdqSxsyH4sRFd
	CBT+YjZKbYbi+Dn3Va4m3rhYRwHK+rWq9GpsF6oVYREcZqAfX24HmFZhDI6KzoYxN+2W7NYhIqD
	VWva+CYNuqt/sfTe2Dbg7a+TcjzWDyW7SNqwnd4Shj+h9UKFjxkns2M/nvs95WRCQLWNZVRjy8A
	YMFGxR2h+84Fml20PWplap2Tq2Pajg9oFZlwJdbLH3vhhAi96S58MZ2t1RYTSLGKp/gurT5yTmS
	u7OBwo+rEAPkXzHEI7LS0VnliRNZrzFemxBY/xOmDN5yCdSIvDXjiTgozw0jbPJbBu5/1zaJUEP
	7WKdEpFrsfEOKZkFkP6jCHLhmUTf5D+jsSepYo++avniVCMXT636XMi0LB8aB3r0PbJ5duir/zJ
	qQCGAPiHvlj9yKQqMzqGAM75UoBP5tE61fJM29cKBDM0GW8rxiUSF8vFAGu4RL79otYKEHxpWyG
	sPRPo2Dngix4zql/crEOOpZF2tqys49Tjmg==
X-Received: by 2002:a17:902:e5c1:b0:2e8:1929:c8e4 with SMTP id d9443c01a7336-2eb36527d99mr133638285ad.60.1793758815155;
        Tue, 03 Nov 2026 18:20:15 -0800 (PST)
Received: from localhost ([153.61.198.251])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2ed08fe4dd2sm1063965ad.25.2026.11.03.18.20.14
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 03 Nov 2026 18:20:14 -0800 (PST)
Content-Type: text/plain; charset=UTF-8
Date: Wed, 04 Nov 2026 02:20:13 +0000
Message-Id: <DMM2FJ2SNYYO.24TEJ05OOR08E@gmail.com>
Cc: "Daniel Borkmann" <daniel@iogearbox.net>, "Andrii Nakryiko"
 <andrii@kernel.org>, "Martin KaFai Lau" <martin.lau@linux.dev>, "Eduard
 Zingerman" <eddyz87@gmail.com>, "Kumar Kartikeya Dwivedi"
 <memxor@gmail.com>, "Song Liu" <song@kernel.org>, "Yonghong Song"
 <yonghong.song@linux.dev>, "Jiri Olsa" <jolsa@kernel.org>, "John Fastabend"
 <john.fastabend@gmail.com>, "Shuah Khan" <shuah@kernel.org>,
 <bpf@vger.kernel.org>, <linux-kselftest@vger.kernel.org>,
 <linux-kernel@vger.kernel.org>
Subject: Re: [EXT.MSG] Re: [PATCH RFC bpf-next 0/2] bpf: Do not let
 preemption cause false recursion drops in trampoline progs
From: "Alexei Starovoitov" <alexei.starovoitov@gmail.com>
To: "Mike Bazov" <mikeba@sentinelone.com>
In-Reply-To: <CAPnbwjpv3bkGAKVjc7Eywgo-H4X6uDLYPJWFuSakGs_sBdgr3w@mail.gmail.com>
References: <20261025-b4-bpf-trampoline-preempt-v1-0-198dcdc0c6ac@sentinelone.com> <DMIIV9CE0PN4.309YUGIXQUZNF@gmail.com> <CAPnbwjrB_je6jXt3BGD-1q1yFs_wFd-Yh9KzixKzLK_X3Stuag@mail.gmail.com> <DML75890DWIX.EYB690LPBM1O@gmail.com> <CAPnbwjpv3bkGAKVjc7Eywgo-H4X6uDLYPJWFuSakGs_sBdgr3w@mail.gmail.com>
Content-Transfer-Encoding: 8bit
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Post: <mailto:linux-kselftest@vger.kernel.org>
List-Help: <mailto:linux-kselftest+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kselftest+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0

On Tue, Nov 03, 2026 at 01:28 PM Mike Bazov <mikeba@sentinelone.com> wrote:
> Thanks! fsession does keep entry and exit consistent. It doesn't recover
> the skipped runs though. I ran the selftest scenario with an fsession
> prog on __set_task_comm (7.0 kernel, lazy preemption, 20 rounds): Task
> B's entry and exit runs were both skipped in every round (entry_b=0,
> exit_b=0, recursion_misses=40), since each run still goes through
> prog->active while Task A is preempted mid-program.

Right.
fsession fixes the pairing. It doesn't fix the miss.

> What is the main obstacle to per-task tracking?

Today a fentry prog never runs twice at the same time on one cpu.
Existing progs rely on that for their per-cpu maps.

  task A, cpu 0                     task B, cpu 0
  buf = lookup(&percpu_scratch)
  fill buf
  <preempted>
                                    buf = lookup(&percpu_scratch)
                                    fill buf
                                    output(buf)
  output(buf)   <- data of B

A plain (*cnt)++ in a per-cpu map loses updates the same way.
Today B is skipped and recursion_misses counts it.
With the per-task check A sends a corrupted event and nothing counts it.

> And if per-task is not an option, do you have another approach
> in mind so that runs of unrelated tasks are not skipped?

Add bpf_preempt_disable().
Your test forces the preemption in the middle of the prog.
Explicit bpf_preempt_disable() will fix it.
And you'll have an easy way to see why disabling preemtion
for the whole program might hurt your own production.

What are run_cnt and recursion_misses of your progs on inet_sendmsg()
and inet_recvmsg() in production?
