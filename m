Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7762A19F115;
	Sat,  9 May 2026 12:34:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778330053; cv=none; b=D1hSxp8RIZbgOVX+2YLKb0LRU3XuI57EeeO/u8rTKwX1xJAiaRx6st/cU2Dm93YpjuMuCTwEuHQv3TE/rvAbwZsWEpI0G60VHC3CE6YUa+XPhc3RkxCKMK6M+kA8ZSpCaqwzxDz26xev16GCwiaGL0cEtejSHCFX4VbRHo3KZ0s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778330053; c=relaxed/simple;
	bh=o1MVcfKtmpDeiXWqeRLY0P9Es90DiqcqVTk0yDIPBoo=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=HdgyxfxxXBy++ztzSDQwtkfcjZJTbRhbfBlek4rwrO8DNXzwg9MgaCxYIu0awAxpm8nFpzqOTdPfJgzGIVe1IE7MipO9hhD/CDlGvErr9fKq5vcH6wzKO5H6jmfzMocj2nWQpDJUk7nf/Xk3Ljp7dnSvkg7aOclctoklDH+icyQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=mBjNxlXm; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="mBjNxlXm"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B0E47C2BCB2;
	Sat,  9 May 2026 12:34:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1778330052;
	bh=o1MVcfKtmpDeiXWqeRLY0P9Es90DiqcqVTk0yDIPBoo=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=mBjNxlXm4CjQqKrt4lhrVJ5uF7MrzUMcUU0InFQCRlyk3oRpazLBGjg/4bmMTNpza
	 6m9o4Jf+AiboKHUoCPRPpxXntO9YMyAvNVCj9iF0a8Kj/L06qTq/H6iWYIDqY0fGWf
	 vqRhY+ccfOIFMFHhqGSjFI6CwwJV++6PTKASgGlgQrrZKkW/+9k11NemMXcs0IX4H6
	 KzLWM3RuAFAPvqNVuzRRNI9DLoywrVhcAsam4iqLnX+qdFMsAdGA9q+Xe2oLK3tBby
	 YZoD0VjiBHrKh51yquyoilHF0pnOboR+e+HROUdWrdJEQLXZ1m8Dq8a5DEXiMe4x0V
	 Pg521hmgt37ZQ==
Date: Sat, 9 May 2026 08:34:11 -0400
From: Sasha Levin <sashal@kernel.org>
To: Florian Weimer <fw@deneb.enyo.de>
Cc: corbet@lwn.net, akpm@linux-foundation.org, skhan@linuxfoundation.org,
	linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-kselftest@vger.kernel.org, gregkh@linuxfoundation.org
Subject: Re: [PATCH v2] killswitch: add per-function short-circuit mitigation
 primitive
Message-ID: <af8pw54Y-Q18kSR0@laps>
References: <20260508195749.1885522-1-sashal@kernel.org>
 <87ecjku6y7.fsf@mid.deneb.enyo.de>
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii; format=flowed
Content-Disposition: inline
In-Reply-To: <87ecjku6y7.fsf@mid.deneb.enyo.de>

On Sat, May 09, 2026 at 02:02:24PM +0200, Florian Weimer wrote:
>* Sasha Levin:
>
>> When a kernel (security) issue goes public, fleets stay exposed until a patched
>> kernel is built, distributed, and rebooted into.
>>
>> For many such issues the simplest mitigation is to stop calling the buggy
>> function. Killswitch provides that. An admin writes:
>>
>>     echo "engage af_alg_sendmsg -1" \
>>         > /sys/kernel/security/killswitch/control
>>
>> After this, af_alg_sendmsg() returns -EPERM on every call without
>> running its body. The mitigation takes effect immediately, and is dropped on
>> the next reboot -- by which point a patched kernel is hopefully in place.
>
>Do you expect this to be safe to enable in kernel lockdown mode (i.e.,
>with typical Secure Boot configurations in distributions)?

Yes: under lockdown, killswitch has to be configured on the cmdline. Runtime
engage is gated on the new LOCKDOWN_KILLSWITCH reason.

I do need to resend a v3 that also gates disengage and the retval write so a
cmdline-installed mitigation is fixed for the boot - I didn't think about that
scenario.

-- 
Thanks,
Sasha
