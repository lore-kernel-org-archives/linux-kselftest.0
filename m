Received: from mail-dy1-f169.google.com (mail-dy1-f169.google.com [74.125.82.169])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3CE2B2C158D
	for <linux-kselftest@vger.kernel.org>; Wed,  1 Apr 2026 13:31:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.82.169
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775050312; cv=pass; b=jV6+Lh9STXgVVzJsB4DQmLzMGCnpaLmW+b/9DTtjyQM+zsNw44DP4PxMEd6dbOVXqgT3Gzjrr5IlpSosCJZNNmceKSyzzxRU3SYWS/uJGVy50YfDrCvPvcqBaH+3YII06EP/cKWa/EGlBTFPE98OfbCxb7bTU0DrQgxPB17elLY=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775050312; c=relaxed/simple;
	bh=Pxwyobpuf86TQi+f2j4+wIWXBQigp/e8eZSaPuRG5TU=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=rJyLW62d1N539xjN6P9Sv1F9W65ceWEY6ub+kTUmbWfcvJeebwa7/6iINDDR4Tm44MjMKKCjoNn9VzoyLjJzCoSWWRhk7GLixtpvoLTb2qE94FAeuBUS5E9SfsrTvSg4Yj5/8FkJlTOFnF+SZXfK2uwhPzJe51QnagFRtBstfNI=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=iheeSOM/; arc=pass smtp.client-ip=74.125.82.169
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="iheeSOM/"
Received: by mail-dy1-f169.google.com with SMTP id 5a478bee46e88-2c5cf871adcso173656eec.1
        for <linux-kselftest@vger.kernel.org>; Wed, 01 Apr 2026 06:31:51 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1775050310; cv=none;
        d=google.com; s=arc-20240605;
        b=Q4WTsRp09LKluma+Th3O39Ntjy9cWQ10lKvP9bJhZ5NDv3wnzwD78rCC62X02iwCiy
         erpVOBoq5scJumvo60Z0al5tRUKF1SEbEDnrLQh/4T8GxP3T+B4FE+s1RoscyJkaEkNz
         DC4cp4R17DcI1sN+f+cf4JdYsv8WXy2VjEd03clsNLrIaQyEF5LPJVsfBpV/9BunOHTo
         hLnRIqhtO0o3eNh+Y9qfNEfnn6T0jRRrRxrMjStCyEUfEkSozAUzcmIF876X0BP6L23c
         eAxGD1OHVdFh3NrK5uAYIYUP4LgX6DkPV8jVsTWMqAdhfENcOBXtyEzELqjqgyqHcNsp
         odfw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=Pxwyobpuf86TQi+f2j4+wIWXBQigp/e8eZSaPuRG5TU=;
        fh=rE5tY41KgFJ/VwNXIwJtRxmgx4dzgGd7xQV063FbNVw=;
        b=dQ+uDQ7UNSDCkF6PvhXSLZ2WBT25ADkHgp5ktRWlArpVN+FpigXNkyWROnFafYrnnf
         3JQ9IzTARXxHbjn5fYkwUTZlwcl920hlLgv5fInsn9zRLGzUTusjVC8wS2lUtn8Okxz5
         kIKhmRUX9M4m2cbSR88KQP5X+EcXu8Cgd+ub7IGsT4FjdE5W0jvtVhvvMQTUodF/QksF
         yjMzNQVdzeWd6trmJmDGuScWmUDNA3vTpC09wOrXfzsAVvzfFtSko+H/CJAvL7MGWJj8
         /x/pffZNTvdNqnGPiVYtPotSb5xVE4GDQzECamEegdPTTlt1EqwaZr9AWAtWkRsjyXm+
         y/6g==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1775050310; x=1775655110; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Pxwyobpuf86TQi+f2j4+wIWXBQigp/e8eZSaPuRG5TU=;
        b=iheeSOM/qlwTqLbVsiJefeHkwYJF69vrE0fo5V1kfgUbcsb7yyWjVh+FtzsiFxYiB2
         Yn3EwIwdZP+mACB9dZIA7vmKuA1Tcg9dv/f3cjoFxkJYVO9azMYPXgpyaMmaM4e4tBvO
         RDxhhh7h6nJ0A/BWEimRwqTrxCGYPHq4vNd97ByVCZWz8s+jXyAPuLqczLW+IQLFINvG
         ztceSgS4vwjmS7nMFkpjeeEWlaF6zj6d0u1J9WU4s2F8p9gGYdA55JoJpDLa39r4g15R
         k7k2jhHIWMp1fXuk2bWDz1caK4xkHT/kWjRb2JGQmGLRXECgWUmFL+30Iry6wfepfAIq
         tI1w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775050310; x=1775655110;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=Pxwyobpuf86TQi+f2j4+wIWXBQigp/e8eZSaPuRG5TU=;
        b=gW8EmZXqcgIFglcp7UGF5L0Vhw78FPALZGBhR7yo74LatpfJfb81zH7fMzPppem7ZE
         qauoslXbvbZMGNwcGwfm5O+cAl7poGzYAAvULF9nRU9PVuXMFdU7HQixUIqvacn7ay67
         pJaWL6UtH0BQNVVQfIe5ZsZlPwOZ/VnGS1FEaC2TdpKXwJOsUroP2u8cSHltfDAnduK8
         VnxHxUBQ+cAVxGTZTkmcu65hDvafojN7R+mTC1JIShRM3ellkGE+o1dl2BK0AW7nigUP
         bq+trQfaR7szJYqp6tKO/MwM9KiWlz2IuDUYJFD0z97L2Yjo6Bi7GpKolSwlKH/nGjY7
         jRAQ==
