Received: from mail-pl1-f169.google.com (mail-pl1-f169.google.com [209.85.214.169])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EE0E03CB2D4
	for <linux-kselftest@vger.kernel.org>; Thu, 30 Jul 2026 23:53:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.214.169
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785455637; cv=pass; b=TSquR8ZM/iu68mAe0jgnLGGxRP5hCUvCJN0HiLX950K799TY7RP17LUYVAfhIGsakmBZ56eICnVup0EeNQH8mj/tAdg1tVgtGJDZyNmYduI1Zij90Ux9xK7JtfZL+HgYlgyhudbAcIcL++OPNxdHMA7P+XTaVdRwa5MO/C2XHiw=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785455637; c=relaxed/simple;
	bh=JfxZFvpHBWcmAnd/aQ2atvfsHg1U5BfAHOmlK3lJJhE=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=nAPKc+EgV8Sd0Bvkvrzw1OhJD3o20nI5HU9D3NuNF6fPdY0uPtT+YI43/IctByYLU8EzwoaMVk6FBQ6o7BNfSc9K3pA5uAd6KxhhbVcBubLNXSAA+quMkIxcNabQ+ZLwxof0CIEnOsIzM+GOimb3BBO8jZ6HnbhiT9WRJ1ffaho=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=paul-moore.com; spf=pass smtp.mailfrom=paul-moore.com; dkim=pass (2048-bit key) header.d=paul-moore.com header.i=@paul-moore.com header.b=L0RYGTTM; arc=pass smtp.client-ip=209.85.214.169
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=paul-moore.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=paul-moore.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=paul-moore.com header.i=@paul-moore.com header.b="L0RYGTTM"
Received: by mail-pl1-f169.google.com with SMTP id d9443c01a7336-2cedda2ce6fso2889565ad.1
        for <linux-kselftest@vger.kernel.org>; Thu, 30 Jul 2026 16:53:55 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1785455635; cv=none;
        d=google.com; s=arc-20260327;
        b=H36vwiS3CG6BaBViAZGYa9s3kfF0COEgZWmZEVpK/dY6+kq/8k4aNy9qGsImOErmVV
         P3Pjs2O+WaHM6Z7IdjRljE+mH3mF1xnYQx6zy81cL4wEnlSrhvEOzhwxTZWdrKAf7sAx
         1x5mHYZPQbEbjPYG2Rv1En47RsOxf43uXABctLpB0QyYj5Mb8aaigo41nVkA5oXiIojA
         R+5xhD1MP5K5CGKBG1TngsrM5metAoS6VqLY4EGwI/WJSgRl0b+lEkkbhzF1o9jhHQ1F
         lnVAOd/RYkvNEOk/pwsJYElnvgKCMm/ubAp7jMvhFAsERPuVXJRSKcXpqw/EHTYkcW9J
         eiSw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=4mBDHVCLcXdZXMibJjG6y+p4xVVz9yyfGfRo2UBJAHM=;
        fh=U72fZw3pnM9X4FVxKZQKTwD5j4iSWTqu5MxmsYgj/eA=;
        b=WxSZeCjcLPIPAeKqD9iQKWrK56rHYiXrLJRE1rRfmRx3lB/hJ6B2rkygO+ujHIQ8GC
         DP/2s9aWXZ3+qpzI1IGOdo4AKm7/d8vFgk5u61KCCl7ebYYRhg+imYvYUmABkXEiAzFB
         CcPq9Uy4jHmeRgn1Ka4WfD9yKyzHco74ZBankOK7zycIABS5yhLwtOOQrDL9PEo/MtHa
         pNYuNc+YCH8dCMclf7OAJsgLqY+UMIltkGdtxEiUN5l8gYkrDDXLy8d58BtqLmigRfWD
         qROFDMdHYJk3pipUAjVTSNRGgpLPJNbd64bU0UataqucjuF4bgKcaMBA8tyfufWVpKKJ
         0afA==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=paul-moore.com; s=google; t=1785455635; x=1786060435; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=4mBDHVCLcXdZXMibJjG6y+p4xVVz9yyfGfRo2UBJAHM=;
        b=L0RYGTTMahPOIGy+R5OFo6oKFlyVg1FAvtglKC22q4Kvysdo8X1dJXYVhXwTCi9RcM
         xZC+qnTT0mCGlq/LX0qaP/ubg3OtP+9RcJIed2OnK8Rg39xuD3NvBOQy98O2cKv4UI7b
         kSA89Cs6NzqixFDjccF34QSMCWlcAdAb7TUVgw6dlGejsrZTaSTgeWoYFn9pOcCjPbHP
         WbzgQC8Y64NS7a27COodNZr/wTTf9pfSl1xsuKqoGKRyMeHNkj/kmOAPazLaaGuOI0HC
         DvbnLF5QBY0xDbyiDjotFuV54Ig0/imPU2bJIqOSZOSvobObLTvsYTGBjFMYBQQNJGB5
         nJiw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785455635; x=1786060435;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=4mBDHVCLcXdZXMibJjG6y+p4xVVz9yyfGfRo2UBJAHM=;
        b=oHNNwWLObBXiTNZtmmcj+r32toXt6vLkJVQLnlp4QqNiq0AIu0NbWdr8d6dROClHw4
         eaH+9wWBckHkDMnWY08Zw+6t/8UeD7/xJED9iOnoDc0b8snsFOzIi/8MyR/2ZGd3nDy2
         h9qouOJKRPg8R/JNNiMJGWKdyKYaj3oYxRQF52ooNzbyH4ruTfCa82m1excIe3gRH9qd
         O3Y2JjuIla1gmJkCsrLIriez5rlnHYAUrXB+v+m/lEdRZEzQ2NEsL7TUpWRDsXLf1Y9t
         RXa0QhBpXIiaBpoTA7tB0iYfqoxSlV/iEYgYG0Bc+pFLovQUbAKjVEfZC8Erb7napdya
         +VDQ==
