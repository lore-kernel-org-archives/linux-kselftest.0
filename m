Received: from mail-oa1-f49.google.com (mail-oa1-f49.google.com [209.85.160.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5CEFC423A91
	for <linux-kselftest@vger.kernel.org>; Tue, 31 Mar 2026 21:52:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.160.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774993957; cv=none; b=OUfvu1zlKRmMJ2tTD+HA2VKhxMuWrnzBxfMgnTMG0mDX2lYiDhNLcHZml8whe3j0WFCMSczNSDOPdIQWrW9XzS+n7ESTqcRI8rszm8IwnmX93dZxvJYZRh9HnKe1A0tqAiEcd4Z+dGHegMaBqHxZ7aFCeQKrikYd77LFI1lcP5A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774993957; c=relaxed/simple;
	bh=QcIiO2S2cP3X0u81SLXxDNHm9VFTbljHwH99aAux3Zg=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=io55PKHS0z/A/Zny3kcD0V32uSopz38xpejSDDV9JlRPJ5r/FuAMwQDmW6ShMX7Vf/MoEeXJ/cFTT4N6osbGBCyu43V5Gg5QTq8v8H0lXG9g+HhQYATOL33CWvwXlhJd8sN8qY28xcDZEfXT0ABeG1djt8Hzcqvz/D5YE4mPobI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linuxfoundation.org; spf=pass smtp.mailfrom=linuxfoundation.org; dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b=JvbXmziQ; arc=none smtp.client-ip=209.85.160.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linuxfoundation.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linuxfoundation.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b="JvbXmziQ"
Received: by mail-oa1-f49.google.com with SMTP id 586e51a60fabf-40ea36b56b7so5060305fac.3
        for <linux-kselftest@vger.kernel.org>; Tue, 31 Mar 2026 14:52:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google; t=1774993954; x=1775598754; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=EKq8H2JGsP7bFZjiH5OJgOchLeIYAjNY+kxkSl5F2HQ=;
        b=JvbXmziQC7TolDpMbPyFpqCGlCzk87t0l1KlvxkiFF4lHuj0UfidsvlhL/hhnwVzYN
         CHkMVGL1U3bMaCP9WwtDcgrIQ74W6IZFjqTDvGL6ZldD2fmtRQqFeSPa/HtsBb26+xsN
         OagGXcrvWRxPRYJTs+KCK8UN3k7mArIjUALzY=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774993954; x=1775598754;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=EKq8H2JGsP7bFZjiH5OJgOchLeIYAjNY+kxkSl5F2HQ=;
        b=B7y6ltd1hsJ5NP/eaBU4YtnkQZaCf/9WlkitePPZiq+naHV4Tz61V0ddbyygvRRq3a
         mWZlWSo2lEQBWI53SnyqSyRCM5lG5w9Ax7jCoaqXInejf9JJw6BuUHKqCDV03EemZHQJ
         vDLRlAuc2u07AWBaCe7DeCO6Ukjw1miyPUWU1bPqreQfWDR7Ayhyk0a1NGPnyxrJWEyE
         1HEb9sGgfLrwlEZ6TLt6K0F0Sbd/8h2+0TZkGkHBVmVK4L6FdJq/gbb+DUWFDr2hYN/o
         KPUZBE6TxNrxKPrW42rGv+swrFkjUhuI7uCAaTkxzXLIjN2Q55Q9Yme+advBKlaV0v0g
         NicQ==
X-Forwarded-Encrypted: i=1; AJvYcCUYXcXyPp65FiDSX9wo7tHzEScs+UqSZyUsViM6Pcz5fWP8loUOql/uMGfRkdENR0pIAU2H5cSLpOe5tQK0ipU=@vger.kernel.org
X-Gm-Message-State: AOJu0Ywhi11KAmEY1yQs4B/T2wfM8RrwKLSlySfh4YW2YhYxXa9eD9A9
	qqmZ2BYzK/S9S8QaRu6fYdGjowNYAp4OICB5d85jKfNgL+ZfU8V3u9M6zqUdgVCun/Y=
X-Gm-Gg: ATEYQzyTgb4xRgXoVhZ2dMr0K+kTfWzFSm0N0mH5HejM6hEvCaURk1SuC9b7YhETfNj
	f7i7BIZgR47nEPnjtRVIq44N5riMp+NFdDYWLZ13FmCUNjSoD7GubNli8TKnIqm7f0DnwIqT48L
	8DL/b3C8Au1WMwXHv0gXu51+Rg/JPw4F3s1hSsZFdX0NSwc/J7SL6pUrUpImrAclBf2h/OZ7gJT
	YVCnqyRMfJbJA+60iiLDvakyotZD4qGsyFc1/bVxkJ7zd1spAHa4yf1Vt+3FOcxqBDgrd4xPwwp
	eDusYhgLy4eb+lsFPvocci+2aE6q6EJ3DVKBESOWqMc4egSUSgYG2XSPGcQH8pTRTeBn/m/8uhN
	z7w/bzCcJtDhr8JRdBQ+l4oyGP8ekDioSUQkz6KOfGsn4rsVLfY18vzZLwAeiUqQ8f8BKHlYKsX
	L2rdKt+GzNGkeJst+MZ6gMdQh/4MqVxg8vhv/RkDd3acT/hg==
X-Received: by 2002:a05:6870:200b:b0:409:a4d3:a30e with SMTP id 586e51a60fabf-422cfbf5808mr880410fac.2.1774993954054;
        Tue, 31 Mar 2026 14:52:34 -0700 (PDT)
Received: from [192.168.1.14] ([38.175.187.108])
        by smtp.gmail.com with ESMTPSA id 586e51a60fabf-41d04d79c35sm8117986fac.18.2026.03.31.14.52.33
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 31 Mar 2026 14:52:33 -0700 (PDT)
Message-ID: <cd22b0b8-1e1c-4442-b4e4-5d7a6303ce4d@linuxfoundation.org>
Date: Tue, 31 Mar 2026 15:52:32 -0600
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v1 1/1] selftests/cpu-hotplug: Make the script complaint
 with sh shell
To: Hubert Mazur <hmazur@google.com>, Shuah Khan <shuah@kernel.org>,
 Jihed Chaibi <jihed.chaibi.dev@gmail.com>
Cc: Slawomir Rosek <srosek@google.com>, Lukasz Majczak <lmajczak@google.com>,
 linux-kselftest@vger.kernel.org, linux-kernel@vger.kernel.org,
 Shuah Khan <skhan@linuxfoundation.org>
References: <20260318080825.3063959-1-hmazur@google.com>
 <20260318080825.3063959-2-hmazur@google.com>
Content-Language: en-US
From: Shuah Khan <skhan@linuxfoundation.org>
In-Reply-To: <20260318080825.3063959-2-hmazur@google.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 3/18/26 02:08, Hubert Mazur wrote:
> The script uses by default the bash shell that is inaccessible in
> the x86 embedded devices. This leads to the syntax errors. To mitigate

some x86 embedded devices - which ones?
> this, change the interpreter to /bin/sh and properly assign the
> FUNCNAME variable for each of the functions as 'sh' doesn't set this
> env. Change the conditional check for being a root from not
> existent UID and replace with command execution "id -u".

Please include errors in the change log

> 
> Signed-off-by: Hubert Mazur <hmazur@google.com>
> ---
>   tools/testing/selftests/cpu-hotplug/cpu-on-off-test.sh | 10 ++++++++--
>   1 file changed, 8 insertions(+), 2 deletions(-)
> 

thanks,
-- Shuah
