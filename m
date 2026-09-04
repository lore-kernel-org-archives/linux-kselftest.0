Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BA8AB430CDD;
	Fri,  4 Sep 2026 09:43:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788515022; cv=none; b=cr/q8sDF0IdoUHqVj+/OC6C60c1baN3a3Oyx6LVNrMFJlfZt6GtHZfQqRAKK7KVdhhm18eOfo5MWksG2VjMpMXNCRnYn7NigCRQW3fq3TVybyvojt8jz669LlVWvJO5cU9oep4TVrme0WPwJonpc1kwO7b2PsZSKd1H0fx1/yDs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788515022; c=relaxed/simple;
	bh=yCTNwS7UFRxybe9uQRfgPyHocPuIwp0UPDgnXfCPy9M=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=t6TmSS55IUC4pBfIJcWiY3on//ciZRxkwLHtola8UGE23Elx5pDSJujPfALnqviMEhZJi2uevhauI+oD9eaxKoURUbhcmBatTmEjALWy+5Xx7zjNwbEGqzomUoJAuMkc0mCb9KW2/yPJJ23hOcubzDurOgfTbIQM9dVi3xWQpww=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=TRt9S1r1; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="TRt9S1r1"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4E74B1F00A3D;
	Fri,  4 Sep 2026 09:43:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1788515020;
	bh=pKFZjegbFv6VWzQM+YrWXe421xLh8UtIBDWyGvwvUCg=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To;
	b=TRt9S1r1rImf8Zwenz+eaA/E84pKLoNbIVkcZb3HfU6UrGdZvZZIQ/6Wf/8XFJVQm
	 JS/FaI3tOAhwu0hQEOsIW7fZ92ItK/cN/ASp22a3bsRT0nOjP94vCFUV31aTPBg4ie
	 ILgMeLWdpFjy4LNkkx84avMpf0c8gGGwT9ah3ZWHh36hCr5xXS3G5GNB31YUPmChmi
	 78Gid/9XYeCsPjTkDVtrdnDlxNbGPWTyCfK8OsWrAn9LOu2EQ7olTRlbVSZiTjWaVu
	 el4nfqmuyBEsO1y7kkRMA+kiviyp2dSzQ3hiQ0bA+HdJqZKpSNKZxWI230PD7q7kl3
	 eBfdalis4s+9g==
Message-ID: <38e86509-53fb-4a27-8753-9c3cb0c4a048@kernel.org>
Date: Fri, 4 Sep 2026 11:43:33 +0200
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird Beta
Subject: Re: [PATCH net-next v2 0/2] selftests: drv-net: Allow cross-compiling
 the hardware tests
Content-Language: fr
To: Andrew Lunn <andrew@lunn.ch>
Cc: "Maxime Chevallier (Netdev Foundation)" <maxime.chevallier@bootlin.com>,
 Andrew Lunn <andrew+netdev@lunn.ch>, davem@davemloft.net,
 Eric Dumazet <edumazet@google.com>, Jakub Kicinski <kuba@kernel.org>,
 Paolo Abeni <pabeni@redhat.com>, Donald Hunter <donald.hunter@gmail.com>,
 Simon Horman <horms@kernel.org>, Shuah Khan <shuah@kernel.org>,
 Stanislav Fomichev <sdf@fomichev.me>, netdev@vger.kernel.org,
 linux-kernel@vger.kernel.org, thomas.petazzoni@bootlin.com,
 linux-kselftest@vger.kernel.org
References: <20260903155524.2241065-1-maxime.chevallier@bootlin.com>
 <c45453d8-72ae-450b-be9a-565df1cf0287@lunn.ch>
 <c3f649fa-24b6-41d3-b6a1-7f37edec87ff@kernel.org>
 <24d07be4-79e9-4541-b97b-a6735baf5fed@lunn.ch>
From: Matthieu Baerts <matttbe@kernel.org>
Autocrypt: addr=matttbe@kernel.org; keydata=
 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
 lzVbFe7fduHbABmYz9cefQpO7wDE/Q==
Organization: NGI0 Core
In-Reply-To: <24d07be4-79e9-4541-b97b-a6735baf5fed@lunn.ch>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

Hi Andrew,

On 03/09/2026 22:55, Andrew Lunn wrote:
> On Thu, Sep 03, 2026 at 07:25:22PM +0200, Matthieu Baerts wrote:
>> Hi Andrew,
>>
>> On 03/09/2026 19:11, Andrew Lunn wrote:
>>>> Tested on an aarch64 target, built on x86_64.
>>>
>>> Probably a question for Jakub or Matthieu.
>>>
>>> As part of the CI system which is feeding into patchworks, I don't
>>> think we build the selftests? Do we have the CPU resources to build
>>> them?
>>
>> We do: the "build_tools" script [1] checks that. And they are also built
>> before launching the selftests.
>>
>>> We currently do x86 64 and 32 bit builds. Do we have the CPU resources
>>> to do an arm64 cross build?
>>
>> I think we do, but I don't know if we need to (see below)
>>
>>> I assume a cross build the self tests needs something like buildroot
>>> to be sensible? Or Debians multi-arch stuff where you can install .deb
>>> packages for libraries for other architectures? So maybe that is going
>>> too far?
>>
>> >From what I understood, the goal is to execute the selftests on embedded
>> systems as well, which will require building new image including the
>> kernel and the drivers/net selftests. Do we need to build the whole
>> kernel for arm64? :)
> 
> I see a few different goals.
> 
> Picking a patch at random:
> 
> https://patchwork.kernel.org/project/netdevbpf/patch/20260903-netcons_ipv6-v4-2-bdd183c844d3@gmail.com/
> 
> We see 32bit, allmodconfig, clang, and clang_rust. These are all
> native builds, which given are servers are AMD64, these are AMD64
> builds.
> 
> However, many of the network drivers are used on ARM platforms. Most
> probably do compile on AMD64, but i expect there are a few which
> don't. So we could do an ARM64 cross compile, to make sure the patches
> are clean on ARM64 as well as AMD64.
> 
> We are encouraging developers to write self tests. Ideally we want
> self test patches to be held to the same standard as driver
> patches. So if a patch touches the self tests, it would be good to
> build the self tests in order to show the number of warnings & errors
> has not gone up. I expect such a build will be native.
> 
> But if we have gone to the time/effort to cross compile the kernel,
> can we also cross compile the self tests? Can we ensure with cross
> compile self tests don't have more warnings/errors, because the self
> test write has AMD64 blinkers on?
> 
> And sometime down the road, we would like to get ARM servers, with
> NICs in them, to run the self tests on. At that point, we either need
> to cross compile the kernel to run all the self tests, or we need
> another build server which is ARM64, so it can do native ARM64 builds
> of the kernel to run on the ARM64 runners.
I agree that the Netdev CI currently doesn't build anything for the
ARM64 target. But what I meant is that the goal of Maxime's work (if I
understood correctly) is to execute the net selftests (or just the
drv-net ones?) on embedded systems, with different targets. From your
reply, I guess you meant that it might not be enough to have a good
coverage.

I don't think I can properly judge if this is required or not. My
feeling is that it might not be worth it: I don't recall having seen
many fixes specific to other architectures, plus the Intel's bot is
still building the kernel for many architectures. What is currently
missing is compiling the net selftests for different arch. But if ARM64
is added, which other ones should be added too? Plus maybe adding this
would no longer be needed thanks to Maxime's work where selftests will
be built for many architectures and issues reported to NIPA's dashboard?

But I'm aware I have probably missed something, and ARM64 builds might
be worth it. Should we discuss that at the next Netdev bi-weekly call?

Cheers,
Matt
