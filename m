Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=203.29.242.92
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795503792;
	b=OHBWbkK+fOqgpLihSQxrzKB4uYt6nXzm5gNBI8YJgoAconUH2FyHyE1dBBQr7p5UXowW
	 V/PvpDRKjgQtPP8c5NhlszZ1gVPHx6tOTe0P+zEc4K0xifOQ8K1GuTj3hvIS/c0sVarEM
	 5MDASDG6sBVMJ2pX3//KerfZlNXse+fe0cevjs3AsG4uoMmjgvdoxv1FRfqlJJ1/pTOq6
	 jd9I7jNcPQ1u3aOVjkv29RVg4owMvoDZsBx39opSaDTt0eAtv1FAMYaS46bHosF4KZVhu
	 UFXQFvnfPCZZo8oTrK49wASY2L5b0iDNk5mWcrNgfmpQHxaNSHQOcsGyuycQlSJPrFw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795503792;
	h=DMARC-Filter:Received:X-Spam-Checker-Version:X-Spam-Level:
	 X-Spam-Status:Received:Message-ID:Date:MIME-Version:User-Agent:
	 Subject:To:Cc:References:Content-Language:From:In-Reply-To:
	 Content-Type:Content-Transfer-Encoding;
	bh=pgULmPX2IkV37esTIr12RjyMbe7G+CyAVZ6L97k4TXY=;
	b=Q2EktUxnXxGiNyY5wSOyRzXdKfXzbjY8YFghVUsdV/FDfvdBFAvNr6vh+1G4EXGLGDeA
	 nzv15qV5Kx7j3McE3B4Pai0+J99mBzi1/f8mG7L2KRjz0Xyn3csN+GR0imn9ilSoDOjN+
	 QntyJRgEJenEn+o1a/7XXAQA+qPZ8o0Xgiy9vloZlJ8KIs0NJzeXecTAAXJdHkOIx+gCA
	 ZLlKBLZL8HTWJBLpBFLAflDPwtwvpDTCi2FiZARNYa3n59cJ6wHVNy0VFmdEdouUA3GNT
	 s4AxtHH1wfnDq0nbIKARp1g50AtShoyTv0Q5lBUtqY5MFJQ/Kx+YPs0IzDd++zEv9lg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=davidgow.net;
	spf=pass smtp.mailfrom=davidgow.net;
	arc=none smtp.remote-ip=203.29.242.92
Received: from sphereful.davidgow.net (sphereful.davidgow.net [203.29.242.92])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8E92C606A31E;
	Tue, 24 Nov 2026 07:03:11 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 8E92C606A31E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=davidgow.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=davidgow.net
Received: by sphereful.davidgow.net (Postfix, from userid 119)
	id 38363200E22; Tue, 24 Nov 2026 15:03:09 +0800 (AWST)
X-Spam-Level: 
Received: from [IPV6:2001:8003:8802:7000::41b] (unknown [IPv6:2001:8003:8802:7000::41b])
	by sphereful.davidgow.net (Postfix) with ESMTPSA id 0CBBD200DE8;
	Tue, 24 Nov 2026 15:03:04 +0800 (AWST)
Message-ID: <b3285ace-e89b-4d2e-bbd0-14e7a80609ac@davidgow.net>
Date: Tue, 24 Nov 2026 15:03:00 +0800
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Post: <mailto:linux-kselftest@vger.kernel.org>
List-Help: <mailto:linux-kselftest+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kselftest+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2] rust: doctest: fix line numbers after crate-level
 attributes
To: git@younes.io, Miguel Ojeda <ojeda@kernel.org>,
 Boqun Feng <boqun@kernel.org>, Gary Guo <gary@garyguo.net>,
 =?UTF-8?Q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>,
 Benno Lossin <lossin@kernel.org>, Andreas Hindborg <a.hindborg@kernel.org>,
 Alice Ryhl <aliceryhl@google.com>, Trevor Gross <tmgross@umich.edu>,
 Danilo Krummrich <dakr@kernel.org>,
 Daniel Almeida <daniel.almeida@collabora.com>,
 Tamir Duberstein <tamird@kernel.org>, Alexandre Courbot
 <acourbot@nvidia.com>, =?UTF-8?Q?Onur_=C3=96zkan?= <work@onurozkan.dev>,
 Brendan Higgins <brendan.higgins@linux.dev>, Rae Moar <raemoar63@gmail.com>,
 Shuah Khan <skhan@linuxfoundation.org>
Cc: linux-kselftest@vger.kernel.org, kunit-dev@googlegroups.com,
 rust-for-linux@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20261107-rust-doctest-line-fix-v2-1-a66528f0a7c3@younes.io>
Content-Language: en-US
From: David Gow <david@davidgow.net>
In-Reply-To: <20261107-rust-doctest-line-fix-v2-1-a66528f0a7c3@younes.io>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

Le 08/11/2026 à 00:36, Younes Akhouayri via B4 Relay a écrit :
> From: Younes Akhouayri <git@younes.io>
> 
> When a doctest starts with a crate-level attribute such as
> `#![expect(...)]`, KUnit reports failures one line too early, and
> `line!()` returns a line number that is one too low.
> 
> This happens because `rustdoc` moves those attribute lines out of the
> test body and puts them above the `main` function it generates. The
> generator works out where the body starts by counting the lines above
> `main`, but it does not know that some of those lines were moved there
> from the body. So every line after a moved attribute is mapped one line
> too early (or more, if there are several such attributes).
> 
> For example, adding `assert_eq!(36, 0);` as line 36 of
> `rust/kernel/init.rs` (inside the doctest that starts with
> `# #![expect(clippy::undocumented_unsafe_blocks)]`) gives:
> 
>      # rust_doctest_kernel_init_rs_2: ASSERTION FAILED at rust/kernel/init.rs:35
> 
> Twelve in-tree doctests start like this, e.g. in `bits.rs`, `devres.rs`,
> `init.rs` and `std_vendor.rs`.

A quick note that the ones in bits.rs are nested in a macro, so the 
location is dubious anyway, and this doesn't fix it. Others all looked good.

> 
> Fix it by counting the attribute lines that `rustdoc` moved (every
> `#![...]` line above `main`, except the `#![allow(unused)]` that
> `rustdoc` adds itself) and taking them into account when computing
> where the body starts.
> 
> `rustdoc` always starts its output with that `#![allow(unused)]`, so
> check for it before relying on the layout. If a future `rustdoc` (or a
> crate-level `#![doc(test(attr(...)))]`) changes it, print a warning once
> and keep the previous behaviour rather than failing the build: the tests
> still run, only the reported line numbers would be off.
> 
> Only single-line attributes are handled, which covers every doctest in
> the tree today.
> 
> With this change, the example above reports `rust/kernel/init.rs:36`,
> and doctests without such attributes keep reporting the same lines as
> before.
> 
> Fixes: a66d733da801 ("rust: support running Rust documentation tests as KUnit ones")
> Signed-off-by: Younes Akhouayri <git@younes.io>
> ---
> Changes in v2:
> - Check that the generated test starts with `#![allow(unused)]` before
>    subtracting the moved lines; otherwise warn once and keep the old
>    behaviour, instead of clamping with `saturating_sub` (Miguel).
> - Note in the comment and commit message that only single-line
>    attributes are handled.
> - Link to v1: https://patch.msgid.link/20261027-rust-doctest-line-fix-v1-1-0c13185a58b6@younes.io
> ---

Thanks very much. This looks good to me!

Reviewed-by: David Gow <david@davidgow.net>

Cheers,
-- David