X-Forwarded-Encrypted: i=1; AHgh+RrummfgDP1AaiII9ES1re1eYuvn7kgbnfKcGNNzm89DLGxjphHdXRZ5PbcCeSxHpEXnTDvFJKBfV0nQp0AAcyY=@vger.kernel.org
X-Gm-Message-State: AOJu0YzRy6JhOmmUjzZxRJfTpRpe702d0Fbtjx6s19nFdPFf/WbAPIK5
	3UfPQx8IDRXpgFtSNlLPLamDLmfGCB0hlpTOGPuDeRhalLZDfrm6FIWqJoTR53eLNesQfw8EsQV
	TiMvBmDSNBx9Kg91ReeQUl0K5vXVp9/wEOvkzPN2p
X-Gm-Gg: AR+sD132HmBo4gkViKB6VfJ0121EmdkfMLQxmsM7zXIUESVKPaTK/fcq9iP8SAXTaTT
	BPcRNMXslEAGVqyxGLRsE29DZ+CD9oUv9XlvRP1k21eX3K8P6MbHfdPPwM8/5RfU/QmYKbqh1pC
	xyP9FVG7t7kCEK35xvnpBHH371O14mwlJoMZEBsk65xmUdQDRGNMvHto+40a4qABxAeyGNSq1S+
	LPHnbFrfZnX4cX2Q1Gz20cGTFaGmvV/BpEEe2wqvKTBqdIoY1uxOp3OyZP0BC/QGvqCteyhBtFc
	lWe04Q8jjyajT0ctmTHtQxohS0s7Ul5NfTo34PlajqUo
X-Received: by 2002:a17:902:d541:b0:2cc:eec6:558 with SMTP id
 d9443c01a7336-2d035d02a76mr42105125ad.39.1785455635347; Thu, 30 Jul 2026
 16:53:55 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260730234533.1912709-1-dwindsor@gmail.com> <20260730234533.1912709-4-dwindsor@gmail.com>
