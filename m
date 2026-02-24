Received: from sphereful.davidgow.net (sphereful.davidgow.net [203.29.242.92])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 38C6C37B3F7;
	Tue, 24 Feb 2026 13:56:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=203.29.242.92
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1771941388; cv=none; b=dgmKbIowEN17VmGQt5Z7I+DSQSgPVlnEvs/Q22V203BnDNNeH+42nOO/3lrLMky6T02SJLCmw1we9YWJgLhCAMIcl89tnRniSn9f35TovS6IIuuBTz+hlQ/FfBqFrGdEi5ShLVq880Z4ovpK/eTnYzi9TC35hcsl26regVtge7s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1771941388; c=relaxed/simple;
	bh=mNy92i4Lu2QBHhYsqWdF/9bIsNdbvuudixt5qGKT17s=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=mGnYWvv5n7rOT+S2pE3CAA1f7dGkNj10vo96MbIiX7iV6wRkk+dFcEG8SqqqF73HhIySPBJLMyv3Dkq/p/4P35OJO2WiDngH5ikb24mhWtG44y7hLE0Zj3Ve/kYS8vXo4HD0Qs99HfBUBGCax3xznnwUeGrgjeC1laNm4R81YxM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=davidgow.net; spf=pass smtp.mailfrom=davidgow.net; dkim=pass (4096-bit key) header.d=davidgow.net header.i=@davidgow.net header.b=kPkdRrc0; dkim=pass (4096-bit key) header.d=davidgow.net header.i=@davidgow.net header.b=Visk5TUT; arc=none smtp.client-ip=203.29.242.92
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=davidgow.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=davidgow.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (4096-bit key) header.d=davidgow.net header.i=@davidgow.net header.b="kPkdRrc0";
	dkim=pass (4096-bit key) header.d=davidgow.net header.i=@davidgow.net header.b="Visk5TUT"
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=davidgow.net;
	s=201606; t=1771941383;
	bh=mNy92i4Lu2QBHhYsqWdF/9bIsNdbvuudixt5qGKT17s=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=kPkdRrc0VMoJ9IX3vIrdFaoqQIn+Hd4rc6rsMCCY3uHmTyYH/7YQZbNDkXA+bkePF
	 MOwYxPrVf+AnuOLMST3kqEBzijO3r9ceeg1dAli4qgkTGxOFXMwfwoSt1pnUP+9kfw
	 rBpz4WLpT+z7TLyxWPqbm3R/BXeGvpSglEzyIV2eRdsP2giDVSTPK9yDz+09OiV5d0
	 mbcvGKkcbHVrnHqYJSnyWbA/BnX0x6KTjDYV8TCN2+tBX0oNlb8RbJp1Qwj52e6UjB
	 FS3a/4KeraPLMTLuPrAfUtt3+oumXFyYzORn8j8defMZoFcd6/mGpA5mnoNTcYqKAH
	 N7zbDIfmkRqA0m+tTPGB2hdGoORHv8cUuOXHxfwMCuSxNPwLmBcMh+hHTPcGoayymS
	 Og7mSPIodDzFwZWKMfENrj0yuxlSkU18QsPnngslsxg5S44xVg4q6sCEF20b6GqYdx
	 oPRzPdEXRMHpFHpBZxSeCMB1e+cXXqy26rOk9cyEe28GR4isWrx2p3mhUBY+InC/hD
	 lzvn0Pa74Tu5G0kKJmsqJ2mkUh0JWUy2EXoZjZRDmNEGFdpwgT0Kek28VdvdJvMws0
	 1qAqKkE689Olt7N8ymVork/x82FgsVmKgQE8csKbFjBlksdeLoduPEoq/4XXyM1XB7
	 EwQ0stijP9mpPtCN1jDl+ndk=
Received: by sphereful.davidgow.net (Postfix, from userid 119)
	id EA09F1E78D0; Tue, 24 Feb 2026 21:56:23 +0800 (AWST)
