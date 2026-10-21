Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.218.54
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1792569788;
	b=iMGq4mWo1nFXGeKGU2K4/CO8bnoBSJ6inh1WTkjHGjiwNQ3tS4kIVMYcTSZLt3eEFZIG
	 5BcmQPSqXn4yLE9U+by8SjGraNBT7mhXGriolhc71YxK6D62P8/B2fX1lYTYUSQfcXkeg
	 ejLrRk5hPLyurFiu8o2P3xRmbTG8PI/5OR6nSCUSljOXOiwywYQdzpxybTPx22oSvQELp
	 Lr3xpir46HOTHikS2wy4/zQNm13Hq57MbryzG3ipYSG2X5+4+8S2HX+7Ek6mGddd55dHG
	 fhfTBf5I2f9227uH9DjVk6J9Ojmp1ndFjLUL+JID90TOv5TLZfRLBhBtr6pp21NI52A==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792569788;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=Ej31f8Bh0GlgZxOrxR/CUnpvXclq/RwzuQxNVYI/rTk=;
	b=PnIDF6hz9WthCXWCIj3wk48s4iZ6RCGdZqfwamwgYIztMpoSvxPRClFdjxAmgN8KH8Qg
	 eqVolqvUluCTU5kCVRWC40NX6snTQpX56X93zy794ZijcPXrw2rB1A65aRFOFO7w71AlJ
	 bziaZkd7IeeobQZj6o5YWSrC8qTJkUBSi5bc1dHvdztrY7i8ng5dQOS9GYFfI3vkKbIPS
	 mLeW4vvcP1KWy3vSZvgAVW8G8+TM8JdzzB8z3HYCQ6w+1JpKHqx7PXcTBpC1NzGV+ykrP
	 gWw+C5iU+BKmjLQnets00seP3bvlNlkmYlTcN0aglfY4TrsYeEpSpLy0ax5nATJZaqg==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=g3Cd+Fyn;
	arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.218.54
Received: from mail-ej1-f54.google.com (mail-ej1-f54.google.com [209.85.218.54])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D9A01606A31A
	for <linux-kselftest@vger.kernel.org>; Wed, 21 Oct 2026 08:03:07 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org D9A01606A31A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=g3Cd+Fyn
