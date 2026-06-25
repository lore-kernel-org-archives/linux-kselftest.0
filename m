Received: from mail-pg1-f171.google.com (mail-pg1-f171.google.com [209.85.215.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 375CB3655FA
	for <linux-kselftest@vger.kernel.org>; Thu, 25 Jun 2026 20:48:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.215.171
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782420486; cv=pass; b=Rv8JiCMWNxhHJ3S5ipALhNIEC9wcsJ0SwOmv8o9OECmUxOXRemRI0R8inS6KoeMMfbIdwCVYYv9asx9v787e5iCIy6BmdxzJfUynA7xNYldd+8zarrzwRSCzkAm0hoplTtdXUycle/qMm0dgnnFtGnxDxX85xuaLE7p23/RfGUQ=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782420486; c=relaxed/simple;
	bh=f0Ceifmdtd+icWZEIGznyRsCS3GvzZoATmFU82jVusM=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=HUNenowjZVUJMpIILM9+6OwnvEBdLJa7jjBIrJnw3n3/juAsxL2pcRDFCffjE6gxFnWkbIAVQteSbWJWFPXlIOfk5C5jrMX8or9NOKWsEAOR/quCc1weh8xNJVfB01nLPpdYS2+9CkOoNpnIiu5jVMIk3ibZpZXJV7RFZfT4Z+c=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=paul-moore.com; spf=pass smtp.mailfrom=paul-moore.com; dkim=pass (2048-bit key) header.d=paul-moore.com header.i=@paul-moore.com header.b=fGKpDWF+; arc=pass smtp.client-ip=209.85.215.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=paul-moore.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=paul-moore.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=paul-moore.com header.i=@paul-moore.com header.b="fGKpDWF+"
Received: by mail-pg1-f171.google.com with SMTP id 41be03b00d2f7-c86307c4e6bso124214a12.0
        for <linux-kselftest@vger.kernel.org>; Thu, 25 Jun 2026 13:48:04 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1782420483; cv=none;
        d=google.com; s=arc-20260327;
        b=lgcHg3ncUrqsXOs57BKb44MiSQUDSHFQKbzX4//MYJWNQ/MA4mwTG70ueMlrbNeHVn
         QIa4zjQulls7gP+79Yx/QU6wHzq1p/8YgtIqWkOc+zTCMntXQRyU/zGHQyHsprstJOC6
         DIfVJ6uxdRkUPStvzaLQ/1L9BfAfD7MjBPNyuaM7cH+0dc3puyTxHnPlsDhcT5BvXQLO
         rOsyXO46JunUTHYk4s6w9pG9bJhIbcQ7RluH2VXHJXbxcxywvOOtBRrzbw1z3fLwF74H
         +Dw1UCB+TehfG8RQ2I+Rh4z80vaJQyJtIu4RsxlFmKEpBza1nbYvgCgX2Gni2meVHYRC
         Jdng==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=azFpD8w+2tmcQpqU30ws2iQaaMKt3MV7jEBsuDhiaTo=;
        fh=w2dBf9W7MlhmG6+Tw21Kl8NIDsD00GEBWX4spUkDeMc=;
        b=VnBJcDQbzgTKVEUu2dXmi+ArlIMMOegdrLJygXTkpJajDN5ns5W9MRPi2tiGfbRnI3
         9Rkyk/WsjFBsq43wkAb7/wDLs6/qqaAFeJtaKZGfvVpDPP6/zGLU0RAvo41Rvn4Q6BlH
         CD43t+cQvhi4PcuA1S88luy1bWS+pNcbdzMrpZooKNjZPtkyjgBqrw0AwCXMs2QZK1sd
         e3wgUvTjUXyjRYnQOGfoLP/iwsHximwJn3udozxiCJD2KFWbNW8uNrdZR2GYrGxZxNRc
         yTvz9qw6htzFiAM2m47+18JwOXVnemTxTtXhkrU98pikGH3WDivg+nVUZJ8kBWPveHO2
         /O1g==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=paul-moore.com; s=google; t=1782420483; x=1783025283; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=azFpD8w+2tmcQpqU30ws2iQaaMKt3MV7jEBsuDhiaTo=;
        b=fGKpDWF+vWPIG/vytG8etsjCv8EuM35t5u73k2ZExHfdTKfjs0WH9aQUC+5SHQsTXU
         7XKkjqAFI+No2YeGYhxhXEpWdy+tkgGTMtrHEVo/P7M1ItNdX75HD6ENzdFCPDenV0mu
         sNYTvX1XnP6xn4Kg8p4s1pxGT/G7wJtrroM7U9UQTbckWpT0IgzCLsGEfFfuWLIAtaru
         NrCMb0Fk8COwaKcl6t7hrzjxdR0/6klXEduISzHACggR1j9s/V+bFEtowjy2qh6wMXJD
         WcpTH+TrEiEiseu7pBceKl7/cy/MCNUvK11lmrdpupjfNRr9LKd3wXEY57fXp2XVzWGb
         xUDA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782420483; x=1783025283;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=azFpD8w+2tmcQpqU30ws2iQaaMKt3MV7jEBsuDhiaTo=;
        b=tANCylFAnwLsxS6b8YzFqEGomRIYY+6cGR96vl5rosH4rBIzzt07IE4FNkr3PsjucR
         +HWVAhXwwXZ5dJ72+cPTngANJpZxTOu+tmbL4SprxA30Z7VqjC6uZOUGbgK/8MNkv9Rw
         nyjJWkb92OEAXRkNfLebEkbcW7oBMxyCNLC+wJnMrDtEDsiCpteFP1Xh3djxUugdhsuj
         SyKH6g20ntx7dujvODboYv8S6LUoQKVIhb/4kCvpsbNCtT8f+azxx3DcRpYtXkk2SrmK
         E6HUr5PICrSdX27Mo88s77ZiAUGkPbHnqqjW1ZT1qUlKXHGao4x5geiksRPIzqsvXQHh
         Nl8A==
X-Forwarded-Encrypted: i=1; AFNElJ87Bfdkg1qRgJZXysC6K/f2zK9DmdFQwwovwrTEjVC5QLj/mxAKu+QuyQjykQC/Y3b76fzTebYDWz+rYkeK2Hg=@vger.kernel.org
X-Gm-Message-State: AOJu0YxpqwIuPBDhKsgvys9eM+g2btt9E9qCkktw+GdzauagXYNqekEe
	bKZu8/mEnSIqgvWKCihv39QKuJNHXCqmTGHDEUUgUyBbTAYydtODNRISoQZIC82ZyPTgQimil0u
	zZxMBi1ttrQtySsz0RezTuG6KZiV5mDspb8yXXky1
X-Gm-Gg: AfdE7cmcUQZ5TQgpERBx2iXyImo//3XrUiwhsiNKBkPAh/eQ7Ef9dCvmEdAwYoYDS2O
	vA5xa+kk06TeMARywh+eWFmgj4dkWW3iiLf7eblhRzsLJPkMK8p6V7u2zr6JOuoofsJ9mxRSfam
	EnKUKSXsPXpTZ2UlON/HrXdbJ2h+cLPHjZbD3ZaBXIsGqL9VkS9pmpSrT8b+rT7nFqJ9stYssA2
	YliFNZ6UOtDnsfo2saqUb8aXEw/8uPvhH3IM3H04yzm49bL8ESu1t4cxReF+zOHULmFRC5Z
X-Received: by 2002:a05:6a20:258f:b0:398:bda8:d8cd with SMTP id
 adf61e73a8af0-3bd4ac850b6mr4962108637.7.1782420483450; Thu, 25 Jun 2026
 13:48:03 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260618203411.73917-2-dwindsor@gmail.com> <75d39fd9847cca915d704235264ab474@paul-moore.com>
 <20260625-schnabel-rennmaschine-parieren-bcb352c3cf59@brauner>
 <CAADnVQKKr5cCYTj8qS7tU-Aeda1iexYUp5aquTjYXMEL656cJQ@mail.gmail.com>
 <CAHC9VhSXXHGRUmJ4YjQ6uEh6dbq7+h_0TwWiV+W5dUWXCTFcfg@mail.gmail.com> <CAADnVQJM15E0PwomdTiz8zvVMGkqs9mTSjYRdPBF6fgE=tsPCQ@mail.gmail.com>
In-Reply-To: <CAADnVQJM15E0PwomdTiz8zvVMGkqs9mTSjYRdPBF6fgE=tsPCQ@mail.gmail.com>
From: Paul Moore <paul@paul-moore.com>
Date: Thu, 25 Jun 2026 16:47:51 -0400
X-Gm-Features: AVVi8CeSCq01YuOttlTLlYK8mdjCXHKn7_tsxEH2h9SOetfWd3DVlVdhg7KLIyU
Message-ID: <CAHC9VhSm_yC7f1FRHJn0NE1-UwCOx7Nhc9dxVJXs8DFzzxNKQw@mail.gmail.com>
Subject: Re: [PATCH v3 1/2] bpf: add bpf_init_inode_xattr kfunc for atomic
 inode labeling
To: Alexei Starovoitov <alexei.starovoitov@gmail.com>
Cc: David Windsor <dwindsor@gmail.com>, Christian Brauner <brauner@kernel.org>, 
	Alexander Viro <viro@zeniv.linux.org.uk>, Jan Kara <jack@suse.cz>, 
	Alexei Starovoitov <ast@kernel.org>, Daniel Borkmann <daniel@iogearbox.net>, 
	John Fastabend <john.fastabend@gmail.com>, Andrii Nakryiko <andrii@kernel.org>, Eduard <eddyz87@gmail.com>, 
	Kumar Kartikeya Dwivedi <memxor@gmail.com>, Martin KaFai Lau <martin.lau@linux.dev>, Song Liu <song@kernel.org>, 
	Yonghong Song <yonghong.song@linux.dev>, Jiri Olsa <jolsa@kernel.org>, 
	Emil Tsalapatis <emil@etsalapatis.com>, KP Singh <kpsingh@kernel.org>, 
	Matt Bobrowski <mattbobrowski@google.com>, James Morris <jmorris@namei.org>, 
	"Serge E . Hallyn" <serge@hallyn.com>, Mimi Zohar <zohar@linux.ibm.com>, 
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

On Thu, Jun 25, 2026 at 4:44=E2=80=AFPM Alexei Starovoitov
<alexei.starovoitov@gmail.com> wrote:
> On Thu, Jun 25, 2026 at 1:40=E2=80=AFPM Paul Moore <paul@paul-moore.com> =
wrote:
> > On Thu, Jun 25, 2026 at 3:58=E2=80=AFPM Alexei Starovoitov
> > <alexei.starovoitov@gmail.com> wrote:
> > > On Thu, Jun 25, 2026 at 7:23=E2=80=AFAM Christian Brauner <brauner@ke=
rnel.org> wrote:
> > > > On 2026-06-23 20:12:32-04:00, Paul Moore wrote:
> > > > > On Jun 18, 2026 David Windsor <dwindsor@gmail.com> wrote:
> > > > >
> > > > > > Add bpf_init_inode_xattr() kfunc for BPF LSM programs to atomic=
ally set
> > > > > > xattrs via the inode_init_security hook using lsm_get_xattr_slo=
t().
> > > > > >
> > > > > > The inode_init_security hook previously took the xattr array an=
d count
> > > > > > as two separate output parameters (struct xattr *xattrs, int
> > > > > > *xattr_count), which BPF programs cannot write to. Pass the xat=
tr state
> > > > > > as a single context object (struct xattr_ctx) instead, and have
> > > > > > bpf_init_inode_xattr() take that context directly. Update the e=
xisting
> > > > > > in-tree callers of inode_init_security to take and forward the =
new
> > > > > > xattr_ctx.
> > > > > >
> > > > > > A previous attempt [1] required a kmalloc string output protoco=
l for
> > > > > > the xattr name. Since commit 6bcdfd2cac55 ("security: Allow all=
 LSMs to
> > > > > > provide xattrs for inode_init_security hook") [2], the xattr na=
me is no
> > > > > > longer allocated; it is a static constant.
> > > > > >
> > > > > > Because we rely on the hook-specific ctx layout, the kfunc is
> > > > > > restricted to lsm/inode_init_security. Restrict the xattr names=
 that
> > > > > > may be set via this kfunc to the bpf.* namespace.
> > > > > >
> > > > > > Link: https://kernsec.org/pipermail/linux-security-module-archi=
ve/2022-October/034878.html [1]
> > > > > > Link: https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/=
linux.git/commit/?id=3D6bcdfd2cac55 [2]
> > > > > > Suggested-by: Song Liu <song@kernel.org>
> > > > > > Signed-off-by: David Windsor <dwindsor@gmail.com>
> > > > > > ---
> > > > > >  fs/bpf_fs_kfuncs.c                | 106 ++++++++++++++++++++++=
+++++++-
> > > > > >  include/linux/bpf.h               |   1 +
> > > > > >  include/linux/bpf_lsm.h           |   3 +
> > > > > >  include/linux/evm.h               |   9 +--
> > > > > >  include/linux/lsm_hook_defs.h     |   4 +-
> > > > > >  include/linux/lsm_hooks.h         |  16 ++---
> > > > > >  include/linux/security.h          |   5 ++
> > > > > >  kernel/bpf/bpf_lsm.c              |  10 +++
> > > > > >  kernel/bpf/trampoline.c           |   3 +
> > > > > >  security/bpf/hooks.c              |   1 +
> > > > > >  security/integrity/evm/evm_main.c |   8 ++-
> > > > > >  security/security.c               |   7 +-
> > > > > >  security/selinux/hooks.c          |   4 +-
> > > > > >  security/smack/smack_lsm.c        |  27 ++++----
> > > > > >  14 files changed, 166 insertions(+), 38 deletions(-)
> > > > >
> > > > > I have a few specific comments below, inline with the patch, but =
I wanted
> > > > > to make some general comments too.
> > > > >
> > > > > The kfunc additions really don't belong in the VFS kfunc file, pl=
ease
> > > > > create a LSM kfunc file (call it security/bpf_lsm_kfuncs.c) and a=
dd the
> > > > > kfunc code to this new file.
> > > >
> > > > We expose a bunch of VFS heavy operations for various security modu=
les
> > > > and this is really not different. For xattrs we have it all central=
ized
> > > > in the VFS and in general all VFS related bpf kfuncs should continu=
e
> > > > living there and be registered there. Anything that's just bpf infr=
a
> > > > specific can go to security/bpf/kfuncs.c instead. But anyway, it's =
a bpf
> > > > specific helper so it's the bpf maintainer's call.
> > >
> > > Completely agree. This is vfs related kfunc and has to be
> > > in fs/bpf_fs_kfuncs.c to make sure vfs maintainers review it now
> > > and all future changes to it.
> >
> > *laughs*
> >
> > Okay, then split out the LSM specific stuff into
> > security/bpf_lsm_kfuncs.c; all the LSM macros/defines/calls should be
> > in the LSM kfuncs file.
>
> Paul,
>
> I'm sorry, but you didn't demonstrate the level of understanding
> of bpf to be trusted to maintain any piece of it.

Alexei,

You haven't demonstrated the understanding or decorum necessary to be
entrusted with any part of the LSM framework.

--=20
paul-moore.com
