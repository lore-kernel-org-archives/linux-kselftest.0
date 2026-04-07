Received: from mail-dy1-f178.google.com (mail-dy1-f178.google.com [74.125.82.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A2A41335554
	for <linux-kselftest@vger.kernel.org>; Tue,  7 Apr 2026 08:37:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.82.178
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775551064; cv=pass; b=YU15+FcAmg7kw16BE3hWEQGMgiUekRyDxJfkt6wWjfQJa6sR7Q7YmZ3s/bv6VriWT4linDk4mjY5PuRsp58hxbg22CMa1XE3Jm2u8Fu+C0k6vyMvL/pFrGCcBFh8vS1eTtl+ZVUb1ytVx7HLOs+VS+hxnDu7LfIQStrNnDuHvFg=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775551064; c=relaxed/simple;
	bh=DfoJvrhbR9/q+l6t1NPKmCnTz4p/S80iMM1QrEsDKz8=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=Z5HfN8U1ROWvbHSVuHzNW3Dn1Yn0ExkZAdTUkC1ir4zMXcc2iVVX2kJRREBNk35DxMEze09naBrdBSCJNkNzB95bcm2gNWUg0wyq6VtCP9y2sF8YVPrb97a0jvvwjZQIR7YnLG1Fe4pwEpzXBTUwZPZHjX0ereuMlZfvg72qen4=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=J3z1KvP+; arc=pass smtp.client-ip=74.125.82.178
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="J3z1KvP+"
Received: by mail-dy1-f178.google.com with SMTP id 5a478bee46e88-2cbc50e6a36so303656eec.3
        for <linux-kselftest@vger.kernel.org>; Tue, 07 Apr 2026 01:37:42 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1775551062; cv=none;
        d=google.com; s=arc-20240605;
        b=JCKYopd3F1/Dg3Ze9uy4G1ceCnAxSii8SYiwq+84MJWfCB1VEyr/TCphzHaX8wI5Br
         bMbtQ8dtatsFCmmJNmZrghqXV9ibF5mvSJ8Q0mINX09x/g/0V+ffVRrFYFL1UeX04zY/
         97VKAczG5bi5FM2X2lunyYl4k9zNlKogZfYDA9euQJ8png0rlrV6HvjoISrSviD/guHe
         Rt09ude35GariXD19y8U6DzI7TAhsCtU1OPxlgwlhfK8darLchY9rbrDwAD6D5wJjOtx
         Yz9g3mIQp35Si+cDzstxZ+LMd9TdRv/3gEKtg+NMgYECj/+QKGoRHN86PGkdlJDNUDoZ
         GECA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=Gy0ttEzqHnoPOGT+UhllrpZ7VKqpJE2isFAosOgHjU4=;
        fh=n5/eIFPvFMbj068NE5C7OtLZSRRj3VPcj3etI+7CINE=;
        b=htWr0sG/rgU5bCZzAHIx0G2phqcLHu/8B4RPwY40OMAKGS9ejDbVoqUxaQa+CmYi4/
         i/5EHCbYjvnxruj9FkwkYF+v6gWTGJDvfmi28h0X2jcaRkmZ5qRQYxrSM98cA7olpIwp
         IUkCIOVTkScTZAkfgSLvVjJ0iBwxePUjFcbaXldd/dcE/laO6pCGMSsfP3wwIzmM4jZd
         XGgXzNPVix6Wfsvl2y7Gsg5vsZFATsNn3I5pPJgQ+hbHexNEuGmHlEFgSUydQPBISxDb
         AwD59KzXDZJNTRx6SzEX5+8qYP9CEBrN9KKgn9XZORBQe0ma+voheJg6kHNi3yUYeGRE
         rj9g==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1775551062; x=1776155862; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Gy0ttEzqHnoPOGT+UhllrpZ7VKqpJE2isFAosOgHjU4=;
        b=J3z1KvP+plrGKYzfUZxtf/Bl93B77UKY7gFXsyg9lnqxQ4lQpfxmrO/IB5Px3zGq8Y
         T+ZNMjJOGcwSbne9t7HmvyK+WzEILe6jT47dIgUyQroNzuY5E93stOPdry4ZVUtk9/Mj
         uCAnMJBY2kCC1pDtB944IjpdTYL7Dw14pNtV8Ld2+V/Kw1cfslaHZ9lkRz3LBrdwG4do
         w4WtY8nQOW774nVjEpKk1UANFMtl8yH6x4HXidfLM6t7tWbCmmWloXHVosYKF+11CYP2
         iQCEiotKrSjXa8syLxVf4uq01IEtVMo+J6nrYj1OKJg0gqWqB7QijeFrErZcJdAywsPK
         k/xQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775551062; x=1776155862;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=Gy0ttEzqHnoPOGT+UhllrpZ7VKqpJE2isFAosOgHjU4=;
        b=bjGK34Aanr463crxeQzwm6iomJfJlFESIbfHe3JxDlzLaBGOLCMc3RdV+cm6x6nzBF
         21xd4iMsuA16MB4+wUXDYoc42982HIP9W6395pRMpy2ZtVomiiiYQp6uyGK0V6zsDv1a
         pNwP0llwNuX4Hjd8PB5o4X8aaBl4QfExx4K32zxHpJX4rhgk+WESzh6Vg62Cv8JfjtCZ
         7F6fd1IkRXb9EqEw9tixBx/KBDPcs76wJdSRKG+QwM77dbKtEGNFFLiQGvuyPbd5Hvnk
         5h0DIPGVD6Q6OL93q2o30JoFeRGhCojntUCbgod1kzWlVK0IRRLwoXsq3Xa/MeXU/ndE
         /9SQ==
X-Forwarded-Encrypted: i=1; AJvYcCX81L1bNBkLLJkYlh6609w2dRDJNs4db7bFYwPzh7PsAiBzWsa+k3ted2ev6mCBv0HcjDNJMf8U+qZqozn3igw=@vger.kernel.org
X-Gm-Message-State: AOJu0YyYUyohB0E6QTbBpf8ZEI2mJIGcyB95U3UdgUQrVifnMkYHlJgZ
	edDfVpLjYeyYEh1ry6titdkOS0gthvJ5pAbg7psg/fRM1MiRMwUZeI7wQIF4VbDazr5ROlHJz5l
	kpFhqJC4WvTcqV3X/EvlVeURc5gWSJu8=
X-Gm-Gg: AeBDietnxLy2jTQLIP4m/xhlaeIqNzjtA0T/1yIxa+W8ZRfYNgngEygFfY7EM0cVjnU
	QYn5crpwSGevhRzwR98PlzQi3d4wgjpHGv80+fbggTj2jFmOGcgZHaQephHuXpwW9WmtEQwF6SY
	9ZFiL56UPRRC0wFAbQZFfMClX/Fu6fvhF+RQ3Pr6KzOa/wOz1/zENstXHnwGkOLmsD9i4WH9D5c
	6vRILDDD/CZB/BUsMZpjdD/8Hl55hSkHLfHFnyVPHt3aoagKzhwTW9XHU0RL15QU7WwsBpem0FP
	yjx0zCRk9iingbIt0B9o1VRLDtO7G8pzk/LQaTSYfRqFbn6kbLE0XpGH19JZsW37174F6vFp/TU
	RPuRaA0hXY4tYYaxpOSh9mU8=
X-Received: by 2002:a05:7301:d1b:b0:2bd:db75:c28b with SMTP id
 5a478bee46e88-2cbfcd54f9bmr3830933eec.7.1775551061539; Tue, 07 Apr 2026
 01:37:41 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260405235309.418950-1-ojeda@kernel.org> <20260405235309.418950-8-ojeda@kernel.org>
 <177548573697.95472.13544191227699996309.b4-review@b4> <CANiq72ne_JYPodnROckyNto10ZF0PqadRxSrng5-mZyqVovxFg@mail.gmail.com>
 <CAJ-ks9kbHz_KYAXx02vgW1dN2pfb5MFoaSoU1HbJbJg2O8EUaw@mail.gmail.com>
In-Reply-To: <CAJ-ks9kbHz_KYAXx02vgW1dN2pfb5MFoaSoU1HbJbJg2O8EUaw@mail.gmail.com>
From: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Date: Tue, 7 Apr 2026 10:37:28 +0200
X-Gm-Features: AQROBzD3OQzI1eA28hVCCiGMvz4r5THmhHuU5dUr3xJV-N5wbeOjrOxDF8RLuuQ
Message-ID: <CANiq72mJTT7xFnhm-CeOZM_3ZwGdaQ8F2zUbONpPbqJ8g7DokQ@mail.gmail.com>
Subject: Re: [PATCH v2 07/33] rust: allow globally `clippy::incompatible_msrv`
To: Tamir Duberstein <tamird@kernel.org>
Cc: Miguel Ojeda <ojeda@kernel.org>, Nathan Chancellor <nathan@kernel.org>, Nicolas Schier <nsc@kernel.org>, 
	Danilo Krummrich <dakr@kernel.org>, Andreas Hindborg <a.hindborg@kernel.org>, 
	Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>, 
	Paul Walmsley <pjw@kernel.org>, Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>, 
	Alexandre Courbot <acourbot@nvidia.com>, David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
	Brendan Higgins <brendan.higgins@linux.dev>, David Gow <david@davidgow.net>, 
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>, =?UTF-8?B?QXJ2ZSBIasO4bm5ldsOlZw==?= <arve@android.com>, 
	Todd Kjos <tkjos@android.com>, Christian Brauner <christian@brauner.io>, 
	Carlos Llamas <cmllamas@google.com>, Alice Ryhl <aliceryhl@google.com>, 
	Jonathan Corbet <corbet@lwn.net>, Boqun Feng <boqun@kernel.org>, Gary Guo <gary@garyguo.net>, 
	=?UTF-8?Q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
	Benno Lossin <lossin@kernel.org>, Trevor Gross <tmgross@umich.edu>, rust-for-linux@vger.kernel.org, 
	linux-kbuild@vger.kernel.org, Lorenzo Stoakes <lorenzo.stoakes@oracle.com>, 
	Vlastimil Babka <vbabka@kernel.org>, "Liam R . Howlett" <Liam.Howlett@oracle.com>, 
	Uladzislau Rezki <urezki@gmail.com>, linux-block@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, Alexandre Ghiti <alex@ghiti.fr>, 
	linux-riscv@lists.infradead.org, nouveau@lists.freedesktop.org, 
	dri-devel@lists.freedesktop.org, Rae Moar <raemoar63@gmail.com>, 
	linux-kselftest@vger.kernel.org, kunit-dev@googlegroups.com, 
	Nick Desaulniers <nick.desaulniers+lkml@gmail.com>, Bill Wendling <morbo@google.com>, 
	Justin Stitt <justinstitt@google.com>, llvm@lists.linux.dev, linux-kernel@vger.kernel.org, 
	Shuah Khan <skhan@linuxfoundation.org>, linux-doc@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Apr 6, 2026 at 5:31=E2=80=AFPM Tamir Duberstein <tamird@kernel.org>=
 wrote:
>
> You're welcome! Actually it seems the lint was already improved
> upstream, starting with 1.90.0.
>
> Link: https://github.com/rust-lang/rust-clippy/commit/c0dc3b61 [0]

Indeed, I had the PR linked in
https://github.com/Rust-for-Linux/linux/issues/349, and it is nicer,
but it would still fire in a case like this patch :(

So we could conditionally enable it for Rust >=3D 1.90.0 now that we
have support for that (and allow locally some cases like this one when
they pop up), but it is still simpler to just ignore it (especially
since it can be quite confusing for other developers to see it
triggering).

I think we may want to eventually re-enable it when we use no unstable
language features.

Added:

    [ In addition, the lint fired without taking into account the features
      that have been enabled in a crate [2]. While this was improved in Rus=
t
      1.90.0 [3], it would still fire in a case like this patch. ]

Thanks!

Cheers,
Miguel
