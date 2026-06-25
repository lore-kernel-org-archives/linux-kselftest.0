Received: from mail-pj1-f53.google.com (mail-pj1-f53.google.com [209.85.216.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C366A34887E
	for <linux-kselftest@vger.kernel.org>; Thu, 25 Jun 2026 20:40:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.216.53
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782420037; cv=pass; b=p5mFZjnpcRCUYqND4PDGFpEJ/jbfMj0DvXbbj3hcJiwsEEVnBQgTSZ57beUmUGhmPI/c6A9E2l2X08Jwtwlg4DkD4/CeIKrI/IrhCcEwdxeksFaypwaya3otXcpdg7Irx1uEL4YroQw2lJ2IeTtCVxmvl+H4eLnPPSlyhbjTF2g=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782420037; c=relaxed/simple;
	bh=RyZsVwgwp6SsDCHuEWnfop0rVpAHFJuENw+MxHAhUEc=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=iuQalpCPszrDPVk2JrE4drTpRPjpHOhuOjFNEOg35W5NN+Tve+BKs6m9cwwEmKH4jw2ta7GF0P86xZmqiHFRdk2TtQgmuNf2WFsSl6wgqK4K7I01dQ1GewzNpQrC7xOxleqOssuE5nQqsK838G2MKe7wbXd4ok3z+U2n2Ks2VDc=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=paul-moore.com; spf=pass smtp.mailfrom=paul-moore.com; dkim=pass (2048-bit key) header.d=paul-moore.com header.i=@paul-moore.com header.b=MFsW9Q5c; arc=pass smtp.client-ip=209.85.216.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=paul-moore.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=paul-moore.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=paul-moore.com header.i=@paul-moore.com header.b="MFsW9Q5c"
Received: by mail-pj1-f53.google.com with SMTP id 98e67ed59e1d1-37de8c6a2b6so198270a91.0
        for <linux-kselftest@vger.kernel.org>; Thu, 25 Jun 2026 13:40:35 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1782420035; cv=none;
        d=google.com; s=arc-20260327;
        b=Nlbow4M1NWulOallKYQZK15p+NoKsp+hYvv9VMDvipgnmECpkvnKxikLgldaf9ZiDB
         T/U5CeJvfRz+UWL36ACpz4+gFHvvFIfdZplBFG34VLucOLXBBl+RLmB+V6bEEyXbJXgr
         EIKIi2MXxx2sQn1pG6ObcZE3DApwizY5yL8r1tFaUrfKiPw0q96MK3YEJyiaq+7XrgMt
         TcaY7HQhKcL0s5BNTIZIdt7sNfpxAme0ojkuWflD10Iy/aKJxipiyMPea+XYadyQVa/E
         W2+7qaM6OElDLChkxGBMkiHUhXmdQPFgiVlFdi4CIvC8Vh/mDZl/LqjpfIAFFUXaJOfj
         Ca9w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=+yx21f/fYo8TQI0aGf8AWSMgWBwIVqC4ciRZnA/Tpso=;
        fh=HAuvOaCXP+xXi1JBiEiapDr3HAjJcJblmi+Gm5rBhbw=;
        b=j8m+/lFpI1ih6GhnaCul0GXZj+9IsqvW88cBfSKugeRbHS7ovYPylVlLHph8xuyxcQ
         TdW4m8Z9vvn8JahB0ut9VQr3bhlCMjC9XDMoxgO+j7DMd4rUzvLgzxhsvd1n1O8tEo3l
         rjGJg8oUuIOV1J5BAhnLu6eZVeoYv38x7R8HmmDPkkIkYdnwH4L4QQJEcCEGMRKf9/09
         aK/YwsBSexMpH42X9VorUV/GykUnF+xr93LCqKigoLdjpNW8Xbv17PL1xnsu40Nj9vkc
         BJ3Wx9xB5Fkav8TEYq0TPluXrPWjD7FlZZNf48w/26T8skNzzmaFEwfKd8co0+Rwh3jy
         hVMQ==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=paul-moore.com; s=google; t=1782420035; x=1783024835; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=+yx21f/fYo8TQI0aGf8AWSMgWBwIVqC4ciRZnA/Tpso=;
        b=MFsW9Q5cwGycDxFIv1uTpQRDOXbfcxY/EiDTQvSiLgo4ZYkMuB9Pmrc1+YsaqzfH1D
         9DCVPc+P0+adZtcH0x5OgqmsneY6rOu7C2xAeoz/m5QpVGfAmlgr5Iee/asJtZJjXFAP
         r2GIk8tOPNWGes2h8n+EIxfyWX9EI6UVGbOzfyCdzq4CverDDtos7ZVd/N+qmyeNUhB6
         nicRrE0+AYncynkQN7d8+DJlEjFaSRja+6yT8gnVcgP1ncGULueRNJ0sWt3PhrYfNkkv
         pJZZwkZCknfioGQTu+A6NaXExUgbBzpoRp7vSMmkhMueQW1rgIM/ept+nhUYO7dUyuhF
         1HBQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782420035; x=1783024835;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=+yx21f/fYo8TQI0aGf8AWSMgWBwIVqC4ciRZnA/Tpso=;
        b=sggcCpYZ1cPq5IiRT4qyR3Q59KRLMLgK4HoMpfjwghACjpOO8Z2OlMyvcg7hZwJEWP
         5g6xglzm3g7XRVETY6smQ6PxcC60zDHf9oXIdqoL7CFfxrHZBv3QjbPdnKk4Iiw4anD8
         INlkuqsOzFmZV2K3O10TQU4DD3a7NuQcWqWWaZfOyFI95KF12Oa+5joJ71ty1uQVMwJC
         AOLDeoRecMmBmzZbJUjITuNElGgvOrL74tAnXeuOnVp4w3xzAakz+zA8dsKZf8Ka60vA
         OZ3eijII4xQ3ZGq+FkNjh97Y4U0GEn6TIPF21P08wqaGLOrNRj68GBXav26qtUrR2xXq
         dz3A==
X-Forwarded-Encrypted: i=1; AHgh+Ro3/DciVMzs+EatMA6oPGbOi2CPc8daUd709Fr1E6RAOO7z3mBPT+y1Tsd4aCgEyhfsgh3v+2tBdjntY7WNSuY=@vger.kernel.org
X-Gm-Message-State: AOJu0Yy2EKIawayNzdYsO+Rk6b4tU86W9rM7mbLd0VTtkbMMt0cmHp6G
	XeYTB1nlKTiAEmObMuF7CqRiVJ6rf8YhvRCOPExPmVCopQ/FTRhgspqYKg25QKFog+cT/O/D+P6
	rDzvLg7qmhe7aEs0Hztf270eFt9yM7Kc6pcxtLEX5
X-Gm-Gg: AfdE7cma3HyzhF9A8AhRXsbRY7Mzqj68bMXLIB6jQJOakb5q23MMaD66zXbyPZYJINO
	pfTZfE8n2C7nI5DO3WeOTCL3XFpq4UBBy8vxgy3Cnb8pW0W92rR1YD2dypAoR4Ntn4DW0mpNTG8
	+KQQOvATSkopormJ8Ysix37TMZioOKuzoM/qQTGEwn/KDGjWVPsszh2kVrqK65IzDvn1j+sMUZX
	+lPWiKunIRSebgHNyKpMJCCmAN/N6JVqi31EMGKanCSiQKS+iZ08EJksPDpasPWlNAkno2H
X-Received: by 2002:a17:90b:5288:b0:35b:8d89:719b with SMTP id
 98e67ed59e1d1-37dfa1739fdmr3601231a91.1.1782420034987; Thu, 25 Jun 2026
 13:40:34 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260618203411.73917-2-dwindsor@gmail.com> <75d39fd9847cca915d704235264ab474@paul-moore.com>
 <20260625-schnabel-rennmaschine-parieren-bcb352c3cf59@brauner> <CAADnVQKKr5cCYTj8qS7tU-Aeda1iexYUp5aquTjYXMEL656cJQ@mail.gmail.com>
In-Reply-To: <CAADnVQKKr5cCYTj8qS7tU-Aeda1iexYUp5aquTjYXMEL656cJQ@mail.gmail.com>
From: Paul Moore <paul@paul-moore.com>
Date: Thu, 25 Jun 2026 16:40:21 -0400
X-Gm-Features: AVVi8CcDIUi3TCDxMODHgBDj-5EqkoBML23qr5aVxuP34LM8Xdw4wwqiCZTY1ss
Message-ID: <CAHC9VhSXXHGRUmJ4YjQ6uEh6dbq7+h_0TwWiV+W5dUWXCTFcfg@mail.gmail.com>
Subject: Re: [PATCH v3 1/2] bpf: add bpf_init_inode_xattr kfunc for atomic
 inode labeling
To: David Windsor <dwindsor@gmail.com>
Cc: Alexei Starovoitov <alexei.starovoitov@gmail.com>, Christian Brauner <brauner@kernel.org>, 
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

On Thu, Jun 25, 2026 at 3:58=E2=80=AFPM Alexei Starovoitov
<alexei.starovoitov@gmail.com> wrote:
> On Thu, Jun 25, 2026 at 7:23=E2=80=AFAM Christian Brauner <brauner@kernel=
.org> wrote:
> > On 2026-06-23 20:12:32-04:00, Paul Moore wrote:
> > > On Jun 18, 2026 David Windsor <dwindsor@gmail.com> wrote:
> > >
> > > > Add bpf_init_inode_xattr() kfunc for BPF LSM programs to atomically=
 set
> > > > xattrs via the inode_init_security hook using lsm_get_xattr_slot().
> > > >
> > > > The inode_init_security hook previously took the xattr array and co=
unt
> > > > as two separate output parameters (struct xattr *xattrs, int
> > > > *xattr_count), which BPF programs cannot write to. Pass the xattr s=
tate
> > > > as a single context object (struct xattr_ctx) instead, and have
> > > > bpf_init_inode_xattr() take that context directly. Update the exist=
ing
> > > > in-tree callers of inode_init_security to take and forward the new
> > > > xattr_ctx.
> > > >
> > > > A previous attempt [1] required a kmalloc string output protocol fo=
r
> > > > the xattr name. Since commit 6bcdfd2cac55 ("security: Allow all LSM=
s to
> > > > provide xattrs for inode_init_security hook") [2], the xattr name i=
s no
> > > > longer allocated; it is a static constant.
> > > >
> > > > Because we rely on the hook-specific ctx layout, the kfunc is
> > > > restricted to lsm/inode_init_security. Restrict the xattr names tha=
t
> > > > may be set via this kfunc to the bpf.* namespace.
> > > >
> > > > Link: https://kernsec.org/pipermail/linux-security-module-archive/2=
022-October/034878.html [1]
> > > > Link: https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linu=
x.git/commit/?id=3D6bcdfd2cac55 [2]
> > > > Suggested-by: Song Liu <song@kernel.org>
> > > > Signed-off-by: David Windsor <dwindsor@gmail.com>
> > > > ---
> > > >  fs/bpf_fs_kfuncs.c                | 106 ++++++++++++++++++++++++++=
+++-
> > > >  include/linux/bpf.h               |   1 +
> > > >  include/linux/bpf_lsm.h           |   3 +
> > > >  include/linux/evm.h               |   9 +--
> > > >  include/linux/lsm_hook_defs.h     |   4 +-
> > > >  include/linux/lsm_hooks.h         |  16 ++---
> > > >  include/linux/security.h          |   5 ++
> > > >  kernel/bpf/bpf_lsm.c              |  10 +++
> > > >  kernel/bpf/trampoline.c           |   3 +
> > > >  security/bpf/hooks.c              |   1 +
> > > >  security/integrity/evm/evm_main.c |   8 ++-
> > > >  security/security.c               |   7 +-
> > > >  security/selinux/hooks.c          |   4 +-
> > > >  security/smack/smack_lsm.c        |  27 ++++----
> > > >  14 files changed, 166 insertions(+), 38 deletions(-)
> > >
> > > I have a few specific comments below, inline with the patch, but I wa=
nted
> > > to make some general comments too.
> > >
> > > The kfunc additions really don't belong in the VFS kfunc file, please
> > > create a LSM kfunc file (call it security/bpf_lsm_kfuncs.c) and add t=
he
> > > kfunc code to this new file.
> >
> > We expose a bunch of VFS heavy operations for various security modules
> > and this is really not different. For xattrs we have it all centralized
> > in the VFS and in general all VFS related bpf kfuncs should continue
> > living there and be registered there. Anything that's just bpf infra
> > specific can go to security/bpf/kfuncs.c instead. But anyway, it's a bp=
f
> > specific helper so it's the bpf maintainer's call.
>
> Completely agree. This is vfs related kfunc and has to be
> in fs/bpf_fs_kfuncs.c to make sure vfs maintainers review it now
> and all future changes to it.

*laughs*

Okay, then split out the LSM specific stuff into
security/bpf_lsm_kfuncs.c; all the LSM macros/defines/calls should be
in the LSM kfuncs file.

--=20
paul-moore.com
