Received: from sphereful.davidgow.net (sphereful.davidgow.net [203.29.242.92])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5700E39A7F0;
	Tue, 24 Feb 2026 13:56:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=203.29.242.92
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1771941394; cv=none; b=LemG4lHG45uhuTxB6WqQ9vTDGMs9y8gqJ1G2ZFxAlJUdCvdBywbl6NL7+6Y4OYt/VgykYqoyD9R4btKKIhaihnQGu47Ww+I9qBwfSdW8GjzftMmKX00oFUpe0G2XwED9XQglwIvQpZEDZHHoAflGp5danrSqHm++5Dof2Hi6CtU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1771941394; c=relaxed/simple;
	bh=JZSfy8vFAKJGzTXD7zwmc6B9aDX/4xlT0iEp9tJ/Oa4=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=a3YuXjRwN67sSLB4KQa94wgTjpSwdu5fkzIZj/1rtrHCI3jomltmVO83KG3uJvj7FxQTCFk2y50M/QW+imkN9zsLe3Ww2g/6q9qTkCLRixJIC2BcmKp/+9VxK1g5l4tcbtpopyqVVkzsP+NPG9qxRJDulszEOhgcgTzGv7TSlvE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=davidgow.net; spf=pass smtp.mailfrom=davidgow.net; dkim=pass (4096-bit key) header.d=davidgow.net header.i=@davidgow.net header.b=OaaAvnXD; dkim=pass (4096-bit key) header.d=davidgow.net header.i=@davidgow.net header.b=cRhoe6xm; arc=none smtp.client-ip=203.29.242.92
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=davidgow.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=davidgow.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (4096-bit key) header.d=davidgow.net header.i=@davidgow.net header.b="OaaAvnXD";
	dkim=pass (4096-bit key) header.d=davidgow.net header.i=@davidgow.net header.b="cRhoe6xm"
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=davidgow.net;
	s=201606; t=1771941391;
	bh=JZSfy8vFAKJGzTXD7zwmc6B9aDX/4xlT0iEp9tJ/Oa4=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=OaaAvnXDLLteERpIXMEKqtFwoLQ02/kNNRLIf6OfKJpoXUvxq8tHF1SWq/KDqgduA
	 DAsv80axkzMHl6BAqy1zU22OEAKtqs8mgBuo2JHVpdSaE70iu/Rd98AcT9WHsr5K4u
	 juOlXDhmi05cdIE3XfloTFMhBwfa9zQ+QH4EKfx/vZDYtHY2xwyNDETBeXXiqnzput
	 EwhUFX8EdoQPfVEMO/+W/VXmPlfL9UKMbpzjZSmMZBAoAcNk35gWnoLVgGXTQK/jbE
	 TamCUP6OQSbfuqafZGmd2WzbuV35N85hR6IEHjrYEE9TvDlG/87OGbAv8dLOImdp86
	 UT4lM4wzgj+LWbhXLPBU5bPBlG9Vzf6ChzQW01qzbByPPVBPjw12lTg8yq9zQ2KQ0/
	 rkwzK3g2S3Z1oINHBXI/nha9qP1IpwIYuBK5VnyHqmuKjOaVAPcmtO/XhkeTbRXpaX
	 HhJAmKVG0cfwttarZOzVaXhdVHtSfYZCpmPpKr7/WMaOBI1HLygqS3p+OGQA+Qd5Y7
	 3X9ajUvZqhcr5uFFQYHzpTfjAs9M9+eka5W7nrRN5O5xhssvKCfQL4g5eFn3bfLat0
	 ZqFTIWm5nTAa7gKAjkS+tBik5QTA0wjyMK0LNj/jidtaDAmJzR8Rr/MmBEnR/gWGg/
	 Fg/XfIHbX+LLV7FRtvupLqrA=
Received: by sphereful.davidgow.net (Postfix, from userid 119)
	id 87FCA1E78C5; Tue, 24 Feb 2026 21:56:31 +0800 (AWST)
X-Spam-Level: 
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=davidgow.net;
	s=201606; t=1771941390;
	bh=JZSfy8vFAKJGzTXD7zwmc6B9aDX/4xlT0iEp9tJ/Oa4=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=cRhoe6xmqoREUcNalHqBY9axrI+PsHZsTOptAQkhPcduPBcz3BnuDAIIzKEOd3noS
	 OdH7jByZTCFuTHoFgN6okH4+4BwUQUPaP9Pkmtjc6REB4+0WFX4RsIzof8nFpuQ8wb
	 ub9CtSH/3uQ6tIBuYF35VuKpVIMEGa14F4nYkrlHrY0bbtzhbTCJoj9Shu1Fw++dYA
	 yOeb1SDQbINxQ8U5OHMMGG9oiSgqtE8OoerxNNrLYPpopZ0TYyaL0xGEO/7E5/Cbyt
	 SADVgqnFXEzIIjlegbSAzjB/b2caRTQuWpAnBtlzJ/fTt+wY681X4ZjzZTFZ6CTYSv
	 cVUdBTanf3+VLSHgSpdUSukDPtMyyRheaW9FfKX4x2LVz4oRi1yJcsqRboA1jLPduf
	 QvC3Ch9PcGCOf1zh0hCo1cnPsVCmlsjSM/tpgWtuASXwKKWCiXzPABuNCmQFfnH8Ua
	 5uPVRyT0eSUdBv6a3ZahjqPxFcxccMuAzvYYZJ86C1qqNhpSUWH47ypTiiXLvwNzII
	 u3QpL6aLRlPvdBaOA9ZDr5Bcg9HpaZN43lzqHK3yem4X+hPyiqLAuQiZGdaCQqX++X
	 2mPew0qUmtziCb9r5D9kLZf9j4sG5oSyDE97JkvTiNpmzuibwy+KvKek5DUqtAAXaH
	 kupTvG7TT/D16e0t42vshr+I=
