Received: from mail-wm1-f68.google.com (mail-wm1-f68.google.com [209.85.128.68])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 653DB3DA7E0
	for <linux-kselftest@vger.kernel.org>; Mon, 15 Jun 2026 09:40:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.68
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781516405; cv=none; b=tp5vRXAKiPy2+TV1Uobnjp1qjJDNeAq3l1l6GP7F6L18Npf1hbwgKuELUuMc6ule9w7ewSs8RAuMMsBnamq3l+d7JldjTQts4GP4P8TtwifcIk7LpioTqEUGJ2dqVqR+m0uZ/yBO+Ki3gek/6EppEI9eQ4GppnyxsCw+e9kC3II=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781516405; c=relaxed/simple;
	bh=yuZOjeKUQvuOh9Mb8jFUvO3r6PfArjCEIg/DDAG8xb4=;
	h=Mime-Version:Content-Type:Date:Message-Id:From:To:Cc:Subject:
	 References:In-Reply-To; b=Lvj7CEIbvk/3qk+MxpqRe92bWOfuZe1nwh9PjCtq/O6BOMKV/A+D3QcdBYrKX4b8Trncxoklx5+iGnoTwREaxLGfmQCW/wUX+p6Rma5KtRha7qOjs2luxJa2WO0qYpAyBN9kBpkTJmSkYHD1l7FLi4ymdfMDqptxtpcRmiU9HOU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=UyNbsDRQ; arc=none smtp.client-ip=209.85.128.68
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="UyNbsDRQ"
Received: by mail-wm1-f68.google.com with SMTP id 5b1f17b1804b1-490b3e03939so23109595e9.1
        for <linux-kselftest@vger.kernel.org>; Mon, 15 Jun 2026 02:40:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1781516403; x=1782121203; darn=vger.kernel.org;
        h=in-reply-to:references:subject:cc:to:from:message-id:date
         :content-transfer-encoding:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=30D3lk2m4MPe1WlWUP+Xy2TkeorO71aGo8DIuGzIXbw=;
        b=UyNbsDRQ1oPgXaifIFyAikgrMXaHTPWofKkeVM0347UeQRKl62NelmEkUC5BnBmJ8u
         NU8DhSuItVrj7dKhwKefywPKAT/IoEE9G3lv02H/7aTMzw3tnqz747oC+CtcljoTNGCh
         444TF/pSG8G6pJN19nmVxqCUjzAGatsImBduwH2LEU9o+kEU46mx1fuaiq7yxuX5WfNH
         RxSq1Ms9MFSfl7UgPiOsLbEcIG3+EhLnVkMLcHVnEng2vfcbODWESzcJHVbJcUbtc+ZX
         CTvg4Fgo/n2BpN2VfUiZH2mzr30CvKsc172Khn8hWC/BZQoh4x+QGvoQ+0HUEmqnNiSa
         xJqA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781516403; x=1782121203;
        h=in-reply-to:references:subject:cc:to:from:message-id:date
         :content-transfer-encoding:mime-version:x-gm-gg:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=30D3lk2m4MPe1WlWUP+Xy2TkeorO71aGo8DIuGzIXbw=;
        b=g8Ir67htSWYtU6yPEDrTarlp7r9GZGNqpY0D4uKw/mcJoUpUN68jVoz+bCxYTuBCiW
         Ady+6r7kQdldeCRIo7R7BOb9wzNQipf3H0AqpD6x4XZMd3TvaY6thViSq3cLUNIGbd/F
         FpTMsJ1ac6TF2SYT7rJRNcH/TBNfNfsrI+AF4vbIIjGyQSgjJrDVEztA9Cagh95hIeIA
         DqmuQwEimYY+oCvPVrRml+3l2d9xvysADuHs8lsI8mof1osSjSjl0gsmmPxZ57Fn09X+
         qgKR9dwX98B72Ivnan3cCpuq5vlxrB8OEFuXv50t8IDHaTWS4T8Qc47nf8J95b2n8ODf
         56AA==
X-Forwarded-Encrypted: i=1; AFNElJ97807/GGgj/HWsKQLRyW71wi6D43TDF34Cwisa6kATNW6hYLDEWyLqvpCjEQX4iKUiPp/khOPKhNYrrO1sj+8=@vger.kernel.org
X-Gm-Message-State: AOJu0YwVcHxlq9kF5hoGAubB7EFeHCFaE7smcg/zyf72fkz6e+ZJK0WQ
	WIUPSRXnwQZbbtQzq9kXxLI3UcOWQB4Qx8UU/HtQ2MNPQ5IbWTKFD96Z
X-Gm-Gg: Acq92OFP59LUGwQ4WLkHpe0lWNH9qrnpKiekOdwui8IuuFsi7mJCFah1tWj0079FFMp
	qr8fJVIrQcsfxE5OlW9nQi8PVzftifYkun5dFuRpLvzBRv93lDI8dMG2C5JDy/mtK2/9VkJ6KzM
	8AxLs/wYtN3GNS+gvQpwy/7KOZScNaphlFKjt5GdEDFGbom44RPVPRfbA3NIJZ7kTRoCQX6Hiyq
	Kj6JaatgvzNu3Yupd2nli5RCIaYENu9TMrVkfMRimpHY2/hjAfJqTeAP5C5CBiJ1vb8uI1iRHGG
	Kwf8S0JHlRVYkZpvBb7ALYXJsQFSqaIldz8KpxguJIFWCdSJlfSblMOVdO3bYHcpA+cBLfbBrk+
	pyeWAnwg5pDdtq6mIT0XjPoWxGKKOWtLhTUaWHw2kmPbyEKAgzR+CSZU5XYQ0SzL7sbX20XaZ0d
	BMyKrQ/FPoFjHJx7pqCNhDRrBtr65F/R+w/0vSfTFj+rz6G2Gk8o/nWiJbRbjoz9OZj8YM2X9Yb
	9OwIPIHZcig7I8+RZK4nr5emb4VhSEGzTyp5RfE9vpRh1mmHDgqibFZ1vQkMww2fQ==
