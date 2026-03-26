Received: from mail-ej1-f49.google.com (mail-ej1-f49.google.com [209.85.218.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4896540629D
	for <linux-kselftest@vger.kernel.org>; Thu, 26 Mar 2026 16:26:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.218.49
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774542365; cv=pass; b=diPiM5Ky5lJ1lv/n3NjzBw1MgcIvYOtEJ+/R8m1yTtoHI8GseshtD+rTbDp3lBI/tM6fPFC00TeKU6hfft93lmRxoNQUKQyUiKIV9I6m8SiCfkIyTAquOu/RAUvBeGX4ZqUuE7Ej2Wrv8sH2F65/TwNlb98EyMzXKS/3yJzhlPU=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774542365; c=relaxed/simple;
	bh=+1VIbwYlD5P6U8aunjd8muf/Soz0/OQ+HB4vCQY8XcE=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=bFxenCoFNcBQya1VFtLpNKrgkAK5ftk5Z+RcCRinDL/WnGGxRDl+do1NdU0PZYRbKQZsRVXIKxgnSykbReyi1U6ZlW8pa7Npf6fxR6NZ6y83+Qlz1OMe3xz3EgjCjQnlDw5bY6ge9gOTgMXgbXyuMG7PNv5OTnAcjVvmKHmyvqQ=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=OIjt7dM2; arc=pass smtp.client-ip=209.85.218.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="OIjt7dM2"
Received: by mail-ej1-f49.google.com with SMTP id a640c23a62f3a-b932fe2e1a7so146153866b.1
        for <linux-kselftest@vger.kernel.org>; Thu, 26 Mar 2026 09:26:03 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1774542362; cv=none;
        d=google.com; s=arc-20240605;
        b=k6lTehUHGSvZBDqUnov/4mzmbhIsY2Cx5nrDVN9gEb85biRmYFzZ84gl/UzbnN0JYB
         TFcIF4wr+PZNSnLaZzTw7pB1KcLuo7dYv6HrJOmP7hl4XSYmeRGnSyi+7y5zonr5qyih
         Ub4Il+X6ojypv+3+zqmcaaxHxvyHdhkQsmN6lcgIEgQQhhWIHh4t8dKj/jir2WbQ9/eA
         KLODYNIPVc1FypJplQGKBjOJ2cvrklKr8Rtn9jUlZhQCEt9ammabzziBSjgb8e4YWe9L
         banbPTjb75MQLgGmWyg2bN2L61y/2rJqlVlZZAFPmePfpfX5UaYDMNJIJFQz39uoj6J2
         6DHA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=8weEZ4/v1Q8ThZTOa9v3bW52mEvoKROcLFNZAFrpZyo=;
        fh=kCv0GmNUkG2hzzBcK1/gEl8xTTWWYvt8L8UBg7CNTLQ=;
        b=LKVVY5Dt+wOLVJJe1bZPAh2QIndTfgJQ1d2REjWMcRttyo4Pc5IuG6mjnCk6cnVrZj
         a7V4YQQUc8cZP0+9JR3t+ufZU7jIEx72nYlbZrLkt/Nnmlm3dUKAITNtRu8cptw9zqgE
         yVQff0SLEqPO1JeowiS0Kye2e82XAP8dbYxIqtXFf0Zoo13IEOA/jvwMNTz9JcjWfAh2
         n/AIwAfEQ0Us5MhSAcNsPgHtisG52kSa9FvSAL6lfj+FxJ+1qI22LAcrmhyzLk+1V2L2
         X0uyH4/V/X3sUJM3d1+rpgO617KCvUj/q5GiIW3d7878SR0hpFtySVoVtUJw8AwNF0BH
         z1JQ==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1774542362; x=1775147162; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=8weEZ4/v1Q8ThZTOa9v3bW52mEvoKROcLFNZAFrpZyo=;
        b=OIjt7dM2avcxdHSAQ9t138PAS4680+gwMh4oq+ttpJq06GscL6Hj5ZxCqs0rvwikVD
         lRKFmk0RhoYhrI096cqjRerqFOot+rS5fzsefHv8ZXKzV0WWMG3pnxpgW8prnybYA7C+
         h8ZR1mVSqPI8LGF9/XpxOR45W1XWNGlV54NHKRr1oIIoDGQ58TDtp+eDwoy+Bi+DfEug
         /8Th7EkiVqW8aemVeqPk77wcHJYoOx5xoIawqM3Vrdo+IctFiNmzDxC5KHPiGwQ+brNF
         y8+S8OSYlzGjfrdwEo86jLIYRWY8F4qdE0ECqV7lBjmbPaPEY0rRWOffB29SgWfgm4HL
         VcfA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774542362; x=1775147162;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=8weEZ4/v1Q8ThZTOa9v3bW52mEvoKROcLFNZAFrpZyo=;
        b=gusfIx9ZW4p2V/G9JmqRSt0zj0w0Lf7Ex3HWFurgyZiiSXr/HN98KHLRgaRkrfAAsE
         C0715NX8FphxN701mvad8cdcjJtZnYTU4kjROfNpwO4TzTmv/+lWTw7diZgYvquxspFW
         KctRhWj5tCdvZI3uyiQOR19HtsY1ka/XFt9TRZPoJOYsLSVqokHpsFqe+CEaEBdFpOPu
         ZQv0rLbyctkXUsrrk3wktrcAY0QvT109SoHJuMhUpC2IF4x0EomGbfRN5b6/bJ80rsHi
         pDt+IzjZOQBsIxbm63MSLHyBL8YRtiOwzDT8htOXxwE4PJoWWMOvv1yJq/Sb7HMHsD4C
         bS1A==
X-Forwarded-Encrypted: i=1; AJvYcCUHtmloh1KocX97Yw6vk29qFjmEqfLbVf5leJERXgq2N7iTpzVp2ro2Q8hJ3SgblBl1UX6GVcK23D4E8Bz/R+8=@vger.kernel.org
X-Gm-Message-State: AOJu0Yyr8RvZXqQviIpCf9XFhQYJuFcnSHsjZ2W0wa4uKx3LnhDcRt4e
	hAmoFChRaDaJrS4XjfYLOXDy7CliSQf0KY+zIlwwl37RTbRvCB0x/CdEgAkzpIjJZqV9/bAzkoo
	aeP88FLZYvtUcL7D1Zc7/YnLf/rnUWaGUYSSS5P5C
X-Gm-Gg: ATEYQzyYP4tHATdX9PABZkhk+b/li2hqVs5BNhiWfVSp/TUrrWFQKZG4TCbQwHYC0mJ
	BVi1TDljyjM1PPQ2QLagUap1crsJrNVMGkpYQRj0SwyyBdxoaJ/VCfxVdJ1i5966K9Zo3L7X8sT
	svWYBNbb5Dgo9cmwopYuBnJoStFPBUbb5htsYz7Mh3QuuJMUNuaSqJfJ0PUWckiSIDb/562uQiI
	2Zc0bFV9YP3TjWrpC8/OBPFPUSv63KjoqSRjK+j/O5yEUMW/0gTtZVwJzAPvhJsdZvZj0r7eUVu
	Byj/EdIQ1vCZwwHdAGDr2+l96KMwT8cwJF7+
X-Received: by 2002:a17:907:7fa9:b0:b87:173f:61b with SMTP id
 a640c23a62f3a-b9b348a060emr151018566b.9.1774542361098; Thu, 26 Mar 2026
 09:26:01 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260326112521.2827500-1-wusamuel@google.com> <m2v7eig4ue.fsf@kernel.org>
 <CAP01T74KNVT2SVRR+XPbFb1vy85W=Jkp4_yD6xvTSg2avQo8AQ@mail.gmail.com> <CAADnVQK252XxmxM3enS4wPREshTEawQKbChgN-teX3+wmxgdBQ@mail.gmail.com>
In-Reply-To: <CAADnVQK252XxmxM3enS4wPREshTEawQKbChgN-teX3+wmxgdBQ@mail.gmail.com>
From: Samuel Wu <wusamuel@google.com>
Date: Thu, 26 Mar 2026 09:25:49 -0700
X-Gm-Features: AQROBzDpxR80sNDZIp7I-1jwQ56Npkte6GZeWCLG3T-hio_UtCQbkOqHje_ZuUg
Message-ID: <CAG2Kctqd4p4pJtH=tSfKT57qfecQrpcoYu3SsAzJ-zGEiYVSQA@mail.gmail.com>
Subject: Re: [PATCH v2 0/2] Support BPF traversal of wakeup sources
To: Alexei Starovoitov <alexei.starovoitov@gmail.com>
Cc: Kumar Kartikeya Dwivedi <memxor@gmail.com>, Puranjay Mohan <puranjay@kernel.org>, 
	"Rafael J. Wysocki" <rafael@kernel.org>, Len Brown <lenb@kernel.org>, Pavel Machek <pavel@kernel.org>, 
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Danilo Krummrich <dakr@kernel.org>, 
	Alexei Starovoitov <ast@kernel.org>, Daniel Borkmann <daniel@iogearbox.net>, 
	Andrii Nakryiko <andrii@kernel.org>, Martin KaFai Lau <martin.lau@linux.dev>, 
	Eduard Zingerman <eddyz87@gmail.com>, Song Liu <song@kernel.org>, 
	Yonghong Song <yonghong.song@linux.dev>, John Fastabend <john.fastabend@gmail.com>, 
	KP Singh <kpsingh@kernel.org>, Stanislav Fomichev <sdf@fomichev.me>, Hao Luo <haoluo@google.com>, 
	Jiri Olsa <jolsa@kernel.org>, Shuah Khan <shuah@kernel.org>, 
	Android Kernel Team <kernel-team@android.com>, LKML <linux-kernel@vger.kernel.org>, 
	Linux Power Management <linux-pm@vger.kernel.org>, driver-core@lists.linux.dev, 
	bpf <bpf@vger.kernel.org>, 
	"open list:KERNEL SELFTEST FRAMEWORK" <linux-kselftest@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Mar 26, 2026 at 8:02=E2=80=AFAM Alexei Starovoitov
<alexei.starovoitov@gmail.com> wrote:
>
> On Thu, Mar 26, 2026 at 7:54=E2=80=AFAM Kumar Kartikeya Dwivedi
> <memxor@gmail.com> wrote:
> >
> > On Thu, 26 Mar 2026 at 13:20, Puranjay Mohan <puranjay@kernel.org> wrot=
e:
> > >
> > > Samuel Wu <wusamuel@google.com> writes:
> > >
> > > > This patchset adds requisite kfuncs for BPF programs to safely trav=
erse
> > > > wakeup_sources, and puts a config flag around the sysfs interface.
> > > >
> > > > Currently, a traversal of wakeup sources require going through
> > > > /sys/class/wakeup/* or /d/wakeup_sources/*. The repeated syscalls t=
o query
> > > > sysfs is inefficient, as there can be hundreds of wakeup_sources, w=
ith each
> > > > wakeup source also having multiple attributes. debugfs is unstable =
and
> > > > insecure.
> > > >
> > > > Adding kfuncs to lock/unlock wakeup sources allows BPF program to s=
afely
> > > > traverse the wakeup sources list. The head address of wakeup_source=
s can
> > > > safely be resolved through BPF helper functions or variable attribu=
tes.
> > > >
> > > > On a quiescent Pixel 6 traversing 150 wakeup_sources, I am seeing ~=
34x
> > > > speedup (sampled 75 times in table below). For a device under load,=
 the
> > > > speedup is greater.
> > > > +-------+----+----------+----------+
> > > > |       | n  | AVG (ms) | STD (ms) |
> > > > +-------+----+----------+----------+
> > > > | sysfs | 75 | 44.9     | 12.6     |
> > > > +-------+----+----------+----------+
> > > > | BPF   | 75 | 1.3      | 0.7      |
> > > > +-------+----+----------+----------+
> > > >
> > > > The initial attempts for BPF traversal of wakeup_sources was with B=
PF
> > > > iterators [1]. However, BPF already allows for traversing of a simp=
le list
> > > > with bpf_for(), and this current patchset has the added benefit of =
being
> > > > ~2-3x more performant than BPF iterators.
> > >
> > > I left some inline comments on patch 1, but the high level concern is
> > > that encoding the SRCU index into a fake pointer to get KF_ACQUIRE/
> > > KF_RELEASE tracking is working against the verifier rather than with =
it.
> > > Nothing actually prevents a BPF program from walking the list without
> > > the lock, and the whole pointer encoding trick goes away if this is d=
one
> > > as an open-coded iterator instead.
> >
> > Which is fine, the critical section is only doing CO-RE accesses, and
> > the SRCU lock is just to be able to read things in a valid state while
> > walking the list. It is all best-effort.
> > Open coded iterators was already explored as an option in earlier
> > iterations of the series and discarded as no-go.
>
> kinda best-effort...
> the way it's written bpf_wakeup_sources_get_head() returns
> trusted list_head. It's then core-read-ed anyway.
> Ideally it should be trusted only within that srcu CS
> and invalidated by the verifier similar to KF_RCU_PROTECTED,
> but that's bigger task.
> Instead let's make bpf_wakeup_sources_get_head() return 'void *',
> so it's clearly untrusted.

Thanks all for the fruitful discussion; this is more rigorous. I'll
update v3 so that `bpf_wakeup_sources_get_head()`'s return type is
`void *` and I can add a corresponding selftest that directly
dereferences the head and expects a verifier failure.
