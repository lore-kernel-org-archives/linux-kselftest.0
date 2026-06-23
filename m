Received: from mail-qk1-f170.google.com (mail-qk1-f170.google.com [209.85.222.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7E61939DBD6
	for <linux-kselftest@vger.kernel.org>; Tue, 23 Jun 2026 04:02:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.222.170
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782187334; cv=pass; b=XxFXKGXgkS8XwCg/7E4zxFKQHly16T4FanbuU9hAPmnVJmeg+UnA+3EaLDmb2y/tAG7wf0l1ShDrlpGjStDroMuuHiqIGlb2qWwfdzAVaWnFWSNDDIfLMd2Sz76GnL+N3J4vFvLPP/QVfV1L0F660gV+lBWskKNhoxMvozvgb5g=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782187334; c=relaxed/simple;
	bh=F0wTGQkkGlxpSFeNyjD6eaC/VlWEy1Nj2KPYSgkBaLA=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=opIBfsnnzAmGJ2cUPMR7H26K0psyW+5GkMM1lR53Wf/fNQqH98QAeVOL+ZTz/60yUsxIcCwjfJ7toq1gFIasBgz+ERwtIr2dgVMPTtZilhwxOBW1ZPNaq74vPim693M30SAEM+FtfSHxBs+K/+H9h4s+I1AGG/bUqcHLCvGOIo4=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=kvfEHe85; arc=pass smtp.client-ip=209.85.222.170
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="kvfEHe85"
Received: by mail-qk1-f170.google.com with SMTP id af79cd13be357-9158fbaa4bbso582378785a.1
        for <linux-kselftest@vger.kernel.org>; Mon, 22 Jun 2026 21:02:09 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1782187328; cv=none;
        d=google.com; s=arc-20240605;
        b=Mg1MNpyzPxBtPXMWDQJ95/+m4KdCsYf6wkwyhqlsF8arCjV1PcwV8CigXVws3KmkQ+
         OGQ8W9evz0v6DCzFJNTGpUSx745aVoSeLSoH0yUoJY1V25QR51r2MNVa+T8AEeZ3xvNO
         1xrvBu/LHYklJ9r1hKbzu6wlOk6RCvVhlHJqD2lcNzlERW7AHSFWHfeh/QOIaYJ1nbT3
         QDv9teSx7kiuMfSgcGh9qBxP2Lo2Ugr1olOUG6X3C5OJPNUqqNn+1nMTWTIOMqmJRmfO
         Df5WcRUbYgaP9/K8pBYOPRwOGE2mnbpuV/JRywb33neD8+QwVwQoPoMN7dpa+ja6I3H4
         v5wg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=eW8+mqrmr6N7CBulx1m18TzlUYk2VeJ10g5AWzjPQEQ=;
        fh=F+GbuvYPU2OEIH03ZIWEyp9eRbHCcT/Pbg90PJJY16U=;
        b=c0LJ3wrlidbPYvHwVHs4WmWex8l0utEZNhjwhcM05xLvnMa1u/APZYcUjMlNM6BsdI
         aoNl4RgZ+e8JWFA4R4o+vnEZt8fLKLgZuvaeluC89hbtUparUQ5ImqVZllHBqw9xd6xb
         mKoYAWeM+ZVaqAak8pTnya8742G0SVPsnprM9VovZH90lkPeCgyDkZYEVWPIQd4I5bu2
         CG0MFq/mbSD7VmJoogc5jPXXZJOSzko+pXbUxF/DqUqF/Em7CRtIi4aOAe0yP3CISxpx
         V25PCfW1Etc93sm3gAC1AFlrEioSijfjzIxYwTuB/s9XayXFMAGkA76DYmgedu4un4Ms
         M5kA==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1782187328; x=1782792128; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=eW8+mqrmr6N7CBulx1m18TzlUYk2VeJ10g5AWzjPQEQ=;
        b=kvfEHe85g9lUYBp4b+HBBNOtnEXPs2FhHtjfbueg3OXE/2zsiVDDCk5Sf2KOR1lxib
         zIoQxQiskpChFQyo21WNgATlA1ZTx/GP/aSDvLer8bGK1k/DXX2aghlwkYqQv2pFkyFz
         oked1raJu7gLr0qxR3h80MSU/LFbvjxaK41XdPy0f5iGOahOso5D6brjklO00daNIfq1
         gIxALTWLg3bznUVXFcT2ZVDOgIwpidNjrhE9Sc+zhNk1C8e6f6KiwIxKTskiB6kpTBMK
         w1nNx8ay0Yr5pDD5SIS7zDfDIGIW66P2uO5D9Xu05DDJK12HXpSTUlR+6N1r5JyQ9KZc
         sUcw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782187328; x=1782792128;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=eW8+mqrmr6N7CBulx1m18TzlUYk2VeJ10g5AWzjPQEQ=;
        b=Dog9Xm6hr8BIqRckK9GA5B9ESZDyrp7Jg+UwaXE0K55PAkR2zDb+hn6xYQH0x7v0hD
         JMdMZM7uHid0uNKFaooTgTHiSR4M7eZoxh0qD7ONBOXmiw735Hm3jCNDwkYMwDYefRQv
         gBob5RFqZTjTDOytmg2JDbcxWv9CqUhYrYAGoLpBpcTno7Mhu5eyday5fAj0pMEfAfOu
         8538OQ9a1p7v85gK5X+yHiyvWIDDB9Czrj2c3N3QMvv7ZQ8uWdIzghhE5OATswoeecEP
         QOJA8QZFbW2buY6KmS3B9aOKv6wFNr1RVP07xOr9GMJzVJb2eUHXcYUTZibj8O+My1BB
         u4QQ==
X-Forwarded-Encrypted: i=1; AFNElJ9TmvE6OpIvzml2nPW1aQlhwRfc4Z0pZ0IULa5FKVt7Et+s56ePFMULJM6NXotnFkh2+uT+IZcMgDrdWl59YlY=@vger.kernel.org
X-Gm-Message-State: AOJu0YxDYH6+KWgWmKs8LbQbiFfqMylSjdHISlakzm2NBh5fCzElCqsf
	Lp1IxQsG1EfmzWngTsBawVSb90PFKtziOBcOQWVCYDj7XJ1jY13qNJPZKQKrddQ5gl48nsKdkla
	Rv7lHRzKh9ZCYk8P6/PamfhC6fw3jYKw=
X-Gm-Gg: AfdE7ck0H/OwPr2KAuyhKhW4pd80IVWxyYKU/yu5nO2dIkwiZJ3e/9rvYyamz60c0Ml
	T8+kmSUBNOMoO82UFmogUAFPq4vWTA0ZYUEv1hVk6pGys8CuRZMYPJReCTlYXzvPCeEzWjVFrpS
	EauYAgRpWDvy8YUmjxXG2IVPUY03NR9ohMksJatmEDfycgv6CstWLm2aXy08NR4JMUPgJ3wgUvK
	HKWwvD6ZbXarONADK/qoqm+MY53dxVLONYh+8eIvZICEUZIfyD3bZt25lAf/U75NCcJh4BXUulA
	tF8+gfIWakLkBjCt+CVg6WTOHAdGJiPi8SX88g==
X-Received: by 2002:a05:620a:4808:b0:915:e9c3:f1a0 with SMTP id
 af79cd13be357-9208f05c232mr2733502085a.12.1782187328229; Mon, 22 Jun 2026
 21:02:08 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260618203411.73917-1-dwindsor@gmail.com> <20260618203411.73917-2-dwindsor@gmail.com>
 <DJFZGYZFMN73.1799LMXW49WZO@gmail.com> <CAEXv5_jVXS4JoExcd71YkXEE2WXPJ0_9STO-uCwgNF+Eia_h5w@mail.gmail.com>
 <CAADnVQJsdrL2RjxM4UE1WyWrT9KsprFP+=xLHRtFhUSccDqQcg@mail.gmail.com>
In-Reply-To: <CAADnVQJsdrL2RjxM4UE1WyWrT9KsprFP+=xLHRtFhUSccDqQcg@mail.gmail.com>
From: David Windsor <dwindsor@gmail.com>
Date: Tue, 23 Jun 2026 00:01:56 -0400
X-Gm-Features: AVVi8CdBJDCEtsjZ6Cr-k5RWu5qRO4rCaGhk6aOZoAtNJHl7U-y4zrw2gKO9F3E
Message-ID: <CAEXv5_jTxeTRdWpv71=6k_VTN4ZCes30xPs746Frw96fShfe4w@mail.gmail.com>
Subject: Re: [PATCH bpf-next v3 1/2] bpf: add bpf_init_inode_xattr kfunc for
 atomic inode labeling
To: Alexei Starovoitov <alexei.starovoitov@gmail.com>
Cc: Alexander Viro <viro@zeniv.linux.org.uk>, Christian Brauner <brauner@kernel.org>, Jan Kara <jack@suse.cz>, 
	Alexei Starovoitov <ast@kernel.org>, Daniel Borkmann <daniel@iogearbox.net>, 
	John Fastabend <john.fastabend@gmail.com>, Andrii Nakryiko <andrii@kernel.org>, Eduard <eddyz87@gmail.com>, 
	Kumar Kartikeya Dwivedi <memxor@gmail.com>, Martin KaFai Lau <martin.lau@linux.dev>, Song Liu <song@kernel.org>, 
	Yonghong Song <yonghong.song@linux.dev>, Jiri Olsa <jolsa@kernel.org>, 
	Emil Tsalapatis <emil@etsalapatis.com>, KP Singh <kpsingh@kernel.org>, 
	Matt Bobrowski <mattbobrowski@google.com>, Paul Moore <paul@paul-moore.com>, 
	James Morris <jmorris@namei.org>, "Serge E . Hallyn" <serge@hallyn.com>, Mimi Zohar <zohar@linux.ibm.com>, 
	Roberto Sassu <roberto.sassu@huawei.com>, dmitry.kasatkin@gmail.com, 
	eric.snowberg@oracle.com, Stephen Smalley <stephen.smalley.work@gmail.com>, 
	Ondrej Mosnacek <omosnace@redhat.com>, Casey Schaufler <casey@schaufler-ca.com>, 
	Shuah Khan <shuah@kernel.org>, LKML <linux-kernel@vger.kernel.org>, 
	Linux-Fsdevel <linux-fsdevel@vger.kernel.org>, bpf <bpf@vger.kernel.org>, 
	LSM List <linux-security-module@vger.kernel.org>, 
	linux-integrity <linux-integrity@vger.kernel.org>, selinux@vger.kernel.org, 
	"open list:KERNEL SELFTEST FRAMEWORK" <linux-kselftest@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Jun 22, 2026 at 11:59=E2=80=AFPM Alexei Starovoitov
<alexei.starovoitov@gmail.com> wrote:
>
> >
> > > > diff --git a/kernel/bpf/trampoline.c b/kernel/bpf/trampoline.c
> > > > index 1a721fc4bef5..b41b02173e24 100644
> > > > --- a/kernel/bpf/trampoline.c
> > > > +++ b/kernel/bpf/trampoline.c
> > > > @@ -859,6 +859,9 @@ static int bpf_trampoline_add_prog(struct bpf_t=
rampoline *tr,
> > > >       }
> > > >       if (cnt >=3D BPF_MAX_TRAMP_LINKS)
> > > >               return -E2BIG;
> > > > +     if (node->link->prog->aux->attach_limit &&
> > > > +         tr->progs_cnt[kind] >=3D node->link->prog->aux->attach_li=
mit)
> > > > +             return -E2BIG;
> > >
> > > No need. The check inside kfunc is enough.
> > >
> >
> > Paul wanted this check because it occurs at bpf prog attach time,
> > whereas the one in the kfunc is at inode creation time.
>
> Sorry, we're not adding redundant code to the verifier.

Thanks, will send v4 soon.
