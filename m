Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 76EE23E1D05;
	Wed, 25 Mar 2026 15:33:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774452784; cv=none; b=hidaGgHW7hhpGqJO7b0S9s4a7xwXOpCiGOb5vS7gKFLlM5u5mICsG7as0XyHwiuWRCkLlCwgEs2vOhQGVtF8AKEx5a79qi/CoCtkBUqmOgoWJK5YPnD4RVhf8v4HiLqbsHwmmJ7HvCDTRRud/8KWUcaor5w5SOhDygf/v+KyAPA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774452784; c=relaxed/simple;
	bh=T7n3kYoF9cKOPNN6IPaYAgeLjjX+mkPzNg+Va4FI/6Q=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=dtRNn5h4HQXc+VEPH07FHL1xPt4AymnvF8zFJGZLyVz4T4lCtN042FtvSBUMhVOhBSu5m1liDvgwVwi8NSujDTLbV+88vNVu3PkmGgJ5RNw3b27TzwzJ6xrLOx/H3xWlBP8wVKYBSRrQRQRlYW3wxlykhfmgS/Y+5LV4KneywJA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=d5CsmeBf; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="d5CsmeBf"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 1B941C2BCB0;
	Wed, 25 Mar 2026 15:33:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1774452784;
	bh=T7n3kYoF9cKOPNN6IPaYAgeLjjX+mkPzNg+Va4FI/6Q=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=d5CsmeBf+fIrWJ2sb2LRnHbwvi5AE3FuqklJLJpfm8jFWPyiX1ZwG8kRlDk9jL20F
	 k5e0CFMD4Fcj7YcuNSrL45WsSVLYXRhq/AyhrDthEC53PcafET2bEKw4+2ypqaS4vf
	 Ah5G+/quEqcjIsKVrAzwgjktFES9elXMY+fB7RQkET6Rhwjrv5mDfrh4Jfp0fN6k29
	 viidAKX20j25BMKkk5YWzgSDJ+mdFV5so4mvS0DxA9kUJ4qYsgWoAic0o3Bk2dX07O
	 JmrRuGYTzxuvvXuVr0bWkPzt0NIlp7ZPyZ2MQwwfR0JinOfhlm8Vmp8bKS8+ClkplQ
	 n7Em841g9Ibpw==
Date: Wed, 25 Mar 2026 17:32:57 +0200
From: Mike Rapoport <rppt@kernel.org>
To: Pasha Tatashin <pasha.tatashin@soleen.com>
Cc: linux-kselftest@vger.kernel.org, shuah@kernel.org,
	akpm@linux-foundation.org, linux-mm@kvack.org,
	linux-kernel@vger.kernel.org, dmatlack@google.com,
	pratyush@kernel.org, skhawaja@google.com
Subject: Re: [PATCH v2 2/2] selftests: liveupdate: add test for double
 preservation
Message-ID: <acQAKTjkIjcsBpaf@kernel.org>
References: <20260323203145.148057-1-pasha.tatashin@soleen.com>
 <20260323203145.148057-3-pasha.tatashin@soleen.com>
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260323203145.148057-3-pasha.tatashin@soleen.com>

On Mon, Mar 23, 2026 at 08:31:45PM +0000, Pasha Tatashin wrote:
> Verify that a file can only be preserved once across all active
> sessions. Attempting to preserve it a second time, whether in the same
> or a different session, should fail with EBUSY.
> 
> Signed-off-by: Pasha Tatashin <pasha.tatashin@soleen.com>

Reviewed-by: Mike Rapoport (Microsoft) <rppt@kernel.org>

> ---
>  .../testing/selftests/liveupdate/liveupdate.c | 41 +++++++++++++++++++
>  1 file changed, 41 insertions(+)

-- 
Sincerely yours,
Mike.
