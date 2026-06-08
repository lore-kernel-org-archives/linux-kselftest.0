Received: from mail-dy1-f176.google.com (mail-dy1-f176.google.com [74.125.82.176])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CB6B138F938
	for <linux-kselftest@vger.kernel.org>; Mon,  8 Jun 2026 07:04:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.82.176
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780902256; cv=pass; b=TBudXoUOKP8C65DqAjxuo5RzLuPA1PozgwrLDoEKNWIBvT5KUePjy7Ea/GrDAXTO02XO9/Ls3sFIPitWldyazU/lMHtiCjG4+wxtsgNnt0xKRy2WuWUSOyXsrIKhABt1lwvbuEFK9lpfrMgt+yJ0DqF4r5SS0OTwY9eZRSwAxW8=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780902256; c=relaxed/simple;
	bh=d3hGf5H3nnzoC7ybJv4mmiJ6ITlnTZEvjcyvoKNqyjE=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=s5BZtoA0yDfZZxn+82OLeSgvpkq8wdDHUsk7dXOhcqmvUKNCNbzEsNehx7LZPkNNy4+NkH0CoCtg9jFE0V9rKwQ5rOZAWlGeUP24To0N5nGVWfhNRqZuAwF+VSQu7G9eyewjcaukDP+9nNJQXtPLbIeZZDVcQBTbc75rNffqRzI=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=StPljPRz; arc=pass smtp.client-ip=74.125.82.176
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="StPljPRz"
Received: by mail-dy1-f176.google.com with SMTP id 5a478bee46e88-304da3b4508so388509eec.2
        for <linux-kselftest@vger.kernel.org>; Mon, 08 Jun 2026 00:04:14 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1780902254; cv=none;
        d=google.com; s=arc-20240605;
        b=S1BMapebdw+wsSnq9l8pJyLqPDLxcNz7AnhTaFzPqWWSHcJKI2Ic0rSi/6Hvnb981j
         aat/+Vsyrev7hbuFaqsrGOp6IV2D2H6Lej+J37hdbSalL7Q2eiyNt2ZcrlkGHlB0rVkW
         6+HUvDtgadSMehkjcqHlF5tS2mSxSBZMVjB3FjA4oKGK8lW5q/yB6VMqLZoLaAqgldKJ
         h2KtrBCIcfmYq76Qn9lMwq3sY1cvH5CG5PL6kSmBZxtxmxUOHKa49jXoB7p186JLlAye
         JwqFss8ivsRvm8ye3m1MS0d5hw9312EeSb9YY/BjJ4jhPNNHr0YETDk9vr2fqakMaj18
         +ykA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=d3hGf5H3nnzoC7ybJv4mmiJ6ITlnTZEvjcyvoKNqyjE=;
        fh=9UHATWmbj6NNB5lGdM6A2UcHijzmoUdLknB/UBM95xE=;
        b=Ozeo6cH5nrYhJd9rBOG5fdNe/ZEfYbsjQHbeq1bQPS8aAeyif4XybTDgILBLDwON5H
         NGQI5RqTDdwh2lApFtjzUvTb5uttb/E6xTdhM1i7GeR90bvHICzZRVnGoJWg2eKXaDxw
         bARTLovHbT9hvmsuf45ZeRJBW9ISNqdQj4hAKphMAevYimKlxBwLsU1V23HNHzP3Q11m
         bmsExQfiYFq2Gxe4s83c+P808VWxT3u2LaxWbgMMQH3KfsXiIknExKJwDddoXXaciUzC
         oDB4NcI7L52Ky2B9q1Rh4lb/L8AvkMqoadDSlLgy14tKm4erXSolC2ZBkI8t655e2t4O
         52TQ==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1780902254; x=1781507054; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=d3hGf5H3nnzoC7ybJv4mmiJ6ITlnTZEvjcyvoKNqyjE=;
        b=StPljPRzyriQ6ljrCi232UNhcq1V3Wcmqkp/oL8cuDcgTOBmSHsK+4j9fRTDTWPfJj
         8ukgjBQXg204HZgDLgxfi8JG1Oqf64puKlXFJNPMZ9vdQqK6SRC/xk84JJ6ieUZ9jLUO
         NGvrTxumlJalIuKlE5WQ7hpg7pZtMdQiw7tW9z3vm2+j+oL1flljq2TZkaiWbAvw0zjf
         x3MZVEoFT2LiYatCnFg3ARwEO3RPiT0U5S0NNC9NNn0LYZVTPj0Jdf2DO1pfWNq3hGfF
         I01WmYeaoI8y1qnb87C8lUomtZFLYjbgoLlJOc/XR657cPkGKZmfnnhjxuUjJaBW02NI
         Nxjg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780902254; x=1781507054;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=d3hGf5H3nnzoC7ybJv4mmiJ6ITlnTZEvjcyvoKNqyjE=;
        b=EYTk88jKl0x72JYktKJjLRZBM28g5VCxEDoOBQfCZpFYDo8CgpygAZbyct0ac4U3gg
         2F+U1g6A4mmPVQP8N3lKG5m3Zd4BdkQhfL/4z5yFKr50jBEn1rB8e5d8b11SqjPUec28
         Nb7z3R/54UwYckDLlWcjALdRLVmwBvKIxw9j0h+I8B+z6MKftX4ctoTzUhkJTJPcFsks
         Q7OkF1EUVntCfe32yAq1nkZqMlEIjmeaHJi/d8oeZrV+GYi2K/Ei8uWjV1qlFykts6My
         y/gCIZdGc2f/w7dhj8mU5/kbg6JCGaVSVaAm4v+gAuzn2Y16i3tg9ubhGUKp/WzTsxev
         y5cA==
