Received: from mail-pl1-f182.google.com (mail-pl1-f182.google.com [209.85.214.182])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9294821A459
	for <linux-kselftest@vger.kernel.org>; Tue,  3 Feb 2026 01:14:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.214.182
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770081262; cv=pass; b=ZT+J6D2agTfVUIujvdAPgKcbnemcPvF7XYJWpTCrSbmNPMjy7A52eeH09qi0v4GNRGKK7dqXeTzQv9x1+CLHMRm+wSvLDDFgJsJVTHjEQcZtgss9+N0xOL5X7NsQxBFSPORBbNyhKgm9hpzaXNpxrq3+FJ3vCZ2Dsy3kpXFGNlU=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770081262; c=relaxed/simple;
	bh=4/iLhpqFPP149Ves7/SHxvHdwNhFRg1JwgdXcRn/A/c=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=VYSEMDXpOYPDOIHktVlanZMUODriho91MRGx/HRogy6hziHPEwcKv08AeCLp7F5tXH2l7UsGcD9c1r9LfbvK6yk0t6jGeC0jJZKp1az8LopANYAg2Kx9O/OhCO+yxkjYTrAQxqMsAd2Fte1re6pfFpgmmnEiCOaY2bRbHfy5u+M=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=l2A4m+Xa; arc=pass smtp.client-ip=209.85.214.182
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="l2A4m+Xa"
Received: by mail-pl1-f182.google.com with SMTP id d9443c01a7336-2a7a23f5915so33039115ad.2
        for <linux-kselftest@vger.kernel.org>; Mon, 02 Feb 2026 17:14:19 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1770081258; cv=none;
        d=google.com; s=arc-20240605;
        b=citMrBUO4vQLhuFJ2tbOmRgVe/KauA32rJ6o0YeT8AgHZxzqGcqDTA3oiAG3L/NLtg
         2s+dTM8IqMqyD0XqRU0ASnzbRglvC+8b62vu3H9Z0R2u05arYEvylgTsaJWsCyREfQsR
         9QcF0Ob4Nu/liM83I01cnXnR1NSoIMZb3u243Hru8YLtSkTtVP8gxMB9e5lsj33xBlvG
         +NvNlzInomXPYS6wSaTCU69Pu78F1NTN1IEbNvNKmezY2Kdyk7mfqZUW98Vf3nBVX3jC
         OBkMvsxdVqSx9FAaUVglp6GEnyH+1VXAwOY+OzNK2XihDutNsDcOASKTA/01n2L2USwU
         EF5g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=FDHOspxtTXi7BJNEKnz1JYnZxJzaJnXWmJwoN/Q1st4=;
        fh=dm1e7o5JbIv60f/vCglJTDz2GNITtDOBIBG1WaeCXBc=;
        b=dkdAJPgx63dyb4KVCw1svtXdqaEIEJ0MS0VeQBcuezGsjcZEGppBv1XWLfN5eFcrQZ
         yjRw4y4s4Uew8bW6HnIjdWTjcEM0nmBmLN86S6Bp3rcv4yuFixxv1jeU4UmYK3tpZ3Pm
         h17YJR45Sh/uk1TlRzTfJPUvhPFaI4WSchSzZGq5w96xG6n9/Zix419COKMeSA8a98TA
         hWQ4qQYhdAo8wcjEs0HOB9gzxJtwle+gzv9G0fEqBhfalMDzG3LdYD+ogf2j4Zkjgc96
         svZw1/rXFynhflWlWrfboNIMhntZdigLCAr7WQ7GPwAFaSfyW0v2yo7QrOpZWfqBGVox
         R1pw==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1770081258; x=1770686058; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=FDHOspxtTXi7BJNEKnz1JYnZxJzaJnXWmJwoN/Q1st4=;
        b=l2A4m+XaQQC2U2iYoLbdsI46B//ScRQ4mGnP4JKR6VvHvjHZ4b7Vgw/waxa98cODjc
         uXI7hdq9IeOYQetSgR/z9kE8LPm0LcguwbOZZzxQpD31KCQH8zBIhEYG4MboMfS3+YUv
         sTQ1j7GyjZodLIONNagA4u+qI8v1Hatite8eswyURca3zoXrJqgLtusMFKX5hxCixjJg
         QLKKk3MagwmzP5KZfAuwBPWMF8L2SeSoO5x7W/Vwa7Dj9Wkql7/UlOJ1uYZdUX0q7oHy
         TNJdgr7LccjwHBlB+t0xvrx26SuutDB3DklAbtM/x6NtMV4Uuj9vUFsaq3c2j9kr9koG
         MYUw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1770081258; x=1770686058;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=FDHOspxtTXi7BJNEKnz1JYnZxJzaJnXWmJwoN/Q1st4=;
        b=emufu238x33bw2euslN5Xx2qTY5GhFSpU/z3vAfVUr725XG7CHNqpBojcLuwrTEzhC
         yC/Ar25g4ZWrUUhRhbQRH+ClNsAajrY8Lo35PpymC+ag7rugg1AJWR034BGw2BMHDJrW
         ttfVo0cfXE4BGutb1JXFxXHUiHi4WnfZ6uK8kWtXtFWuVo/GVt89f57vjzm9bv5JAjyF
         LeI54tA02eKo5taKNscg93H0cxSyvooeBBZCvqoAs5k0iEoVs1kPu4fHChgXYyWEZLBo
         ZNKCHxtcQTR79adkF/4nMppCAiWVoi0MXcQB0/YbK6AneEze3cAHE1HudtdLOKb3O+7l
         +qTA==
