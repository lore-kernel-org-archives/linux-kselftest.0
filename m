Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.218.54
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1793754316;
	b=TV9R2gWn/y8K7iYJ8x6fDbBBTCH9leaB491Nn2UIX/zYa+g1IMpyLTvAzg2NC+eqP+8U
	 n+nYLfLyVGM7po0uh5LGQglbfWxD0Lz/VYKn6nGCA7O+72la1N4X7HqX8vDiVustVpIpX
	 y+V0XT4kd4O7O8Vd2p6a6MLw/NTcSc9BgxomiUCuXMz0knQ8Wm+msbU5ueKD+TUd53ZDK
	 lluhLXnxE1QJh5nILaGdKKz1nZKdCtLl0SMHuBb8s7SWZNOKPE/vUPEuYnVvtcH+ejyQ8
	 /zZM45PR7SpQn9J7JlfVEnhI90zlec3zy9gfjBuiTjtvQ3kkbGSO5LRyfnuhjAjeqtw==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793754316;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=GGVgNCMMS0dFIobhgfKFI81188J1mL3nz/OKckiJVo4=;
	b=fVZWFYkjCC1/XUe07mpLcSJkzcwT/K3H6bDVShJFBi9gLSUdvuupDrqL+d9KBy5wg6cG
	 GOkCUuvMjeb1kotqxybh9x1UywHXrYbWB5cqm5iyrQKr9Wpu9BVMyjAlyezwizwoG5FDW
	 jR05piVuDJLRrqeOxn6Xb3xQPdJBBGdaCp/7welqUXSnkpC1Yx91l7Z8/N6WkwRt3ZPyf
	 q49cSxpKr0es16O0eAek2rSNbHAHX0fkpcHGBPwoAS6iJgxRBax93tbR95DQ6V4T+vLUX
	 G2H4d1A6JlhlhzmTc/pW2DLIvqtgmbOpirVJRrkMwCYh6dWwpvVXLvrmihL3WQwTlGA==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=google.com;
	spf=pass smtp.mailfrom=google.com;
	dkim=pass header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b="NmCY6l/h";
	arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.218.54
Received: from mail-ej1-f54.google.com (mail-ej1-f54.google.com [209.85.218.54])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1A9C6606A32C
	for <linux-kselftest@vger.kernel.org>; Wed,  4 Nov 2026 01:05:15 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 1A9C6606A32C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=NmCY6l/h
