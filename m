Received: from mail-qt1-f179.google.com (mail-qt1-f179.google.com [209.85.160.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 44C49376BD1
	for <linux-kselftest@vger.kernel.org>; Fri, 29 May 2026 04:44:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.160.179
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780029900; cv=pass; b=EA5yiFMfcqGfeXkfUffTbGTZseS6/g1LM/2b0cYrctUsRGZs9xJWYwuJbPdcauqr3UtebBPGNVum9/Xg/JFHaU4tcNf9PQhMcsjOgGRGHTnNHZ/klh6iWxTQGZq1C6HPOgB+bbML10EyKxUf2AldAz/jKbUk0yA4UR+CdlwB8CA=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780029900; c=relaxed/simple;
	bh=eQP2e/SSLB4Pxhr6C2kldz7+bmcpYvVX3g6PAxO4izA=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=GE0d/qx9ONOKAnAqIrGssrY62QymWApMLrF770oHkMp0/sYRRCavWcH5ZFXOGa+QwOGusJbdLD63iRC1x0jzj/nxLcmlfCu1tuA6o58ILyHxcxMeGGNvazuhbHPWxx2wfm7Rtgrim21QdR0G48Se7kvHVPGhnKzXeVLJQZ+UiXY=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=MOKyv5qB; arc=pass smtp.client-ip=209.85.160.179
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="MOKyv5qB"
Received: by mail-qt1-f179.google.com with SMTP id d75a77b69052e-516d1ddcdf4so941cf.0
        for <linux-kselftest@vger.kernel.org>; Thu, 28 May 2026 21:44:58 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1780029897; cv=none;
        d=google.com; s=arc-20240605;
        b=NzMFfNLD+SkNyBZMNESDCRg8A+o5AWeW3KxDUBoj9Z+Sv2Fd+QkCq+XzCk79UUjrFt
         6btmbiB+eCFrZTT/3cNOxyS7eKM7+k4FN+trmjiS2Vh+oDKzceAf/F6meyzoEgKFsZX8
         PlDRR+YpCLfOD7kEM0omR0BT5RbvVKk2uxJm6jHhIQZtb4GN+l9U8QHxKfaCT8/iLx+F
         pO5PlWq66/nIPZVe5FmF3nRiN3nGDOcRO2H9zXtIEXP8c0dPxk5VA46FtB/z0SPQPjZQ
         hrPTHeyxuGUfmxmSvWoDOwj1soaOmJHqSxDWUCrmhepDdVV4et9rdFzsTgwbENvMHjBa
         zCfQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=CeB6crplwXIBRzpCdZlH9G0V46TK/YkUIeRLLxmd+lU=;
        fh=tTMFU/PLGvvnccUCzsV4cnP286PLUYj3xztTasTLtZk=;
        b=AzKyd9oNSJXX4iIe7JDpwvdEBuFpBrW2z8qtGwZUqVBRUbtQ2rxZrYQlI7pvkspUoQ
         E50TQIVKFnDscNWrmvyaUQ8BTmacpxk/0907ShoHIxOUcc0lVPXdHPppXwY1gKu70kaj
         doT7fU4M8cwcAulz//04c4jskGrh0UksWktu259t88t7kHp4ni7qn/ZovfAPwyABXkwr
         ayCdE7349XzE/+2Ra/IqeTagOy6lp/HGYCc1/1vAPfnH//ULmVMSMcCc76ROVS2O9aHa
         h5vMpL5+HVCNQr3hhuuOZBf0Zj2vbqMbIZzs+Ay+3PnwMgOCZry5fjNJgDzWxHLlxPE3
         bjpA==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1780029897; x=1780634697; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=CeB6crplwXIBRzpCdZlH9G0V46TK/YkUIeRLLxmd+lU=;
        b=MOKyv5qBfjv4HCt2SmfipjFFImdM5broZf7t7YOzLBMto7GTY2z7+QlCpn2lQzfew2
         9mB4Pi+9ykpUcfihDza+3pofT8hJkfI5SrmRpIbHTg8T36OHOJF/zdyo7hLBs+jIH3pt
         ncZVuyMWag8zlPlxNErYIswBIxLHSxZIpBwEGl5foGHCxy5yUO35JvZ5S6F96GMMU7SV
         oc0JbdLn7YTV9hbsoJ5iRWTpYuuz0bZDLGnO7vXDx9ERuWi8WMjACjZlXeJoFwY3wIql
         sy03TLTDAgxPtfquR2OJKb+N7lN0itUY/epr8dJ8i0X65iESQchoS33+x86MyGsT7p5Q
         FVyg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780029897; x=1780634697;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=CeB6crplwXIBRzpCdZlH9G0V46TK/YkUIeRLLxmd+lU=;
        b=bE9oNTFKftQQl7kuHbR/gKHfnz+5R9MuwuZkzwZBnZ5fi5j7LvmR5ifwsc3M/fx+MO
         UAJ9xRyBWqIuIPLog1xWhZhbt7MP484MgdcjTR8Z05rWPxyv7cfH43ofja5J6b2LMeT7
         r/AL8k8o+ZGvHRNRC4IiPzkEiZvkOLTVaSgEL72uxd/NzYKHvQJTQe3QZu5LXhUHOBkJ
         DojkKmSm78WV8aFSkwTKm7n+hUrKGE4K/C+wUMcjtN+xnOEHP/lN/4vjPFRWivEqA2bT
         tshZkbwwgwNyRHeXAkzPTT5Lu7cROn4qdpUY6RBG2/av5CtaNymAP/rWGjxMxDhTX5M+
         m7Kw==
X-Forwarded-Encrypted: i=1; AFNElJ/BQyi0pqD4ZO0Up3iTEdvBJeiSq9kXvYYOcKEUQVNitIN+fY0fdAg02le0SuKy00m/i49YHDPAh8+gIkFUzqg=@vger.kernel.org
X-Gm-Message-State: AOJu0YxmmnqY2L04pLwhVAImu3PI9eTDYDwYvJQ0D151IaCQo5t9shba
	AGWlnBLxRgu13Tq4yNKxd7H4vUufIz5xmo2y5KI07nwRNJtiNap5ncfLV/Jjuqnurj8VYqwa9CT
	m3Adpr4Z59+YV18ekJW0WsdL0tzYYzkEezyhQ1v+I
X-Gm-Gg: Acq92OFJkEi8wXPROjqeUOO1bXaSCXcQ43Qd6pgTahCuyDYDqypbX9NYGlzKykoJTDe
	3E7oLDJBjF9+1BywfCU1iBxUb4YGXe8wdBOVUaBJ41Zgt51RhEvjJzsOSKcRseE+LUYdmA81U1G
	muLKwWfZ9t20BjIIJwuGTaYuTWPd8/65NGZmAYcAtvxjo8kKygHRs5T4DGdQEfCXWAcH9EvZPZ3
	OcXGdbEfnd0QSIz6y6ctb59E8pMRSfmoiC0IH+hqxIarT1ritPGD9snvr5xCATaID8cOCsIj987
	qXrsTXg4sBwRxMeEuKsIHt5tWwNPThKgNmw0nSFiJQKOXwmLg4m9MuoRjg58wEIb
X-Received: by 2002:a05:622a:9d3:20b0:50f:d03e:6482 with SMTP id
 d75a77b69052e-5172dcef32amr4403711cf.4.1780029896687; Thu, 28 May 2026
 21:44:56 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260515071504.2054786-2-yuyanghuang@google.com>
 <2e08eb1ca27a9a2f8ad29e1c24f779b579621b0a648589f7044799d91c5e00f5@mail.kernel.org>
 <CADXeF1GVtFHNZJb8xwFh6aadR=H19S+kja8rF185XB5=fg0D0Q@mail.gmail.com>
 <CAADnVQ+42+Th6OFGq2KawzvyKUAykazb4fXh2_uqss-T+R8VCg@mail.gmail.com>
 <CADXeF1F=7RcxAsW38w_mpFeKCLxTAh5p_XYHd=x2Ru+oajoN3Q@mail.gmail.com> <DIUR88219HWQ.26T4D7ZX8CNTC@gmail.com>
In-Reply-To: <DIUR88219HWQ.26T4D7ZX8CNTC@gmail.com>
From: Yuyang Huang <yuyanghuang@google.com>
Date: Fri, 29 May 2026 12:44:18 +0800
X-Gm-Features: AVHnY4KeGTzWQs0Ti0amBOZL7bylrTP3wH1i0px8sXV1Q7lFoUnTtYhLJT-e-9E
Message-ID: <CADXeF1E-QpKj-37T5ghiycXrVR_YN72fOc3M4OQg-Arz7JNjsQ@mail.gmail.com>
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
	Ihor Solodrai <ihor.solodrai@linux.dev>, Todd Kjos <tkjos@google.com>, 
	Carlos Llamas <cmllamas@google.com>, Kalesh Singh <kaleshsingh@google.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, May 29, 2026 at 9:03=E2=80=AFAM Alexei Starovoitov
<alexei.starovoitov@gmail.com> wrote:
>
> On Mon May 25, 2026 at 12:21 AM PDT, Yuyang Huang wrote:

Thanks for the reply.

> Ok. This is fair. 120933984460 is indeed problematic.

I'm glad to hear we agree that 120933984460 is problematic.

> Not really. Your patch adds checks to what looks like "random" copy_to_us=
er()
> places. This thread is clear indication that it's not a "robust architect=
ural path".
>
> True robust path would be to wrap every copy_to_user() into another helpe=
r
> that takes uattr start pointer and size, does extra check, and
> returns something like ENOSPC (and not EFAULT),
> but that would be a significant churn.

I agree that the truly robust path would be a proper copy_to_user()
wrapper instead of doing the ad-hoc check in the current path, but
indeed, that will be a big change.

> So I prefer a minimal patch that add single check in bpf_prog_query()
> that checks that user space supplied buffer is large enough for attr->que=
ry.
> If not -> EFAULT. That would be better than overwritting.
> One can argue that partial copy_to_user() in __cgroup_bpf_query()
> should still be allowed, but I'm against partial and
> inconsistent queries.
> query.revision might seem benign, but if we do it for all copy_to_user()
> we better return ENOSPC to differentiate vs EFAULT to tell user space
> to fix itself.

Okay, I understand the preference is for a minimal patch to implement
the fix. Just to make sure I fully understand your suggestion:

Are you proposing that we add a single check at the entry gate in
`bpf_prog_query()` like this?

```c
static int bpf_prog_query(const union bpf_attr *attr,
                          union bpf_attr __user *uattr, u32 uattr_size)
{
        if (uattr_size < offsetofend(union bpf_attr, query.revision))
                return -EFAULT;
        ...
}
```

If we implement this, I want to confirm if you are okay with the
consequence for legacy cgroup queries (e.g.,
`BPF_CGROUP_INET_INGRESS`):

1. Before 120933984460: Legacy userspace compiled years ago with a
40-byte `bpf_attr` layout (ending at `prog_attach_flags`) regularly
queries cgroups passing `size =3D 40`, and it worked perfectly.
2. With this check: These unmodified legacy applications will now fail
with `-EFAULT` on newer kernels because they pass `size =3D 40` which is
less than 64. This means all user-space applicaion is expected to
"fix" their code when along with the kernel upgrade.

Is your preference to explicitly fail these legacy `size =3D 40` cgroup
queries (breaking backward compatibility for them) to avoid "partial
and inconsistent queries"?

If we want to keep these legacy queries working safely (without
failing them and without causing memory corruption), we cannot use a
single check in `bpf_prog_query()`. We would still be forced to plumb
`uattr_size` to `__cgroup_bpf_query()` so we can conditionally skip
the `revision` writeback when `size < 64`.

Would love to get your confirmation on which trade-off you prefer
before I send V2.

Thanks,
Yuyang
