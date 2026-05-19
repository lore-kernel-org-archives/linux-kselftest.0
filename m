Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1B25634A794;
	Tue, 19 May 2026 19:18:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779218295; cv=none; b=GB+vMespBaML5EDQR/hs/jx4UCZUWRluLyJoaAkflrbs3Lv5GgMoXx85ZoFYHMwUv+jPNjE8221nYcpi+8/3pHTuGDtF0WYf+UHZflyHsHRJ1ijfEzlARVjr3o70++dJD94PIu071Kjcx/3zse2HSqjRnFklgbCcjmOtvUBNMYk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779218295; c=relaxed/simple;
	bh=0to9wy+ftUbeuFZlejkcau47RKs/KLjkt2Rf8ckjDRc=;
	h=Date:From:To:Cc:Subject:Message-Id:In-Reply-To:References:
	 Mime-Version:Content-Type; b=rSDZFDKfPC52kSPQnPzkLvwjJXPgAWbfy3rzMjr+9LSgOeA21o9l3gUHrMu5TtH+U2DPbq9sStRn05XqiwsNBn1e1t7lJv4JUfKMR5dXLXJbbO0U/ZXYgEI9QLpBbo6IVyOyHOdWM8t2FmPwQFIP34S2Ki1VDVyka6Xx27zxINs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (1024-bit key) header.d=linux-foundation.org header.i=@linux-foundation.org header.b=hdI4EKQ4; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux-foundation.org header.i=@linux-foundation.org header.b="hdI4EKQ4"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6AA191F000E9;
	Tue, 19 May 2026 19:18:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=linux-foundation.org; s=korg; t=1779218293;
	bh=QWGJVJRpu4bAqcHcaPSNlUoHbdF/hYBtRhQYqpbtMuY=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References;
	b=hdI4EKQ4d12U2VWBzrKOU4ml1ekB0uzdYY8FaH9Xz35aZEIxRs7cmT0w9FawD6rs5
	 EoOy2FQeKMu3tN+QumMxF13K7sr6+bNrcXX1PtjpBsHdKjB2FFs5CBzZFiSNdjEkB+
	 QynTH1LRtv7r5awMlZmrBkIhLKE5wUv9Ev7xll6E=
Date: Tue, 19 May 2026 12:18:13 -0700
From: Andrew Morton <akpm@linux-foundation.org>
To: Wei Yang <richard.weiyang@gmail.com>
Cc: Vineet Agarwal <agarwal.vineet2006@gmail.com>, david@kernel.org,
 ljs@kernel.org, linux-mm@kvack.org, linux-kselftest@vger.kernel.org,
 linux-kernel@vger.kernel.org
Subject: Re: [PATCH] selftests/mm: check file initialization writes in
 split_huge_page_test
Message-Id: <20260519121813.4b188b21f7280d6e1d9a55e1@linux-foundation.org>
In-Reply-To: <20260519025141.lguv7mrtvqgqpltc@master>
References: <20260512074924.27721-1-agarwal.vineet2006@gmail.com>
	<20260515092211.qkmaxcofxwfdexld@master>
	<20260518163553.447a45c54a3d419b9bb916ca@linux-foundation.org>
	<20260519025141.lguv7mrtvqgqpltc@master>
X-Mailer: Sylpheed 3.8.0beta1 (GTK+ 2.24.33; x86_64-pc-linux-gnu)
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit

On Tue, 19 May 2026 02:51:41 +0000 Wei Yang <richard.weiyang@gmail.com> wrote:

> >Not understanding - cab you please describe more completely?
> >
> 
> I mean do this below.
> 
> diff --git a/tools/testing/selftests/mm/split_huge_page_test.c b/tools/testing/selftests/mm/split_huge_page_test.c
> index 460fa1f606fd..f30402ece608 100644
> --- a/tools/testing/selftests/mm/split_huge_page_test.c
> +++ b/tools/testing/selftests/mm/split_huge_page_test.c
> @@ -469,7 +469,7 @@ static int create_pagecache_thp_and_fd(const char *testfile, size_t fd_size,
>         }
>         if (write(*fd, "3", 1) != 1) {
>                 ksft_perror("write to drop_caches");
> -               goto err_out_unlink;
> +               goto err_out_close;
>         }
>         close(*fd);
> 
> On error writing this fd, /proc/sys/vm/drop_caches, we forget to close it.

Oh, OK, that's a buglet.  Please send a formal fix sometime?
