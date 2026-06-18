Received: from bregans-1.gladserv.net (bregans-1.gladserv.net [185.128.211.58])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 409EC20E334;
	Thu, 18 Jun 2026 08:41:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.128.211.58
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781772112; cv=none; b=HtUmM35Tzmy9lWJmSQutHu5pNsgNGQOLxrhRZpuLClfYqeMvnY0RECn/lLtKKkvJ02PZH/AXiy+FpolxHb3vJw6FGYb0Fxx1OjQDGhggOUF2E+D9O5lk5rl+YtpHwuFD6ojIwaQC77nWm/f+qyK1U8mJuhxXcjwCiZdKySIVicU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781772112; c=relaxed/simple;
	bh=Pz2p1RkeXj7eHQl9ET4dpxIJp/dDvVTUnZlDz4X3rWw=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition:In-Reply-To; b=C4qpxCjxWPVyZiwSdH8MSXcdvYQVuI5Ruh6f/16QSsYAD4fWs1wSlAfQI7iL6EbFIJBPQgJgVJcm/MUKrwGetdDRWqrJwhi5dFr28ZA7Eye4X7uwSbyJHE4kUUBMXTqjLNCfTFMh0HUNHhrRQqMm6H4KYqtgOy/MCU1S1CO/sh8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=librecast.net; spf=pass smtp.mailfrom=librecast.net; arc=none smtp.client-ip=185.128.211.58
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=librecast.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=librecast.net
Date: Thu, 18 Jun 2026 10:41:36 +0200
From: Brett Sheffield <bacs@librecast.net>
To: Rafael Passos <rafael@rcpassos.me>, shuah@kernel.org, corbet@lwn.net
Cc: linux-kselftest@vger.kernel.org, workflows@vger.kernel.org,
	linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] kselftest docs: remove reference to obsolete/archived
 wiki
Message-ID: <ajOvQKne74gN-7Y2@karahi.librecast.net>
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <865def83-a07e-4eba-b795-7da66e0e2d69@linuxfoundation.org>

>On 6/17/26 19:03, Shuah Khan wrote:
>> On 6/17/26 17:57, Rafael Passos wrote:
>>> This link in the docs point to a wiki that is no longer active.
>>>
>>> The wiki was moved to archive.kernel.org, and there is a warning:
>>> "OBSOLETE CONTENT This wiki has been archived and the content is
>>> no longer updated."
>>>
>>> Signed-off-by: Rafael Passos <rafael@rcpassos.me>
>>> ---
>>>
>>>   Documentation/dev-tools/kselftest.rst | 5 -----
>>>   1 file changed, 5 deletions(-)
>>>
>>> diff --git a/Documentation/dev-tools/kselftest.rst b/Documentation/dev-tools/kselftest.rst
>>> index d7bfe320338c..64c0ec7428a2 100644
>>> --- a/Documentation/dev-tools/kselftest.rst
>>> +++ b/Documentation/dev-tools/kselftest.rst
>>> @@ -15,11 +15,6 @@ able to run that test on an older kernel. Hence, it is important to keep
>>>   code that can still test an older kernel and make sure it skips the test
>>>   gracefully on newer releases.
>>> -You can find additional information on Kselftest framework, how to
>>> -write new tests using the framework on Kselftest wiki:
>>> -
>>> -https://kselftest.wiki.kernel.org/
>>> -
>>>   On some systems, hot-plug tests could hang forever waiting for cpu and
>>>   memory to be ready to be offlined. A special hot-plug target is created
>>>   to run the full range of hot-plug tests. In default mode, hot-plug tests run
>>
>>
>> Looks good to me.
>>
>> Reviewed-by: Shuah Khan <skhan@linuxfoundation.org>
>
>Jon,
>
>I can take this through kselftest tree as I usually do.
>
>thanks,
>-- Shuah

Hi Shuah, Jon et al,

I've been trying to get the same change merged since August 2025:

https://lore.kernel.org/linux-doc/20250824075007.13901-2-bacs@librecast.net/

resent in January:

https://lore.kernel.org/linux-doc/20260115172817.7120-1-bacs@librecast.net/

It's great that this trivial fix is finally getting merged, but can someone
explain why this patch was accepted in preference to the one I sent in August?




Brett Sheffield (he/him)
