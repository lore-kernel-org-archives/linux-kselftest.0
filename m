Received: from mail-ej1-f51.google.com (mail-ej1-f51.google.com [209.85.218.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C7CA13EB111
	for <linux-kselftest@vger.kernel.org>; Wed, 17 Jun 2026 11:59:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.218.51
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781697585; cv=pass; b=dLCtlRyJLwrJI/DQTTUtDGmrkRiWOLtco2WmnDKDRhmRYKmuni/efm8uj8ehgYAzl6Rmi3mIgUU3Hn603H+pjBqUoXE8i2oqc/Q2G8e4oYfuo4l4ZbPtYGopYn+BCa8qUPMBDrNA54C7QDhq35Qj8ZH64rECb7l+ClTLdY6qzDQ=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781697585; c=relaxed/simple;
	bh=8akt/BMqI4Kjv8lSIjzIFUGEQibAxUf+a29pOQsWUmY=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=h3QxOvXKu5G7HpAfeP0UerPQGt/xtpQwzTzm8eFtZ6qGeEudfj+/tRwmfDz6qT+uJKKO+u1EXfCd/g9lwhwW7drMl4GFB7/91xSIiWqELnbv6uscmsRrAzwFJSet/H2ufWeenXj302v6DWT9IEHsP19vOJAMW2kj05AalfnLhVE=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=qqWfKrxl; arc=pass smtp.client-ip=209.85.218.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="qqWfKrxl"
Received: by mail-ej1-f51.google.com with SMTP id a640c23a62f3a-bec49f7e35eso752349066b.2
        for <linux-kselftest@vger.kernel.org>; Wed, 17 Jun 2026 04:59:43 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1781697582; cv=none;
        d=google.com; s=arc-20240605;
        b=VQZlnw5ruU7gamsz7/3OXzPu9hLKRx82a00an45ICx5yb2bJUnniOWNuQhkOJdaa9M
         i4/layTHoQSt1fCQk/IyJc86K4IXQHSO7rEgqcuCWBxwQVegZuztoL0GqYQzJWJPxxJO
         wK/9Z8ZUmSjvECbzCnQiujCA7mGMuhyHpSdoYhUTkW89a3Oy6joc5O01Dm4eY4FVNoV5
         Zi2RRGHxNbyZP6R4L+wyhDTDVPEmCwZAa7/sRsuFNhRgiqZ/QzA5uTtmOcQTiemGfjCT
         RvfVSXYw1vXFF8PoZ3KR7Ecug+ERKc2Am6jYd0tXrXl3MG5Zz9S9GJMQ30Qcibgt5j4t
         IKCQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=WSRlCu2GkIH7ZB817+Hh/HHTjCSZH03SYLagMC/Q7yw=;
        fh=pqONhfKAiOqBwo/poykK4eOn3nfnSDeTesLbZlMz5MA=;
        b=g5NhhD8aSy0ciwkrZMSj6xgSXMsyG71XnodnZG8c/ny5p0kh6z7N5cCodEw7SDFxq6
         NjGBYA75Ztx2QTJwuYjucCTb9zta2rufb7LXGz0+uqCzbt6bmH9J6DC/l6k2AcCXGGQk
         xmJ7MlqG/xS2ef7tIOXBo4JHJdlhGFBHNBlyAXTwOaxzO/pq0vOyoFeGLrCM8UVc2p6M
         T8oJVjorl5QJ9eu+x9rhzI7w2dRFZHY0dNbyOdQJLwi7dZZQV9ZKDxQO0J1cXnYaI96Y
         Csg2YuJzROiF9+dKSmqe45eM4NgKptx2UZ41IStsnp1PD3gmNjMYogaDIoPnq211BFp1
         rhdQ==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1781697582; x=1782302382; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=WSRlCu2GkIH7ZB817+Hh/HHTjCSZH03SYLagMC/Q7yw=;
        b=qqWfKrxldPapGQY4bno7uv7ozsRcBDfdhOVuf2w4Rncvj0OS3HruiTTSz4YeRrHETe
         yzW++4lmgHXfTWcSt6yosJ0BVh1/UosXBXrpsFNh/Cg7BZdYCY9ajHnEYlV/88J43RzP
         Eu4KFW3T5h1SCX0BbVsDZC3+qQUtwjktNbGTtV9JXvqGUR8IAzOtpk7mzPk7jx9EIF/V
         sLc1xIsMTrlPr4Gw/ON9yvK98K2BEcvdEwIjfBZXUeKtzFvftjJuFTrBFC6cwL+8wLJY
         AlPD8UtLEPTNteJom4pqGxv844kvhsR+BoEnNN9fCVtM4z99wnr3y5s+PKgFCveg1FYa
         984w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781697582; x=1782302382;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=WSRlCu2GkIH7ZB817+Hh/HHTjCSZH03SYLagMC/Q7yw=;
        b=kj1riehOO5Y9QS3LnYF9fZ9QrAZXwaDyqgRDuqvxdvRIuTy60KCJZdsAeGX4coxHuY
         OrWJ/tqnjDAxlkRnkA0Ts//jk5Td3C4T+DyVF5l0BDrk1rqwrz0Ybp1s0bqv9JEfauGn
         EGV7Z4HNAbKKmBi3scyOOEMC1fc6rR4xR4ToZHcOmyH//zAs/ZJ2UCbzfxn+KZJbKw0S
         D7tCSeC2g5zE+8v+VYS07a268WqyMUUP6t3mgyPf0/zI8b62PqRfUWhEm3jtRWaGNSb4
         7pUBTIOYL9ddFpRhbYy+/KwYHPvjXeDGK77yfY7SjDdM5fUL5LkGPUk0K/hTYNx5Bteu
         KW0w==
X-Forwarded-Encrypted: i=1; AFNElJ8APL4ai9IR9ulKhRYPjgwQZLEoVXfUs3eXaTM6tEteCHJYY2EDzEN3BIOArBqnbr7kbZrurVEbMEDwwVvHEeQ=@vger.kernel.org
X-Gm-Message-State: AOJu0Yx401Fmtau9FT1Qic/J1jrR8M8uje0GWtQ83gvqKH8HAv4herpg
	jOxIjFDLRwFCjJiZJbiUToFBp/0CQUsPpGXJVvUYEyLTzCN3wIfFSg+OLyTzbYdsshTJVlgP2bK
	lqPzMxNcd9Wq9IILhUxuZm5ISW2wyr3E=
X-Gm-Gg: Acq92OEquQk0kT1gwM7Sds2ChGv12z11ss0M92OHlVEFR/mRG6808rHkArNRmE5rnPz
	SGu+zPLAdpFaP1pIsnhua2AQtCFAB645WZ/4/1kcs+HM+7O5qF7aQrlLw5hgnz4ywmNg1K6115X
	ag2RR69sdyqHLIPxsGx6uKlAnY7KT2OD3lhvT4Qs+DI226UEBtE68yBNN+qoTuAatcmNRL5Z1FD
	2QPylq4wMOVN9QZAelWOnRe+avQzknB2Y+kqUbPeUMBmIVXnhU45738PQvKxmAGaGkNUDA9ZuaN
	ch8CQREmvYgir0i3S7VrWjOKFzM=
X-Received: by 2002:a17:907:b18:b0:bfa:320c:b93b with SMTP id
 a640c23a62f3a-c05a6bd9a6amr154958866b.25.1781697581767; Wed, 17 Jun 2026
 04:59:41 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260524-fix_pipe-v3-0-bb4a75d23a90@debian.org>
 <ajG2bmhu6j9UWvh4@localhost> <ajJgWBCFYwz9OIo3@redhat.com> <ajJ1Xi1p9UhQvILi@gmail.com>
In-Reply-To: <ajJ1Xi1p9UhQvILi@gmail.com>
From: Mateusz Guzik <mjguzik@gmail.com>
Date: Wed, 17 Jun 2026 13:59:29 +0200
X-Gm-Features: AVVi8Cd0aWE-N2CJqRiE84I13EFNt0mxlHrGNQ-K93V_evKOBFVmX_CosDS-2DY
Message-ID: <CAGudoHEyDz-Tbj=CZFK5XMLuLyE8B17NumdFVLf6MTTekFgRRA@mail.gmail.com>
Subject: Re: [PATCH v3 0/2] fs/pipe: reduce pipe->mutex contention by
 pre-allocating outside the lock
To: Breno Leitao <leitao@debian.org>
Cc: Oleg Nesterov <oleg@redhat.com>, Josh Triplett <josh@joshtriplett.org>, 
	Alexander Viro <viro@zeniv.linux.org.uk>, Christian Brauner <brauner@kernel.org>, Jan Kara <jack@suse.cz>, 
	Shuah Khan <shuah@kernel.org>, linux-fsdevel@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-kselftest@vger.kernel.org, 
	shakeel.butt@linux.dev, jlayton@kernel.org, axboe@kernel.dk, 
	kernel-team@meta.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Jun 17, 2026 at 12:24=E2=80=AFPM Breno Leitao <leitao@debian.org> w=
rote:
>
> On Wed, Jun 17, 2026 at 10:52:40AM +0200, Oleg Nesterov wrote:
> > On 06/16, Josh Triplett wrote:
> > >
> > > On Sun, May 24, 2026 at 07:44:57AM -0700, Breno Leitao wrote:
> > > > This series pre-allocates pages outside pipe->mutex in
> > > > anon_pipe_write(): for writes that span more than one full page, up
> > > > to PIPE_PREALLOC_MAX (8) pages are allocated via a per-page
> > > > alloc_page() loop before the mutex is taken. anon_pipe_get_page()
> > > > then drains the prealloc array first, falls back to the per-pipe
> > > > tmp_page[] cache, and only enters the allocator under the mutex for
> > > > the leftover pages (writes larger than PIPE_PREALLOC_MAX, single-pa=
ge
> > > > writes that skip prealloc, or shortfalls when the prealloc loop
> > > > fails). Leftover prealloc pages are recycled into tmp_page[] before
> > > > unlock and any remainder is put_page()'d after unlock, keeping the
> > > > allocator out of the critical section on both sides.
> > > [...]
> > > > I also vibe-coded a microbenchmark to validate the change. It sweep=
s
> > > > writers x readers over {1,2,5} x {1,5,10} with 64KB writes against =
a
> > > > 1 MB pipe and prints throughput + latency percentiles per config.
> > >
> > > How do the numbers compare with 1-byte writes/reads? (It's fine if
> > > they're not *faster*, just want to make sure they don't get any
> > > *worse*. This case comes up a lot with pipes used for synchronization=
 or
> > > event reporting, such as with make.)
> >
> > Note the "for writes that span more than one full page" above. Pre-allo=
cate
> > does nothing if total_len <=3D PAGE_SIZE.
>
> Exactly.
>
>
> The pre-allocation only triggers for multi-page writes:
>
> anon_pipe_get_page_prealloc() returns immediately when total_len <=3D PAG=
E_SIZE,
> so a 1-byte (or any sub-page) write never enters the new path.
>
> anon_pipe_get_page() then falls through to the existing tmp_page/alloc_pa=
ge
> logic exactly as before; the only added cost is one length check and a NU=
LL
> prealloc pop, both trivially predicted.
>
> Measured it to _just be sure_, 1-byte ping-pong (perf bench sched pipe -s=
 1):
>
>     baseline:  2.674 usecs/op
>     patched:   2.710 usecs/op   (+1.3%, within run-to-run noise)
>
> --breno

There are trivial touch ups which can be done by adding a bunch of
predicts and inlining kill_fasync if someone can be bothered.
