Received: from mail-wm1-f51.google.com (mail-wm1-f51.google.com [209.85.128.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6D3B430BBA9
	for <linux-kselftest@vger.kernel.org>; Mon, 23 Feb 2026 16:58:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.128.51
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1771865909; cv=pass; b=pvqmg1g1HovZ96PJMDjD3WuYxJvkNafAuIZAVNKElcI+Pkc2YQm67lZ1r6H2FBiHuWSeUZrEaX7hQtp54Y3Lb4Rk+CheaKF+PuqOpRXIEBWchXiWOIV4mej8aCfOkJtl7KBC1QdWAYqTI+maZ3X89krrCoiiMSnPJ3XWxvBB1n8=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1771865909; c=relaxed/simple;
	bh=8O35ywf3frONs/mR3sh+Q3y4PGU/DxQ4aRR+Ww+VwB8=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=R8NcL3VTVC/NYgOgfBvXnevon5D+O4P6bvRmLMGnwvvZm7RNGn1hgpw6juaBS3TsNiDOxfchL4SjsxgHn+oD2HgGkw5eHInD+VK0KhNqKTiJWYJjbX1nA1v2ZWQfiQDNok4428M6L4waXhGTwRm3wu9zeUwJ9Dc3RgQqNXlcB9U=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=ReOT2Foh; arc=pass smtp.client-ip=209.85.128.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="ReOT2Foh"
Received: by mail-wm1-f51.google.com with SMTP id 5b1f17b1804b1-48373a4bca3so27397375e9.0
        for <linux-kselftest@vger.kernel.org>; Mon, 23 Feb 2026 08:58:28 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1771865907; cv=none;
        d=google.com; s=arc-20240605;
        b=RPoU0HQOztTbhdWXZQCXYdDfyI5i4lvE7jW/jmxry0iI/99UQRFeuVQZbgtV15MIes
         JWDgzlbjliMY64DhOPAFI3tYht9pG2KzwldADHGSTjg5E++JQ+vz0xGZDoWWYJkOomDd
         kKcUPc5j2wRs9vp6zS76dTs08GWEvsPvnYXgs6NvAtqL63CLxakooUs6jnfXTMJoFovL
         GdBUppFRZp7akJuck4g/w7q9tNrCey3W55RfYGoura3egqSm8InM/7j+vDUexyA5d8x3
         6NjCqt037F7vNXJ0u5qDF1wnAcfkvGMyJNNfpzEh0UACpPegGMUS5JlrqviDNaj76V7k
         rFtA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=2/TWRW3byuvHDEl1Ok9W0sAe5kheK+6oFHQAV5r5ghw=;
        fh=//NTNGpEC+T9Cv0PmOjju462iakXnceoqHrX17eyy7U=;
        b=cvnpxf37m2onU7IlIXcLdL6FHfqMJmRg+PEYNQpfs64suneNES7Op2WLz3041FMIyg
         /kCOnIzVvXOnM4p522r8zmR3cYhTT4ykUl6rfh1dKgORzS4SVwqXK4QzK9U/5fHA610H
         3pkIx7MEYbUBwId+ufz2HaMF0UXZtIY4AsQmJfC7I1slVN3Sa97mohV+cfFWOCq32/7p
         wDi22lGOHrHk8Qrz+sgHa4o6LafWcB6DP6GecnFcbXvNe/fZCu3SnblB/KVQGGQsLAIE
         W5QC2MfBnXIIbAFd3UWhaEpLAzfmCYnpPtganIhOctJMIIHv5fEMzZQSGgNeARhxQ8nr
         0eVw==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1771865907; x=1772470707; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=2/TWRW3byuvHDEl1Ok9W0sAe5kheK+6oFHQAV5r5ghw=;
        b=ReOT2Fohn+NNBBbUJpNuYk384nuMXyiNFHVPkouNela1ImQm4WI0vsXiu/VNIdP6kD
         J7zbFeV4UpXHLousND1iqZaEXqe2OhDCBiKP2hwdHCwglau583RVveXojmoNacSCTSgg
         ZO94CAlMcp5+NTKBV46d1C7X0HXfTisdBfXxhXbmsz2f6J56rMF41e0IBOw3uio2OqDs
         Y7lh77oFr7d9wjKEiiren2rJNRHlWDpzGIxplX76MbVhCIwSxuXXXVI62qJg103EPqDG
         aEboVMp0zMDHAPCj4Zefd6zEJ6AWFRPjMVdc8LREdbMEmcphSQEHPfJvAkQk1LmVgffc
         LrUg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1771865907; x=1772470707;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=2/TWRW3byuvHDEl1Ok9W0sAe5kheK+6oFHQAV5r5ghw=;
        b=N/T0Yj7hPEYGwe29hCX28x0nan8FSEP/scwenoRTGLW03Uy8QddvaTPHXCUpvNhc13
         Aw7XgiYOcBkJI/U2CuELaaSnW7Eyh+mwDYhPGbQbS3Y9580OaNS8qlkIKj8ITijkWvXI
         /WUBo4zB/MDSmUqj9ZykM9qMxDnnoWOx2GyRplCchqo14+AqmO6fje2k5rnR/zlCt/iu
         1AW3XtMva4im0/Oh7wcdg0FaHVqk5cPlmggEiOd3ejzilhfcd4Gejjv4WK1t/P8Mf56K
         l+AoYwbNdXQKYAm/RfXDuoCRrU0+hYoZAi0ZcIkMPP62hIbvepUVGDa2DdlgmgeQw2gP
         E9tA==
X-Forwarded-Encrypted: i=1; AJvYcCXrAwB5UHKri3QPUJPnAeZHFQBywY6h1Fjh8yB0h48/om+5uFriw2rg0DUCpGddfPuMITYyuLiZQnxsZtSTEtc=@vger.kernel.org
X-Gm-Message-State: AOJu0YwpFUQ8BSG1pjlv7iqyqLRve7ipYBnkZUNgdPSaEE0HYVKXHR8T
	jGGALrITQJtN7w/MrOoWnntJ+zo5mL6IExyIBfIcaJxKN51wfX6PTIuJ6ZB61V5VlexhusiKrmu
	NdNJ41SzVW5LNsMCX9x3UcHX4rkVX/EU=
X-Gm-Gg: AZuq6aK17/wx2kPEaSB4n3wzfSbdYHT5RH9jspwjHPh/bZrBaFaotVz2J5YqrJyNAd8
	0F8TNt+MEhL3RNYGADRuXagqwzfnqfkxvBRslxSc9933oiSK16LLtAPaUYZbxJACYA9+dqMn6+S
	jd1eiLRUW2lxUk7dYTIj7w6FLgAG0vOcbuEW/cCEqC9C1JH4w4NLZ9Bww9OBFi2MxRjFgerkcIq
	bISIVaIamUQGP2p8D63lG2v0T26mkxrWsIea51tjUcfGNxqAtBGafQDOVWlHYZIRRddDko1JD8G
	XX4YiDq68WNtmq9M8qoy2xbcSVjFD9roPRs2j8VhaDUQa1QbddL5ap+5zRFw1UBNxAjlAUAb7T5
	OOAW6faLzslK9ascTAfU=
X-Received: by 2002:a05:600c:3484:b0:483:7f4e:fef6 with SMTP id
 5b1f17b1804b1-483a95fa4e7mr119430205e9.26.1771865906614; Mon, 23 Feb 2026
 08:58:26 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <692c1f3c4b95e9b8a2bbaf333f4618f1ca1c3cc36fc8b0246b094cd67ed62dbd@mail.kernel.org>
 <20260223104743.37713-1-slava.imameev@crowdstrike.com>
In-Reply-To: <20260223104743.37713-1-slava.imameev@crowdstrike.com>
From: Alexei Starovoitov <alexei.starovoitov@gmail.com>
Date: Mon, 23 Feb 2026 08:58:14 -0800
X-Gm-Features: AaiRm53gF6QRXkPAEJJjxdjdGlfFi_H0IJde1Ne6TGCB64Ct4fuwj2XfM2Yoyyg
Message-ID: <CAADnVQ+okfKHvKzCy9vLQkpevhvHMFXhincqmFOQX9zN_vtQyA@mail.gmail.com>
Subject: Re: Re: [PATCH bpf-next v3 1/2] bpf: Support multi-level pointer
 params via SCALAR_VALUE for trampolines
To: Slava Imameev <slava.imameev@crowdstrike.com>
Cc: bot+bpf-ci@kernel.org, Andrii Nakryiko <andrii@kernel.org>, 
	Alexei Starovoitov <ast@kernel.org>, bpf <bpf@vger.kernel.org>, Chris Mason <clm@meta.com>, 
	Daniel Borkmann <daniel@iogearbox.net>, "David S. Miller" <davem@davemloft.net>, Eduard <eddyz87@gmail.com>, 
	Eric Dumazet <edumazet@google.com>, Hao Luo <haoluo@google.com>, Simon Horman <horms@kernel.org>, 
	Ihor Solodrai <ihor.solodrai@linux.dev>, John Fastabend <john.fastabend@gmail.com>, 
	Jiri Olsa <jolsa@kernel.org>, KP Singh <kpsingh@kernel.org>, Jakub Kicinski <kuba@kernel.org>, 
	LKML <linux-kernel@vger.kernel.org>, 
	"open list:KERNEL SELFTEST FRAMEWORK" <linux-kselftest@vger.kernel.org>, 
	DL Linux Open Source Team <linux-open-source@crowdstrike.com>, 
	Martin KaFai Lau <martin.lau@kernel.org>, Martin KaFai Lau <martin.lau@linux.dev>, 
	Network Development <netdev@vger.kernel.org>, Paolo Abeni <pabeni@redhat.com>, 
	Stanislav Fomichev <sdf@fomichev.me>, Shuah Khan <shuah@kernel.org>, Song Liu <song@kernel.org>, 
	Yonghong Song <yonghong.song@linux.dev>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Feb 23, 2026 at 2:48=E2=80=AFAM Slava Imameev
<slava.imameev@crowdstrike.com> wrote:
>
> I think support for broader types can be provided in a compatible way
> with future annotated support, as I explained in my reply to the v2
> review:
>
> "
>   > so I suggest treating 'void **' as a scalar as Eduard suggested.
>   > This particular sb_eat_lsm_opts() hook
>   > doesn't have a useful type behind it anyway.
>   > I'm less certain about 'char **'. If we make it scalar too
>   > it will be harder to make it a pointer to nul terminated string later=
.
>
>   > So I would do 'void **' -> scalar for now only.
>
>   I changed to scalar in v3, keeping broader scope for pointer types.
>
>   We encountered double pointers of various types that required
>   workarounds, such as:
>
>   int __posix_acl_chmod(struct posix_acl **acl, gfp_t gfp, umode_t mode)
>
>   Adding support for void** alone doesn't address the broader issue
>   with other double pointer types.
>
>   When annotated array support (including char**) is added in the
>   future, it should remain compatible with the scalar approach for
>   legacy (unannotated) parameters. Unannotated parameters will
>   continue using scalar handling.
> "

but then there is no need to relax it for double pointers only.

-       if (is_void_or_int_ptr(btf, t))
+       if (is_void_or_int_ptr(btf, t) || !btf_type_is_struct_ptr(btf, t))

would make 'scalar' a fallback for anything unrecognized,
and we can argue that making it smarter in the future
maybe hopefully won't break progs.
