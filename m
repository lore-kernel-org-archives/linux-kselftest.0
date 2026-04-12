Received: from mail-wr1-f52.google.com (mail-wr1-f52.google.com [209.85.221.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 584C237E2F4
	for <linux-kselftest@vger.kernel.org>; Sun, 12 Apr 2026 21:09:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.221.52
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776028192; cv=pass; b=LVBooFPRPk0PCn0PmwhPAKodXEw+JAoXI87ch99frlSf0DcK6ALTvLgJUe4CRBzHX64s2vtoZyIFfhFjznO6Xc70MUe1DW793zZ6UpTOL9y3Rafs43TsEysnA+i8azrcdGULYv6gWxNxFVdvw5HcElq95hLYNTJfUtI7hC6VQV0=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776028192; c=relaxed/simple;
	bh=oEQ85Gl3lH6+Cv9RN6chqPqZuCmnNGFRnwc1Zh/B7zI=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=nTue7q8UA04qI2rCsH39kCkgxU413JuEMigjfv6SFtEaJN3QQzLNYRd3kMizKJAAWMFOt+hETfMohyu6lAjxOelPmE4f5jMPaThNuJ1DerhTQD+pV8KN1w0haHVCMlln4KRS6RK/iS1J8fVkoD7w0uWN5qFTv4j5HTy0ykN1OSU=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=BIFDD6UO; arc=pass smtp.client-ip=209.85.221.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="BIFDD6UO"
Received: by mail-wr1-f52.google.com with SMTP id ffacd0b85a97d-43cf906b007so2290316f8f.0
        for <linux-kselftest@vger.kernel.org>; Sun, 12 Apr 2026 14:09:50 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1776028189; cv=none;
        d=google.com; s=arc-20240605;
        b=NFMn2k3qwPpRjVlSMGsgcaNgO2mB4irdjx3cgXOnoTj9vVQDW3mXcqe1Hgm3TWLPt+
         M3u1VITilkNQKwzww6qS+mEkPiw7jdKiRbDlzdhiCIVb63kz97Y21bd/ebyWKyGC5kGT
         xM6CDhdov5loGsIF0k/0LSNRUmu+eBWbM6RpQ7QJSmwiX7swt9FtCJmcM1X6Xo4OkbAD
         9rtR0wrv2S/mphBhSaXsSao6XrpwpWUa399imLCjHHtWl74tDDFr2l8C9aLMZZIMkPJl
         4Qtc8NJd4gyLjNl9OsEM7H81SHwlFQyvxHZhZqNfMB5DzXTrDvJn2WDkO1BhIqUxrVfy
         +oeg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=bfWPCmksGjAz4lAKfxlGJt2rkOmogat4M8a0nj0icMw=;
        fh=2QpLS9dJF3hubDwNlHCoGzvcGFDNxHCSI8GhAb4oQks=;
        b=XJK8o8LWw/25rU1vvb0bOwqezMqHpZigZEirq2egiZbI1TBQWo6Rdufgr+ERkUpkpI
         /O8pP1TFnJ9tmsO1c3ktFDz7AF9JY10UGAGuOfLmN0ixUh/ocTY0+b5WfGqzb0irLH9j
         9Poqjer/qOKHb8qla2YJxNG9k3rOquKvYOZpNi+Fkx62smbd+xp0Gf6lSQEbSK8THcd7
         GXURyNew8qgGDzqvQZ2DahoDvLS7ohEMEORDE+G6xIV6QgBe/rIO9XfL/pbhw9HVqNIe
         oFSTzQJD36N0RSpHn+pnnk6jOtgedKjC/+P4wC5Sf/WMb6J3M8AbIcxBI/EG0yE1/fiH
         hXiA==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1776028189; x=1776632989; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=bfWPCmksGjAz4lAKfxlGJt2rkOmogat4M8a0nj0icMw=;
        b=BIFDD6UOOORvczVKKH5w0UP1uzRIHSUYXNxwrx7jzh4l/HMZGvAHdUf5x1p5wT5x2v
         fXfa2sCMYgeriU8nF39ZTHzJsvJyTQHXQBTmNqTFnz6mo9Teed967aMbtz+yQcTehzFO
         OrHT3HMZVVe6akZSB1ccbN6DKyIVAjVqYpF7LzkshiXSbPhkP3I1vyhggGWGsh5xaIl/
         IsbNRAZ+yfroZDi+2yLiPNcQO20HrKhdwv+6lsPXgeRpAtPRs6+2qa1voqP4r/dcDOcJ
         IpU4lKBHy3fnk4B2+l/e34kPwC2t6bpEQzyxg0cYJjwqPDsPhaUPULO537NRYcncT0+h
         wZ8w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1776028189; x=1776632989;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=bfWPCmksGjAz4lAKfxlGJt2rkOmogat4M8a0nj0icMw=;
        b=KHslI4UQ/QziSh0KSiHXt+E1QZ9bb5FujDycVf+y8BbY8kC1/Pmg+V1+Hyf6GHYOBY
         pxnnTrR8TK9acVV6IIEt+OMG9svDo4h87my214Tw3lrN3z1RDFAz14Iiw+BXuMoh9ipe
         bYv5FmD3d8G0knBCd/I1qiPxjJMG92I8iOVvXdDPqMD3JVmvTnBCangMvF3QjYVXYwdu
         2hfEoK1avLKSNI0h0CQss3y7MM+Xwo0RpgzDGCDcy5mpzCcHwel8FSPh9e6mUgUTW2zo
         WEoDy3+sSnIxJxu++S4enQGv38Adqsv27pi/SzrQaEzbEmmc4Q+3iahXyKxTvC6crFRO
         B8QA==
X-Forwarded-Encrypted: i=1; AFNElJ8ULV+zBlz+2bt/D6RuZUYldK/JIrOpek1gd4ijB3WqcHADenNEARfiSdGgL3hWZuhJzN6rYC2gjPy05TkxA5U=@vger.kernel.org
X-Gm-Message-State: AOJu0YzR8+OhiY733TGZzk3nzJfz6KLqz8KCFG2xwveAR+8V5eS42RBb
	k9A9jWf1IlW7hGBCwhVWYpNoBHYYXHjH7h/zWHZ9eqmzchDmJgPeEfNLGeb8PRyBVwGiNvS2oHA
	qzykdcG4nv7RmkWtDBEFuI6/W/eTRIaM=
X-Gm-Gg: AeBDies1Z0wj2pbk38/MdBGTq9i7LUlj8I9q0fvX9tV234SYFkzygIUjwqcYA7q73sj
	k6s8DV2tRByGkFrE4YmSz+On+CCslaRnxePUqnJxNqN/tHUW7SKoofT7id+0915LnRBHKQDEFpM
	QVycnu3JWg2yRPdf35mJJ3Jzjd1kwubywIwgeSIRt9bqyr4qvfh/8J2hnpfpf8rejZ/hZYoxWq/
	glBv7PDsvQASx+9KjfiQA2QhmNI0BSZ59YPCnVpsKwLu1PqgKHq7b98V7Sd4FVxzTmhZcCaIiVT
	XKJ7cGq6pMzVNXHfIhpJgr2gSCJ3SxrOgqdlfRwjZoFvBra2oeA3B29cFp3N1fXboQlQH/Qkhtn
	QTh5B0Nj1HV6m79eg35vP2evbVw==
X-Received: by 2002:a5d:6087:0:b0:43d:708f:a63e with SMTP id
 ffacd0b85a97d-43d708fa6f6mr3675840f8f.10.1776028188629; Sun, 12 Apr 2026
 14:09:48 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260406-selftests-bpf_misconfig-v4-0-9914f50efdf7@suse.com>
 <00e95867-edbc-4e74-8696-16a8f61223b7@oracle.com> <DHPIZX3045PN.2QCSGKPP43W3I@suse.com>
In-Reply-To: <DHPIZX3045PN.2QCSGKPP43W3I@suse.com>
From: Alexei Starovoitov <alexei.starovoitov@gmail.com>
Date: Sun, 12 Apr 2026 14:09:36 -0700
X-Gm-Features: AQROBzDEoHs8AN70ZQU6rFFqi96tGMTpydxF-q75n3f12Cuk-TEdUaK2x-jPrm8
Message-ID: <CAADnVQL1uXfPr1WuM1B8YeJHC8y+roE+b0OT1F5saM=_aeOjBQ@mail.gmail.com>
Subject: Re: [PATCH v4 00/10] selftests/bpf: Tolerate partial builds across
 kernel configs
To: =?UTF-8?Q?Ricardo_B=2E_Marli=C3=A8re?= <rbm@suse.com>
Cc: Alan Maguire <alan.maguire@oracle.com>, Andrii Nakryiko <andrii@kernel.org>, 
	Eduard Zingerman <eddyz87@gmail.com>, Alexei Starovoitov <ast@kernel.org>, 
	Daniel Borkmann <daniel@iogearbox.net>, Martin KaFai Lau <martin.lau@linux.dev>, 
	Kumar Kartikeya Dwivedi <memxor@gmail.com>, Song Liu <song@kernel.org>, 
	Yonghong Song <yonghong.song@linux.dev>, Jiri Olsa <jolsa@kernel.org>, 
	Shuah Khan <shuah@kernel.org>, Nathan Chancellor <nathan@kernel.org>, 
	Nick Desaulniers <nick.desaulniers+lkml@gmail.com>, Bill Wendling <morbo@google.com>, 
	Justin Stitt <justinstitt@google.com>, bpf <bpf@vger.kernel.org>, 
	"open list:KERNEL SELFTEST FRAMEWORK" <linux-kselftest@vger.kernel.org>, LKML <linux-kernel@vger.kernel.org>, 
	clang-built-linux <llvm@lists.linux.dev>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, Apr 10, 2026 at 6:57=E2=80=AFAM Ricardo B. Marli=C3=A8re <rbm@suse.=
com> wrote:
>
> Hi Alan,
>
> On Fri Apr 10, 2026 at 7:06 AM -03, Alan Maguire wrote:
> > On 06/04/2026 19:22, Ricardo B. Marli=C3=A8re wrote:
> >> Currently the BPF selftests can only be built by using the minimum ker=
nel
> >> configuration defined in tools/testing/selftests/bpf/config*. This pos=
es a
> >> problem in distribution kernels that may have some of the flags disabl=
ed or
> >> set as module. For example, we have been running the tests regularly i=
n
> >> openSUSE Tumbleweed [1] [2] but to work around this fact we created a
> >> special package [3] that build the tests against an auxiliary vmlinux =
with
> >> the BPF Kconfig. We keep a list of known issues that may happen due to=
,
> >> amongst other things, configuration mismatches [4] [5].
> >>
> >> The maintenance of this package is far from ideal, especially for
> >> enterprise kernels. The goal of this series is to enable the common us=
ecase
> >> of running the following in any system:
> >>
> >> ```sh
> >> make -C tools/testing/selftests install \
> >>         SKIP_TARGETS=3D \
> >>         TARGETS=3Dbpf \
> >>         O=3D/lib/modules/$(uname -r)/build
> >> ```
> >>
> >> As an example, the following script targeting a minimal config can be =
used
> >> for testing:
> >>
> >> ```sh
> >> make defconfig
> >> scripts/config --file .config \
> >>                --enable DEBUG_INFO_DWARF_TOOLCHAIN_DEFAULT \
> >>                --enable DEBUG_INFO_BTF \
> >>                --enable BPF_SYSCALL \
> >>                --enable BPF_JIT
> >> make olddefconfig
> >> make -j$(nproc)
> >> make -j$(nproc) -C tools/testing/selftests SKIP_TARGETS=3D TARGETS=3Db=
pf install
> >> ```
> >>
> >> This produces a test_progs binary with 579 subtests, against the total=
 of
> >> 708. Many of them will still fail or be skipped at runtime due to lack=
 of
> >> symbols, but at least there will be a clear way of building the tests.
> >>
> >
> > hi Ricardo, I've been looking at this series and one concern I had was =
if
> > tolerating failures to build with incomplete config would create proble=
ms
> > in detecting failures when the config is complete, i.e. in BPF CI. So f=
or
> > example if say a BPF skeleton didn't compile when it really should due =
to
> > an introduced bug, we wouldn't want to drive on in all cases.
>
> Agreed.
>
> >
> > However, from what I can see, CI held up well with these changes in pla=
ce [1].
> >
> > That said it might be nice to preserve a "strict" mode which fails when
> > we hit compilation issues etc, failing as we do today; I couldn't find =
any existing
> > general kselftest concept that fits with that but it would be valuable =
I think
> > if possible. Perhaps we could default to non-strict mode when a make -C=
 is initiated
> > or something like that, and continue to operate strictly when building =
directly
> > in tools/testing/selftests/bpf?
> >
> > I ran the changes through the usual workflow I use - build bpf selftest=
s at
> > tools/testing/selftests/bpf level and run ./test_progs ; no regressions=
 were
> > observed, so feel free to add for the series
> >
> > Tested-by: Alan Maguire <alan.maguire@oracle.com>
>
> Thanks for testing!
>
> >
> > There are some comments on sashiko.dev [2] that would be worth looking =
through
> > too, in particular the concern about O=3D and M=3D mentioned for patch =
1.
>
> I will send v5 with those addressed and possibly a strict-mode switch.

and strict should be the default.

Even sashiko doesn't like this "ignore all errors" mode:

https://sashiko.dev/#/patchset/20260406-selftests-bpf_misconfig-v4-0-9914f5=
0efdf7%40suse.com
