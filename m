Received: from mail-pl1-f171.google.com (mail-pl1-f171.google.com [209.85.214.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DE2294FB9A4
	for <linux-kselftest@vger.kernel.org>; Fri, 16 Oct 2026 16:05:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792166745; cv=none; b=mSXTZgiT97nEBZe0/la0caj+QHg712ZDxrzw3vuzEnWbu27oZ0XGiWavqeRLMsq9U9T6ag0Jn4IOC90/EEOAr/WT74TJVYRqCFhe4xMRLFvp81ylcgHYahvfxblm7Du067g7b/S3T9ZcHH5aI2VgMXyf+vV+JC7DZu0N2Z1YkuA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792166745; c=relaxed/simple;
	bh=5ug6v5uuguLMr0+ls7SFxJsomUB55a7qx3oFLi85A2w=;
	h=Content-Type:Date:Message-Id:Cc:Subject:From:To:In-Reply-To:
	 References:MIME-Version; b=jU9uBUuqvRbp7Y16LKJhETre6FTdhHtK+u9jjJl0ffgaEFDQKaH3Wr0s//zL9OlzhjjmsE2Qpd7l0Iz5eCup0woQboMQPH78gUk3NvsH2z53QOvYL86DltIY4dzbFB9DoRuWCLareGnr/btxH+ZrhbxNjURfO7zNB2CrgpwKYgE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=GcRyK0k5; arc=none smtp.client-ip=209.85.214.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="GcRyK0k5"
Received: by mail-pl1-f171.google.com with SMTP id d9443c01a7336-2e87c66e556so6358105ad.0
        for <linux-kselftest@vger.kernel.org>; Fri, 16 Oct 2026 09:05:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792166740; x=1792771540; darn=vger.kernel.org;
        h=mime-version:content-transfer-encoding:references:in-reply-to:to
         :from:subject:cc:message-id:date:content-type:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=5ug6v5uuguLMr0+ls7SFxJsomUB55a7qx3oFLi85A2w=;
        b=GcRyK0k5WHg4tEAQXetii8VT3FpuvJBNc9gVD1wQD3kMRzitP/JkjsmADGHjlxL+PU
         dHscCPnQ9ROWEDOE/OjpTTPkkW+9u9PUeqKT/kqYjGW34i6hvQfGoCLsdJNK4tcG130J
         zc7JXjUlQJmAqNygBZXjncIIBCIFwbkCsq7S8Cn/f93qWLqegi8o5YtuUgWAjFROKG9E
         GtHeMrAIMwmSJGz0RjZi+ebFBUcibNF84F20L7+YmfBkQ46KI7ZMFQkvRTMbd5DDuHnd
         JElEwXE2PSDo863dbeijudiL6Vi32+qgW+Eopbhf2Tf1pjDO9UrsJOdPkzdat8qiGLTd
         ueLA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792166740; x=1792771540;
        h=mime-version:content-transfer-encoding:references:in-reply-to:to
         :from:subject:cc:message-id:date:content-type:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=5ug6v5uuguLMr0+ls7SFxJsomUB55a7qx3oFLi85A2w=;
        b=uagPaZoAGIGf41iGHSZx972p0fzlUMW5BYVQo67QsXqG8bXvMiFFvuyFByvLAwLRwY
         3AW/CFHYFFpvwzoAEs6KyxSjipW5kyGzvR/r77Q5F0KoPYCltOvqv8AgTLya5sPRsB5d
         c46o1FEC8RohuxOM3WD/qQuV8QHlyw1lQD3H2rOODuAvcEcC9oACy5hj3lxUaTYuicnM
         8N+Ny3S/V4Tt60wI6HhbkldGSEs6I3FOm3oTOMNX7y8gg6Aeu9nZfZiPe7YuLXlQGnXn
         MhQPyJeYr5dhSpG0uxI26CiRkZVqHrfWA4c07F/ND9lLiF2hHUOCUyi7as8WgKI6P6nA
         LPPA==
X-Forwarded-Encrypted: i=1; AKwUvBw2CtVzJYbMySgd/xv2vvLZMpfotYeIh+1yCVXz3upxv/5ZFrdGMG+eH7HOuY81x3GyJtSu2Wg7SF+Vwe+gWWU=@vger.kernel.org
X-Gm-Message-State: AFq9FYI7XbfKoTbVkl+Z6BcBnFEzSdc4ogvwJeukeKwWJA5w1PcxNyQg
	Wnt0xYmt1yAXJVGHdcgnAi6/iyCGElaWlBKBEXCINDfjpF704q1f2rmYpU5hwg==
X-Gm-Gg: AYBFou3+/QLHTXc6QL683zrxGLnTKcq3Y7Y7yHMWuV010gO2uBiw9AN1+bMWbMzMy7K
	VS+4LXZD6FqJ2d9mwoCjxtIdaJjhDsPnLMqvvy6fMm7DLYXDn1vtK1sWTOYBd+eupOPsYTDoxDN
	IHXvhVeCuvcOpCY9OehVDwXwwS0aGX3RIvp0ndcehb0REnDw7jf6bm9KXmmsYGrnLawCJGnzhrk
	go4/cSC4kPepXBuGTKsUtMzU8iNxabnus7Oh2BgFE5z51Rf4kuPw1apx5w6Y7dn9LPcXv81Bnk7
	QQto6L76TvBG+YgyNolslZ9MxoUnqLjekG0zoxoFgXcudH+o79YG5NJy+yaAnFbC5Y5fouuuRc2
	wQn9W0xPmyqFGHiI77Xl+hIEe7G7+brybw3jIDeSHYR/ODH98rXNzTRzva+W5VZJzW00kJattOF
	T/ene/bYkLmrSnCOgsNd8TGG8GyM1yLiqe049e2v0xPXTqcwiGZ3pmZU7X7wfqWRY4TjxOiGdmq
	7LTPJJGsGC7MRWB4X7X+1CBvOf9dvpEl049qsdM4eKLl+slgK9mggyv0TGh2lytAG0rc/1Gs24x
	Psc=
X-Received: by 2002:a17:902:cecb:b0:2e9:569a:214d with SMTP id d9443c01a7336-2e9a6e555c9mr2838805ad.43.1792166739835;
        Fri, 16 Oct 2026 09:05:39 -0700 (PDT)
Received: from localhost ([153.61.198.243])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2e97e834f32sm12220085ad.41.2026.10.16.09.05.38
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 16 Oct 2026 09:05:39 -0700 (PDT)
Content-Type: text/plain; charset=UTF-8
Date: Fri, 16 Oct 2026 16:05:38 +0000
Message-Id: <DM6E35SUH95A.2B7HJ5XOTFJHS@gmail.com>
Cc: <bpf@vger.kernel.org>, <linux-kselftest@vger.kernel.org>,
 <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH bpf-next] selftests/bpf: Run tc_edt serially
From: "Alexei Starovoitov" <alexei.starovoitov@gmail.com>
To: "Qiliang Yuan" <odys.yuan@gmail.com>, "Daniel Borkmann"
 <daniel@iogearbox.net>, "Andrii Nakryiko" <andrii@kernel.org>, "Eduard
 Zingerman" <eddyz87@gmail.com>, "Kumar Kartikeya Dwivedi"
 <memxor@gmail.com>, "Martin KaFai Lau" <martin.lau@linux.dev>, "Song Liu"
 <song@kernel.org>, "Yonghong Song" <yonghong.song@linux.dev>, "Jiri Olsa"
 <jolsa@kernel.org>, "Emil Tsalapatis" <emil@etsalapatis.com>, "Ihor
 Solodrai" <ihor.solodrai@linux.dev>, "Shuah Khan" <shuah@kernel.org>,
 =?utf-8?q?Alexis_Lothor=C3=A9?= <alexis.lothore@bootlin.com>
In-Reply-To: <20261009-selftests-bpf-tc-edt-serial-v1-1-f72e045f2465@gmail.com>
References: <20261009-selftests-bpf-tc-edt-serial-v1-1-f72e045f2465@gmail.com>
X-Mailer: mkdraft (claude review draft; edit before sending)
Content-Transfer-Encoding: 8bit
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0

On Fri, Oct 09, 2026 at 09:50 AM Qiliang Yuan <odys.yuan@gmail.com> wrote:
> The measured time includes the time the sender and the receiver take to
> run. When test_progs runs other tests in parallel, the sender and the
> receiver compete with those for the CPUs, the transfer takes longer,
> and the measured rate falls outside of the 2% margin.

The test is flaky without -j too.
It's in DENYLIST.s390x in CI since Dec 2025:
https://github.com/kernel-patches/vmtest/pull/418
and it fails on x86 with ASAN:
https://github.com/kernel-patches/vmtest/issues/503
Both jobs run test_progs without -j. serial_ won't help there.

pw-bot: cr
