Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795010476;
	b=J76FEI1yMsBGbeRVd5zlXKBMkNwWfttmLaXXmMtvzCE1yHpIqntgqefi4URMX4S1iqTX
	 mPh7zm6cK0ACNgrWnAJybhbGamrIyRdnlCMHzthPzLk9ZJATWuk9ksOF5O1urzIB/DPnM
	 1t644E2x02HezyxdtpOoN+s8bL1G4Pqnrmlsi+gp8+LYT/Z1t25dEn5ksbgXki62Cdacn
	 3fy5WUhFI/whV3Blpyx8/9yavW5wITgfmx/flVlYiSMWJmj/iOeuexYcuNOQX+hvxPPV+
	 Nu1d9MeaY8qG7uXRQhIQBNsyFQTQ2mAc53AZdb23/yfxjqgP0Ko45EdK1JIYG9fglyA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795010476;
	h=Received:DKIM-Signature:Date:From:To:Cc:Subject:Message-ID:
	 References:MIME-Version:Content-Type:Content-Disposition:
	 Content-Transfer-Encoding:In-Reply-To;
	bh=xCJF3/V2j/VYtgdoe5n0d0Dvib9Kow5LIp675t78SIo=;
	b=oL+hiSrdp8NYoFJXEkrRNoOoaGLhe7yqbWOs2jhv4r7Jt5ydbHW7+FZUSdLmOXtwCEGH
	 FnlYMccO1RXTLgKANEkXQZsEgv4RYX0KSlCq0xNzidpaXnmWxn3cNy/pFaMCwwKAkpR1f
	 wvVON79pZpZgKM/CFZQJTGGPWvaqMZA4Z62VTDOxIOZXKgGM0qnEJ6DBmjthqINK7UepK
	 zo65f6r5GVKMuTrFqq4BtrlCiVe6cT+pFORsdX8xjrUO7JcjfspXZOXuC6boeTFvdaHzT
	 LDsv24pshjFI8mxqjwTEfemeMAffecB5VTlGwWwMVTRFndOaO+hMig6A2weQjvmdP2g==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=PhzPBwJq;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5F13B606A320;
	Wed, 18 Nov 2026 14:01:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=PhzPBwJq
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0420B1F000C4;
	Wed, 18 Nov 2026 14:01:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795010476;
	bh=xCJF3/V2j/VYtgdoe5n0d0Dvib9Kow5LIp675t78SIo=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=PhzPBwJqXjG79EfgrbzEbaDb2I84ChnrTEL2H0syLUPk0NWYJ27IzOhlR/N6/cDxg
	 7s4+6XT5D3mnchCh8xxk+WwtStAk95RUXavKtHBY0Gp/O2j0zv1iydUYkPqFVG87fl
	 Y/Mzp4Obi0x6u+UWtymA/3Wr1A8KORLgH/6nHpEHFPAxfJJ7VImfeRyYlq6ym2tbnK
	 ZHkItN7tWboourbM0hZO7brgC6v6j2phkGNQcbMbPVrODVeUnGJn1qRxXY0cyujZSP
	 /G/j5rOZAxsd3R5nY2m0b9x2cF4ItrZHdVpdr6r+u0LBLV+7YqbxepWxYT3qb9lobk
	 tv8eVG34Lc0bQ==
Date: Wed, 18 Nov 2026 08:01:10 -0600
From: Rob Herring <robh@kernel.org>
To: =?iso-8859-1?Q?Nicol=E1s?= Antinori <nico.antinori.7@gmail.com>
Cc: Alice Ryhl <aliceryhl@google.com>, Benno Lossin <lossin@kernel.org>,
	Boqun Feng <boqun@kernel.org>,
	Brendan Higgins <brendan.higgins@linux.dev>,
	Daniel Almeida <daniel.almeida@collabora.com>,
	Danilo Krummrich <dakr@kernel.org>, David Gow <david@davidgow.net>,
	Gary Guo <gary@garyguo.net>, Miguel Ojeda <ojeda@kernel.org>,
	Onur =?iso-8859-1?Q?=D6zkan?= <work@onurozkan.dev>,
	Shuah Khan <skhan@linuxfoundation.org>,
	Alexandre Courbot <acourbot@nvidia.com>,
	Andreas Hindborg <a.hindborg@kernel.org>,
	=?iso-8859-1?Q?Bj=F6rn?= Roy Baron <bjorn3_gh@protonmail.com>,
	Burak Emir <burak.emir@gmail.com>, Rae Moar <raemoar63@gmail.com>,
	Tamir Duberstein <tamird@kernel.org>,
	Trevor Gross <tmgross@umich.edu>, Yury Norov <yury.norov@gmail.com>,
	kunit-dev@googlegroups.com, linux-kernel@vger.kernel.org,
	linux-kselftest@vger.kernel.org, rust-for-linux@vger.kernel.org,
	linux-doc@vger.kernel.org
Subject: Re: [PATCH v3 1/3] rust: kunit: add #[should_panic] support
Message-ID: <20261118140110.GB577511-robh@kernel.org>
References: <20261113-rust_kunit_v6_send-v3-0-0d7832c07166@gmail.com>
 <20261113-rust_kunit_v6_send-v3-1-0d7832c07166@gmail.com>
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Post: <mailto:linux-kselftest@vger.kernel.org>
List-Help: <mailto:linux-kselftest+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kselftest+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20261113-rust_kunit_v6_send-v3-1-0d7832c07166@gmail.com>

On Fri, Nov 13, 2026 at 03:20:55PM -0300, Nicolás Antinori wrote:
> KUnit tests in Rust are written using user-space like syntax. This patch
> adds support for the `#[should_panic]` attribute, enabling the user to
> test conditions that are expected to cause a panic and report the test
> as successful.
> 
> Signed-off-by: Nicolás Antinori <nico.antinori.7@gmail.com>
> ---
>  Documentation/rust/testing.rst |  8 ++++-
>  drivers/of/overlay_test.c      |  6 +++-

Acked-by: Rob Herring (Arm) <robh@kernel.org>

>  include/kunit/test.h           |  9 ++++-
>  lib/kunit/attributes.c         | 18 ++++++++++
>  lib/kunit/kunit-test.c         | 36 ++++++++++++++++----
>  lib/kunit/platform-test.c      |  6 +++-
>  lib/kunit/string-stream-test.c |  9 ++++-
>  lib/kunit/test.c               | 10 ++++--
>  rust/kernel/kunit.rs           | 32 ++++++++++++++++++
>  rust/kernel/lib.rs             | 43 +++++++++++++++++++++--
>  rust/macros/kunit.rs           | 77 +++++++++++++++++++++++++++++-------------
>  11 files changed, 215 insertions(+), 39 deletions(-)
