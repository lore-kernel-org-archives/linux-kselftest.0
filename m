Received: from mail-wm1-f50.google.com (mail-wm1-f50.google.com [209.85.128.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C626D2ECE93
	for <linux-kselftest@vger.kernel.org>; Tue, 31 Mar 2026 02:15:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.128.50
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774923351; cv=pass; b=rLOKZ3Ed2l87zCq5pX/yBORSRoq0+uH4yQYgJ17sBPzA19CYTTAsaQcGVrW8G6FN5oGc3xvxHOtkcanXrRAnmAWGfcHW2rrrt4UkNqrwCyVFzZVS/h7YFSj2RqRUEPQTV1v8dfAQ9Q81HAIlGgfXY0452YvQrr/Cdo4TcA2ZKf8=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774923351; c=relaxed/simple;
	bh=e0taOFPk9pRrZOMXMg5pNgX6/KZMkL5Kiz5hCRQwDlE=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=MXF+lS51ElCJoTzh0v0WWpWj9L3EcY8LlvK1tpmSlwi1VrvzZtBZB2l2s0/pChj7c7OUxBzMaRocSA2uqmoO4d5FBKy1sIB3qgEwvCI7WIBcV9WDGnQgG3gKKn2OcBQseShhlhGVUC3OZ1Z7jjkW/KbBfdT9ih1g5pu4IEGX9Vo=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=P8Qv4mpM; arc=pass smtp.client-ip=209.85.128.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="P8Qv4mpM"
Received: by mail-wm1-f50.google.com with SMTP id 5b1f17b1804b1-4887ca8e529so948175e9.0
        for <linux-kselftest@vger.kernel.org>; Mon, 30 Mar 2026 19:15:49 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1774923348; cv=none;
        d=google.com; s=arc-20240605;
        b=kc6qCC/66W7jTvxjFap24zmkI5Ob/tQteolqVqMbQ/B1AWC0T7+OFTDAmv0B3jKZp3
         WX1xkyj2zXgWGzN2rpwNHq4fCFjGijD+SqV8CQM0EpZYsK/Em3JasQb84eDwtdyH66I+
         Vz8N/E9KaKdkaekZ5QEohogpOxXfj1pJVkhCi1UP2oPoLY1URfPHoMHvLxAu2tfVgIw2
         HR66KhSrKDNBTzRgK60mJ6UGgtjJzTm2PKkyL0ufO1D6KMXQ+Zzu5pYMPyOrQMr4lRAs
         hn35iJH3MfdEmhE4LiRr62c/olR7RkzXvGz0okvXhu9NDlDLFl+Uk+EsrHsGUayLpBHp
         Ca8w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=NGbcj7/O32XC9B0n0P8wfIZz2fpYJ0S+OYxZ8TZMqEk=;
        fh=qJ0y2W/b4pId078I0c+CiTZ3h4CZwENqljt2ONIme9A=;
        b=lU5C+MFrSOVGT09azMPS3cc/BopT1SKFA2wprzCC3Ai/7IQy65bzl+xJ1MvpqJ4S7v
         7AtHL7svVhUi2FW0zRqLhP5+jMOOHsUBL87HbPMBXHGcAcncqAehccqo49y0g65Pbarx
         JliL4EaNNPvwpDZSM3GF45zidK2ldNcactnBV0h+dPV9mgMrtylqlnWNZ8fIZ8tTkZVL
         nOehH5J1EXfJgyXBBedDTGax9lAjOdM9IkHp76aN4bqC05gUPDLO9UgL2ON+2boR3vPW
         IwrjcYSIMhnVr4tAEkmIGCVPN766jQmmfss0lUhihuacT79YKl4WYt4J8jiNlS3M+sFU
         vauw==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1774923348; x=1775528148; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=NGbcj7/O32XC9B0n0P8wfIZz2fpYJ0S+OYxZ8TZMqEk=;
        b=P8Qv4mpM3dPhZtDP1AMVJVXUOxTgiTiFpTgjr773e9+Qc4jbGBKPHirXmaokZJRNNA
         HklSvmE+A6D76M7vTlISqfRxt4onFNBdKyETvC5KoEhGSKX603KKO4QlZEnh+acThrIw
         xu8zOWGlywVUap+WUklULc5yQNHt5XFa8pmCN9Qr2qP7MNuyIIm2UWzxA0UcYWa3w1Aw
         XCahaIZf0xC69IfitHGatN1Dyr6w4BAzVzQsHcnCZZYm9LABKU59+SxmA/NndYb2YuFk
         8S7g5boyS6CB6tFgEUjTEk0ie7GCVr8guMWXuRiMrC0O0c1MJdp3vFwa165e8SzD4ce+
         81NA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774923348; x=1775528148;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=NGbcj7/O32XC9B0n0P8wfIZz2fpYJ0S+OYxZ8TZMqEk=;
        b=jaBN69L2O9SS/TseKn6qWirsznt7SFYHpMkziXX/QHud4XX1hxGyMWLmdJEPHlAbt4
         in9ojTr0CFesrlnpufF0d0EI7UVmOq54pCli2l6RiIV4wcvWVnLp+vJw92fK5WaKKCwK
         JuzWOSS2JFGv1NPRgDe6YjAjk0SgxPQ/fwb+l11Z56t5mZ7CcJdjZt4+rs1A3Rw7fcJj
         GDRy3i5aazinTbBk05QVMpvgfiqESeoqHIYOZ8jqU1WiIuV+WE5AWDZMY/5jONPBhwGl
         DcppCOlH+h5GBWgdGwqcqr5e8UBICT6UdhLAy+K4xKFS5iS3eNKKe5pLtBl5T5pNPFJL
         fZdg==
X-Forwarded-Encrypted: i=1; AJvYcCV7OnTFbovyo0FwWqijTNKT9/cZo1UXotZM8QQ8vD9yF4DoJ6CYz2MJK3qW/8QMcZS9fp0uhVgFyExKrV7t9Os=@vger.kernel.org
X-Gm-Message-State: AOJu0YzuA75FbszjBMUZYpcCeMfErc8+67SvLEuzEM7wRz9cD1EtlSdK
	IyBP+KUs+EW98A8c/YU4n3ADRZjDC9i808M8i19a5JjBl0yGZvi7ylhICtlB1Fu90jzX8Ku6dWT
	tVImVZk894yUv4fi3ObPuurOVnqsQp3k=
X-Gm-Gg: ATEYQzzHxddKcmoK8tkwma1jEnZdvx66KMketYHxMRykOLb7OnhPKBl2/a9wkQagl3J
	e6iNvq27MsH6avGrzbBX+Cjldc/hM7DsylrR1YUWGstWgqSpqw6/X5EJj2UKLltdbXW8A9RWWXh
	tyKzJ0KjM2SoTdExxkoDYNmQ32Z4yDeibB7QSkhlUD+e+xPBw/Z6BshMHabne1L4Hli8DwIbb6A
	CCf9ezlTjDJm1zcIp6dmNphjW5qtLRdJnjFIp6FRza8g2/U3qrGUWbAfa0WHhqhxei1UGDX8iWO
	xii0njoo07Gb5IOymqIN8N7nUc/MvXhDECMEMYvZ4IxOdDeeazXe11417sMttHMLo7SGJIbSu1T
	0s7CY7DBq3Mg/bSsDydO+kaZ9fg==
X-Received: by 2002:a05:600c:45ce:b0:486:fbc4:8fe2 with SMTP id
 5b1f17b1804b1-488783d259bmr24422685e9.15.1774923347961; Mon, 30 Mar 2026
 19:15:47 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260329124429.689912-1-hoyeon.lee@suse.com> <20260329124429.689912-2-hoyeon.lee@suse.com>
 <CAEf4BzbA=drhPq9tsD1Dj1wt_P0q4LNtuNSM96CWVuAVBrKrvg@mail.gmail.com> <CAK7-dKZMjW0t=CSkRYuUudnAY--BviwVBJCGH11g6csTKBwRNw@mail.gmail.com>
In-Reply-To: <CAK7-dKZMjW0t=CSkRYuUudnAY--BviwVBJCGH11g6csTKBwRNw@mail.gmail.com>
From: Alexei Starovoitov <alexei.starovoitov@gmail.com>
Date: Mon, 30 Mar 2026 19:15:36 -0700
X-Gm-Features: AQROBzBItDozKecjsmVbqQiv5J8kLw0iEL8T8k3hPxJs3zMBJYDlbcgxGILNxoM
Message-ID: <CAADnVQLN4mNZWMsf0+1999JuzRgjAV19CoC0Wd638v+qhPUy0g@mail.gmail.com>
Subject: Re: [PATCH bpf-next v2 1/2] libbpf: allow address-based single kprobe attach
To: Hoyeon Lee <hoyeon.lee@suse.com>
Cc: Andrii Nakryiko <andrii.nakryiko@gmail.com>, bpf <bpf@vger.kernel.org>, 
	Alexei Starovoitov <ast@kernel.org>, Daniel Borkmann <daniel@iogearbox.net>, 
	Andrii Nakryiko <andrii@kernel.org>, Martin KaFai Lau <martin.lau@linux.dev>, 
	Eduard Zingerman <eddyz87@gmail.com>, Kumar Kartikeya Dwivedi <memxor@gmail.com>, Song Liu <song@kernel.org>, 
	Yonghong Song <yonghong.song@linux.dev>, Jiri Olsa <jolsa@kernel.org>, 
	Shuah Khan <shuah@kernel.org>, Feng Yang <yangfeng@kylinos.cn>, 
	"open list:KERNEL SELFTEST FRAMEWORK" <linux-kselftest@vger.kernel.org>, LKML <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Mar 30, 2026 at 6:49=E2=80=AFPM Hoyeon Lee <hoyeon.lee@suse.com> wr=
ote:
>
> On Tue, Mar 31, 2026 at 9:33=E2=80=AFAM Andrii Nakryiko
> <andrii.nakryiko@gmail.com> wrote:
> >
> > On Sun, Mar 29, 2026 at 5:44=E2=80=AFAM Hoyeon Lee <hoyeon.lee@suse.com=
> wrote:
> > >
> > > bpf_program__attach_kprobe_opts() currently attaches a single kprobe =
only
> > > by func_name, with an optional offset. This covers only the symbol-
> >
> > have you tried passing NULL for func_name and specifying absolute
> > address in opts.offset? Looking at the code I don't see why that won't
> > work, we don't enforce func_name to be non-NULL
> >
> > This NULL will turn into config1 =3D 0, and offset will be config 2,
> > which I think is what you want to attach by address, according to
> > perf_event_open documentation
> >
> >                union {
> >                    __u64 bp_addr;          /* breakpoint address */
> >                    __u64 kprobe_func;      /* for perf_kprobe */
> >                    __u64 uprobe_path;      /* for perf_uprobe */
> >                    __u64 config1;          /* extension of config */
> >                };
> >
> >                union {
> >                    __u64 bp_len;           /* breakpoint size */
> >                    __u64 kprobe_addr;      /* with kprobe_func =3D=3D N=
ULL */
> >                    __u64 probe_offset;     /* for perf_[k,u]probe */
> >                    __u64 config2;          /* extension of config1 */
> >                };
> >
> > This is the same approach as with uprobes, btw.
> >
> >
>
> I tested this after your comment, and you are right. For PMU-based
> non-legacy attach, func_name =3D NULL with opts.offset =3D <raw-address>
> already works today.
>
> However, this does not work for legacy tracefs/debugfs kprobes, because
> the tracefs event string formatting still expects symbol-based input.
>
> So for v3, instead of adding new field to bpf_kprobe_opts(), I'll documen=
t
> that offset can be treated as an absolute address when func_name =3D NULL=
,

This is fine.

> and make legacy path support the same raw-address form as well.

but not this. libbpf doesn't need to support legacy interfaces.
