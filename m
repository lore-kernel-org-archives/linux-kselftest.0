Received: from sphereful.davidgow.net (sphereful.davidgow.net [203.29.242.92])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9C651397E85;
	Fri, 17 Apr 2026 09:03:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=203.29.242.92
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776416594; cv=none; b=BbZy0zyer4MjutowlIyUnys+hPt0pWYmk0heGssp1izpxFfOdnZw5fcHv+wcZhkO4HYSp0osh8iCqilou8S/Ht64g79uClffXRbGUL8NY+XKUYwsJQ/D1EV4ynLphPm+Tq3lWj20Y83jglf3ssggR9PhWrY6TEytVOq3Cqjos4c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776416594; c=relaxed/simple;
	bh=S0PSStsl1JclDsEW1eutHfCqneAAVeJZa9FsByX8RYg=;
	h=Message-ID:Date:MIME-Version:Subject:To:References:From:
	 In-Reply-To:Content-Type; b=fMGLlnz8ARLabjFiWRJNTmslcjQGD8hHzQ94jOKq1D+9ok5L84WaAbgKDVl2j4ppdxQW6IH/cctJktWVfWgU8K0zRh6eiam/D2h85XP4+womccMWgVr/lxiN67sgXU0Wu/pULstOFsa6Qvn76TnW1oB25AqXD5DSH/DxOvl7pOw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=davidgow.net; spf=pass smtp.mailfrom=davidgow.net; dkim=pass (4096-bit key) header.d=davidgow.net header.i=@davidgow.net header.b=VRtLPomH; dkim=pass (4096-bit key) header.d=davidgow.net header.i=@davidgow.net header.b=ihKsmd/H; arc=none smtp.client-ip=203.29.242.92
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=davidgow.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=davidgow.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (4096-bit key) header.d=davidgow.net header.i=@davidgow.net header.b="VRtLPomH";
	dkim=pass (4096-bit key) header.d=davidgow.net header.i=@davidgow.net header.b="ihKsmd/H"
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=davidgow.net;
	s=201606; t=1776416590;
	bh=S0PSStsl1JclDsEW1eutHfCqneAAVeJZa9FsByX8RYg=;
	h=Date:Subject:To:References:From:In-Reply-To:From;
	b=VRtLPomH4HRRs4CE96D5szkDo1u3d1eLZfKoK+wcpHIRDyXc5+k8TY9XGUOJGp3WM
	 VoFGuGCmuYcbMm/jnCS87A1t+ff0Pj0pma43by74tyC917kOLlKIuDZqJ3UDi4gprv
	 dnFhUIeH85Y4/KB94qfmQfMsKCOmhJqc+v88h0MDjP8EeCmz5w/JhCPJ9t+sJiABmI
	 QqAaoaoGCu9E9yjqDyH/NdD9cMQdsYXrp+uspx1w+J9lCOovKzsjWVxs9BTpKulLcG
	 ofHNMwpru4PHpakXyiSaAADvfZEV+G7wUEWnD7nuERjtKJy2o/PZ6+Dgl80dlk1SAp
	 2tuOAR0pwoaZkC6b+3ALZnjkGz1s8HW3iBA12eNdRgDZF21zgn1jriwb4qYLtm9PPQ
	 fk02qxUTofnSAUq57BZmBgeevewHP8YxjD1GFZTAByj4cdgNbo6wU/OzK6LlRJg+4O
	 7ka4jHp+0wC+vTniIIz59yiXG3UmiY/x8ZMRi1cXrMORtl5agWGaKfiWkfh+5C3YSh
	 fSbzStTjJi06PiQySvUR2y1l8CYwTgHJ5G62B4zfBpqqi1hpK9yNO8W1UBAG5dVeNY
	 oB7XWBqE7C2+u8d8ZxxawfYkAqvc3KNADJWb/1R3gUm24huen9J1jgz1/NbTwPHdyQ
	 e1LWsPuRrBuM+kTYTeVnGPcg=
Received: by sphereful.davidgow.net (Postfix, from userid 119)
	id BD0CE1E695C; Fri, 17 Apr 2026 17:03:10 +0800 (AWST)
