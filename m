Received: from mail-pf1-f176.google.com (mail-pf1-f176.google.com [209.85.210.176])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6C2C7346AC3
	for <linux-kselftest@vger.kernel.org>; Wed, 18 Feb 2026 18:44:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.210.176
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1771440291; cv=pass; b=uz6EhJFBBGNeMN+pQHLoZszNhlM78XHc8lG5z45mfwBL56ECSbpfINsNKzwO18B6CI3gKxd0TZSyJDWYe5IfgOWui+nnUKSLGGW9PItpgtzzLQKwoVMCfqFgKfn5sz0cZrMiP9xdS3JG9wKTopnKX/K6KNxa7Pe1MxhFuH+Snc4=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1771440291; c=relaxed/simple;
	bh=Qt8t9jOSUploTIvQwhbmuBlxz8/YZPDlwix7jWEcfMU=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=lFI1bVLKR/FGHu2VYgleVM5ELV67jHwUZWLfc0rty+sjIpT22W28TtYEB0z8GKlMguTm9n9uiI2TVvtq+Mp5d23/GNtDZrnJHVkcwbGUJ5XQAo/c9K1w/hFTMBCqAX6EK4G+K49/aU+5sawbp6l2k+Umk9WHjCOPkXlMQAVUb90=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=fGO9uRwz; arc=pass smtp.client-ip=209.85.210.176
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="fGO9uRwz"
Received: by mail-pf1-f176.google.com with SMTP id d2e1a72fcca58-824ba8f0acaso64157b3a.1
        for <linux-kselftest@vger.kernel.org>; Wed, 18 Feb 2026 10:44:49 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1771440289; cv=none;
        d=google.com; s=arc-20240605;
        b=dJq6Ovac44ddIU22lTV8Mjezh1F7Dj0CqYHgMIsh2uX3/Z1vxzFQ0Qs2Kps06tW64t
         Eo1sD80GN7Zfdic7h2WQjr4OfQBjab1Y27OpFyJ+XNEV+0klY9bSeJ0BpjrUWivI71qW
         FuLQ/y13E0yf7krA4mzAmXF8vUfedjz29HyG5Mb0GGBXyhBG64q6kBsraqxc9fMMXzUO
         edlP1IOsi026VC4kGW1gez/ImNeBRpXuze2/q214YtnJsB73sGA58QlCFKysbdDteBfq
         vF59HHxwQw00m32eaiOGGflYFjCOBMBQcmEKu67dM8kaMn4BdTVCG9fK9hp6NUGAaitG
         KVEg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=o0EgMfmWOjMnUPFgGwysSbaA6xIzUPr0eG9HFlDCK80=;
        fh=MDKk2vtmfzIFVFwGUHiRVW9JH8JMeZUf9TJ3viYJnFQ=;
        b=Oaejf7A6kqSizEUPZN5qWRzTphkwfJNro7alr8GOvvIryeiN55VUenh/QTKs5QSsch
         zkoZeHxGYrut95hdpPFAV2U6ta2NkS2EGvk3ci4ouOyLigJbuDpTA0cWIrEDGafEbM0f
         q/AJBeBk4xNn70OMTDunMW/Y5zT9yPUBPZyO5C7kzvtNXXCsLphtU3q7ofY5zt53R8N+
         1OEhNuxq4Dr7xsOhHKTcb86Iwz1Ng4rNig+E3vLW0f/eqZb8P/LHMl7GvDBkKoXpr+sC
         CE9IYiKrOht14vxa2bQiDKofHSolXD/uEvIxsDpFDsJX530Fk6XqLBxVKksUiWKX/YvN
         l2qQ==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1771440289; x=1772045089; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=o0EgMfmWOjMnUPFgGwysSbaA6xIzUPr0eG9HFlDCK80=;
        b=fGO9uRwz2mD0FIzfHPPGRomXz+lRfK/R5HpEpQMHJ7L273V1ECX7Bf5PtyeRzzJFRw
         41NFXd3z8/eJBbpZjKdRX2z+PBUaFzUR4/f7XkXjaAmu5YA5kWb6RoysSxhp1Cjauo1S
         5iX7fsUYfrPKX9vFtB1Xe1JY12Eo3YfFtni8hqi1QvKk/Dj9Oye6xkoolyMi5o21YINL
         5vO2IXokA0QXzM782Jy40Oe3ADj1TzKmtqE5HaOFMu6pzUr+9ytPn9qTpwmNFJfalLG+
         Pptdzg/dZ2O6puhZd6gEnXAGiOEs5zNz72MfTRSgnhMZeiEgE7IDgDaMVc09XvW4KKJY
         X5IA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1771440289; x=1772045089;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=o0EgMfmWOjMnUPFgGwysSbaA6xIzUPr0eG9HFlDCK80=;
        b=SNungOypLgcsDutLNMxySJabEamU75yUfSR/jbyAQdEn+PZeALXNx58R3vvc8g0t1y
         LZ5kR4YPlNQansHk3zHbTYUbU5RAgamrY7nlqwCu/aWqPxfUkouDu+GcpDD8SnOtphnr
         4QZ/i5ss90oyTipxPtBEpzd+MZw1Xcjp3ftFUA48tzoaVEGBn6uej9j422JXjObCD+vU
         kx9g/9FFEBarIW5mHMe9699GFA/e3HjcYpG6bKgdZ1VGTn78kVGnwNgG2RfU3yZ0cCSQ
         KV2wY4UDypnAPqZZnNemOhPi6b5ed4DV6FiVuc9wxoo2+MzeBlBuOvuBJ2rciBFCQWp3
         9nKg==
