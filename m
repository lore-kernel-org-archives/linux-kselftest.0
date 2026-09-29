Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 47DD33CAA41;
	Tue, 29 Sep 2026 16:01:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790697698; cv=none; b=k+HgFKKqyFStvHxis23uhDkRCmNV/JWiwbbW4pgKLtTTnRK6iFsujuEWBicnJRhachDdoVHk1zmypqUXmIkCbNm6pdM9VRwOjKfcywWzbYyXHSoG3W38w2LV34NnkuKHT5w3y0ypMSJEnA7AiOvRWOn7OEB+QWJG5GXrKvVOw1o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790697698; c=relaxed/simple;
	bh=ooj5vDCj/9j1cOXLvEpUybIXmBjqfcRLm8MF0pLisQw=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=FEE0aepKtxq1WNTEXfcmzylRZlzcVK5qd62Y0Mhr8fWCdRUcALNrIm6YiF5LdUNC6p3+KkTcVcWPtzwLliwFRyA8wPrE4bPa5aIaWLWGgw1W2FRK/Aw7llAtE4Ks2dgZ2WVBZyhNv7DTpqdl1mHAYDtqDV4RmbfEcKzU9ExDikQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=QMV7Y8wm; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="QMV7Y8wm"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 1CC311F000FF;
	Tue, 29 Sep 2026 16:01:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1790697696;
	bh=ooj5vDCj/9j1cOXLvEpUybIXmBjqfcRLm8MF0pLisQw=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=QMV7Y8wmfmNMjcku6Oye42M0dSXEEggL7XKiPy024xhrGuWRbs3GKIi1GgeHBBE14
	 nxbSPHLg0AT4MVTh7v5j21EeAnrIIPpgEausZV81AisGFPwFIWs+H6kGJce+hRXxuX
	 F7pHNZMuC/c1elz5o2x9wkZeNv7CQjC5Q1baW8WZJrIbVAAuGYW8lrqiu8x6a4koaD
	 WG1nDpIpvkETM9UHZtLQlj2z7aouwVlMU7skDTTWtzHphJ4Lbaq3wSglfpXn8YxkRn
	 JxKE0wvyUCpFbdgphqxXU6o2tsH7mtBTRgP9YCpcn1wVWXspDDBfBBGoz2+51cuPDg
	 +JEbVWZSC4D3A==
Date: Tue, 29 Sep 2026 17:01:31 +0100
From: "Lorenzo Stoakes (ARM)" <ljs@kernel.org>
To: Mark Brown <broonie@kernel.org>
Cc: Catalin Marinas <catalin.marinas@arm.com>, 
	Will Deacon <will@kernel.org>, Shuah Khan <shuah@kernel.org>, Marc Zyngier <maz@kernel.org>, 
	Oliver Upton <oupton@kernel.org>, Fuad Tabba <fuad.tabba@linux.dev>, 
	Mark Rutland <mark.rutland@arm.com>, linux-kernel@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-kselftest@vger.kernel.org
Subject: Re: [PATCH 01/11] kselftest/arm64: Factor Linux syscalls out of
 asm-utils.S
Message-ID: <arvfukSGSxJ6Th7Z@gremlin>
References: <20260901-arm64-fp-stress-kvm-v1-0-31bce995b49b@kernel.org>
 <20260901-arm64-fp-stress-kvm-v1-1-31bce995b49b@kernel.org>
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260901-arm64-fp-stress-kvm-v1-1-31bce995b49b@kernel.org>

On Tue, Sep 01, 2026 at 06:06:41PM +0100, Mark Brown wrote:
> In preparation for building versions of the load programs for fp-stress
> that run as KVM guests move the functions that perform syscalls out of

Maybe worth saying that the not-linux bit is bare metal here?

> Signed-off-by: Mark Brown <broonie@kernel.org>

All seems reasonable, the move is clean and self-contained so:

Reviewed-by: Lorenzo Stoakes (ARM) <ljs@kernel.org>

--
Cheers, Lorenzo
