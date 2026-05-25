Received: from mail-qt1-f181.google.com (mail-qt1-f181.google.com [209.85.160.181])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A9520286AC
	for <linux-kselftest@vger.kernel.org>; Mon, 25 May 2026 07:22:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.160.181
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779693740; cv=pass; b=KfqG6f+/DkPnIDk6qM7fsnf3t8OKW843uzPkVgUBGskoCwEiEaeQ42t/K2M6cp4ZGPverMxgiRp0E4zIdabfuZ5xvMKnFlRVYeu2HaF77BEBuuNANdKF5qSSgjnoZIT7JHWNS85W73aBP+MdU9bQ9SFZ4qfaGiZJxIEAm6DYiA0=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779693740; c=relaxed/simple;
	bh=X+7djYcP9GEagwqG8m/X7AI21c2H+orZX9PlTDd1uts=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=gkiBE6zPTLz12YXCgDqenO2G+mcw8CtOXv344wd1iCc/GXBIApRyD4dVT9J2QXXAqgXmWw+YGy41MrI4o49GQQjff6Uz5Dvq9d162JkSMNKACOONEdmpaV1luteqd2G+A6Kgv3ldKLpHUQM8RaGGF8dau7pSOcnNxOzTKjx6J3c=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=b4Xd/IrL; arc=pass smtp.client-ip=209.85.160.181
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="b4Xd/IrL"
Received: by mail-qt1-f181.google.com with SMTP id d75a77b69052e-50e61648f10so1061cf.1
        for <linux-kselftest@vger.kernel.org>; Mon, 25 May 2026 00:22:18 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1779693738; cv=none;
        d=google.com; s=arc-20240605;
        b=C3PZeM+c5RuUnRSPDbzWVMuBGxzWZgokEr8m75HyA8iBApm9TpDqrNNRvAZWEjnLCT
         KjbKMNT9WclUWTtfBsjju/UZesVtlg+5+pjegCUZKa9GZQQCVSpbMeciI3NWfCkF1ehf
         xM5R4jA0hq+64zggCE1nAW1YBCSuQveFckVFbDZOXNdZiBJWB4yxPNMmv2Zn2uDOxJZ6
         0XeyGZfWoUSEKWkP8hE4YN6Jlotgqzt7fLEk1pctlwP0GYEZC7K8ysqHi2lCH9eaeHNs
         bb7DPhUzzxq1p06C0x/44SyVh1hAAofDH3r5JnaVOE+efWPbpcFi4ZUd4BhapgA4LLYd
         Zw5A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=y5njTe4srkYzXCM80V2lfRLC7p2SgEf5NieyXgBYSB0=;
        fh=jw7NNdm/fUVA042RH3bQQcJyhtAebZ7aYjwEtf3uLKA=;
        b=eooTdpLcOw52Y4vG34xaGiQZ+QwIxiu6Uxv9QnkmII6i5s/Hkv1kr8MKpl3EhFqLmI
         KY4gT6+R77WRdw0EhG+9Ci4ZVu+zG8CndnyJrqyS0VKiY5hgMsMt+rGs+sO2pUK8tsEK
         z6PPUtFoSz2xuaB7Z4nlMyC1AA0oYIpPU0kff82ekOmb4KTTk0wU0GmUFRGQLzw1qkZY
         zkv7BfCl1lWoa6Nge9PtBSJ3wyMxwQNgLIDUJWHkci+qjo/2Eyu49E5EqblL7BCnhOQJ
         cnNSuwZigsBmyPaaXN53E2ri/TdyLBLHmhYihBC7/0YcjaNvIfcqQTC7reu8rCijBzOs
         Fppg==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1779693738; x=1780298538; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=y5njTe4srkYzXCM80V2lfRLC7p2SgEf5NieyXgBYSB0=;
        b=b4Xd/IrL+T87r+U2VbjRDAUuzMG7zz3EI/yzK9pbyJfpgbMR+GLEW0CAdcVnFJ7UDi
         1IHrmhfzzTBAzfb/YUsjOPEd19qhEubDheoaRCmTyG6W6QXG5YQ1EC+dlDcgE9FryAtq
         hSeoGGhXUvFYeWl6UyAgL39mlYCNNFPnEsKgIkvujjk7HJ3vKjlTUR0YRssRDJcPu5RC
         AhzFpptixYNG8SX9fRQXpxpNtZ85rBdhX8JjzyLAl3RRR1gvdN8GCXrZwFJ3iB0tAqT6
         H5KZjBWH3nNRiGmTitP9VJex3NtwZjqkFrp6izdFokwBglZx4cumcWyJWCgr2ObCfBPw
         5rPA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779693738; x=1780298538;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=y5njTe4srkYzXCM80V2lfRLC7p2SgEf5NieyXgBYSB0=;
        b=HCc7surmy3lUEKjOItzBwhRmqLxknJYhp9PN8yBWkIF3SXmadrMxggfSvK9bSMzbPd
         NeQ0KzkSM0kgBLKlQLGNRHRBADXlu7ADFX1OsaESM+ynYw88DPn0qYBgIyvRZo0N6Veq
         0HRKD0P6c+d3CaqkIaSrt93WgPWOdthqvWlIx+WjbNqLQNWcLz6o013UaQ+buX8aaE2M
         MSgIRFplzb7a/6M/QB/SRmjcJW60Q4+Gzi9NkFu3F4L97Xltn2Yp676IwhEsWN0L0Q9K
         6muLm4lLTr4saDizoq7pXg3PH5ovTn7PsJ0pNAXjSE0HAjUa0yTiwzzOWRfC+hwrq0Ei
         e/MQ==