X-Forwarded-Encrypted: i=1; AJvYcCVNigblUzWCEQSIsmnW4Q23DTmjsLqRjnZP13+pWTrWfHD4eba4l4P/K0rvAR87Ig+4Z0fLjXk5m/bRgCl6NfI=@vger.kernel.org
X-Gm-Message-State: AOJu0YxQPakkqMt4xdFP2GRKfR09y72IGQKS6IPbosyXknbPNu0PvFuD
	zJbxjYbf988EvUnhAneDH+kOn5w8+ATMXoK7SASI+5uqpAuABV4gO94mhdA0EyB1ZtOVfcE5Wab
	/T2+1uMDBp8TWxNIeCwa8ycHTRoomD8k=
X-Gm-Gg: ATEYQzynZeW/pzuv8oJ4kh/1LwxB2u26zWOu/c3ZOYiq00f0OUHVeaMuVrS9cg2Vuv8
	tmznV25/7muFwl9CZv5lX9nttNNY1VGstbddoaot/8tYgZxaOfvkxGgoZ9WFxc8WL5D5aR7ucXJ
	b70l8TDV2Uttb5Ez9QKiJ8JiPNORz8pnAnVMBhVCPKHE6BIpYYzrSTETtaDkyTmhl3BWVGoxyON
	6hOMc6QlPQI5mTEcLQPYTd1xjACR45sRdhfw/UNn5YLp56bVA3EryuSoIS6YKX8uUZw8G6fxEoM
	MM8UcWb6GVwpll8R7xczpwuX8dJA4mhv8w6sMk190YbTAQyls2HbIJx16iNp2OvjGHYISaPnsJS
	GnCgqhcrfO4Bt2olVW3ZKtozzDoA5L1jpwg==
X-Received: by 2002:a05:7300:fd16:b0:2c4:6ec:141e with SMTP id
 5a478bee46e88-2c932bab66bmr849425eec.7.1775050310241; Wed, 01 Apr 2026
 06:31:50 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260401114540.30108-1-ojeda@kernel.org> <20260401114540.30108-2-ojeda@kernel.org>
 <DHHUQRB9ZL54.VQZ7OUZNSYDS@garyguo.net>
In-Reply-To: <DHHUQRB9ZL54.VQZ7OUZNSYDS@garyguo.net>
From: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Date: Wed, 1 Apr 2026 15:31:36 +0200
X-Gm-Features: AQROBzD4KmXruNHpjUyy0X5nLhLhXQUuTTY9eP3fb4LBTyRyQ4wVkUjvlUGGI0w
Message-ID: <CANiq72=FBbJ--jrzYyKe3T56YqT5eU+0DXzPG3Ho7a+D9rfu=Q@mail.gmail.com>
Subject: Re: [PATCH 01/33] rust: bump Rust minimum supported version to 1.85.0
 (Debian Trixie)
To: Gary Guo <gary@garyguo.net>
Cc: Miguel Ojeda <ojeda@kernel.org>, Nathan Chancellor <nathan@kernel.org>, Nicolas Schier <nsc@kernel.org>, 
	Danilo Krummrich <dakr@kernel.org>, Andreas Hindborg <a.hindborg@kernel.org>, 
	Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>, 
	Paul Walmsley <pjw@kernel.org>, Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>, 
	Alexandre Courbot <acourbot@nvidia.com>, David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
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
	moderated for non-subscribers <linux-arm-kernel@lists.infradead.org>, Alexandre Ghiti <alex@ghiti.fr>, 
	linux-riscv@lists.infradead.org, nouveau@lists.freedesktop.org, 
	dri-devel@lists.freedesktop.org, Rae Moar <raemoar63@gmail.com>, 
	linux-kselftest@vger.kernel.org, kunit-dev@googlegroups.com, 
	Nick Desaulniers <nick.desaulniers+lkml@gmail.com>, Bill Wendling <morbo@google.com>, 
	Justin Stitt <justinstitt@google.com>, llvm@lists.linux.dev, linux-kernel@vger.kernel.org, 
	Shuah Khan <skhan@linuxfoundation.org>, linux-doc@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Apr 1, 2026 at 3:28=E2=80=AFPM Gary Guo <gary@garyguo.net> wrote:
>
> This diff fails to apply on linux-next, due to conflict with ece7e57afd51
> ("docs: changes.rst and ver_linux: sort the lists").

Yeah, sorry, I should have added `--base-commit` -- it is `rust-next`,
i.e. 3a2486cc1da5 ("kbuild: rust: provide an option to inline C
helpers into Rust").

There will be other conflicts too, e.g. in the list of features in
`scripts/Makefile.build`.

Cheers,
Miguel
