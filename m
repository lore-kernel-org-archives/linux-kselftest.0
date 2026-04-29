Received: from mail-pl1-f172.google.com (mail-pl1-f172.google.com [209.85.214.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 284BD40DFDF
	for <linux-kselftest@vger.kernel.org>; Wed, 29 Apr 2026 10:11:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777457469; cv=none; b=kAuKIA9xLwcxW7CxowM0jX5S8qXWW0T2mPbKnPQ9lfT7xuSwmds40ObLK//vVcIG0zGthAQddkACjnxyjSVrCRvwLTQtsno6+q1n9E+Q3GtF9YpCyc+qDWvyZqApeBEcvGGHVXfi6nvtBqKwHFUprOI0Z1uiLQboMOqyppo2B+Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777457469; c=relaxed/simple;
	bh=KLwWf95QYlXqjTRiTI/nyMeghq1jIrTTG2Jrgoqqb/s=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=Gkf4iHixUX7TyZPVCRKgfcfG/7KNysxs4IwAeNTxIAfcp7Xq1Y1JcP1y0uhQK8UOCJPJPEL9A9P/zDYieSxtCPALMMd/cM7DVDbLRsMWbRXOHg3DpadEZpzV3YFLUZGxiqSC9KDizkGk9hlS19TfgvEd8KzqyVD0XokmJrvm2R4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ingeniumdigital.com; spf=pass smtp.mailfrom=ingeniumdigital.com; dkim=pass (2048-bit key) header.d=ingeniumdigital.com header.i=@ingeniumdigital.com header.b=Xz2UVnxa; arc=none smtp.client-ip=209.85.214.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ingeniumdigital.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ingeniumdigital.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ingeniumdigital.com header.i=@ingeniumdigital.com header.b="Xz2UVnxa"
Received: by mail-pl1-f172.google.com with SMTP id d9443c01a7336-2ad9a9be502so77477655ad.0
        for <linux-kselftest@vger.kernel.org>; Wed, 29 Apr 2026 03:11:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ingeniumdigital.com; s=google; t=1777457466; x=1778062266; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=0R26ySyVwseh0XvD0z3+P5speK5gk4CAVoAQ5oLCLJI=;
        b=Xz2UVnxaW9LQPQuEHuaS4DHlIn2123lJZ8S5CmasIy2qoiy9XmPT6HLjx+Z9cQrrEd
         WIOKPuS9RQ1SKTkVqf7qpbRG6KkODRAfmbR/K/omQ8AW7Oqrwnntza1CJAvcA2QCVB/3
         ZWvOsLsvvHUs70jtPHoH0hliD5IyFVxxSDidasAac832y5wSn5R+UN3hkZkJ8W/jHhfy
         JmRY1I6jD/pMYHJwbJ/1CwJJU86zzVpiwuDnHXRIspYH/6dO5x3RREuOgV2w8EQLCBB+
         aKfzoa8Toie4zUM3RL4uj0AyuuKJXORDpq5QXTaVtwgXyETuo2OlZkteMb8wp6xGOErs
         Dhyg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777457466; x=1778062266;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=0R26ySyVwseh0XvD0z3+P5speK5gk4CAVoAQ5oLCLJI=;
        b=Wj8ATK05Ff5bb2z1HLENd/8csveC3st6mNF2B1Ur35LM5pCDjdQ86pqXjv1hU2yifx
         BFHgKMsaKVwwZjT4HMrKD7TX75ti1Pwn6GInQ9YscaiiX7WbdY3B8KNMJzDLuvDmrCNT
         gqs72W+St3LOz6NuAb6ZFYG/9c9zeUbBUsH/Cm1MNk/7WRCBaCN6g0eU1ceifJSipv1J
         e8A1PApehAWMh4zMCVqcmIiVcpSTvPDHKCPpjaCoROjPfSloWRROf6WLRbkhJRpKogvq
         grgcp8RWZ7NzmywO1i2Wyvj7VmAWhWl2mH5ygKCrptmI+zQGWi+jNeg44CdqcmyOOkAq
         t50Q==
X-Forwarded-Encrypted: i=1; AFNElJ+bafROJOgi3jmWSNqiNOXMzF3gkEarppubAlYJ5z3dj8btMJ5usCuXY4kgTSQzP5K61uSzx+Yq/gP8B1MfWNE=@vger.kernel.org
X-Gm-Message-State: AOJu0Yw7eYkhOrNev+wuW/lzXRxG3SpNQK155eCtU2C4aRRuFM0NcDtu
	tG/fL+vGwU/6LdJAjHJPBm2jooii58z3DUaQsJLG+MLanYVWdlwsbTvwWlrv1brvKQ==
X-Gm-Gg: AeBDiev63SPtrYfcHSJqQq2tHJiY1e9djG11Jvc37qh+W1U4G8KpCX2LYD0In0t3cIf
	AmitFVIw8B8TiTTWHZc/qmkTjkRwxbpMW+Q8gbPSMPoGy41RaO5AKKtVTojm1W9PuVwW+RRQUqf
	qR/AlHihXGsTGl9BmLzzmrLn01BupMwHJonY4+1woMrl6G+9IQJ162WgViiRxtswtfr3+8S73mK
	/A4jW03/SuKb+Xar2vDHcikB8sylk3H/1dO3SkOflEA0X7/I3Hd3AAPx8U10YAhoX8Zz2bNQi6V
	cq4X+quRLQTw5EravPyJZbCFlmXF0riigXq5U4myhJsUp5rF1T3nYyzi9kGBz/lixqgqFMO5duy
	GQ6HbhtXnHUSUJnHwfwzzdB+cOh+o8ERZzC9YKkL9pM2aLNYc/+yDWbT73+pT2Vr9J2fsLEZVhp
	GJN9STPARpDBGUOZ+7I5qT4t5L7/K+qEOadrSfEWzW+Is3gw5o5UmhpQkpuWKwYZE2vob4RWVFA
	eQ8ryET1DK4KevQztMC
X-Received: by 2002:a17:903:3503:b0:2b2:ec00:7966 with SMTP id d9443c01a7336-2b97c462381mr77953125ad.21.1777457466448;
        Wed, 29 Apr 2026 03:11:06 -0700 (PDT)
Received: from ?IPV6:2001:8003:8810:ea00:ed87:ca88:5326:e11d? ([2001:8003:8810:ea00:ed87:ca88:5326:e11d])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2b988972dfasm17817855ad.72.2026.04.29.03.11.00
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 29 Apr 2026 03:11:05 -0700 (PDT)
Message-ID: <279a16dd-f98f-44ef-9685-44537eac2892@ingeniumdigital.com>
Date: Wed, 29 Apr 2026 18:10:58 +0800
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/2] kunit: qemu_configs: Add or1k / openrisc
 configuration
To: =?UTF-8?Q?Thomas_Wei=C3=9Fschuh?= <linux@weissschuh.net>,
 Nathan Chancellor <nathan@kernel.org>, Nicolas Schier <nsc@kernel.org>,
 Nick Desaulniers <nick.desaulniers+lkml@gmail.com>,
 Bill Wendling <morbo@google.com>, Justin Stitt <justinstitt@google.com>,
 Brendan Higgins <brendan.higgins@linux.dev>, David Gow <david@davidgow.net>,
 Rae Moar <raemoar63@gmail.com>
Cc: linux-kbuild@vger.kernel.org, llvm@lists.linux.dev,
 linux-kernel@vger.kernel.org, linux-kselftest@vger.kernel.org,
 kunit-dev@googlegroups.com
References: <20260427-kunit-or1k-v1-0-9d3109e991e8@weissschuh.net>
 <20260427-kunit-or1k-v1-2-9d3109e991e8@weissschuh.net>
Content-Language: fr
From: David Gow <david@ingeniumdigital.com>
X-Clacks-Overhead: GNU Terry Pratchett
In-Reply-To: <20260427-kunit-or1k-v1-2-9d3109e991e8@weissschuh.net>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

Le 28/04/2026 à 12:04 AM, 'Thomas Weißschuh' via KUnit Development a écrit :
> Add a basic configuration to run kunit tests on or1k / openrisc.
> 
> Signed-off-by: Thomas Weißschuh <linux@weissschuh.net>
> ---

Thanks very much. This works well here (assuming 
CONFIG_KUNIT_FAULT_TESTS=n, and either a long timeout, or slow tests 
skipped, as qemu-or1k is not fast on my machine).

Reviewed-by: David Gow <david@davidgow.net>

Do we want to split the series and take this patch via kselftest/kunit, 
and the generate_compile_commands one separately, or just pick both up 
in the same tree?

Cheers,
-- David

>   tools/testing/kunit/qemu_configs/or1k.py | 18 ++++++++++++++++++
>   1 file changed, 18 insertions(+)
> 
> diff --git a/tools/testing/kunit/qemu_configs/or1k.py b/tools/testing/kunit/qemu_configs/or1k.py
> new file mode 100644
> index 000000000000..dfbbad0f9076
> --- /dev/null
> +++ b/tools/testing/kunit/qemu_configs/or1k.py
> @@ -0,0 +1,18 @@
> +# SPDX-License-Identifier: GPL-2.0-only
> +from ..qemu_config import QemuArchParams
> +
> +QEMU_ARCH = QemuArchParams(linux_arch='openrisc',
> +			   kconfig='''
> +CONFIG_SERIAL_8250=y
> +CONFIG_SERIAL_8250_CONSOLE=y
> +CONFIG_SERIAL_OF_PLATFORM=y
> +CONFIG_POWER_RESET=y
> +CONFIG_POWER_RESET_SYSCON=y
> +''',
> +			   qemu_arch='or1k',
> +			   kernel_path='vmlinux',
> +			   kernel_command_line='console=ttyS0',
> +			   extra_qemu_params=[
> +					    '-machine', 'virt',
> +                        '-m', '512',
> +			  ])
> 

