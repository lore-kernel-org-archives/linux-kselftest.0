Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 660C438C423;
	Mon,  4 May 2026 10:02:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777888943; cv=none; b=sJJ8fWjy0jn9mSPoPol1XiKXnzns9usNR15eO2ZPzheFUkBmVlqiiF7kiXXGNVkaQ3Jh7vBwzv2qy4jM/ZmZhKujSyZKdCr6TLm+AMM+o0iZrzSYazcY6MBct2UefQYBOEa2tYN3XwScB1oDmy/3bJ6xDjFMycya0WNo3Ebto3A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777888943; c=relaxed/simple;
	bh=THYvosUkdqfwgMoRB0QrlS3pb9ErZrxzd4Pl66atKwQ=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=AMAXP8CmVDsdir6ev+6O+pQ3YwOOJvYRCKA8/8zC0S6LPIlhsfS09xndwDyDp/VQaKat1woHMrw2n006sstB2GK+SG3wbKiy3HQnx2ze0OtW8psgKfSHzugxcGINvRrDRDwWHXm9ovSGYbV91urfcWKhP5kcL1kIEoLqnBZqhZo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=FkW9waxe; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="FkW9waxe"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 22609C2BCB8;
	Mon,  4 May 2026 10:02:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1777888943;
	bh=THYvosUkdqfwgMoRB0QrlS3pb9ErZrxzd4Pl66atKwQ=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=FkW9waxe2TcYXihGs9SsNNhKObqew6LP7I7GomrxaAMImW/m/7Erzpv5hzZI1Qzim
	 VOTMu5cuJAqouQrsnP5U/uqJU/ZPWZLU29kViZfDzw6EQrjZv1jKt7OtsUDtdo+T82
	 6dKtN67hB1H+KsPD7jIuQFZHReJ0hHeS9So+6ZK0+9PRQc0Yd/9Fo1lcCynM0CXYGS
	 WGjqMZUTBS298Bdy5/5g1AQSLSENq8CyDFx63wnghFAGopqEifCwu54+JQPmRIn1Y9
	 4ayFokDlENVKkBXNgSFjbr7ebXnvmlT+3z7kQoop5OuP5fxCIkj4npIG3LRkqPDcmG
	 1+ShqJ+HE9K3g==
Date: Mon, 4 May 2026 12:02:16 +0200
From: Mike Rapoport <rppt@kernel.org>
To: Vineet Agarwal <agarwal.vineet2006@gmail.com>
Cc: shuah@kernel.org, akpm@linux-foundation.org,
	linux-kselftest@vger.kernel.org, linux-mm@kvack.org,
	linux-kernel@vger.kernel.org, david@kernel.org, ljs@kernel.org,
	Liam.Howlett@oracle.com, vbabka@kernel.org, surenb@google.com,
	mhocko@suse.com
Subject: Re: [PATCH v4] selftests/mm: ksm-functional-tests: fix partial write
 handling
Message-ID: <afhuqM3CUcCAdEXr@kernel.org>
References: <20260504081638.683223-1-agarwal.vineet2006@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260504081638.683223-1-agarwal.vineet2006@gmail.com>

On Mon, May 04, 2026 at 01:43:13PM +0530, Vineet Agarwal wrote:
> Update write() checks to properly detect and handle partial writes.
> 
> Previously, the write() calls used <= 0 to detect failure. This
> condition is never true for partial writes (ret > 0 but ret < len),
> so partial writes were silently treated as success.
> 
> Fix this by verifying that write() returns the full expected length
> and treating any mismatch as failure.
> 
> Signed-off-by: Vineet Agarwal <agarwal.vineet2006@gmail.com>

Acked-by: Mike Rapoport (Microsoft) <rppt@kernel.org>

> 
> Changes in v4:
> - Simplify write() checks as suggested by Mike Rapoport
> - Remove temporary variables and use direct comparisons
> - Use a single len variable
> ---
>  .../selftests/mm/ksm_functional_tests.c       | 19 +++++++++++--------
>  1 file changed, 11 insertions(+), 8 deletions(-)

-- 
Sincerely yours,
Mike.
