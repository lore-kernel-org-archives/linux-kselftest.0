Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793748889;
	b=cL701LqZG+TbeDFBwn8Q1Scs6As0ANYcmoGDekT1Wsn37VjysQ3p7n4R5GM3IbP4+StC
	 jIB2u3CXzwvUFMmBvU9kFFh16ImibC7iLxFWdHUsvA+7xs0mM1odV7GrNleikjQuYPq4z
	 tE51P9q3H1xHPuNriVYfY8KqNKczTYUyrvGUzC2uIzPPeSeAGyFYYuYOns1FLmPyQKA9g
	 4FCj4GyyOVgH9/Y0d5z78rxL1atGIGlJVLbp/ms8t5IeVo578lLUA6rvRjDnuPzgk1JLQ
	 6mVw8OR18zfOPMzW02w5cIm0Eh+ohjAM0+b1jQWQ178j6xkgR2pEhF3IXnpsK8+qbQA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793748889;
	h=Received:DKIM-Signature:Message-ID:Date:MIME-Version:User-Agent:
	 Subject:To:Cc:References:Content-Language:From:In-Reply-To:
	 Content-Type:Content-Transfer-Encoding;
	bh=Oc5pGUxi8G3lFQzA+IOSJJX8PHV/w0+Vbyoey5Zk2XA=;
	b=v2+dLITMw9Z71sJCXJeV0sDnD8DsyROjhw93F4bCNmG0DYbc0pBqQh4jMiwllqjGmVfN
	 t2Np6BkT746XnidC3sfRJHokvGaR0ugalCRrtrHQwqA39ItraPER7HOqxaZoaY60NCHkX
	 pXBbCaf4p1WR/m21sQZPmAF4z199aqPcWrGsZKavZ0+70KC5xKTsIl0q7cLIp11Sfo+nW
	 M0OT34J+0fxreORv7rPQ3sdv7S2k+QXPcP+mfDJFt8Yr/x7z2k1b9BPq23vit/ZBKwin+
	 sUN2P5R62RxT1gbjlWgb8wQjWxyvOaig48+yt9x8Euz0X/WQI3f36l0SUIg66mcu3WQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=WWfjxEf8;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 23EB7606A326;
	Tue,  3 Nov 2026 23:34:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=WWfjxEf8
Received: by smtp.kernel.org (Postfix) with ESMTPSA id DA1301F0093A;
	Tue,  3 Nov 2026 23:34:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1793748888;
	bh=Oc5pGUxi8G3lFQzA+IOSJJX8PHV/w0+Vbyoey5Zk2XA=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To;
	b=WWfjxEf8TWpELH6Er7tK8jaF6FdmBbxrMa99unOofps685Zd21povaIP8uFqwElh8
	 7mxcUNV+gd1XHN7WLusLEn1byMDIpWAG55ctKUyRGrqUI7zdZlGYhQzIy0Qs8kvdn4
	 qIWP3wi1KG8ywH9srmFdkwRC1YJON5iFpHmhaTDV9P8NEzJIKowQa0IcJu0vmUy0Ff
	 HdMjOmnBdVpVQwIGIb8EJv9Fx4BFUPphEdY6N8dYaWqvbG/rS5rq5QWUjzZqsRuNXB
	 7XbCq07+wCRancyrOKDoPrJiih3tsRwN5EQkvAx3A0LAtT00q3pn1iWDFFK983AeOc
	 2n0H6pOFi9kKg==
Message-ID: <76dffd89-e5b6-46cc-96b1-f68ac6cc87c0@kernel.org>
Date: Wed, 4 Nov 2026 10:34:44 +1100
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
Subject: Re: [PATCH] selftests/powerpc: override EMIT_TESTS instead of the
 emit_tests rule
To: Sasha Levin <sashal@kernel.org>, Madhavan Srinivasan
 <maddy@linux.ibm.com>, Shuah Khan <shuah@kernel.org>
Cc: Nicholas Piggin <npiggin@gmail.com>,
 "Christophe Leroy (CS GROUP)" <chleroy@kernel.org>,
 "Ritesh Harjani (IBM)" <ritesh.list@gmail.com>,
 Shrikanth Hegde <sshegde@linux.ibm.com>, linuxppc-dev@lists.ozlabs.org,
 linux-kselftest@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20261103232307.1924618-3-sashal@kernel.org>
Content-Language: en-US
From: Michael Ellerman <mpe@kernel.org>
In-Reply-To: <20261103232307.1924618-3-sashal@kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 4/11/26 10:23 am, Sasha Levin wrote:
> The powerpc Makefiles include lib.mk and then define their own
> emit_tests rule, so every selftests build that includes powerpc warns,
> on any architecture:
> 
>    Makefile:60: warning: overriding recipe for target 'emit_tests'
>    ../lib.mk:183: warning: ignoring old recipe for target 'emit_tests'
> 
> lib.mk used to keep the recipe in an EMIT_TESTS variable that Makefiles
> could override, as they still do with RUN_TESTS, INSTALL_RULE and
> CLEAN. Commit d4e59a536f50 ("selftests: Use runner.sh for emit
> targets") dropped the variable, and commit 58b33e78a317
> ("selftests/powerpc: Fix emit_tests to work with run_kselftest.sh")
> then replaced the powerpc EMIT_TESTS definitions with rules.
> 
> Bring EMIT_TESTS back in lib.mk and override it in the powerpc Makefiles
> again. Mark the lib.mk recipe with '+', so that the powerpc sub-makes
> still get the jobserver, as they did when $(MAKE) was in the rule
> itself. The emitted test lists don't change.
> 
> Fixes: 58b33e78a317 ("selftests/powerpc: Fix emit_tests to work with run_kselftest.sh")
> Signed-off-by: Sasha Levin <sashal@kernel.org>
> ---
> Checked with "make ARCH=powerpc emit_tests" in
> tools/testing/selftests/powerpc, which lists the same 186 tests as
> before, and with an x86_64 selftests install, whose kselftest-list.txt
> doesn't change. make -j2 --jobserver-style=pipe doesn't warn about the
> jobserver.
> 
>   tools/testing/selftests/lib.mk               | 6 +++++-
>   tools/testing/selftests/powerpc/Makefile     | 3 ++-
>   tools/testing/selftests/powerpc/pmu/Makefile | 3 ++-
>   3 files changed, 9 insertions(+), 3 deletions(-)

Thanks, this is the right fix. I should have done this in 58b33e78a317 but
just wanted to get it fixed without touching lib.mk, which was lazy.

Acked-by: Michael Ellerman <mpe@kernel.org>

cheers