X-Forwarded-Encrypted: i=1; AFNElJ9/224xYkLK48JPEwLcec9MWsr0UxZr3Jbw6MSQFpi7iuCr6TYzkaLFYAvox5zWL5jPyEdNrp+2zpIPlR6A+9Q=@vger.kernel.org
X-Gm-Message-State: AOJu0Yx9DGj5/I0eoaF1GMNakU1E9v5LSCmH5vwV/36n+7GrvCbs/nx+
	iRoRsODHh6hsiCILLBXLYSBVjkLxB33Rl8yy1XHAh+/e17xWlQvD5La80zuGkXKUCt5XFDGUdK7
	CC3akPSQeZepY5dDT/+CaeO2iCkLKyoc7WrVkT5sT
X-Gm-Gg: Acq92OGy7794KyUKRfHuHJ31wDc9GCW4eoZC5nDaKhXeMz+ezTiDMrRAKWu6sPIlHJf
	cZPXP6empn/BeQIccb63bTzxnw8ftZvhyAHW0UhEaPlVV5BVo6f8a5IZEDl3wotXx1gyio1IRb+
	2rby7E9Z84SWc6IUCi7oK2bbDy0RAicLAcPY723UQ0DY7wUeUq6t/k1jTmPmGSH/D/w3zUQt8Vt
	Z7LsAQxH7Brh9hKMJ2Xxv4x7p+hiHZinXOax6PavG77ky7iEpK48AOt6cKrT1sto2Ux48HTO61t
	TR0DDzzg3pcUN0G004tD3HlyV2pL2j7ocYSHxuF6juU/iZEFcgAK4VKzwNoNYw1WFTSKtNb/bCS
	Kj1PCtQ==
X-Received: by 2002:a05:622a:201:b0:50e:595d:164 with SMTP id
 d75a77b69052e-516e0cf98d8mr18186391cf.8.1779693737022; Mon, 25 May 2026
 00:22:17 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260515071504.2054786-2-yuyanghuang@google.com>
 <2e08eb1ca27a9a2f8ad29e1c24f779b579621b0a648589f7044799d91c5e00f5@mail.kernel.org>
 <CADXeF1GVtFHNZJb8xwFh6aadR=H19S+kja8rF185XB5=fg0D0Q@mail.gmail.com> <CAADnVQ+42+Th6OFGq2KawzvyKUAykazb4fXh2_uqss-T+R8VCg@mail.gmail.com>
In-Reply-To: <CAADnVQ+42+Th6OFGq2KawzvyKUAykazb4fXh2_uqss-T+R8VCg@mail.gmail.com>
From: Yuyang Huang <yuyanghuang@google.com>
Date: Mon, 25 May 2026 16:21:41 +0900
X-Gm-Features: AVHnY4JA9Kqb5fOY7fSO1LmnGe3xgrK64F2oWnLs97m99yzTrV6-pG4BIKgY5OA
Message-ID: <CADXeF1F=7RcxAsW38w_mpFeKCLxTAh5p_XYHd=x2Ru+oajoN3Q@mail.gmail.com>
Subject: Re: [PATCH bpf-next 1/2] bpf: align syscall writeback behavior with
 caller-declared size
