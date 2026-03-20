Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2527E2E1F11;
	Fri, 20 Mar 2026 20:53:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774040034; cv=none; b=i/AZ4HvhRulesmdRYppo+SNbEoylqmROBz8TeRyqUTMiC29Wn35/yFjh8JTPlspgbej87rWqyEnW4gowNK2ZmZV+ts26+3Vi/Dp+NCwcSulvuIfagHwYlt6YCOUVJVRAqUIuyZHhP+nkwz6jekKNeSYNg0lsUSDxBH3sWsstncI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774040034; c=relaxed/simple;
	bh=XroiJxEEGdNWjceuamhV1OA5FIszYsMzqzw5iXiJN2E=;
	h=Date:From:To:Cc:Subject:Message-Id:In-Reply-To:References:
	 Mime-Version:Content-Type; b=Q+693vVuxpjdODzyK2tTuMFVeiJ1CZSIHa2nOrl06vNooNLAw0bMFe1mTF8w4mWhAoHlesrTM9FJAw02keEbXtoYvGoA6TfisbeYVAVbz9ph6w1ebBArABP7rLZiZsqWgk9MAjiOnFCNHhhhDS8BW5kCVpv6VswOZ4mo9SXujTM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (1024-bit key) header.d=linux-foundation.org header.i=@linux-foundation.org header.b=pZnf/QTW; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux-foundation.org header.i=@linux-foundation.org header.b="pZnf/QTW"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 36074C4CEF7;
	Fri, 20 Mar 2026 20:53:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linux-foundation.org;
	s=korg; t=1774040033;
	bh=XroiJxEEGdNWjceuamhV1OA5FIszYsMzqzw5iXiJN2E=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
	b=pZnf/QTW0b89tenZJtxRPDk9uPa+iHqgqViWgH9ajaHkxJ4DKtUYwocSR8YvvaEd1
	 /B9LLPkifVtUseT9Jwhp1I5HyRnz627dFVbs1yVLbEvKqYrHE7jzXImjCSwImIw265
	 +oQtb1WHLE1XEIptM3nown4JQcTBxGza3bm/nBcE=
Date: Fri, 20 Mar 2026 13:53:52 -0700
From: Andrew Morton <akpm@linux-foundation.org>
To: Audra Mitchell <audra@redhat.com>
Cc: david@kernel.org, ljs@kernel.org, Liam.Howlett@oracle.com,
 vbabka@kernel.org, rppt@kernel.org, surenb@google.com, mhocko@suse.com,
 shuah@kernel.org, usama.anjum@collabora.com, colin.i.king@gmail.com,
 avagin@google.com, linux-kselftest@vger.kernel.org, linux-mm@kvack.org,
 linux-kernel@vger.kernel.org
Subject: Re: [PATCH] selftests/mm: Fix soft-dirty kselftest supported check
Message-Id: <20260320135352.53cc24edc1ce1666141168f6@linux-foundation.org>
In-Reply-To: <20260320184010.759461-2-audra@redhat.com>
References: <f7fef55d-4334-4d1d-b6c6-b409fea7e2a1@kernel.org>
	<20260320184010.759461-1-audra@redhat.com>
	<20260320184010.759461-2-audra@redhat.com>
X-Mailer: Sylpheed 3.8.0beta1 (GTK+ 2.24.33; x86_64-pc-linux-gnu)
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit

On Fri, 20 Mar 2026 14:39:15 -0400 Audra Mitchell <audra@redhat.com> wrote:

> On architectures with separate user address space, such as s390 or
> those without an MMU, the soft-dirty kselftest may fail when checking
> to see if the feature is supported.
> 
>   # --------------------
>   # running ./soft-dirty
>   # --------------------
>   # TAP version 13
>   # 1..15
>   # Bail out! PAGEMAP_SCAN succeeded unexpectedly
>   # # Totals: pass:0 fail:0 xfail:0 xpass:0 skip:0 error:0
>   # [FAIL]
>   not ok 1 soft-dirty # exit=1
>   # SUMMARY: PASS=0 SKIP=0 FAIL=1
> 
> The soft-dirty test will initate an ioctl with the PAGEMAP_SCAN flag with
> an invalid address for the page_region. This is done intentionally to
> have the ioctl return with an expected EFAULT and with the correct
> categories returned.
> 
> However, on architectures with separate user address space, such as s390 or
> those without an MMU, the call to __access_ok (used to validate the
> variables provided with the ioctl) will always return true and we will not
> fail as expected.
> 
>         if (IS_ENABLED(CONFIG_ALTERNATE_USER_ADDRESS_SPACE) ||
>             !IS_ENABLED(CONFIG_MMU))
>                 return true;
> 
> Let's simplify the check for PAGEMAP_SCAN and provide a valid page_region
> address so that we get a non-errno return if it is supported.

AI review asked some questions about v1:
	https://sashiko.dev/#/patchset/20260320184010.759461-2-audra%40redhat.com

These might have been addressed in this version but without a
versioning tag and without a what-i-changed description I find it
hard(er) to tell.