Received: by mail-ej1-f54.google.com with SMTP id a640c23a62f3a-c4203bbb1e9so27698966b.3
        for <linux-kselftest@vger.kernel.org>; Tue, 03 Nov 2026 17:05:15 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1793754314; cv=none;
        d=google.com; s=arc-20260327;
        b=TaQ28twOlGAIBvMfrOFtIs9yQ6KF7rw6+OHuIq+SnyaL73vU0309rQWbG50/RhevPT
         zjRAJErbL+SLReo0BWvSxZODLOZAwOuE5bh4vV961rAujGclP/BJZRMVuCtj106wclET
         PFthK0ZXUrTX+KxItOwLmWwYybz32dMSGG+DYzCFdnqYgj2+XTElMiDZhWIOoeVautWl
         /lLUa607m7WxkXJ+B7wVZ2UJ2nz4I+y6oLHPaORxv1a9ndwXo7n6Be4YaRtnCNLv2rMQ
         IHWr8XFunQ6ZXTrlGZ84lwLN5YktyjfB302HNK1DYHMHSihMNJgUPHpIg+uIrohKv+yz
         +o+g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=GGVgNCMMS0dFIobhgfKFI81188J1mL3nz/OKckiJVo4=;
        fh=ExeH23BToRtV4wp+Tbjxookb0mYFiB8CCwKFJ3HpuQ0=;
        b=nJilC6PESa+/d9ifz879oBo1dCvDO6KRZBX3sr28omvl6c1kZkXK7fBHQvBqL+vi6k
         v2Z+LkLp381J/JR1/D0wrgLRCgiQWrrBfb/778JQWqxvwZIMkPtqx/q63Xu6WrqLNTKo
         EgJZO4DLqM8Vcoi2SaExh60k00IyvfbCJ1wJM0hja2c12Z+KDd2Hy9ZQqkjuLw4lN4XM
         OyD6rWBQM8QXxBTgKY23YsrZdHmXoBXy0x9K8hS3JppxFAnWJjRgEmD7WvN9BBaybR2D
         5GponHGLNXlzn02XwsK8J6tOnvtBE+PvIOxL2SAKz1SGm7UqnwJhfAH2+4hGNuOGsiPW
         4GUg==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20260707; t=1793754314; x=1794359114; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=GGVgNCMMS0dFIobhgfKFI81188J1mL3nz/OKckiJVo4=;
        b=NmCY6l/hddhLIayqwx0pWhDlzky4zOFriG2Pdv4bVgKzrRIN/6DXrKq8SeIFpFSDzG
         OSms2h9cDJSkVBH5/IkifIVYnfvh+hsyQJtRrGsZdUmtb2ziewUHbbsX1RP1CEZB5HxX
         iy51pExN69DyKyexFvTHkYAxYP21gKZD8XowMLSFZiekG7RpaJCHxS4fldPWq/wG8Dtt
         kOM/cipylAMQawMEXaxMxu4+TRBFfLAxSQw9WjmITlds8lBIpEAlzKgdz84Ey9gExnv5
         /B1iiJxBuoY8in0DZjwRakIl1gpv9h2omGVHDsDWWmXteA1WCj/AkvnaACWyEIR7eDwF
         HTvw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793754314; x=1794359114;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=GGVgNCMMS0dFIobhgfKFI81188J1mL3nz/OKckiJVo4=;
        b=aJz4jHsUvIilPRkoauSMOXIIHjLEfhUwu9O6ec1tfvtr4LprtidCT7BgpXOAMCEQzC
         iByqptBS3nmlCPyjQi5Fq2SeCS5ufYvzd/JrO5L7IRE9AtWUx0iNtj5fWnkaT+e86L0u
         dT2vMA5BoGIzu24SuSnQGes5Ep7VvDBvAF4II+29siChR2Nr6PJeN4BMwFbaXVq25run
         pow/KvwR9fH3ZJ+TL+6BDzqLRK5e8eeTOT16r2lhi0ko0+Qtz3TBHJ5K/32NXbpdqein
         UWQlXQzBJxwqBILMk3igxBHaNmaQEo3AbjkDnDRF60MJmqx8MX2ejC5Hri0EfH6oi3g0
         gvZA==
X-Forwarded-Encrypted: i=1; AKwUvBwbFzFPrORUz7TRJ7B8i1GJdMAc3P44m0dU+qh6uceA0HCGHzS4Tp3whC0RgbTxxUglpNiObfcazFU/slj+GDc=@vger.kernel.org
X-Gm-Message-State: APuU4Z+KNZJueSlKqu/LYzdL3x+mcWt1lHNh+f/nSUv+lalkp29nrlzk
	6pF7VDPeqgeQUZYJOx0gAfYLcN8MPjE+9W4aI+xcZtV4AwpPcweOkmvIQvhjKvRJnm1eceKD1kh
	A3S2FDgUZked/4wXyPBuPl1SejPLjjR+XCk+SFOvc
X-Gm-Gg: AYBFou2xCtCwXMNu2mvUeUHczjw+TFgHmNTwczU5exEALfx/I1zzdPFTCMhGfnoHQu1
	+GV3rjzpIaPzx5kzE8fVA2VNWrkhWW9bctMFLclsuBbt/qVpOob7ANtJMBdF9f32wwHqLplcQwy
	CEwDJRdJFoazudwSzDZvQ7P5qlG6sdaK6fS77pi9VZR+b8j3dChUoxm00IxWDIGN3oDK6J1YAMZ
	8+mcCnWHhbndfFcdmjoLl00sZ92nijCsAuP3/06Eboj2zpXrKy5XWkjg59fnPi9Tgo7iNJbGT8T
	8oMpc2ftJm7Bd8lsT7f9GY1z5WGTbhPjJfXe0KFN6i2ckohNwlYagzyBRv/4gDFcR13ltXWw42s
	pZZe4UWvD7cB8gXvDFqFuJEByIf3RIAlv1osLAbjhFqqEkYQJ3ZaI3ZPj5HlI4ISzu68GdCI=
