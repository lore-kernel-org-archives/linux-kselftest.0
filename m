Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CC53F209F43;
	Wed, 23 Sep 2026 01:04:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790125500; cv=none; b=sMgcVOkqmoIFYwDxNSEGJzJvZML2QYobGWrcTtgvkwIVs7YeXlAe0mDtTUhPf3MKj6YsQC5gx6FB6RZ91Mx98R4DwbqFY71vrcS9k4CTxs7Ovx4t7qMNfZmwOE+dJmTwWoH9rrNsji4XZuteYCUSK5IFSwlw/x3uMrQyr24mH6I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790125500; c=relaxed/simple;
	bh=LSxQt1VCMvQYGnS/PMJk1QHjxG3P4Kj2feQHSBy59vE=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=IZxpdWhwsvyc7ZjTEYr0dYeFhCClfH2vyA9DF8d1W52qXtF2qr0wFJGWNZe4NaqRL25dc/kGQ+87DuPrASbjyjAsSRuq/ptN0RdDoGtonXfx6FfSkZiQPUNn/OvYswk0a4x2HQTbd/sZagIT4JINoMMLzV79BTva/FzBo7MzmmI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=USZq1PPE; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="USZq1PPE"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 033811F000FF;
	Wed, 23 Sep 2026 01:04:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1790125499;
	bh=yJteRY6CIjXsF77QUOe0dzDSCBzkt6Sc7rtiIrt6ivM=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References;
	b=USZq1PPEYBgNSV6Ry3CmBcb+FGNOnYxJI3H8u8l3jbuOMsh+K4SCarnavMpIzy2yj
	 YLBzkhjHJNRZoDbrPq6bosDVuwjr3odeEaY1mDPJFUrs1jZiQR50LY1Mv0aY6Y1vvR
	 M/RsNCECUlYK/sJdNuewPriMqNGpJ6pg0ewRbPBqj/FMrFhdL9N03fj/H1lU+kJzpl
	 c/zwDczNOZt4yc18Fj5lQNj/GZmJXvhHcM7I72A7RE4t3eXMDoUfQKm3n2vkpJHEKn
	 vlpUZqPeXFAEVA0KESV3d+NOpjwcKClLVSrPajrr1DkjL2SkWz3Ff0e1bc4K2aCQlt
	 G3USwK3hae5aQ==
Date: Tue, 22 Sep 2026 18:04:58 -0700
From: Jakub Kicinski <kuba@kernel.org>
To: "Hemendra M. Naik" <hemendranaik@gmail.com>
Cc: davem@davemloft.net, edumazet@google.com, horms@kernel.org,
 jhs@mojatatu.com, jiri@resnulli.us, linux-kernel@vger.kernel.org,
 linux-kselftest@vger.kernel.org, netdev@vger.kernel.org, pabeni@redhat.com,
 shuah@kernel.org, tahiliani@nitk.edu.in, vishy0777@gmail.com
Subject: Re: [PATCH net-next v6 0/3] net/sched: sch_fq_pie: add per-flow
 class statistics
Message-ID: <20260922180458.5c54ebb8@kernel.org>
In-Reply-To: <20260919062613.42379-1-hemendranaik@gmail.com>
References: <20260918155906.13d01c2a@kernel.org>
	<20260919062613.42379-1-hemendranaik@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit

On Sat, 19 Sep 2026 11:56:13 +0530 Hemendra M. Naik wrote:
> - https://github.com/H-N41K/iproute2-next/tree/fq_pie_class_stats/

Thanks, please vendor in the headers on this branch so we can add 
it in the CI and it will just build as is. LMK when ready.
