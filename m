Received: from mail-ot1-f54.google.com (mail-ot1-f54.google.com [209.85.210.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 45E5838F93D
	for <linux-kselftest@vger.kernel.org>; Tue, 31 Mar 2026 20:10:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774987813; cv=none; b=LbTCSKKUZbzQrjgFsnuu6Um5B9b/J8Up+Zj5O8JPrBiPM8kIX1jRq+G2myJwqJAndJqZJuhXdZl+l5Y+QDR57lQ7zsu3aJ13vZ2qwUNls/m7Ay7Meeoek1UccXIkLr3TQR1HGSSF1hKJMpZoYUdB5zO6rUpr3NVUp4AX4No8P4w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774987813; c=relaxed/simple;
	bh=QY0GxpIp2dUAfyWDuWUGa0tRSF0PWKmoSJFuqIEZBCE=;
	h=Message-ID:Date:MIME-Version:Subject:To:References:Cc:From:
	 In-Reply-To:Content-Type; b=QNE9FerGNHL1A41Bi/WexfdjVuhQ3ITx8U+vIJdABNIjhuIAx4DfKV721ykCAudf2dVNiF47am/eg1roCn5ELUNt4hNVJjCfsJCTK1dB83LpsuO/6QMnBBjSQtEAdtP2r1MwUl9QuzGpimEU21BeMZVKc+o5EHaTqWeR8aHBO7M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linuxfoundation.org; spf=pass smtp.mailfrom=linuxfoundation.org; dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b=I36NOCWK; arc=none smtp.client-ip=209.85.210.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linuxfoundation.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linuxfoundation.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b="I36NOCWK"
Received: by mail-ot1-f54.google.com with SMTP id 46e09a7af769-7d9e22176a7so3152233a34.1
        for <linux-kselftest@vger.kernel.org>; Tue, 31 Mar 2026 13:10:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google; t=1774987811; x=1775592611; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:cc:content-language
         :references:to:subject:user-agent:mime-version:date:message-id:from
         :to:cc:subject:date:message-id:reply-to;
        bh=0WlrBiZNX5MM7EOpp+jqx0Njxxj3QUeMt54RUejQ10Y=;
        b=I36NOCWKB9PtxYgJj1Jz6dkUSQAWYBoYs7MUv783SqlmE7idZGgL7bDmA+upiTKbl/
         o6W7RW98ExwD69s56C3ec2p9s0SNxaEsT+RVFjsakXLWv1xa+MxZsolswn8gvC8p4oLV
         ne7fvIyDxbjEflJI6ydQma9lCgqMB28VFoNdI=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774987811; x=1775592611;
        h=content-transfer-encoding:in-reply-to:from:cc:content-language
         :references:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=0WlrBiZNX5MM7EOpp+jqx0Njxxj3QUeMt54RUejQ10Y=;
        b=YMrHqU8t0Gd6jzteDoxnt1la+QIwMZeDq0hHctyUNlCP83liNy2h2ZS6zYReAxFvNc
         y4o9T0V5QgNZOK2ZkmOut0DqIMyppDV/n90A5zUGdK/olILUrlg46CPbUeOv+VqyWITU
         23agN5z6bUgIgk7hEW0MpXuXapjNFt3GexkDekKNl7dwM1NgNOn9li7x9XRFu3MobY5s
         71r/4zZSByxwo4Igp4DhgmlXTlHGVUawScTsioDIlCHmoRa95Ui7/K3wh4yYJVqWokkx
         TDkV/wi47nu+Z1mwWLi5bu8S/CKnKgTNB020o5IPZpmQw/39hxkYcJEiNIq5+l3EXPqT
         YtQg==
X-Forwarded-Encrypted: i=1; AJvYcCVSsmayHToc++FBfIJuHoY4nN0PZk0zGPxEBNvXnxUs9/RA69kAqQwfpPI3JrFGGuRj6hNfJNLUUuOYpS3f4AM=@vger.kernel.org
X-Gm-Message-State: AOJu0YwsN0rsblznZPHQ1kWpKN4cgAVwnVDg9JYk7/BYdaGXxLd8rkBf
	W1gmo3VbbsPjoklA7vxHUMWJ8oGzxje8V/Y1wCP+NsQzTVTHd2n9liMRWRnzBZQB//E=
X-Gm-Gg: ATEYQzzJj0gv3MXTJCUltd+DHOMYpNuV9B8s1Nc5ziXCVJXysT190dlQyVKHloCz23h
	9a4T9LvDcV8JRQ1jZ8pzd3hmFDTD4vNQNMe+Is3m63XFUs44wq4lwuYHfkaAGFnDYEmGnYT8xH/
	hQoc80ms5DmzMiKpcN5WKyPhBcNAMfAizZ3ZVnBpOY7FPOPcj+HMTXJmExnGpmP2MSHVrB16DIs
	SgHvGh0H9T9J2jHp2Y7ozSJJuiUZEqrkH7BIlpeoWLTN+0jPRiEe5avWHV4GCBI6YelMLieSdai
	ra6mvk4ssgdV5aHjxAWP8w8+8SZf1gvLrJise7wMCHaYR3LeJkH2iWVsvb0nRY7DAHiNNmUkfAw
	SFNf9PjiMBBSY85lvqDeQp2F1v6TNYeFsibhkb8DI/lypVw94nNRe6PquLKP/iq069uo59hgym2
	xm808b1vs767R0Un/3Ew+y+S9+CIY6SFlFmOE=
X-Received: by 2002:a05:6820:6af0:b0:67e:3568:47ae with SMTP id 006d021491bc7-67fabcd5b42mr336394eaf.50.1774987811158;
        Tue, 31 Mar 2026 13:10:11 -0700 (PDT)
Received: from [192.168.1.14] ([38.175.187.108])
        by smtp.gmail.com with ESMTPSA id 006d021491bc7-67e2302f591sm7437825eaf.1.2026.03.31.13.10.10
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 31 Mar 2026 13:10:10 -0700 (PDT)
Message-ID: <b098d65a-bb67-4399-87e6-3fc5a2f086a1@linuxfoundation.org>
Date: Tue, 31 Mar 2026 14:10:09 -0600
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] selftests/clone3: Fix capability dropping by using
 standard libcap API
To: Yi Lai <yi1.lai@intel.com>, brauner@kernel.org, shuah@kernel.org,
 areber@redhat.com, linux-kernel@vger.kernel.org,
 linux-kselftest@vger.kernel.org, yi1.lai@linux.intel.com
References: <20260310031415.151531-1-yi1.lai@intel.com>
Content-Language: en-US
Cc: Shuah Khan <skhan@linuxfoundation.org>
From: Shuah Khan <skhan@linuxfoundation.org>
In-Reply-To: <20260310031415.151531-1-yi1.lai@intel.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 3/9/26 21:14, Yi Lai wrote:
> The clone3_cap_checkpoint_restore.c selftest defined its own 'struct
> libcap' to manually cast and manipulate the internal memory layout of
> the opaque 'cap_t' type.
> 
> Starting with libcap v2.60 (commit aca076443591 "Make cap_t operations
> thread safe"), a '__u8 mutex' was added to the beginning of the internal
> 'struct _cap_struct'. This structural shift breaks the selftest's custom
> struct layout assumptions, causing capability corruption and leading to
> failures during test execution.
> 
> Fix this by removing the custom struct definition and use the standard
> cap_set_flag() API.

What king of failures are you seeing? Can you send the failures from
the run?

> 
> Fixes: 1d27a0be16d6 ("selftests: add clone3() CAP_CHECKPOINT_RESTORE test")
> Signed-off-by: Yi Lai <yi1.lai@intel.com>
> ---

thanks,
-- Shuah
