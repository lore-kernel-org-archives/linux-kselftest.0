Received: from mail-pg1-f179.google.com (mail-pg1-f179.google.com [209.85.215.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DA49A218ADD
	for <linux-kselftest@vger.kernel.org>; Sat, 20 Jun 2026 02:48:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.215.179
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781923702; cv=pass; b=tU8mC95ET3g/IMzO4d/UrH/yjd5QdyXLr2wepD6iQBvFJA30fp06BWnc6w9lQAKCuKi8rr39V8c8E+OxwbUl7wSsj5D/lygRKYe8OTg6GdHeZXLSf5yLLzJJrDkq8I8BBkh000lVx47lXxYZfZS5wfTCB5I9E4gp6l33lEhuF28=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781923702; c=relaxed/simple;
	bh=Rbg/9D2p6GpBvrY1UMJqOy+ElyFK+3pnY/Q7CDuq/GU=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=WpN3k6HNRTgXVeTwYKN91WCB0MaIJ6zmyQHox2s9Kz0bEcApo/o/LwvvpwPh7caHAHjp7Faz8N5DgWV8TLD1j8HKHq3jZrVIL/jwD5IzrA1qVWcFT4pT9s5Bvkx3FpmZXUd2z0tEfN2xnZHB1GQxDjM1QzMTAd/gkD39xVDfXlQ=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=iJSnCCOB; arc=pass smtp.client-ip=209.85.215.179
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="iJSnCCOB"
Received: by mail-pg1-f179.google.com with SMTP id 41be03b00d2f7-c88e3e82d81so1261681a12.2
        for <linux-kselftest@vger.kernel.org>; Fri, 19 Jun 2026 19:48:19 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1781923699; cv=none;
        d=google.com; s=arc-20240605;
        b=Z0ZTS4E1Kei/CvXx2HuZyN+JHtw2KlHVfA0Me33FpktIZw7UZdB5vLoi6c2Fa80/of
         T+AZOoBsHZ8Ltyw5UJoddiGaOybVNtZCOzjMjAFeoexTDJDOUX+jsOmQW6KLeFn0MxjW
         jk6JaTsPTHuP+Fc08keBDmN9X3QyWe7yhcQt52iyOrWWH41NX/0rxSYMJb+4R80au12N
         WwHB/Xemm24BxbGvb/5XjwgAh0+qD8plDLB0GhXAMDfDKEGOao4B79pfMCZiv/ks9QV1
         6LQ+ZcE+UwiaOb7AaS+x/q9xO/36YvWH5RtqGOD7frpq+8LpH7SsSwAlmxy84bhIB0Cq
         SssA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=IMog6yoEoQ/G09JDykgX7Q2v6LAP6zMnUEkcv+/q5pA=;
        fh=qGNigM58CiozvHFsf8EUoLx9hhOGjQIetKhcdXww1XQ=;
        b=dLSf0X377yQrvBSnrtdsauTIp3yN0m86xB3PCrxBXTPwOVS2l0T1Doo9/tQ2kNL0qR
         Fb9BEsx1E+zYJNuKNVOv0e4/tP52IuGKEdMLGO9MBDazTBISjtSxJqBW+VUGEacNu370
         Q5lUZlsq0KDS+BznAm2o9tZhqBnkcfxpk1JR8f6vpA6MVmTNR8eBnNxr6F1dW8KS5qaV
         zYokZmGASp4qy9z0jZSYYxIVDEcGLaVrg5NMUT3S3l/iEBbp+OyIUZ5DMooxD8OCoXJl
         DneKXRgNrxK1T6hF3NfBjMK/KX2m3BxjIqVFMFtDW0jNRFb8Y/6iRHfJWDxMZxFi5iPQ
         nwMQ==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1781923699; x=1782528499; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=IMog6yoEoQ/G09JDykgX7Q2v6LAP6zMnUEkcv+/q5pA=;
        b=iJSnCCOBrJJs23xs53Dx0T4m1lQoRApRehkE6yv4enWe/UVSEOk00SqB1CoaHH+PgF
         tUKx9+i3mxRJpMS+sy7kNYOGfDYe0rSnEVTYc44k72aZq+ViIc4uMnGY4F/7SBSgp5c6
         0mcNQf/daT2OAOHZg5TIcPWH1SWhlO/sReZol4RtwKJZLUeJun+txmPD0M9vteG22sWF
         PLPl1V17i7gzdKa22iKovISn4ncG131M38fF5fCe1w/ByW7nZ5PEAoH3AIBK18fUW4eP
         mCUKkafx4vVERMt8UledMxtJxToFw1IixoQ+DxpOqeeGXXJ4va6xIWgQGDj6wbxtLxqz
         30EQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781923699; x=1782528499;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=IMog6yoEoQ/G09JDykgX7Q2v6LAP6zMnUEkcv+/q5pA=;
        b=TkGdIsafJFm6fTNUI0KikxO8X5vcUmBhvzPjFFSAlTYhN5aaCqeYm5dOQeeTS0/QTy
         laALyr4HLJMPW5PNxgKd2lEtcs7ZzlbLnAdfNz3Io5F7VwV/F3S7Jl9Y0TGkXifVM8lY
         nzXLQuz/cPaIZ/a5ZsvUMBBdrU9oIoAvymEsOrw9sKLqP3yizhQVsP4JLCqrw/rWI/Oc
         4J7zc7EAK7X1AeJVMRNCg/Yyl1HOfsKQGqHx9dWmm0r7PZpG23RIOnkF7mUQIW6UApMC
         hAX8T50qFu74gWXFutjYllQELbDcH5lyV1soplQdPEUwR407j2vnHex9gIVt7+50Inia
         j0QA==
X-Forwarded-Encrypted: i=1; AFNElJ9SlrKwY2Gqe0HdqzbmWU7HCHaT/sIqkw2Kilcr8YDuB0QlK1qO737k6vARHIUWe4Nlz+f3OJT9nAfEB8K8Y/4=@vger.kernel.org
X-Gm-Message-State: AOJu0YyDjlwFA9QcdpQ5Nzxs/7n0D5rcjP1RIIAfJ8pJUW0QgTpn/Mrd
	tOjBFtX8E1+tdJ/jdKpnTtMIpBTAvI0WJPscXokBZBrQrO2Nv6H9O5SxVnc2TaQZSSmCWrBZjSj
	hjRO05cjKp8/6y+u1ZniR9aMxt6H/t5c=
X-Gm-Gg: AfdE7ckqaqvXK0C9mZT7v7YJ1ZJiAUUkdYUqdC8bOD3t8bEqbMK535dOyICOG6qkIny
	6SqqIs0HHOYx9EUFBVBkPBRLaQt4QwiWUmGq8TfQnQvvno8bFn9GrhnXxeWUSYjuTx+hpzAi/MO
	XX0/adEGllaGs018M+oDiN04pRErQCXmNz6RGn2xqckFlqKTJuFBRzKN9iGmpDheMDP2TspkQNM
	xH8v5acPXe9afgAhmHAFIpck2aZ9PlMnG0FhyvP1hTj4XhO2q1wr0e8iseprRXK0MePpoNrc8BS
	nT8OC/5JngNNgn20LI86GRDom1rEc8sbufZpksR01JBAHn7VdwQspUCfTtYkI1EEsf8N0a2Yle4
	DlZlG6QNlNrpoMZ9zuw0Sla5J
X-Received: by 2002:a05:6a00:1251:b0:845:352a:a207 with SMTP id
 d2e1a72fcca58-845508aba72mr6261855b3a.34.1781923699092; Fri, 19 Jun 2026
 19:48:19 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260618-bpf-ringbuf-fixes-v2-0-33fde039ddf3@kernel.org>
 <20260618-bpf-ringbuf-fixes-v2-2-33fde039ddf3@kernel.org> <ajVKM9tJskwg9OFa@krava>
 <130931685c8b2064325fc65a856ecd810c8a6b5c.camel@gmail.com>
In-Reply-To: <130931685c8b2064325fc65a856ecd810c8a6b5c.camel@gmail.com>
From: Alexei Starovoitov <alexei.starovoitov@gmail.com>
Date: Fri, 19 Jun 2026 19:48:07 -0700
X-Gm-Features: AVVi8CfPILgC_aJbPc7RvcEnqlaV04eO7hG5z3eafsoNlcrC-2DekZ7AbCtJxFU
Message-ID: <CAADnVQLuNSE5AM6Cqzs4yDFrhTyD=j-y5dfya3dLwk3si9v26w@mail.gmail.com>
Subject: Re: [PATCH bpf v2 2/8] libbpf: ringbuf: Prevent NULL callback crash
To: Eduard Zingerman <eddyz87@gmail.com>
Cc: Jiri Olsa <olsajiri@gmail.com>, Tamir Duberstein <tamird@kernel.org>, 
	Alexei Starovoitov <ast@kernel.org>, Daniel Borkmann <daniel@iogearbox.net>, 
	Andrii Nakryiko <andrii@kernel.org>, Martin KaFai Lau <martin.lau@linux.dev>, 
	Kumar Kartikeya Dwivedi <memxor@gmail.com>, Song Liu <song@kernel.org>, 
	Yonghong Song <yonghong.song@linux.dev>, Shuah Khan <shuah@kernel.org>, 
	Andrea Righi <arighi@nvidia.com>, Xu Kuohai <xukuohai@huawei.com>, 
	Andrea Righi <andrea.righi@canonical.com>, Bing-Jhong Billy Jheng <billy@starlabs.sg>, 
	David Vernet <void@manifault.com>, bpf <bpf@vger.kernel.org>, 
	LKML <linux-kernel@vger.kernel.org>, 
	"open list:KERNEL SELFTEST FRAMEWORK" <linux-kselftest@vger.kernel.org>, Andrew Werner <awerner32@gmail.com>, 
	Zvi Effron <zeffron@riotgames.com>, Andrii Nakryiko <andriin@fb.com>, 
	Emil Tsalapatis <emil@etsalapatis.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, Jun 19, 2026 at 2:12=E2=80=AFPM Eduard Zingerman <eddyz87@gmail.com=
> wrote:
>
> > >     int *len_ptr, len, err;
> > > @@ -240,6 +260,9 @@ static int64_t ringbuf_process_ring(struct ring *=
r, size_t n)
> > >     bool got_new_data;
> > >     void *sample;
> > >
> > > +   err =3D ringbuf_validate(r);
> > > +   if (err)
> > > +           return err;
> >
> > as Emil noted in first version, this seems like overkill, could you
> > just check sample_cb !=3D NULL before it's actualy called?
> >
> > in [1] you mentioned you plan to add some feature that won't use sample=
_cb,
> > it'd be easier to review/suggest the solution with more details on that
> >
> > jirka
>
> As-is it appears that the simplest thing to do is to error out in
> ring_buffer__new() and ring_buffer__add() when callback is NULL or
> when overwrite map flag is present.
> I checked our internal usage for then __new/__add functions,
> and it seems there are no cases when NULL is passed as a callback.

Even such an early check is probably unnecessary.
A valid callback is a part of api today.
In general we don't add defensive programing checks for NULL
here and in other places.

Sounds like there is a follow up to add callback-less api.
Let's see how it looks. If there is a need to check
callback nullness it's better to discuss altogether.
