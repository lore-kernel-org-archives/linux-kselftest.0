Received: from sphereful.davidgow.net (sphereful.davidgow.net [203.29.242.92])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0D11034E760;
	Fri, 17 Apr 2026 09:01:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=203.29.242.92
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776416493; cv=none; b=Uelyz4mRBALg2xi5eB5Kzn2HxSwiVDVIaBkHYw/o6CMt65THww+M/0Lstc+rCWTnO/Dp+gAMh0OxQ6tixG8V2AD0uyo6kU9eby2P/M7SNe0Co7ECBT6KUjD5Zv1iPzi9cyjAUu9B1jNhgq5g2S/eGQF0aK5MC+MxlkKdaxbadEI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776416493; c=relaxed/simple;
	bh=1GkrNCZpL/X+wd3koPcDl1fAtbAyop8jNVCEwtAxOe8=;
	h=Message-ID:Date:MIME-Version:Subject:To:References:From:
	 In-Reply-To:Content-Type; b=XlAnxhdhKLcKS4dQX1x9iGrIc+hEUNtUMrw2xl0LHd2eoilYRbJ1P/pkE9/pKGNVk8nr8sZzW81T4dCiduiQCtAqWG977UYMKhXp/3t0aNGr/VACJH5qokjrbXN3n0IYIOfcXopqKt5Mmq2adKUGE5SdebkXeC35usIOWcDzz00=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=davidgow.net; spf=pass smtp.mailfrom=davidgow.net; dkim=pass (4096-bit key) header.d=davidgow.net header.i=@davidgow.net header.b=T8pzOYnQ; dkim=pass (4096-bit key) header.d=davidgow.net header.i=@davidgow.net header.b=oi5uSOXf; arc=none smtp.client-ip=203.29.242.92
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=davidgow.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=davidgow.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (4096-bit key) header.d=davidgow.net header.i=@davidgow.net header.b="T8pzOYnQ";
	dkim=pass (4096-bit key) header.d=davidgow.net header.i=@davidgow.net header.b="oi5uSOXf"
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=davidgow.net;
	s=201606; t=1776416483;
	bh=1GkrNCZpL/X+wd3koPcDl1fAtbAyop8jNVCEwtAxOe8=;
	h=Date:Subject:To:References:From:In-Reply-To:From;
	b=T8pzOYnQ0EA7khJz/WKmaE0vDQhvgs7cylNDvPjCQ4krOQ4zBnMehU40rQcG6OW4k
	 JVgZwNP3kqVR4LgU/JSaniEz5DpuCg8kRBoEvA0+B4Kj50lyexo4TwUj1e66j3jUQt
	 RWe6bYHu09dy8r7ZXa8fjWflEbIoOZr3TEDT6p232EFnoFvQQoOLhWGeuro3fSDj/O
	 o1x5gjqND6fcXfJV04jkS0VUqM9G0FqxosMHMO+a+b10z2taeKvoGrkcjSCJ8bQqsy
	 vcJYJT0GECMHu8rdhgnpmVfUttLVQ3wy7Ekw6kUNiK22Fqn2PdehKui3zD4yQfquD5
	 /v7k7N3eP5RyMrfe7KijIr1YAxjRBdwisieb9PrMhGP4MFhhWDTffKpHpHa/a0L20d
	 EssgIeC+v7xE5U5gnVz4j+N8slU38AENx+tL1Ul7VDnlYRzOIMNK8B+9PMogcPbB0v
	 KAn6fdmp9iS9HqCpV4sO20bxLMCaxQwjIxMyY/MDF+odVzOzymRO9TugR8brwfnK0B
	 MNn4rHGoTO1JXPd9YMuHwREt4xXC0Ig0Bou682F/ZsyxhXJ0oAf+01E7oUFnmovbas
	 kHQeoGrghl1Zh0AuNsKTWz82idjWlGlRZ9NWU5T1I7JlbMojUJpgdmXRnm91o2tnI/
	 mvO2Fn9ILrauz5A/py58BvMk=
Received: by sphereful.davidgow.net (Postfix, from userid 119)
	id A350C1E6957; Fri, 17 Apr 2026 17:01:23 +0800 (AWST)
X-Spam-Level: 
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=davidgow.net;
	s=201606; t=1776416422;
	bh=1GkrNCZpL/X+wd3koPcDl1fAtbAyop8jNVCEwtAxOe8=;
	h=Date:Subject:To:References:From:In-Reply-To:From;
	b=oi5uSOXfxCazPX4qfJbR8ti1qKXQwb6IvCgSGMYpFtbF3Elw/Rdoi5dG6woGFjk49
	 mLGuscEGF8zLzXYyAwAQYVdr5tINQQ5h0p+3BpbmzUSb5G5KtQ0AvfAONJt9jRhT/M
	 i5MG/6xLCIsO+xmrMM9jqu2QvdKWJr/BsSlkqa8aIKIk90rZEaBdz7xsSIB21Fz6xS
	 Th/qe8QB4q4aOaDQHPHQ/WLDMWA0SnKsTRmD66DcSTIVyuwWzv5abGaZ0CUxlKjXVJ
	 85PUnBZvG6Q3yf/9ErV9fK2AgEeri8yrWWTGQ+DvajcqMGiYx3V+YozIXI4N6Dn4fE
	 jzFIm+ZGjDLjFBqrEONyiDH/TIbmu2gjzx/Bk6HJj3mbL3YN5sqEB/fZZ4y6BdMWfY
	 gDFv64mxCdXPQDlsH3DxjshUMGpxOp1CjomGzm3tS+Z/vyQcOPKV07VoQGWj2TOyST
	 F3CmB1Wxh2hC4gs/l1OOwEssh7yEmruWLp/pvFqkbJXlROOfSVX1qIQ2+5rvnkK6zC
	 tyIbyutIrSy83OwH9nnCdOwG8dYVKDXa2NEDTHVd2qdC3x2docRhDQMLHvZGdGe5Cv
	 kuK4Yu0iNEoxUmpdYcmL9npO/nmmBoKxrSFgrv/DUu7EChiWyFxKucwUOWs/ay44Uj
	 awHOKk29ulTRP9OZzAevwTk8=
