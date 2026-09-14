Received: from mail-yx1-f42.google.com (mail-yx1-f42.google.com [74.125.224.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 10270480DE0
	for <linux-kselftest@vger.kernel.org>; Mon, 14 Sep 2026 20:14:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.224.42
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789416861; cv=pass; b=YQ8BQK3J2tAmLXw1ci1oarZZ9lGQPv5hJCDxoniDIyaKTtlKvYrwNKs3Ca6B5Xt9K6K3rJMRbxCbUnjNdtfP0GRp7ZGseVObJOdPpmqz5ar4u7IE7/oBvPDoXmDlR9miJZe6WJZUctshthxdQkjIisIMksCa1DAhKm5LqK+x2Mc=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789416861; c=relaxed/simple;
	bh=3E353mGHA+YwmiJRDMPPzi71eHpkdVopb+a6X25hXhA=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=TGG9B3y6m+rsdUKS7hVdb/kEpplG731VcZSmhSbho0GkARCqcIqLEkb8X+JSkIz5VjoeOuQ8TbYlBi0GnHAQudUm0oNgrU3FoS6HT/r45SqH13Aerq7d4rwkPwjU4lARcrvfO1oQeiObSIZeELwH8T/J3QSzeOX1Pq3ZDysFxMU=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=etsalapatis.com; spf=pass smtp.mailfrom=etsalapatis.com; dkim=pass (2048-bit key) header.d=etsalapatis-com.20251104.gappssmtp.com header.i=@etsalapatis-com.20251104.gappssmtp.com header.b=a1UGwMTY; arc=pass smtp.client-ip=74.125.224.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=etsalapatis.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=etsalapatis.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=etsalapatis-com.20251104.gappssmtp.com header.i=@etsalapatis-com.20251104.gappssmtp.com header.b="a1UGwMTY"
Received: by mail-yx1-f42.google.com with SMTP id 956f58d0204a3-6714af30a2cso1626259d50.3
        for <linux-kselftest@vger.kernel.org>; Mon, 14 Sep 2026 13:14:19 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1789416859; cv=none;
        d=google.com; s=arc-20260327;
        b=quH8JtHM+Aawcs5WbQhzpf+zQ8DIYfMyawZ30hmD5NoV7ZY/U+f6eCkoXMHaXW4zqv
         kUI6gJfDdGyqtxa8SwrsOevRhynyQOXGlFT9MS+Y9Bnny/nZ/YyEm9hIPiNcEMCutn7n
         mQVXgm/iDMA4B3DUmRPSwO3se9ByFnmxy+ywqGLrVV2NKlXoKPzRBs2ATPm/SgEm/pK7
         QcpfszjXUtnh2nGynELPaKIzXDcD73fL2P45AJSfMCqaEPSoi7buN+4rxe1G4eW98EHV
         nOMrpWmPzuv6agdXU3P8EC1VxSCrEBowNc4gKrNPPWyKIFRijoHh5H0LYm56hf5MUPxu
         fAow==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=Rga6UFelgth5DpOvahkhCJaR+CNVuGoZ+4Q+hPI7j+g=;
        fh=lsU/KLxo7lAcZfOro3rg+cJr1rCifhi5kVbfajSXcV8=;
        b=hnJBeJnjOd6zaZen/y2TdDNecpZJHDiWDHnwgSNCQptJ/uxc6zvbpuRQNF4SWtYYNf
         HZGqKsz+2vjiWh025VklZNIbY+DXNp5+0+VuJJ6/5IU2eJ74I4JGSKXZCUtHleVTb78w
         sFfpN+1lEKYON7pl/lr6K8pC3uuxgfFNu4Jox2uubz3h9mVvuufgQ3sTuBsf3O8uBSqE
         MbjrW6soUyhb4FCoAtBjifo7i1+sLaUFL9VjPZS1ILVOFAh8rNyOJLodicLcDgsQgOU0
         rrEX5UN7p/gsnpN8csL+r5oW/S+8X2Hc/mT07VrrB9v5Rn50p9NTxyoz28yHwEdYyrIB
         TUvQ==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=etsalapatis-com.20251104.gappssmtp.com; s=20251104; t=1789416859; x=1790021659; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=Rga6UFelgth5DpOvahkhCJaR+CNVuGoZ+4Q+hPI7j+g=;
        b=a1UGwMTY2EcbpMOgq6x9QI2NgGYwRm7FwK1R85iNGnMq20v8d4GqpjJ21XfDMXMUxL
         8MKjQTXjGZROkZtWOP2PvF2NlyNPbpdPCYjQm3Wc9yMKqVHX1uK9GheeBRifFKVNTuq5
         CwQ5Ot4ebIkb90fxImlJeUnAujf6NkomcCoCzgTz7PyiAx6UEuvcHE+nmyg7L6HLs84d
         +Ysd1/ICZeMRySzlwg/aKRd9Dz+Yr0Shs2dcQFC2XSCRlIM+Os8Dh0HBDRfkvXdxhayJ
         LcidJxTzX2s+xOZU93OPhzU8GUIk/MuDiq2ImXRnUaedkV155hw2nIb1XOk4YbOahbJB
         Hg8A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789416859; x=1790021659;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Rga6UFelgth5DpOvahkhCJaR+CNVuGoZ+4Q+hPI7j+g=;
        b=rZBaUacxr424RIaALzeFx8wt313g75ETxvrR/8xJeD0Jc2mtLaALfsRn66bLesD185
         SDo3EPtaKVKQ0Qx+S3FgNxuCcbv/33rVXS3/IYINEp4gATCdL72VJxp2gmLxOOfa+fLb
         NntzLqhriQW2xVlYXF2wNNr9ypTSUnAffpEVegkQL70fc5SENvlAo1hKjxE1GrTZJhv5
         9V3h2VbANyPURkfZkPsu7Q5jLGEgmB9S5VoLlzWxU5QkK1W6A41OnUfV8Xqgpw4JV9mW
         3dcRxjHaqwC0xzpTyYY8T6nQ1LHZytIdPCg3J/xVflBzdfunh9EBJRDt8VywgsrYTxfF
         alZA==
X-Forwarded-Encrypted: i=1; AKwUvBxYj3CEOqP2BoaHrh31Op4W6nrT2qSNn3pURsYmk6vJfVBX1ohFkIN1BcDC+r8EcwHPWpp6YuCS7DQ24FIB8YU=@vger.kernel.org
X-Gm-Message-State: AFuF++lfM+1SBR5kfmXo8b7FBKE06L/V56LKfsFs/9e09m1tGDlP/iAi
	eItenHzr0JH5H6jt6uDja23HO54WetjabVWlzS2IEj6Wa4CPxM01o+aktB198VBAylC+fdn+hIM
	0RjL1kr0FRcK4SR34tb1FMvtIa0U0qoHVFlWMNcNYXg==
X-Gm-Gg: AYBFou0kujBMbm/4bohzhRQECiRyL9O/yluie2qfLwswbl93VkSJCKN3VyxNOibuq2p
	3jucIgDJU3qvT7R5pIGRtgu7vstZz6s5AuhOVB+H7TYuiWby7fSQB8WP6IBHESG7PG2m+rIY+oH
	FaTkoUJ/XdD1GEDh99469C3ThTUV1HCgoi2/xziA6o53RmJr7T6teUbeGnFgYogJUMsSy5koBlp
	8b6tUp5cvhcyGZSpCGt/VJDLK7D4ASYsL+zKLOw0Mgx+LX21d6UvVZToqDFPpw0Yv3eA5gHzkNR
	wrnK7kCv87THLott9/dWcw5hVkZt3GXOkaMKsEzc2+fKrViKx9JeyA8=
X-Received: by 2002:a05:690e:480d:b0:66f:c24c:98bf with SMTP id
 956f58d0204a3-6714e1897a6mr796397d50.46.1789416858935; Mon, 14 Sep 2026
 13:14:18 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260907015003.65087-2-sanghyun.park.cnu@gmail.com>
 <514a0c26ff5e0322fe0442d07142cafc7dda338a3ce2c5b7e9437dd994cb0ba1@mail.kernel.org>
 <a44630a1-4965-4020-afb9-ba5b1a7848e6@linux.dev>
In-Reply-To: <a44630a1-4965-4020-afb9-ba5b1a7848e6@linux.dev>
From: Emil Tsalapatis <emil@etsalapatis.com>
Date: Mon, 14 Sep 2026 20:14:08 +0000
X-Gm-Features: AcwNN1Us3YmXWxVK-pYM5PFNdwZh0QfaSO2LkPIk5GAO4E22Ex_DUjXIGjOz0BY
Message-ID: <CABFh=a4449ssX-jj+5So9_3UMgLGnaioYgQooKibZCbzxAxKyw@mail.gmail.com>
Subject: Re: [PATCH bpf-next v6 1/2] bpf: Validate program attach type during
 link update
To: Leon Hwang <leon.hwang@linux.dev>
Cc: bot+bpf-ci@kernel.org, sanghyun.park.cnu@gmail.com, ast@kernel.org, 
	daniel@iogearbox.net, andrii@kernel.org, eddyz87@gmail.com, memxor@gmail.com, 
	bpf@vger.kernel.org, john.fastabend@gmail.com, martin.lau@linux.dev, 
	song@kernel.org, yonghong.song@linux.dev, jolsa@kernel.org, 
	ihor.solodrai@linux.dev, shuah@kernel.org, sdf@fomichev.me, 
	pulehui@huawei.com, suchitkarunakaran@gmail.com, xukuohai@huawei.com, 
	linux-kernel@vger.kernel.org, linux-kselftest@vger.kernel.org, 
	martin.lau@kernel.org, mason@kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Sep 7, 2026 at 3:08=E2=80=AFPM Leon Hwang <leon.hwang@linux.dev> wr=
ote:
>
> On 2026/9/7 10:36, bot+bpf-ci@kernel.org wrote:
> >> diff --git a/kernel/bpf/syscall.c b/kernel/bpf/syscall.c
> >> index c7bc9ba9b331..b394a37eecb4 100644
> >> --- a/kernel/bpf/syscall.c
> >> +++ b/kernel/bpf/syscall.c
> >> @@ -4481,14 +4481,9 @@ static int bpf_prog_attach_check_attach_type(co=
nst struct bpf_prog *prog,
> >>      case BPF_PROG_TYPE_CGROUP_SOCK_ADDR:
> >>      case BPF_PROG_TYPE_CGROUP_SOCKOPT:
> >>      case BPF_PROG_TYPE_SK_LOOKUP:
> >> +    case BPF_PROG_TYPE_LSM:
> >>              return attach_type =3D=3D prog->expected_attach_type ? 0 =
: -EINVAL;
> >
> > Does adding BPF_PROG_TYPE_LSM to this arm also relax the check on the
> > BPF_LINK_CREATE path?
> >
> > Before this patch, BPF_PROG_TYPE_LSM fell into the default arm:
> >
> >       default:
> >               ptype =3D attach_type_to_prog_type(attach_type);
> >               if (ptype =3D=3D BPF_PROG_TYPE_UNSPEC || ptype !=3D prog-=
>type)
> >                       return -EINVAL;
> >               return 0;
> >
> > Since attach_type_to_prog_type() returns BPF_PROG_TYPE_LSM only for
> > BPF_LSM_MAC and BPF_LSM_CGROUP (kernel/bpf/syscall.c:4457, 4463), an LS=
M
> > program could only ever be accepted for those two attach types.
> >
> > The new arm drops that constraint and accepts any attach_type as long a=
s it
> > equals prog->expected_attach_type. The other members of that arm are sa=
fe
> > because bpf_prog_load_check_attach() restricts their expected_attach_ty=
pe
> > to a set that all maps back to the same prog type. BPF_PROG_TYPE_LSM is=
 the
> > one type in that arm with no such restriction: bpf_prog_load_check_atta=
ch()
> > (kernel/bpf/syscall.c:2766 onwards) has no LSM case and falls into
> > `default: return 0`, so prog->expected_attach_type is entirely
> > userspace-controlled for LSM programs.
>
>
> Good catch.
>
> Since there's no expected_attach_type check for lsm prog, a lsm prog can
> have BPF_TRACE_ITER expected_attach_type, and creates a lsm link via
> BPF_LINK_CREATE with this patch. Such lsm prog cannot create a lsm link
> via BPF_LINK_CREATE without this patch.
>
> The new case BPF_PROG_TYPE_LSM in bpf_prog_attach_check_attach_type()
> relaxes the prog->type check when adding expected_attach_type check.
>
> I think we can add expected_attach_type check for lsm prog in
> bpf_prog_load_check_attach(). See below diff. The diff will restrict a
> lsm prog with these two expected_attach_type, BPF_LSM_MAC and
> BPF_LSM_CGROUP.
>

+1, skipping LSM progs in bpf_prog_load_check_attach() is counterintuitive
and the reason why we missed this edge case in the first place. It's
better to add
the missing checks than adjust the refactoring.

pw-bot: cr

> Thanks,
> Leon
>
> ---
>
> diff --git a/kernel/bpf/syscall.c b/kernel/bpf/syscall.c
> index 6874ba1424af..4b56e82ff3b9 100644
> --- a/kernel/bpf/syscall.c
> +++ b/kernel/bpf/syscall.c
> @@ -2830,6 +2830,16 @@ bpf_prog_load_check_attach(enum bpf_prog_type
> prog_type,
>                 if (expected_attach_type =3D=3D BPF_NETFILTER)
>                         return 0;
>                 return -EINVAL;
> +       case BPF_PROG_TYPE_LSM:
> +               switch (expected_attach_type) {
> +               case BPF_LSM_MAC:
> +               case BPF_LSM_CGROUP:
> +                       return 0;
> +               default:
> +                       return -EINVAL;
> +               }
>         case BPF_PROG_TYPE_SYSCALL:
>         case BPF_PROG_TYPE_EXT:
>                 if (expected_attach_type)
>
> > [...]
>