Received: by mail-ej1-f54.google.com with SMTP id a640c23a62f3a-c45551fa84eso49976266b.3
        for <linux-kselftest@vger.kernel.org>; Wed, 21 Oct 2026 01:03:07 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1792569786; cv=none;
        d=google.com; s=arc-20260327;
        b=hnErDABDkJ+RpqRo++j0c/1zSn8Q2MQXwcuVbfHHNJS9af3CHhyP3slUCDs742HpvJ
         XkL/fryUeAmjn+YSaILnfG7wPAtnWtRARUPTeK7ePVBA+HKAKCPI7y9N1FdT7mM5rl2d
         BGlhHAr0hJnbLsiKyGABEM1BHf604C2N6qdRNPApe9tTFqzf4Ons6xoVvmchZSlBc+rG
         JvfqcnCtXozDXJp2VQP3yq04UK7rI3HddjKP2qYsdQPfH24lKxL/CicQCegTcjSGZM2R
         5E8el93ZEJGJZbwWqtlpvejT8hYpRzmyUxq+fbWbfsWepueHJHbtCYrBy2Bar1wRYGGp
         VnMg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=Ej31f8Bh0GlgZxOrxR/CUnpvXclq/RwzuQxNVYI/rTk=;
        fh=7x7VrHseM19JjDrJdoY+gTxCJt3Al5I8MUznKb0U71k=;
        b=LvgExFYh0M+z+1l2Y5/izM7RXoNoiEOlPbx0dHGH7TlMS1hdsqrw7jXJLfiQq/VbAw
         x5tFO9/WiYKclvOKREIXN3ozNq63u+VG/qTZyPFbqsgXT0TEmtfk/NKQlbXS463CdWqI
         8JdY4ilkFSb7AmgIcGffqX78frePDTMVSOhEY7JWu4G7vWGM4p7MBy+nRd1f6Gvo0QfK
         HW+i4rzmbebdD5ElocZwZzrVCWmH4OHLtPbjMouCCL3jv42OdwxLA1D6Im6I+YQQ3qU+
         lU+HlwaT7xhx8xt07L8+bjdqqrGInnQiJ5aC4TyqhRfZaAuTtL2Y8uGMxux6WXwC3Wu/
         tvow==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792569786; x=1793174586; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=Ej31f8Bh0GlgZxOrxR/CUnpvXclq/RwzuQxNVYI/rTk=;
        b=g3Cd+FynkjVeyyUXzJLNcAv+eWioETg5se1yMO06rcTkAfrTeW3uMCwTxhp4L71vks
         2fGjQFulLIQyYUC1USdVwgm+aUBSF3EyO6nAdRZ9e/ZZMCjHpuux9JdbvWdsJcRye08Q
         tvD6EDZE0Z8NSWkGsYF99+VT6s18mBAQFsbXdB81eKTjwQXmEdam7c1NpiUds9qVX/V+
         k6/fpi8UquptukobWIjCFeHUClcloAcGUY/k9yRT1rBbTgDgjWVtAODD0fR3UxUr1nXM
         1hxDg7mbZp/V2Ocg1VA7A+AH49WYmDcxTKh6/DKw8we+NlparSmzs2YXhgcjs8FempQt
         R1lQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792569786; x=1793174586;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Ej31f8Bh0GlgZxOrxR/CUnpvXclq/RwzuQxNVYI/rTk=;
        b=X6oah/0d1gphFUkHQRDT5cTRXdiZl9kYB88suAHN2XjzNAvO11h81dC4HT/8KknCp5
         AxASnfS9ESdCThIxtEVC6IJjOCZdzo0EXSfoLvrX5P41301wOCECWkDmw4aoXt7B5XlS
         0STMJd6C5yKngNUYcHBhBhr+AdNJdUIFOAtYZ0A+uySCSwzSFz+r3R7vFfPlqrvrpQ9w
         EEJVg3efLfc8oXYPgM/Dy1QGY83FaWOojxu9fEVTRnwf/ycWEU2AhwLmMuJ92CVzK6q8
         cKxEVW44eSJqfCMw7kcDni/MGRB3o4NBt1RWS5ZGuaifKBmxhVfTyOEm+ljh/9BQTd7G
         RIRQ==
X-Forwarded-Encrypted: i=1; AKwUvBzmCSCYQQrxFiOm1jtkKap0mdjimspN/QEDbJ84Iy7Sfhl7z9M38UGfiGWG0zyWah51MT7Aqo+MnO5fEI7TaRU=@vger.kernel.org
X-Gm-Message-State: AFq9FYLJaliYoXc+v3LYyg7jBhDBQN7PfMgAD3Kpm0DY11FjlI4Hifkn
	m1v2wsLl6h7A+rNMAY6WLfS0SvzJ4vDyzCv0LTuiUzTG9mdeFIUJWSpzT7vZkuCmO6WrLZCn7ca
	YnbBv7XwvI/ZlgQsxVMhnzWzuw39V1Ic=
X-Gm-Gg: AYBFou38PLNg3aY+mQtKK9OO19FNWexfnB+a8bs08dPsGw4tDotfi7Nj0UEsYUtu5M4
	/tftVvkm11xwhfaBL1aUlQXAys3KkWTWiD3FI5cgJCgPVGUnwNnuYFH/z5DfuiQYnovuEfPRgR3
	qXcJpeQ87INIy5H6FwxUWSDO26pIIwpA2h6TOuzmbTp6+yFw1mcFFXk5WpZnEmDTTJXAW3jpOns
	b51z4gBGsDrxfhf4LoVo23vgzPLGZC0PXO+W+SfkESMmJDcN1yUjr4ZoG/nrNJj3BVdf7MH6rCu
	5B6tXglYv0s7zHXW5rspsNN5quskfQkue0vKEidHQw/+nmLtGxOCwWJGHrRocH1mhWhJPjN5TBj
	3rYNh6t2TpAVpvwGYiaCwav6wYdnThrSnY3FuGlvndYlA9JL1ym57u3tLtMwwFoeu33uH
