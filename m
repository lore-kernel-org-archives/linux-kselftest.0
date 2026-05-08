Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E94A81E5714;
	Fri,  8 May 2026 21:47:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778276827; cv=none; b=rhiI/fFvHpaswfaZUNa2jAUFEWJaP2nBCbq9nla5fDzM9zvADaZrn5vhuYwz+jlBa3QT2N+Ui7l1WqQHQx3JjLNKjBV7EB9pUDVGena0R6N3oe3KUN/Yi4h+N6ObHvHDMONoTobjoRBIssMs+c4rD2hU8mX4dYLy2MWCkTNhut0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778276827; c=relaxed/simple;
	bh=fEmMe0Q34kTPBHLIu208stdayo1a6GHo8vxlUsm5ceE=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=H6nQ6tChoKulXnStatQqUZZIRJjWADJCYMNdAmSLfQPV4rc1I99Fhe3XfBHja1RuzUM9A4S8IOnh3tfYPJzNgkQOyfx9ap5Ia7sgZgKjyssejRgkxARH2MZFvNQpTe369cpkpezzdl/TKQ8Aq64esXxtq7N9lt2B8YJoGeu7F6w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=bl1A/JRu; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="bl1A/JRu"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 658AFC2BCB0;
	Fri,  8 May 2026 21:47:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1778276826;
	bh=fEmMe0Q34kTPBHLIu208stdayo1a6GHo8vxlUsm5ceE=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=bl1A/JRuWLW/BQzfUkRIqZrKatEjwAQxtY627K2zimBOY0j8Xw81vH/o5uhdvOdsb
	 NqG/jJq+Y/MGBeAsF3sCf3hvAvFnKInsQa3s2CXVmIZVlP+X6qW7eQhfiS2q3XrEeu
	 NEqMsLj2j1Kouztefxl0VzT3ojDocvCeYu1qaFifVW6hjBxLdvu7zrELyuz9UGMGUp
	 E8x/IY8Y5ohwOQSMiBXCAsRrD/2Cy90iv3FgcXL5uuixgJkXfqaVbSXP4e1E4obsRi
	 02Qxms5rOqjzvhFHHzB5JzcLL92Twhh8UipGavwbBTCtEJ9ElPfjNsZE3jl+aWQLnr
	 n6abbKcW/j2cw==
Date: Fri, 8 May 2026 17:47:04 -0400
From: Sasha Levin <sashal@kernel.org>
To: Andrew Morton <akpm@linux-foundation.org>
Cc: corbet@lwn.net, skhan@linuxfoundation.org, linux-doc@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-kselftest@vger.kernel.org,
	gregkh@linuxfoundation.org
Subject: Re: [PATCH] killswitch: add per-function short-circuit mitigation
 primitive
Message-ID: <af5Z2IvtS5pVorSl@laps>
References: <20260507070547.2268452-1-sashal@kernel.org>
 <20260508135630.a380e3c187b59e4c04e6f358@linux-foundation.org>
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii; format=flowed
Content-Disposition: inline
In-Reply-To: <20260508135630.a380e3c187b59e4c04e6f358@linux-foundation.org>

On Fri, May 08, 2026 at 01:56:30PM -0700, Andrew Morton wrote:
>On Thu,  7 May 2026 03:05:45 -0400 Sasha Levin <sashal@kernel.org> wrote:
>
>> When a (security) issue goes public, fleets stay exposed until a patched kernel
>> is built, distributed, and rebooted into.
>>
>> For many such issues the simplest mitigation is to stop calling the buggy
>> function. Killswitch provides that. An admin writes:
>>
>>     echo "engage af_alg_sendmsg -1" \
>>         > /sys/kernel/security/killswitch/control
>
>It certainly sounds useful, but what would I know.  How do we hunt down
>suitable operations people (aka "target audience") to find out how
>useful this is to them?

I'm not entierly sure here... If folks have suggestions on folks to loop in,
that'll be great!

>> 19 files changed, 1451 insertions(+), 1 deletion(-)
>
>wowzers.  I'm looking at samples/livepatch/livepatch-sample.c wondering
>"why"?

Yup, a bit chunky, but over half of it is documentation and testing, and the
actual functional code is largely the securityfs interface.

-- 
Thanks,
Sasha
