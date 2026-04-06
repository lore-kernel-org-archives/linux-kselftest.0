Received: from mail-dl1-f53.google.com (mail-dl1-f53.google.com [74.125.82.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2CE0D18AE2
	for <linux-kselftest@vger.kernel.org>; Mon,  6 Apr 2026 00:14:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.82.53
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775434455; cv=pass; b=Bl+UciMLX14E7fcz8DTJNGJPf2vPu9Lv4LqX84V3lXdn48cMrakBBwvZpIbIhKpjBIo3s/H8TziMw+sCPyXxqD7NB+8xO6IZUcomZgUAXl9I0/8galIeXqztnRE1hu+dt2C3S0x4E97KNJl3sDCfIrW3qd3qGBu++eG19NPtsqw=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775434455; c=relaxed/simple;
	bh=wEpvz0SusfCyL05O+8XHZ5HBN7Vc6GU6ixNlE1n3otA=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=A37B4uG9wdDnUx+wGhGO9XUF7ebhmqoMc0CyHlZ9KAulMRvmWmHqO0Mzw1Os9IV/R+sqp1vi7QkvuihBYZcFuZtKhb+XzUHg3DPpjXsDsLePmdEMYt1J++Gptnr30hQOM0vtDnieF3Z1G08oGoWdSZBMyrjQnsO2HqlaSpZvk0s=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=W2EL+ypO; arc=pass smtp.client-ip=74.125.82.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="W2EL+ypO"
Received: by mail-dl1-f53.google.com with SMTP id a92af1059eb24-12c1161232dso2085c88.1
        for <linux-kselftest@vger.kernel.org>; Sun, 05 Apr 2026 17:14:14 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1775434453; cv=none;
        d=google.com; s=arc-20240605;
        b=CHaT9c9aQyuGKRsHCvERxYsv5JSbUzrBeZe7nDWVf3ZtQooIN4Ptenk8iRPPVqiTG1
         ab27Le6VW2hS1RMLEt0p87BZJ//qB3bfVU2ClMHxDnFLtQCoDje21nUT2E7CL+iC2DDX
         T7cVC6osmDrbZzsuzIUtyBPeYIi2V+hh0twL796elChV/TmtRfhuduhcNrrJTMoYgf3U
         Ja9gbQ/2HH88gk41TYytoXj8km2Ocip2njoy94jlbJ/TOl35KrAfhH/41f0ESUgXIDFP
         3qgzM2NtMx1AiWX/zPxmf5eMiyzOhtNCpKUjZfEXiJWwhsAsG70MS6f/VK/r6L6LOqxU
         2t+g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=wEpvz0SusfCyL05O+8XHZ5HBN7Vc6GU6ixNlE1n3otA=;
        fh=vrugu1o9TjPKzX4jPaaA1uStyn933OdHbVujd78NgqA=;
        b=foOJjd5op9ema5wNEUwhd38KRbK5PhQh5k9DverVEa12qUqq+ZtW5xauIzNkC5fO0Z
         sJHLyJX4eFSPMcDmGeKwEuo2Oe+K/khX/4Esgucw1VSlP5w8zY5UnLJ7r+aWUqEgHAA3
         ovzgALhYTycLJM5sEqDeW+yEk9MpNRZO+DDl8K65OG6wN7EGSdPJBZ0luICIs2CuTjj3
         Y5rEjTXQhcYJswZwb07rr7exCUD0/7HQvG3oBF5NG4J3kwqv0Mu8AeO27ox7qppBMPs8
         aSAwbr25RMGRr+h+2Mc2b7DcR37Wwfc/3KyNCdcfNluRm4LGmg22fIK7mnFcanWqur4l
         Mu8g==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1775434453; x=1776039253; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=wEpvz0SusfCyL05O+8XHZ5HBN7Vc6GU6ixNlE1n3otA=;
        b=W2EL+ypOcsaqQ4DoOhrFDh+b+1lAXR2+PfuzgePaD3QyLeW9tXTGFiV3lS1LJThAeX
         NaxY/oEFMFD0Y3i01XsEDpIhm8gOXMv0koKcxOIKicMgMti/P335kHExMP467YZP+Yn4
         Yy6jC3XqkJvOPhp1FwbNbESJ2OFvctUAgwlzHRAqS/JEy5mUEC2TIcLLwoRD8IU5BXHI
         EyvU+eQL2oMhpSEi0gKa3v2+Yk9nWVoOpuiLpMemSm6bu1MU8SModMlqUbijJ15Z0Jjq
         EcINdtOvxyfb50KcfPS/u3a17tCbzMlIBmnJAh2YlYTp2SQTFwIRZOigAmxIK6ERVnZn
         bqAg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775434453; x=1776039253;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=wEpvz0SusfCyL05O+8XHZ5HBN7Vc6GU6ixNlE1n3otA=;
        b=E5eYFnXT25aORvBUKuj2jKUVpTG1JxpvekEuTOyH5j5aVsASk/xpKECUaG743a91B3
         /xSTLQsytciAnGV/rHbPzN2B/esaU/camx/3E5E3OtiNDk1lY1XiZcBSWv/RWr2eUnEx
         aBH1CU0dMPVmQxQwysMHmF3lMeOdO3MZiBQ1+AJ1iRkSJS2xLvQ1BjzpqLEtGnTfrqJU
         uSloQY6KmLBE3cqNEWvYMUtt0owt1tJ+3yEuW6xDMif5DR+OGKQqBCAjwstGgaHvknOH
         fGlTDNXkPyqu35JZg5cYZypkhHXqUTm2lRjC6+BDMuh1Kkkgcf4Gy7y8JfpPJuOXO58y
         oY8w==
X-Forwarded-Encrypted: i=1; AJvYcCX2jbbVzbhlzTk+BhMJM83wpoEJPXi9PtCrYM7Gm6PEQ/xrQhLIcRGSzCVgEmEp1IKDtorayj+lJHmGGibsx5U=@vger.kernel.org
X-Gm-Message-State: AOJu0YyYaSJ8gPNy6/RLPAedYW/I1DG14va6g2xLcHRXAtJGRoCKxt5u
	Q3GjTwJfOCIy/ajfbALUS4QUEMgJvcegwaRAeFQZEpRBF4NE9IUm8yO1k4a8KYebZVyRLxfhO0m
	50eVah9tmSxcK5YJCSlRXf1r4kyRGPZc=
X-Gm-Gg: AeBDiet505fr2Bbt5kwDGhSpAMV40yBUwomeGkI6Vb1ZU4rBh11cYHkfZVhWm5aRlLi
	MxfJ67q7Q+11kUB1vQFeXAr+17YqgoQ9UfjkiCmELlCJelGaJ5oyggypJH4i8PgAvt6xsv9OrTd
	fmtq/lJo3NzCk9W1PW1SRhtqrD8d8xc8USjRVORW7H2BGimSB0AaW8R177bLW4F8wBcj7aD6mry
	2/m7kGpwZy9xOlJQssmX4Ddz+djIp2+Ml8xV0hIjbVkWIJ1/jphzVF1ed9QVVSPaUj+F8xB/f0O
	u9/lcXJxYe3aSsux8AfhulAfmTBLPgJ/Ip7xI1XADlSkk9MSUTaaNxoaA7wRcvKw+Slnyhza8Kt
	XLBGygj54RjaBiJwuiGefz48=
X-Received: by 2002:a05:7301:6784:b0:2c4:acef:291a with SMTP id
 5a478bee46e88-2cbfbc7dc06mr2181016eec.4.1775434453241; Sun, 05 Apr 2026
 17:14:13 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260401114540.30108-1-ojeda@kernel.org> <20260401114540.30108-24-ojeda@kernel.org>
 <177508434465.73816.4492182082440539007.b4-review@b4> <CANiq72nqenC30r7QQAmdKxS8ehGU2SoSGr+LCnoTAGLegH-KnA@mail.gmail.com>
 <DHLMTLCY6U4N.3VOMQXRIT1RFY@garyguo.net>
In-Reply-To: <DHLMTLCY6U4N.3VOMQXRIT1RFY@garyguo.net>
From: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Date: Mon, 6 Apr 2026 02:14:00 +0200
X-Gm-Features: AQROBzC0xKqhkvjW35MYEt1fkyhl47XKSCgdBG6b_PFaPBKsGPkzdO2Dex1iVhA
Message-ID: <CANiq72nPjz4FiYUDDV5Xw1=ychH0DrhVN88hjygBnawLf7oamw@mail.gmail.com>
Subject: Re: [PATCH 23/33] docs: rust: quick-start: update Ubuntu versioned packages
To: Gary Guo <gary@garyguo.net>, Fiona Behrens <me@kloenk.dev>
Cc: Tamir Duberstein <tamird@kernel.org>, Miguel Ojeda <ojeda@kernel.org>, 
	Nathan Chancellor <nathan@kernel.org>, Nicolas Schier <nsc@kernel.org>, Danilo Krummrich <dakr@kernel.org>, 
	Andreas Hindborg <a.hindborg@kernel.org>, Catalin Marinas <catalin.marinas@arm.com>, 
	Will Deacon <will@kernel.org>, Paul Walmsley <pjw@kernel.org>, Palmer Dabbelt <palmer@dabbelt.com>, 
	Albert Ou <aou@eecs.berkeley.edu>, Alexandre Courbot <acourbot@nvidia.com>, 
	David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
	Brendan Higgins <brendan.higgins@linux.dev>, David Gow <david@davidgow.net>, 
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>, =?UTF-8?B?QXJ2ZSBIasO4bm5ldsOlZw==?= <arve@android.com>, 
	Todd Kjos <tkjos@android.com>, Christian Brauner <christian@brauner.io>, 
	Carlos Llamas <cmllamas@google.com>, Alice Ryhl <aliceryhl@google.com>, 
	Jonathan Corbet <corbet@lwn.net>, Boqun Feng <boqun@kernel.org>, 
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

On Mon, Apr 6, 2026 at 2:06=E2=80=AFAM Gary Guo <gary@garyguo.net> wrote:
>
> It's still required.

Thanks for confirming!

> Perhaps having a repo in rust-for-linux GitHub org (or somewhere else in
> kernel.org SCM) where we can point people to?

...and for all these details :)

I agree that it doesn't fit perfectly within the kernel, but an update
every kernel cycle or so should be fine, I think, if you think that is
enough.

Otherwise, regarding the repository, that sounds great to me -- we
already had an old https://github.com/Rust-for-Linux/nix and
https://github.com/Rust-for-Linux/nixpkgs. Not sure if Fiona (Cc'd)
wants them, but perhaps you could reuse them (otherwise we should
archive them).

Cheers,
Miguel
