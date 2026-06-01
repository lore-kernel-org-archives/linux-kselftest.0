Received: from mail-yx1-f49.google.com (mail-yx1-f49.google.com [74.125.224.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BE0CF30674E
	for <linux-kselftest@vger.kernel.org>; Mon,  1 Jun 2026 16:22:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.224.49
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780330951; cv=pass; b=OPf1a1wtYUqN7wd5uiw6RgebLQPhMkKFp9gbBYaLUFz/a22S9iai65aA9F1GhbTbxjM9LqSFCSV/hJOQNhcGL/bRyKcCqEphjWjh9ckoUyLyvmwHN0wFYT5z2rEamcAojMpepquif0d4+ZHXys1duWmclOcy7To7bij/WAYotnE=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780330951; c=relaxed/simple;
	bh=1CJ/NuXAzZ5JX1S4E7zNfocykkD792/QQHjbajG/YH0=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=cZiZjBSwbwRAad84abvutI/5DJIfY48zPmP8tneKcrlAmX8nO1V2uOVEbjuiFoFhj7ulLVsC6Lw2QegOSKQsEkS/3JYTWql8ZeLTlZZSmzIegLD/UnvV+0cJAuDkygBjyfeXfTXZb5vM6hm2o5ccrNo0/PR+32DVV1KEC/qT1Xg=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=rivosinc.com; spf=pass smtp.mailfrom=rivosinc.com; dkim=pass (2048-bit key) header.d=rivosinc.com header.i=@rivosinc.com header.b=ZZc4dK9u; arc=pass smtp.client-ip=74.125.224.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=rivosinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=rivosinc.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=rivosinc.com header.i=@rivosinc.com header.b="ZZc4dK9u"
Received: by mail-yx1-f49.google.com with SMTP id 956f58d0204a3-66050c021f0so3056785d50.1
        for <linux-kselftest@vger.kernel.org>; Mon, 01 Jun 2026 09:22:30 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1780330950; cv=none;
        d=google.com; s=arc-20240605;
        b=kQqPHxJ2dl5RSb3TpXxubcQBLjctK7aA5q72TZunkuEUGSyBoqDjSpg/di79l2cR8l
         yrnnUccvA96yanWwdKvaAhP25OGpskY5bYjRYQxWSBMUNymKYD8ttRen37dPJBLOHD5E
         FnK8Whwk05JGC4X9w8lRpXeUN2HcW/XNque78xfYrfs09V+NyaL9L/um4kaD+WudU57h
         bOr+jPpHGe70E4VhgY+XyJ/Unfpn6GeyKsiRBJIwCj++7BCvzy1l6JPHm4BNExZNWglX
         VbsKIP+Rg8QTsFVSX9ldaRM5xMCAQcQvGrZcng0j2qxp0RCrqF3pjc/DBtidpC3lVeeb
         544w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=A1Wsv67Vk9GRUFlRdxu2VA3iBYDzYBLeu5jipj2Jvzw=;
        fh=meemYC+V6qbLwo1/P1yF4WZjFhGrBS6/g6bmpGo4frs=;
        b=E/wxlyAXYG7RrenXNHe3DvPjxIqPP8kCCJ8yMnDc/d2az++sCnXGQLTRZErACLYOTy
         Wk9HaLoXR/Lt6d5Ct6fpnZVHp2SgE9kNr92uaHQWG0DEln7rgdHf0QlDYHoRjNyveRgU
         GIf0yGdJOx5rcGnAuHJuPBJyFZrJYcQB+SLtLE6BvTvpJFQpUpHosxCFmeXG1y7AX8ie
         ukEuLavFzeIMNekHRkdheOEWOhQOsRHVtUp/8ygPFtNsg0mlZa4RL+XzG3c3LsxcpXdN
         IU4xyAvHZpOb3HTkm7NtKc1mObIQrPIvleZ8xtd5UqZODZq7mcfhpRb59hH6tPFe5jjk
         FWaw==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc.com; s=google; t=1780330950; x=1780935750; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=A1Wsv67Vk9GRUFlRdxu2VA3iBYDzYBLeu5jipj2Jvzw=;
        b=ZZc4dK9u05zgurvFAOaOLR3nhhDSbBr+S0195BgZYoqbIqIlom8Nx2pPajSShMRWJy
         QdzjY6nQLIXKwZhJCSe2tmhnJVCpn+3Bb8vRAIJg8hyLQmfNUg4PJ2b8qs0YkgOLtVXv
         eZPL5bYGUUFcAPc5espEdg9PPKDaHdiA3e4gjDOvfEhEPLClW9TfGMYlFawOpYL2YzFm
         30xDKK9jFOBAOdSGq/49sOl4GLJKaKqlcBIeFqYIuI4ha0ZfZ8fKfbxzOsV36f8seF/y
         jdyArgOGWI0KueUMJu1rnZunngQBfCNjtYM31rfBwdEHd8GppRPbWi+ugrf8E2MGt9rv
         fA0g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780330950; x=1780935750;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=A1Wsv67Vk9GRUFlRdxu2VA3iBYDzYBLeu5jipj2Jvzw=;
        b=W1Q5oT4xv7xBFom59HWne+VSrCddpf3fPOJNRstc1W3qD2meRP4GRxZLbmqYZCeiyx
         AtAS80Z8wbYSrdfgjWMwZUCnlLfQ58yTi6vwXIOrs8j8b0a1DZgnSo/oKeN4ty6M4nSu
         Ihvp88JzzxJhntot+uI/Aa5dYREE9TJH2WD/M9WlZXYCkIN5yJv1FlhW7P9jADDk1v51
         OK50N1JUXC5PDg2pbUk5tdbia900rv+1famDHxjoPqU3o5/ZKPHJD1WMsdf2D0Q6LocU
         wYpLz8yXopwNDs3/WfSvVb6rWZzIKhQWrYPMGzjxcpT+j7tfVD9DIVjLSXD8awwJCjKw
         j8Vw==
X-Forwarded-Encrypted: i=1; AFNElJ/eFjlvr2/8J28IeOrHldSPgJSx+52jnF6kLuL9Uefb8VZ+DCA4z2u+13KvnO8GG663x2zDoADUaS9fVVS4UnU=@vger.kernel.org
X-Gm-Message-State: AOJu0YweiT4Pvm8K0yiJEKWXV/t7/6luflzGAYBlOWREI+SdrRK5Y4qa
	XSkswbf1KD43sLCe3yNHi615a8UfkxQ/20WY6ZptFdIStZyulUdpORAvarSsrU5OhA+w4jQ0k6T
	Ig76TONFxYsu1gaWFceMmvVCc+XJIVEZAU9xU/I3drA==
X-Gm-Gg: Acq92OFKN5oht5I0XoBZSj3f+P/FufzBJcsih9VUi4zCGRuHdyC7snDOATHeek5EjYZ
	X7qZs0aNaFRNYPo/X4/zPPRDUPlL9pHt54VKqJygZ6xJ1OYz8lM2AMKaJe/cDbtX+AC9DR2NExu
	N801n19zaolwtCvbt8+EV5SZzMBg076PsHS/ANDp/vntWcZssSgNK6WD5PMk6NtZPMrNB3iBjPS
	/dNSmTpqTMGA47IdJ2RPcSvSJxfdhIx6jA6vvDJWzBV+ePbm3NmxxZX2QcfnnobIPu87p8iV/3n
	IGPeL+pCKdRuL1jjspuMeWPBLGyBhU8hEt6lbScVlu6B11GX+t4=
X-Received: by 2002:a05:690e:138b:b0:660:7b47:24cc with SMTP id
 956f58d0204a3-6607b474ddamr5466859d50.1.1780330949770; Mon, 01 Jun 2026
 09:22:29 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20251112-v5_user_cfi_series-v23-0-b55691eacf4f@rivosinc.com>
 <20251112-v5_user_cfi_series-v23-6-b55691eacf4f@rivosinc.com>
 <87jyslndo4.fsf@igel.home> <CAKC1njS=AHu6uHrH4ae8VxcdEbhgiPXYCAoN3F_mnppBd3SwOA@mail.gmail.com>
 <875x44o9hj.fsf@igel.home>
In-Reply-To: <875x44o9hj.fsf@igel.home>
From: Deepak Gupta <debug@rivosinc.com>
Date: Mon, 1 Jun 2026 09:22:17 -0700
X-Gm-Features: AVHnY4J6Ejb9kcuTR-Xh2mJuobUXOxxIDSAgxNY81YZ-jI0UDO1cEHEz8fOc8KU
Message-ID: <CAKC1njSn_rtCj8ii876PNQTk0nsCTfWsb4DzdymufHVthh1Rkg@mail.gmail.com>
Subject: Re: [PATCH v23 06/28] riscv/mm : ensure PROT_WRITE leads to VM_READ | VM_WRITE
To: Andreas Schwab <schwab@linux-m68k.org>
Cc: Deepak Gupta via B4 Relay <devnull+debug.rivosinc.com@kernel.org>, 
	Thomas Gleixner <tglx@linutronix.de>, Ingo Molnar <mingo@redhat.com>, Borislav Petkov <bp@alien8.de>, 
	Dave Hansen <dave.hansen@linux.intel.com>, x86@kernel.org, 
	"H. Peter Anvin" <hpa@zytor.com>, Andrew Morton <akpm@linux-foundation.org>, 
	"Liam R. Howlett" <Liam.Howlett@oracle.com>, Vlastimil Babka <vbabka@suse.cz>, 
	Lorenzo Stoakes <lorenzo.stoakes@oracle.com>, Paul Walmsley <paul.walmsley@sifive.com>, 
	Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>, 
	Conor Dooley <conor@kernel.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Arnd Bergmann <arnd@arndb.de>, 
	Christian Brauner <brauner@kernel.org>, Peter Zijlstra <peterz@infradead.org>, 
	Oleg Nesterov <oleg@redhat.com>, Eric Biederman <ebiederm@xmission.com>, Kees Cook <kees@kernel.org>, 
	Jonathan Corbet <corbet@lwn.net>, Shuah Khan <shuah@kernel.org>, Jann Horn <jannh@google.com>, 
	Conor Dooley <conor+dt@kernel.org>, Miguel Ojeda <ojeda@kernel.org>, 
	Alex Gaynor <alex.gaynor@gmail.com>, Boqun Feng <boqun.feng@gmail.com>, 
	Gary Guo <gary@garyguo.net>, =?UTF-8?Q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
	Andreas Hindborg <a.hindborg@kernel.org>, Alice Ryhl <aliceryhl@google.com>, 
	Trevor Gross <tmgross@umich.edu>, Benno Lossin <lossin@kernel.org>, linux-kernel@vger.kernel.org, 
	linux-fsdevel@vger.kernel.org, linux-mm@kvack.org, 
	linux-riscv@lists.infradead.org, devicetree@vger.kernel.org, 
	linux-arch@vger.kernel.org, linux-doc@vger.kernel.org, 
	linux-kselftest@vger.kernel.org, alistair.francis@wdc.com, 
	richard.henderson@linaro.org, jim.shu@sifive.com, andybnac@gmail.com, 
	kito.cheng@sifive.com, charlie@rivosinc.com, atishp@rivosinc.com, 
	evan@rivosinc.com, cleger@rivosinc.com, alexghiti@rivosinc.com, 
	samitolvanen@google.com, broonie@kernel.org, rick.p.edgecombe@intel.com, 
	rust-for-linux@vger.kernel.org, Zong Li <zong.li@sifive.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Sat, May 30, 2026 at 2:47=E2=80=AFPM Andreas Schwab <schwab@linux-m68k.o=
rg> wrote:
>
> On Mai 30 2026, Deepak Gupta wrote:
>
> > I see two ways forward:
> >
> > - It can be done in generic way where incoming PROT_WRITE means
> >   PROT_READ | PROT_WRITE irrespective of RISC-V. Although others
> >   (x86, arm, etc) would have to weigh in.
> >
> > OR
> >
> > - mmap04 LTP test can be updated to expect either of "rw-p" or "-w-p"
> >   whenever only PROT_WRITE was specified.
>
> OR
>
> - Add a new PROT_ flag.

This was settled when x86 introduced shadow stack. Instead of having
new `PROT_`, it was agreed to create a new syscall for mapping shadow
stack memory (syscall: `map_shadow_stack`). Scenarios like `clone3` or
co-routines required manufacturing a shadow stack, thus necessitating a
new mechanism to create shadow stack style memory in demand. Instead
of having a new PROT_ flag,  a new syscall was created.

>
> --
> Andreas Schwab, schwab@linux-m68k.org
> GPG Key fingerprint =3D 7578 EB47 D4E5 4D69 2510  2552 DF73 E780 A9DA AEC=
1
> "And now for something completely different."