X-Spam-Level: 
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=davidgow.net;
	s=201606; t=1771941381;
	bh=mNy92i4Lu2QBHhYsqWdF/9bIsNdbvuudixt5qGKT17s=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=Visk5TUTJU+yQ5evVK1Y0bi0ipYaNUE5lbkgoUcbq0awUYJ7xdnhw5R0j3qLoLBXm
	 c2MJxp5W75eATmJc7dzsv+8XwIBo5tl0Ym8jnrwsP2HgxYTvncjjI7ScAZ8N2P3asL
	 vslJIhTAtiEJi2FHw+J1WgPVgYSV9QmBXYlgSjnT0gb1/YTzUhZTrcmBJlGRh0/r7P
	 l4UNZBWwhL0F+P1je+bmDBVJE0ujwaCkLixuoOWSz2Cw/40P+VU6wvu/Aayf+8xcrm
	 aiaHwZ+p85edNC7JCCBtnWMzqS1z7Q2XFmcKcE6UP02VH0XNe7LKHb7ADBQlbWDoAt
	 hCsO41oSEiow/iTbuaNaD8CKHjSpsTUxm4yGuBZM//FOZ8PoY/OmI9gBSk6Nb+b7fk
	 9MFrJlNFl6RJrgouHVMpoPS0b0q4UfikdVMJ+mr6ZOZM82r5urwe9u+i97p/V/Itzu
	 RgQ8Qed+BPhDsm32ZZpNOsyYgh68MYjahtSPcQo/t51iScu+eFc87r/t99vYwQeFNO
	 9aJl5xFXEKdfy1KeedbQkmk4+FlcLSmVjvbIYgwxgBtfIH4tVusseBDfV4fFzBGqA9
	 yXFiDvNeivXih6Ji3E0j39x11ap0eyXeaep7dha6e3KIwNKsM8yRgcPYy+InnfIrVh
	 vbNHDhE3OR3Z9RKGJbT7smMA=
Received: from [IPV6:2001:8003:8824:9e00::bec] (unknown [IPv6:2001:8003:8824:9e00::bec])
	by sphereful.davidgow.net (Postfix) with ESMTPSA id B25FC1E78C4;
	Tue, 24 Feb 2026 21:56:21 +0800 (AWST)
Message-ID: <98a8f99b-35c1-4de3-ae06-e5c1ac8c0adf@davidgow.net>
Date: Tue, 24 Feb 2026 21:56:17 +0800
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2] rust: kunit: fix warning when !CONFIG_PRINTK
To: Alexandre Courbot <acourbot@nvidia.com>,
 Brendan Higgins <brendan.higgins@linux.dev>, David Gow
 <davidgow@google.com>, Rae Moar <raemoar63@gmail.com>,
 Miguel Ojeda <ojeda@kernel.org>, Boqun Feng <boqun@kernel.org>,
 Gary Guo <gary@garyguo.net>, =?UTF-8?Q?Bj=C3=B6rn_Roy_Baron?=
 <bjorn3_gh@protonmail.com>, Benno Lossin <lossin@kernel.org>,
 Andreas Hindborg <a.hindborg@kernel.org>, Alice Ryhl <aliceryhl@google.com>,
 Trevor Gross <tmgross@umich.edu>, Danilo Krummrich <dakr@kernel.org>,
 Shuah Khan <skhan@linuxfoundation.org>
Cc: linux-kselftest@vger.kernel.org, kunit-dev@googlegroups.com,
 rust-for-linux@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20260224-unused_var_err-v2-1-337f9359d98e@nvidia.com>
Content-Language: fr
From: David Gow <david@davidgow.net>
In-Reply-To: <20260224-unused_var_err-v2-1-337f9359d98e@nvidia.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

Le 24/02/2026 à 6:37 PM, 'Alexandre Courbot' via KUnit Development a écrit :
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
> Fix this by adding a no-op assignment using `args` when `CONFIG_PRINTK`
> is not set.
> 
> Fixes: a66d733da801 ("rust: support running Rust documentation tests as KUnit ones")
> Signed-off-by: Alexandre Courbot <acourbot@nvidia.com>
> ---
> Changes in v2:
> - Use a no-op assignment instead of the wider `#[allow(unused_variables)]`.
> - Link to v1: https://patch.msgid.link/20260224-unused_var_err-v1-1-c51d805eceb5@nvidia.com
> ---

Reviewed-by: David Gow <david@davidgow.net>

Cheers,
-- David