To: Alexei Starovoitov <alexei.starovoitov@gmail.com>
Cc: Daniel Borkmann <daniel@iogearbox.net>, bot+bpf-ci@kernel.org, 
	Alexei Starovoitov <ast@kernel.org>, Andrew Lunn <andrew+netdev@lunn.ch>, 
	Andrii Nakryiko <andrii@kernel.org>, Eduard <eddyz87@gmail.com>, 
	Eric Dumazet <edumazet@google.com>, Jakub Kicinski <kuba@kernel.org>, Jiri Olsa <jolsa@kernel.org>, 
	John Fastabend <john.fastabend@gmail.com>, Kumar Kartikeya Dwivedi <memxor@gmail.com>, 
	Martin KaFai Lau <martin.lau@linux.dev>, Nikolay Aleksandrov <razor@blackwall.org>, 
	Paolo Abeni <pabeni@redhat.com>, Shuah Khan <shuah@kernel.org>, Simon Horman <horms@kernel.org>, 
	Song Liu <song@kernel.org>, Stanislav Fomichev <sdf@fomichev.me>, 
	Yonghong Song <yonghong.song@linux.dev>, bpf <bpf@vger.kernel.org>, 
	LKML <linux-kernel@vger.kernel.org>, 
	"open list:KERNEL SELFTEST FRAMEWORK" <linux-kselftest@vger.kernel.org>, 
	Network Development <netdev@vger.kernel.org>, =?UTF-8?Q?Maciej_=C5=BBenczykowski?= <maze@google.com>, 
	Lorenzo Colitti <lorenzo@google.com>, Martin KaFai Lau <martin.lau@kernel.org>, Chris Mason <clm@meta.com>, 
	Ihor Solodrai <ihor.solodrai@linux.dev>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Thanks for the review comment. To better explain the problem, please
bear with me through this long email reply.


>AI is wrong.
>The fixes tag should probably point to 053c8e1f235dc or a subsequent patch=
?

Thanks for pointing it out. I think the correct Fixes tags should be
as follows, and I will split them individually in the v2 patches:

