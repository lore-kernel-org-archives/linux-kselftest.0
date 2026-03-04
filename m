Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8EB9E3368A4;
	Wed,  4 Mar 2026 02:17:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772590623; cv=none; b=cpiSXHsdOgJmgn5Aa7rbStHdR0XPR7YUm/cb4bMydfiu6F1akqb1cqN7HtLvh6oIdeEO4Xa6JO86H5pdhU2MFWN2HVyGFW3d9TQOkWt6a+Fd1+aBZRLqdogMNffnGfuYC3PIOdh4+qNhLrmdEBsnInmx5XBCuUDn9PMmpLUunrE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772590623; c=relaxed/simple;
	bh=t2bZFUYHm1W9xUuUZukYndUcowPUzNc605Rlr2AcCJQ=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=PujUQ6GSMbHTt4owXVexUkMrln34zt0sJ86NDdy6rPeCcck/Qd0sUafAsiJWfanA/aDcKK9teftg5wy2Ik+95ONd/I4LOHDaKrj570vnMidhBd8imgyuGvKPluoY+qL7NzBnewi7czOMTV4Rct3cTy3Ms96kLfxAGwop1ldf9T4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=ThPVbcQu; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="ThPVbcQu"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B32C4C116C6;
	Wed,  4 Mar 2026 02:17:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1772590623;
	bh=t2bZFUYHm1W9xUuUZukYndUcowPUzNc605Rlr2AcCJQ=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
	b=ThPVbcQuv5BwK48/TIlJVKmGDYHLhZTWyAPG4HE1VshgkdT1ybXmZVE7Uv6x0Ct3Z
	 F6Kt0LFbkaxjkrMj5CZBTUTnx90KroMfEE7+nfBLX5TqIpFIK3Yvi+ldoXSL4+QpGk
	 XS50DqT/W2x0LarIQL4ud8QmqEvsVP4F5urP1WQOlWt80uBkKs/pdWjWJyO1FjVzWE
	 A4UJrZDa7gTdVIMR9LPVCCKhgu39mQTyW+ZErQk2vFEsA21Qrov29L3bl7kPkfPXHl
	 EdvXpZqNnFGyvC0WJ8/O1HSD4ytzhExLjpyLDQKmpP0lgRI7E5uEsEBFO5fET0KoqQ
	 35YVfA/CppjYA==
Date: Tue, 3 Mar 2026 18:17:00 -0800
From: Jakub Kicinski <kuba@kernel.org>
To: mr.navi8680@gmail.com
Cc: netdev@vger.kernel.org, linux-kselftest@vger.kernel.org,
 jhs@mojatatu.com, jiri@resnulli.us, shuah@kernel.org,
 linux-kernel@vger.kernel.org
Subject: Re: [PATCH] selftests: tc-testing: fix list_categories() crash on
 list type
Message-ID: <20260303181700.25878b2a@kernel.org>
In-Reply-To: <20260228074735.10438-1-mr.navi8680@gmail.com>
References: <20260228074735.10438-1-mr.navi8680@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit

On Sat, 28 Feb 2026 13:17:35 +0530 mr.navi8680@gmail.com wrote:
> list_categories() builds a set directly from the 'category'
> field of each test case. Since 'category' is a list,
> set(map(...)) attempts to insert lists into a set, which
> raises:
> 
>   TypeError: unhashable type: 'list'
> 
> Flatten category lists and collect unique category names
> using set.update() instead.

How did you find this issue?

I can't figure out what's calling this function in the first place.
-- 
pw-bot: cr
