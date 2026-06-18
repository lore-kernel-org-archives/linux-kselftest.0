Received: from mail-qk1-f179.google.com (mail-qk1-f179.google.com [209.85.222.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 235E6331213
	for <linux-kselftest@vger.kernel.org>; Thu, 18 Jun 2026 22:51:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.222.179
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781823066; cv=pass; b=Px/s4f2r8hw522sx4vDes2G04mVfZA/h3STbVtVIgrgmDhSxjCw7TjTz4+DXE0QEl7V1JuT/x/k9uH8hqgb+9ZD3vxo4orqJE9IV6fKOcQVhO+bHXXXTtqI5nZlX3b6dlFG5uhb0KzhgCAPdaW1NZQ5t08TKbt0gsmTcl+Ud46E=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781823066; c=relaxed/simple;
	bh=EMYr1F+PpGtSmTpfHsTm52f8sshX1D1zHOemelGKRHw=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=OqGgpcW1PgKOeIZyhxfyoptM6LIAKxWc3OjWg5112pw9clSU44PuhBmJNn0/pBjdXhINQDjaKb9mU/FxYfwDqR+SPUryb0PpZs3pY90uLpcW8wtac3haDTeRXvO5KM+bxPC96GII/3vdl+JgZ1kolh1OYcUbDlTuE/xJ7iydxsk=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=CZ2E6C7p; arc=pass smtp.client-ip=209.85.222.179
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="CZ2E6C7p"
Received: by mail-qk1-f179.google.com with SMTP id af79cd13be357-91588056619so114985985a.2
        for <linux-kselftest@vger.kernel.org>; Thu, 18 Jun 2026 15:51:03 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1781823063; cv=none;
        d=google.com; s=arc-20240605;
        b=Q4iarymNbaYkCrKrfyiQEnOlZMbjsbF5I33FbDRvrlTT7jvDsr+SGbVnKa6IzfIud2
         bzBFv1OvTstvLQFGE7hGSlJ3xKu7LGhrkOchiAqM2Rpiqe2qO2hNl0Yo1STnvMi2yLwx
         PsK1nDdSEpFhIfLDMxW59qw2888upOYBxPALwKEvYJWL41wlVeXe5XgS8bkwSUOmCHsC
         hsEXzjMFI74oON9WL78FJrFHJWXtpEcCvVByk8f/0gzadgSIZ3Vt+fMgLbUYwxazr5a2
         XDxiPBNf8YWa1oO1k87ETJclSgyIdqIZ/lpuuM3h4x1/SRYaZLKhI8vaDNp6CWMMW/T6
         2ZXw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=SMwuGs+SqkOWXXKsNFJ9sJZ3Linv0hyo9Jf2noGou30=;
        fh=398n/xOK+Qbvwjb5x7Uw1v4IfJxm0qgbLn7kKknZBr8=;
        b=QABerN7O/8KiMrhzuxyZxr4JbZGr8/ClhVoeNxN/o7KIOA3Xklmkyw7axNDPS0nosR
         6G7SwFlRxexHfujEqOSlfFG1gETPinrSklecG8qhSO/EjPq2dDHYHFgRJtUC9QXELiBA
         0kydG5mBcqbQVzFsBF0qp4kiHj7cgYlFpV1Cut7/J6vNldlTbbJQOy3GkHmSROYC6V3q
         794aU61w9H4Xi7PaZdmdVDNCnU+LQbRejiP+s8LGXmdiR7Uq6HvL8KlrH8uuaaSB1ZyO
         hm07ycfHphnF24p6UYJ6ds0CA3yNdyH8oVRV3INac6gVQ/mIxYS+idKrPg80WzOib36s
         ldLw==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1781823063; x=1782427863; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=SMwuGs+SqkOWXXKsNFJ9sJZ3Linv0hyo9Jf2noGou30=;
        b=CZ2E6C7prhTojmgoHGdNe7OileXPbl3IdhXRahO17zU0p7sydgNazhp1YHE4kV/6eg
         /iLvrxYKEmWLRXuKoolRzvba4DUUKfRHLyiBgYpuqOcdWtg82BbySEy4qLx6HhHXP7dS
         PthIZYz4hSquO4gFZ3URQSYFja1vdkH+gSP3b9b2UHQAe+pCO5lsOGswbMvzZJQaVr3J
         LMfxXi93vOcsvLFfsN8zLILywVKhEiv9aH7ub2Wr26pPk6HXp1A+vN3Q1qU+OaSnl3td
         B+79jtylayY9plF1MJRE+jSxSw56SZl4UEYadYOtdVYwiErhIjX8wLS2AjK/RQ+xbQeP
         KzBg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781823063; x=1782427863;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=SMwuGs+SqkOWXXKsNFJ9sJZ3Linv0hyo9Jf2noGou30=;
        b=aXxDyvByCNeDpCEObOyc/D+mR4EvUSebKmgP4QGc1882Q7E7biRVI8kSJiot7HQnDN
         HlYCiSYxdIkiatdcLzlLvHtvssto7pEOyLoWXcVa5cJOiN0Ju7s6h5lZqdNC1MmjSFv9
         uISjbLYtSjGo8QNp2ZF0yXcyPmVIZgoLo0SHQ9OUDBDeFGsVnZtRjdi4f4xEiHzhprvv
         P6C5NQl1xsemHRQzY38iKa3X3y3QYpUflGY20GYm3sVj6dtYAaxquZOcjmL4SFnpY3te
         2QtNtVNgFQqsxTLfD7lqq9WmcA49V4Lh1wHUcj7n070HmaX3CDhjQIi17QYE/hxEw/Ao
         PCsQ==
X-Forwarded-Encrypted: i=1; AFNElJ+RKvBDT/rCO10NJLYZfhP3h3zgI5LtQQZM6Pe4Gs3lzev9gyAI6WdgAw4t9Wdwpd07FM++XpKfae4tWzsm6PI=@vger.kernel.org
X-Gm-Message-State: AOJu0YxTn0mjk0bDVlyyCxCl7hfY3uMmWJzf436aVLGn8v9KFmKSetWw
	uT9MyvylXtLqCfRJNg9oFFJACXhUOTq4eKxo5UIWY4Sfu3brg+8qAhszfue3/arqd8HTcUWjKX9
	e+ycwzgOPXRUGTv+SghOWkIikbyZtziY=
X-Gm-Gg: AfdE7cmwErQbfsOlpBT298cgBW20qCOx3Uxd6vQGeBsDw6SMD4irQX2auGgKbaRnTIP
	83QDb75BdIAAfo/FHdpW9m3LKn/GWTnQgqZK4DjIKeRlUCA4JAvBI/sGXK1TdujeDzkHD27LZ5x
	7gShg6VWo+j8XWTh9DuI8zQlMfZKsHfe2HJU/4u6/8ODqPswWzdmY6O5VFAhNnc6cTAbfHyU/0W
	pPDqgPghCc+N0kwfhNHrnselIgRUmTS9pAr5ui0fCPd3c+mD/R8CqLsqauv2LABEfC3pou9+a93
	Ufh/i97d8/94E083eq0sqnBlIUw=
X-Received: by 2002:a05:620a:19a7:b0:915:6504:2a11 with SMTP id
 af79cd13be357-9208d2f42f5mr171322285a.44.1781823063019; Thu, 18 Jun 2026
 15:51:03 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260618203411.73917-2-dwindsor@gmail.com> <e9ec622a8a49be299cbbfd459e2fc10693bcd65c6dbf00c9e2645281564e5579@mail.kernel.org>
In-Reply-To: <e9ec622a8a49be299cbbfd459e2fc10693bcd65c6dbf00c9e2645281564e5579@mail.kernel.org>
From: David Windsor <dwindsor@gmail.com>
Date: Thu, 18 Jun 2026 18:50:50 -0400
X-Gm-Features: AVVi8Ceqq7GMU3vGf90S537LLM-Tkad05xeAgBh-3i_pTCiFmecE5-lsBfct2HY
Message-ID: <CAEXv5_hDJyZ=nY6JaSL=17Mtw+e_m1doj=KReWSNmgo6ULFKpA@mail.gmail.com>
Subject: Re: [PATCH bpf-next v3 1/2] bpf: add bpf_init_inode_xattr kfunc for
 atomic inode labeling
To: bot+bpf-ci@kernel.org
Cc: viro@zeniv.linux.org.uk, brauner@kernel.org, jack@suse.cz, ast@kernel.org, 
	daniel@iogearbox.net, john.fastabend@gmail.com, andrii@kernel.org, 
	eddyz87@gmail.com, memxor@gmail.com, martin.lau@linux.dev, song@kernel.org, 
	yonghong.song@linux.dev, jolsa@kernel.org, emil@etsalapatis.com, 
	kpsingh@kernel.org, mattbobrowski@google.com, paul@paul-moore.com, 
	jmorris@namei.org, serge@hallyn.com, zohar@linux.ibm.com, 
	roberto.sassu@huawei.com, dmitry.kasatkin@gmail.com, eric.snowberg@oracle.com, 
	stephen.smalley.work@gmail.com, omosnace@redhat.com, casey@schaufler-ca.com, 
	shuah@kernel.org, linux-kernel@vger.kernel.org, linux-fsdevel@vger.kernel.org, 
	bpf@vger.kernel.org, linux-security-module@vger.kernel.org, 
	linux-integrity@vger.kernel.org, selinux@vger.kernel.org, 
	linux-kselftest@vger.kernel.org, martin.lau@kernel.org, clm@meta.com, 
	ihor.solodrai@linux.dev
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Jun 18, 2026 at 5:22=E2=80=AFPM <bot+bpf-ci@kernel.org> wrote:
>
> [ ... ]
> >
> > +struct xattr_ctx {
> > +     struct xattr *xattrs;
> > +     int *xattr_count;
> > +};
> > +
>
> Paul Moore suggested in v2 renaming this to 'struct lsm_xattrs' to avoid
> overloading the term 'ctx' in the LSM space. The struct was renamed from
> 'lsm_xattr_ctx' to 'xattr_ctx' in v3, but 'ctx' is still in the name. Was
> there a reason to keep 'ctx' in the name, or would renaming to 'lsm_xattr=
s'
> as Paul suggested be preferable?
>

Indeed he did; I mistakenly inverted his original request.

Will send a fix for this, as well as converting GFP_KERNEL to GFP_NOFS
in the allocation in __bpf_init_inode_xattr.


> >  /* Default (no) options for the capable function */
> >  #define CAP_OPT_NONE 0x0
> >  /* If capable should audit the security request */
>
> [ ... ]
>
> > diff --git a/kernel/bpf/bpf_lsm.c b/kernel/bpf/bpf_lsm.c
> > index 564071a92d7d..86a8e188b900 100644
> > --- a/kernel/bpf/bpf_lsm.c
> > +++ b/kernel/bpf/bpf_lsm.c
> > @@ -113,6 +113,9 @@ void bpf_lsm_find_cgroup_shim(const struct bpf_prog=
 *prog,
> >  }
> >  #endif
> >
> > +BTF_ID_LIST_SINGLE(bpf_lsm_inode_init_security_btf_ids, func,
> > +                bpf_lsm_inode_init_security)
> > +
> >  int bpf_lsm_verify_prog(struct bpf_verifier_log *vlog,
> >                       const struct bpf_prog *prog)
> >  {
> > @@ -137,6 +140,12 @@ int bpf_lsm_verify_prog(struct bpf_verifier_log *v=
log,
> >               return -EINVAL;
> >       }
> >
> > +     /* bpf reserves a fixed number of xattr slots for itself.
> > +      * Set the attach limit so the trampoline rejects excess attaches=
.
> > +      */
>
> This isn't a bug, but a subsystem pattern flags this as potentially
> concerning: the BPF subsystem comment-style rule for files under kernel/b=
pf/
> requires multi-line comments to have the opening /* on its own line, with
> comment text starting on the next line. The preferred form would be:
>
>         /*
>          * bpf reserves a fixed number of xattr slots for itself.
>          * Set the attach limit so the trampoline rejects excess attaches=
.
>          */
>
> > +     if (btf_id =3D=3D bpf_lsm_inode_init_security_btf_ids[0])
> > +             prog->aux->attach_limit =3D BPF_LSM_INODE_INIT_XATTRS;
> > +
> >       return 0;
> >  }
> >
>
> [ ... ]
>
>
> ---
> AI reviewed your patch. Please fix the bug or email reply why it's not a =
bug.
> See: https://github.com/kernel-patches/vmtest/blob/master/ci/claude/READM=
E.md
>
> CI run summary: https://github.com/kernel-patches/bpf/actions/runs/277886=
16397
