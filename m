Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C1F6625B662;
	Sun,  8 Feb 2026 18:27:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770575256; cv=none; b=aaqUFN3pbavtFshUMQ+9F0+L/qqRLHWJTVVa8c/+mUBSsZDLhnei3pn/fTLXzNUCHG9eAyowDJIT25VIRx+w3xy4aua0Wh/y5AuwYic5PcEESVNb40V/p8LzfrDMUnB18lUz7TW5siJJjsVzdjqsUm77bLeu7g+fLR86Q8mUi5I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770575256; c=relaxed/simple;
	bh=W3IffCLBrBgEf2FYeJ7rhswTjUr6OfyY2Wh/al7U8XI=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=hhnCiJc/2EbfARgcLJYKxXP/qEdt31ZDALMW6dPlcJj5nT0UwlF5SIXySHWza0SGJnK9G73gj1IdOEzByZxxh+QXvw8kOnZ5/2Vdo5tO5bSp5EFPoArmpi1gVBPCgLCduwUp+aKaYVqbGoTJKaD/vcL69ZtFX+W3ViLZUYcVU4I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=XWAOIIyB; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="XWAOIIyB"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 400F3C4CEF7;
	Sun,  8 Feb 2026 18:27:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1770575256;
	bh=W3IffCLBrBgEf2FYeJ7rhswTjUr6OfyY2Wh/al7U8XI=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=XWAOIIyBjdG9Vc8ratkZMGToWGpGS/da+eAb3qMLd1bnOCHMIiwdJVYMFEEGWZm/q
	 hAiMMVTUNzllZSc5rUdMmrZKayp2JI3ek7isQt2hiPO2xW760qnyYFsEnPKqkCRLSy
	 bmat2sMb+3QLwuUtZK4IDo4A85NVbws0+iYLAFI6U19HjdA49JDmdFeejpnR1efl5x
	 /+T7HZTx6VYg1VhNShhV8oM8AHaOUKqQztLzSP5psxii5nJuUggsCOlQaVS3RM8an4
	 DSXWCdVhP1vEz4SmE7/Vz17lkpPXjuvsyiuR3wpC46gW4RCadIvavAT9vJHVMSkQVJ
	 2t/caZhI65vyw==
Date: Sun, 8 Feb 2026 20:27:29 +0200
From: Mike Rapoport <rppt@kernel.org>
To: Jordan Richards <jordanrichards@google.com>
Cc: Pasha Tatashin <pasha.tatashin@soleen.com>,
	Pratyush Yadav <pratyush@kernel.org>, Shuah Khan <shuah@kernel.org>,
	Jason Miu <jasonmiu@google.com>,
	David Matlack <dmatlack@google.com>, linux-mm@kvack.org,
	linux-kernel@vger.kernel.org, linux-kselftest@vger.kernel.org
Subject: Re: [PATCH v2 2/2] selftests/liveupdate: add end to end test
 infrastructure and scripts
Message-ID: <aYjVkb8qOA6yHDA7@kernel.org>
References: <20260205222329.2419035-1-jordanrichards@google.com>
 <20260205222329.2419035-3-jordanrichards@google.com>
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260205222329.2419035-3-jordanrichards@google.com>

Hi Jordan,

On Thu, Feb 05, 2026 at 10:23:29PM +0000, Jordan Richards wrote:
> From: Pasha Tatashin <pasha.tatashin@soleen.com>
> 
> Add the end to end testing infrastructure required to verify the
> liveupdate feature. This includes a custom init process, a test
> orchestration script, and a batch runner.
> 
> The framework consists of:
> 
> init.c:
> A lightweight init process that manages the kexec lifecycle.
> It mounts necessary filesystems, determines the current execution
> stage (1 or 2) via the kernel command line, and handles the
> kexec_file_load() sequence to transition between kernels.
> 
> luo_test.sh:
> The primary KTAP-compliant test driver. It handles:
> - Kernel configuration merging and building.
> - Cross-compilation detection for x86_64 and arm64.
> - Generation of the initrd containing the test binary and init.
> - QEMU execution with automatic accelerator detection (KVM, HVF,
>  or TCG).
> 
> run.sh:
> A wrapper script to discover and execute all `luo_*.c`
> tests across supported architectures, providing a summary of
> pass/fail/skip results.
> 
> Signed-off-by: Pasha Tatashin <pasha.tatashin@soleen.com>

I think you also need 
Co-developed-by: Jordan Richards <jordanrichards@google.com>

> Signed-off-by: Jordan Richards <jordanrichards@google.com>

With nolibc fixes Thomas requested:

Reviewed-by: Mike Rapoport (Microsoft) <rppt@kernel.org>

-- 
Sincerely yours,
Mike.
