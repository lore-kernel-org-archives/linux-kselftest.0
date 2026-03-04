Received: from sphereful.davidgow.net (sphereful.davidgow.net [203.29.242.92])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 83ACB39099F;
	Wed,  4 Mar 2026 09:16:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=203.29.242.92
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772615791; cv=none; b=ALDX8E4xIdS/pHCGrFpuPMG1pV10r07PJEffX67YEK48BWPf1L7GZdesMa4EyAlRCg4eDz0KD6n7/gha6QqlkeNK78N6XZPponoPUc8G9Dp3u+3W8P3jKROoiIO458G1FntlzL7KPdKTcMqmUDxvZ+llp21bYz8LHO3riL94Tys=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772615791; c=relaxed/simple;
	bh=Am4689arr7P914TeAYzf6//H6VAhuPW7IWbal7O2ZPc=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=c/BdwVMg83qdGaEExWHPwFp/5c5JfhgZMxUalO5xuppdKciRzD2OZMNvWXNp6es5c6HWSkPa6hNYlY0UwfmmgM3mEInKN9UusYlmL2/PJ+6OWF86eFB63OVMZF09P5dfsiJLWUp05ucO7HL3Z7SNdIzET+39o5bdxDYm06RSZyg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=davidgow.net; spf=pass smtp.mailfrom=davidgow.net; dkim=pass (4096-bit key) header.d=davidgow.net header.i=@davidgow.net header.b=lU09OLIu; dkim=pass (4096-bit key) header.d=davidgow.net header.i=@davidgow.net header.b=pcEBagNO; arc=none smtp.client-ip=203.29.242.92
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=davidgow.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=davidgow.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (4096-bit key) header.d=davidgow.net header.i=@davidgow.net header.b="lU09OLIu";
	dkim=pass (4096-bit key) header.d=davidgow.net header.i=@davidgow.net header.b="pcEBagNO"
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=davidgow.net;
	s=201606; t=1772615781;
	bh=Am4689arr7P914TeAYzf6//H6VAhuPW7IWbal7O2ZPc=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=lU09OLIu5Vq8XCgHMiaaxVBTbU6eAwAKZ+FjaNAKqH8vc229XrlsRygmYVEL+PYRV
	 IcpZs0uuMa1lvmBdme3TgAwIOIytTV9CiThz8wR+oujA5TpS6NYzAlYa4KCupCZzt2
	 6ZrIwIy2HbTHU3Z4HlduZbjAwMl39Zjr8LN/7IZVmdodZkgQIh28bX0iDD9S/3YNQO
	 on4lzpc0F/AE+Egrw514bwADpShDZqOMUpTlox/LN0EUNtnvF3nkzIKWNc2w4HTcdh
	 Hk7cT317UIl6T2oH7H4SfTbuwpzaa20s/Pcn4ux+MERsCj/FfhJ4LzeWlmw3KDv9ij
	 l/3DeHRQpcQCQH8DJGr7ZQN0fLgNKJwBZR5hzRpWepBlSJ+R6Bo7tMFwOeqCiz2gnd
	 0tdMC06nK4G1H/OOZ6jUjDZuXbBotkxjlGEHjmUU9/KOYPY2uDYgIVrg4niONY/Xz6
	 jhjOOEo94vIbKeg5romWhiDFHYoVgM3VzuIpunLvAasu23PdqVxhYW2N5a/l7QUfFW
	 YMKngEzKygtc9yqjxWaOeUvKMb4vxTljrbJ211mlsbR0oCE2KzBm4L4EyTOGNAPDu2
	 Za02v+0Z/a8x7cwdT1L9ogFSxcUgG0UZfAuDSWsxCH2JcOyvqkjg1nAgrllAL6Hqy/
	 wpNsQyxVD81O6aSbug2xibaw=
Received: by sphereful.davidgow.net (Postfix, from userid 119)
	id D72FC1E7BE2; Wed,  4 Mar 2026 17:16:21 +0800 (AWST)
