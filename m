Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2286A285CA4;
	Wed, 18 Mar 2026 07:38:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773819499; cv=none; b=F4MdNm11z1D/Lu4Jq3rlP7Q/KECufyBWmUGnCsxFsp7QW3MaueQkDXRHf5LQzPynq2/toED/bAVUGdM4aFAi6fCqUlbTv4AaFbYu/XrT5OC62k0aw8IwnNSQx+OHC9IKLnDjB/1tR399gKWiOCF9IMoO44i+QCT5PCh9Br1Vang=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773819499; c=relaxed/simple;
	bh=lAavQhWxUHh6y2yrdQoAQfAj8drjCm9e/GYE2XSeyn4=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=M+cgo7Z/CMmZt4hJeE/f/0a9KFpkdZqt6imXIqttcIt72SLQcVBdwpF0RaA3R63eQ39AgA5s/cpTwu+hiKlu9MrREMQ1/ZLixuDfzrjsXo5sLXbwikW4nyf/qv7OWZBcvWslXBJe/sQmRwZAfEk+wBkRciWsb/KOTCoyP1OO3M0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=V2Ntsu55; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="V2Ntsu55"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id DB500C19421;
	Wed, 18 Mar 2026 07:38:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1773819498;
	bh=lAavQhWxUHh6y2yrdQoAQfAj8drjCm9e/GYE2XSeyn4=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=V2Ntsu558QoaAICbByIqy4hCtufSKkWV6RFmG1v8kx6g0jX9Hz/4QP0+X6T9AzipU
	 CKDO3AVN33S9phh8FfX/0ip8Xud2JKQ5ExMRmOoISNcBXJwvji+L+gQLKAPiEXGJ4V
	 4tnEBnp5UrfwDTfM2qrAv4PN7paoxM2XD4WlBSYM6Ouifp7bLgpY6TJ2/PvujZXAR1
	 ewvYRtBHPkDz/KJ7MaMu7vI1Z2uLpAqJcfCZec1jog/ndCZSvAvfxjHHjm0NdG8jbo
	 MgumssLY4K/0BfZGf1IA8juJI8omzcWinfh3l23GPlbPOSU82T5BYW4Y7YnTMOM4vo
	 Jv8TnATToccdA==
Date: Wed, 18 Mar 2026 09:38:13 +0200
From: Mike Rapoport <rppt@kernel.org>
To: Pratyush Yadav <pratyush@kernel.org>
Cc: Pasha Tatashin <pasha.tatashin@soleen.com>,
	Shuah Khan <shuah@kernel.org>,
	Andrew Morton <akpm@linux-foundation.org>,
	linux-kernel@vger.kernel.org, linux-kselftest@vger.kernel.org,
	linux-mm@kvack.org
Subject: Re: [PATCH 5/6] selftests/liveupdate: add test for operations on a
 preserved memfd
Message-ID: <abpWZZWaxUVg1HYd@kernel.org>
References: <20260309115441.266805-1-pratyush@kernel.org>
 <20260309115441.266805-6-pratyush@kernel.org>
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260309115441.266805-6-pratyush@kernel.org>

On Mon, Mar 09, 2026 at 11:54:38AM +0000, Pratyush Yadav wrote:
> From: "Pratyush Yadav (Google)" <pratyush@kernel.org>
> 
> Once a memfd is preserved, certain operations are not allowed to
> succeed since they might make the state of the memfd inconsistent with
> the serialized state. Among these operations are truncating or growing
> the memfd. Writes and reads to already existing memfd should succeed.
> 
> Add a test that makes sure a preserved memfd does not allow growing or
> shrinking, but does allow reads and writes to existing memory to go
> thorough.
> 
> Signed-off-by: Pratyush Yadav <ptyadav@amazon.de>
> Signed-off-by: Pratyush Yadav (Google) <pratyush@kernel.org>

Reviewed-by: Mike Rapoport (Microsoft) <rppt@kernel.org>

-- 
Sincerely yours,
Mike.