X-Forwarded-Encrypted: i=1; AFNElJ/S7CEBrgKQF9HM0z6WVnIs/RIYjJojBmNX8bPnhAzEKbp3YgEbW/1ocfNlvRoSnYhwkzhWuZaW8TBWIf+Zn4M=@vger.kernel.org
X-Gm-Message-State: AOJu0YybKcm6xnqcDDr63seJ7Y1CoYfh0rZrIWaVa26UXR4cNDw3HaDK
	Wn3qi8/LXPblaK67gKIv3ALmHcR1ylB7fxnFBS1STqprGe9WjyANZ1V/He/DJmqrzCn/mtDWIeK
	Bpacnl3kKEj7pj/HRII+yNJ5Mq2Ewc+Q=
X-Gm-Gg: Acq92OFBVh1RLB2nPv5F61SVJ9LyzPN+KdMFF1pe6HYjdBF3bucNnJ0Qx2skDnW6fO+
	9lT+4mSWx7CmIaFYN6O5gmE1/2JnHtzehGf3uYEUZ8Oa9qsxsOLZ5kPHq1rLp2rqpO/5szggAbb
	oV9bHwaqrAy7JhBq4Q27UJ2lZpRmGvmz3rXAKrNREChN7o/4O4P+EGfMSE/rpxSAKmsrPS0iyMK
	vJUlL343iqJ5eHqdzKHyu5PmoB0ZV1XMiEgcmwKanJ222Nwh9SLV/fBMTtBUoYkdgRaIyam0RLd
	Gl6B4Yr3gp/OaMlNl5F32iYmlQLARTgVy2Tz9nNRdfLYlpty2STncnr9lPu0om8XFdR3V3s/Hsu
	L1iWKRsWvkYWsJPDSkOq6P2uZ/kcUT0h1xw==
X-Received: by 2002:a05:7300:fb91:b0:2e5:faa9:ca76 with SMTP id
 5a478bee46e88-3077b437db7mr3385783eec.7.1780902253819; Mon, 08 Jun 2026
 00:04:13 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260417031531.315281-1-ynorov@nvidia.com> <20260417031531.315281-3-ynorov@nvidia.com>
In-Reply-To: <20260417031531.315281-3-ynorov@nvidia.com>
From: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Date: Mon, 8 Jun 2026 09:03:59 +0200
X-Gm-Features: AVVi8CfkctqwQ1afnp5vGSX4F85MzXwCNBMwN2jWnjjuq3Ql_RpXAPCbCeRJJMk
Message-ID: <CANiq72msu_mByr9DjW8kU9DWQg-0q5XqrboxRK1gOTwKs6QTjg@mail.gmail.com>
Subject: Re: [PATCH 2/3] rust: testing: add Kconfig for KUnit test
To: Yury Norov <ynorov@nvidia.com>
Cc: Miguel Ojeda <ojeda@kernel.org>, Boqun Feng <boqun@kernel.org>, Gary Guo <gary@garyguo.net>, 
	=?UTF-8?Q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
	Benno Lossin <lossin@kernel.org>, Andreas Hindborg <a.hindborg@kernel.org>, 
	Alice Ryhl <aliceryhl@google.com>, Trevor Gross <tmgross@umich.edu>, 
	Danilo Krummrich <dakr@kernel.org>, Jonathan Corbet <corbet@lwn.net>, Shuah Khan <skhan@linuxfoundation.org>, 
	Lorenzo Stoakes <ljs@kernel.org>, Vlastimil Babka <vbabka@kernel.org>, 
	"Liam R. Howlett" <Liam.Howlett@oracle.com>, Uladzislau Rezki <urezki@gmail.com>, Burak Emir <bqe@google.com>, 
	Yury Norov <yury.norov@gmail.com>, Brendan Higgins <brendan.higgins@linux.dev>, 
	David Gow <david@davidgow.net>, Rae Moar <raemoar63@gmail.com>, Will Deacon <will@kernel.org>, 
	Peter Zijlstra <peterz@infradead.org>, Mark Rutland <mark.rutland@arm.com>, 
	Nathan Chancellor <nathan@kernel.org>, Kees Cook <kees@kernel.org>, Nicolas Schier <nsc@kernel.org>, 
	=?UTF-8?Q?Thomas_Wei=C3=9Fschuh?= <thomas.weissschuh@linutronix.de>, 
	Thomas Gleixner <tglx@kernel.org>, Douglas Anderson <dianders@chromium.org>, 
	Shakeel Butt <shakeel.butt@linux.dev>, Christian Brauner <brauner@kernel.org>, 
	Randy Dunlap <rdunlap@infradead.org>, Tamir Duberstein <tamird@kernel.org>, 
	rust-for-linux@vger.kernel.org, linux-doc@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-kselftest@vger.kernel.org, 
	kunit-dev@googlegroups.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, Apr 17, 2026 at 5:15=E2=80=AFAM Yury Norov <ynorov@nvidia.com> wrot=
e:
>
> There are 6 individual Rust KUnit tests. All the tests are compiled

I think here you mean "test suite", i.e. there are many more
individual KUnit tests than that -- hundreds at the moment (mostly
doctests).

> unconditionally now, which adds ~200 kB to the kernel image for me
> on x86_64. As Rust matures, this bloating will inevitably grow.

Yeah, options for major/relevant sets sound good, even after we split
the crate. Not sure about granularity, i.e. whether we will want a
Kconfig for every single test suite, though... Especially because we
can end up with a ton of Kconfig symbols; but I see there are a bunch
of those already in the tree in the C side, so I guess this is
expected/fine, especially given David's review.

(By the way, KUnit is not intended for production kernels, so I am not
sure it really counts as bloat in that sense.)

Thanks!

Cheers,
Miguel
