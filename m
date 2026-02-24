Received: from sphereful.davidgow.net (sphereful.davidgow.net [203.29.242.92])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 23FDF24C692;
	Tue, 24 Feb 2026 09:01:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=203.29.242.92
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1771923688; cv=none; b=JMhWDvzmO1lqTfMLNyWmKVlWCiBBJJle18BviwoLtlYAVUhZ2o2+R9Vlj/Whz+37IsqPpwOSMEx25X3mSp1MoemB+mgC3q6uvg23aCy/LEAox31kpR43nq85WxjKqs8wtjtZuTbhj2Ke44udy3SEnw/0DH6nImgVQTpvyrv+kkU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1771923688; c=relaxed/simple;
	bh=2H8VXgAySmitqc1/1olsjb9v4Rr3sDI7Qp2USSWpzyc=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=G2GUVRnJLJWdjRxReHB6q3c0yokwrwTvXyP/iOcR0aJmXeUDiIO/MNBaBMng5JOJQbQjM16urX/tNm7tlJfhX2nuQPrl+cnJg1SJDwjjI/ZHvshN/cRmLRK3OsSxqbCnsFHfRuj6ly99HPFLbm0D+WRd2iknLT86oJALvki+Ec4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=davidgow.net; spf=pass smtp.mailfrom=davidgow.net; dkim=pass (4096-bit key) header.d=davidgow.net header.i=@davidgow.net header.b=cAE6OBEK; dkim=pass (4096-bit key) header.d=davidgow.net header.i=@davidgow.net header.b=fC82Tn3e; arc=none smtp.client-ip=203.29.242.92
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=davidgow.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=davidgow.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (4096-bit key) header.d=davidgow.net header.i=@davidgow.net header.b="cAE6OBEK";
	dkim=pass (4096-bit key) header.d=davidgow.net header.i=@davidgow.net header.b="fC82Tn3e"
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=davidgow.net;
	s=201606; t=1771923677;
	bh=2H8VXgAySmitqc1/1olsjb9v4Rr3sDI7Qp2USSWpzyc=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=cAE6OBEKDeT4JGL6fyfZZgmwmu6hk35WTNaxxjpK0cBi/VjYZINZXgAsrVfydH5zK
	 vFx6K1i+gOHHx9NwmxzU7q9zzIEMKzvrQ7m0QfHnsyT8AokzJhhLGEjImlwhGLAOvf
	 oPGBriS5atF/2yNyYSrmhCQXxKQJ33jZkd1xSbA6mSLcKp/MSt+pwQiQD0K53eUA2k
	 cCIjmrxYUNDEXotRSIAZfST2+3EWBINAHgnDyFoRyJgeDZ4d5K2x9m4AR4ffNotixb
	 qwwjX1CDt38DXCtnMfAixGV92CopXUBe4kSL2zG3VVEccVs6Ot41ArsdObOjCDjOjz
	 nDn/ZrGFzuo4B4lzu5WkNaZHvjc0XbbWEd7iytWMTkppPw1C5KSRjMnFO9m+LnMpz1
	 qXLLp86KtOEdkxXSNsXsbsf3hsXOb7P2HtGKv2aB19921DoDuY/7S8T3ijUzaUcY9d
	 IiWzJQ2vOhHxvfI7LZ+kpHX+digAFGscqL3oD77YRJBsOryuk1aXc5VgsVOnkT0Yqe
	 uYpPY+saohRvzmSmKw4282g8UdrbOZT7kn3WAfG2BfiGpZEv8WsUadA2fcjR0AxB+P
	 MGQIFk16FwkqFhyVTu/+FGm5nXAuiUTSmn7HpKMPV8sb6daB+dOaMryr6IEKFp0SaK
	 Jz4BAfoaKQXU/FNJWsCph+hU=
Received: by sphereful.davidgow.net (Postfix, from userid 119)
	id AC79D1E78BC; Tue, 24 Feb 2026 17:01:17 +0800 (AWST)
X-Spam-Level: 
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=davidgow.net;
	s=201606; t=1771923674;
	bh=2H8VXgAySmitqc1/1olsjb9v4Rr3sDI7Qp2USSWpzyc=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=fC82Tn3eKR7dHipGRhSxSWuYoBurnVCsKIK33f3CuvUGO6qGNy/rmerHtiDhnRY3p
	 JkHHtDCd8Xdf4b0AmfKz/5oqndmN7IsWhbkPjwWtgZqsslwLFreMZriQuVWIgOg7Fu
	 WIwouRxGJy6dbpnAVgiNQTaYiioSpbC5kaKcJLQvpbHxrBFDPFt58BIC/xnM45CAoC
	 ZmhYxSWdvjuuc/byizL+KSdJgzco8+dY1kEaa20UyZR2hSf+ssi7++5Kfg7i4FqWFx
	 wyrGXC1Nq9YDS5rLpw918F1Xc8lsnc75zv8ZJ6nBIfT3O+fAWhGmxi7kniHonTg43t
	 g0zKLtnKICKf8/KcV1urmXQxflDdDiXFntEtJ20rmwnUFBYCCHJbBIfWxZf/GQjH5d
	 KUuxqIRZ+82l/sxDeQrkzYV5g+DoKcvaUVqQOrlJp38vsRviUCRBtMkChQPMe/fUSk
	 dQh2a4lBf/OHDTo5F4R8NozDfl3ujgkF3kuQNPSuen0ZuIdCgcQ2eYGkgP4xeMF2hd
	 LMProLFKgFXXfUfKizxYSUXS3uOIH0xfvKpMr+QhdFnlPKoMNLgi1duYKsY+F0Tf+9
	 8qEvimJgtiJfdho9PKtf+dsLB8q9YUOdqldNpm/dBQxG7+g+v/kuphQeTm/U/949T5
	 iMklFQ5GUHcTTVk7+HM+FG8s=
