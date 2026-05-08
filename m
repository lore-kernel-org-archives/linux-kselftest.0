Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3F41820E702;
	Fri,  8 May 2026 20:56:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778273791; cv=none; b=qJFXQH1X7NP23mD+ZfACzGHAknelROoBl11aOdyMvVsf3p+CwQ0hCdfKvF3kRwawgmuFWhM6Uiov1wbi4IjEdlv/j8sxX42euHPEtQ5X/c3bh8qh9mTf0VnUIqE0vE2mwjIc0WF9kZODsVtrOMHUViaVw9jRWKTMtpzecf0KMIs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778273791; c=relaxed/simple;
	bh=vqgkcRc8U7alNwsPEB7lDsO1XMutpjl4DV7jmdHc4Uo=;
	h=Date:From:To:Cc:Subject:Message-Id:In-Reply-To:References:
	 Mime-Version:Content-Type; b=Q3EWm959rRNRaXkeTM0L65+wHzco+ZtlfEq5ns4nDlhQ3nX2PV7H+1rAVkqhEGELNJG8ndbkNJRecaaCyYxA1DZU9TZ5D010nfBcIesqP49q63UETnLbBtsbVDG5TbGJhLsc89cx+5gS7OlZaVr3TelHHmPalBi31GF87blcWBE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (1024-bit key) header.d=linux-foundation.org header.i=@linux-foundation.org header.b=cgwFrTjf; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux-foundation.org header.i=@linux-foundation.org header.b="cgwFrTjf"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 96C6CC2BCB4;
	Fri,  8 May 2026 20:56:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linux-foundation.org;
	s=korg; t=1778273790;
	bh=vqgkcRc8U7alNwsPEB7lDsO1XMutpjl4DV7jmdHc4Uo=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
	b=cgwFrTjfioL2PMSGvMZIGt9yJlQSzwoLTBOk+Od5Vln72dUiTeHE+ZkP8of5dAqRk
	 JX4CQDjntIMq4S5DyaP3pAO68UmCsRThOCR4t8L6smbLopCTOnWnxiU4hDuhMHQXyj
	 3CH0Mt1VuErJ3bCYd74w9JJTvfuYCaM1vXro7k9o=
Date: Fri, 8 May 2026 13:56:30 -0700
From: Andrew Morton <akpm@linux-foundation.org>
To: Sasha Levin <sashal@kernel.org>
Cc: corbet@lwn.net, skhan@linuxfoundation.org, linux-doc@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-kselftest@vger.kernel.org,
 gregkh@linuxfoundation.org
Subject: Re: [PATCH] killswitch: add per-function short-circuit mitigation
 primitive
Message-Id: <20260508135630.a380e3c187b59e4c04e6f358@linux-foundation.org>
In-Reply-To: <20260507070547.2268452-1-sashal@kernel.org>
References: <20260507070547.2268452-1-sashal@kernel.org>
X-Mailer: Sylpheed 3.8.0beta1 (GTK+ 2.24.33; x86_64-pc-linux-gnu)
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit

On Thu,  7 May 2026 03:05:45 -0400 Sasha Levin <sashal@kernel.org> wrote:

> When a (security) issue goes public, fleets stay exposed until a patched kernel
> is built, distributed, and rebooted into.
> 
> For many such issues the simplest mitigation is to stop calling the buggy
> function. Killswitch provides that. An admin writes:
> 
>     echo "engage af_alg_sendmsg -1" \
>         > /sys/kernel/security/killswitch/control

It certainly sounds useful, but what would I know.  How do we hunt down
suitable operations people (aka "target audience") to find out how
useful this is to them?

Also,

> 19 files changed, 1451 insertions(+), 1 deletion(-)

wowzers.  I'm looking at samples/livepatch/livepatch-sample.c wondering
"why"?

