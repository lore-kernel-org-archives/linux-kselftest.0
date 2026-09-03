Received: from sphereful.davidgow.net (sphereful.davidgow.net [203.29.242.92])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D99F94A5C55;
	Thu,  3 Sep 2026 12:50:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=203.29.242.92
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788439850; cv=none; b=pN4e+77hf8zezsiiW4TRw9qeIUiHqVy4E+he4O9FT7zG/qoQt0j4sjUlKAd/RKPMrT2D3Pr7mcYihDM1V5PC7mdc+Dn6fMstpNC+tmeSZ3VKsIFZnWNdcUCFeW848RnJ90Hqp+0SEPbzM1pg8KIADn9EqOzznZME4Z5UjuCD4do=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788439850; c=relaxed/simple;
	bh=Q9Ag8UhZfFIg30b0p1hfLWvvAOk537smwoJLAfBKCPg=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=HDC59EMUsRn7IDqKQXiUxOJGc27h4Yza6D8zPahWj1ks24oI/uA1Cc6vuRFFcd8UJzDESlVraJTG/Clb+QvRQAqXp5aTg0PHspJLWDafJFWLuipjuAI657pxcHK/urdNtjX2ZpFaEXtmay6DAG0FRd5KdYuk1oELcupNusn+cY8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=davidgow.net; spf=pass smtp.mailfrom=davidgow.net; arc=none smtp.client-ip=203.29.242.92
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=davidgow.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=davidgow.net
Received: by sphereful.davidgow.net (Postfix, from userid 119)
	id 5435420012E; Thu,  3 Sep 2026 20:50:46 +0800 (AWST)
X-Spam-Level: 
Received: from [IPV6:2001:8003:8802:7000::9c4] (unknown [IPv6:2001:8003:8802:7000::9c4])
	by sphereful.davidgow.net (Postfix) with ESMTPSA id EFA30200113;
	Thu,  3 Sep 2026 20:50:41 +0800 (AWST)
Message-ID: <c724e706-ef52-4a77-b31d-03d2bd137d4b@davidgow.net>
Date: Thu, 3 Sep 2026 20:50:39 +0800
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 0/3] rust: doctest: unify with other kunit tests
To: Gary Guo <gary@garyguo.net>, Miguel Ojeda <ojeda@kernel.org>,
 Boqun Feng <boqun@kernel.org>, =?UTF-8?Q?Bj=C3=B6rn_Roy_Baron?=
 <bjorn3_gh@protonmail.com>, Benno Lossin <lossin@kernel.org>,
 Andreas Hindborg <a.hindborg@kernel.org>, Alice Ryhl <aliceryhl@google.com>,
 Trevor Gross <tmgross@umich.edu>, Danilo Krummrich <dakr@kernel.org>,
 Daniel Almeida <daniel.almeida@collabora.com>,
 Tamir Duberstein <tamird@kernel.org>, Alexandre Courbot
 <acourbot@nvidia.com>, =?UTF-8?Q?Onur_=C3=96zkan?= <work@onurozkan.dev>,
 Brendan Higgins <brendan.higgins@linux.dev>, Rae Moar <raemoar63@gmail.com>
Cc: rust-for-linux@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-kselftest@vger.kernel.org, kunit-dev@googlegroups.com
References: <20260902-kunit-v2-0-eda3ed6c00c5@garyguo.net>
From: David Gow <david@davidgow.net>
Content-Language: fr
In-Reply-To: <20260902-kunit-v2-0-eda3ed6c00c5@garyguo.net>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Le 03/09/2026 à 5:59 AM, Gary Guo a écrit :
> Currently in Rust, kunit tests are handled with `kunit_tests`, while the
> doctests generate a lot `extern "C"` functions and invoke them through a
> generated C wrapper.
> 
> This is currently needed because of the special treatment of file name and
> line numbers from doctests. Convert them to override `file!()` and
> `line!()` macro instead, and use them inside `kunit_assert!`.
> 
> With this it is possible to just generate `#[kunit_tests]` and `#[test]`
> for doctests.
> 
> David mentioned in [1] that this should route via the Rust tree.
> 
> Link: https://lore.kernel.org/rust-for-linux/e30d16ec-f5a3-4cd8-9b25-96e0dfa8b9d2@davidgow.net/ [1]
> 
> Signed-off-by: Gary Guo <gary@garyguo.net>
> ---
> Changes in v2:
> - Rebased on v7.3-rc1
> - Picked up tags
> - Link to v1: https://patch.msgid.link/20260616-kunit-v1-0-b191604a8d6b@garyguo.net
> 
> ---

Thanks again. This still looks good to me.

Cheers,
-- David

> Gary Guo (3):
>       rust: kunit: use `file!()` inside `kunit_assert!`
>       rust: kunit: use `line!()` inside `kunit_assert!`
>       rust: doctest: generate Rust kunit test suites
> 
>  Documentation/rust/general-information.rst |  4 +-
>  init/Kconfig                               |  3 --
>  rust/Makefile                              |  4 +-
>  rust/kernel/kunit.rs                       | 11 +++--
>  rust/kernel/str.rs                         |  2 +-
>  rust/macros/helpers.rs                     | 16 -------
>  rust/macros/kunit.rs                       |  5 +-
>  rust/macros/lib.rs                         |  5 --
>  scripts/rustdoc_test_gen.rs                | 73 ++++++++----------------------
>  9 files changed, 30 insertions(+), 93 deletions(-)
> ---
> base-commit: cee9395acd8043be0644b25c34bfa86623f2b935
> change-id: 20260616-kunit-348f2c029b1e
> 
> Best regards,
> --  
> Gary Guo <gary@garyguo.net>
> 