X-Forwarded-Encrypted: i=1; AJvYcCUNERAvtl/cgFShe4/k3IkMsAnt/MEB0q7Kf/AFwBOH1ZjYkj/dmwS5YChauwoU8fJmMtzGJxqjfNx1pDkHly0=@vger.kernel.org
X-Gm-Message-State: AOJu0YznpaYJskhtPxgEmP+iTba4h8N0JnGxtixOLL9ji/bs+j05Rxl9
	OJzGKRp4P4gRh7ltC7XK3Xae/7uZwh/Gv0i3E8W769VZAsGAji3+SI2HjfuqXQcU+AFtCXK6OO1
	WtyqSJgVok0eyPsgUOYKErxnWfa1oL+8=
X-Gm-Gg: AZuq6aL2M2kg2002rxndh5OAy9D5+gbyXSvf/5nbXX27BM+6Inp05LtoBcxpjTP9UCb
	WoEemUq9DTcneostFelmwYLB5DPwTdfVeGGj4vvlJAcxXLQWcuNIUzI6364gLudbH5S0NR93Rmm
	pWoTvR5ltDkxwnRSqpRf5/F0+SEOhf4EwnR9OglppaazU5JyN9WLj8/p69SNeRydLXg7aLQG60z
	ser8GGQpEw5HYWUS2RTh/ZOAE+Rg/wZuC0s0KsFKZ3wJRkdJgutRJINyQFQAKGhxoMeP3ovYzKD
	O5yZ4NpZnCKOZ66J9/kudcnGiS0BT1s2
X-Received: by 2002:a17:90b:5630:b0:354:56fc:b721 with SMTP id
 98e67ed59e1d1-356aab940dfmr15646689a91.8.1771440288702; Wed, 18 Feb 2026
 10:44:48 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260211151115.78013-1-leon.hwang@linux.dev> <20260211151115.78013-5-leon.hwang@linux.dev>
 <CAEf4BzbTtC19E_=RCk_KCjrOimbefhnXCEfURw4b+caxCY6SRQ@mail.gmail.com> <eb82cc40-e5c0-4f23-ad92-92633ccb2e0d@linux.dev>
In-Reply-To: <eb82cc40-e5c0-4f23-ad92-92633ccb2e0d@linux.dev>
From: Andrii Nakryiko <andrii.nakryiko@gmail.com>
Date: Wed, 18 Feb 2026 10:44:35 -0800
X-Gm-Features: AaiRm53sgpDCJoHpHXtbabPJSZpadyVuCpLTeBDY36JFVFT3zTDgGS5Jehnqtzg
Message-ID: <CAEf4BzaRObcgKCJdM2OSC2z2qQCmiZK03uQ6o+e6XGbMVFrAog@mail.gmail.com>
Subject: Re: [PATCH bpf-next v10 4/8] bpf: Add syscall common attributes
 support for prog_load
