Received: from mail-pj1-f51.google.com (mail-pj1-f51.google.com [209.85.216.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C6ECB3955D2
	for <linux-kselftest@vger.kernel.org>; Tue, 30 Jun 2026 19:20:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.216.51
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782847252; cv=pass; b=e5F8no2Pkqxywkag9RMPGnEIA4h7Hjp9HgcBmAXzDhzDeZpAetpygRgqnawMRtQEWFAO5P6ydoVZncEtfk1Y11KoKsQqRv6pOnvFdVE4YZT67ccdg3IBCsEd1xux7m1AiwOhoiV/pbOByk5IOQ/dFek47HVR+ruHIGFLMxI2KNw=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782847252; c=relaxed/simple;
	bh=65J+i3G6p5lcoZBTC4phByocAAxY190VmOFW7omB01o=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=Vnrl4P8tROSjmOy96LEMWrSdErUalRcDH60mTomCm04NEQJRuKmO9wf21tQ0/ji2yHE4rHZCLpGjH0YTOSE50xRdWOX1r9lR4s/katfFeEx+hAXRSiRMw8qrF1ZZ5tmZ26qa6WiAmltGtncBs8fyeZeMoQAZ9IYLo3qisd5HMBw=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=paul-moore.com; spf=pass smtp.mailfrom=paul-moore.com; dkim=pass (2048-bit key) header.d=paul-moore.com header.i=@paul-moore.com header.b=X5MxhvYP; arc=pass smtp.client-ip=209.85.216.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=paul-moore.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=paul-moore.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=paul-moore.com header.i=@paul-moore.com header.b="X5MxhvYP"
Received: by mail-pj1-f51.google.com with SMTP id 98e67ed59e1d1-37f72212544so4628222a91.0
        for <linux-kselftest@vger.kernel.org>; Tue, 30 Jun 2026 12:20:50 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1782847250; cv=none;
        d=google.com; s=arc-20260327;
        b=iRibgXClrGnvK7y+vX7Zl5Pg5Gzd7D+XI2K4elbS/tRwzo0s6JYqTB8I1yMWrcQBqN
         coAd+xmGC39y5Ytk+1tTpd7hqIidhaXlJCg70xE8al2e5GQ16TA+t88/hpbdlrhoSQZ6
         k63UldOXoiPyt6OTdqs/osZ5PQd0piuN+4r935qsY9k/IJ5RbSpkMGkS2O7Y5Rwj9lWd
         JCs7Y2mFwQ+YsQ/7mChVFbNv26g4kO3+EUQtLssA7NhQPUkwKZi7e48/BBVklEz10QyI
         rVYzeIdvQdmJsQL8WlLEUY+O+1vJ4oj0BAOYQ4uz91u2V8YPYdd8eOnDiFjtCvH7hIUA
         yReA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=HnheX6+q3F7lhzv+8WY9jgB+q1sOgaN80kpX4FHTGh8=;
        fh=SwnrCEYlMLg2pojtWABOXlffwsxsyAOV7oThJCds1RU=;
        b=FNiiM2fVbOh63H6lxvLfWW1DC7g09K7g1lNgLxiwNSSgUUQb4Rqcvev286CTD7ykOd
         A/LoJn3HHI+AjiFpGf0EWu8xhnWa1j4pNc1xCvV/sN2LO1f80EFSHHHMEyTo34lWnZl8
         zNqCVO10nmeItf1dB30SbajggDBfrz37Dm1TsZQc7TwRtWiiRub/pirMmvEvi3ZxNi+4
         lZPdkSGGkoUdSBdixgdAjZ+DUg8OioSnBhNZpdirYRfVT/h2icmiUS6ikRzVZjxLqdrP
         3+a8u6J3XR+URJXP/NTFN3LJSxIP12uVCTvva9ekejaxl1Brf0l4Kaz/VEdeNVRcdiqA
         84SQ==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=paul-moore.com; s=google; t=1782847250; x=1783452050; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=HnheX6+q3F7lhzv+8WY9jgB+q1sOgaN80kpX4FHTGh8=;
        b=X5MxhvYPRN3WA2wN8tL/ZYk9NZEiQbt3zp7jjJgltzxvrPhMcgDbMg5S+ghGO6JFrV
         O1yiHUL8HLKhu//+JGJnCXi8eneIZaFMBhsfmu5xEyywT94F+72Bu6ykex5UZwL8hC7Y
         x9DHn2EONIrEHKr+zJRocw3ZO6DRVypGamAqAhU47sT6463F2xW51r6rTRektZ8qZs58
         e7c7/MJZFGQ2SLMW7XGcoPsGAHxHtixGOMzTpbI6bkqY+TSgjJ8aoDaBdqw5170xOh/K
         C7n1uxfzAR1/ftJDft78tixUKOMmdPxBEu5FgTwR1H8tgsPowu45eEy5Gat235dRyPTg
         EeIg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782847250; x=1783452050;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=HnheX6+q3F7lhzv+8WY9jgB+q1sOgaN80kpX4FHTGh8=;
        b=qLbqnOsVtnbUkK9W69sIvvxNqatKf4pMhu7v7hTkAaPh3Q1ZbSfnvrZm6mXWbxtfwf
         GJ9l7BvUzYrJK4j7HKYleHtkeuNVignmcAmUSJUBI+YuY4efGvo8ccTsvW9c/rzdU6WS
         +qVIXk2hnMIAi2B3d81XOGa0FlxC8L+2f8wgSpTUrzLIIgMQ/Z6Ozv1lI0XlzrV9jS/n
         vNFhsvcHuerNFO0iS6CU6v2dkPXMNwIt4k7i9JnVT8x+391zE6AmVg3HdGOdEWP+Y0dD
         akR/TqvdibrboRmIwJZIREkFS+Pytl9PY7x53dHE40gKCe37HuSEtbs5gx+bQiftFWnr
         Ro9w==
X-Forwarded-Encrypted: i=1; AFNElJ8dHichTGBoPlZSdyguUpcVFu6DHDMzHt7Kxa4VCDox430it8gIGBBxEJIwzV/fuDC1YFVBCZ+pCtUlhmlIimE=@vger.kernel.org
X-Gm-Message-State: AOJu0YwMXfx15yZlNRo+gaDG+KtJDR7VdVl5tmlyeaKUMI6Zwmp+2QkQ
	EWHONS4WDELseH/aJveXHVr57rIEzwypo12CLyaJljxx5i8hps+uhpsukZaUbh+kQbch6KD+B5W
	cyzO3kEh7jeUe5TYb8w0mt6+HhUyvwD4VGn8Ilo9n
X-Gm-Gg: AfdE7cnJMRcgSa+f0UL+hywALm/coICF25tHOn1Axik3wuY/wyvYoPrFZ2rEV7NhW/n
	rwbAo7pWLHMJ8LjCon0XZJLM9/Lei4SlgMjykQs5NzJVTeexuMmC2r5huZVDci0dfXtoGtCi0ef
	yOvPwu1S1bs2bkk6waUJE3gSZ224Mw2a2lVDgUreFDFrkDL0VRwolusUhd8vT4dLo0jED5e2c/i
	D9b8YrOzibTRYhIPI6TTlHh1vR781HVOSNgrryZus62w995kXB+doYpB6TdnG5qXpF+oeqI
X-Received: by 2002:a05:6a21:62c2:b0:3ba:cd5b:3dcd with SMTP id
 adf61e73a8af0-3bfdc69589emr1376925637.36.1782847249974; Tue, 30 Jun 2026
 12:20:49 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260630183956.281293-1-dwindsor@gmail.com> <20260630183956.281293-3-dwindsor@gmail.com>
In-Reply-To: <20260630183956.281293-3-dwindsor@gmail.com>
From: Paul Moore <paul@paul-moore.com>
Date: Tue, 30 Jun 2026 15:20:36 -0400
X-Gm-Features: AVVi8CeUWBZtqtU3wWufhJ35rf7KN-O35V57TZRDwEyvAO9h530GFJE7-OayBpg
Message-ID: <CAHC9VhSYNF=_Tfe-D99rHy70EXQVr1ES0arxT09Bidey4zOFdg@mail.gmail.com>
Subject: Re: [PATCH v4 bpf-next 2/3] bpf: add bpf_init_inode_xattr kfunc for
 atomic inode labeling
To: David Windsor <dwindsor@gmail.com>
Cc: Alexei Starovoitov <ast@kernel.org>, Daniel Borkmann <daniel@iogearbox.net>, 
	Andrii Nakryiko <andrii@kernel.org>, Martin KaFai Lau <martin.lau@linux.dev>, 
	Eduard Zingerman <eddyz87@gmail.com>, Song Liu <song@kernel.org>, 
	Yonghong Song <yonghong.song@linux.dev>, John Fastabend <john.fastabend@gmail.com>, 
	KP Singh <kpsingh@kernel.org>, Jiri Olsa <jolsa@kernel.org>, 
	Kumar Kartikeya Dwivedi <memxor@gmail.com>, Emil Tsalapatis <emil@etsalapatis.com>, 
	Matt Bobrowski <mattbobrowski@google.com>, James Morris <jmorris@namei.org>, 
	"Serge E . Hallyn" <serge@hallyn.com>, Casey Schaufler <casey@schaufler-ca.com>, 
	Stephen Smalley <stephen.smalley.work@gmail.com>, Ondrej Mosnacek <omosnace@redhat.com>, 
	Mimi Zohar <zohar@linux.ibm.com>, Roberto Sassu <roberto.sassu@huawei.com>, 
	Dmitry Kasatkin <dmitry.kasatkin@gmail.com>, Eric Snowberg <eric.snowberg@oracle.com>, 
	Alexander Viro <viro@zeniv.linux.org.uk>, Christian Brauner <brauner@kernel.org>, Jan Kara <jack@suse.cz>, 
	Shuah Khan <shuah@kernel.org>, bpf@vger.kernel.org, 
	linux-security-module@vger.kernel.org, linux-fsdevel@vger.kernel.org, 
	linux-integrity@vger.kernel.org, selinux@vger.kernel.org, 
	linux-kselftest@vger.kernel.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Jun 30, 2026 at 2:40=E2=80=AFPM David Windsor <dwindsor@gmail.com> =
wrote:
>
> Add bpf_init_inode_xattr() kfunc for BPF LSM programs to atomically set
> xattrs via the inode_init_security hook using lsm_get_xattr_slot(). The
> hook now passes its xattr state as a single struct lsm_xattrs object,
> which the kfunc takes directly.
>
> The kfunc is only usable from lsm/inode_init_security programs: no other
> hook exposes a struct lsm_xattrs argument, so the verifier rejects calls
> from elsewhere. Restrict the xattr names that may be set via this kfunc
> to the bpf.* namespace.
>
> BPF reserves BPF_LSM_INODE_INIT_XATTRS slots via lbs_xattr_count, and the
> kfunc enforces that BPF never consumes more slots than it reserved,
> returning -ENOSPC once the budget is exhausted.
>
> A previous attempt [1] required a kmalloc string output protocol for
> the xattr name. Since commit 6bcdfd2cac55 ("security: Allow all LSMs to
> provide xattrs for inode_init_security hook") [2], the xattr name is no
> longer allocated; it is a static constant.
>
> Link: https://kernsec.org/pipermail/linux-security-module-archive/2022-Oc=
tober/034878.html [1]
> Link: https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/=
commit/?id=3D6bcdfd2cac55 [2]
> Signed-off-by: David Windsor <dwindsor@gmail.com>
> ---
>  fs/bpf_fs_kfuncs.c      | 79 +++++++++++++++++++++++++++++++++++++++++
>  include/linux/bpf_lsm.h |  3 ++
>  kernel/bpf/bpf_lsm.c    |  1 +
>  security/bpf/hooks.c    |  1 +
>  4 files changed, 84 insertions(+)
>
> diff --git a/fs/bpf_fs_kfuncs.c b/fs/bpf_fs_kfuncs.c
> index 768aca2dc0f0..c4023c82f21e 100644
> --- a/fs/bpf_fs_kfuncs.c
> +++ b/fs/bpf_fs_kfuncs.c
> @@ -10,6 +10,7 @@
>  #include <linux/fsnotify.h>
>  #include <linux/file.h>
>  #include <linux/kernfs.h>
> +#include <linux/lsm_hooks.h>
>  #include <linux/mm.h>
>  #include <linux/xattr.h>
>
> @@ -374,6 +375,83 @@ __bpf_kfunc struct inode *bpf_real_inode(struct dent=
ry *dentry)
>         return d_real_inode(dentry);
>  }
>
> +static int bpf_xattrs_used(const struct lsm_xattrs *ctx)
> +{
> +       const size_t prefix_len =3D sizeof(XATTR_BPF_LSM_SUFFIX) - 1;
> +       unsigned int i, n =3D 0;
> +
> +       for (i =3D 0; i < ctx->xattr_count; i++) {
> +               const char *name =3D ctx->xattrs[i].name;
> +
> +               if (name && !strncmp(name, XATTR_BPF_LSM_SUFFIX, prefix_l=
en))
> +                       n++;
> +       }
> +       return n;
> +}
> +
> +/**
> + * bpf_init_inode_xattr - set an xattr on a new inode from inode_init_se=
curity
> + * @xattrs: inode_init_security xattr state from the hook context
> + * @name__str: xattr name (e.g., "bpf.file_label")
> + * @value_p: dynptr containing the xattr value
> + *
> + * Only callable from lsm/inode_init_security programs.
> + *
> + * Return: 0 on success, negative error on failure.
> + */
> +__bpf_kfunc int bpf_init_inode_xattr(struct lsm_xattrs *xattrs,
> +                                    const char *name__str,
> +                                    const struct bpf_dynptr *value_p)
> +{
> +       struct bpf_dynptr_kern *value_ptr =3D (struct bpf_dynptr_kern *)v=
alue_p;
> +       size_t name_len;
> +       void *xattr_value;
> +       struct xattr *xattr;
> +       const void *value;
> +       u32 value_len;
> +
> +       if (!xattrs || !xattrs->xattrs || !name__str)
> +               return -EINVAL;
> +       if (bpf_xattrs_used(xattrs) >=3D BPF_LSM_INODE_INIT_XATTRS)
> +               return -ENOSPC;
> +
> +       name_len =3D strlen(name__str);
> +       if (name_len =3D=3D 0 || name_len > XATTR_NAME_MAX)
> +               return -EINVAL;
> +       if (strncmp(name__str, XATTR_BPF_LSM_SUFFIX,
> +                   sizeof(XATTR_BPF_LSM_SUFFIX) - 1))
> +               return -EPERM;
> +
> +       value_len =3D __bpf_dynptr_size(value_ptr);
> +       if (value_len =3D=3D 0 || value_len > XATTR_SIZE_MAX)
> +               return -EINVAL;
> +
> +       value =3D __bpf_dynptr_data(value_ptr, value_len);
> +       if (!value)
> +               return -EINVAL;
> +
> +       /* Combine xattr value + name into one allocation. */
> +       xattr_value =3D kmalloc(value_len + name_len + 1, GFP_NOFS);
> +       if (!xattr_value)
> +               return -ENOMEM;
> +
> +       memcpy(xattr_value, value, value_len);
> +       memcpy(xattr_value + value_len, name__str, name_len);
> +       ((char *)xattr_value)[value_len + name_len] =3D '\0';
> +
> +       xattr =3D lsm_get_xattr_slot(xattrs);
> +       if (!xattr) {
> +               kfree(xattr_value);
> +               return -ENOSPC;
> +       }
> +
> +       xattr->value =3D xattr_value;
> +       xattr->name =3D (const char *)xattr_value + value_len;
> +       xattr->value_len =3D value_len;
> +
> +       return 0;
> +}

This is not a generic VFS function, it is a LSM specific function, it
belongs under security/, please move the code as discussed previously.

--
paul-moore.com
