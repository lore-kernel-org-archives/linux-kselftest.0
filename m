Received: from mail-dy1-f169.google.com (mail-dy1-f169.google.com [74.125.82.169])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B84AD3E0C44
	for <linux-kselftest@vger.kernel.org>; Wed,  1 Apr 2026 12:39:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.82.169
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775047142; cv=pass; b=HYPS143MQh7+Z/NOf/Ywoq1XIt3ZoOajrWHeaJAUo8OPkNrEolqyOqgJdm0S+3MB3JWh7FEOuxV56AKgmNixomwJbxoGsIQlMco3Vu8oILyInAFgCRnIeltZASz29phLTjW10tZqiaqBYymebCEyZQU8vQxgZP2/gnC8zDMFwlY=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775047142; c=relaxed/simple;
	bh=GodnwCNRPwhTIOZcCkQ43DAq+lvsz0DfYPnKri1+5dQ=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=DL/IrveRGk87qfvSHibVUMGtcEEYJTCCR8Y6oHgEroPTXtQYkQvmiUHL//6GUq4VNtQeHRSWPWVcbD56K5Cq51H8IWMpQ3MhpL1XoIXUxawvCZFHAaS/JvivlFQUbaIi/oqji6r8A5qkXnpO9QjtfMfeMIOlsili/8VhFWYN8RQ=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Ty6k57Rd; arc=pass smtp.client-ip=74.125.82.169
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Ty6k57Rd"
Received: by mail-dy1-f169.google.com with SMTP id 5a478bee46e88-2bd5658b901so279403eec.3
        for <linux-kselftest@vger.kernel.org>; Wed, 01 Apr 2026 05:39:00 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1775047140; cv=none;
        d=google.com; s=arc-20240605;
        b=ZL7hLWUTfQDdKUvul4IFINoC65Pwau7SiX2A0B1GoCVSnGPcFFHL/j3/Zfh90+uoX4
         ep5cF2Oi7QSJshc528Rn8bWOCiysjh5sL3MMt9jSTAA1LFLLuwPsEaZeR8C7P8WK3HVd
         Bglai8L5PjbhYc1rSarn2LVSjT3E2JbG0ehLG00S/q3fPfcBvKTuu/wpMgeoN+pEfPDE
         De79Cl6ug1TT5n2EEXyBx6emqZT7ojp+T2/tjPSAquFqK9vJPU/hPgoMI7CLRPS91MRg
         r8oj6RN5xFugl3azgyNbx12xN36j45i9t3gZziAFdjBJ/7iEA5F129v9Ldd8M0RqpZ4t
         OIaQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=C50p4ZX1kB4/qlngVjB93jucX5ZFw4nyYPOJ+NDGmJQ=;
        fh=14f313SAjkYaJH4mxYgjER1UUOqMDbT2eStVxHhccEg=;
        b=ZQa4+UR0Hob7vxeqevydQadWtx5cN6+6RrH2DSW24WXesx+WoJPZu4HLTPVJjdtDUH
         hCWQVUvGHyw21SDymDbsKEUqi6bdlA2gRfb5kzF5oGqx8/Lg9HHB4IvbXuL15QjgT9Mw
         F5qa4EjrLhpKK+onYUPITYabAWbcx/xPi02BT6w+gO1qsaHgqezt4t+IpWqQBqHhDxkQ
         N1+6Eo0xNWx/8pUN4bF+9qSs8P6HdNfvX0VUaUnPF9OtoqOwhDMRy3LtELqhD6gcVp4z
         LX2iXnOy/CbM4EEs6JoXvpF22PAkZfuOD9uvodX7u92ol0FZKBh+oeANN+sWO+3oho4+
         ZtFA==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1775047140; x=1775651940; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=C50p4ZX1kB4/qlngVjB93jucX5ZFw4nyYPOJ+NDGmJQ=;
        b=Ty6k57Rd2b/j+l5SXT6wVtwVPCofZk6GKODuiID9Bw3DAg+mRwi7ZLqWyKUaY/F6YM
         NoA7tYlp7e7vj9yvAAnK6JUUKVsZuGQEDRy8Kk2VcKRM15hwDVNvDqKKYiugVNhP4Th3
         MM6AG71UacD6q+z9Z9DjlpZT+7Ferlmc4ZwbnQECzBSFC2yCpWCehJBygWufqD+E7Kmp
         19yTa2FPCd+7wB1vpq0YLo0qRK3jOFfh8n4m05FM9+fPCmmEHS0UYOorDiu2exuQrqzT
         UAmbuxKEi6TdpLW0Zn5cDAA8H4L2qKGzbxHskdXbg+o92URUDiHxvCoGu1tBMM7aXg0t
         EqgA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775047140; x=1775651940;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=C50p4ZX1kB4/qlngVjB93jucX5ZFw4nyYPOJ+NDGmJQ=;
        b=TD9We2j3D5RE+faLM+8Cow4JcocQIFrgLieER3Ju1s0iWzGJt2YMLyH9h4Wbt0EpLx
         4cnrgV9zLjhZQU8TbfK3Zi11gQ+RZ3CWn5pa5fqekxvwRlYwM6ukNWPdwQgv6kq16UkE
         zUGMxU/vFBeYzkbpsCxPhFaT/7904w+fMfVcEIQ5tFz5b1aMmOrU15mK2l5At4ba0w4d
         7n1h8Uy9HxyUXDtXEnZTzJ6btDRaDD43dwFhbHaMNCd3Ue38glCJXYY5Bin3uo9z2Ggp
         nTXs1o0PW4JqECGkLpqQ20uI13o8p2BAFtgcc7zK5BQj9WKRVi3HyX6kkJMNUH10Jz2o
         tJww==