Received: from [IPV6:2001:8003:8824:9e00::bec] (unknown [IPv6:2001:8003:8824:9e00::bec])
	by sphereful.davidgow.net (Postfix) with ESMTPSA id CB44D1E78AF;
	Tue, 24 Feb 2026 17:01:14 +0800 (AWST)
Message-ID: <b963ea9b-69d5-4d4e-8c1d-8e969c545a79@davidgow.net>
Date: Tue, 24 Feb 2026 17:01:10 +0800
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] rust: kunit: fix warning when !CONFIG_PRINTK
To: Alexandre Courbot <acourbot@nvidia.com>,
 Brendan Higgins <brendan.higgins@linux.dev>, Rae Moar <raemoar63@gmail.com>,
 Miguel Ojeda <ojeda@kernel.org>, Boqun Feng <boqun@kernel.org>,
 Gary Guo <gary@garyguo.net>, =?UTF-8?Q?Bj=C3=B6rn_Roy_Baron?=
 <bjorn3_gh@protonmail.com>, Benno Lossin <lossin@kernel.org>,
 Andreas Hindborg <a.hindborg@kernel.org>, Alice Ryhl <aliceryhl@google.com>,
 Trevor Gross <tmgross@umich.edu>, Danilo Krummrich <dakr@kernel.org>,
 Shuah Khan <skhan@linuxfoundation.org>
Cc: linux-kselftest@vger.kernel.org, kunit-dev@googlegroups.com,
 rust-for-linux@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20260224-unused_var_err-v1-1-c51d805eceb5@nvidia.com>
Content-Language: fr
From: David Gow <david@davidgow.net>
In-Reply-To: <20260224-unused_var_err-v1-1-c51d805eceb5@nvidia.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

Le 24/02/2026 à 3:45 PM, 'Alexandre Courbot' via KUnit Development a écrit :
> If `CONFIG_PRINTK` is not set, then the following warnings are issued
> during build:
> 
>    warning: unused variable: `args`
>      --> ../rust/kernel/kunit.rs:16:12
>      |
>    16 | pub fn err(args: fmt::Arguments<'_>) {
>      |            ^^^^ help: if this is intentional, prefix it with an underscore: `_args`
>      |
>      = note: `#[warn(unused_variables)]` (part of `#[warn(unused)]`) on by default
> 
>    warning: unused variable: `args`
>      --> ../rust/kernel/kunit.rs:32:13
>      |
>    32 | pub fn info(args: fmt::Arguments<'_>) {
>      |             ^^^^ help: if this is intentional, prefix it with an underscore: `_args`
> 
> Fix this by allowing unused variables on these methods for this
> (arguably rare) case.
> 
> Fixes: a66d733da801 ("rust: support running Rust documentation tests as KUnit ones")
> Signed-off-by: Alexandre Courbot <acourbot@nvidia.com>
> ---

Thanks. I think Alice's suggestion of adding a `let _ = args;` line, 
rather than disabling the unused_variables warning is probably the 
better way of handling this.

(That being said, those err() and info() functions probably need some 
reworking so that -- in the cases where it makes sense -- they call into 
the KUnit logging functions, not just printk.)

Cheers,
-- David

>   rust/kernel/kunit.rs | 4 ++++
>   1 file changed, 4 insertions(+)
> 
> diff --git a/rust/kernel/kunit.rs b/rust/kernel/kunit.rs
> index f93f24a60bdd..5da342f5c84a 100644
> --- a/rust/kernel/kunit.rs
> +++ b/rust/kernel/kunit.rs
> @@ -13,6 +13,8 @@
>   ///
>   /// Public but hidden since it should only be used from KUnit generated code.
>   #[doc(hidden)]
> +// `args` is unused if `CONFIG_PRINTK` is not set.
> +#[allow(unused_variables)]
>   pub fn err(args: fmt::Arguments<'_>) {
>       // SAFETY: The format string is null-terminated and the `%pA` specifier matches the argument we
>       // are passing.
> @@ -29,6 +31,8 @@ pub fn err(args: fmt::Arguments<'_>) {
>   ///
>   /// Public but hidden since it should only be used from KUnit generated code.
>   #[doc(hidden)]
> +// `args` is unused if `CONFIG_PRINTK` is not set.
> +#[allow(unused_variables)]
>   pub fn info(args: fmt::Arguments<'_>) {
>       // SAFETY: The format string is null-terminated and the `%pA` specifier matches the argument we
>       // are passing.
> 
> ---
> base-commit: 6de23f81a5e08be8fbf5e8d7e9febc72a5b5f27f
> change-id: 20260224-unused_var_err-996d7ffa27c5
> 
> Best regards,

