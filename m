Received: from mail-qt1-f173.google.com (mail-qt1-f173.google.com [209.85.160.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 130DC40962B
	for <linux-kselftest@vger.kernel.org>; Mon, 15 Jun 2026 16:24:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.160.173
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781540647; cv=pass; b=p6SMfPRmxZTW8x6OPMVVrWUQ8ZfUtbwsSEioayrYSMY8Zmjvi019lWeK8a7PmZdC9l4llPmN1RpdimlT72sehlhEBXLO7NjTPOAjb+8/moYTrPyxpxxrtfgviGaHJXm9z+xa+zVe9gGaE0FOS0xyXBP3u/FTXUPfY+buFKSKKUg=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781540647; c=relaxed/simple;
	bh=eQLhmoMuXBduJxrYARdnWqAklKjp0V88w5VZfDoHa+k=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=khUdFpcOEAYEEkoVOUrxWcHPq4FA/G4x4tUxjSq2xBvt2V9SLTgVowujxaYj0QnAik3w8Sj5N1brD1RS2vNM0UNWk0Q9uPbmaEhki+wdO9M1S/pi8Kce5OCxB15sennoEQoEg8rQjexdicQDaPr24Jq42yA2iqQmW616kmqQ/9Y=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=riVSEkz7; arc=pass smtp.client-ip=209.85.160.173
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="riVSEkz7"
Received: by mail-qt1-f173.google.com with SMTP id d75a77b69052e-5176bbb9384so39564941cf.1
        for <linux-kselftest@vger.kernel.org>; Mon, 15 Jun 2026 09:24:05 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1781540645; cv=none;
        d=google.com; s=arc-20240605;
        b=NLhw3L9pkGCK6NZFVQgro2eX94U9N9FEnY4xTl0vSoZkaHH096VJy1GFlD+OpixHQ8
         gnIDUHATNUgRDUw4dOXdvAEltGRD0Ng+u9HSojISPTMaTzVXDa4PWOozs3iwQbgn/CoZ
         KQOcEA2Vq76OgtYWMWXHBg8qKumeIJ3FRvpSEy+/KyUyQfwf3Y9Cu6qpjZKjAMc1wWVv
         u2/dOQS1kDmlRpQN1o4Wln9CeCVDtTIfsCKsYwdjva8MWgDqQ/5kImHJ7d8M1VpffoL4
         2ZDLiXeRpr46mItZ59m9LHju4FV0ySOonwHbviA+w2gTUWagtG5Qq9YKpfFyNAY2/KvR
         5Fvw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=eQLhmoMuXBduJxrYARdnWqAklKjp0V88w5VZfDoHa+k=;
        fh=BmaEbEGsjAmYcxw0KVLE7HpPv7u1jymXDXTz1HQc428=;
        b=XTuIevnw2WT/Kacs6Np2h74V0ad/AQDdJIKZ9JSmcwTOzAh4RVWSaHGIQLwBpRdUzM
         JlmM6Cvs/Li0Kg+xss2UvEUMyKboIWoPY+BEy5XOp6n6rj0/TRlVq/lp6bNA4q5tprwg
         hfnt9/9mBXSYAuuF3KT3oPZBH6EHU0DiyVbkHSlkwYl8DfgPVW9Tykma0SrjY/236sqh
         LqYGDofGwPuLwZ65GDsu32UTPNSKNkKwQsc127IFlFv8Bs64P2/x2hf9HN0ndTNIO8r5
         xIuKVVKPdQoPGI1E3PSQXN5thNTf+HyBFpvY+gb5qTaFpiWdy2B3E3wOfU9whdSqfu1C
         xriA==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1781540645; x=1782145445; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=eQLhmoMuXBduJxrYARdnWqAklKjp0V88w5VZfDoHa+k=;
        b=riVSEkz7XxUTuP8nSx0Dp99mlriG5qz82I5qUJYNDyLVWu054EDivQ2JfNvzrKCsK/
         EMk6lXXPhy/apOp4ULHXajvQlP751dBSwQRC653uBAwiuekAUuTYBY6TefucML5/UebR
         L6j2/p2T73dKz2twpHKJHmfndK/2DUdduHNerglo11iMK0axPBtScFv0DeyTkzok1i8e
         jAMrwMu4AUVU43fC91Pq5i7YqAomQYWHb63hsDoXTPW+C+Do8RF9uTVNbOQLjUfrL5fZ
         f4fUvm52FHVns1Cv9tlj9k386LCXeRL8vQHcG3dzvKeLcoTtTXUI3oExsxpSE7QC7x1K
         Yo1A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781540645; x=1782145445;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=eQLhmoMuXBduJxrYARdnWqAklKjp0V88w5VZfDoHa+k=;
        b=SQvM08wIBn6bgxhVTq2KoRBymhQS8phGz/h6UREoj54qdd+R531nqCl4NJs+nr911q
         CqzRJyVlFj2q4CLsZpbXLBblQ66z/RqwJP6Ew/VCqRAHGMzs9Ie+uGWxHHwmE3aLquD3
         SYRtG1N4rF08VCiOkrz2pHmxXf8+UI4YrzdP/kDOaXnroamZ5uKq9EkSHwrUHpHXWdH5
         jiAoHLLuI3iBx2D2/dt/EysbypmhhLRpEShD9dRogtQ0kQhHyjHAh6pEmrhkVBm6CUNY
         v563929f6u5v33/GZGJW57rGamRY0q6pNiTVWJeosJjNkMUHduKgUnPuS6p3NIV8HJop
         xbVA==
X-Forwarded-Encrypted: i=1; AFNElJ+24m0vaYiLhDuSEbWanevuAQ43NR7BWx408jnzlFMRY0ZSX873mTNjw50tucdJu6hPh5kClzTHgud9XqwCe/g=@vger.kernel.org
X-Gm-Message-State: AOJu0YyKxHbPmpw5VhPT27Z1T7lZzCOksYFXWNA6Gyun0BKW9FJr99kj
	tPBW2hlDb1xSpKfYdHaWNL15QcLJeDJV/WsfpOejcz4ezRmeK/yG1rymr2kv8/Q3eoPrLT74jYC
	F78JZs3RYITW5ajKFc4DMO0twlzsGWLY=
X-Gm-Gg: Acq92OFgPUetapcvdEr6enNThKVmv0PIxZmzI4zjvj/JiAkc4w9auV3K5jTIbbr2q4G
	sS4DBcauqXhvpl0CSnLwhD3F3FM4eg3wRQFSiiGBA3PTZgcDonwyPIsGq17YOLQBmkjgoePWcoW
	GuekFdqWCDj+lSoh5tfw99ZuAp5Q/uVAIIfSs2hkqd/wVTKDttz9XjjsaRwPiH+/YKHcngIYPOq
	c3/K+ALttaSiMr9tp3OJJqRbeGgG4+3/+l7RX9AlImZnJG+QRu3ND8sx+0+sWEKYl/byzvSt+g+
	jeFFtvZ9rE4GkjiWCJ3h84WaKLKv0Oo8OkFqYDWT2Hq3ZeWatqqnT6TdyTae8/J1akL1/iPptw=
	=
X-Received: by 2002:ac8:5f4a:0:b0:519:89f6:1270 with SMTP id
 d75a77b69052e-51989f615bcmr14389951cf.38.1781540644718; Mon, 15 Jun 2026
 09:24:04 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260526-seccomp-combined-v1-0-304b1cc3ad24@hill-daniel.co.uk> <202606122110.28245E2D@keescook>
In-Reply-To: <202606122110.28245E2D@keescook>
From: Jamie Hill-Daniel <clubby789@gmail.com>
Date: Mon, 15 Jun 2026 17:23:53 +0100
X-Gm-Features: AVVi8CcijWf0YMFkvXRNQBYYFFLxMTeisXVBFVgbN6ptgvwthmuJ0Jfz7cifjsw
Message-ID: <CAO1UbGcbueeqLPOFA+=cJKjQxgXr1pW1vGFR-zNOT7rqsUqs+w@mail.gmail.com>
Subject: Re: [PATCH RESEND 0/2] seccomp: Allow using `SECCOMP_MODE_STRICT`
 with `SECCOMP_MODE_FILTER`
To: Kees Cook <kees@kernel.org>
Cc: Andy Lutomirski <luto@amacapital.net>, Will Drewry <wad@chromium.org>, Shuah Khan <shuah@kernel.org>, 
	linux-kernel@vger.kernel.org, linux-kselftest@vger.kernel.org, 
	bpf@vger.kernel.org, Jamie Hill-Daniel <jamie@hill-daniel.co.uk>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Sat, Jun 13, 2026 at 5:14=E2=80=AFAM Kees Cook <kees@kernel.org> wrote:
> On Tue, May 26, 2026 at 04:32:14PM +0100, Jamie Hill-Daniel wrote:
> > Link: https://github.com/moby/moby/issues/42082
>
> This doesn't show any particular application, just a demo program.
>
> I'd *really* prefer to only add complexity to seccomp if it is
> absolutely needed.

When I filed the original issue it was attempting a minimised
reproduction; I was trying to run some legacy binary in a container
that I unfortunately don't have the context for any more.
I've submitted another series that should hopefully address some of
the concerns raised here, including complexity.