X-Forwarded-Encrypted: i=1; AJvYcCXOUYFt1RQQUzfUQtS9M2ka/DEDQjojhQuHKy4IpmCrR9i4nNz5z0lAyYshazJmoBZZo7pv6HIhyXo+vlYJ0HI=@vger.kernel.org
X-Gm-Message-State: AOJu0YxQ7d961gwwf8ERvkaAQ2K2agQCTqAlS8V1N8sZp0zvlXNb0JNU
	0lgx8EgagPt1EVg1XX41/nGg6Ytw8MZLcm2wkigT1Jr7itjBdpkkJu44ftx4VdtWojGXq19wmRo
	6AMwC7b2kw4xffw6fYc+yaZaLF+rVtzY=
X-Gm-Gg: ATEYQzz7VT1mAbUcs+nWMj0uwOLlxd1EzadYNGgYbpfB2X1e9b3XlWYEapAtMGBC2IV
	NtDHq8gtP9FonT4VAJ8xgxu5IavnDCt9zczx+WYH9CwN1nhdXx0/ID+BHmE5S95ZcMhfxCwWyU1
	954Y7Uv/1kfAewTo+AMzgT9Dyn0i1X6pLTFjOqQx2FYm03sJEjAbg+tiElEleI4m3l0D7YkiPal
	s+IFr0B7WVafVm/SX4itpPpJho75l3fsMYBX6gvIjAKzzJk1pU8RyhpJRTB74Ujmy/caKBRzTl3
	9VmpuuoanLBMeAP5a3FIMkuQ+kDwDbIFNWHpnjXqCGXiCUL9feo1jMZCOP2pJg4pGM5ypwD6ZqZ
	9TgXVQmhFrSqFholZxdg70bU=
X-Received: by 2002:a05:7301:6790:b0:2c1:6416:2a07 with SMTP id
 5a478bee46e88-2c9321b7bf4mr857984eec.4.1775047139826; Wed, 01 Apr 2026
 05:38:59 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260401114540.30108-1-ojeda@kernel.org> <20260401114540.30108-2-ojeda@kernel.org>
 <ac0Ol1PaRTWNK6O9@google.com>
