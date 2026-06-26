Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C337B3EAC72;
	Fri, 26 Jun 2026 09:49:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782467388; cv=none; b=KNEyA7V5dHStqLV1PQzuDDZ+DqKBnL3ZsGx0fLXMcMkBtcjVJ2Kul5N2XwDUNKJIrl9B/CWcQfF0oe0oU8RYqRDE8N/YuhH2Su88l1xMWohNUSt3yvYcmm+AseA5rhrFGaUSd7323Wk1VChEA/5Y++45EzkFVcgvN53RRIVv70g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782467388; c=relaxed/simple;
	bh=0lZ9IA/BhQjOHSj5pWz9n2lK6bZpKEdILrDJD0V/riA=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:Message-ID:
	 MIME-Version:Content-Type; b=NLdgYX3H6kJwdXZCYZAU7ldinP1MILGsDHK3M+4AUzKO/eSaXdU5JLvZRr7/+9uaMMpiRFkke5ElBcyzV9Y7NKCCRJvJGIqNq6twaRfiiWbtGtEy4fuSwripwyD8PfnEy1i3fkMX10R3WFvCJW+OZfsxBkyvj+nnNKzBq2qS/Xg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=YUr0Kerr; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="YUr0Kerr"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9DA251F00A3A;
	Fri, 26 Jun 2026 09:49:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1782467387;
	bh=sKarf3WojTEtDL02vWetL6uYebMXxJkO3bOvu7zoQng=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date;
	b=YUr0Kerrbh2QuIIdyOHOVDcepjBbndMwnzTudYfheGuqV4Fntr0vAgbDXKC9LaqhX
	 ce0z/D+401e4kYwm1/ggRKKaEEWtgdzTFwyWsGSAzUT78379WgPjrVyCVMIzBhIyXM
	 OVRzdocqk2OGmDOBHFIM9wQ5DLXfkWjuH7WNLQaxwM7+hNMQdF0IUPVXXSdlT4vaSU
	 ZOFIftIDH91HbkI8zWjL5TORYM7YTeFGAewf9WhX3V6Bq/EllIS2ZN/HHNntdDjeeW
	 56wuMvW7i7cvBzV+s1+vCDVfI+KJGxdOuTf18N1wcHKSbeTkgrM5y9NVee9DOW6wy3
	 uw/3A00dBkIDA==
From: Pratyush Yadav <pratyush@kernel.org>
To: Mike Rapoport <rppt@kernel.org>
Cc: Pasha Tatashin <pasha.tatashin@soleen.com>,  Pratyush Yadav
 <pratyush@kernel.org>,  Jordan Richards <jordanrichards@google.com>,
  Shuah Khan <shuah@kernel.org>,  Thomas =?utf-8?Q?Wei=C3=9Fschuh?=
 <linux@weissschuh.net>,
  Willy Tarreau <w@1wt.eu>,  linux-kernel@vger.kernel.org,
  linux-kselftest@vger.kernel.org,  kexec@lists.infradead.org
Subject: Re: [PATCH v4] selftests/liveupdate: add end to end test
 infrastructure and scripts
In-Reply-To: <20260626-luo-vmtest-v0-v4-1-e7d3111cd5b3@kernel.org> (Mike
	Rapoport's message of "Fri, 26 Jun 2026 12:15:36 +0300")
References: <20260626-luo-vmtest-v0-v4-1-e7d3111cd5b3@kernel.org>
Date: Fri, 26 Jun 2026 11:49:44 +0200
Message-ID: <2vxz7bnlljgn.fsf@kernel.org>
User-Agent: Gnus/5.13 (Gnus v5.13)
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain

On Fri, Jun 26 2026, Mike Rapoport wrote:

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
> vmtest.sh:
> The primary KTAP-compliant test driver. It handles:
> - Kernel configuration merging and building.
> - Cross-compilation detection for x86_64 and arm64.
> - Generation of the initrd containing the test binary and init.
> - QEMU execution with automatic accelerator detection (KVM, HVF,
>  or TCG).
>
> run-vmtests.sh:
> A wrapper that runs vmtest.sh for each LUO test across supported
> architectures, providing a summary of pass/fail/skip results.
>
> Signed-off-by: Pasha Tatashin <pasha.tatashin@soleen.com>
> Co-developed-by: Jordan Richards <jordanrichards@google.com>
> Signed-off-by: Jordan Richards <jordanrichards@google.com>
> Co-developed-by: Mike Rapoport (Microsoft) <rppt@kernel.org>
> Signed-off-by: Mike Rapoport (Microsoft) <rppt@kernel.org>

Acked-by: Pratyush Yadav <pratyush@kernel.org>

[...]

-- 
Regards,
Pratyush Yadav