Received: from [IPV6:2001:8003:8810:ea00:ed87:ca88:5326:e11d] (unknown [IPv6:2001:8003:8810:ea00:ed87:ca88:5326:e11d])
	by sphereful.davidgow.net (Postfix) with ESMTPSA id 484AA1E6957;
	Fri, 17 Apr 2026 17:00:22 +0800 (AWST)
Message-ID: <b26445d9-144c-4ace-a032-b6b70772b732@davidgow.net>
Date: Fri, 17 Apr 2026 17:00:19 +0800
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 3/3] Documentation: rust: testing: add Kconfig guidance
To: Yury Norov <ynorov@nvidia.com>, Miguel Ojeda <ojeda@kernel.org>,
 Boqun Feng <boqun@kernel.org>, Gary Guo <gary@garyguo.net>,
 =?UTF-8?Q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>,
 Benno Lossin <lossin@kernel.org>, Andreas Hindborg <a.hindborg@kernel.org>,
 Alice Ryhl <aliceryhl@google.com>, Trevor Gross <tmgross@umich.edu>,
 Danilo Krummrich <dakr@kernel.org>, Jonathan Corbet <corbet@lwn.net>,
 Shuah Khan <skhan@linuxfoundation.org>, Lorenzo Stoakes <ljs@kernel.org>,
 Vlastimil Babka <vbabka@kernel.org>,
 "Liam R. Howlett" <Liam.Howlett@oracle.com>,
 Uladzislau Rezki <urezki@gmail.com>, Burak Emir <bqe@google.com>,
 Yury Norov <yury.norov@gmail.com>,
 Brendan Higgins <brendan.higgins@linux.dev>, Rae Moar <raemoar63@gmail.com>,
 Will Deacon <will@kernel.org>, Peter Zijlstra <peterz@infradead.org>,
 Mark Rutland <mark.rutland@arm.com>, Nathan Chancellor <nathan@kernel.org>,
 Kees Cook <kees@kernel.org>, Nicolas Schier <nsc@kernel.org>,
 =?UTF-8?Q?Thomas_Wei=C3=9Fschuh?= <thomas.weissschuh@linutronix.de>,
 Thomas Gleixner <tglx@kernel.org>, Douglas Anderson <dianders@chromium.org>,
 Shakeel Butt <shakeel.butt@linux.dev>, Christian Brauner
 <brauner@kernel.org>, Randy Dunlap <rdunlap@infradead.org>,
 Tamir Duberstein <tamird@kernel.org>, rust-for-linux@vger.kernel.org,
 linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-kselftest@vger.kernel.org, kunit-dev@googlegroups.com
References: <20260417031531.315281-1-ynorov@nvidia.com>
 <20260417031531.315281-4-ynorov@nvidia.com>
Content-Language: fr
From: David Gow <david@davidgow.net>
In-Reply-To: <20260417031531.315281-4-ynorov@nvidia.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

Le 17/04/2026 à 11:15 AM, Yury Norov a écrit :
> Now that rust KUnit tests are protected with Kconfig, update the
> documentation to mention it.
> 
> Signed-off-by: Yury Norov <ynorov@nvidia.com>
> ---

Looks good to me.

Reviewed-by: David Gow <david@davidgow.net>

Cheers,
-- David

>   Documentation/rust/testing.rst | 5 ++++-
>   1 file changed, 4 insertions(+), 1 deletion(-)
> 
> diff --git a/Documentation/rust/testing.rst b/Documentation/rust/testing.rst
> index f43cb77bcc69..24de173471b2 100644
> --- a/Documentation/rust/testing.rst
> +++ b/Documentation/rust/testing.rst
> @@ -141,10 +141,13 @@ These tests are introduced by the ``kunit_tests`` procedural macro, which takes
>   the name of the test suite as an argument.
>   
>   For instance, assume we want to test the function ``f`` from the documentation
> -tests section. We could write, in the same file where we have our function:
> +tests section. We could write, in the same file where we have our function.
> +Each test is protected with the corresponding Kconfig option, see
> +rust/kernel/Kconfig.test.
>   
>   .. code-block:: rust
>   
> +	#[cfg(CONFIG_RUST_MYMOD_KUNIT_TEST)]
>   	#[kunit_tests(rust_kernel_mymod)]
>   	mod tests {
>   	    use super::*;

