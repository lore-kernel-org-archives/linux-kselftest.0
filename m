Received: from mta0.migadu.com (out-135.mta0.migadu.com [91.218.175.135])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6305D369D76
	for <linux-kselftest@vger.kernel.org>; Thu, 13 Aug 2026 11:52:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=91.218.175.135
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786621975; cv=none; b=GIfgUu9zN/PKPGq3HOUZuLPhdr0gzFHgpv+PccfqPxqjk6bhfcFOyZIKLYJXEt/ONtK+OA70AVzPS3CokAixLJxjxpUcqRnfTlCNI1nB1ECRYOb6x64CaMOlLGLF006LvGFqaWQ+Q/sc/ASEzId75NXy5QE9/K2A55RoYKzgi54=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786621975; c=relaxed/simple;
	bh=R2f0PJtuTSVROgAmYKIuGCx86gpNuYMzhmVycIrzC/0=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=PDdkJhZMaIh5IZUqnuK00TwX3i4nZH/hxYlHCh8t8XCNhzNj8aKJP3eqm0Kzc4X6VVlJ0ujhK8Iq5YpY9rggZs7tDXtRMEaRlnKFSFzjC1Sl7VRqrBmITXeNsjajswADv8J99L7H/IvcmzhuWWp+GueQMtA8hsgQ+7Pgzczo1oo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev; spf=pass smtp.mailfrom=linux.dev; dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b=v5dajzEO; arc=none smtp.client-ip=91.218.175.135
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b="v5dajzEO"
X-Envelope-To: linux-kselftest@vger.kernel.org
DKIM-Signature: a=rsa-sha256; bh=R2f0PJtuTSVROgAmYKIuGCx86gpNuYMzhmVycIrzC/0=;
 c=simple/simple; d=linux.dev;
 h=from:to:subject:date:message-id:mime-version:content-type; s=key1;
 t=1786621968; v=1; x=1787226768;
 b=v5dajzEOuRcEgeiui5YhD1V1V/h7nQn+JmKxQay283veMuechwY8E/SlUIcY6nMSMi2JasVw
 dUdKk1NdBmSGHmatmh/jprRVJYMV0tZnzmt4LOTA6gwqxm2/1ldDATsfaOPOEud/NrCI/yOW5XV
 NhVCFYxPhc1yDp/G14jel6j4=
X-Envelope-To: linux-kselftest@vger.kernel.org
Received: from [192.168.200.2] (2a11:3:200::10a9)
	by smtp.migadu.com with ESMTPS id dd9de6576435b65a;
	Thu, 13 Aug 2026 11:52:38 +0000
X-Migadu-Flow: FLOW_OUT
Message-ID: <cfb5912c-514d-4a3c-b056-a1e8d2d4469f@linux.dev>
Date: Thu, 13 Aug 2026 19:51:04 +0800
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v10 00/10] Fix missing fops.owner in Rust DRM/misc
 abstractions
To: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Cc: Danilo Krummrich <dakr@kernel.org>, Gary Guo <gary@garyguo.net>,
 Mark Brown <broonie@kernel.org>, Miguel Ojeda <ojeda@kernel.org>,
 Boqun Feng <boqun@kernel.org>, =?UTF-8?Q?Bj=C3=B6rn_Roy_Baron?=
 <bjorn3_gh@protonmail.com>, Benno Lossin <lossin@kernel.org>,
 Andreas Hindborg <a.hindborg@kernel.org>, Alice Ryhl <aliceryhl@google.com>,
 Trevor Gross <tmgross@umich.edu>, Luis Chamberlain <mcgrof@kernel.org>,
 Petr Pavlu <petr.pavlu@suse.com>, Daniel Gomez <da.gomez@kernel.org>,
 Sami Tolvanen <samitolvanen@google.com>, Aaron Tomlin <atomlin@atomlin.com>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 "Rafael J. Wysocki" <rafael@kernel.org>, David Airlie <airlied@gmail.com>,
 Simona Vetter <simona@ffwll.ch>,
 Daniel Almeida <daniel.almeida@collabora.com>, Arnd Bergmann
 <arnd@arndb.de>, Brendan Higgins <brendan.higgins@linux.dev>,
 David Gow <david@davidgow.net>, Rae Moar <raemoar63@gmail.com>,
 Breno Leitao <leitao@debian.org>, Jens Axboe <axboe@kernel.dk>,
 Dave Ertman <david.m.ertman@intel.com>, Leon Romanovsky <leon@kernel.org>,
 Igor Korotin <igor.korotin@linux.dev>,
 FUJITA Tomonori <fujita.tomonori@gmail.com>,
 Bjorn Helgaas <bhelgaas@google.com>,
 =?UTF-8?Q?Krzysztof_Wilczy=C5=84ski?= <kwilczynski@kernel.org>,
 =?UTF-8?Q?Arve_Hj=C3=B8nnev=C3=A5g?= <arve@android.com>,
 Todd Kjos <tkjos@android.com>, Christian Brauner <brauner@kernel.org>,
 Carlos Llamas <cmllamas@google.com>, rust-for-linux@vger.kernel.org,
 linux-modules@vger.kernel.org, driver-core@lists.linux.dev,
 dri-devel@lists.freedesktop.org, nova-gpu@lists.linux.dev,
 linux-kselftest@vger.kernel.org, kunit-dev@googlegroups.com,
 linux-block@vger.kernel.org, linux-kernel@vger.kernel.org,
 netdev@vger.kernel.org, linux-pci@vger.kernel.org
References: <20260811-fix-fops-owner-v10-0-7e71776f9dbe@linux.dev>
 <CANiq72=bhfofrbdf1qeA380-eWeKj5yXhC0NzaU_nbB9SpxYHA@mail.gmail.com>
 <DKNAS52KYWLD.M15VEC6U0F6R@kernel.org>
 <DKNDF3WD27GM.5VP6RBRXZBUS@garyguo.net>
 <CANiq72=SP_nT7Z6NSH-GT51-8hJ8qLUa07Cs+SarSFTO9Z7vUw@mail.gmail.com>
From: Alvin Sun <alvin.sun@linux.dev>
In-Reply-To: <CANiq72=SP_nT7Z6NSH-GT51-8hJ8qLUa07Cs+SarSFTO9Z7vUw@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit


On 8/13/26 17:32, Miguel Ojeda wrote:
> On Thu, Aug 13, 2026 at 1:57 AM Gary Guo <gary@garyguo.net> wrote:
>> IMO this is the correct way, also consistent with
>>
>> https://lore.kernel.org/rust-for-linux/20260811-fix-fops-owner-v10-3-7e71776f9dbe@linux.dev/
>>
>> It might make sense to add this to rust-next.
> Yeah, it is also consistent (in the sense of adding a fallback) with
> the other fix I added when applying the series for the `macros`
> doctest; and the `kernel` crate is not an actual module yet.
>
> I guess yet another solution would be to have an even more local
> fallback, but that would be too local in my opinion, i.e. we will want
> to use it elsewhere sooner or later.
>
> So I could fold [2] into commit 98f256e27262, but a commit on top is
> fine, I will reference that commit from the new one instead.
>
> Ok, done -- Danilo, I took your diff and converted it into a proper
> commit, please double-check you are OK with the Signed-off-by:
>
>    ec6fcf8a175a ("rust: kernel: add `LocalModule` fallback for
> `#[vtable]` `impl`s")

I was just looking at the difference between the doctest and in-crate
`#[kunit_tests]` test paths — thanks for taking care of this.

I'll look into [3] once the new build system lands.

Best regards,
Alvin

>
> Thanks!
>
> Cheers,
> Miguel