X-Spam-Level: 
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=davidgow.net;
	s=201606; t=1772615779;
	bh=Am4689arr7P914TeAYzf6//H6VAhuPW7IWbal7O2ZPc=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=pcEBagNO7TKacj4/Fe+ncXPjD/nHBVOGVFf9A/YOsU8GGivW9Dwpt9BoWX5MQkYbG
	 n7u6hMW1gLUOfL9zBRnMOdLzOPvOJKqxWDH7kHeJi0Af6TNaijosQ+hVyxRHz/VtKc
	 2NTsMKFdbpo3vxio/1IpC3aiPmOd5nBqByY8tsp82h+PawtqT+QvKp5IPBbzFvxPJg
	 Me6d5T16tpYePrCUhsglVRJjz+Jsl9ncIKtWf6CUXhes3zztAC4MkYEimfZFiSYLF1
	 1lQAaY9hmYa6pPJA3VwpUdrKKAm0D1019SQQFsJVExFzEH6zAc2Y45UqdOTEcQ70VZ
	 A7gWrI8gNI3/XyaXC3vLWXP8vM4zjpsiNv4tZX/pfhgEiFjjbKMk++WifApTj1xyzK
	 HRUYzjqldcXRCKFQGJhYpBZH6ZcrsVlopZxB0+NDCnSeqzmq0EvocjwTSyZpwZeAQS
	 H5A2LZb+XTBwbHD23Z0Qq9XaZ5u1Eb+fKbfCt9J2by8ktU13fnALtlsNBd6mQ9DtnL
	 WgAXI/zrNzD2zSmDr2D5ieNDF7EUal19v55L+tMGgPfvbZXHCPK6qCBPbdtY+s15wH
	 RA7kg6Yq8cPQaRA4tnVRGqTOK8YDDdCfxFfGdJ1CjU4vFXenC63PbczmxUlgX5Zj1n
	 V8Ttz5Na7HAmQoUZr+/r04Qw=
Received: from [IPV6:2001:8003:8824:9e00:6d16:7ef9:c827:387c] (unknown [IPv6:2001:8003:8824:9e00:6d16:7ef9:c827:387c])
	by sphereful.davidgow.net (Postfix) with ESMTPSA id 7857C1E7BD1;
	Wed,  4 Mar 2026 17:16:19 +0800 (AWST)
Message-ID: <cccf55e9-e744-4581-9c14-ffa54bc90faf@davidgow.net>
Date: Wed, 4 Mar 2026 17:16:19 +0800
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2] rust: kunit: fix warning when !CONFIG_PRINTK
To: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>,
 Alexandre Courbot <acourbot@nvidia.com>
Cc: Brendan Higgins <brendan.higgins@linux.dev>,
 David Gow <davidgow@google.com>, Rae Moar <raemoar63@gmail.com>,
 Miguel Ojeda <ojeda@kernel.org>, Boqun Feng <boqun@kernel.org>,
 Gary Guo <gary@garyguo.net>, =?UTF-8?Q?Bj=C3=B6rn_Roy_Baron?=
 <bjorn3_gh@protonmail.com>, Benno Lossin <lossin@kernel.org>,
 Andreas Hindborg <a.hindborg@kernel.org>, Alice Ryhl <aliceryhl@google.com>,
 Trevor Gross <tmgross@umich.edu>, Danilo Krummrich <dakr@kernel.org>,
 Shuah Khan <skhan@linuxfoundation.org>, linux-kselftest@vger.kernel.org,
 kunit-dev@googlegroups.com, rust-for-linux@vger.kernel.org,
 linux-kernel@vger.kernel.org
References: <20260224-unused_var_err-v2-1-337f9359d98e@nvidia.com>
 <CANiq72kROq3B=EPfihKM=bvtyqYrbDV-mkFgROdPNjbC6zaBpQ@mail.gmail.com>
Content-Language: fr
From: David Gow <david@davidgow.net>
In-Reply-To: <CANiq72kROq3B=EPfihKM=bvtyqYrbDV-mkFgROdPNjbC6zaBpQ@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

Le 04/03/2026 à 10:34 AM, Miguel Ojeda a écrit :
> On Tue, Feb 24, 2026 at 11:38 AM Alexandre Courbot <acourbot@nvidia.com> wrote:
>>
>> If `CONFIG_PRINTK` is not set, then the following warnings are issued
>> during build:
>>
>>    warning: unused variable: `args`
>>      --> ../rust/kernel/kunit.rs:16:12
>>      |
>>    16 | pub fn err(args: fmt::Arguments<'_>) {
>>      |            ^^^^ help: if this is intentional, prefix it with an underscore: `_args`
>>      |
>>      = note: `#[warn(unused_variables)]` (part of `#[warn(unused)]`) on by default
>>
>>    warning: unused variable: `args`
>>      --> ../rust/kernel/kunit.rs:32:13
>>      |
>>    32 | pub fn info(args: fmt::Arguments<'_>) {
>>      |             ^^^^ help: if this is intentional, prefix it with an underscore: `_args`
>>
>> Fix this by adding a no-op assignment using `args` when `CONFIG_PRINTK`
>> is not set.
>>
>> Fixes: a66d733da801 ("rust: support running Rust documentation tests as KUnit ones")
>> Signed-off-by: Alexandre Courbot <acourbot@nvidia.com>
> 
> Applied to `rust-fixes` -- thanks everyone!
> 
> Also Cc: stable@vger.kernel.org

This is also sitting in kselftest/kunit-fixes:
https://git.kernel.org/pub/scm/linux/kernel/git/shuah/linux-kselftest.git/commit/?h=kunit-fixes&id=7dd34dfc8dfa92a7244242098110388367996ac3

I don't particularly mind if you'd rather it go through the Rust tree, 
though. Let me know if you want this removed.

Cheers,
-- David

