Received: from mail-qt1-f178.google.com (mail-qt1-f178.google.com [209.85.160.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C705D42314A
	for <linux-kselftest@vger.kernel.org>; Thu, 28 May 2026 16:01:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.160.178
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779984105; cv=pass; b=oDO2p0dOrdFI5dU7r3Cgb+4fopdjrtIiDX6LXD33xTIi+J0w/YVzZqxcToL3+Um0RoKU9YiH2G5Xfdpq1T9RYfBrOoBfE4rTMvRwUCfQ0homHqYPIYV/prwS1UR7VFhZDfL6zqd4pizHGhkVmHcSON+JJsYHc/INXLfckR8xPT0=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779984105; c=relaxed/simple;
	bh=HoRv3ITsVYotYbByUgMqXQNPFv0UOt3EzvZpSuUdf5g=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=XBdcRgrG/m3ZJPa/cx+ysY4fRX1k4o1Z8ulRwQb9yosMSBri8BFt6ZQd3k6SRf4lt1BXWyZP9JpmjhQMtxo75pEIf12fde8H8ljypUA64EK1ugT43iYOoHqjXE/GhRIoAmeF09TAbtFJOAY98igYGdHplcXVL1kcOo8yaRts1o8=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=OubxF/dp; arc=pass smtp.client-ip=209.85.160.178
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="OubxF/dp"
Received: by mail-qt1-f178.google.com with SMTP id d75a77b69052e-50e61648f10so68511cf.1
        for <linux-kselftest@vger.kernel.org>; Thu, 28 May 2026 09:01:43 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1779984103; cv=none;
        d=google.com; s=arc-20240605;
        b=hwzyw5pDLIHnSg6CeqelrVha7S03DBPCa7uZ+gmaJsqXCTSELirxwXKLwIIk2efaz6
         hbwFP/XocibMNdtgNgwZOGktSgQts6Md7q8wiiDJzZNGAl6EQZRCgBGRahvbI/4lsxjn
         aNOuwAMhpsewo9mqiZpCmb3mwpCCK0UqtmZPoLjDmeBF4wjSqI5EdC6X4wJWxLp5MYtT
         Ys1QxvV7ofRTiemwtuz2klbZd+1bQslw8LVwMDXYw5nmpEjW46cXPeG87hyEWEUesUhg
         RgztGfSUskhmdEtCXbp/JuatF35MDdIrTrI6nPDgt3PZ+QlAO+Ok5fHjQWsDMwFIkQVl
         AKBw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=BYsaex7hgpDTcxP9G0jUXkwS6mGFhA1uEqhqBMmQ8iA=;
        fh=C+kTfdawevJQFPeWzvbCcpPCZQj2WQOnuZqzdF/46nE=;
        b=TdmmemBTivXxLhLNC/Z4ZhBpXaUJa15jzj7IjjWWD8xahQQyrLfjMdB5PTH1zTrKwr
         b+mTqJcnkJs0VJb4pTpge7uVIAGvYijKMlxhWGa9FuF8OkDzG9IJzI8x9NMxGguDWUzY
         ZMK5Wzngm9fJTQCtYV8opE9mu718eheVljUT4lzqFGyYhNl3xC9kxug0tqZ1FlLni0+F
         wE+d1r5eChQHhIVgbEerfrCUe/5f+xhzel9mp42sis3iWWnWLQ5NSmNJgg9W7w4/awYn
         +QUyTBg2LSydsNwqai4DN27UrW3MEv5ONKPdMw+TPVDeW5/jeCDMXQIJ+h59uUZVjIDf
         QIeQ==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1779984103; x=1780588903; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=BYsaex7hgpDTcxP9G0jUXkwS6mGFhA1uEqhqBMmQ8iA=;
        b=OubxF/dpiSNIGtSl8u1p2BwCpbh97BVCkoEBTL/B2UhHE4j7iVpZGnLQrBIxxwnF3i
         azRiJWKMMtRs6VWCnjFxERlj1judFovja7An4frexBsXWAmeQckbXCo9IxWb/8DCRFYc
         phYl/IOr88ogXcvCtrJ1ZgmfdXHIrkOrQtqxhS9/SQYauiXiS5PYCbsbaBs2Gh0QkWFV
         1qSVivEgbiiKqJvJSr0JnLdT2Yk1PCeKsFQScfG2aqTfKEbeJxFoXKY8dZzebrbTZhds
         AJjjgP48mRAIATUGpYXmpCwGw2LtGUmzkREkU3hS4vJCidIa+7N7RIMCiZEXIRf7JPsb
         qsjA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779984103; x=1780588903;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=BYsaex7hgpDTcxP9G0jUXkwS6mGFhA1uEqhqBMmQ8iA=;
        b=n/Z1tOk7DcgZKZhZJsD8bXu1eIQPKdvQeEZWUPH/oBEygf9f1pIVZc+HmHOnzoe8I4
         omGvuHFmYIUOH9MsUmY1bXRlvFOQTG8alGgE7srxQV2/Odb3ZISE5KD8FLcziB3+pnaL
         FV8z+cJ+hCgbtbCu36EAFzb3b4EbtKLXh7vjQyCqQW2STkxV+IG95bkU4+QpuLC7RHkE
         8TNw3eWUG+5gSL2B3IJWr3GMD0EtjziSy0QrkfLq4iwwanoSxXVfl6MGvaNbEc2WoLlW
         EwM1LVopk4RUjpE5d90amcWoXNWS4YHBYGrfb9eIlWh//Kt9d28M3kCMN7sWuJJB4gmy
         2hFA==
X-Forwarded-Encrypted: i=1; AFNElJ+0k3DDdCCXbp+YH64kBMS+S/crMZK6of4fygNxT+N8lPPyX7WT4rdamlAAiAf5mte4+hO1gfDDAW8/cmUJong=@vger.kernel.org
X-Gm-Message-State: AOJu0Yxp1/7wIv1MrhLdc5+93CRMm2D+Hgp5mXN1rypKfQ+y6yJW1zqV
	GMIPxoamvZVWlOd0jHKsnsrf4kQ57wOqbmjZjerzhzLU/w4PlFyMZlz8wuGuWzIGoHR4X7UhYxI
	RGOb+FGywlYyPKqyptt79lKfhn/21q8TY7ifT//We
X-Gm-Gg: Acq92OF5B0oVUCFddSWs/QFIdc9eHSggr7ZC4NOD4ioS7vnM2wbf3wc9iL7TLR265ba
	AigaDyY5La4dDADITFbvVisLvTjfpn89YTOdJG4wvvmr8ahe0a6gNXT2wSlfKdByQn5HRg7EFrY
	jm/JBDIN85s0T0RNAeqN+Zjj6lIbs8lShG0EANHfYLoqa7Lr2dz5noyL23psmF2lT3rrl+eG7o1
	YIF9mMW0bCy6u1iqSgjGLdESs4NJs1YmDi06m4WWr7PjbtivNUtfOCWDyz4bBPsdaC2KL44ExpM
	q0XatlVZdCqBJQP5ENFesnxaVis5Gdho3Z3clVkdn6Hq368ABCe1d2CQSMsDbVj7
X-Received: by 2002:a05:622a:8c02:b0:516:5709:45e5 with SMTP id
 d75a77b69052e-51720af90damr6978311cf.14.1779984101530; Thu, 28 May 2026
 09:01:41 -0700 (PDT)
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
 <CADXeF1F=7RcxAsW38w_mpFeKCLxTAh5p_XYHd=x2Ru+oajoN3Q@mail.gmail.com>
 <34b18a3e-50c0-4b0c-8ee6-d7a291619231@linux.dev> <CADXeF1HRe=U7aWx2yx6RFZ_uH-mMbdsxMheofr2tMD9wae46oQ@mail.gmail.com>
 <6083831a-dc6d-42e4-a1c8-8b7f6b966650@linux.dev> <CAKD1Yr32VMefwq7Bo6_hmhFrDVsttNFwZJZcaXS4P-ACOwWobw@mail.gmail.com>
In-Reply-To: <CAKD1Yr32VMefwq7Bo6_hmhFrDVsttNFwZJZcaXS4P-ACOwWobw@mail.gmail.com>
From: Yuyang Huang <yuyanghuang@google.com>
Date: Fri, 29 May 2026 00:01:04 +0800
X-Gm-Features: AVHnY4KYoAqz9rUtz8nGlc7zWjwvk4SuqM2I4D6DnfwQvY05GaYxUOEso4as720
Message-ID: <CADXeF1EWY0=TyvhFap3iyKdpHNkk5pZuHD-RDnXuqMa5LrNJ2Q@mail.gmail.com>
Subject: Re: [PATCH bpf-next 1/2] bpf: align syscall writeback behavior with
 caller-declared size
To: Lorenzo Colitti <lorenzo@google.com>
Cc: Leon Hwang <leon.hwang@linux.dev>, Alexei Starovoitov <alexei.starovoitov@gmail.com>, 
	Daniel Borkmann <daniel@iogearbox.net>, bot+bpf-ci@kernel.org, 
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
	Martin KaFai Lau <martin.lau@kernel.org>, Chris Mason <clm@meta.com>, 
	Ihor Solodrai <ihor.solodrai@linux.dev>
Content-Type: text/plain; charset="UTF-8"

>It seems you haven't convinced Alexei in that thread.
>Attached below.

Thanks for the test program. It proves my hypothesis: you had to
manually unmap a page boundary to force that `-EFAULT`. The part that
is still under discussion is whether there is a kernel bug or not. I
think there is no question about the behavior of when the -EFAULT will
be triggered.

> To avoid such stack corruption, you should reserve enough space for the
> query, e.g., by extracting union bpf_attr from kernel BTF vmlinux.

I agree that your suggestion to extract the layout from BTF is good
practice when writing a new program from scratch. However, our focus
here is on maintaining backward compatibility for existing binaries.

I think the core question is: **is a 40-byte query a valid request or not?**

From my understanding, under the syscall ABI contract, passing a
40-byte buffer (at least for query BPF_CGROUP_INET_INGRESS which has
been stable and supported since 2017) is 100% valid and legal. **The
kernel must never break existing userspace on a kernel upgrade**.

One example of a syscall that maintains such backward compatibility is
openat2. The documentation notes it as follows:

EINVAL size was smaller than **any known version of struct open_how**.

If this bpf() syscall want to follow the same way to maintain the ABI
contract, your `mmap` test actually let kernel return -EINVAL to a
userspace program that passes a 40-byte buffer (declaring `size =
40`),  because the kernel unconditionally tries to write to offset 56,
which happens to be unmapped.

Are you arguing that the `bpf()` syscall does not need to follow the
ABI contract to maintain backward compatibility, and that it is
expected that newer kernels can break binaries compiled against older
kernels? If you believe that all binaries must be recompiled or
dynamically updated against the latest vmlinux BTF upon every kernel
upgrade, please be explicit about it.

Thanks,

Yuyang
