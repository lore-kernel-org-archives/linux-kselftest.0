Received: from mail-dy1-f178.google.com (mail-dy1-f178.google.com [74.125.82.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9DDB83438BB
	for <linux-kselftest@vger.kernel.org>; Mon, 22 Jun 2026 18:18:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.82.178
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782152307; cv=none; b=H71FUyI7I7N06m9TVckmzY/3lxwP+HgH89qQJvzTg3KOQqHTzM1fJVX3vz+zng5ItEdEWiE5fjsAtZZvzRDVVS0xp5E4Eg8klaFUVARskwIXk1XJ1vIsE9ltsRDgsjDvp0rkEM5uhUfKy92KlroBORRtI19plZUvbd/4U6+mnjk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782152307; c=relaxed/simple;
	bh=BPs0E0Sg6JSePXrntU9OMcGGkos5S/qvj3HCBcV4X7Y=;
	h=Message-ID:Subject:From:To:Cc:Date:In-Reply-To:References:
	 Content-Type:MIME-Version; b=hIEpw++3vBb1pUVrOLi6gVBItk/1tUSzuRpbWHZIsrcJxHtX3vP6k6aZiKdqjk7uSh6meIcIWSRXQ3TUPawa2eJ4UfnLPbpRWnM1mDg1v7arocY3OTg4AaE8TwHXpgj378O/HPhCR0fqQ8HK4qeH3uxZ/8npGstoo8T3ySeKviQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=TD53GlfJ; arc=none smtp.client-ip=74.125.82.178
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="TD53GlfJ"
Received: by mail-dy1-f178.google.com with SMTP id 5a478bee46e88-30c55adcf66so152024eec.0
        for <linux-kselftest@vger.kernel.org>; Mon, 22 Jun 2026 11:18:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1782152306; x=1782757106; darn=vger.kernel.org;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:from:to:cc:subject
         :date:message-id:reply-to;
        bh=8UVsKCK9kHa09INWL8qmL+CtZFk3R2BbfKJt8UkBDd4=;
        b=TD53GlfJXNQrbigVFEhwBvEkYKlxBUSicqZ9kNsYrEGy10ELYPKboOlhoB9GxevsXB
         v371mFBVez4m2lP3AFmC/WnF41GMe1P0doQ062fUIUP+lTF9ylYroXnOlYxPsGOn2Hwn
         8h4LKcwmBYopmARtpCYeGoUrwr3LVi7kiKr3HXFbTBwGcfIF7VrscB9e4IhVuSb37qDU
         Rdg7v1vV2zzu2dL/erFAGJUg9HAWS7AO6ODrY6QmigJbNPCNXrZ1UlARbNF3HNkx2HeT
         28zEDme0Q9QKJpU/o3cU7epWMl96/UGUQpamM3ge4iVUoj4rM2VmIjpi3bjXLuiBp2ZE
         beeg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782152306; x=1782757106;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=8UVsKCK9kHa09INWL8qmL+CtZFk3R2BbfKJt8UkBDd4=;
        b=lqgPPYZzhGPqoCRvooxgE+9fQ+kZLUYXdE1aEmJ/TyKLhHVJJgsFaF7LQyW9yIEYE/
         4RmPjlQjPB7O5ArbCP92Mg2tyPJq+PQ3/I4TAokG7kGf7bMLdmgWO5Yh+/TpfawFwZHo
         IT7Q2XZ8RGjEd7xG/mhNhBC5mbM+7l83nEHvNct1qLU1bE7rrAlo4R1TQF/RbB5a05en
         fkfAOufejKmRW/zkU0OUf/mAoHL9P+VHslCpieDQVUU0vYcPKGMjRBYPSrq8VvyljosJ
         5Gx7d0N2t8Ma3IEnnflF7oeKe499V5wzinDUmUgypUesu1DJrxpoQ8YxheOIC0D/OKGX
         +C4g==
X-Forwarded-Encrypted: i=1; AHgh+Rpiba6podq25TR64FfUAsRVpkvgaRShTcvUjS7QsXc1RYIqoeWogJrr7tJ47G4IFqM7X59snhQBK+meIYtV+Js=@vger.kernel.org
X-Gm-Message-State: AOJu0YyjFhILtyQfuPMUuveR7pRT7jkrBdIJWodPQ+2YWA9Z8i3UpiT4
	QMXUqJjTEHcpSJlbviwMivESiNxnn82VDHRr9O4pK4zvWyaANHN1Zgzz
X-Gm-Gg: AfdE7cnvJgA5fHa8fra3b8Gs+r3ZJCndxYx/0D8Id3wgNogCWf3qsvocNUl5KHRnaOs
	mOGQROvQ7l3yAOY7Px3zFhZjN3Fi5V5MWPa4yeaBbUQtWZ9p+jWrwOKcF2RozjErPHjSVmzXOnW
	B5VeyE2NO5kDoZRHElAVCjBndtEAbicnkzn+IY0fdmQ009UQXN9/z0QCzLr1Qu5O0tA1b8sOxJ1
	qW5OMAHeRLJSHCf1j+23xO9tydjUb7+XEn8SjjJtMz96RHAF0YjXo4nSysGhSu3S/RslWaY5lf4
	OZUb7lhbjRfZX7nCxMsHnE6N701sv16fhqt5e+06mhuQQUPQtaCag6Aeku00Pshe573GjduF2Op
	NGLEXylQ8heY1ZI1XbCXmmvj6UKnkFClBwD3pzHBKRcpkU48ogkbl5DF/JxPeDxf+BeuRf9msCy
	5gHZw0j4xHNnRVhkEJZ9U+H+9ISw5KpLONr7QMuJXRp9UU+uOhV66eGjViSHtlZE3BUog=
X-Received: by 2002:a05:7300:3c15:b0:304:ccdd:594a with SMTP id 5a478bee46e88-30c06d4bd52mr13258922eec.5.1782152305404;
        Mon, 22 Jun 2026 11:18:25 -0700 (PDT)
Received: from ?IPv6:2a03:83e0:115c:1:6e2:c699:67c:63fe? ([2620:10d:c090:500::1:5387])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-30c1bd8d75csm10223340eec.15.2026.06.22.11.18.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 22 Jun 2026 11:18:25 -0700 (PDT)
Message-ID: <ea4cec012200acbca4a772898967bdc6f5f6aae1.camel@gmail.com>
Subject: Re: [PATCH bpf-next v3 1/3] HID: bpf: Fix hid_bpf_get_data() range
 check
From: Eduard Zingerman <eddyz87@gmail.com>
To: Yiyang Chen <chenyy23@mails.tsinghua.edu.cn>, Jiri Kosina
 <jikos@kernel.org>,  Benjamin Tissoires	 <bentiss@kernel.org>,
 bpf@vger.kernel.org, linux-input@vger.kernel.org
Cc: Shuah Khan <shuah@kernel.org>, Alexei Starovoitov <ast@kernel.org>, 
 Daniel Borkmann <daniel@iogearbox.net>, Andrii Nakryiko
 <andrii@kernel.org>, Martin KaFai Lau <martin.lau@linux.dev>,  Kumar
 Kartikeya Dwivedi	 <memxor@gmail.com>, Song Liu <song@kernel.org>, Yonghong
 Song	 <yonghong.song@linux.dev>, Jiri Olsa <jolsa@kernel.org>, 
	linux-kselftest@vger.kernel.org, linux-kernel@vger.kernel.org
Date: Mon, 22 Jun 2026 11:18:22 -0700
In-Reply-To: <20260622073011.423657-1-chenyy23@mails.tsinghua.edu.cn>
References: <20260622065246.414380-1-chenyy23@mails.tsinghua.edu.cn>
	 <20260622073011.423657-1-chenyy23@mails.tsinghua.edu.cn>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.60.1 (3.60.1-1.fc44) 
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0

On Mon, 2026-06-22 at 07:30 +0000, Yiyang Chen wrote:
> hid_bpf_get_data() returns a pointer into the HID-BPF context data when
> the caller-provided offset and size fit inside ctx->allocated_size.
>=20
> The current check adds rdwr_buf_size and offset before comparing the
> result against ctx->allocated_size. Since both values are unsigned, a
> very large size can wrap the sum below ctx->allocated_size and make the
> helper return a pointer even though the requested range is not contained
> in the backing buffer.
>=20
> Use a non-wrapping range check instead: reject offsets beyond the
> allocation, then compare the requested size with the remaining bytes
> after the offset.
>=20
> Fixes: 658ee5a64fcf ("HID: bpf: allocate data memory for device_event BPF=
 programs")
> Signed-off-by: Yiyang Chen <chenyy23@mails.tsinghua.edu.cn>
> ---
>  drivers/hid/bpf/hid_bpf_dispatch.c | 3 ++-
>  1 file changed, 2 insertions(+), 1 deletion(-)
>=20
> diff --git a/drivers/hid/bpf/hid_bpf_dispatch.c b/drivers/hid/bpf/hid_bpf=
_dispatch.c
> index d0130658091b0..09b45c40d84f0 100644
> --- a/drivers/hid/bpf/hid_bpf_dispatch.c
> +++ b/drivers/hid/bpf/hid_bpf_dispatch.c
> @@ -299,7 +299,8 @@ hid_bpf_get_data(struct hid_bpf_ctx *ctx, unsigned in=
t offset, const size_t rdwr
> =20
>  	ctx_kern =3D container_of(ctx, struct hid_bpf_ctx_kern, ctx);
> =20
> -	if (rdwr_buf_size + offset > ctx->allocated_size)
> +	if (offset > ctx->allocated_size ||
> +	    rdwr_buf_size > ctx->allocated_size - offset)

Nit: imo, this is harder to read, I'd define a variable to hold the
     buffer end position, update it using check_add_overflow and
     then compare it against ctx->allocated_size, e.g.:

  if (check_add_overflow(rdwr_buf_size, offset, &end) || end > ctx->allocat=
ed_size)
      ...

pw-bot: cr

>  		return NULL;
> =20
>  	return ctx_kern->data + offset;
