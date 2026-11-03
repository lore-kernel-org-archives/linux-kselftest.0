Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=203.29.242.92
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793717179;
	b=Fhu668qGSs7ypINyFXL/AQ/JIfT1sFvl3bS3qyfp3L5VvTOdVnSbxKyEyitfIcoSwYW0
	 HBTJH3r5Fy5zghThCGAgt7at4SVxXQP7YN0EDgqttkgzqnAsyBk1fT7NI63/uFLqFE3eW
	 g5yZmY4BYiRjVg/W8+/QDQcav87WqMA537rEzR2bi/PqaREd9bXx1vWM98qwqW6u1AkR/
	 APUhrZfKplUoxRKR2HTwLfl2tZj01dXI1IvRb7kfkRc9hBHFe9pVldIsCDThl55Rt3TE3
	 s4wAk1UA9SgObcIsBaCpYrrqx+X2EP37Vq9AHXjCS6bi3RJGvEO/QfHcJof9b6DPflg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793717179;
	h=DMARC-Filter:Received:X-Spam-Checker-Version:X-Spam-Level:
	 X-Spam-Status:Received:Message-ID:Date:MIME-Version:User-Agent:
	 Subject:To:Cc:References:Content-Language:From:In-Reply-To:
	 Content-Type:Content-Transfer-Encoding;
	bh=OYdzMl6bXA03E7RlTLj+Rkwx0OPPfzcHwXlsPPzqmXw=;
	b=dpACVder0+Uw6cjgV3Snoz5fRmnbG/6b/khuu5ss3Pod+9MAhibvUAc+O/PHN5SJYglK
	 CrinioLMio+19PjYSbi91MDo+EFaRbA5hHR+VFNSQRtvebHrEBmV+Yl+nUtfU4R2NhDYa
	 lhhGkael/bMz7aA4npQaLZelmBtGkQm5oDKS5UfY5Oe54IoJR0b1r7SabjwFE77tV4R2Q
	 KV7I9qBjAjMozz6lTuEAvW/1T9Icu6qw4dtgFAD9NlV6btnNg6rfhDoBIOTZWgHGrQ7/g
	 RGQpfDAERDzqiRDgSmiKiU88MDS9bB/CPwK1eUH4j4EnSBuQ9XpmUAz9oJY7Sl5vkYg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=davidgow.net;
	spf=pass smtp.mailfrom=davidgow.net;
	arc=none smtp.remote-ip=203.29.242.92
Received: from sphereful.davidgow.net (sphereful.davidgow.net [203.29.242.92])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 17E03606A333;
	Tue,  3 Nov 2026 14:46:18 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 17E03606A333
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=davidgow.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=davidgow.net
Received: by sphereful.davidgow.net (Postfix, from userid 119)
	id 25B6B200B1A; Tue,  3 Nov 2026 22:46:17 +0800 (AWST)
X-Spam-Level: 
Received: from [IPV6:2001:8003:8802:7000::41b] (unknown [IPv6:2001:8003:8802:7000::41b])
	by sphereful.davidgow.net (Postfix) with ESMTPSA id 1CBA3200AF4;
	Tue,  3 Nov 2026 22:46:15 +0800 (AWST)
Message-ID: <6225edb4-bfb2-4cd2-be45-7bee7344ee11@davidgow.net>
Date: Tue, 3 Nov 2026 22:46:15 +0800
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
Subject: Re: [PATCH v2 3/3] rust: bitmap: kunit: uncomment
 owned_bitmap_out_of_bounds panic case
To: nico.antinori.7@gmail.com, Alice Ryhl <aliceryhl@google.com>,
 Benno Lossin <lossin@kernel.org>, Boqun Feng <boqun@kernel.org>,
 Brendan Higgins <brendan.higgins@linux.dev>,
 Daniel Almeida <daniel.almeida@collabora.com>,
 Danilo Krummrich <dakr@kernel.org>, Gary Guo <gary@garyguo.net>,
 Miguel Ojeda <ojeda@kernel.org>, =?UTF-8?Q?Onur_=C3=96zkan?=
 <work@onurozkan.dev>