In-Reply-To: <20260730234533.1912709-4-dwindsor@gmail.com>
From: Paul Moore <paul@paul-moore.com>
Date: Thu, 30 Jul 2026 19:53:43 -0400
X-Gm-Features: AUfX_myIwEPkdTB9y2A5EVFOJTxu57iscp_A0mJDOnaf1-ooecLYPMIU4zjErAM
Message-ID: <CAHC9VhT=m-GtOZx2AHym7uN1CNx94arKBiXeVC7LTEJ-b=1EVQ@mail.gmail.com>
Subject: Re: [PATCH v6 bpf-next 3/4] bpf: add bpf_init_inode_xattr kfunc for
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

On Thu, Jul 30, 2026 at 7:45=E2=80=AFPM David Windsor <dwindsor@gmail.com> =
wrote:
>
> Add bpf_init_inode_xattr() kfunc for BPF LSM programs to atomically set
> xattrs via the inode_init_security hook using security_lsmxattr_add().
> The hook now passes its xattr state as a single struct lsm_xattrs
> object, which the kfunc takes directly.
>
> This kfunc is only callable from inode_init_security; the verifier
> rejects attempts to call it elsewhere.
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
> Suggested-by: Song Liu <song@kernel.org>
> Signed-off-by: David Windsor <dwindsor@gmail.com>
> ---
>  fs/bpf_fs_kfuncs.c | 41 +++++++++++++++++++++++++++++++++++++++++
>  1 file changed, 41 insertions(+)
>
> diff --git a/fs/bpf_fs_kfuncs.c b/fs/bpf_fs_kfuncs.c
> index f1863a891db6..7b55073934e0 100644
> --- a/fs/bpf_fs_kfuncs.c
> +++ b/fs/bpf_fs_kfuncs.c
> @@ -11,7 +11,9 @@
>  #include <linux/file.h>
>  #include <linux/kernfs.h>
>  #include <linux/mm.h>
> +#include <linux/security.h>
>  #include <linux/xattr.h>
> +#include <uapi/linux/lsm.h>
>
>  __bpf_kfunc_start_defs();
>
> @@ -379,6 +381,44 @@ __bpf_kfunc struct inode *bpf_real_data_inode(struct=
 file *file)
>         return d_real_inode(file_dentry(file));
>  }
>
> +/**
> + * bpf_init_inode_xattr - set an xattr on a new inode from inode_init_se=
curity
> + * @xattrs: inode_init_security xattr state from the hook context
> + * @name__str: xattr name (e.g., "bpf.file_label")
> + * @value_p: dynptr containing the xattr value
> + *
> + * Only callable from lsm/inode_init_security programs.
> + *
> + * Return: 0 on success, -EOPNOTSUPP if the filesystem does not accept
> + *         xattrs at inode creation, negative error on other failures.
> + */
> +__bpf_kfunc int bpf_init_inode_xattr(struct lsm_xattrs *xattrs,
> +                                    const char *name__str,
> +                                    const struct bpf_dynptr *value_p)
> +{
> +       struct bpf_dynptr_kern *value_ptr =3D (struct bpf_dynptr_kern *)v=
alue_p;
> +       const void *value;
> +       u32 value_len;
> +
> +       if (!name__str)
> +               return -EINVAL;
> +       if (strncmp(name__str, XATTR_BPF_LSM_SUFFIX,
> +                   sizeof(XATTR_BPF_LSM_SUFFIX) - 1))
> +               return -EPERM;
> +
> +       if (!xattrs->xattrs)
> +               return -EOPNOTSUPP;
> +
> +       value_len =3D __bpf_dynptr_size(value_ptr);
> +       value =3D __bpf_dynptr_data(value_ptr, value_len);
> +       if (!value)
> +               return -EINVAL;
> +
> +       return security_lsmxattr_add(xattrs, LSM_ID_BPF,
> +                                    name__str + sizeof(XATTR_BPF_LSM_SUF=
FIX) - 1,
> +                                    value, value_len);
> +}
> +

Based on our discussion in the v5 patchset, I was expecting to see
this under security/; did something happen, or was there some
confusion?

--=20
paul-moore.com
