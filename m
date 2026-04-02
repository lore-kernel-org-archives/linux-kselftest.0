Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 802C5388E78;
	Thu,  2 Apr 2026 07:28:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775114904; cv=none; b=ZATgEftmuQj+xv4Ewk9MGZ51mmdnu+9IIwvW24ig2rbJLwRQkUniekUUN9mzi+feFMh2HcAxjrm6uuz0clcL4OCljsfmGzcw2c1f4d7WJd6w+mjRzLj5Msr1tQ+uk3qu9d+sgO5mba2zmzbkYdeazt7f7cPPb9oLh4prkT8zm5w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775114904; c=relaxed/simple;
	bh=s4DktcxYHxIQyKItWyyiTcktdapW1VOpPYdWxcQrfYI=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=hvVtppD7RnZYZBKsdk0A1+/qew9mipA25taWau7SGTbRhsyMPWO+CBuTKfZX2LUT48tTr0D3ONTlgf+LqDiqYodhGi/Qc/JyXzvY00I2A3+N6o3E4UCPIS+Fd0oN3RB9QD45rEhc1ZTxqOtol8WgsW4P9j0WmdRb9sKqvuFmoo4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=jSSyx/XU; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="jSSyx/XU"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A4D20C2BC9E;
	Thu,  2 Apr 2026 07:28:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1775114904;
	bh=s4DktcxYHxIQyKItWyyiTcktdapW1VOpPYdWxcQrfYI=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=jSSyx/XUgzH8me+WQNiUcNtdsh5wE7pEg1D5p26XknqUIoOrz4umY52V9T8+OJeCp
	 wBxHXhPy8IJfp0NTA4PR30iX8xEPBq50qJc3ZsxwvcBFcm3eK98t1w4myGez8zT4FJ
	 mRfZm5qMFTBCuvU0gX72h4+ZnK1KHmFTfs4uRIibTh+5Qrzop4y7CdZD+CPCSwRW5o
	 eUPrV1nH0YqEI0BDVlqvpu8CYpq2fdZWPl3s6l7FUdg4cv5Uj6oH9UW4+PRDTu6V0x
	 5ZeESauDqpj+ms090X7/idd+ykAN1fFvaQoVkAmwkhmCdW510uXxG/sU+iwe5tw1SJ
	 19b3qLLVde9JQ==
Message-ID: <4f6d4ee8-9f2b-4da8-9456-f47cccfe4367@kernel.org>
Date: Thu, 2 Apr 2026 09:28:16 +0200
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/2] selftests/mm: verify droppable mappings cannot be
 locked
To: Anthony Yznaga <anthony.yznaga@oracle.com>, linux-mm@kvack.org,
 linux-kernel@vger.kernel.org, linux-kselftest@vger.kernel.org
Cc: akpm@linux-foundation.org, ljs@kernel.org, Liam.Howlett@oracle.com,
 vbabka@kernel.org, rppt@kernel.org, surenb@google.com, mhocko@suse.com,
 jannh@google.com, pfalcato@suse.de, Jason@zx2c4.com, shuah@kernel.org
References: <20260402003417.438037-1-anthony.yznaga@oracle.com>
 <20260402003417.438037-3-anthony.yznaga@oracle.com>
From: "David Hildenbrand (Arm)" <david@kernel.org>
Content-Language: en-US
Autocrypt: addr=david@kernel.org; keydata=
 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
 qIws/H2t
In-Reply-To: <20260402003417.438037-3-anthony.yznaga@oracle.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

> +
> +/*
> + * Droppable memory should not be lockable.
> + */
> +static void test_mlock_droppable(void)
> +{
> +	char *map;
> +	unsigned long page_size = getpagesize();
> +
> +	/*
> +	 * Ensure MCL_FUTURE is not set.
> +	 */
> +	if (mlockall(MCL_CURRENT))
> +		ksft_exit_fail_msg("mlockall(MCL_CURRENT): %s\n", strerror(errno));

Why do we need the prior mlockall()? If that is really required, the
comment should be clearer why the munlockall() is insufficient.

Also, why can't we fail only the test?

> +	if (munlockall())
> +		ksft_exit_fail_msg("munlockall() %s\n", strerror(errno));

Why can't we fail only the test?

> +
> +	map = mmap(NULL, 2 * page_size, PROT_READ | PROT_WRITE,
> +		   MAP_ANONYMOUS | MAP_DROPPABLE, -1, 0);
> +	if (map == MAP_FAILED) {
> +		if (errno == EOPNOTSUPP) {
> +			ksft_test_result_skip("%s: MAP_DROPPABLE not supported\n", __func__);
> +			return;
> +		}
> +		ksft_exit_fail_msg("mmap error: %s\n", strerror(errno));

same.

> +	}
> +
> +	if (mlock2_(map, 2 * page_size, 0)) {
> +		munmap(map, 2 * page_size);

Not required when exiting either way?

> +		ksft_exit_fail_msg("mlock2(0): %s\n", strerror(errno));
> +	}
> +
> +	ksft_test_result(!unlock_lock_check(map, false), "%s: droppable memory not locked\n",
> +			__func__);
> +
> +	munmap(map, 2 * page_size);
> +}
> +
> +static void test_mlockall_future_droppable(void)
> +{
> +	char *map;
> +	unsigned long page_size = getpagesize();
> +
> +	if (mlockall(MCL_CURRENT | MCL_FUTURE))
> +		ksft_exit_fail_msg("mlockall(MCL_CURRENT | MCL_FUTURE): %s\n", strerror(errno));

Similar comments as for the other path regarding ksft_exit_fail_msg() etc.

> +
> +	map = mmap(NULL, 2 * page_size, PROT_READ | PROT_WRITE,
> +		   MAP_ANONYMOUS | MAP_DROPPABLE, -1, 0);
> +
> +	if (map == MAP_FAILED) {
> +		if (errno == EOPNOTSUPP) {
> +			ksft_test_result_skip("%s: MAP_DROPPABLE not supported\n", __func__);
> +			return;
> +		}
> +		ksft_exit_fail_msg("mmap error: %s\n", strerror(errno));
> +	}
> +
> +	ksft_test_result(!unlock_lock_check(map, false), "%s: droppable memory not locked\n",
> +			__func__);
> +
> +	if (munlockall()) {
> +		munmap(map, 2 * page_size);
> +		ksft_exit_fail_msg("munlockall() %s\n", strerror(errno));
> +	}
> +
>  	munmap(map, 2 * page_size);
>  }

-- 
Cheers,

David