Cc: Alexandre Courbot <acourbot@nvidia.com>,
 Andreas Hindborg <a.hindborg@kernel.org>,
 =?UTF-8?Q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>,
 Burak Emir <burak.emir@gmail.com>, Rae Moar <raemoar63@gmail.com>,
 Tamir Duberstein <tamird@kernel.org>, Trevor Gross <tmgross@umich.edu>,
 Yury Norov <yury.norov@gmail.com>, kunit-dev@googlegroups.com,
 linux-kernel@vger.kernel.org, linux-kselftest@vger.kernel.org,
 rust-for-linux@vger.kernel.org
References: <20261029-rust_kunit_v6_send-v2-0-5ce551efc48e@gmail.com>
 <20261029-rust_kunit_v6_send-v2-3-5ce551efc48e@gmail.com>
Content-Language: en-US
From: David Gow <david@davidgow.net>
In-Reply-To: <20261029-rust_kunit_v6_send-v2-3-5ce551efc48e@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

Le 30/10/2026 à 00:59, Nicolás Antinori via B4 Relay a écrit :
> From: Nicolás Antinori <nico.antinori.7@gmail.com>
> 
> Rust KUnit tests now support `#[should_panic]` attribute. Uncomment the
> test so it can be run when CONFIG_RUST_BITMAP_HARDENED=y.
> 
> Signed-off-by: Nicolás Antinori <nico.antinori.7@gmail.com>
> ---

This works well on architectures should_panic is working on (but we'll 
want to fix UML support first).

Acked-by: David Gow <david@davidgow.net>

Cheers,
-- David

>   rust/kernel/bitmap.rs | 21 ++++++++++-----------
>   1 file changed, 10 insertions(+), 11 deletions(-)
> 
> diff --git a/rust/kernel/bitmap.rs b/rust/kernel/bitmap.rs
> index 610d565535ccfba6af8f2ca4ac4028fa027a9644..8eecd669096713fc7f21431188959a921a1d5ca0 100644
> --- a/rust/kernel/bitmap.rs
> +++ b/rust/kernel/bitmap.rs
> @@ -762,11 +762,10 @@ fn bitmap_set_clear_find() -> Result<(), AllocError> {
>           Ok(())
>       }
>   
> -    #[test]
>       #[cfg(not(CONFIG_RUST_BITMAP_HARDENED))]
> +    #[test]
>       fn owned_bitmap_out_of_bounds() -> Result<(), AllocError> {
>           let mut b = BitmapVec::new(128, GFP_KERNEL)?;
> -
>           b.set_bit(2048);
>           b.set_bit_atomic(2048);
>           b.clear_bit(2048);
> @@ -777,15 +776,15 @@ fn owned_bitmap_out_of_bounds() -> Result<(), AllocError> {
>           Ok(())
>       }
>   
> -    // TODO: uncomment once kunit supports `#[should_panic]`.
> -    // #[cfg(CONFIG_RUST_BITMAP_HARDENED)]
> -    // #[test]
> -    // #[should_panic]
> -    // fn owned_bitmap_out_of_bounds() -> Result<(), AllocError> {
> -    //     let mut b = BitmapVec::new(128, GFP_KERNEL)?;
> -    //
> -    //     b.set_bit(2048);
> -    // }
> +    #[cfg(CONFIG_RUST_BITMAP_HARDENED)]
> +    #[test]
> +    #[should_panic]
> +    fn owned_bitmap_out_of_bounds() -> Result<(), AllocError> {
> +        let mut b = BitmapVec::new(128, GFP_KERNEL)?;
> +
> +        b.set_bit(2048);
> +        Ok(())
> +    }
>   
>       #[test]
>       fn bitmap_copy_and_extend() -> Result<(), AllocError> {
> 

