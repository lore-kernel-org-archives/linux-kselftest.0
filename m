Received: from mail-wr1-f46.google.com (mail-wr1-f46.google.com [209.85.221.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2B66129B799
	for <linux-kselftest@vger.kernel.org>; Fri,  6 Mar 2026 01:14:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.221.46
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772759680; cv=pass; b=W8Q1Tex2y3IZVINvB/E/0t/E7xbZES5X7vltkFzhs9JkVf0uhQx9JrsZZeqfmFpi9GqWXmQxC1hKixZbRhjYHXtIS7eaYtHpJ61LeXBWO8+MAVcgSYeXdFFlSkSODMKjIPn1YFtPbnJQsuNRtBuc2kp/COIjTTW53MZfuf1hH/8=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772759680; c=relaxed/simple;
	bh=1YLiTEnVHvMgUpdCU7V5v6JTYZoJ3FZdq3r8tGrTvek=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=czh2d2arMN3n6tn/unzOx40JFx5k0o6yufbDBbC9h02rbt+YAV3fTq20tCkS/GwEsrY1Q7vzzu6JwtUgqrcnuu6rC5n3UFgopj7Bfj7N3QHyN62GBFEGBgqUm9KnNN49YAsfVdweli6+1Auv+wU3TD/Lq6FND1i8UFyVKwdLFoE=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=OHgNuuHE; arc=pass smtp.client-ip=209.85.221.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="OHgNuuHE"
Received: by mail-wr1-f46.google.com with SMTP id ffacd0b85a97d-439af00d33cso5462041f8f.1
        for <linux-kselftest@vger.kernel.org>; Thu, 05 Mar 2026 17:14:38 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1772759677; cv=none;
        d=google.com; s=arc-20240605;
        b=hkB/KI9d4UDFC3nVDW5Lo3vVx9Z5zSgmFCZFRGyyHt+UI5jzgIc0TwYlpzozRD5DoX
         sTBb/yeqft7cKpc+8T7lYEg/NTPapu7XPuvh2eagj+x1GB2jfk48oV3uq6jOrsSx9EEf
         JkOfiVPlvXwl1gwWlVWNzYK4d0Np7vNfQnlg8x2NwXy/TG2rVhdY0C0bzbJeCel4u5qj
         aBWXtmx3GsyUiryR19d7P17WHTZImrcOoi+jQ2xI4gcyfmy55xk8V+7UC5fYs72icJtK
         CTYXgC2pv/IYLsScVfwunZESkgIFsL7nx3LKkybjUENiv9p/702chEV5zWKCuuFOfoht
         pZ5Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=Nhv1QpN0u/cUbWQVMWf9fBisQsOocrhCIE8u365Oi1E=;
        fh=US6mzmPJ1ZJ7ULJgIGMabm68FBvSd00MJ6GMTePXKbA=;
        b=R1YGT7Yig0YR1/yJZ0HxCp8+A9ldGVrXEINUTxzwe2U/OmiUKE1UbOsAXQRINdSEbj
         l9RBleUTK3pZrLp/pUJhag6KoEOlYL8DNFTgk16c3du3ksQtr0adYSBgQh9E7Magr8H7
         7bq8LuSVthyr37E5+uCofBoGu7nKErR9cCNqJhPFt7LVh8OsuAu5mu/j2nBQr+urvmE4
         /ue0U1HmUVZJxGv8fll3ahOMUD1EF1HShQmPGKHp/7QWe0d3Le6uQdj0z2S5lHzc1giW
         uC6w+XFmZoreDCQKcqyj2kEtoqyNGX8Zv6IVleA2nQeyFByd/TVNp/7RHUVpSPlAlFHJ
         JjPw==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1772759677; x=1773364477; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Nhv1QpN0u/cUbWQVMWf9fBisQsOocrhCIE8u365Oi1E=;
        b=OHgNuuHESuZ9WWIG9ANU4TdvxMlfhnVTEWWiRiE+/+zY4GAJvMDvtCrw1eI3oFDqCk
         TkwqDA8+24DJQ2CVQWMkb+kWvfbjhgfDZpbBeJFxar98RU0vqw4ZndYvzkNFlALE/vbE
         HCr30lohvOKKYi6mo/K7SJeedk663xncrWPiTM4yFwejtZEN/aVAuWBTwswGiukb7L4X
         ceQ+X9co2Fn58nWwAN2BIJsNdNhoji4OxQGWSdGmYYZcCH8FEnIYZ6otYDGD8KxtlFa5
         VoKRJ2DDUe5FFoMOX66d+5GRf+ojxDXVKaHBBD0PLarDbMkWtNuCEBVDLLqTE8UrvEUN
         iomQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772759677; x=1773364477;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=Nhv1QpN0u/cUbWQVMWf9fBisQsOocrhCIE8u365Oi1E=;
        b=QviixOVQpFUUflyAVSrRy4e8MXGzQ0fS7N3tChEIv1wrtbS9HQbjq+H8OXktZi22w8
         Hqw+1dKRBSKcXJMe3kGVAoQer8LGfeuqwg8nVkSMgstMOg3HL1ebl7eaNyJQ/8fLH3Wy
         PQuF1+wU8NkTNBpnzT8hu6x1uAcd98tEhSyWSYR9w+5wZ/AkedFJuez/dkxr3QP74HdA
         ANo0lHQMdTA2K3n7A3ZitkBgEZSaP1LPn3KEPo6Yr5Rs+O4Y19G4iex7CGQT7mvUQOsh
         s5dQBjbD+D2gKd/klLoSNAqsqkafqTArW0VUJtVQXcMVcmTRHvz9c75K5Y2l68v8joma
         /qHQ==
X-Forwarded-Encrypted: i=1; AJvYcCVJhp68m6uYUxBnvh2vasQ+hd81csiUNzaN4OWdOqWY2k4CJxlvfM5c79WLdZ2I2uSW+1grSm2n5NK4nXIBYkU=@vger.kernel.org
X-Gm-Message-State: AOJu0Yyuf5kQuVnyrlSlTt8m0LiZlgMrxOGGmwzPyMD4yaQzAukN/a6X
	R8E7lWodxgCjo4QO5OgSr9Lt3tNPCqGIUCl3BMrlvLVo/Jm5fBlZbuCHTmqhUxP0E0HaUIkwrVl
	5W2/gRU85NTl00jWtlQlsU6gTW5bMKcQ=
X-Gm-Gg: ATEYQzxbON5ymN9yTHR1tVVBzA7Nw6q17BKR46q79+s398vOrLCzeJHKqIyxNSninYK
	LtXq/Jaqf785iIbNEAFcODxMcJ0onZuh3ZPGED5udkDZscj8VZac2NWIvdjAxf6bOvJ730lfz9k
	T7B7mt7lQH/Wd4VbZ57yZB+WmHLm/rIgU+QRBs/vPupfgUL+SmEgqG7q6qSRwk2ZsEc4p7HdRkg
	6MyavYycvbt4tCyu61WGqMh1cUCvc+Md3DVmghZrCBdLKuTc67NOpVPjnlrjLEfHRz+C3MiNYyf
	TSNW9OQX+KXEZAFOGscDxRPA52G6PU9bfRr9YvDZNVE7+KKh169CkgWeXMU96uq/BiKJOZMBPLv
	Y9RHbP7Xhfoc1fKi0KIy4EfhC6g==
X-Received: by 2002:a05:6000:2c08:b0:439:be4b:6873 with SMTP id
 ffacd0b85a97d-439da89d87amr446776f8f.55.1772759677447; Thu, 05 Mar 2026
 17:14:37 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260302071434.311395-1-sun.jian.kdev@gmail.com>
 <aagWYyrrwUt-poL1@mail.gmail.com> <CABFUUZEdbCMrNyp4kEO7A4KZPn5TKi48+tQvaaYaYuJj5FQ7gA@mail.gmail.com>
In-Reply-To: <CABFUUZEdbCMrNyp4kEO7A4KZPn5TKi48+tQvaaYaYuJj5FQ7gA@mail.gmail.com>
From: Alexei Starovoitov <alexei.starovoitov@gmail.com>
Date: Thu, 5 Mar 2026 17:14:26 -0800
X-Gm-Features: AaiRm52sM61k2krgFio6NQqIohp-pT9tpjaZ4-8nyVLAjS7g73fSblwwIKZRkbU
Message-ID: <CAADnVQJfDYiBHa4f3p_7MpURE_a33+atRbjbcpZ0VmrKFaKkqA@mail.gmail.com>
Subject: Re: [PATCH] selftests/bpf: skip verif_scale_pyperf600 on -E2BIG jump
 complexity limit
To: sun jian <sun.jian.kdev@gmail.com>
Cc: Paul Chaignon <paul.chaignon@gmail.com>, Andrii Nakryiko <andrii@kernel.org>, 
	Eduard <eddyz87@gmail.com>, Alexei Starovoitov <ast@kernel.org>, 
	Daniel Borkmann <daniel@iogearbox.net>, Martin KaFai Lau <martin.lau@linux.dev>, Song Liu <song@kernel.org>, 
	Yonghong Song <yonghong.song@linux.dev>, John Fastabend <john.fastabend@gmail.com>, 
	KP Singh <kpsingh@kernel.org>, Stanislav Fomichev <sdf@fomichev.me>, Hao Luo <haoluo@google.com>, 
	Jiri Olsa <jolsa@kernel.org>, Shuah Khan <shuah@kernel.org>, bpf <bpf@vger.kernel.org>, 
	"open list:KERNEL SELFTEST FRAMEWORK" <linux-kselftest@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Mar 4, 2026 at 4:49=E2=80=AFPM sun jian <sun.jian.kdev@gmail.com> w=
rote:
>
> On Wed, Mar 4, 2026 at 7:24=E2=80=AFPM Paul Chaignon <paul.chaignon@gmail=
.com> wrote:
> >
> > On Mon, Mar 02, 2026 at 03:14:34PM +0800, Sun Jian wrote:
> > > verif_scale_pyperf600 loads pyperf600.bpf.o, a large scale case produ=
ced
> > > by partial LLVM unrolling.
> >
> > This is a known issue with LLVM 19+ [1] and this test is already
> > skipped in CI [2, 3]. I don't think ignoring the error is the proper
> > fix here.
> >
>  Thanks for the pointers. Agreed =E2=80=94 since this is a known LLVM iss=
ue, I'll drop
> this patch.

It's been failing for too long.
Pls do a minimal change to its source to workaround this 8k limit.

pw-bot: cr
