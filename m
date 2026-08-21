Received: from sphereful.davidgow.net (sphereful.davidgow.net [203.29.242.92])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 809533CF680;
	Fri, 21 Aug 2026 09:02:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=203.29.242.92
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787302928; cv=none; b=EGVuRmcQaVEuOGOlCovX/Kw2oAZBPv1IshQycyF/hm/bHdtpOPoZe5P/tw/WWFpLPrVNiP5fkovVyX77TnKN1ef4Py+EFIsHFA+2oDlom+h7o3pMzz/I6Ab6VF+kk83r0oOW3TBHdNDckcOMwJUn9OMYnu1h3XRxWkvcbtARPIM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787302928; c=relaxed/simple;
	bh=DF3hkVohXJwzXgxp9eTj2JgJHL12sbK+hXi2Wg/ZYx4=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=MwFMKxCWyJpJUTOzMQ1YdCKCn9UqvnPZuBoEm/NjfBVmlwzUdS7TD9533ZsZM2HbL7lMREFVuw01l8od3wGUHOk/pI3TlQCaW13Hsoxbc9ZHjhPhab8/fE3o6NtJf+BWysJictXY9wHjGRIXW7H4gBr0m1p4y6/WZaBA3N2NAWc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=davidgow.net; spf=pass smtp.mailfrom=davidgow.net; arc=none smtp.client-ip=203.29.242.92
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=davidgow.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=davidgow.net
Received: by sphereful.davidgow.net (Postfix, from userid 119)
	id 4DD2B1EAA56; Fri, 21 Aug 2026 17:01:56 +0800 (AWST)
X-Spam-Level: 
Received: from [IPV6:2001:8003:8802:7000::41b] (unknown [IPv6:2001:8003:8802:7000::41b])
	by sphereful.davidgow.net (Postfix) with ESMTPSA id D09D61EAA47;
	Fri, 21 Aug 2026 17:01:51 +0800 (AWST)
Message-ID: <09b0ce81-0071-4df3-9f0e-a54269d04c97@davidgow.net>
Date: Fri, 21 Aug 2026 17:01:47 +0800
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 0/2] rust: kunit: add optional assertions to catch taint
 and lockdep warnings
To: Malte Wechter <maltewechter@gmail.com>,
 Brendan Higgins <brendan.higgins@linux.dev>, Rae Moar <raemoar63@gmail.com>,
 Miguel Ojeda <ojeda@kernel.org>, Boqun Feng <boqun@kernel.org>,
 Gary Guo <gary@garyguo.net>, =?UTF-8?Q?Bj=C3=B6rn_Roy_Baron?=
 <bjorn3_gh@protonmail.com>, Benno Lossin <lossin@kernel.org>,
 Andreas Hindborg <a.hindborg@kernel.org>, Alice Ryhl <aliceryhl@google.com>,
 Trevor Gross <tmgross@umich.edu>, Danilo Krummrich <dakr@kernel.org>,
 Daniel Almeida <daniel.almeida@collabora.com>,
 Tamir Duberstein <tamird@kernel.org>, Alexandre Courbot
 <acourbot@nvidia.com>, =?UTF-8?Q?Onur_=C3=96zkan?= <work@onurozkan.dev>
Cc: linux-kselftest@vger.kernel.org, kunit-dev@googlegroups.com,
 linux-kernel@vger.kernel.org, rust-for-linux@vger.kernel.org
References: <20260818-lockdep-kunit-v1-0-66ceb1a272e3@gmail.com>
Content-Language: en-US
From: David Gow <david@davidgow.net>
In-Reply-To: <20260818-lockdep-kunit-v1-0-66ceb1a272e3@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

Le 18/08/2026 à 23:20, Malte Wechter a écrit :
> Add configs that enable extra assertions to be emitted to KUnit test
> cases. This makes a subset of concurrency related warnings fail unit test
> cases, and not stay as silent warnings.
> 
> Signed-off-by: Malte Wechter <maltewechter@gmail.com>
> ---

Hi Malte,

Thanks for sending these in: I think they're worthwhile additions to KUnit.

My preference, however, would be to have these features added to the 
core KUnit implementation (in C), rather than specifically to the Rust 
bindings. This way, tests written in both languages will be able to 
benefit from them, rather than just tests written in Rust.

The other option, which may be better, is to have the warning and/or 
lockdep code fail the current test. This would have some slightly 
different tradeoffs (for example, it would only trigger if the test 
thread caused the issue), but would make it easier to integrate with 
warning suppression[1], which allows tests to deliberately trigger and 
expect warnings:
https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/commit/?id=85347718ab0dd7ede9c3e1dcff2d604c7073df05

In that case, you'd want to look into the kunit_fail_current_test() 
macro. KASAN also has a similar integration, so that KASAN failures will 
fail tests:
https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/commit/?id=c8c7016f50c85688d71feea2dba1bd955d5f5358

Cheers,
-- David

> Malte Wechter (2):
>        rust: kunit: add config to fail kunit tests if a lockdep warning is triggered
>        rust: kunit: add config to fail kunit if TAINT_WARN is set
> 
>   lib/kunit/Kconfig    | 24 ++++++++++++++++++++++++
>   rust/macros/kunit.rs | 21 +++++++++++++++++++++
>   2 files changed, 45 insertions(+)
> ---
> base-commit: 8cdeaa50eae8dad34885515f62559ee83e7e8dda
> change-id: 20260812-lockdep-kunit-9628f4bcad90
> 
> Best regards,
> --
> Malte Wechter <maltewechter@gmail.com>
> 

