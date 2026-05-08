Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E89E73382DA;
	Fri,  8 May 2026 13:44:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778247877; cv=none; b=oVD9xTLtNRt1BIruLoG4g7gro92YY65JF+XZyqIvcUudopgftO7tQXheGTR9QE7azrTIynzAms7JjgLnREc+3nQYN5pDdPQEBjFm0G37qIDERuv1RbgyJLCQqFhDA3UTTwH9QNYweCTK8VvB4YQCt+ew1c0iCMTELVy+GDVTtYw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778247877; c=relaxed/simple;
	bh=fBCKnbhZJd3Qy81N8GyGFtkeKSrBQWNwLKfuipn9Wog=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=U+vtV4a2ae4T3dSn2Omu4U1JL6reoQ+nEBgf6849cZCRm8Hk2p/RmKc78DPo86zEWrQjSgUJrOC7AYz0cGzv6gLoEf7YONodUCWe6krg/Snv7RFyPA6CLCLUVoiQDeGaNR6vkO/OECX0If8ClTz6308ippH2+13FgD04KwLq5jc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=WsZbcVWI; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="WsZbcVWI"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A0D31C2BCB0;
	Fri,  8 May 2026 13:44:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1778247876;
	bh=fBCKnbhZJd3Qy81N8GyGFtkeKSrBQWNwLKfuipn9Wog=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=WsZbcVWIW9LZErf4j+vVx6/ehJAQ13cisxcAp3iEZlOYXV06R8bgxz3ZymTn5OSP2
	 lmJFOL/zFpW7x5GYTCHVlfJzH8bAZiFTJ2KYiuQreqiOsVJyk+H2M0ET6B+IsFXkzG
	 JZKfD5OqHO+PNnZKrqU92ckcQwU9lvV6KrliI4gqFvefqx4FN6Aot4UxxcoXhHsiJe
	 f2Jfzuhwu/S8oHI85H6hCOJr4TB8KPPFRb/mgPsJ7t/Xb9k7qb87hUwiPdoyZbbiT7
	 65L3Dpv2qCDlB0QVT98KqPdUf7PPhh/k5N/jfeLmtMmaBXKHsSdLTKpMn1Cer/ei4r
	 k+ywfQuSntJVw==
Date: Fri, 8 May 2026 09:44:35 -0400
From: Sasha Levin <sashal@kernel.org>
To: Jonathan Corbet <corbet@lwn.net>
Cc: akpm@linux-foundation.org, skhan@linuxfoundation.org,
	linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-kselftest@vger.kernel.org, gregkh@linuxfoundation.org
Subject: Re: [PATCH] killswitch: add per-function short-circuit mitigation
 primitive
Message-ID: <af3owxs1qOsSp1WN@laps>
References: <20260507070547.2268452-1-sashal@kernel.org>
 <87v7cz8cus.fsf@trenco.lwn.net>
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii; format=flowed
Content-Disposition: inline
In-Reply-To: <87v7cz8cus.fsf@trenco.lwn.net>

On Thu, May 07, 2026 at 09:21:15AM -0600, Jonathan Corbet wrote:
>Sasha Levin <sashal@kernel.org> writes:
>
>> When a (security) issue goes public, fleets stay exposed until a patched kernel
>> is built, distributed, and rebooted into.
>>
>> For many such issues the simplest mitigation is to stop calling the buggy
>> function. Killswitch provides that. An admin writes:
>>
>>     echo "engage af_alg_sendmsg -1" \
>>         > /sys/kernel/security/killswitch/control
>>
>> After this, af_alg_sendmsg() returns -EPERM on every call without
>> running its body. The mitigation takes effect immediately, and is dropped on
>> the next reboot.
>
>A quick look suggests that you're not checking lockdown status.  I don't
>doubt for a second that this thing could be used to bypass lockdown - by
>shorting out security_locked_down() if nothing else.  I'm guessing that
>might not prove entirely popular.

Hmm... Good point. I'll respin a v2 adressing this and Greg's comments.

-- 
Thanks,
Sasha
