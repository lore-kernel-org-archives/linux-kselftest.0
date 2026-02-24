Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 29CEA3803F0;
	Tue, 24 Feb 2026 11:51:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1771933892; cv=none; b=Lyk9ydsRSirT5OCVnOsJJ2ariQqnahb1ogsdMqS4tyyk45/E+SmpyviPaqMkBdUfIu7fHFZCD2+mq8Lb05QmhQtEtY3nHN2uTvzbTHwPbmR3NCGguErfmYxGi6B9hfRfy60By3A1UMyXVnTYEudMuTd3LC5MoSH9fsACK4wbhDs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1771933892; c=relaxed/simple;
	bh=4VNgnicEjZ38nEs7xq35KIhQiHyqnLARbfOglvoFey8=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:Message-ID:
	 MIME-Version:Content-Type; b=VwGu/yQYvLAhFf/0irRgvOP435/YpoKWnbbeRli+uwzm2pvyncyzhpHnZ4lrT7qLNtkFR6Jth84wtITgeMUrKS8FQfwnmdM1Jev4pUJ/vE7s89uHQzdiyZ4pAtiGUwUvjBGVvQAi3ifhTGG2tJq5Vu34F/gucOHNkqJFBsV03bk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=krk0nbNt; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="krk0nbNt"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E5B72C116D0;
	Tue, 24 Feb 2026 11:51:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1771933891;
	bh=4VNgnicEjZ38nEs7xq35KIhQiHyqnLARbfOglvoFey8=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:From;
	b=krk0nbNtSAIP7uzPsl0zOdLAuVXXG+IGSiktqans5N1zr7tXQzE9tY+hnoORTXUvM
	 b7VDC49bUTFlcZXLTy5fGwFPOPxbSZehcJfdv8LWc/F61DvfLpbsxfxC+lT556KB1m
	 5LSMHUAkQd8a1Kx+rjzpBRNljylG1nWE0mEcNoKOwlEt97X0JrC5tikWmwPxJZpoAB
	 RixV+JexEtyH51/Er4kFt8Ic0xp8Dp9mprrGyRLnOZLN9TSyMIArtfue1nO/Eh41J7
	 WUoAq3agL4F0IJ1xLiKYo7y/jF1bju1ShwIPDQWSnO2HHsaMtGSES0UZueU29N8cMg
	 4B1Rjg9QNUeFw==
From: Andreas Hindborg <a.hindborg@kernel.org>
To: Alexandre Courbot <acourbot@nvidia.com>, Brendan Higgins
 <brendan.higgins@linux.dev>, David Gow <davidgow@google.com>, Rae Moar
 <raemoar63@gmail.com>, Miguel Ojeda <ojeda@kernel.org>, Boqun Feng
 <boqun@kernel.org>, Gary Guo <gary@garyguo.net>, =?utf-8?Q?Bj=C3=B6rn?= Roy
 Baron
 <bjorn3_gh@protonmail.com>, Benno Lossin <lossin@kernel.org>, Alice Ryhl
 <aliceryhl@google.com>, Trevor Gross <tmgross@umich.edu>, Danilo Krummrich
 <dakr@kernel.org>, Shuah Khan <skhan@linuxfoundation.org>
Cc: linux-kselftest@vger.kernel.org, kunit-dev@googlegroups.com,
 rust-for-linux@vger.kernel.org, linux-kernel@vger.kernel.org, Alexandre
 Courbot <acourbot@nvidia.com>
Subject: Re: [PATCH v2] rust: kunit: fix warning when !CONFIG_PRINTK
In-Reply-To: <20260224-unused_var_err-v2-1-337f9359d98e@nvidia.com>
References: <Qrs5fItWst004EC_jGHvnTB2s8QuVM9cnRKIhUuImhaSV8qhL9DmqifhAqLFPSEf1JYNS9J-1hWqvptIARahvQ==@protonmail.internalid>
 <20260224-unused_var_err-v2-1-337f9359d98e@nvidia.com>
Date: Tue, 24 Feb 2026 12:51:18 +0100
Message-ID: <871pia2wcp.fsf@t14s.mail-host-address-is-not-set>
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain

"Alexandre Courbot" <acourbot@nvidia.com> writes:

> If `CONFIG_PRINTK` is not set, then the following warnings are issued
> during build:
>
>   warning: unused variable: `args`
>     --> ../rust/kernel/kunit.rs:16:12
>     |
>   16 | pub fn err(args: fmt::Arguments<'_>) {
>     |            ^^^^ help: if this is intentional, prefix it with an underscore: `_args`
>     |
>     = note: `#[warn(unused_variables)]` (part of `#[warn(unused)]`) on by default
>
>   warning: unused variable: `args`
>     --> ../rust/kernel/kunit.rs:32:13
>     |
>   32 | pub fn info(args: fmt::Arguments<'_>) {
>     |             ^^^^ help: if this is intentional, prefix it with an underscore: `_args`
>
> Fix this by adding a no-op assignment using `args` when `CONFIG_PRINTK`
> is not set.
>
> Fixes: a66d733da801 ("rust: support running Rust documentation tests as KUnit ones")
> Signed-off-by: Alexandre Courbot <acourbot@nvidia.com>
> ---
> Changes in v2:
> - Use a no-op assignment instead of the wider `#[allow(unused_variables)]`.
> - Link to v1: https://patch.msgid.link/20260224-unused_var_err-v1-1-c51d805eceb5@nvidia.com
> ---
>  rust/kernel/kunit.rs | 8 ++++++++
>  1 file changed, 8 insertions(+)
>
> diff --git a/rust/kernel/kunit.rs b/rust/kernel/kunit.rs
> index f93f24a60bdd..a1edf7491579 100644
> --- a/rust/kernel/kunit.rs
> +++ b/rust/kernel/kunit.rs
> @@ -14,6 +14,10 @@
>  /// Public but hidden since it should only be used from KUnit generated code.
>  #[doc(hidden)]
>  pub fn err(args: fmt::Arguments<'_>) {
> +    // `args` is unused if `CONFIG_PRINTK` is not set - this avoids a build-time warning.
> +    #[cfg(not(CONFIG_PRINTK))]
> +    let _ = args;

I think (didn't test) that you can use a conditional attribute [1] instead:

 pub fn err(
     #[cfg_attr(not(CONFIG_PRINTK), expect(unused))]
     args: fmt::Arguments<'_>
 ) {

Best regards,
Andreas Hindborg


[1] https://doc.rust-lang.org/reference/conditional-compilation.html#the-cfg_attr-attribute