X-Received: by 2002:a05:600c:8b2a:b0:490:4b89:5372 with SMTP id 5b1f17b1804b1-490ec50a338mr160503935e9.11.1781516402495;
        Mon, 15 Jun 2026 02:40:02 -0700 (PDT)
Received: from localhost (nat-icclus-192-26-29-3.epfl.ch. [192.26.29.3])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49220304180sm233055375e9.4.2026.06.15.02.40.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 15 Jun 2026 02:40:02 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Mon, 15 Jun 2026 11:40:01 +0200
Message-Id: <DJ9IUWKK7EFS.XXLT3ZAGOPC4@gmail.com>
From: "Kumar Kartikeya Dwivedi" <memxor@gmail.com>
To: "Nuoqi Gui" <gnq25@mails.tsinghua.edu.cn>, "Alexei Starovoitov"
 <ast@kernel.org>, "Daniel Borkmann" <daniel@iogearbox.net>, "Andrii
 Nakryiko" <andrii@kernel.org>, "Eduard Zingerman" <eddyz87@gmail.com>,
 "Kumar Kartikeya Dwivedi" <memxor@gmail.com>
Cc: "Martin KaFai Lau" <martin.lau@linux.dev>, "John Fastabend"
 <john.fastabend@gmail.com>, "Shuah Khan" <shuah@kernel.org>,
 <bpf@vger.kernel.org>, <linux-kselftest@vger.kernel.org>,
 <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH bpf 0/2] bpf: Preserve rdonly_cast dynptr slice lifetime
X-Mailer: aerc 0.21.0
References: <20260615-f01-09-rdonly-cast-dynptr-lifetime-v1-0-2dd0a369e153@mails.tsinghua.edu.cn>
In-Reply-To: <20260615-f01-09-rdonly-cast-dynptr-lifetime-v1-0-2dd0a369e153@mails.tsinghua.edu.cn>

On Mon Jun 15, 2026 at 10:57 AM CEST, Nuoqi Gui wrote:
> bpf_rdonly_cast() is an identity operation at runtime, but the verifier
> currently assigns the result fresh return-state metadata. When the source
> pointer comes from bpf_dynptr_slice(), that drops the relationship needed
> to invalidate the alias when the dynptr is released.
>
> Preserve the dynptr-slice lifetime metadata across bpf_rdonly_cast(), and
> add verifier selftests covering cases where a dynptr slice is cast and th=
en
> read after the dynptr is released or after the originating dynptr stack s=
lot is
> overwritten while a clone still holds the reference. Also cover the valid=
 clone
> case where the cast alias is derived from the clone and remains usable af=
ter
> the original dynptr is overwritten.
>
> This fixes regressions introduced by 66e3a13e7c2c ("bpf: Add
> bpf_dynptr_slice and bpf_dynptr_slice_rdwr") and a35b9af4ec2c ("bpf: Add =
a
> kfunc for generic type cast").
>
> Impact is bounded to verifier lifetime tracking for CAP-required BPF
> programs. The evidence confirms stale read acceptance after dynptr releas=
e,
> including a typed field-read shape, but does not demonstrate unprivileged
> reachability, cross-context disclosure, controlled reuse, arbitrary kerne=
l
> read, write-capable aliasing, privilege escalation, crash, or KASAN/UAF
> signal. No CVE, embargo, or security escalation is claimed.
>
> Validation:
> - The new dynptr_fail.c subtests exercise the verifier's dynptr-slice
>   lifetime invariant across bpf_rdonly_cast(): a cast alias of a
>   bpf_dynptr_slice() result must be invalidated when the dynptr is releas=
ed or
>   its stack slot overwritten, while a cast alias derived from a surviving=
 clone
>   must stay usable.

Won't fix. The semantics of bpf_rdonly_cast() do not require soruce provena=
nce
tracking, and thus don't need any invalidation. It can take any unknown val=
ue
and produces safe to read pointer. Please try to reason about whether it's =
a
real issue before posting AI's output directly.

pw-bot: cr

> - Unpatched bpf at 76f62d237538: test_progs -t dynptr FAILs as expected,
>   because the four __failure subtests
>   (dynptr_rdonly_cast_{,typed_}slice_after_{release,overwrite}) are wrong=
ly
>   accepted - the stale read survives dynptr release.
> - Patched with this series: test_progs -t dynptr PASSes, because those fo=
ur
>   casts are now rejected with "invalid mem access 'scalar'" and the two
>   __success clone subtests remain accepted (all six dynptr_rdonly_cast_*
>   subtests OK, rc 0).
>
> Signed-off-by: Nuoqi Gui <gnq25@mails.tsinghua.edu.cn>
> ---
> Nuoqi Gui (2):
>       bpf: Preserve dynptr slice lifetime across rdonly_cast
>       selftests/bpf: Cover rdonly_cast dynptr slice lifetime
>
>  include/linux/bpf_verifier.h                    |   5 +
>  kernel/bpf/verifier.c                           |  36 ++++--
>  tools/testing/selftests/bpf/progs/dynptr_fail.c | 160 ++++++++++++++++++=
++++++
>  3 files changed, 193 insertions(+), 8 deletions(-)
> ---
> base-commit: 76f62d237538b456354a44e796a541cde03c6e28
> change-id: 20260615-f01-09-rdonly-cast-dynptr-lifetime-de114e5a1838
>
> Best regards,
> --
> Nuoqi Gui <gnq25@mails.tsinghua.edu.cn>

