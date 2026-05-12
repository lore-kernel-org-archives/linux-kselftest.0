Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 391E33A05FC;
	Tue, 12 May 2026 13:59:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778594394; cv=none; b=IeYCh1cush4Yx9HK/haunDtxD4lehepKkGXGghcrEcy1ufU3QCTjy20yUFg/GoqE6y4cqa3NbACLgg2REpcIP7nGxBdyo3uNfF5jNWlnIdBjVnroLJzukYrT7LyOCdDrMIq0ZFTGkX2c0Vd0KNffAHdigEuCEIC2H+Jgr6k5ZcM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778594394; c=relaxed/simple;
	bh=Jvc6GOYinJ6BRNhNH7dRq2Uwx7+Ab05BLqjYU9Eq4Mo=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Gn+hCS4ZSZuzQf3OoAwYq/ArbP2m0daHbK860de+kS3tGd6DTIuRTLRlvgF//cTQNLBsDd3+ndpYztQFJpEJvQhLQcR6YNi6hsdHy52xJiD78Y/c6sKqFe1lukO+erU7OEZIE/Y+615m6gSwr53w96DaIPp6VkgGcAdkAd/cwx4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=jm06ZhB+; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="jm06ZhB+"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id EBF96C2BCF5;
	Tue, 12 May 2026 13:59:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1778594393;
	bh=Jvc6GOYinJ6BRNhNH7dRq2Uwx7+Ab05BLqjYU9Eq4Mo=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=jm06ZhB+kVXPOpssK05SbhVCcr/bHIQasVtzKXdp4tJmVXJFgluXT3k0rQPKeu0lK
	 V6LnW74Mb0hVE1hw59XXNTw9F8Ki3JKhmT5jKsLcEh5cMhLsKuOVcS3/auEjTbbtNC
	 iEoWLvGZ5mo9Vfst3394Crz/rC/nTGS82QnQq7xKb8v2Q8sOg6CVIyVLgsYEWDiMi2
	 tFsyWbgfuoLvYyicnCpoRHD/67AMj3BvBwGQj08j/cNQ25rPrKggvAp4vKsgIy8MKV
	 abLqxEq9kFT9KplEXsIpLILm2BVJIADNk1v1zk2NP/suW9hBTU3D379wIs0kHjhaNR
	 Yi5pQt9jN38Kg==
Date: Tue, 12 May 2026 14:59:49 +0100
From: Lorenzo Stoakes <ljs@kernel.org>
To: Fujunjie <fujunjie1@qq.com>
Cc: Jann Horn <jannh@google.com>, 
	Andrew Morton <akpm@linux-foundation.org>, "Liam R. Howlett" <Liam.Howlett@oracle.com>, 
	Vlastimil Babka <vbabka@kernel.org>, Shuah Khan <shuah@kernel.org>, linux-mm@kvack.org, 
	linux-kernel@vger.kernel.org, linux-kselftest@vger.kernel.org
Subject: Re: [PATCH] mm/mremap: unmap full fixed target for multi-VMA moves
Message-ID: <agMyDHx5MxR0igFY@lucifer>
References: <tencent_863C8A01F3C81EBA238F375B16065CBACF08@qq.com>
 <agHmO4i4YUhs3cSG@lucifer>
 <CAG48ez1sLtSKVQLHbLO5usBgMgjyOGhbX29pKEfku4Ht05HffA@mail.gmail.com>
 <agH1ZSdX_7QF8P_I@lucifer>
 <CAG48ez17evhhcoDKF6AoPqzYZwGuFCkVAsc-0bBzevf0LHYNxA@mail.gmail.com>
 <agH7ONBSX7XLzS6q@lucifer>
 <CAG48ez0y3N9uEOzvr4N85Js4XN1fh4JiUFjW=PQB2UZ_5t1R4A@mail.gmail.com>
 <agICeiIEshWf-1xa@lucifer>
 <tencent_B49EC91555E7B93CE646566E0A2DBEB9BE09@qq.com>
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <tencent_B49EC91555E7B93CE646566E0A2DBEB9BE09@qq.com>

On Tue, May 12, 2026 at 03:24:24PM +0800, Fujunjie wrote:
>
>
> On 5/12/2026 12:30 AM, Lorenzo Stoakes wrote:
> > Yeah let's go with that then I think :)
>
>
> Thanks Lorenzo and Jann.
>
> I agree that the patch as posted goes in the wrong direction by treating
> source gaps as ranges that should be propagated to the destination.  Please
> drop this patch.
>
> If disallowing source gaps in this multi-VMA move path still sounds right,
> I can look into a v2/new patch that rejects sparse source ranges up front
> instead.

Sorry I really want to think about this a little more + make sure the
semantics are sane, so I'd rather take a look at this myself.

I do really hate to take something away from newer contributors but in this
case things are quite fiddly so I want to make sure everything's correct :)

>
> Thanks,
> fujunjie
>

Thanks, Lorenzo
