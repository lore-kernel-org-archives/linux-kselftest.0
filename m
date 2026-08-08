Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 324DF1A9F97;
	Sat,  8 Aug 2026 00:15:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786148127; cv=none; b=ilNaBCyWTUv8Vx7u22+v1DEDuvp+hMRUTCURo5s8zfMbQbexyiclLvRjse1pav1p71bqzROESL+vaFEqexZr7nM7zRV16VsK4pQd8JO7RY8PIQVmD1YUBaMpRA4aKk5lVjBOHc+MHgv/yeoilwhsJlwG4DYd/MPb0PUck4SaKns=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786148127; c=relaxed/simple;
	bh=6utTWcrdX2rU2PjEZRN9xHDdTkbQfHq4br9yo7b8i+E=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=ChonqGgF2l8vmwYKqgw8B3izIdeNvRaWq2Cyj6wcbbLjjpJMUZ99vP8tJ7Nsehxr06rKENIsRYXar6QofApzVwDdt8Qrf9zJthPWFipVgG28tVdmsHBb9KXGaMkqosmW/y2m2f0Qh9pAgCs945aBd/zIGKcmWMV2UtoLrwHVt5Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=dOoFAEzh; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="dOoFAEzh"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 20C7A1F000E9;
	Sat,  8 Aug 2026 00:15:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1786148125;
	bh=HYOtN5es1U3sL5PR1h8VK1Qw6VZNk1IXyhW2dQx1Zs8=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=dOoFAEzh8QmWlhl/Qey0OxS02wr9iK4w12SUs9xV+kECYHt0HTDukkQBZTGp81fMK
	 aeOyjdWhiUx5K6GDLRAc/cB+qpwOny3BP21x+MbrKMCV+ZwpOxn31KQE68S0+D9Qk8
	 vTJ0ADvU1qkuuuyQSJXOYovSYfUBNX59EEeBqlKdqC8s+zSC2omC63cyGydoeIFwRQ
	 doN/uqitbni8Bc02I/L3L4cxwM3RBjWjj2VLUFD/zmgip+A4s56BjTQzaIfYJB/7qu
	 VytlEzgmjSEofYTW+NgJVSqqPJ+wCIkhIgAF3gzw61zlwWEPjK62Ai9wAAu8zNP/ry
	 osOEKEqqV/M2w==
From: SJ Park <sj@kernel.org>
To: Hongfu Li <hongfu.li@linux.dev>
Cc: SJ Park <sj@kernel.org>,
	akpm@linux-foundation.org,
	david@kernel.org,
	liam@infradead.org,
	lihongfu@kylinos.cn,
	linux-kernel@vger.kernel.org,
	linux-kselftest@vger.kernel.org,
	linux-mm@kvack.org,
	ljs@kernel.org,
	mhocko@suse.com,
	rppt@kernel.org,
	shuah@kernel.org,
	surenb@google.com,
	vbabka@kernel.org
Subject: Re: [PATCH v2] selftests/mm: Drop duplicate test_seal_mprotect_two_vma_with_gap() call
Date: Fri,  7 Aug 2026 17:15:20 -0700
Message-ID: <20260808001521.1467-1-sj@kernel.org>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20260807071533.48130-1-hongfu.li@linux.dev>
References: 
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

On Fri,  7 Aug 2026 15:15:33 +0800 Hongfu Li <hongfu.li@linux.dev> wrote:

> > > ---
> > > v2:
> > > - update ksft_set_plan(88) to 87 to match the actual number of tests
> > >   after removing the duplicate call.
> > 
> > I wonder if there could be an automated way for this.  Obviously not a question
> > to the author but just my loud thought.
> 
> Glad you brought this up, I totally agree with your thought.
> 
> Something like the below refactor could achieve that automation:
> 
> +typedef void (*test_fn)(void);
> +typedef void (*test_fn_seal)(bool seal);
> +
> +static const struct {
> +    test_fn_seal fn;
> +    bool seal;
> +} tests_seal[] = {
> +    { test_seal_mprotect, false },
> +    { test_seal_mprotect, true },
> ...
> +};
> +
> +static const test_fn tests[] = {
> +    test_seal_addseal,
> +    test_seal_unmapped_start,
> ...
> +};
> +
> +
>  int main(void)
>  {
> ...
> -       ksft_set_plan(87);
> +       ksft_set_plan(ARRAY_SIZE(tests) + ARRAY_SIZE(tests_seal));
> +       for (size_t i = 0; i < ARRAY_SIZE(tests); i++)
> +               tests[i]();
> +       for (size_t i = 0; i < ARRAY_SIZE(tests_seal); i++)
> +        tests_seal[i].fn(tests_seal[i].seal);

Thank you for sharing your great idea.

> 
> Though I'm still unsure whether this extra complexity is really worthwhile.

Agreed.  I believe it is good to have this as is for now.

If we have to add such automation, I think kselftest framework is a better
place to change, than each test.


Thanks,
SJ