X-Spam-Level: 
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=davidgow.net;
	s=201606; t=1776416440;
	bh=S0PSStsl1JclDsEW1eutHfCqneAAVeJZa9FsByX8RYg=;
	h=Date:Subject:To:References:From:In-Reply-To:From;
	b=ihKsmd/Hjusvz5osBthRB0oREMYYTPVz7iBsP2IFO3hprfzGvl18YPt1Bmra/+OrJ
	 YXSp/txtRB3ym4mTQ4pKXWhi612IK9zfUWd1bf6mHWS+/zeNQo1Yy7PRP/+MLgUtzN
	 ShTuFg/Ih9Z09BNEUKOLY56SaRv67xoaJ0J13a/oQUbv08gQxNJvfGkK5PzQsMKE1T
	 VDYL69QlUS7HJkvTsEqRyKzvRiH9945QoUVig7M7xXiCBeZ6NImzmcUo67DpHMnQYQ
	 RoB6y0NkIv9j2p7AiXaUWfRS9LPfVHQO2Etkw/XCtM+oDgswdpi11G+5x0w3wE/Rxr
	 yPl1Am91aZr6VCJaDtlfuDfHNwGAA1l8C0aBu81jjxEnYiPI0NCy9X764h/+L54+Ku
	 L26omCXNxbi430UOCksXS3GbMRv+83XYGL6H1j1S/LVcnp0URbhVAJPVnkCI1FXgVy
	 wtFwWWywEMEvvoETWbmafKprmgWj3gONyDxHjnEXHkz0iAoXVndbSzRsk5BswOafCK
	 tTpCHXDtJp9C0OToyktvoEXCNVBUj9zIQs49bASByPld9ACa/X13B7BCXVawKYHLcf
	 1u1VwWsYm5WuLBLHBZtOPJt+Tq+5SFNDEfxIJK36sk9CHumaEk92Md4lcGSIXneLPd
	 YX88zkh6B2+sAe8dd5DDQi5o=
Received: from [IPV6:2001:8003:8810:ea00:ed87:ca88:5326:e11d] (unknown [IPv6:2001:8003:8810:ea00:ed87:ca88:5326:e11d])
	by sphereful.davidgow.net (Postfix) with ESMTPSA id 2FB751E695D;
	Fri, 17 Apr 2026 17:00:40 +0800 (AWST)
Message-ID: <909e9680-b035-44a9-9487-a4998eafb5f0@davidgow.net>
Date: Fri, 17 Apr 2026 17:00:40 +0800
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/3] rust: tests: drop 'use crate' in bitmap and atomic
 KUnit tests
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
 <20260417031531.315281-2-ynorov@nvidia.com>
Content-Language: fr
From: David Gow <david@davidgow.net>
In-Reply-To: <20260417031531.315281-2-ynorov@nvidia.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

Le 17/04/2026 à 11:15 AM, Yury Norov a écrit :
> The following patch makes usage of macros::kunit_tests crate conditional
> on the corresponding configs. When the configs are disabled, compiler
> warns on unused crate. So, embed it in unit test declaration.
> 
> Signed-off-by: Yury Norov <ynorov@nvidia.com>
> ---

Looks good to me!

Reviewed-by: David Gow <david@davidgow.net>

Cheers,
-- David

>   rust/kernel/bitmap.rs                | 4 +---
>   rust/kernel/sync/atomic/predefine.rs | 4 +---
>   2 files changed, 2 insertions(+), 6 deletions(-)
> 
> diff --git a/rust/kernel/bitmap.rs b/rust/kernel/bitmap.rs
> index 83d7dea99137..894043c9e460 100644
> --- a/rust/kernel/bitmap.rs
> +++ b/rust/kernel/bitmap.rs
> @@ -499,9 +499,7 @@ pub fn next_zero_bit(&self, start: usize) -> Option<usize> {
>       }
>   }
>   
> -use macros::kunit_tests;
> -
> -#[kunit_tests(rust_kernel_bitmap)]
> +#[macros::kunit_tests(rust_kernel_bitmap)]
>   mod tests {
>       use super::*;
>       use kernel::alloc::flags::GFP_KERNEL;
> diff --git a/rust/kernel/sync/atomic/predefine.rs b/rust/kernel/sync/atomic/predefine.rs
> index 1d53834fcb12..84fcd7cfcb73 100644
> --- a/rust/kernel/sync/atomic/predefine.rs
> +++ b/rust/kernel/sync/atomic/predefine.rs
> @@ -154,9 +154,7 @@ fn rhs_into_delta(rhs: usize) -> isize_atomic_repr {
>       }
>   }
>   
> -use crate::macros::kunit_tests;
> -
> -#[kunit_tests(rust_atomics)]
> +#[macros::kunit_tests(rust_atomics)]
>   mod tests {
>       use super::super::*;
>   

