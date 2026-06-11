Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6A8E42DCBFA;
	Thu, 11 Jun 2026 08:56:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781168183; cv=none; b=Z41zQGCpnHs3b19MWKSjWCuqoFaqmU0ZsFkXSokbnrevEFaCDiCRv2SilmrCMrRDz1ftTyB+eHpjHgU8DvwdFyKKqz2uGqwoVDQgIRuFWDsUi3Y9ToidW9yH6JBcLsn87LEzZRFdHO+dDAfdQ/2I+gTlNlVPxABouauZPncn5iA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781168183; c=relaxed/simple;
	bh=XLO5vH2rvkdhZrZigt0m2grWsVfoOkmf82Py0R1rxq0=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:Message-ID:
	 MIME-Version:Content-Type; b=a5vWu6CgPdjPwicwiZi1uloQauhT1LAIpI7cYnaia9HrOJuGmPBLLQdwbX4m5vcAO7HriGOiQwj6+wU1WUEIuBuW7WgIi/bMXbLWcPleo3VNY1C1MJdKRtXe1kyBSJZ7XViqQBwTYNiTECqtc39dlC1NwNvpOk1Sa997GGnmzH4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=aFkrwk5D; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="aFkrwk5D"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5123F1F00893;
	Thu, 11 Jun 2026 08:56:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1781168182;
	bh=vCAft+wNFzTJkXX3u25v7t+QrQgbH+kLVe959bS8e0s=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date;
	b=aFkrwk5DY58I4i5IyiCBJKN3sva/en/gLvF99Uz0yEr6tURRmA57nCQ2/MYlPvx3a
	 FqnsbdbBc18Zh4JbRMVR6sbnngV5LiZkpCVGReUG0IzT4Lt4QzKoF6iZZfbirEHn+7
	 xe2tgspPtViSX0rYYFDx6T603gfqKr9hFxe9nyNDmNdS32lc97NRacQlAhsONevo5O
	 +PkrIJ4rcAtgV9Smtqnvxch3QyMlCdWO2aJNOC0KY9ZCi1xtJ4z/pelEZrA59QxFuS
	 JOGAxfuuqt93NASp1da5x2kj2gdMyDxGei7sbfRlAbZ0t+80BvQX9Fvan0qEYvzRa2
	 YoRcktZc+pRvw==
From: Pratyush Yadav <pratyush@kernel.org>
To: Vipin Sharma <vipinsh@google.com>
Cc: pasha.tatashin@soleen.com,  rppt@kernel.org,  pratyush@kernel.org,
  tarunsahu@google.com,  skhawaja@google.com,  shuah@kernel.org,
  dmatlack@google.com,  linux-kernel@vger.kernel.org,
  kexec@lists.infradead.org,  linux-kselftest@vger.kernel.org
Subject: Re: [PATCH v2 2/2] selftests/liveupdate: Add helpers to
 preserve/retrieve FDs
In-Reply-To: <20260610230909.876546-3-vipinsh@google.com> (Vipin Sharma's
	message of "Wed, 10 Jun 2026 16:09:08 -0700")
References: <20260610230909.876546-1-vipinsh@google.com>
	<20260610230909.876546-3-vipinsh@google.com>
Date: Thu, 11 Jun 2026 10:56:18 +0200
Message-ID: <2vxz4ij9sbf1.fsf@kernel.org>
User-Agent: Gnus/5.13 (Gnus v5.13)
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain

On Wed, Jun 10 2026, Vipin Sharma wrote:

> Add helper functions to preserve and retrieve file descriptors from an
> LUO session. This allows library users to work with FD preservation.
>
> Now that there are helpers, use them instead of direct ioctl calls
> in liveupdate.c
>
> No functional change intended.
>
> Co-developed-by: David Matlack <dmatlack@google.com>
> Signed-off-by: David Matlack <dmatlack@google.com>
> Signed-off-by: Vipin Sharma <vipinsh@google.com>

Reviewed-by: Pratyush Yadav (Google) <pratyush@kernel.org>

[...]

-- 
Regards,
Pratyush Yadav
