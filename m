Received: from mail-pj1-f52.google.com (mail-pj1-f52.google.com [209.85.216.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 87CB937F75A
	for <linux-kselftest@vger.kernel.org>; Tue,  7 Jul 2026 05:10:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783401043; cv=none; b=qN+NxGyVRHP2KFotwguBtzU/W0UqCz6/PQEBV5Go0VHFzK7KC+/kyjL6RLlKUvtfZuijX8pLRRw+t5Qb3vnPqDwE97fXnppJfonIXlyk8jSoytg5Xoc3jt1H6ZVscRSxyo8JiikhY+Ip1TEaqoi4YxzXs4dlmGUU0bkeLY9Zb1A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783401043; c=relaxed/simple;
	bh=09pBjauv0838HDn3fbf/w3Lov5kSiWIMIHEO6sJqUyE=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=b2nxaM4HC/0r7uOKUD3KM3zfqj/VJxIj86u1XM6bMJthMSbpl3GJKWE73U6j86eWOGNpifCjXsuYUmi5DNb47tdebnouQl0wl4faoJh4PNoVS52TROApszCTlpcYQTXTE3ebbRBKnFJrxtJqbKx9O0HSJsgzP+xSbO6x4zexio0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=gxz9G32z; arc=none smtp.client-ip=209.85.216.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="gxz9G32z"
Received: by mail-pj1-f52.google.com with SMTP id 98e67ed59e1d1-3817f800c8bso2762846a91.1
        for <linux-kselftest@vger.kernel.org>; Mon, 06 Jul 2026 22:10:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1783401042; x=1784005842; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=0rCviGYAxqKCjjniGYaw42oP7QrFMhf2K89fW3sESE4=;
        b=gxz9G32z6Fuha7706aYmJCCdJ9F+c/0ekkZdL9PRSKbR1dKMC9ADBnlTVqQ60bJIKh
         LSazmAKQfglXZ3irnCQoKizVXbNzYNAsxbqN1wAw976mHdyjzwsOLE/CMcGycNc7zc/B
         4VKGr4cEIT6WEN7zLXgj2YfRwqhiltxP8BevM+s+glFXkQ84uD4u0Qd9XQP7OGBPgFyX
         R1DcW0/Mg1itjUh0rkJSYL3NiEt82Cgzevhmwp5LI3VjJ7tDjSqeYOblfBMC/uWw7h9N
         Ns7Ge25zso7RHDnTXRCZ7Kf3wVmPl2Z+3JKWLJqshhXAi8Rk6qflg1uQ5CWrF4UD72bH
         1SsA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783401042; x=1784005842;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=0rCviGYAxqKCjjniGYaw42oP7QrFMhf2K89fW3sESE4=;
        b=Fhh1RWjv6VZuATR7hwrtCpt4WcWulwGlia3+Byu9WNV/jOpyUcnR+jW2mguUB0V/nm
         /aHAR792Gc9RTnYSGnnSR5k2SI0axRMpYCZwF+F+T9ik72zmCE1nywdLGzJnh99jHfV3
         p8KXqAOzirVw0Sh4LcLPTPzCPFg1BMGtfBxWJQl4ym4qucQZdvkA5qmPsbtuf/PgV1A3
         L0kWTyofwAJPjFWxf29uh/sXG/qwkSL84e5PxYdep8bAgNcQJ5SMVGWE/kTkEE9/1bcR
         zMyxgpeD+hxkhB0U8Ob9ge14T98BBPPbts65dq1X92v567FrACa9EezP6bDpkhIdGVza
         HO2A==
X-Forwarded-Encrypted: i=1; AHgh+Rpav7jLdyG8xBZmIeihxqyHNJnau7umhjQvhBH/Ax+7Zq54jj12LZwV2nd2vMGtQqESUFwkIYkBfqvdSi+d9QE=@vger.kernel.org
X-Gm-Message-State: AOJu0YyrxaD9JlReU3ASY00UszC1UPvY7NA+1BL/c/Dgb7sjTj2trmqz
	35wZ6hjT1ye4xC73D8ewla8IUwItqdxiXJjmbkwuTN9+3DvoVRCFMYgMeNb1Wl9lU20=
X-Gm-Gg: AfdE7clti3sOmrM9TgefC09hVLCJ9CQ2JL37wsNFz+ybBY9CBk4BeF7EY1l5GHQHmDA
	iBhB6MPUo2VpPKFgU9gaflpT7JmnyDY9I4m9Ne7fvulSZGx4ukSyzpwvVfIGIouClvGvvRtyKeQ
	tW9YK0ZxyNMkj2xEvvYKQ7EswvQNx3VDQjh9661Bmy/5FAV2OuyiNagNyOEmGuQ/ZTAXUgHSb12
	6D5hX/7XEnc9bs5Cc0pcKEmQuSMM0HGabEPRWv8q7TJA1T6n9KtHcjTaAVb8gjCmN+nm0dqFCfg
	UiL9NXGiT4JiegipetY/AwBDZ73rUaRK0vBqAKFfsBsHtbY2OrysMbkI96EtGjm+7ARNphudkzl
	07+kN+DPu4S8O/bx68heItJnCL/tO6X0S2cypSTO1bwY24SwamEl+UOxtjlVMXmqHwWhsxmgbDG
	JA4DMxQdb4H1Bi
X-Received: by 2002:a17:90b:5403:b0:380:9504:9780 with SMTP id 98e67ed59e1d1-38758062363mr3539509a91.29.1783401041657;
        Mon, 06 Jul 2026 22:10:41 -0700 (PDT)
Received: from localhost ([122.172.82.94])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-311747f7293sm3810292eec.3.2026.07.06.22.10.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 06 Jul 2026 22:10:40 -0700 (PDT)
Date: Tue, 7 Jul 2026 10:40:37 +0530
From: Viresh Kumar <viresh.kumar@linaro.org>
To: Jinseok Kim <always.starving0@gmail.com>
Cc: rafael@kernel.org, shuah@kernel.org, linux-pm@vger.kernel.org, 
	linux-kselftest@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 1/2] selftests/cpufreq: Remove unused local variables
 from switch_show_governor()
Message-ID: <oz7lhcfan7rpy5ixlqlaea7rqjhagepqqzpssueai4qcwe357y@ilky5ez6eyd4>
References: <20260706143857.3306-1-always.starving0@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260706143857.3306-1-always.starving0@gmail.com>

On 06-07-26, 23:38, Jinseok Kim wrote:
> switch_show_governor() assigns the current governor and frequency
> to local variables before switching governors.
> 
> However, these variables are never referenced afterwards. The function
> does not restore the previous governor or use the saved frequency, as
> backup_governor() and restore_governor() already handle state preservation
> elsewhere.
> 
> Signed-off-by: Jinseok Kim <always.starving0@gmail.com>
> ---
>  tools/testing/selftests/cpufreq/governor.sh | 5 -----
>  1 file changed, 5 deletions(-)

Acked-by: Viresh Kumar <viresh.kumar@linaro.org>

-- 
viresh
