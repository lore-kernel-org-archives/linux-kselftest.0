Received: from mail-pf1-f179.google.com (mail-pf1-f179.google.com [209.85.210.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5267A445AFF
	for <linux-kselftest@vger.kernel.org>; Fri, 31 Jul 2026 16:03:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.210.179
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785513795; cv=pass; b=d2UK2+IS1zNeAg0Cb8lWKdGVOLGS7TKVtipwH5QO8ZaNANyaPQ9rixCeoX+53EJfPlEM0DnPXTVukP9sKc8WSWh7ymTgMmrBSqmn+ujpylLHnGeoVu4TTTM8v0CuzYUvP1UGwNlCpoEMMFZedOoGKcprurVs1CPLogxMlBscCv0=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785513795; c=relaxed/simple;
	bh=n+9aQXVCyI5+nq4dxhlKhYIzN+km1UKy1fzyENReD5g=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=bobTIHXbBtDaADKQEpYcSUuk5Ut+Mb4npIExUEY/ilbuzoCmxVGIEQSuOD7Llb4tuNyPPri46FQipnTn4rlR+S/aMGagrtBGaZZeD2Iv0ArBkSA5xTT93da5wgRjyfF+HqaxhjvpQhvTC1jxf17C5TxnPb6xvZCds9sLL9HROUM=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=paul-moore.com; spf=pass smtp.mailfrom=paul-moore.com; dkim=pass (2048-bit key) header.d=paul-moore.com header.i=@paul-moore.com header.b=a0OcVIF1; arc=pass smtp.client-ip=209.85.210.179
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=paul-moore.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=paul-moore.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=paul-moore.com header.i=@paul-moore.com header.b="a0OcVIF1"
Received: by mail-pf1-f179.google.com with SMTP id d2e1a72fcca58-848479c9bd5so1042683b3a.3
        for <linux-kselftest@vger.kernel.org>; Fri, 31 Jul 2026 09:03:13 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1785513793; cv=none;
        d=google.com; s=arc-20260327;
        b=DcIqJRaBLWeKjwxT75v0cTKR6PAjcxRt6x/LbJg+kkMCAYbpXck8Ar1P7iG8yTW9Iv
         YO+VrZW7TrQ3xNPQqjVpVL8hZ9sf8Yvdfz4P5f8qegPp9bimv/yrIJmVa8ZmASw6rmBl
         PEgBmq8UlIP6cSuNw57t0ZCikzfJEyxpgmkOlCx49dg0zqrEpgAGzLkDwhQD7NiaG8Mh
         m1J7qXPxwGR+7/WhzxfO6u2CFg9QJIQWRXsd3WGqoW4s7+lSfCKVfN0/UKrQrlap7r/5
         vRuBc3dmNjnnEtWOZChO0J8xndV8d7nW7S5VwKY0I7K3kG8QeaIr2vCXZfmvXKSf80nL
         jm1w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=CFI/kEWUQrMOVwbdW9xBPQDb5xYR+l3PWasJ1nDKXvg=;
        fh=qHJ0mJ64a/pwNiIwhnPVe4Bn+v5qAfjeNX1aN65Y8AE=;
        b=f9Rv4I3sI3xNNsx+m79IODcK3UpH1oSt/KDANDj+cSmhoAbh8nUc0vsLx5tu6uZQKY
         N5nInjcgAp7RHRWyZjLamuvIT74WCnGb7DYBejKzBUsHLnyiAhJ8/G0vSKjjs4GklGPM
         ryAGmhLJhXBAm4+bhZS402i1/boip2AHADVrW7iNh8dSqareC/MGJuKsFNiH/K30zFj/
         mHVxyb9SuakHNJE1YmpUibjAe3T7Xv8JY0NyvWLBpEEEjCebWa/gG6HZ0zQWFkpRWOaI
         pUmRvW+QbVmE7Bs1on3O+VGHokxB+ux3A8ZZhTqyLGLi/FsmK5AAkad1qyRKkGruGF5d
         prxw==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=paul-moore.com; s=google; t=1785513793; x=1786118593; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=CFI/kEWUQrMOVwbdW9xBPQDb5xYR+l3PWasJ1nDKXvg=;
        b=a0OcVIF12lLVGVOtIfSx1+TKTqNpVgrze1/CLf/w6WuIFAMe8TWbyywpKFz+IZwAGT
         GrA01XVdi6CufaR3E0uq/uXmW+n1tSatdNMF/vxIUisQIQ5W9UmNNseOEq0FvYN0u4GN
         85UibeJSYrH/nIP+P/U5JaIssnF7hOGj7/TDIv3+RyTtovCjHe+vrY50MEBB/c1BRmKo
         U9dt/BvOvjv50PJTJEunlFw0dQvoszF3GjUco86M7dpGhBQsOQ6n2X+j3346ZEB6/Jz3
         shBQ/2418NTPr2DgGAmPzEvTOlUPQZtNU6hktOdQgM1MMra+4+UZJylVnTYHxiQCU14R
         QzFg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785513793; x=1786118593;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=CFI/kEWUQrMOVwbdW9xBPQDb5xYR+l3PWasJ1nDKXvg=;
        b=lJQxC9YrFB2O7yfuoBh81dOYKW5iao6yShxL10FN9qxNCQfRTAbQatLqqiz7oSrxo+
         ycLYZw+o9/M4a+6s2N+3ZxrMEMLhi3XojujO1SZEHEfwT72p1pFx4r/m4+MTKbcQ2tnl
         +Sn8EL0w+tNw6mqWtof1+70uO4bKr4atUX9RgQpukV7SfeWWxRFGMxzxZJQjhh4IhXCs
         yp4sp9UxIhKvM+25sbg94fUkv5dhrXuVKHKj4uWR/NkxSDHb5n+/MuWE4td3kXLXImch
         ScKZAasWTb9UMbiMA9b44qMwlm439ScE1uOunIVRv7RlnmeQM8+FRgbFoaG2sUItNYo0
         JQGQ==
X-Forwarded-Encrypted: i=1; AHgh+Rq8aOE0YXZII2ac7DemqmIDe17q8rH+P7fZlUhY5hFCx/Ge1zy4fO5At9oxjxvNs+QS0LILBJg/PKnuMT5sBDE=@vger.kernel.org
X-Gm-Message-State: AOJu0YxZRN50e2xhCR/CeMycgzCVYkVALv4jR8Xek0fLir2SLOLh7veO
	KX5lcAFb5T+QImvlfkgwpNeXdUEuKvldmnsRFgul2WKiBr8k2AGx+REr1Y5mYm9sccrt5yujbYh
	dAxuc7x1I7cPv1bBDCf5zEBlJI1vybp+1ePat5Xhs
X-Gm-Gg: AR+sD11xTvNaBT2byX59QRs5UZ5CW8qm3W3CThAeJEJYKjcAUoFj+HUk5MBJajW/1hu
	PEABc9aLC86Y7TcVChdx9Vwafw2i/N/KJKKO6+rMO9bFF4h54c1qPJsVSIIyp4FIWVhIpRNCRqA
	vGG/gUDmWl+jOu+s0fOzLkh3VcsayC0pHwbRv061va3YhCnhaTuA9FywrsyONdmEn4DVKLHSzGf
	FuNJ3qwUz86JSPniNo8zW4vt5BOA8h08TEUZxGh7gdfawiEchnYk5BmegTobT4rzThPpmDJZCQr
	/Yc7/MzCjzlntNRuSFrCiYM/7XuptjaI1j68bkKG8cno
X-Received: by 2002:a05:6a00:1956:b0:84e:223b:98c2 with SMTP id
 d2e1a72fcca58-84ee494dff0mr165281b3a.77.1785513791519; Fri, 31 Jul 2026
 09:03:11 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260730234533.1912709-1-dwindsor@gmail.com> <20260730234533.1912709-4-dwindsor@gmail.com>
 <CAHC9VhT=m-GtOZx2AHym7uN1CNx94arKBiXeVC7LTEJ-b=1EVQ@mail.gmail.com>
 <CAEXv5_iiNspub=qE1YW-01sV_bxxFUrrcAR4KV4Ec5i_mePtHw@mail.gmail.com>
 <CAHC9VhTS7rSnBqg00ZxNkcZyh_=EeJmn_4z3CTCCxreEEDtTtg@mail.gmail.com>
 <CAEXv5_iHLmzPT3Jj+qZsdt1Nk_5OD4Up3GGV0S9G7KyQshFhDA@mail.gmail.com> <DKCVF3KRQSOJ.1WKITMP369I0R@gmail.com>
In-Reply-To: <DKCVF3KRQSOJ.1WKITMP369I0R@gmail.com>
From: Paul Moore <paul@paul-moore.com>
Date: Fri, 31 Jul 2026 12:02:59 -0400
X-Gm-Features: AUfX_mxjC65mK_RgbRznYtgcxw-6qcPS9DZ0388yJaipWl41dn8qJKId3QYgWYo
Message-ID: <CAHC9VhR5yfw+sMfrYpy8Qm2uNoxqsTweh=KhDRZsU1CioHRDDQ@mail.gmail.com>
Subject: Re: [PATCH v6 bpf-next 3/4] bpf: add bpf_init_inode_xattr kfunc for
 atomic inode labeling
To: Kumar Kartikeya Dwivedi <memxor@gmail.com>
Cc: David Windsor <dwindsor@gmail.com>, Alexei Starovoitov <ast@kernel.org>, 
	Daniel Borkmann <daniel@iogearbox.net>, Andrii Nakryiko <andrii@kernel.org>, 
	Martin KaFai Lau <martin.lau@linux.dev>, Eduard Zingerman <eddyz87@gmail.com>, Song Liu <song@kernel.org>, 
	Yonghong Song <yonghong.song@linux.dev>, John Fastabend <john.fastabend@gmail.com>, 
	KP Singh <kpsingh@kernel.org>, Jiri Olsa <jolsa@kernel.org>, 
	Emil Tsalapatis <emil@etsalapatis.com>, Matt Bobrowski <mattbobrowski@google.com>, 
	James Morris <jmorris@namei.org>, "Serge E . Hallyn" <serge@hallyn.com>, 
	Casey Schaufler <casey@schaufler-ca.com>, Stephen Smalley <stephen.smalley.work@gmail.com>, 
	Ondrej Mosnacek <omosnace@redhat.com>, Mimi Zohar <zohar@linux.ibm.com>, 
	Roberto Sassu <roberto.sassu@huawei.com>, Dmitry Kasatkin <dmitry.kasatkin@gmail.com>, 
	Eric Snowberg <eric.snowberg@oracle.com>, Alexander Viro <viro@zeniv.linux.org.uk>, 
	Christian Brauner <brauner@kernel.org>, Jan Kara <jack@suse.cz>, Shuah Khan <shuah@kernel.org>, 
	bpf@vger.kernel.org, linux-security-module@vger.kernel.org, 
	linux-fsdevel@vger.kernel.org, linux-integrity@vger.kernel.org, 
	selinux@vger.kernel.org, linux-kselftest@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, Jul 31, 2026 at 11:44=E2=80=AFAM Kumar Kartikeya Dwivedi
<memxor@gmail.com> wrote:
> On Fri Jul 31, 2026 at 5:30 PM CEST, David Windsor wrote:
> > On Fri, Jul 31, 2026 at 11:17=E2=80=AFAM Paul Moore <paul@paul-moore.co=
m> wrote:
> >>
> >>
> >> Okay, it looks like there was some confusion/misunderstanding.
> >>
> >> My understanding of Kumar's comments was that he was referring to the
> >> exisiting LSM related kfuncs that are located in fs/bpf_fs_kfuncs.c,
> >> not necessarily the new kfunc you are proposing in this patchset.
> >> Kumar is welcome to correct either one or both of us, if we read that
> >> wrong :)
> >>
> >
> > Yes, after another reading, that does appear to be the case =3D).
> >
> > We'll need v7 anyway to fix the ocfs-related UAF the bot found.
> >
>
> Since there is confusion, let me clear it up.
>
> I meant it for all of them. I don't think it makes sense to keep this one=
 in
> security/ when others are in fs/bpf_fs_kfuncs.c. That confusing limbo sta=
te is
> worse than just placing it where others already are.
>
> As I already said, the discussion around whether all of them they should =
go in
> security/ is orthogonal and should be done separately; it isn't productiv=
e to
> repeatedly bring it up in the context of this patch set.
>
> I honestly don't get the urgency; it will be a mechanical change if we ne=
ed to
> make such changes. The worst outcome would be stalling David's work over =
it.
>
> As for landing this stuff, we can let Paul take the patches touching secu=
rity/
> and route the rest (3-4) through bpf-next after the merge window. We need=
 them
> to go through BPF CI anyway to ensure nothing breaks.

Some existing LSM kfuncs are located in the wrong files.  I'm not
suggesting that David needs to fix the existing problems, but there is
no reason to keep making the same mistakes.  The new LSM kfunc must go
in security/bpf_lsm_kfuncs.c; if that isn't acceptable to the BPF
developers then David will need to find a new way that doesn't involve
kfuncs.

--=20
paul-moore.com
