Received: from mail-ed1-f44.google.com (mail-ed1-f44.google.com [209.85.208.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E044E23A99E
	for <linux-kselftest@vger.kernel.org>; Wed, 21 Jan 2026 23:27:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.208.44
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769038048; cv=pass; b=Jr4/hdrVmQfLyDZMuF37pE/Rg9AlqruC3C0sSvPzTLAeFdob9kAyh5dYktZDTpLvzRlm05e0uodYe6hs4MIfV6aA/isAvwR+AgVhtQcBrCA1ruikS4Hev7tgpNjOkyFMRfPSQfwFTqjx5IPIG52B8W4sZTbpcrwofYK3l10skwE=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769038048; c=relaxed/simple;
	bh=V1knHZUtidzXYa2D90rkakzUilR1Jj+v2WdqQHMZd6M=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=TgEg3lTzQazG/p1ytyqBxaPUuv1CL5GqjeT1FYiiwv6jY1nQ0EpZ88WOs7MDrcUiHjZ2Qc0b5uPOf5oZGsUYh8VmJzmciyirHBxOgi1VQ/YXm3/L18nMbttWfd0UUP/Psy/LxNh3rJ40OnjWPxvYOTsr/eGowz9NnEHupeN+ZXg=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=Gao5t8+m; arc=pass smtp.client-ip=209.85.208.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="Gao5t8+m"
Received: by mail-ed1-f44.google.com with SMTP id 4fb4d7f45d1cf-658072a4e56so839427a12.0
        for <linux-kselftest@vger.kernel.org>; Wed, 21 Jan 2026 15:27:26 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1769038045; cv=none;
        d=google.com; s=arc-20240605;
        b=ITjwPS4u2b/qhNMUDxSgSva6Rok832i5hmQeZ0Qg9lNmphM74gw9KJGd68duaUJiG5
         YmQLTTbkb6flTfcWtNJvZJEistDRtT1mX8eqrJ/xDpyIVbmdhggn/U3RGRt8M9Akecfg
         YxHHrKs3Eni24jB4Vr7ZNdqNM4tkfo4vCoQDqwn5R6iyzMl0ZQ8FJcGoLLRqrkgehy4X
         vY893G+yjUlPChS965hwD+7Q09pPWlT9J4oeJt/hPW8w1V0HsHZbYJpsbwJk1a9noMJS
         j+XiycWq738KVx9f5z7KFB5BrXtGI3gk7YDH2CFltT4dzH8kalJK2D5p8cW8VfeBnCa0
         9f+Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=5VOSeiAuPRhgQly9G0S4R+B2gU5z+eWAumZLfFX0iJg=;
        fh=4A0B43hLE38hdSc8154dH/VXwcOIKbbAF8BayVIxfko=;
        b=OSBkdjnjeWQki+H2zqIbobDNmSH60t1LGaxoj1y/1D+nlWseItklX3pec9AqkxAh/s
         4ERzS6jjRn6MdoRqWBbesH8BZiWi7J+9MbSUP64g2kvlLk9VtbNImj8q6DRxrbHJa2WG
         bUYY8njXvpI5/tL+fVCnfxa2cRW20BNEfmnkxJ8ZfekOMFU0TnRfUdRbA8XTB2xvPO7l
         lhQw9wOCy5FHufv3CwMiVRV4IlGXAPslVOQ8ctbn2AVV7V1l3l24FhJADnX4NyLcPj97
         zEM/CjU46eTTlmivbRKfj1OtFp9lhZ5bLvQq8g23NEiPp+TtQyiljpQ58Q1fGz6IztS1
         A04w==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1769038045; x=1769642845; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=5VOSeiAuPRhgQly9G0S4R+B2gU5z+eWAumZLfFX0iJg=;
        b=Gao5t8+mvsk4+X3SX47DZsIeBy4RGfEUWIVDvYWTUBCJkBnXLRkKTcM5p2V2TxfuNf
         u2P8JSuJWe/HR2nXl3kehVhKoLB/jdw/FnAId1SRsf6f/LKTMX1icqQ4Py2apslER5fF
         n21UH0QiYvph8f9KSvIiTFFZDy5ZQhH5aUapFOKlelQ7G2OphtjOi41KEhk/HSSXqEcr
         Dx+Dr2gRyvplL+TzGVQhcVwmTyid59Yksrz4W0Rzfa3GFZckAt+klJGaL8w+NWcvRxhx
         c/S8+Ns9p6DSekZdI7wZA18EWiKG6fMrC5W6aAv+eJjRldfpAoxRJr6lXIrN0s1QH9k4
         sJGQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1769038045; x=1769642845;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=5VOSeiAuPRhgQly9G0S4R+B2gU5z+eWAumZLfFX0iJg=;
        b=OWAV5nmnCJC6cBmfZ35VRa5i+5XETNoJMGaxBhOWbNb6AdBCPsE8uLyx6hzeUg0gVt
         7LuMxyg/sZfQnosw/aY3qowiUGzxWwvJ07YIDrGwEEvloQM5N7xYHLBhtpe9/493Mxw0
         1ZfYllXDjJpm8jv/26+/EzLfqYgx3q5sCUbTbvhRh26m8IaqXLNmjQp++Fz6mTEWk8lO
         87eRg89p/uyAIhSsFQj6VeU8ay75NbBKAbZFhDtCE0FHszh7J3HgDIC8yO2b3MPGoci9
         UhpbjsbJTb5zkSb0lJZzCEujWmuduyTAbO2lvTJUBXbzQKMaeZSvfNbBX7AaEO5aytfy
         SbHA==
X-Forwarded-Encrypted: i=1; AJvYcCVfW0q1YFUs0E5bT8tMm5Q4OfWtwYr4uYil0Dt/TCvnbj96u+upm4UO52CvzryLCiUd6VqUHqSj+0XOLFOTF48=@vger.kernel.org
X-Gm-Message-State: AOJu0YykOf+P9qJdPHARA+aT+pULX0cOwRrF133hqSp2nMppNz5JDQFZ
	F4tSphi3dbRQJUGQVKh8qKAurGWrVRGHLAYSYMjL08vV9W1hLFf5AdTYlGOyu9gSYQNgID6+F6Z
	ho3ux2N2o3sYJRQRuIZ/68uFRFoJyDONHBow7jAbz
X-Gm-Gg: AZuq6aKN6g8wMHujBQC4Ft0+ZPJeADN3N5+KhNlXaoxqJ7xiaqkWBrdc3cy5ME4OmwB
	Pul7JDA4a6/5NojIKDsB0z75mJDbIGR+/8io3RcjjCHczLlB5WP4XtOcBn9CRTwybRkT6AP2t3L
	X9GwMO8o6qbmQZB7ziy8GT3UwUt/eMVnA/mu/U+6TCAaRH1u5Stsefw6HdsPJeXrU+28O2hpVY6
	C9l8OH/3oQU8yDrNpr08DfFGHcjKFAyB/Ri/r1RwgREM0MvIM1xGLJHn/5L1hfObjXCM38QMBCl
	ix6q/nmYI/3vn5Q5E9UTZ7BYhQ+pTg==
X-Received: by 2002:a17:906:6a13:b0:b87:206a:a23b with SMTP id
 a640c23a62f3a-b8792f79852mr1515236066b.34.1769038044881; Wed, 21 Jan 2026
 15:27:24 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260108225523.3268383-1-wusamuel@google.com> <CAEf4BzZv9kCAmX0Fo4kR8qh9mu5NB-wLDmNAK_R=VzcxL7VPpQ@mail.gmail.com>
In-Reply-To: <CAEf4BzZv9kCAmX0Fo4kR8qh9mu5NB-wLDmNAK_R=VzcxL7VPpQ@mail.gmail.com>
From: Samuel Wu <wusamuel@google.com>
Date: Wed, 21 Jan 2026 15:27:13 -0800
X-Gm-Features: AZwV_QgWHgZcZHB-_IWTTS7uKp3rIBCdulJHIaCWe7M7Hdh7LuqVO2wVgnczORI
Message-ID: <CAG2KctpugdYJ5_pGnc+DNLRQb=3NiGRBhzb5DK8Chb=hgmHaGg@mail.gmail.com>
Subject: Re: [PATCH bpf-next v2 0/4] Add wakeup_source iterators
To: Andrii Nakryiko <andrii.nakryiko@gmail.com>
Cc: Alexei Starovoitov <ast@kernel.org>, Daniel Borkmann <daniel@iogearbox.net>, 
	Andrii Nakryiko <andrii@kernel.org>, Martin KaFai Lau <martin.lau@linux.dev>, 
	Eduard Zingerman <eddyz87@gmail.com>, Song Liu <song@kernel.org>, 
	Yonghong Song <yonghong.song@linux.dev>, John Fastabend <john.fastabend@gmail.com>, 
	KP Singh <kpsingh@kernel.org>, Stanislav Fomichev <sdf@fomichev.me>, Hao Luo <haoluo@google.com>, 
	Jiri Olsa <jolsa@kernel.org>, Shuah Khan <shuah@kernel.org>, kernel-team@android.com, 
	linux-kernel@vger.kernel.org, bpf@vger.kernel.org, 
	linux-kselftest@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, Jan 9, 2026 at 3:37=E2=80=AFPM Andrii Nakryiko
<andrii.nakryiko@gmail.com> wrote:
>
> On Thu, Jan 8, 2026 at 2:56=E2=80=AFPM Samuel Wu <wusamuel@google.com> wr=
ote:
> >
> > This patch series introduces BPF iterators for wakeup_source, enabling
> > BPF programs to efficiently traverse a device's wakeup sources.
> >
> > Currently, inspecting wakeup sources typically involves reading interfa=
ces
> > like /sys/class/wakeup/* or debugfs. The repeated syscalls to query the
> > sysfs nodes is inefficient, as there can be hundreds of wakeup_sources,=
 and
> > each wakeup source have multiple stats, with one sysfs node per stat.
> > debugfs is unstable and insecure.
> >
> > This series implements two types of iterators:
> > 1. Standard BPF Iterator: Allows creating a BPF link to iterate over
> >    wakeup sources
> > 2. Open-coded Iterator: Enables the use of wakeup_source iterators dire=
ctly
> >    within BPF programs
> >
> > Both iterators utilize pre-existing APIs wakeup_sources_walk_* to trave=
rse
> > over the SRCU that backs the list of wakeup_sources.
>
> One reason to add either open-coded iterator or iterator program is
> when you need to work with some kernel object (i.e., if there is some
> additional API that takes that object and somehow manipulates it) or
> if traversal logic is involved in terms of synchronization primitives
> necessary.
>
> In your case neither concern seems to apply. Looking at
> wakeup_sources_walk_* helpers, it's just a simple linked list
> traversal and struct wakeup_source has plenty of plain data fields of
> interest, if I understand correctly. You probably are not intending to
> allow locking it or manipulate wakeirq, is that right?
>

Correct.

> So I'd say you should do this using bpf_for() generic loop and
> bpf_core_cast() helper. The only problem is that wakeup_sources global
> variable is static, so it's not that easy to get its memory address
> (to start iteration). Maybe look into working around that first?
>
> pw-bot: cr
>

I'm thinking I'll have to drop the open-coded iterators patches in the
v3 patchset, and revisit this in a later patchset when we have a clear
use case for it. I'm seeing now that open-coded iterators support was
added around kernel 6.6, so backwards compatibility will be
nontrivial.

>
> >
> > Changes in v2:
> >  - Guard BPF Makefile with CONFIG_PM_SLEEP to fix build errors
> >  - Update copyright from 2025 to 2026
> >  - v1 link: https://lore.kernel.org/all/20251204025003.3162056-1-wusamu=
el@google.com/
> >
> > Samuel Wu (4):
> >   bpf: Add wakeup_source iterator
> >   bpf: Open coded BPF for wakeup_sources
> >   selftests/bpf: Add tests for wakeup_sources
> >   selftests/bpf: Open coded BPF wakeup_sources test
> >
> >  kernel/bpf/Makefile                           |   3 +
> >  kernel/bpf/helpers.c                          |   3 +
> >  kernel/bpf/wakeup_source_iter.c               | 137 ++++++++
> >  .../testing/selftests/bpf/bpf_experimental.h  |   5 +
> >  tools/testing/selftests/bpf/config            |   1 +
> >  .../bpf/prog_tests/wakeup_source_iter.c       | 323 ++++++++++++++++++
> >  .../selftests/bpf/progs/wakeup_source_iter.c  | 117 +++++++
> >  7 files changed, 589 insertions(+)
> >  create mode 100644 kernel/bpf/wakeup_source_iter.c
> >  create mode 100644 tools/testing/selftests/bpf/prog_tests/wakeup_sourc=
e_iter.c
> >  create mode 100644 tools/testing/selftests/bpf/progs/wakeup_source_ite=
r.c
> >
> > --
> > 2.52.0.457.g6b5491de43-goog
> >
