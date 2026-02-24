Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 113473806AA;
	Tue, 24 Feb 2026 12:58:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1771937888; cv=none; b=E56yAfxqNfX50As8earXXi1zcxZ6Y26q+r16VFKz350m0LIhzascWXqP8swcQnnvyeLUf7S7FuZ0gib5XbaY/wtAS0M+f4A6ufHvS2uEgv3gUMAO83gR6f3SHC0spIRMyJp4ryeinCvCACMO4rWtFvE/sQtD4qe+MXargvRQsZU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1771937888; c=relaxed/simple;
	bh=86FnrYKHdeocxKk93hobvbgEgEi4mUoQF15f2RvWs/c=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:Message-ID:
	 MIME-Version:Content-Type; b=SYZxjNbssXKNQO55Zp1GEF2pnix9wa7EkiPf8PxPIQsCNrFYRKDyhox3+ft0wJROQ648ogruTUdQC7MNcg/1mRNMtuJblciXETW0+E1LSrhppU8CR6MvLg0M8plvqrJfS+m4wOf2tdKWKmj3LdjeoVir69gfiNAWUbqoOsZFsQc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=rInvn+Dr; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="rInvn+Dr"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C4ED3C116D0;
	Tue, 24 Feb 2026 12:58:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1771937887;
	bh=86FnrYKHdeocxKk93hobvbgEgEi4mUoQF15f2RvWs/c=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:From;
	b=rInvn+DrFJeU8uqSclSegei0JMwXxt7isJiFpaFjpGG6APBzxZJm0bUavYe7FTNHf
	 jnNYWCvoryAoaOThUSJAN7M24+9sQkIZoWo3JaXcwkt9Vas83e3iB3jJf8k+jxnR1R
	 Z1dQt9oGkZG+p5nsIQoQ344ZqMzItjsIThOPlZCnDc/geRYdQIq1CWta8PiNCyEZeI
	 z9pepfA+MKFQfImnRBcsOjX3jATS3+QdMJQBHhkS+07rlbdG7LYW9l26LLA2dak2J3
	 2SwKfkDQaESAVLX7cxWcoyz4x0hKekGxkypcdFtucGdAiqMjJBDvdhpcTyAuFWZ1lp
	 Xv+FDz2drktkg==
From: Andreas Hindborg <a.hindborg@kernel.org>
To: Alice Ryhl <aliceryhl@google.com>, Alexandre Courbot <acourbot@nvidia.com>
Cc: Brendan Higgins <brendan.higgins@linux.dev>, David Gow
 <davidgow@google.com>, Rae Moar <raemoar63@gmail.com>, Miguel Ojeda
 <ojeda@kernel.org>, Boqun Feng <boqun@kernel.org>, Gary Guo
 <gary@garyguo.net>, =?utf-8?Q?Bj=C3=B6rn?= Roy Baron
 <bjorn3_gh@protonmail.com>, Benno
 Lossin <lossin@kernel.org>, Trevor Gross <tmgross@umich.edu>, Danilo
 Krummrich <dakr@kernel.org>, Shuah Khan <skhan@linuxfoundation.org>,
 linux-kselftest@vger.kernel.org, kunit-dev@googlegroups.com,
 rust-for-linux@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] rust: kunit: fix warning when !CONFIG_PRINTK
In-Reply-To: <aZ1YGceMIEwdke96@google.com>
References: <20260224-unused_var_err-v1-1-c51d805eceb5@nvidia.com>
 <6zxySe5lMPDEmEzFi__FJK_SD3KY1H4GlXGotOfYHSILrz3Q05rKNDLrU6LEfQ1Z0hom7wDIOoCx0dV6qPaTxA==@protonmail.internalid>
 <aZ1YGceMIEwdke96@google.com>
Date: Tue, 24 Feb 2026 13:57:55 +0100
Message-ID: <87y0ki1ep8.fsf@t14s.mail-host-address-is-not-set>
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain

"Alice Ryhl" <aliceryhl@google.com> writes:

> On Tue, Feb 24, 2026 at 04:45:30PM +0900, Alexandre Courbot wrote:
>> If `CONFIG_PRINTK` is not set, then the following warnings are issued
>> during build:
>>
>>   warning: unused variable: `args`
>>     --> ../rust/kernel/kunit.rs:16:12
>>     |
>>   16 | pub fn err(args: fmt::Arguments<'_>) {
>>     |            ^^^^ help: if this is intentional, prefix it with an underscore: `_args`
>>     |
>>     = note: `#[warn(unused_variables)]` (part of `#[warn(unused)]`) on by default
>>
>>   warning: unused variable: `args`
>>     --> ../rust/kernel/kunit.rs:32:13
>>     |
>>   32 | pub fn info(args: fmt::Arguments<'_>) {
>>     |             ^^^^ help: if this is intentional, prefix it with an underscore: `_args`
>>
>> Fix this by allowing unused variables on these methods for this
>> (arguably rare) case.
>>
>> Fixes: a66d733da801 ("rust: support running Rust documentation tests as KUnit ones")
>> Signed-off-by: Alexandre Courbot <acourbot@nvidia.com>
>
> I think this would be a better fix:
>
> diff --git a/rust/kernel/kunit.rs b/rust/kernel/kunit.rs
> index f93f24a60bdd..dbf3c62ffa09 100644
> --- a/rust/kernel/kunit.rs
> +++ b/rust/kernel/kunit.rs
> @@ -23,6 +23,9 @@ pub fn err(args: fmt::Arguments<'_>) {
>              core::ptr::from_ref(&args).cast::<c_void>(),
>          );
>      }
> +
> +    #[cfg(not(CONFIG_PRINTK))]
> +    let _ = args;
>  }
>
>  /// Prints a KUnit info-level message.
> @@ -39,6 +42,9 @@ pub fn info(args: fmt::Arguments<'_>) {
>              core::ptr::from_ref(&args).cast::<c_void>(),
>          );
>      }
> +
> +    #[cfg(not(CONFIG_PRINTK))]
> +    let _ = args;
>  }
>
>  /// Asserts that a boolean expression is `true` at runtime.

Why not a conditional attribute on the argument?


Best regards,
Andreas Hindborg