In-Reply-To: <ac0Ol1PaRTWNK6O9@google.com>
From: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Date: Wed, 1 Apr 2026 14:38:46 +0200
X-Gm-Features: AQROBzB47ncfBs2Gvn4IVyEtA2T5y2xBZyqDi53mewiERXnAT8KcWfCgLbx6lUg
Message-ID: <CANiq72nk8Ti1bcjCO+5nPacz7JaH=x4+uTi3-+iu4H2ZfwfVrw@mail.gmail.com>
Subject: Re: [PATCH 01/33] rust: bump Rust minimum supported version to 1.85.0
 (Debian Trixie)
To: Alice Ryhl <aliceryhl@google.com>, 
	=?UTF-8?Q?Fabian_Gr=C3=BCnbichler?= <debian@fabian.gruenbichler.email>, 
	=?UTF-8?Q?Fabian_Gr=C3=BCnbichler?= <fabiang@debian.org>, 
	=?UTF-8?Q?Fabian_Gr=C3=BCnbichler?= <f.gruenbichler@proxmox.com>, 
	NoisyCoil <noisycoil@disroot.org>
Cc: Miguel Ojeda <ojeda@kernel.org>, Nathan Chancellor <nathan@kernel.org>, Nicolas Schier <nsc@kernel.org>, 
	Danilo Krummrich <dakr@kernel.org>, Andreas Hindborg <a.hindborg@kernel.org>, 
	Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>, 
	Paul Walmsley <pjw@kernel.org>, Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>, 
	Alexandre Courbot <acourbot@nvidia.com>, David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
	Brendan Higgins <brendan.higgins@linux.dev>, David Gow <david@davidgow.net>, 
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>, =?UTF-8?B?QXJ2ZSBIasO4bm5ldsOlZw==?= <arve@android.com>, 
	Todd Kjos <tkjos@android.com>, Christian Brauner <christian@brauner.io>, 
	Carlos Llamas <cmllamas@google.com>, Jonathan Corbet <corbet@lwn.net>, Boqun Feng <boqun@kernel.org>, 
	Gary Guo <gary@garyguo.net>, =?UTF-8?Q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
	Benno Lossin <lossin@kernel.org>, Trevor Gross <tmgross@umich.edu>, rust-for-linux@vger.kernel.org, 
	linux-kbuild@vger.kernel.org, Lorenzo Stoakes <lorenzo.stoakes@oracle.com>, 
	Vlastimil Babka <vbabka@kernel.org>, "Liam R . Howlett" <Liam.Howlett@oracle.com>, 
	Uladzislau Rezki <urezki@gmail.com>, linux-block@vger.kernel.org, 
	moderated for non-subscribers <linux-arm-kernel@lists.infradead.org>, Alexandre Ghiti <alex@ghiti.fr>, 
	linux-riscv@lists.infradead.org, nouveau@lists.freedesktop.org, 
	dri-devel@lists.freedesktop.org, Rae Moar <raemoar63@gmail.com>, 
	linux-kselftest@vger.kernel.org, kunit-dev@googlegroups.com, 
	Nick Desaulniers <nick.desaulniers+lkml@gmail.com>, Bill Wendling <morbo@google.com>, 
	Justin Stitt <justinstitt@google.com>, llvm@lists.linux.dev, linux-kernel@vger.kernel.org, 
	Shuah Khan <skhan@linuxfoundation.org>, linux-doc@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Apr 1, 2026 at 2:25=E2=80=AFPM Alice Ryhl <aliceryhl@google.com> wr=
ote:
>
> Debian really *should* pick up 1.85.1. It contains bugfixes serious
> enough that the Rust team decided it was reasonble to release a point
> release.

I asked them about their policy yesterday here:

  https://lore.kernel.org/rust-for-linux/20260331190053.482607-1-ojeda@kern=
el.org/

Perhaps they just prefer to apply patches on top.

The issue linked above is the only one I noticed so far, and it is
quite specific.

Anyway, it is up to them.

Cheers,
Miguel
