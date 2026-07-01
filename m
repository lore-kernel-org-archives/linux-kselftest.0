Received: from foss.arm.com (foss.arm.com [217.140.110.172])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id F3F0C34DB52;
	Wed,  1 Jul 2026 08:46:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.140.110.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782895611; cv=none; b=NIz32znrhU1kAkXkbJH4DX8T5LIWEp1PdNPryVCcKFERVZxQBS6Wp6PG/sxhf79ILU4eGMp0QXacdaOdKY0Kt7+Ig2osxH+H4V5ajtCGZY/UHoJAfN6a6p6uzyHZ2qTg7EVDjMJ0DJXjH966nn94B8J2LaD0LQUTV9bg9i0oHZ0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782895611; c=relaxed/simple;
	bh=uR4IHTNg4iqIgPvoJ4nECT0AvoZlomJhg30Tk7S7lxM=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=bHZDuHGvluzCTsz5TpRNADgxYUMqqDUZbwJvfgF8/uoUXd1NiaXd9Mp+UXz6YLjWwhxSda55fWvb6qMkaVJsExyajIhoPjaO+50ESzrvmYem+nQCFf/aZ4rBtrEJHi8v5OMb4n6+FflfhGmlISI2RiqW3Pf4tIRkUi0XAGTHvbY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com; spf=pass smtp.mailfrom=arm.com; dkim=pass (1024-bit key) header.d=arm.com header.i=@arm.com header.b=AyQq6eyv; arc=none smtp.client-ip=217.140.110.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=arm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=arm.com header.i=@arm.com header.b="AyQq6eyv"
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 702922364;
	Wed,  1 Jul 2026 01:46:37 -0700 (PDT)
Received: from [10.57.81.2] (unknown [10.57.81.2])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id DBAED3F85F;
	Wed,  1 Jul 2026 01:46:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1782895601; bh=uR4IHTNg4iqIgPvoJ4nECT0AvoZlomJhg30Tk7S7lxM=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=AyQq6eyvCbr55bey4JrYXd7bdx5h55iKv0uGyuKkHEPlNLR61k/zJc+fFeaGGgiEp
	 J4yK8xJfsQelgenGEh4U/exbVka8KRYBpp9l4luuQ1N4nXjSVa0hvZJJCyp4AWlTu4
	 D09zykboYIrTeeJa/+9nUy6dF2XmEFFdk4yaqb/M=
Message-ID: <63a70282-0d9d-489b-ae70-436901e6bf70@arm.com>
Date: Wed, 1 Jul 2026 10:46:30 +0200
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v8 1/5] selftests/mm: move pkey selftest helpers to
 pkey_util.c
To: Hongfu Li <lihongfu@kylinos.cn>, akpm@linux-foundation.org,
 david@kernel.org, ljs@kernel.org, liam@infradead.org, vbabka@kernel.org,
 rppt@kernel.org, surenb@google.com, mhocko@suse.com, shuah@kernel.org
Cc: linux-mm@kvack.org, linux-kselftest@vger.kernel.org,
 linux-kernel@vger.kernel.org, keith.lucas@oracle.com, maddy@linux.ibm.com,
 usama.anjum@collabora.com, yury.khrustalev@arm.com, jhubbard@nvidia.com,
 joey.gouly@arm.com, zwisler@google.com, hongfu.li@linux.dev
References: <20260630073235.3802271-1-lihongfu@kylinos.cn>
 <20260630073235.3802271-2-lihongfu@kylinos.cn>
From: Kevin Brodsky <kevin.brodsky@arm.com>
Content-Language: en-GB
In-Reply-To: <20260630073235.3802271-2-lihongfu@kylinos.cn>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 30/06/2026 09:32, Hongfu Li wrote:
> [...]
>
> diff --git a/tools/testing/selftests/mm/pkey_util.c b/tools/testing/selftests/mm/pkey_util.c
> index 255b332f7a08..abf708d6575e 100644
> --- a/tools/testing/selftests/mm/pkey_util.c
> +++ b/tools/testing/selftests/mm/pkey_util.c
>
> [...]
>
> +void abort_hooks(void)
> +{
> +	fflush(stdout);
> +	fprintf(stderr, "running %s()...\n", __func__);
> +	tracing_off();
> +#ifdef SLEEP_ON_ABORT
> +	sleep(SLEEP_ON_ABORT);
> +#endif
> +}

Definitely an improvement to move this to pkey_util.c. We still have
multiple functions declared in pkey-helpers.h and defined in
protection_keys.c (which clearly doesn't make sense), but this is a step
in the right direction.

Reviewed-by: Kevin Brodsky <kevin.brodsky@arm.com>
