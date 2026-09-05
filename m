Received: from mail-yw1-f170.google.com (mail-yw1-f170.google.com [209.85.128.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E725024886E
	for <linux-kselftest@vger.kernel.org>; Sat,  5 Sep 2026 00:55:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.128.170
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788569730; cv=pass; b=ZPpuPUVGwHsyPVwpHD9HKGso1Wdj++B+++wrIi+naTXte45uTXH55PUDgs281B2t6YMsN7xQn0hLyWJ4Bchy7xpHp6YJEpymG1b1QzC6jtC6UQfsPn9ZqynsZ3EMzWMBp2XJq/HU0U6u8tQN7RccRm71nZP30snlRCMtnbIVia4=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788569730; c=relaxed/simple;
	bh=uPysR5GFkyCY/qE0YCzGd8ZwpPP3JXLnMqhzAo7gH90=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=Su4kAqKJ0W7OtBBTG+FnSup4RU2ypDP6WTibupjAH7eTcwEVzFCDKJmqc9Q6FaueOzc/HEG8ixY4Rbh2J/kqEiKmIKHU+VTMhp66BIxPDcUmyh/CHxpgW/KcvFS9oDh1GvYJ6zNq8hCkkcCKqZekSdnfs/gt7U/ZIgvLvpGaF3A=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=etsalapatis.com; spf=pass smtp.mailfrom=etsalapatis.com; dkim=pass (2048-bit key) header.d=etsalapatis-com.20251104.gappssmtp.com header.i=@etsalapatis-com.20251104.gappssmtp.com header.b=hKs/C6u0; arc=pass smtp.client-ip=209.85.128.170
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=etsalapatis.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=etsalapatis.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=etsalapatis-com.20251104.gappssmtp.com header.i=@etsalapatis-com.20251104.gappssmtp.com header.b="hKs/C6u0"
Received: by mail-yw1-f170.google.com with SMTP id 00721157ae682-81ecf499af9so24170847b3.1
        for <linux-kselftest@vger.kernel.org>; Fri, 04 Sep 2026 17:55:28 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1788569728; cv=none;
        d=google.com; s=arc-20260327;
        b=azARFlXDkJUZxnMPi3+H5VfTFr44iVsRNk61gry+vd3a0IlezOOByaBy7JUX9l+CdU
         //SpSnylep8U9+GgTnIgsjad/uCzEzYBA3r5HszCt6nYRi/fbCedTrEKgU64eBgVZDEh
         Tm0gaC+Z3PbhYhp0ws8SBteV4+XkbjLLOdN1PMiUXS7rTI/c/b3YTCnsAoCo3+YProP9
         ZL7wyetgDIB1NXfkBhe8fsHJz4HyNDogFDk8oFh/apRTIak47TU4QF7F/H1EqWshjtCh
         UCj4D463vg3UyN2miHADsyYaj8QoOgfEwK6KM03CKGaz9F5hRgRg4DXNUt/LfROkFbaD
         RuqQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=o2ZcMOhNLSW/gCHzJ1Lb1NgDbEasJyqkX407lKXNvbY=;
        fh=Fc785ZkbX8/BSnhWezS7ucw7vffv2OhyRfV3neez2yo=;
        b=LI8viDYbOOqPfNGfeaJEyOxgWVB4+bP2TdkVfjpe9E/Rs6alIdi/+vLEoJmp0ppTqM
         B9b8mLNcrpAoxrGQ2/7qMVWRlpf5cz0HRbuWOZyOYFAnXFYqua75wpbIC9Riee0gcSCL
         ntIxpxxjAUZce4HvU/FHGKkgl+xW55j72XXonXnyZ5tjgxsmOzNFbPI6d47TaBcBxlkW
         MCy8HMzhIY/RuiJqdyeP6IX7aCY0Md0BJ1tPifE6MRmmtY2mbitK0MzYFeh52d3jq1Dk
         1ixSt2VdLXGh8c4rrdhMXxmcV1v8nCFmgMkZ1LJKmj+6NxMp8tvOLDvJxXfv/XBRwum4
         Es7Q==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=etsalapatis-com.20251104.gappssmtp.com; s=20251104; t=1788569728; x=1789174528; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=o2ZcMOhNLSW/gCHzJ1Lb1NgDbEasJyqkX407lKXNvbY=;
        b=hKs/C6u0ncsJZXhvsGxhlFZ/zYUqxJ/pC6z65oAb/4n8Wjx1zk9Bnjp43PN+hXSL/H
         w0oMMDhv6vg2Cpy+hUloiIlnpAVj02Y+QZ6Qw6CXMG241bQqTmbnKETOMaPD9GTQ3CmW
         KoJ43Iltbq2/PcsKgzQwdZRR2mx+dR41vNLA235BiJ1UK9BkdvE0TGY9FCL/tYxh+bH/
         +Rt1yFzNSHhJoMNWs23LRkCyMIjM6Rl7CgJP0BHjRLFCEvoYW14IFrWk8BQfGTkSEw9B
         Dbhn/nKQ90USRDahbCKx2O87nPo7QlFZtZIZLq8yOoXMA6D2CM1E3m56p0R2wZUGPKC0
         w/4Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788569728; x=1789174528;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=o2ZcMOhNLSW/gCHzJ1Lb1NgDbEasJyqkX407lKXNvbY=;
        b=ZjzoHFXIQ6rGN0yu9Fx3T4sG7xHCmmp0p3BNbu0dWFG5pA3IGoZUqr8SXrHh5Ee9x2
         wxq7jewuKd+Te7rwvHJwKAg6ZX93Yp1BLfVvOt44yHqrmmR4ObTdGYX0FaZtSsE+xB5D
         I/Olpjx+z7l0kil6rZEw4A4JCiL7IJt7/FddRvpvNqKXUImxrNzb4R/kEzW4tspLeU+3
         XK2jrZFG5WkTq0vDuI6sLyb4CHR1XgUHVzA5FZ/5GrcqkXkJmd/X4M+00jD/9e8hKPcr
         3OQbpkletnkfOqTFI2Wm4HU3nbwq1ago8XVFGb+xaop2Bf4GLMe+3PbiHj9AmkRgplQP
         xuYg==
X-Forwarded-Encrypted: i=1; AKwUvBxIpbHdt/Ppn1dmvIHPko3CWGzhMz6ukwbIJ15acFC4f4K7ioDZJ+UtXrxbSUu5aT7ZQWv+F4IGV6RCZ1OPq+M=@vger.kernel.org
X-Gm-Message-State: AFuF++kD0vG49WphwUGBK+PWRMsezQOhk/Kcc4nHIEXKw4QO6dpPwVmu
	55T9HY1baVFcesO7nbEMOAEV6HyR2Pmygpb5iBs4+d/Kzhyy7wh88FxqsqR1mrsR2o+x8wiMwp8
	qtKZPTVqt/PjrXilZsbeZychMESShFDgloJQLTA6FIw==
X-Gm-Gg: AYBFou0GosylGbujFvjsBFgf10LeS6QxVplehDVzq5we4nT7lgpFDrlCdkqAR3ST2qp
	+UMyzcHMZ8S5COcjKHkFeYB82o7zC+gAUEMNJNgpx6r54CIcGDjumEbfhsGHFhFwRuvff6dr/ag
	32HYy7NHyhaYuSC+KjNgrBkTTmKzHrVlYoBvZLWGsQFR+PMdqFlpIetvLbHZS4uhYqijYWUE8Fx
	wcYL1fB3kA3W6xUvKpCnlAaZCq84ZnfL4ovokJ+E4znq3llKPIB+B/7UToSQ16F7tqm7XEIOAB3
	lxfCoWN3UMbqeMH1utrZ2YsZUURtJbp3RhKFm43FMif8gmKyxu+2kAGgKZhM
X-Received: by 2002:a05:690c:dd6:b0:873:5c7b:c0ed with SMTP id
 00721157ae682-8735c7bc2c1mr17195157b3.37.1788569727646; Fri, 04 Sep 2026
 17:55:27 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260901014713.3502900-2-sanghyun.park.cnu@gmail.com>
In-Reply-To: <20260901014713.3502900-2-sanghyun.park.cnu@gmail.com>
From: Emil Tsalapatis <emil@etsalapatis.com>
Date: Fri, 4 Sep 2026 20:55:16 -0400
X-Gm-Features: AcwNN1UW-1j4dMWYep58MqXBEV0s9deTc9aokvKEnPaB7kyqQmbppPFFaFUGT3s
Message-ID: <CABFh=a4Gj1c64ak2NautOWxyo1g+7F1ruPjf_HRQ9ek6Zt4j4A@mail.gmail.com>
Subject: Re: [PATCH bpf-next v5 1/2] bpf: Validate program attach type during
 link update
To: Sanghyun Park <sanghyun.park.cnu@gmail.com>
Cc: Alexei Starovoitov <ast@kernel.org>, Daniel Borkmann <daniel@iogearbox.net>, 
	Andrii Nakryiko <andrii@kernel.org>, Eduard Zingerman <eddyz87@gmail.com>, 
	Kumar Kartikeya Dwivedi <memxor@gmail.com>, bpf@vger.kernel.org, Leon Hwang <leon.hwang@linux.dev>, 
	John Fastabend <john.fastabend@gmail.com>, Martin KaFai Lau <martin.lau@linux.dev>, 
	Song Liu <song@kernel.org>, Yonghong Song <yonghong.song@linux.dev>, Jiri Olsa <jolsa@kernel.org>, 
	Ihor Solodrai <ihor.solodrai@linux.dev>, Shuah Khan <shuah@kernel.org>, 
	Stanislav Fomichev <sdf@fomichev.me>, Pu Lehui <pulehui@huawei.com>, 
	Suchit Karunakaran <suchitkarunakaran@gmail.com>, Xu Kuohai <xukuohai@huawei.com>, 
	linux-kernel@vger.kernel.org, linux-kselftest@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Aug 31, 2026 at 9:47=E2=80=AFPM Sanghyun Park
<sanghyun.park.cnu@gmail.com> wrote:
>
> Cgroup link updates compare only the program type. Programs verified
> for different hooks can share a type, so a UDP6 sock_addr program can
> replace a UDP4 program and write beyond the four-byte ipc.addr field in
> the stack-local struct ipcm_cookie. The same gap permits incompatible
> LSM_MAC and LSM_CGROUP replacements.
>
> Validate every replacement program against the link attach type before
> dispatching to the link-specific update operation. Keep the CGROUP_SKB
> CAP_NET_ADMIN check at initial attach so pinned or delegated link FDs can
> still be updated after a capability drop.
>
> Fixes: 0c991ebc8c69 ("bpf: Implement bpf_prog replacement for an active b=
pf_cgroup_link")
> Acked-by: Leon Hwang <leon.hwang@linux.dev>
> Signed-off-by: Sanghyun Park <sanghyun.park.cnu@gmail.com>

Reviewed-by: Emil Tsalapatis <emil@etsalapatis.com>

> ---
> v5:
>   - Fold the link-create permission check call onto one line.
> v4: https://lore.kernel.org/r/20260831023918.1857658-1-sanghyun.park.cnu@=
gmail.com
>   - Validate every program link update through the shared attach-type hel=
per.
>   - Fold the LSM attach-flavor check into that helper.
>   - Keep the CGROUP_SKB permission check in the attach-only wrapper and r=
ename
>     the wrapper to describe that role.
>   - Follow the preferred BPF multi-line comment style.
>   - Add focused regression selftests as patch 2/2.
> v3: https://lore.kernel.org/r/20260821084726.3769957-2-sanghyun.park.cnu@=
gmail.com
>   - Factor the CGROUP_SKB CAP_NET_ADMIN check into an attach-only helper.
> v2: https://lore.kernel.org/r/20260818061021.2551771-2-sanghyun.park.cnu@=
gmail.com
>   - Extend validation from cgroup sock_addr programs to all cgroup progra=
m
>     types, including exact LSM attach flavors.
>   - Preserve legacy CGROUP_SKB ingress/egress replacement compatibility.
>   - Keep the CGROUP_SKB CAP_NET_ADMIN check on attach, not link update.
> v1: https://lore.kernel.org/r/20260805052858.2390918-3-sanghyun.park.cnu@=
gmail.com
> ---
>  kernel/bpf/syscall.c | 30 +++++++++++++++++++++---------
>  1 file changed, 21 insertions(+), 9 deletions(-)
>
> diff --git a/kernel/bpf/syscall.c b/kernel/bpf/syscall.c
> index 6874ba1424af..2bcd3f3a2a55 100644
> --- a/kernel/bpf/syscall.c
> +++ b/kernel/bpf/syscall.c
> @@ -4481,14 +4481,9 @@ static int bpf_prog_attach_check_attach_type(const=
 struct bpf_prog *prog,
>         case BPF_PROG_TYPE_CGROUP_SOCK_ADDR:
>         case BPF_PROG_TYPE_CGROUP_SOCKOPT:
>         case BPF_PROG_TYPE_SK_LOOKUP:
> +       case BPF_PROG_TYPE_LSM:
>                 return attach_type =3D=3D prog->expected_attach_type ? 0 =
: -EINVAL;
>         case BPF_PROG_TYPE_CGROUP_SKB:
> -               if (!bpf_token_capable(prog->aux->token, CAP_NET_ADMIN))
> -                       /* cg-skb progs can be loaded by unpriv user.
> -                        * check permissions at attach time.
> -                        */
> -                       return -EPERM;
> -
>                 ptype =3D attach_type_to_prog_type(attach_type);
>                 if (prog->type !=3D ptype)
>                         return -EINVAL;
> @@ -4542,6 +4537,20 @@ static int bpf_prog_attach_check_attach_type(const=
 struct bpf_prog *prog,
>         }
>  }
>
> +static int bpf_prog_attach_check_perm(const struct bpf_prog *prog,
> +                                     enum bpf_attach_type attach_type)
> +{
> +       /*
> +        * CGROUP_SKB programs can be loaded by unprivileged users, so ch=
eck
> +        * permissions at attach time.
> +        */
> +       if (prog->type =3D=3D BPF_PROG_TYPE_CGROUP_SKB &&
> +           !bpf_token_capable(prog->aux->token, CAP_NET_ADMIN))
> +               return -EPERM;
> +
> +       return bpf_prog_attach_check_attach_type(prog, attach_type);
> +}
> +
>  static bool is_cgroup_prog_type(enum bpf_prog_type ptype, enum bpf_attac=
h_type atype,
>                                 bool check_atype)
>  {
> @@ -4606,7 +4615,7 @@ static int bpf_prog_attach(const union bpf_attr *at=
tr)
>         if (IS_ERR(prog))
>                 return PTR_ERR(prog);
>
> -       if (bpf_prog_attach_check_attach_type(prog, attr->attach_type)) {
> +       if (bpf_prog_attach_check_perm(prog, attr->attach_type)) {
>                 bpf_prog_put(prog);
>                 return -EINVAL;
>         }
> @@ -5805,8 +5814,7 @@ static int link_create(union bpf_attr *attr, bpfptr=
_t uattr)
>         if (IS_ERR(prog))
>                 return PTR_ERR(prog);
>
> -       ret =3D bpf_prog_attach_check_attach_type(prog,
> -                                               attr->link_create.attach_=
type);
> +       ret =3D bpf_prog_attach_check_perm(prog, attr->link_create.attach=
_type);
>         if (ret)
>                 goto out;
>
> @@ -5968,6 +5976,10 @@ static int link_update(union bpf_attr *attr)
>                 goto out_put_progs;
>         }
>
> +       ret =3D bpf_prog_attach_check_attach_type(new_prog, link->attach_=
type);
> +       if (ret)
> +               goto out_put_progs;
> +
>         if (link->ops->update_prog)
>                 ret =3D link->ops->update_prog(link, new_prog, old_prog);
>         else
> --
> 2.48.1