Fixes: 053c8e1f235d ("bpf: Add generic attach/detach/query API for multi-pr=
ogs")
Fixes: 120933984460 ("bpf: Implement mprog API on top of existing cgroup pr=
ogs")

>Please provide more details.
>I'm still not convinced that what you're saying... is a kernel bug.
>Looks like user space is querying new attachment types with old structure.

I created a small C program using BPF_PROG_QUERY to query
BPF_CGROUP_INET_INGRESS (not the BPF_TCX_EGRESS) to demonstrate the
full problem , hope it clarifies:

```c
#include <unistd.h>
#include <sys/syscall.h>
#include <stdio.h>
#include <string.h>
#include <fcntl.h>

#define __NR_bpf 321
#define BPF_PROG_QUERY 16
#define BPF_CGROUP_INET_INGRESS 0
int main() {
    char buf[64];
    memset(buf, 0xAA, 64); // Set 0xAA signature
    memset(buf, 0, 40);    // Zero out legacy 40-byte struct
    *(int*)(buf + 0) =3D open("/sys/fs/cgroup", O_RDONLY);
    *(int*)(buf + 4) =3D BPF_CGROUP_INET_INGRESS; // Explicitly set attach_=
type

    // Call BPF_PROG_QUERY (16) with legacy size (40) on x86_64 (syscall 32=
1)
    long ret =3D syscall(__NR_bpf, BPF_PROG_QUERY, buf, 40);
    printf("Syscall return value: %ld\n", ret);
    printf("Revision (offsets 56-63): %016llx\n", *(unsigned long
long*)(buf + 56));
    close(*(int*)(buf + 0)); // Clean up cgroup FD
    return 0;
}
```

Before the patch:
  Syscall return value: 0
  Revision (offsets 56-63): 0000000000000001   <-- Stack/Heap Corruption!

After the patch (Safe / revision writeback is gated):
  Syscall return value: 0
  Revision (offsets 56-63): aaaaaaaaaaaaaaaa   <-- Safe (Signature intact)

For this example, the regression lies in legacy CGROUP queries:
1. BPF_PROG_QUERY for cgroups is not a new feature; it has been in the
kernel since 2017.
2. There are existing legacy userspace applications and language
wrappers (like our android net-tests) written years ago with older
structure layouts (passing size =3D 40, ending at
query.prog_attach_flags) that query cgroups.
3. In June 2025, Commit 120933984460 backported "revision" support to
cgroup queries, introducing an unconditional writeback in
`__cgroup_bpf_query()` at offset 56:
```c
// In __cgroup_bpf_query() (kernel/bpf/cgroup.c) - Introduced in 1209339844=
60:
if (copy_to_user(&uattr->query.revision, &revision, sizeof(revision)))
        return -EFAULT;
```

Now lets talk about BPF_TCX_EGRESS:

> bpf_mprog_query() and tcx_prog_query() were only introduced there.
> How come your userspace passes shorter uatter to query newer
> BPF_TCX_EGRESS attachment?

I understand your point, but two common cases exist where userspace
will legitimately query BPF_TCX_EGRESS with a 40-byte structure:

First, a generic BPF querying tool (assume it called `./bpf-query`)
compiled in 2020 (when the query buffer size was 40 bytes) might
accept the attach type dynamically from the command line:
  ./bpf-query --type 47 --fd 3  # 47 is BPF_TCX_EGRESS

The unmodified 2020 binary populates the struct dynamically and
invokes the syscall with size =3D 40:
```c
   ....
   attr.query.attach_type =3D 47; // BPF_TCX_EGRESS (passed dynamically
at runtime)
   syscall(__NR_bpf, BPF_PROG_QUERY, &attr, 40);
```

Without the size check, the unconditional writeback of revision at
offset 56 would result in an out-of-bounds write on the stack.

Second, in dynamic language environments (like Python), UAPI
structures are often declared manually. The developer might only
declare the subset of fields the application actually uses (40 bytes
in this case) to optimize memory overhead. Even with this subset
declaration, we believe the kernel should ideally respect the declared
size limit to prevent accidental out-of-bounds writes into adjacent
userspace memory.

> Looks like user space is querying new attachment types
> with old structure.
> Potentially the check can only be around:
>         case BPF_TCX_INGRESS:
>         case BPF_TCX_EGRESS:
>                 return tcx_prog_query(attr, uattr);
>
> to be nice to broken user space,
> but, really, attr->query.attach_type shouldn't be equal to BPF_TCX_EGRESS
> with a smaller uattr.

Add gating to the TCX path, will not be able to fix the legacy cgroup
query path. As shown above, the cgroup query path has the exact same
OOB writeback regression affecting legacy userspace. Since we must
plumb uattr_size to cgroup.c to resolve the cgroup regression safely,
applying the same consistent size-gating in bpf_mprog_query() seemed
like the most consistent and robust architectural path.

Feel free to let us know your thoughts.

Thanks,
Yuyang

On Sun, May 24, 2026 at 8:22=E2=80=AFPM Alexei Starovoitov
<alexei.starovoitov@gmail.com> wrote:
>
> On Thu, May 21, 2026 at 1:41=E2=80=AFPM Yuyang Huang <yuyanghuang@google.=
com> wrote:
> >
> > >This looks like a bug fix for an out-of-bounds write vulnerability.
> > >Should this include a Fixes: tag to identify which commit introduced t=
he
> > >unconditional copy_to_user() calls for query.revision without checking
> > >the user-provided buffer size?
> >
> >  > Fixes: 3fe213c040b3 ("adding ci files")
> >
> > I completely missed this checkpatch comment. I will add the Fixes tag
> > in v2 if there is a consensus that this patch is the right approach to
> > resolve the issue.
>
> AI is wrong.
> The fixes tag should probably point to 053c8e1f235dc or a subsequent patc=
h?
>
> bpf_mprog_query() and tcx_prog_query() were only introduced there.
> How come your userspace passes shorter uatter to query newer
> BPF_TCX_EGRESS attachment?
>
> Please provide more details.
>
> I'm still not convinced that what you're saying:
> "
> For example, our Android net_test  suite uses this legacy 40-byte
> Python ctypes struct layout:
>
>   # legacy 40-byte layout (pre-revision field)
>   BpfAttrProgQuery =3D cstruct.Struct(
>     "bpf_attr_prog_query", "=3DIIIIQI4xQ",
>     "target_fd attach_type query_flags attach_flags prog_ids_ptr
> prog_cnt prog_attach_flags"
>   )
>   # Invoked via: syscall(__NR_bpf, BPF_PROG_QUERY, &attr, 40)
> "
> is a kernel bug.
>
> Looks like user space is querying new attachment types
> with old structure.
> Potentially the check can only be around:
>         case BPF_TCX_INGRESS:
>         case BPF_TCX_EGRESS:
>                 return tcx_prog_query(attr, uattr);
>
> to be nice to broken user space,
> but, really, attr->query.attach_type shouldn't be equal to BPF_TCX_EGRESS
> with a smaller uattr.
>
> pw-bot: cr