To: Leon Hwang <leon.hwang@linux.dev>
Cc: bpf@vger.kernel.org, Alexei Starovoitov <ast@kernel.org>, 
	Daniel Borkmann <daniel@iogearbox.net>, John Fastabend <john.fastabend@gmail.com>, 
	Andrii Nakryiko <andrii@kernel.org>, Martin KaFai Lau <martin.lau@linux.dev>, 
	Eduard Zingerman <eddyz87@gmail.com>, Song Liu <song@kernel.org>, 
	Yonghong Song <yonghong.song@linux.dev>, KP Singh <kpsingh@kernel.org>, 
	Stanislav Fomichev <sdf@fomichev.me>, Hao Luo <haoluo@google.com>, Jiri Olsa <jolsa@kernel.org>, 
	Shuah Khan <shuah@kernel.org>, Christian Brauner <brauner@kernel.org>, 
	Seth Forshee <sforshee@kernel.org>, Yuichiro Tsuji <yuichtsu@amazon.com>, 
	Andrey Albershteyn <aalbersh@redhat.com>, Willem de Bruijn <willemb@google.com>, 
	Jason Xing <kerneljasonxing@gmail.com>, Tao Chen <chen.dylane@linux.dev>, 
	Mykyta Yatsenko <yatsenko@meta.com>, Kumar Kartikeya Dwivedi <memxor@gmail.com>, 
	Anton Protopopov <a.s.protopopov@gmail.com>, Amery Hung <ameryhung@gmail.com>, 
	Rong Tao <rongtao@cestc.cn>, linux-kernel@vger.kernel.org, linux-api@vger.kernel.org, 
	linux-kselftest@vger.kernel.org, kernel-patches-bot@fb.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Feb 11, 2026 at 9:50=E2=80=AFPM Leon Hwang <leon.hwang@linux.dev> w=