X-Received: by 2002:a17:906:c145:b0:c46:7ec3:fdfd with SMTP id
 a640c23a62f3a-c4ca7a1c3ccmr1392142066b.14.1793754313888; Tue, 03 Nov 2026
 17:05:13 -0800 (PST)
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Post: <mailto:linux-kselftest@vger.kernel.org>
List-Help: <mailto:linux-kselftest+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kselftest+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261023001603.560210-8-wusamuel@google.com> <20261023001603.560210-9-wusamuel@google.com>
 <CAEf4Bzb--Jzz696u057G9_CgQN7zf6ksvoL80KJacKO2CorsnQ@mail.gmail.com>
 <CAG2Kctojb7xiOqTmwWqoAKFaNUECjOzXVc_t6KbG13Pqm2dbng@mail.gmail.com>
 <CAEf4Bzbs8F1DPBz=WXVTExrrNjzvaFsi4L+HEj+zbUTpPSTX5g@mail.gmail.com>
 <CAG2KctpSTCyWQHgJ8GyFEhHPdFawUa6zy0g7rkfCcujJRN6f6w@mail.gmail.com>
 <CAEf4BzbyqPC=RQGWEdpkqu1WDQ2_S0H8pZU2i=_gLuSDQtpFbg@mail.gmail.com>
 <20261030153528.0d5113e7@pumpkin> <CAEf4Bzbw6hZ3T6uO-ah7c0+K9_kc+k32hV88YFP=qPnHos+-AQ@mail.gmail.com>
In-Reply-To: <CAEf4Bzbw6hZ3T6uO-ah7c0+K9_kc+k32hV88YFP=qPnHos+-AQ@mail.gmail.com>
From: Samuel Wu <wusamuel@google.com>
Date: Tue, 3 Nov 2026 17:05:02 -0800
X-Gm-Features: AclHuK9b_Pt7vf67g62PZ8vH_eaq5fO461r38gdQA-3gsipu-4DIyrTVCZocpdU
Message-ID: <CAG2KctrmAVo-jC5zHURvx9-V_Wu4U8PctxEevycV+zq+6GngUA@mail.gmail.com>
Subject: Re: [PATCH bpf-next v2 1/6] kallsyms: Add KALLSYMS_QUERY ioctl to /proc/kallsyms
To: Andrii Nakryiko <andrii.nakryiko@gmail.com>
Cc: David Laight <david.laight.linux@gmail.com>, Jonathan Corbet <corbet@lwn.net>, 
	Shuah Khan <skhan@linuxfoundation.org>, Randy Dunlap <rdunlap@infradead.org>, 
	Alexander Viro <viro@zeniv.linux.org.uk>, Christian Brauner <brauner@kernel.org>, Jan Kara <jack@suse.cz>, 
	Andrii Nakryiko <andrii@kernel.org>, Eduard Zingerman <eddyz87@gmail.com>, 
	Ihor Solodrai <ihor.solodrai@linux.dev>, Alexei Starovoitov <ast@kernel.org>, 
	Daniel Borkmann <daniel@iogearbox.net>, Kumar Kartikeya Dwivedi <memxor@gmail.com>, 
	Martin KaFai Lau <martin.lau@linux.dev>, Song Liu <song@kernel.org>, 
	Yonghong Song <yonghong.song@linux.dev>, Jiri Olsa <jolsa@kernel.org>, 
	Emil Tsalapatis <emil@etsalapatis.com>, Nathan Chancellor <nathan@kernel.org>, 
	Nick Desaulniers <ndesaulniers@google.com>, Bill Wendling <morbo@google.com>, 
	Justin Stitt <justinstitt@google.com>, kernel-team@android.com, 
	linux-kernel@vger.kernel.org, linux-fsdevel@vger.kernel.org, 
	linux-doc@vger.kernel.org, bpf@vger.kernel.org, 
	linux-kselftest@vger.kernel.org, llvm@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, Oct 30, 2026 at 11:42=E2=80=AFAM Andrii Nakryiko
