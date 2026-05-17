Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D8E4F3BFE44;
	Sun, 17 May 2026 18:55:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779044140; cv=none; b=NpTKFmvx1+eSuTaEGVzzII8nTyNUM7p0WhaeJzaCf+Z/ZSNSit89JKsycp/wF2iTQ33W9/1+0qhvbdYT7oa9pRuyRRhH5fTHQnV/QxlBWVaAlLp9I4Ry+Du+ArdTgjM+Rhcj3ZF9secIhdouDEuzcNXN5Th5l4je16qgZg8Tza8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779044140; c=relaxed/simple;
	bh=G6OIO9cPM8SjJ4bxslpzxm5oo/ItIFewnJHdpEEGRZw=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=GLlu4tlhirb6xaJmV07+SYO2d1Vl1NceRVsrGjd0NfQduZbXnyI9ZD0JDSql7+eHq7DaBsCe2NtzEbr0kJmbFU7KttUGlikTtnjbntHci7ClpjYdcA9iFH5jaF3hoLb6ce3DQpivnVIpiHXhwJBKU2vRv3qt7c7dhw24o21Nqo0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=TCNPpBuy; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="TCNPpBuy"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 777E3C2BCB0;
	Sun, 17 May 2026 18:55:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1779044140;
	bh=G6OIO9cPM8SjJ4bxslpzxm5oo/ItIFewnJHdpEEGRZw=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=TCNPpBuyYQXOa6M2oIyvIG/U+QiLuHhiAH7Y6ptzL/2QwJwzsRPCQlZVsKBKx85BY
	 K6ZVy8TsCZJQIjF6YNrIA1gQ+kXwiJF6RHVUac5M/8qFfXg3orMXo301RmzyX2aUTb
	 fKT5/XDX7ElN6QQ3bSjJ3q1U+WEDcHdHwaYZkHCYNqrz2n6KuT90to42M5R62rBzIb
	 CaN0gOLPVzFf7uulvnbyLZ8pYVTjVL2M5ov9UJn8F91uyMbnImaS9e+KNFAMcC28v/
	 CHlROTRXBfGsGCnRDy4xDr1ZJgw5xItx5lz1TPoi/ttMJhOXlUKSMn7AxhayIJtuvM
	 t9MfSJfnhWsLw==
Date: Sun, 17 May 2026 21:55:32 +0300
From: Mike Rapoport <rppt@kernel.org>
To: Sarthak Sharma <sarthak.sharma@arm.com>
Cc: Andrew Morton <akpm@linux-foundation.org>,
	David Hildenbrand <david@kernel.org>,
	Lorenzo Stoakes <ljs@kernel.org>,
	"Liam R . Howlett" <Liam.Howlett@oracle.com>,
	Vlastimil Babka <vbabka@kernel.org>,
	Suren Baghdasaryan <surenb@google.com>,
	Michal Hocko <mhocko@suse.com>, Shuah Khan <shuah@kernel.org>,
	linux-mm@kvack.org, linux-kselftest@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] selftests/mm: add pkey_sighandler_tests to .gitignore
Message-ID: <agoPJHwC_3PnH1BQ@kernel.org>
References: <20260515125949.315964-1-sarthak.sharma@arm.com>
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260515125949.315964-1-sarthak.sharma@arm.com>

Hi Sarthak,

On Fri, May 15, 2026 at 06:29:49PM +0530, Sarthak Sharma wrote:
> .gitignore currently does not include the binary
> pkey_sighandler_tests. Add it to .gitignore.
> 
> Signed-off-by: Sarthak Sharma <sarthak.sharma@arm.com>
> ---
>  tools/testing/selftests/mm/.gitignore | 1 +
>  1 file changed, 1 insertion(+)
> 
> diff --git a/tools/testing/selftests/mm/.gitignore b/tools/testing/selftests/mm/.gitignore
> index b0c30c5ee9e3..1b1d9ed87039 100644
> --- a/tools/testing/selftests/mm/.gitignore
> +++ b/tools/testing/selftests/mm/.gitignore
> @@ -62,3 +62,4 @@ merge
>  prctl_thp_disable
>  rmap
>  folio_split_race_test
> +pkey_sighandler_tests

There are patches that switch .gitignore to a pattern-matching approach:

https://lore.kernel.org/all/20260511173411.267628-1-pratmal@google.com/

With those there'd be no need to list every executable in .gitignore
explicitly.

> -- 
> 2.39.5
> 

-- 
Sincerely yours,
Mike.