Received: from [IPV6:2001:8003:8824:9e00::bec] (unknown [IPv6:2001:8003:8824:9e00::bec])
	by sphereful.davidgow.net (Postfix) with ESMTPSA id 25E201E78B3;
	Tue, 24 Feb 2026 21:56:30 +0800 (AWST)
Message-ID: <d0c56a90-2583-4f4c-866a-378e7ef8c987@davidgow.net>
Date: Tue, 24 Feb 2026 21:56:27 +0800
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2] rust: kunit: fix warning when !CONFIG_PRINTK
To: Alexandre Courbot <acourbot@nvidia.com>,
 Andreas Hindborg <a.hindborg@kernel.org>, Alice Ryhl <aliceryhl@google.com>
Cc: Brendan Higgins <brendan.higgins@linux.dev>,
 David Gow <davidgow@google.com>, Rae Moar <raemoar63@gmail.com>,
 Miguel Ojeda <ojeda@kernel.org>, Boqun Feng <boqun@kernel.org>,
 Gary Guo <gary@garyguo.net>, =?UTF-8?Q?Bj=C3=B6rn_Roy_Baron?=
 <bjorn3_gh@protonmail.com>, Benno Lossin <lossin@kernel.org>,
 Trevor Gross <tmgross@umich.edu>, Danilo Krummrich <dakr@kernel.org>,
 Shuah Khan <skhan@linuxfoundation.org>, linux-kselftest@vger.kernel.org,
 kunit-dev@googlegroups.com, rust-for-linux@vger.kernel.org,
 linux-kernel@vger.kernel.org
References: <Qrs5fItWst004EC_jGHvnTB2s8QuVM9cnRKIhUuImhaSV8qhL9DmqifhAqLFPSEf1JYNS9J-1hWqvptIARahvQ==@protonmail.internalid>
 <20260224-unused_var_err-v2-1-337f9359d98e@nvidia.com>
 <871pia2wcp.fsf@t14s.mail-host-address-is-not-set>
 <DGN7R1LIMMXA.PAEGCW35B6EY@nvidia.com>
Content-Language: fr, en-US
From: David Gow <david@davidgow.net>
In-Reply-To: <DGN7R1LIMMXA.PAEGCW35B6EY@nvidia.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

Le 24/02/2026 à 9:07 PM, 'Alexandre Courbot' via KUnit Development a écrit :
> On Tue Feb 24, 2026 at 8:51 PM JST, Andreas Hindborg wrote:
>> "Alexandre Courbot" <acourbot@nvidia.com> writes:
>>
>>> If `CONFIG_PRINTK` is not set, then the following warnings are issued
>>> during build:
>>>
>>>    warning: unused variable: `args`
>>>      --> ../rust/kernel/kunit.rs:16:12
>>>      |
>>>    16 | pub fn err(args: fmt::Arguments<'_>) {
>>>      |            ^^^^ help: if this is intentional, prefix it with an underscore: `_args`
>>>      |
>>>      = note: `#[warn(unused_variables)]` (part of `#[warn(unused)]`) on by default
>>>
>>>    warning: unused variable: `args`
>>>      --> ../rust/kernel/kunit.rs:32:13
>>>      |
>>>    32 | pub fn info(args: fmt::Arguments<'_>) {
>>>      |             ^^^^ help: if this is intentional, prefix it with an underscore: `_args`
>>>
>>> Fix this by adding a no-op assignment using `args` when `CONFIG_PRINTK`
>>> is not set.
>>>
>>> Fixes: a66d733da801 ("rust: support running Rust documentation tests as KUnit ones")
>>> Signed-off-by: Alexandre Courbot <acourbot@nvidia.com>
>>> ---
>>> Changes in v2:
>>> - Use a no-op assignment instead of the wider `#[allow(unused_variables)]`.
>>> - Link to v1: https://patch.msgid.link/20260224-unused_var_err-v1-1-c51d805eceb5@nvidia.com
>>> ---
>>>   rust/kernel/kunit.rs | 8 ++++++++
>>>   1 file changed, 8 insertions(+)
>>>
>>> diff --git a/rust/kernel/kunit.rs b/rust/kernel/kunit.rs
>>> index f93f24a60bdd..a1edf7491579 100644
>>> --- a/rust/kernel/kunit.rs
>>> +++ b/rust/kernel/kunit.rs
>>> @@ -14,6 +14,10 @@
>>>   /// Public but hidden since it should only be used from KUnit generated code.
>>>   #[doc(hidden)]
>>>   pub fn err(args: fmt::Arguments<'_>) {
>>> +    // `args` is unused if `CONFIG_PRINTK` is not set - this avoids a build-time warning.
>>> +    #[cfg(not(CONFIG_PRINTK))]
>>> +    let _ = args;
>>
>> I think (didn't test) that you can use a conditional attribute [1] instead:
>>
>>   pub fn err(
>>       #[cfg_attr(not(CONFIG_PRINTK), expect(unused))]
>>       args: fmt::Arguments<'_>
>>   ) {
> 
> Yup, that works as well, and I think I like it better as it is more
> localized. Alice, WDYT?
> 

Personally, I have a slight preference for the current `let _ = args` 
option -- we'll still want to be able to format (at least some of) these 
messages to the KUnit test log, even if printk is disabled. So in the 
interest of avoiding churn in the function prototype, this version seems 
more future-proof.

But I'm not enormously worried either way.

Cheers,
-- David

