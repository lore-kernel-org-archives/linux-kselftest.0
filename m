Received: from mail-pf1-f171.google.com (mail-pf1-f171.google.com [209.85.210.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 650512F39B9
	for <linux-kselftest@vger.kernel.org>; Thu,  5 Feb 2026 22:18:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.210.171
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770329898; cv=pass; b=smX0tPq0t/TLiY8mBUa/K6G5KgvBITv2t0NXiKqfKBLMJUgwzj+DRJajsFtu9w9Io11ed4Da/6UBZnyOVwEtPVbgc12Kp1IrSME+b9NbgzSJH/llQQPuEOhEf/lcf0a5BlDSzhRNs5uZYZtXXADbzK54LvLqaaPPEm2gdFZzt4Y=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770329898; c=relaxed/simple;
	bh=vLtqOXlkmpDp8649uQXAFwpec++fglZ9xjz1AMQBNq0=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=lmzNyMW7C8Wu+9iEGCTE6hl+w6Qjfd/h6H1re1Z3aKw709lpDmKrtFtYnrk43+vyHpmUY9xqd7I2AkLXDDJCZWQ3Ye9BUfWGzjlTbg3FEM91/yuZsaXkfW4iDBCpFnbcIhutBjdJjOXQBrVxME1yBRVWGmbtDkEIlMiWEFYM/0s=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=BGnRuN1x; arc=pass smtp.client-ip=209.85.210.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="BGnRuN1x"
Received: by mail-pf1-f171.google.com with SMTP id d2e1a72fcca58-81ecbdfdcebso71031b3a.1
        for <linux-kselftest@vger.kernel.org>; Thu, 05 Feb 2026 14:18:18 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1770329898; cv=none;
        d=google.com; s=arc-20240605;
        b=ICMyBSJjaMwvQC+TdDsVqmS0tBpM9Xz1Srkgicqju+iPcK77L5ropat0K6YR81gRnO
         sCmmLZJgBDpCUuJLNagvDPKDWhGurKZtkEp6VWAB37EWAGSZHHXjvnH3X9EoiglOVlTW
         oiwmbu1ADEKn0nliN4hdpkbcSZ9KyKlOQRXwW/WG55vwlD0+w2rFFvuxNSjP8LLGl7C5
         0aAk0U0sahYDHEohRcLEzbIGXfr1Vk8C5eeH3lt+I/VSgBq1j9J1zT0GZd+jWR9T1bWk
         qVcNcbRcH3UOzyqMP7n9cAn/0bcqZ2S0zpItATq/Cmn146tPc+nAYoY4AYIaryROdyok
         hwGQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=cchYFu5XNpUxtrsOKugy/nLBzyYeneYwWP7P7Z/OFic=;
        fh=ZSyZa8TvVTv17/h0G9x4FSD9GankssTEVa8qbbrQVrc=;
        b=HeaUF/4Y60cAN7HDWkKvEdcax1aC4X4GBzqgXAi3V7rKTlR7LFhC/VZEsAu0w91Xli
         eDhneLuEoKtV2b7ozFwiPBo7zjGo8j24lXSuPUFuJzbWbINHXK4glRiQMJcOZX7FepBs
         3UIMqsQn5o4PV645uK70682+dJcqi7grRNiROSuas5w5/jH6AIsxok7EbCeNIJNQcEr4
         JbDdkvyqEsgu33vcIUCrh0LLSU2Zmi7FAmM6G1SkT8W5sZiH7JSvwNB05QtkUJbHqZwo
         wEXHic9M12JyoEF1sJnzJcwy49QYx3ewK5p6CxMBVrjLZ9qx+rv6rDOEDx8UdnNzegVa
         pPRQ==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1770329898; x=1770934698; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=cchYFu5XNpUxtrsOKugy/nLBzyYeneYwWP7P7Z/OFic=;
        b=BGnRuN1xm224yBwoxJ3XKVwxoAhqF2aIhi/2MPkVwX6Z43Qsnv1MSm3uPm3QdsPQvv
         ddYLDTLDdR80ta9BGrAvwK0g77wrj+4dVI8deyySuJbvEIgfFJtyqCuWFC6wnmzQUjbY
         KFRYzc4UyKo6xohOULVB/33hllZn26j8uzKPSdLTCJseXmBjrDFiLwWzAnWpey71FcFb
         SxF3n6woZDclOAdUoedg1xXRxxf3ds28mxd+L7s7wcg+Mu/gFMFLQgsKNASj06HnDwdK
         lhNeuDC/49efp6fdFp59AkFSeDDqWEVsu57OTLCdJxL8N2ZPhcrXDhmNTyH5PrE65XHw
         v59A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1770329898; x=1770934698;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=cchYFu5XNpUxtrsOKugy/nLBzyYeneYwWP7P7Z/OFic=;
        b=NFWFqBo8qp1nxnQc5o4DRDIe2mTLNgHg9+vnbXKkXaocrRKgbtZs3dEsTiv3casTE3
         Hme/xYPZw75FJgS27mUfGCaJRH9NMq1MxKqCMjpMb8+n9SVP8fAwhORNDCC8knBEcJMm
         vB6qqxtvyc1++ISn7k34T7J9HV6GmTFozG0mLSCwI6oTS4uwc88sQ3RYlenF2sQg0XnQ
         UwXG9zRDEQN9b8pazlZXvrfdlGenE5UC6FDKy9NLZP4ZEf7ATjf+Bx1joT6rpV1xO7Jp
         s9qbj9D0lZRTHB9XrjtqXR/5UTTFDDywRIK1iTdl4q2/PNj4cQa8kjYoBf8DtFbdcTrY
         XUWw==
X-Forwarded-Encrypted: i=1; AJvYcCVOFcZAjHs7jvhnTJDOUPBYLnyLEMKzeEnF7MrX7mlLAAapjq9EHUhWkfIxrT++fUMXFFe4+6mbGX2erJP1I28=@vger.kernel.org
X-Gm-Message-State: AOJu0YwZy8EBzJHmZ6/+SpmYaZ+8Z6c5bkZXkRYoSirsXkbDjKGJEkpt
	5XgXfWm8/ivBTcYGFX11iWV2QMhPHMYH4baj0hGcKceS9LyO1P0bBmBJEDnb4+pOfKylnXaGK7M
	2SIY/jN4k2QzISM+9lPKZLLi7w79QYKA=
X-Gm-Gg: AZuq6aKGC0r1ssd1nh67RnR+TfxCKcxOQhS9qYoVIa+WCa2FvmVZuNlmPK2Dr4bWjlf
	aevpo5AG1Hw7jiUs7zRh8Nk1gs3zGAz7ZK3XQHAg2WkNmbn0/cJtYe1f9HaitQ7mkjqb4ynTqAP
	qZSbRtaLDcsWPF95Rx/vZkjKgjDMLPX/YwuZ6Cqj+s+ZDo+kpkLK4iPSLqpTXvecSIlNGzB7zy1
	j/AS7e2JEKcU8hydTQfP/snqc5WkCg9BSkx8mh8xjwLLJF0msiEC6IKIhCLaXlu4eEmmJp8A0PN
	xmgCPwf/3zE=
X-Received: by 2002:a17:90b:6c3:b0:354:7c90:8c6 with SMTP id
 98e67ed59e1d1-354b3e4503dmr359395a91.25.1770329897674; Thu, 05 Feb 2026
 14:18:17 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260202144046.30651-1-leon.hwang@linux.dev> <20260202144046.30651-5-leon.hwang@linux.dev>
 <CAEf4Bza-PM9ExqJS=Q_oj7Cqc5dvmbN_Zv9-4UnJNtsZU28FoQ@mail.gmail.com> <a31b7f19-a22a-44ab-8ecd-9df9dead9c3d@linux.dev>
In-Reply-To: <a31b7f19-a22a-44ab-8ecd-9df9dead9c3d@linux.dev>
From: Andrii Nakryiko <andrii.nakryiko@gmail.com>
Date: Thu, 5 Feb 2026 14:18:05 -0800
X-Gm-Features: AZwV_QhcaugW1hKMYmi69h669dkiCWPGiiQzGYvFIpSUB_4402UB2ZyoHNuy4Kg
Message-ID: <CAEf4BzZWawrE+mXaPNPAT8zcz0Qy+5QYA6r4JzEVw7UAcUH-uA@mail.gmail.com>
Subject: Re: [PATCH bpf-next v9 4/9] bpf: Add syscall common attributes
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

On Wed, Feb 4, 2026 at 7:42=E2=80=AFPM Leon Hwang <leon.hwang@linux.dev> wr=
ote:
>
>
>
> On 5/2/26 03:48, Andrii Nakryiko wrote:
> > On Mon, Feb 2, 2026 at 6:42=E2=80=AFAM Leon Hwang <leon.hwang@linux.dev=
> wrote:
> >>
> >> BPF_PROG_LOAD can now provide log parameters through both union bpf_at=
tr
> >> and struct bpf_common_attr. Define clear conflict and precedence rules=
:
> >>
> >> - if both are provided and log_buf/log_size/log_level match, use them;
> >> - if only one side provides a log buffer, use that one;
> >> - if both provide log buffers but differ, return -EINVAL.
> >>
> >> Signed-off-by: Leon Hwang <leon.hwang@linux.dev>
> >> ---
> >>  include/linux/bpf_verifier.h |  3 ++-
> >>  kernel/bpf/log.c             | 24 ++++++++++++++++++++++--
> >>  kernel/bpf/syscall.c         |  3 ++-
> >>  3 files changed, 26 insertions(+), 4 deletions(-)
> >>
> >> diff --git a/include/linux/bpf_verifier.h b/include/linux/bpf_verifier=
.h
> >> index c805b85b6f7a..0d106fddbbc5 100644
> >> --- a/include/linux/bpf_verifier.h
> >> +++ b/include/linux/bpf_verifier.h
> >> @@ -638,7 +638,8 @@ struct bpf_log_attr {
> >>  };
> >>
> >>  int bpf_prog_load_log_attr_init(struct bpf_log_attr *attr_log, union =
bpf_attr *attr,
> >> -                               bpfptr_t uattr, u32 size);
> >> +                               bpfptr_t uattr, u32 size, struct bpf_c=
ommon_attr *attr_common,
> >> +                               bpfptr_t uattr_common, u32 size_common=
);
> >>  int bpf_log_attr_finalize(struct bpf_log_attr *attr, struct bpf_verif=
ier_log *log);
> >>
> >>  #define BPF_MAX_SUBPROGS 256
> >> diff --git a/kernel/bpf/log.c b/kernel/bpf/log.c
> >> index ff579fcba36f..345005ba98dd 100644
> >> --- a/kernel/bpf/log.c
> >> +++ b/kernel/bpf/log.c
> >> @@ -873,10 +873,30 @@ static void bpf_log_attr_init(struct bpf_log_att=
r *attr_log, int offsetof_true_s
> >>         attr_log->uattr =3D uattr;
> >>  }
> >>
> >> +static bool bpf_log_attrs_diff(struct bpf_common_attr *common, u64 lo=
g_buf, u32 log_size,
> >> +                              u32 log_level)
> >> +{
> >> +       return log_buf && common->log_buf && (log_buf !=3D common->log=
_buf ||
> >> +                                             log_size !=3D common->lo=
g_size ||
> >> +                                             log_level !=3D common->l=
og_level);
> >
> > let's validate (unless we do this somewhere else) that if log_buf is
> > set, then log_size and log_level (? not sure, maybe zero is fine) are
> > set, or all three are not set. Same for common->log* fields...
> >
>
> Ack.
>
> Will validate 'log_buf && log_size && log_level' first.
>
> >
> >> +}
> >> +
> >>  int bpf_prog_load_log_attr_init(struct bpf_log_attr *attr_log, union =
bpf_attr *attr,
> >> -                               bpfptr_t uattr, u32 size)
> >> +                               bpfptr_t uattr, u32 size, struct bpf_c=
ommon_attr *attr_common,
> >> +                               bpfptr_t uattr_common, u32 size_common=
)
> >>  {
> >> -       bpf_log_attr_init(attr_log, offsetof(union bpf_attr, log_true_=
size), uattr, size);
> >> +       if (bpf_log_attrs_diff(attr_common, attr->log_buf, attr->log_s=
ize, attr->log_level))
> >> +               return -EINVAL;
> >> +
> >> +       if (!attr->log_buf && attr_common->log_buf) {
> >> +               attr->log_buf =3D attr_common->log_buf;
> >> +               attr->log_size =3D attr_common->log_size;
> >> +               attr->log_level =3D attr_common->log_level;
> >
> > why are we setting this? Do we still have code that can access
> > attr->log_buf even though we pass attr_log everywhere? If yes, should
> > we still have that "split brain" code?
> >
>
> 'attr->log_buf' is accessed only in bpf_check().

bpf_check should be changed then, see below

>
> > If we don't have this assignment, then I think we don't need to have
> > bpf_prog_load-specific and btf_load-specific log_attr_init() helpers.
> > They can be unified into generic log_attr_init, where for
> > bpf_prog_load you'll pass offsetof(log_true_size) +
> > attr->log_{buf,size,level}, and for btf_load you'll pass different
> > offset of and btf-specific attr->btf_log*
> >
> > This helper will just be making decision whether to use common_attr's
> > log fields or passed directly command-specific ones.
> >
> > Or what am I missing?
> >
>
> If the log attributes differ, where should the effective
> log_* values be stored?
>
> Should they live in struct bpf_common_attr, or should we extend
> struct bpf_log_attr to carry them?
>
> Note that in v8, Alexei suggested struct bpf_log_attr only needs
>   u32 offsetof_true_size;
>   bpfptr_t uattr;
>
> so I=E2=80=99d like to clarify the intended direction here. Once that=E2=
=80=99s clear, a
> single generic log_attr_init() should be sufficient to handle this.
>

The intended direction is to have log buf/size/level in one place
(after attr and common_attr validations), so we keep internal logic
simple. Let's put all of that and log_true_size **pointer** (we don't
have to much with offsetof, just calculate user addr for
log_true_size, which just might be NULL) into bpf_log_attrs and teach
all code to look and work *only* with that struct, ignoring anything
log related from attr.

> Thanks,
> Leon
>
> >
> >> +               bpf_log_attr_init(attr_log, offsetof(struct bpf_common=
_attr, log_true_size),
> >> +                                 uattr_common, size_common);
> >> +       } else {
> >> +               bpf_log_attr_init(attr_log, offsetof(union bpf_attr, l=
og_true_size), uattr, size);
> >> +       }
> >>         return 0;
> >>  }
> >>
> >> diff --git a/kernel/bpf/syscall.c b/kernel/bpf/syscall.c
> >> index e81199361241..7125ea445c6c 100644
> >> --- a/kernel/bpf/syscall.c
> >> +++ b/kernel/bpf/syscall.c
> >> @@ -6232,7 +6232,8 @@ static int __sys_bpf(enum bpf_cmd cmd, bpfptr_t =
uattr, unsigned int size,
> >>                 err =3D map_freeze(&attr);
> >>                 break;
> >>         case BPF_PROG_LOAD:
> >> -               err =3D bpf_prog_load_log_attr_init(&attr_log, &attr, =
uattr, size);
> >> +               err =3D bpf_prog_load_log_attr_init(&attr_log, &attr, =
uattr, size, &attr_common,
> >> +                                                 uattr_common, size_c=
ommon);
> >>                 err =3D err ?: bpf_prog_load(&attr, uattr, &attr_log);
> >>                 break;
> >>         case BPF_OBJ_PIN:
> >> --
> >> 2.52.0
> >>
>
