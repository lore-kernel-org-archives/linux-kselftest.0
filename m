Received: from sendmail.purelymail.com (sendmail.purelymail.com [34.202.193.197])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 38953352032
	for <linux-kselftest@vger.kernel.org>; Wed,  1 Jul 2026 01:39:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=34.202.193.197
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782869997; cv=none; b=JNd4Yam+CJzW115Mr7MuYjLlRcqwAqphxOLIfQ0nxoTCmyhRSR7aMl9C2HgdILycbz4r0kCkJSm9W2vujOEFPEIfhRm0kH0bELWjftzf6GUeeOv+9aj1MqO8fITVXlTk1XkJWYpkQHbLDnfiWUASDSK3zAmF7BcUWBDpJ/C8P/A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782869997; c=relaxed/simple;
	bh=r6P87TDBgKgJToiem87UMdiReewt6xr/ohCDs11d6e0=;
	h=MIME-Version:Date:From:To:Cc:Subject:In-Reply-To:References:
	 Message-ID:Content-Type; b=b6neM8YTypVpWlw+H+u25Hn85iTPpVYe+sxyBav5nH6+MrGd+g4mLV41ic0E8jk5m1zADXkUqRPiueLrNOQeo7uPCQECpRjW3Y7gzacSkXIjz0FSAelox/R/QqLYxqF4Hn2nh8zyA5mZUz5s7QfvtBf3i4UarsLlYIVlnASB/Jc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nikableh.moe; spf=pass smtp.mailfrom=nikableh.moe; dkim=pass (2048-bit key) header.d=nikableh.moe header.i=@nikableh.moe header.b=ty5pyvCd; dkim=pass (2048-bit key) header.d=purelymail.com header.i=@purelymail.com header.b=cXfYuPB4; arc=none smtp.client-ip=34.202.193.197
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nikableh.moe
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nikableh.moe
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=nikableh.moe header.i=@nikableh.moe header.b="ty5pyvCd";
	dkim=pass (2048-bit key) header.d=purelymail.com header.i=@purelymail.com header.b="cXfYuPB4"
DKIM-Signature: a=rsa-sha256; b=ty5pyvCdiB/gXT7reCiVKRSn3vu7aH/IhQvFoLbPIB3r7ppaeCkpOWjPN0MeFU3kWYBS5zTh5s8HiPWB3dwvcfhHpJTtOZUZtd+KD0wiYl5M/D4JGV+8zP4t5pBb9ciB7lxbgTJt1mOxsgi3daUbKpaIM6S7vv4d9LNMv4xsYSmNCc5ODIq2R10vfz474i15b+GYQ/kgPar9/t8OhotFiigOgfMxuwhR4ZOmzgSpNPzLaepX6NzO5Ot7eF/hXU7pYF3Q67+ipHKfndOC8PMd65uYLduTN2Yk3c/1X9PGoNRPKqGjPxZEnBWC2ydadAhSsJb2YE4xVhNgVljHXA53lA==; s=purelymail2; d=nikableh.moe; v=1; bh=r6P87TDBgKgJToiem87UMdiReewt6xr/ohCDs11d6e0=; h=Received:Date:From:To:Subject;
DKIM-Signature: a=rsa-sha256; b=cXfYuPB4yzP89CYdlinsWzT50XBgh81sg1gycldmpe8ukBWcEVVXULtTkXSZafY8m6doiJ+cdhVmWAmaMp8pRFq5dINIl+Vbj6h5Kw/AR1JNRsbJMKkGaae3fCFawwRRdlRIE9XlYYrec+U/B08zRskekq0+XdhCoIQSWd0NJn4Nfp0YuGEHk3FzgMAxJJB618bQAYGO6IxzzlflU72NHuAJUtTuLS22KkY+haSyf7SkxVMqheQo2Eidl91074JZRqiZCM97TifVrBfLhYklqnSBkV5903kgM3jPp+Y+Bu0/Fc0/0Qwi7XpN7joY9i0RakQhDpyHyeGZIxp/9bdeAg==; s=purelymail2; d=purelymail.com; v=1; bh=r6P87TDBgKgJToiem87UMdiReewt6xr/ohCDs11d6e0=; h=Feedback-ID:Received:Date:From:To:Subject;
Feedback-ID: 209604:18551:null:purelymail
X-Pm-Original-To: linux-kselftest@vger.kernel.org
Received: by smtp.purelymail.com (Purelymail SMTP) with ESMTPA id 2143755734;
          Wed, 01 Jul 2026 01:39:12 +0000 (UTC)
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Date: Wed, 01 Jul 2026 03:39:12 +0200
From: Nika Krasnova <nika@nikableh.moe>
To: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Cc: Miguel Ojeda <ojeda@kernel.org>, Boqun Feng <boqun@kernel.org>, Gary Guo
 <gary@garyguo.net>, =?UTF-8?Q?Bj=C3=B6rn_Roy_Baron?=
 <bjorn3_gh@protonmail.com>, Benno Lossin <lossin@kernel.org>, Andreas
 Hindborg <a.hindborg@kernel.org>, Alice Ryhl <aliceryhl@google.com>, Trevor
 Gross <tmgross@umich.edu>, Danilo Krummrich <dakr@kernel.org>, Daniel
 Almeida <daniel.almeida@collabora.com>, Tamir Duberstein
 <tamird@kernel.org>, Alexandre Courbot <acourbot@nvidia.com>,
 =?UTF-8?Q?Onur_=C3=96zkan?= <work@onurozkan.dev>, Viresh Kumar
 <viresh.kumar@linaro.org>, Yury Norov <yury.norov@gmail.com>, Lorenzo
 Stoakes <ljs@kernel.org>, Brendan Higgins <brendan.higgins@linux.dev>, David
 Gow <david@davidgow.net>, Rae Moar <raemoar63@gmail.com>,
 rust-for-linux@vger.kernel.org, linux-kernel@vger.kernel.org,
 kunit-dev@googlegroups.com, linux-kselftest@vger.kernel.org
