Received: from mail-qt1-f169.google.com (mail-qt1-f169.google.com [209.85.160.169])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2D5EA3F6C2D
	for <linux-kselftest@vger.kernel.org>; Thu, 28 May 2026 16:19:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.160.169
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779985146; cv=pass; b=DLOhX9Km7vnVvNQBEH/ECKNF3rQ+fNW6NtAALFv18t+Evq97zuFNoZ6x0OkIox86JCfLmDNXE11+hVhK8f5So2FpLb3E+amxWPzP8Zpe4yrm2YT9TGBLvjKpQcDhoxOeRBGuO2N90q60m/6Xk3STF/QrVNHgnBkkggduMr3cHb4=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779985146; c=relaxed/simple;
	bh=2cE3e8QUtpQIKPo3dwPxuDOlqzE1WmRPLP72+IMItW4=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=SWpjamusLvzhKsZhNdBnM2HmUAkuApDhC5PFTIrw7INoVAXXa8CrgaKUYTs8T9GFXdBAu3ebRKqTYi2EaLKPeyTM3Vfhw/bzqMhqoKvVw/GdfptNd8IqN9Sy69NRrLQTVssUE0JWnkcthqrvCrbHOVzGm8jjZIz/UWnHlBcnvEU=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=La3S7RSD; arc=pass smtp.client-ip=209.85.160.169
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="La3S7RSD"
Received: by mail-qt1-f169.google.com with SMTP id d75a77b69052e-516d78ba1adso6141cf.1
        for <linux-kselftest@vger.kernel.org>; Thu, 28 May 2026 09:19:05 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1779985144; cv=none;
        d=google.com; s=arc-20240605;
        b=E8O9ml545DA+GoHqoJ6aDYoEfmtG96Ed4K50BXzExOVNmwVaEn1T5uPDnWlF5PpgTg
         trJxG3fVcB31YPT28UIl/R60672ICtUVMtQdcGq7d8U1fS58boD5X/Pt2KNPCTf1nIsX
         krAG/aJ+w8Qbh9kn1shp26yoUN5BMu1EyJdEi4jR38fpNnViZ1do6IOr4uNYlQ79+VR3
         g1FpjaF04qkPhjregayr6k+IUCccb3Xz7pomN9G8u4FeMlB/UUOChkPm8I+HRX+pddQ+
         A5ex68wpSelagWn+PLIgb4B2YrKi5Jwqk/zLmvmBGGAhC/UOP5T6SABAE05S+TWd2KGb
         xuqA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=478/AxxorbjxlL+8D6YnRYxtGnmoIrfbdOmlHjfNrLw=;
        fh=ySATlEptAgY18OqP013pMeWXGWcGMbzOStxVBcJrhUQ=;
        b=keUWshSWi93B4Mo00MbZaJ0Ji+JFIfNYUeTUNymYR+vJ6Ym1nocUIi2ltggmkeZjXa
         nZiMotq2XF7cv8S1ew1NC7c7tc7FGtyJhUFz6LoubSkSU7eqvsUXpjXgosFtp6wD4Uaq
         dhwYu//JCtfxl9rnitubbMj7r5GRgMbKOIfSknTxNx4jjPwdnbBS7SrsVo1/cHGJtaqK
         zIhJK0kJs2Y4HODqUDXpPbjY6QivsOdhf9Yo6AHi536gSTREx360n90MzpznxEsL/ST3
         qGio2AfOarXhLmHaP/C+dbesdzHcz9dnlCzmW5clhQTnbzH4egZIT8OGWxkYRUQpbfZj
         KVow==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1779985144; x=1780589944; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=478/AxxorbjxlL+8D6YnRYxtGnmoIrfbdOmlHjfNrLw=;
        b=La3S7RSDJMGaMLw5jnVAqR/vltkQGXt0kscfRO3bsMYYJmvImaOI7uumWRhYD8PHxZ
         LzfrpC9xxbyFQe5k52hu5VTvvHnLrIuPskzNkJ7rP1DRCUG035YnQq8xkBxOhnimhU4A
         jf1S91fK+487OQdzK3V1xEam2avtAqjF/1UxXwF5LPnR8kpYmQfdOQ0vQxx4yhTMGLD+
         n4zB16j31j9ek4G3FYiyE4bAbQ/JwpxPTHTCaBGXp1i2fuU7dp/ZgDc+6Dtegd5HFEy1
         AUAcWyvYMBgln45cs8bqJTM9mYeEr3754CaGoi1Kusdfu5lMXsEyWDe/AWg408dur31K
         ywxQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779985144; x=1780589944;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=478/AxxorbjxlL+8D6YnRYxtGnmoIrfbdOmlHjfNrLw=;
        b=hkZ+6BHwcPt1cKNEzz2FdL/PEDzsByOq+9RYCumSB5/qsCxlKJkVQYeeMjICc8YyO+
         FE6PWM+pYZkLSeie23gG2lsH1tEUs5eKwxUIjaqLBSWrO9avV5HHQaZ/8s2n1ccR/7FP
         g+izSTORyOidTmLcONtv3g20ee9UIGK0dQaaPx6dzfcES24wJbT40l7ZYfYdGGqUP7hK
         3cSsGuXjOK6oCuwa3GIlxBsH9P/wYCjSAbukvwOcWaZjWL0HgCrGTq/+P9+srVn5eUf9
         6QiWBfooMYi7/pwQY/jWlBinrqmjb1u9tKsQ4UEl58LSb9WP9vAWriB0xMRLJoMRIKMm
         glVQ==