X-Received: by 2002:a17:907:2dab:b0:c31:8441:35ff with SMTP id
 a640c23a62f3a-c467977fc1amr128101666b.48.1792569785669; Wed, 21 Oct 2026
 01:03:05 -0700 (PDT)
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Post: <mailto:linux-kselftest@vger.kernel.org>
List-Help: <mailto:linux-kselftest+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kselftest+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261007174203.37071-1-bestswngs@gmail.com> <DMA2R8KIUPO2.SR26IDI6VG35@gmail.com>
In-Reply-To: <DMA2R8KIUPO2.SR26IDI6VG35@gmail.com>
From: Weiming Shi <bestswngs@gmail.com>
Date: Wed, 21 Oct 2026 16:02:27 +0800
X-Gm-Features: AclHuK-B2UJm3TNMWcVkqmeDjUYIvMQv03wgwI23bq25rlqm3v0pnRffiE9A14E
Message-ID: <CANgPUi3Ow2Y_W_-v93yOz2TF-Qa=omZf_VuwbMuv=itc1tUYhA@mail.gmail.com>
Subject: Re: [PATCH bpf 1/2] bpf: Validate stack arg reads against caller state
To: Alexei Starovoitov <alexei.starovoitov@gmail.com>
Cc: Daniel Borkmann <daniel@iogearbox.net>, John Fastabend <john.fastabend@gmail.com>, 
	Andrii Nakryiko <andrii@kernel.org>, Eduard Zingerman <eddyz87@gmail.com>, 
	Kumar Kartikeya Dwivedi <memxor@gmail.com>, Martin KaFai Lau <martin.lau@linux.dev>, Song Liu <song@kernel.org>, 
	Yonghong Song <yonghong.song@linux.dev>, Jiri Olsa <jolsa@kernel.org>, 
	Emil Tsalapatis <emil@etsalapatis.com>, Ihor Solodrai <ihor.solodrai@linux.dev>, 
	Shuah Khan <shuah@kernel.org>, bpf@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-kselftest@vger.kernel.org, Xiang Mei <xmei5@asu.edu>, 
	co+eada64ce90ecebce@bugs.sh
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Alexei Starovoitov <alexei.starovoitov@gmail.com> =E4=BA=8E2026=E5=B9=B410=
=E6=9C=8821=E6=97=A5=E5=91=A8=E4=B8=89 08:03=E5=86=99=E9=81=93=EF=BC=9A
>
> On Wed, Oct 07, 2026 at 10:42 AM Weiming Shi <bestswngs@gmail.com> wrote:
> > then read a slot that the caller never allocated or initialized. Async
> > callback verification also starts at curframe zero, so subtracting one
> > to find a caller can underflow the frame array.
>
> Sync callbacks are broken too and this patch doesn't help:
>   *(u64 *)(r11 - 8) =3D r6;
>   r1 =3D 1;
>   r2 =3D cb ll;
>   ...
>   call bpf_loop;
> where cb() has 6 args in BTF and does r1 =3D *(u64 *)(r11 + 8).
> The slot is written, so check_outgoing_stack_args() called from
> push_callback_call() passes. push_stack() copies stack_arg_regs[]
> of the caller and the load in cb() gets the state of r6.
> set_loop_callback_state() marks R3-R5 as not init, but stack args
> stay readable.
> At run-time bpf_loop(), when not inlined, calls cb(i, ctx, 0, 0, 0).
> x86 JIT reads arg6 from r9 and arg7 from the stack frame of bpf_loop().
> The verifier thinks it's a map value, but it's garbage.
>
> No helper or kfunc passes more than 5 args to a callback.
> Reject callbacks with bpf_in_stack_arg_cnt() in push_callback_call().
>
> > +     if (!vstate->curframe) {
> > +             verbose(env, "invalid read from stack arg off %d without =
caller\n", off);
> > +             return -EACCES;
> > +     }
> > +
>
> Only async callback can get here with curframe =3D=3D 0.
> With the above it's rejected earlier. Drop this check.
>
> Add sync and async callback tests to patch 2.
>
> Also mention in the log that
> commit 4286f5deee14 ("bpf: Validate outgoing stack args when btf_prepare_=
func_args fails")
> closed this hole for the first call only.
>
> pw-bot: cr

Thanks for your review.  v2 sent.