<andrii.nakryiko@gmail.com> wrote:
>
> On Fri, Oct 30, 2026 at 8:35=E2=80=AFAM David Laight
> <david.laight.linux@gmail.com> wrote:
[...]
> > Doing a system call for each symbol is probably fine and scales nicely.
>
> Yep, I agree, for BY_NAME case it should be totally adequate. And I
> agree about not needing to do full count, just whether there is more
> is good enough, good suggestion!

Makes sense, thanks both. Nearly all symbol names in /proc/kallsyms
are unique (~99% on my test VM), so I'll have v3 keep the kernel side
simple and let userspace apply its own duplicate policy via one-by-one
pagination: KALLSYMS_QUERY_BY_NAME takes pos (0 to start) and returns
next_pos across all sources (vmlinux, modules, ftrace, BPF JIT, and
kprobes). The kernel peeks ahead one match, so in the common, unique
case a single ioctl() returns the symbol with next_pos =3D=3D 0; when
next_pos !=3D 0, userspace can step through the remaining matches one
ioctl() at a time. libbpf does that and still fails the load if the
matches have different addresses.

Paired with a prefix flag (KALLSYMS_F_PREFIX), the same lower_bound +
pos/next_pos also handles suffixed symbols cleanly since they're
sorted: querying <name>.llvm." (or "<name>." for .constprop, etc.)
lands directly on the contiguous suffix entries in the sorted vmlinux
table and userspace can choose to step through clones via next_pos.

[...]
> > You'll find that _IOC_SIZE() is used in many places.
> > Amongst other things it can select between 64bit and 32bit compat struc=
tures.
>
> I see the trend to stick to fixed sized __u64 and __u32, which allows
> to not worry about compat. I'd go with that (we have used that
> appraoch extensively in BPF syscall and it has never backfired, as far
> as I know)

Ack, I'll update v3 to use __u64 fields throughout. There already is a
precedent for this, and it is simpler to not fill holes that __u32
would leave.

[...]
> I'm intending to fix PROCMPA_QUERY's embedded size (so that to
> user-space it stays the same no matter the evolution of PROCMAP_QUERY
> interface). I really think we should start with embedded size zero
> here and have size embedded in query struct itself. This is another
> thing that we've been doing in bpf() syscall for a really long while,
> and given how dynamic and complex that syscall is, we had a great
> success in building and evolving API in such a way that user-space
> code doesn't have to care all that much about multitude of different
> versions.
>
> I'd really-really want us to not have
> KALLSYMS_QUERY_BY_NAME_{V1,V2,V3}, it's just a pain for user space.
> The evolution logic for versioning is simple: if user space provides
> too large struct, unrecognized (by kernel) fields should be zero. If
> user space provides too short struct (for initial version we can
> enforce minimal supported version from the get go), then we just not
> touch any fields added after that size. That's all there is to it.
> User space, on its part, just provides its knowledge of struct size,
> and then kernel will implicitly assume zeros where appropriate.

Ack. In v3, I'll update KALLSYMS_QUERY_BY_NAME and
KALLSYMS_QUERY_BY_ADDR to be _IOC(..., 0), and so the sizes live in
the structs (size; sym_struct_size for the nested struct
kallsyms_sym). Sorry for the back-and-forth, David. Also, the nested
kallsyms_sym needs its own size anyway, which _IOC_SIZE() cannot
carry. That keeps userspace free of V1...Vn command variants as the
struct grows.
