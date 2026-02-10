Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F057236F403;
	Tue, 10 Feb 2026 14:18:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770733099; cv=none; b=aNYGPOH8H567z0yTcCU+1jkC97BHT8IzC5u+eps+jEVA2+Nd32r9uxamZatZoJh3RAMF0XAfghS8a8gBI6vqqRiWEMrLeVLzJZuPSwkxLfra9fZNncD9BjMhHT7eE7KqgAAxAIj7DG6xGXC/inHA+zKWfBHbaM0UjXqap3STKLg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770733099; c=relaxed/simple;
	bh=pBi1oKngaOkxk1hANba66yN+MosIZrEJ5L5a3Ah1fog=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:Message-ID:
	 MIME-Version:Content-Type; b=mNeoIpEthWI1kqtkI7/V7Dundl4W76rO2tuVn9T/BaR+c5+Xh1F4QCv7/pHBB76CjdF+EsnBvTqg65Wgio3hKJRpIXEWuCJLd/YhYz9nIsSQvgGnedrcPzyvnLIqBJr8B2l5LMqQph2L/WGdDbnsV4hgFNSPkeiYeYC93LR3gfo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=uon8PRAl; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="uon8PRAl"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id AC69AC116C6;
	Tue, 10 Feb 2026 14:18:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1770733098;
	bh=pBi1oKngaOkxk1hANba66yN+MosIZrEJ5L5a3Ah1fog=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:From;
	b=uon8PRAl13Fa3vEQRmHpfRyf9phQEjfFuJbA6AOZCVymgZbQLjGTWyyJ4ZosY1EsI
	 8nEfOr4oKvrV1BoHw9pl1Xhm6fd3HyMQ0sFwHpKjO2+sYtzpaY9yOUk8s9QuVsw7qe
	 ikJOJVlUe9GnLLL9MjdnjsHUmtslI9/OK1fzr5UBb8mLwHbdifX/zx9b0MmV7sYGeu
	 nWRenqSsitNmamtxhr1i327bvgW9tP2zku1Q2BRk+qKPFreVt3apNe8EIuiBBFCxKI
	 2IHqerhyf7LbFk7qwXI8KJYkyFrZJ6Ww6hh1u6bbyn7g7HFugpTppCc9yyZmGfxgbh
	 NTG4raCC0aAtw==
From: Pratyush Yadav <pratyush@kernel.org>
To: Mike Rapoport <rppt@kernel.org>
Cc: Jordan Richards <jordanrichards@google.com>,  Pasha Tatashin
 <pasha.tatashin@soleen.com>,  Pratyush Yadav <pratyush@kernel.org>,  Shuah
 Khan <shuah@kernel.org>,  Jason Miu <jasonmiu@google.com>,  David Matlack
 <dmatlack@google.com>,  linux-mm@kvack.org,  linux-kernel@vger.kernel.org,
  linux-kselftest@vger.kernel.org
Subject: Re: [PATCH v2 2/2] selftests/liveupdate: add end to end test
 infrastructure and scripts
In-Reply-To: <aYjVkb8qOA6yHDA7@kernel.org> (Mike Rapoport's message of "Sun, 8
	Feb 2026 20:27:29 +0200")
References: <20260205222329.2419035-1-jordanrichards@google.com>
	<20260205222329.2419035-3-jordanrichards@google.com>
	<aYjVkb8qOA6yHDA7@kernel.org>
Date: Tue, 10 Feb 2026 15:18:15 +0100
Message-ID: <2vxz3438smvs.fsf@kernel.org>
User-Agent: Gnus/5.13 (Gnus v5.13)
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain

On Sun, Feb 08 2026, Mike Rapoport wrote:

> Hi Jordan,
>
> On Thu, Feb 05, 2026 at 10:23:29PM +0000, Jordan Richards wrote:
>> From: Pasha Tatashin <pasha.tatashin@soleen.com>
>> 
>> Add the end to end testing infrastructure required to verify the
>> liveupdate feature. This includes a custom init process, a test
>> orchestration script, and a batch runner.
>> 
>> The framework consists of:
>> 
>> init.c:
>> A lightweight init process that manages the kexec lifecycle.
>> It mounts necessary filesystems, determines the current execution
>> stage (1 or 2) via the kernel command line, and handles the
>> kexec_file_load() sequence to transition between kernels.
>> 
>> luo_test.sh:
>> The primary KTAP-compliant test driver. It handles:
>> - Kernel configuration merging and building.
>> - Cross-compilation detection for x86_64 and arm64.
>> - Generation of the initrd containing the test binary and init.
>> - QEMU execution with automatic accelerator detection (KVM, HVF,
>>  or TCG).
>> 
>> run.sh:
>> A wrapper script to discover and execute all `luo_*.c`
>> tests across supported architectures, providing a summary of
>> pass/fail/skip results.
>> 
>> Signed-off-by: Pasha Tatashin <pasha.tatashin@soleen.com>
>
> I think you also need 
> Co-developed-by: Jordan Richards <jordanrichards@google.com>
>
>> Signed-off-by: Jordan Richards <jordanrichards@google.com>
>
> With nolibc fixes Thomas requested:
>
> Reviewed-by: Mike Rapoport (Microsoft) <rppt@kernel.org>

I didn't look too closely, but at a quick skim, LGTM.

Acked-by: Pratyush Yadav (Google) <pratyush@kernel.org>

-- 
Regards,
Pratyush Yadav
