Received: from foss.arm.com (foss.arm.com [217.140.110.172])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4546044AB9B;
	Wed, 26 Aug 2026 14:56:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.140.110.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787756207; cv=none; b=YeEMY9Z9R9WdkkEhV+60+vgyZcZuB6S0L9FKi6uxdylbv7ay3ncZb0fNIsjIrCYz3XnoZGdkS3wLRblGTlgyP3VJnOOobsLKFgDNblW5j58O4j3/+aheKnYCBObp3mpq5dK8ovHK1uYNxzymCHOaP8vgSeYBwWJA2+TthbMBAlw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787756207; c=relaxed/simple;
	bh=4tPYM1biekkgrUfsKjpXDOctNcWevZefI38ziSOlCSQ=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=q0zIKjbYlbDbeGPPllcItFieO0oB6zTrhwgJ584RF1DMrbexPcdf+C8RfRalNst3HW2hl6NYncSUbx1N7bWiukq6aBveKWegI414ku44OzcNt8icWvPsNW1PARJJpn516EYXakZKTVhWkqFOrmB55g3Pdr6WKH1550iG+6vlH04=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com; spf=pass smtp.mailfrom=arm.com; dkim=pass (1024-bit key) header.d=arm.com header.i=@arm.com header.b=LtP9Lszu; arc=none smtp.client-ip=217.140.110.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=arm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=arm.com header.i=@arm.com header.b="LtP9Lszu"
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id DBEDF16F2;
	Wed, 26 Aug 2026 07:56:41 -0700 (PDT)
Received: from [10.1.39.91] (e127648.arm.com [10.1.39.91])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 043823F7D8;
	Wed, 26 Aug 2026 07:56:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1787756205; bh=4tPYM1biekkgrUfsKjpXDOctNcWevZefI38ziSOlCSQ=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=LtP9Lszu5wwzTcDcbjlzYzYhmmlCIEBBraUjeSctGCjos67JX/pkPOqmmo/jn9DUv
	 zNk3c9zDPxeSqH7NzEb5qi+9LlkmtUnaSooXGp1rUzTZamIruYMI5CtZX30Bb4PJC6
	 ZNIbMxVsw12Au4lsU0mRH/UC1P2wrG++ZUf2rpZI=
Message-ID: <499c6893-5daf-421d-ae11-31d0d9332241@arm.com>
Date: Wed, 26 Aug 2026 15:56:42 +0100
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 0/3] selftests: Skip SUD tests when unsupported
To: Shuah Khan <shuah@kernel.org>, linux-kselftest@vger.kernel.org
Cc: Rama Krishna Katta <ramakrishna.katta@arm.com>,
 Thomas Gleixner <tglx@kernel.org>, Gregory Price
 <gourry.memverge@gmail.com>, Kees Cook <kees@kernel.org>,
 Peter Zijlstra <peterz@infradead.org>, Andy Lutomirski <luto@kernel.org>,
 Gabriel Krisman Bertazi <krisman@collabora.com>, linux-kernel@vger.kernel.org
References: <cover.1786965107.git.christian.loehle@arm.com>
Content-Language: en-US
From: Christian Loehle <christian.loehle@arm.com>
In-Reply-To: <cover.1786965107.git.christian.loehle@arm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 8/17/26 12:16, Christian Loehle wrote:
> Syscall User Dispatch (SUD) is unavailable on architectures without
> generic syscall entry. Such architectures return -EINVAL for otherwise
> valid SUD prctl and ptrace requests, which the SUD selftests currently
> report as failures.
> 
> Probe SUD with a valid disabled configuration and skip the affected tests
> when that probe returns EINVAL. Unexpected errors remain failures, and the
> existing coverage is unchanged on kernels that support SUD.
> 
> Christian Loehle (3):
>   selftests/ptrace: Skip get_set_sud if SUD is unsupported
>   selftests/syscall_user_dispatch: Skip tests if SUD is unsupported
>   selftests/syscall_user_dispatch: Skip benchmark if SUD is unsupported
> 
>  tools/testing/selftests/ptrace/get_set_sud.c  |  8 +++++
>  .../syscall_user_dispatch/sud_benchmark.c     |  9 +++++
>  .../syscall_user_dispatch/sud_test.c          | 36 +++++++++++++++++++
>  3 files changed, 53 insertions(+)
> 
> 
> base-commit: 8d3ae59288f1e7d58d76558a6ee96d533bc5019f

Gentle ping on this
