Received: from mail-ot1-f54.google.com (mail-ot1-f54.google.com [209.85.210.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 938E1376BFB
	for <linux-kselftest@vger.kernel.org>; Fri, 29 May 2026 20:36:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780086997; cv=none; b=i5zUoYtGeu3xpL4XW5LvA6ZG6juZlCcuI6GbrOhDxcVHxNnAZb99N0oAQN75AxJzvzeTZ+X5XYWczBwtUvRAdg2hjos000m3WA3CmMXw6L2Bcr1RAucrwW2RH4/WkXYJZyvm1t9UcPudnEoNQ8QhfRaHtRYuIVOjgZc6u7rWE/s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780086997; c=relaxed/simple;
	bh=iQNyPSB6d4pRiCH+WP5fQJzoEg3EGVgrTx0xcFYHvCs=;
	h=Mime-Version:Content-Type:Date:Message-Id:Cc:Subject:From:To:
	 References:In-Reply-To; b=TGqlP8fqJ6HCR5OTZ7o2amLi9RQOk/PdueLavS08J1pm13rFCXNwAyGTPKuHBBmHIt6wt8cGGouulYMyBbPJgfU0O0+ToQkl38rII+bRGOTzjlJg7U0jueHmd/jWUFZKrhILRIHrEN3bQ8iVQLnaqzCynC1jrcr/nZDgudbl2Oo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=hz4fwJ/Y; arc=none smtp.client-ip=209.85.210.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="hz4fwJ/Y"
Received: by mail-ot1-f54.google.com with SMTP id 46e09a7af769-7e36bb16a92so7262075a34.2
        for <linux-kselftest@vger.kernel.org>; Fri, 29 May 2026 13:36:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1780086995; x=1780691795; darn=vger.kernel.org;
        h=in-reply-to:references:to:from:subject:cc:message-id:date
         :content-transfer-encoding:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=b/dZIPQs4IpSSy6mNi2UlIteDsWuWh8/BhCXqaiofzE=;
        b=hz4fwJ/Y5FWns2VZpClGk7XG3rEM0K4QjryTwxpXjr92kecDDjcQBQPx2ii0SjOvwY
         ef9b3pI0CBb9fshM8haK9IGNu/M7GcRPl7OIVuGgRmlYImRwXjkWRQ4+efn9p49aZkxS
         oYfOc4vR4p3XQX/dgYK8zMQ8TgkjvUuik9kQ3guYkJHODqRWTdPlrkGiVKuD3Xc+fk1h
         vLP1FdF3M/nd4HzwWtJ0LcyncAKOjdo4YXx5hZ797IhqLXo267zqTvKr4FidvsRlBRDK
         Ao4spF3iSaQVSnrTHvkMoeh9qpT90SybT3eaES++37rN5VJKL9zoBaRt2iTIvMmpYSri
         +QKA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780086995; x=1780691795;
        h=in-reply-to:references:to:from:subject:cc:message-id:date
         :content-transfer-encoding:mime-version:x-gm-gg:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=b/dZIPQs4IpSSy6mNi2UlIteDsWuWh8/BhCXqaiofzE=;
        b=Blduf6eh6ePSIamUteya/CE/eMPd9oq17x1MENKlOklgNMEYSKHExh6Haelz4f2Dia
         4d4kR2YdSsp6zOs270rx/R6DWGrPfyMOkwC+BKb8f/058S4TPsSYbL124qtjLJ9T9beb
         bFaevvDKgJ+gk66IUw7bnIIeU1xFJsaA/1Y1aDqkZ+ajA/5AvxNja4OF2mXdMs2sJi1T
         bTA4FtU6BtvdA9pngTgLrjF84hwIDt36nD0x+voc+2OESwgTvvu2mrKkvx0ey4FX6rxk
         rk+j74m3w1t+nwBh6pRGvFIgRvW6sG2mj5b0VXvmwc1qzIWaerNWwyFXszjGl3VzkdPr
         IhpA==
X-Forwarded-Encrypted: i=1; AFNElJ+3pG9DMMDEpibGMQ3yyjUdIMamtT15KYSFj8+985LULCV1h8XW5by+5rciur+m9/1IqZIo0cD7/qE/SOqoSdU=@vger.kernel.org
X-Gm-Message-State: AOJu0YzgksXYNVApTuNjNVLtW1Lt+Fip0qqruPFI+KeifPOMLYm38mGG
	vxYWCkSWAToQswcp29DAIC+LPGO+A/3nQo9LG+HyDUzn7E+kc//py5+Q
X-Gm-Gg: Acq92OGiY0eW9maI0q6HUh7KxKFvc+mLeP8sMWsHHme8PyykkAnWdep/DVm+yvoNj0b
	zu/0ka80w92DjJd8uaCw5EKapFBPGew9NIuklUdIH8hZmViyjAfmfbHiHwqMfMDeOgRf63z4fIc
	ieC7zlVnWqO6lZpA/fhCaW0Tnpu812Z6KTLYsZbMlyhzfKbi28H7J43X+3iCPJfruwoGYt2YSQr
	HcAYaaBjx/gEOEMG/JU2zTWKHKgpcJYE1L98B27RphFHwFu4rWi/Z8sDA4GOEv6qbPP6Mdwzp/x
	VpBP6zUz9Cy7jCEU1yvRB/P0E5iojE13c/EEipbvfN0vdUjV+u1PKNF5WRZbxgaQohgdeXRT1EH
	vLMAUB7E5P6eC0j6Scs3pSK9Og5FihBqMJLEyZaRfWyBp/Yf00s41fB1hkwkFrP2e69u5K69vez
	pnPprQqK1r4sldhN6QXaG3OoGfqiOkjNRgUunDWpSg+EfTUibaI/8Mx9/Jb9byGu8vENlPYhmKi
	OLC4zyDIpy09Q+GbCoLlrrjejSH
X-Received: by 2002:a05:6830:4884:b0:7de:a2cc:9dde with SMTP id 46e09a7af769-7e6a1df5c12mr902807a34.15.1780086995443;
        Fri, 29 May 2026 13:36:35 -0700 (PDT)
Received: from localhost ([2a03:2880:10ff:53::])
        by smtp.gmail.com with ESMTPSA id 46e09a7af769-7e695bb393bsm2116002a34.7.2026.05.29.13.36.32
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 29 May 2026 13:36:34 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Fri, 29 May 2026 13:36:31 -0700
Message-Id: <DIVG6ANND95G.2MC7WWJG1P01A@gmail.com>
Cc: "Daniel Borkmann" <daniel@iogearbox.net>, <bot+bpf-ci@kernel.org>,
 "Alexei Starovoitov" <ast@kernel.org>, "Andrew Lunn"
 <andrew+netdev@lunn.ch>, "Andrii Nakryiko" <andrii@kernel.org>, "Eduard"
 <eddyz87@gmail.com>, "Eric Dumazet" <edumazet@google.com>, "Jakub Kicinski"
 <kuba@kernel.org>, "Jiri Olsa" <jolsa@kernel.org>, "John Fastabend"
 <john.fastabend@gmail.com>, "Kumar Kartikeya Dwivedi" <memxor@gmail.com>,
 "Martin KaFai Lau" <martin.lau@linux.dev>, "Nikolay Aleksandrov"
 <razor@blackwall.org>, "Paolo Abeni" <pabeni@redhat.com>, "Shuah Khan"
 <shuah@kernel.org>, "Simon Horman" <horms@kernel.org>, "Song Liu"
 <song@kernel.org>, "Stanislav Fomichev" <sdf@fomichev.me>, "Yonghong Song"
 <yonghong.song@linux.dev>, "bpf" <bpf@vger.kernel.org>, "LKML"
 <linux-kernel@vger.kernel.org>, "open list:KERNEL SELFTEST FRAMEWORK"
 <linux-kselftest@vger.kernel.org>, "Network Development"
 <netdev@vger.kernel.org>, =?utf-8?q?Maciej_=C5=BBenczykowski?=
 <maze@google.com>, "Lorenzo Colitti" <lorenzo@google.com>, "Martin KaFai
 Lau" <martin.lau@kernel.org>, "Chris Mason" <clm@meta.com>, "Ihor Solodrai"
 <ihor.solodrai@linux.dev>, "Todd Kjos" <tkjos@google.com>, "Carlos Llamas"
 <cmllamas@google.com>, "Kalesh Singh" <kaleshsingh@google.com>
Subject: Re: [PATCH bpf-next 1/2] bpf: align syscall writeback behavior with
 caller-declared size
From: "Alexei Starovoitov" <alexei.starovoitov@gmail.com>
To: "Yuyang Huang" <yuyanghuang@google.com>
X-Mailer: aerc
References: <20260515071504.2054786-2-yuyanghuang@google.com>
 <2e08eb1ca27a9a2f8ad29e1c24f779b579621b0a648589f7044799d91c5e00f5@mail.kernel.org> <CADXeF1GVtFHNZJb8xwFh6aadR=H19S+kja8rF185XB5=fg0D0Q@mail.gmail.com> <CAADnVQ+42+Th6OFGq2KawzvyKUAykazb4fXh2_uqss-T+R8VCg@mail.gmail.com> <CADXeF1F=7RcxAsW38w_mpFeKCLxTAh5p_XYHd=x2Ru+oajoN3Q@mail.gmail.com> <DIUR88219HWQ.26T4D7ZX8CNTC@gmail.com> <CADXeF1E-QpKj-37T5ghiycXrVR_YN72fOc3M4OQg-Arz7JNjsQ@mail.gmail.com>
In-Reply-To: <CADXeF1E-QpKj-37T5ghiycXrVR_YN72fOc3M4OQg-Arz7JNjsQ@mail.gmail.com>

On Thu May 28, 2026 at 9:44 PM PDT, Yuyang Huang wrote:
> On Fri, May 29, 2026 at 9:03=E2=80=AFAM Alexei Starovoitov
> <alexei.starovoitov@gmail.com> wrote:
>>
>> On Mon May 25, 2026 at 12:21 AM PDT, Yuyang Huang wrote:
>
> Thanks for the reply.
>
>> Ok. This is fair. 120933984460 is indeed problematic.
>
> I'm glad to hear we agree that 120933984460 is problematic.
>
>> Not really. Your patch adds checks to what looks like "random" copy_to_u=
ser()
>> places. This thread is clear indication that it's not a "robust architec=
tural path".
>>
>> True robust path would be to wrap every copy_to_user() into another help=
er
>> that takes uattr start pointer and size, does extra check, and
>> returns something like ENOSPC (and not EFAULT),
>> but that would be a significant churn.
>
> I agree that the truly robust path would be a proper copy_to_user()
> wrapper instead of doing the ad-hoc check in the current path, but
> indeed, that will be a big change.
>
>> So I prefer a minimal patch that add single check in bpf_prog_query()
>> that checks that user space supplied buffer is large enough for attr->qu=
ery.
>> If not -> EFAULT. That would be better than overwritting.
>> One can argue that partial copy_to_user() in __cgroup_bpf_query()
>> should still be allowed, but I'm against partial and
>> inconsistent queries.
>> query.revision might seem benign, but if we do it for all copy_to_user()
>> we better return ENOSPC to differentiate vs EFAULT to tell user space
>> to fix itself.
>
> Okay, I understand the preference is for a minimal patch to implement
> the fix. Just to make sure I fully understand your suggestion:
>
> Are you proposing that we add a single check at the entry gate in
> `bpf_prog_query()` like this?
>
> ```c
> static int bpf_prog_query(const union bpf_attr *attr,
>                           union bpf_attr __user *uattr, u32 uattr_size)
> {
>         if (uattr_size < offsetofend(union bpf_attr, query.revision))
>                 return -EFAULT;
>         ...
> }
> ```
>
> If we implement this, I want to confirm if you are okay with the
> consequence for legacy cgroup queries (e.g.,
> `BPF_CGROUP_INET_INGRESS`):
>
> 1. Before 120933984460: Legacy userspace compiled years ago with a
> 40-byte `bpf_attr` layout (ending at `prog_attach_flags`) regularly
> queries cgroups passing `size =3D 40`, and it worked perfectly.
> 2. With this check: These unmodified legacy applications will now fail
> with `-EFAULT` on newer kernels because they pass `size =3D 40` which is
> less than 64. This means all user-space applicaion is expected to
> "fix" their code when along with the kernel upgrade.

I bet you fixed your android setup long ago,
so all of these "but what about backward compat" is getting annoying.
Whatever kernel patch get merged android won't even backport, so enough of =
it.

> Is your preference to explicitly fail these legacy `size =3D 40` cgroup
> queries (breaking backward compatibility for them) to avoid "partial
> and inconsistent queries"?
>
> If we want to keep these legacy queries working safely (without
> failing them and without causing memory corruption), we cannot use a
> single check in `bpf_prog_query()`. We would still be forced to plumb
> `uattr_size` to `__cgroup_bpf_query()` so we can conditionally skip
> the `revision` writeback when `size < 64`.

Replied earlier that I don't like random checks like this through the code.