rote:
>
>
>
> On 12/2/26 06:08, Andrii Nakryiko wrote:
> > On Wed, Feb 11, 2026 at 7:13=E2=80=AFAM Leon Hwang <leon.hwang@linux.de=
v> wrote:
> >>
>
> [...]
>
> >> diff --git a/kernel/bpf/log.c b/kernel/bpf/log.c
> >> index e31747b84fe2..a2b41bf5e9cb 100644
> >> --- a/kernel/bpf/log.c
> >> +++ b/kernel/bpf/log.c
> >> @@ -864,14 +864,43 @@ void print_insn_state(struct bpf_verifier_env *e=
nv, const struct bpf_verifier_st
> >>         print_verifier_state(env, vstate, frameno, false);
> >>  }
> >>
> >> +static bool bpf_log_attrs_set(u64 log_buf, u32 log_size, u32 log_leve=
l)
> >> +{
> >> +       return log_buf && log_size && log_level;
> >> +}
> >> +
> >> +static bool bpf_log_attrs_diff(struct bpf_common_attr *common, u64 lo=
g_buf, u32 log_size,
> >> +                              u32 log_level)
> >> +{
> >> +       return bpf_log_attrs_set(log_buf, log_size, log_level) &&
> >> +               bpf_log_attrs_set(common->log_buf, common->log_size, c=
ommon->log_level) &&
> >> +               (log_buf !=3D common->log_buf || log_size !=3D common-=
>log_size ||
> >> +                log_level !=3D common->log_level);
> >> +}
> >> +
> >
> > I'm not sure this check is doing what we discussed previously?... If
> > log_buf is set, but log_size or log_level is zero, you'll just ignore
> > log_buf here...
> >
> > Maybe let's keep it super simple:
> >
> > if (log_buf && common->log_buf && log_buf !=3D common->log_buf)
> >     return -EINVAL;
> > /* same for log_size, log_level, log_true_size */
> >
> > and then below just
> >
> > log->log_buf =3D u64_to_user_ptr(log_buf ?: common->log_buf);
> > log->log_size =3D log_size ?: common->log_size;
> >
> > and so on
> >
> >
> > We can be stricter than that, of course (as in, all triplets have to
> > be completely set in either/both common_attr and attr, and they should
> > completely match), but it's just more code for little benefit.
> >
>
> We cannot mix fields across the two sources. For example, using log_buf
> from attr together with common->log_size when log_size is zero would mix
> the configuration and make the effective log setup ambiguous.
>
> The intent is to align strictly with the semantics enforced by
> bpf_verifier_log_attr_valid():
>
> * log_buf and log_size must be specified together.
> * A non-NULL log_buf requires log_level !=3D 0.
> * All values must pass basic sanity checks.
>
> Given that contract, we should:
>
> 1. Validate the log attributes from attr and common independently using
>    the same helper.
> 2. if both sides provide log buffers, require the tuples to match
>    exactly.
> 3. select either the attr tuple or the common tuple as a whole =E2=80=94 =
never
>    mix fields across the two.
>
> The patch below implements this by reusing bpf_verifier_log_attr_valid()
> for both sources and resolving conflicts before selecting the effective
> log configuration.
> >
> >>  int bpf_log_attr_init(struct bpf_log_attr *log, u64 log_buf, u32 log_=
size, u32 log_level,
> >> -                     u32 __user *log_true_size)
> >> +                     u32 __user *log_true_size, struct bpf_common_att=
r *common, bpfptr_t uattr,
> >> +                     u32 size)
> >>  {
> >> +       if (bpf_log_attrs_diff(common, log_buf, log_size, log_level))
> >> +               return -EINVAL;
> >> +
> >>         memset(log, 0, sizeof(*log));
> >>         log->log_buf =3D u64_to_user_ptr(log_buf);
> >>         log->log_size =3D log_size;
> >>         log->log_level =3D log_level;
> >>         log->log_true_size =3D log_true_size;
> >> +
> >> +       if (!log_buf && common->log_buf) {
> >> +               log->log_buf =3D u64_to_user_ptr(common->log_buf);
> >> +               log->log_size =3D common->log_size;
> >> +               log->log_level =3D common->log_level;
> >> +               if (size >=3D offsetofend(struct bpf_common_attr, log_=
true_size))
> >> +                       log->log_true_size =3D uattr.user +
> >> +                               offsetof(struct bpf_common_attr, log_t=
rue_size);
> >> +               else
> >> +                       log->log_true_size =3D NULL;
> >
> > why not treat log_true_size same as log_buf/log_level/log_size? If
> > both are provided, they should match, and then we don't have a
> > possibility of inconsistency?
> >
> log_true_size is different from log_buf/log_size/log_level.
>
> It is not a regular attribute stored in either union bpf_attr or
> struct bpf_common_attr. Instead, it is a user pointer derived from
> uattr.user + offset.
>
> As a result, the computed log_true_size pointer for union bpf_attr
> and for struct bpf_common_attr will always differ, because they are
> based on different base user pointers (uattr.user vs
> uattr_common.user).
>
> So unlike the other log attributes, pointer equality is not a
> meaningful consistency check for log_true_size. The only sensible
> rule is that whichever side provides the effective log triplet also
> determines the write-back destination.

yeah, you are right, I forgot that log_true_size is not a pointer
itself, it's just a field in user-provided attrs. I'll check what you
did in v11, let's continue there.

>
> Thanks,
> Leon
>
> ---
>
> Based-on commit 19de32d4cb58 ("selftests/bpf: Migrate align.c tests to
> test_loader framework").
>
> From 32ec02c06d2abacbde17a45edbda46ef8a16fa2d Mon Sep 17 00:00:00 2001
> From: Leon Hwang <leon.hwang@linux.dev>
> Date: Wed, 11 Feb 2026 23:11:11 +0800
> Subject: [PATCH bpf-next v11 4/8] bpf: Add syscall common attributes supp=
ort
>  for prog_load
>
> BPF_PROG_LOAD can now take log parameters from both union bpf_attr and
> struct bpf_common_attr. The merge rules are:
>
> - if both sides provide a complete log tuple (buf/size/level) and they
>   match, use it;
> - if only one side provides log parameters, use that one;
> - if both sides provide complete tuples but they differ, return -EINVAL.
>
> Signed-off-by: Leon Hwang <leon.hwang@linux.dev>
> ---
>  include/linux/bpf_verifier.h |  3 ++-
>  kernel/bpf/log.c             | 38 ++++++++++++++++++++++++++++--------
>  kernel/bpf/syscall.c         |  2 +-
>  3 files changed, 33 insertions(+), 10 deletions(-)
>
> diff --git a/include/linux/bpf_verifier.h b/include/linux/bpf_verifier.h
> index dbd9bdb955b3..34f28d40022a 100644
> --- a/include/linux/bpf_verifier.h
> +++ b/include/linux/bpf_verifier.h
> @@ -643,7 +643,8 @@ struct bpf_log_attr {
>  };
>
>  int bpf_log_attr_init(struct bpf_log_attr *log, u64 log_buf, u32
> log_size, u32 log_level,
> -                     u32 __user *log_true_size);
> +                     u32 __user *log_true_size, struct bpf_common_attr *=
common,
> bpfptr_t uattr,
> +                     u32 size);
>  int bpf_log_attr_finalize(struct bpf_log_attr *attr, struct
> bpf_verifier_log *log);
>
>  #define BPF_MAX_SUBPROGS 256
> diff --git a/kernel/bpf/log.c b/kernel/bpf/log.c
> index e31747b84fe2..47bf496b673e 100644
> --- a/kernel/bpf/log.c
> +++ b/kernel/bpf/log.c
> @@ -13,17 +13,17 @@
>
>  #define verbose(env, fmt, args...) bpf_verifier_log_write(env, fmt, ##ar=
gs)
>
> -static bool bpf_verifier_log_attr_valid(const struct bpf_verifier_log *l=
og)
> +static bool bpf_verifier_log_attr_valid(u32 log_level, char __user
> *log_buf, u32 log_size)
>  {
>         /* ubuf and len_total should both be specified (or not) together =
*/
> -       if (!!log->ubuf !=3D !!log->len_total)
> +       if (!!log_buf !=3D !!log_size)
>                 return false;
>         /* log buf without log_level is meaningless */
> -       if (log->ubuf && log->level =3D=3D 0)
> +       if (log_buf && log_level =3D=3D 0)
>                 return false;
> -       if (log->level & ~BPF_LOG_MASK)
> +       if (log_level & ~BPF_LOG_MASK)
>                 return false;
> -       if (log->len_total > UINT_MAX >> 2)
> +       if (log_size > UINT_MAX >> 2)
>                 return false;
>         return true;
>  }
> @@ -36,7 +36,7 @@ int bpf_vlog_init(struct bpf_verifier_log *log, u32
> log_level,
>         log->len_total =3D log_size;
>
>         /* log attributes have to be sane */
> -       if (!bpf_verifier_log_attr_valid(log))
> +       if (!bpf_verifier_log_attr_valid(log_level, log_buf, log_size))
>                 return -EINVAL;
>
>         return 0;
> @@ -865,13 +865,35 @@ void print_insn_state(struct bpf_verifier_env
> *env, const struct bpf_verifier_st
>  }
>
>  int bpf_log_attr_init(struct bpf_log_attr *log, u64 log_buf, u32
> log_size, u32 log_level,
> -                     u32 __user *log_true_size)
> +                     u32 __user *log_true_size, struct bpf_common_attr *=
common,
> bpfptr_t uattr,
> +                     u32 size)
>  {
> +       char __user *ubuf_common =3D u64_to_user_ptr(common->log_buf);
> +       char __user *ubuf =3D u64_to_user_ptr(log_buf);
> +
> +       if (!bpf_verifier_log_attr_valid(common->log_level, ubuf_common,
> common->log_size) ||
> +           !bpf_verifier_log_attr_valid(log_level, ubuf, log_size))
> +               return -EINVAL;
> +
> +       if (ubuf && ubuf_common && (ubuf !=3D ubuf_common || log_size !=
=3D
> common->log_size ||
> +                                   log_level !=3D common->log_level))
> +               return -EINVAL;
> +
>         memset(log, 0, sizeof(*log));
> -       log->log_buf =3D u64_to_user_ptr(log_buf);
> +       log->log_buf =3D ubuf;
>         log->log_size =3D log_size;
>         log->log_level =3D log_level;
>         log->log_true_size =3D log_true_size;
> +
> +       if (!ubuf && ubuf_common) {
> +               log->log_buf =3D ubuf_common;
> +               log->log_size =3D common->log_size;
> +               log->log_level =3D common->log_level;
> +               log->log_true_size =3D NULL;
> +               if (size >=3D offsetofend(struct bpf_common_attr, log_tru=
e_size))
> +                       log->log_true_size =3D uattr.user +
> +                               offsetof(struct bpf_common_attr, log_true=
_size);
> +       }
>         return 0;
>  }
>
> diff --git a/kernel/bpf/syscall.c b/kernel/bpf/syscall.c
> index e86674811996..17116603ff51 100644
> --- a/kernel/bpf/syscall.c
> +++ b/kernel/bpf/syscall.c
> @@ -6247,7 +6247,7 @@ static int __sys_bpf(enum bpf_cmd cmd, bpfptr_t
> uattr, unsigned int size,
>                 if (from_user && size >=3D offsetofend(union bpf_attr, lo=
g_true_size))
>                         log_true_size =3D uattr.user + offsetof(union bpf=
_attr, log_true_size);
>                 err =3D bpf_log_attr_init(&attr_log, attr.log_buf, attr.l=
og_size,
> attr.log_level,
> -                                       log_true_size);
> +                                       log_true_size, &attr_common, uatt=
r_common, size_common);
>                 err =3D err ?: bpf_prog_load(&attr, uattr, &attr_log);
>                 break;
>         case BPF_OBJ_PIN:
> --
> 2.52.0
>
>