Subject: Re: [PATCH 0/2] rust: kernel: add cfg_select! and use it for
 config-based selection
In-Reply-To: <CANiq72nVwM_OF4yz1rB4Q-atDgZ9Oywbuhu830jfQe7npt0FeQ@mail.gmail.com>
References: <20260629-backport-cfg_select-v1-0-388d5d31d9d4@nikableh.moe>
 <CANiq72kG8k3mk+Xjr6q7aKg212QUNtZk5w4rxV=UGR5UXKE_ng@mail.gmail.com>
 <0eb77f4b7199e9af01d61e0c1ac03c99@purelymail.com>
 <CANiq72nVwM_OF4yz1rB4Q-atDgZ9Oywbuhu830jfQe7npt0FeQ@mail.gmail.com>
User-Agent: Purely Mail via Roundcube/1.6.16
Message-ID: <4b9622008ce92cfb5da5d96397ce4c36@purelymail.com>
X-Sender: nika@nikableh.moe
Content-Type: text/plain; charset=US-ASCII;
 format=flowed
Content-Transfer-Encoding: 7bit

On 2026-06-29 21:07:34 +0200, Miguel Ojeda wrote:
> The tracking issue says the latest change was in Rust 1.91.0. Did it
> not work there? Were there changes after that?

Checked 1.91.0 directly: core::cfg_select is there behind
#![feature(cfg_select)] and behaves the same as 1.94.1 -- single-brace
expression position included. So 1.91.0 is the cutoff (RUSTC_VERSION >=
109100), nothing changed between 1.91.0 and 1.94.1.

> [...] If I understand you correctly, you are saying that even with
> the conversion here, we wouldn't even need the expression case, no?

That is correct. Everything in this series is item or statement 
position;
nothing uses the expression-operand form.

> [...] if we want to go with this one in all versions, then we should
> make sure we only allow that subset that cleanly maps to the future.

Agreed. I'll restrict the fallback to exactly that subset
(item/statement, single braces) by dropping the expression-operand form.
Everyone hits the fallback until the MSRV bump, so a non-portable use
fails uniformly instead of compiling locally and breaking in linux-next.
The accepted subset is a strict subset of core::cfg_select, so the
eventual switch needs no call-site changes. (I'll also have the fallback
emit compile_error! on no-match, to match core.)

> Now, to be honest, the easiest is to just wait a year and then start
> using `core`'s directly... i.e. it is not like we are in a rush to
> start using it anyway...

Fair, I'm fine with dropping it. The counterargument is that the 
fallback
is small and self-contained, and the conversion removes a chunk of
easy-to-desync pairs of #[cfg] now rather than in a year. Happy to send 
a
v2 if you want it.

-- 
Nika Krasnova