X-Forwarded-Encrypted: i=1; AJvYcCXBmxh6Q0I0xsIlKWA4lYFA8zEN+ckg1t862TRwedxaUH0zr+RlTplmsVYBTqDKzE3RcwZKpOjRvV1k/+9GVso=@vger.kernel.org
X-Gm-Message-State: AOJu0Yy2dihos7gVCgrrMzclgosHNvHh+GYMum2z6FF1bahrNErxbeo0
	Fjn+TQ7Ot01m9q0XorbfKk71wynL+wfPGdqCYcaAMYPCK6PcOnptfJT7r079exQPBfTanxdfrZn
	MlQsrLgQWyzGnkYRj7l17EWk/mgWkYm0=
X-Gm-Gg: AZuq6aK7ImmPqvH/5S+nsLRC3WbNN+HwzFO7FQ+CUvYlMBHbWmaWk1fafUw3JG8nbAT
	NJXleRcuorw6y3BGg/Wqx4pF2eqIxM+I3ww6IPET9oemlpIfmV6CJ+znBMJ7PtdduFXYg9jlSoE
	L5Gu829kk9e3tKdEM0wMK/PgW5uvQ1VbbGGNrPMPMJEuakNapBqiu4fsW+ZD98O8bvMankKq83r
	g+7JAXpX6bLhF7Wvr8dTPoiIqomcIfzhxB0hw0nFc7ARu7dLOS+AoLP7Zzr1JHxmDAvlbKCKzZ4
	9dch
X-Received: by 2002:a17:903:2f8a:b0:2a9:db7:4471 with SMTP id
 d9443c01a7336-2a90db74772mr60140325ad.1.1770081258315; Mon, 02 Feb 2026
 17:14:18 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260202090051.87802-1-pilgrimtao@gmail.com> <20260202090051.87802-2-pilgrimtao@gmail.com>
 <CAADnVQJPFANbYvYYyG3OQdXh4174bGwsamAzD8HZ5f=noS=BnQ@mail.gmail.com>
In-Reply-To: <CAADnVQJPFANbYvYYyG3OQdXh4174bGwsamAzD8HZ5f=noS=BnQ@mail.gmail.com>
From: Chengkaitao <pilgrimtao@gmail.com>
Date: Tue, 3 Feb 2026 09:14:07 +0800
X-Gm-Features: AZwV_Qgpw8kk5uHlki77i7O3NlEqEgTB_RP5p2AmJzKEvLsJy3Jf7MH58NnDq1Y
Message-ID: <CAAWJmAaiFAyK+PDLStoR_0sGAH6TeeekPMdOjhKwQ07rUm_oSA@mail.gmail.com>
Subject: Re: [PATCH v4 1/3] bpf/verifier: allow calling bpf_kptr_xchg while
 holding a lock
To: Alexei Starovoitov <alexei.starovoitov@gmail.com>
Cc: Alexei Starovoitov <ast@kernel.org>, Daniel Borkmann <daniel@iogearbox.net>, 
	John Fastabend <john.fastabend@gmail.com>, Andrii Nakryiko <andrii@kernel.org>, 
	Martin KaFai Lau <martin.lau@linux.dev>, Eduard <eddyz87@gmail.com>, Song Liu <song@kernel.org>, 
	Yonghong Song <yonghong.song@linux.dev>, KP Singh <kpsingh@kernel.org>, 
	Stanislav Fomichev <sdf@fomichev.me>, Hao Luo <haoluo@google.com>, Jiri Olsa <jolsa@kernel.org>, 
	Shuah Khan <shuah@kernel.org>, Feng Yang <yangfeng@kylinos.cn>, 
	LKML <linux-kernel@vger.kernel.org>, bpf <bpf@vger.kernel.org>, 
	"open list:KERNEL SELFTEST FRAMEWORK" <linux-kselftest@vger.kernel.org>, Chengkaitao <chengkaitao@kylinos.cn>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Feb 3, 2026 at 1:57=E2=80=AFAM Alexei Starovoitov
<alexei.starovoitov@gmail.com> wrote:
>
> On Mon, Feb 2, 2026 at 1:01=E2=80=AFAM Chengkaitao <pilgrimtao@gmail.com>=
 wrote:
> >
> > From: Chengkaitao <chengkaitao@kylinos.cn>
> >
> > For the following scenario:
> > struct tree_node {
> >     struct bpf_rb_node node;
> >     struct request __kptr *req;
> >     u64 key;
> > };
> > struct bpf_rb_root tree_root __contains(tree_node, node);
> > struct bpf_spin_lock tree_lock;
> >
> > If we need to traverse all nodes in the rbtree, retrieve the __kptr
> > pointer from each node, and read kernel data from the referenced
> > object, using bpf_kptr_xchg appears unavoidable.
> >
> > This patch skips the BPF verifier checks for bpf_kptr_xchg when
> > called while holding a lock.
> >
> > Signed-off-by: Chengkaitao <chengkaitao@kylinos.cn>
>
> You ignored earlier feedback. This is not ok.
>
It's my full name. Every region has its own customs and traditions,
so this isn't an essential change.

--=20
Yours,
Chengkaitao