X-Forwarded-Encrypted: i=1; AFNElJ9KpysEKJN2o9Y3Gw4Y7rSEHCcgTT4sYsWfAz5piqSmrXMjp2qflMcSqDINWNulTYct3uLrKGBLqqSZ0MThr2E=@vger.kernel.org
X-Gm-Message-State: AOJu0Yx+10yU5QK9uk8kqnPAt05YsoWuSKskiIcdjajMz/jsXEh85YQo
	KQLeKbPZYYTXGXSNpqOt+1zafotq6lxVjCDcsNwxOjh+5T1+eGhm3XS1bC4Fkz9TMxQ7gMDgdCe
	KkclawmofuuWrC/4ek8c0upCRYAoH/GqYhtLQGd8b
X-Gm-Gg: Acq92OHw3Ez5pRFWQ+JMHbBskW8qZkq0qhBQmC8hvT8PAo7d39hZ1postewdGSn+wGh
	OARVuYFUzpskcVdZZekFjMIpTBhK3Trt7YVY+6W/i7Bd+DtUP41N4ykZMUnxDVSx+V9j6UrMbEn
	uR6f7U1oKLTnvzUFNAAmZov0QoOodIfdyQ+1BmKdxEhGUVM7kz3O/ATmW4JzMo9OJm0xzOMTPqJ
	2qp5dmPhdD0dXB4sA7Hb4wjD0xtxjwo7HZx5ciM1bsu3pwnIy5x+oBFphFt1pN6FyByot1MYPpe
	cuHCrXfrEHdcBlwgsJ6Gc5jm91iXjLOixvg+gOdM+cfaqiz9vVcbTETRDTnCcc7tLphq5cEUeOk
	=
X-Received: by 2002:a05:622a:5cf:b0:516:4f62:85ee with SMTP id
 d75a77b69052e-517223b0ecdmr7990661cf.19.1779985142931; Thu, 28 May 2026
 09:19:02 -0700 (PDT)
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
 <CADXeF1EWY0=TyvhFap3iyKdpHNkk5pZuHD-RDnXuqMa5LrNJ2Q@mail.gmail.com>
In-Reply-To: <CADXeF1EWY0=TyvhFap3iyKdpHNkk5pZuHD-RDnXuqMa5LrNJ2Q@mail.gmail.com>
From: Yuyang Huang <yuyanghuang@google.com>
Date: Fri, 29 May 2026 00:18:23 +0800
X-Gm-Features: AVHnY4KqO-LYOyvwglTe5XXMvZnX3bL1FOeWTgsNanJEKjebhIA0UQKFOY71MtE
Message-ID: <CADXeF1EwaZ+a953KOW4d5cU7f2GWiTNn9LKbEgHHXa2XxmXNeA@mail.gmail.com>
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
Content-Transfer-Encoding: quoted-printable

>The fixes tag should probably point to 053c8e1f235dc or a subsequent patch=
?

>bpf_mprog_query() and tcx_prog_query() were only introduced there.
>How come your userspace passes shorter uatter to query newer
>BPF_TCX_EGRESS attachment?

btw, If there is a strong preference for the BPF_TCX_EGRESS type,
specifically, that userspace shouldn't send a size smaller than the
newly added structure when using the new attchment type, I can modify
my patch to limit the fix to the BPF_CGROUP_INET_INGRESS type only. I
do agree newly added BPF_TCX_EGRESS and the existing
BPF_CGROUP_INET_INGRESS worth a different discussion.

On Fri, May 29, 2026 at 12:01=E2=80=AFAM Yuyang Huang <yuyanghuang@google.c=
om> wrote:
>
> >It seems you haven't convinced Alexei in that thread.
> >Attached below.
>
> Thanks for the test program. It proves my hypothesis: you had to
> manually unmap a page boundary to force that `-EFAULT`. The part that
> is still under discussion is whether there is a kernel bug or not. I
> think there is no question about the behavior of when the -EFAULT will
> be triggered.
>
> > To avoid such stack corruption, you should reserve enough space for the
> > query, e.g., by extracting union bpf_attr from kernel BTF vmlinux.
>
> I agree that your suggestion to extract the layout from BTF is good
> practice when writing a new program from scratch. However, our focus
> here is on maintaining backward compatibility for existing binaries.
>
> I think the core question is: **is a 40-byte query a valid request or not=
?**
>
> From my understanding, under the syscall ABI contract, passing a
> 40-byte buffer (at least for query BPF_CGROUP_INET_INGRESS which has
> been stable and supported since 2017) is 100% valid and legal. **The
> kernel must never break existing userspace on a kernel upgrade**.
>
> One example of a syscall that maintains such backward compatibility is
> openat2. The documentation notes it as follows:
>
> EINVAL size was smaller than **any known version of struct open_how**.
>
> If this bpf() syscall want to follow the same way to maintain the ABI
> contract, your `mmap` test actually let kernel return -EINVAL to a
> userspace program that passes a 40-byte buffer (declaring `size =3D
> 40`),  because the kernel unconditionally tries to write to offset 56,
> which happens to be unmapped.
>
> Are you arguing that the `bpf()` syscall does not need to follow the
> ABI contract to maintain backward compatibility, and that it is
> expected that newer kernels can break binaries compiled against older
> kernels? If you believe that all binaries must be recompiled or
> dynamically updated against the latest vmlinux BTF upon every kernel
> upgrade, please be explicit about it.
>
> Thanks,
>
> Yuyang
