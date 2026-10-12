Received: from mail-dy1-f178.google.com (mail-dy1-f178.google.com [74.125.82.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 85ECD34AB14
	for <linux-kselftest@vger.kernel.org>; Mon, 12 Oct 2026 04:26:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.82.178
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791779192; cv=none; b=PiXazgbaALB8XmBj1a7aAC13yMsEwfEqe1SLJ2QrP4GTE/by9ynYhZsf1GkwpNWv7cRfCvBWtaZGxKTZBg9zqjJIxtkU1ByU5OVM42uBa2AXKC8+odAu5YRK0qCQU6QX/zgEkJ5VJM8aOkEiXYfFoFggjGNMmvB95QEvrsu90bE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791779192; c=relaxed/simple;
	bh=aiBAhlv2Ev/TS2fJoaSo8lPZ16KTHkhhUdlu5+WAv2k=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=DAhZ07HjmoO2/oC5+q3fHZd2j2irHuckia9NFgx6TVqsO60Cx70G9B6svyj7t2WhxVwEwOAS3zZmRf2qUkrNeBTR31fRFZYHdirn+LOiU8xpCQcnZo2BCZRTMy8wCWtgnKDOZNZhv2mbDMclBBesfJwpGXRBYlLVcQHLJmQixZQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=fwfP72/U; arc=none smtp.client-ip=74.125.82.178
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="fwfP72/U"
Received: by mail-dy1-f178.google.com with SMTP id 5a478bee46e88-3550c917fd3so2195267eec.0
        for <linux-kselftest@vger.kernel.org>; Sun, 11 Oct 2026 21:26:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1791779189; x=1792383989; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=7HtE6pXgrE7ezeCTTTPF8rtN8BUz+TwVSZ4PqyPsxjA=;
        b=fwfP72/USZqDt0/SJslKhbUX9vdNj2ckCWvHsMlLtG0IrYkVzRItznHLmmhNF9q7Zp
         f3yEUZl7xwaut6bI/yqwyMtLHNhqX87+ixG1akNsyESDRYuXrVdvNmiq+Lyw6385Frus
         lamLXcQZuV2aMJ1xl/0fmDDHiaqwlE6Fd0XTX2aWHFG3mhqJMp2EOo9+HZx5hZ8Tj2II
         Ked4bKgqeJm1f5aaINtJLbvGB6BJH9vl52HdtgAeCF4BScdeG8IjwN9qFEW4s9kMD+HO
         RiKWIxn/hZn3sIhWdBXLZ5CqNZC6WP+7Q8E+QbMOSPz1xKEIh1w6ppYGzlLmXDbTdIeM
         O9zg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791779189; x=1792383989;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=7HtE6pXgrE7ezeCTTTPF8rtN8BUz+TwVSZ4PqyPsxjA=;
        b=2eMj2J4eKKjs5OfCR9+OfxUhou4TmfGAtzzSeKgmvQZYrivQBZo1t/mDKn1F0FT2Ks
         yla3m1v3AWqB7rXmZ12GYbMuIyjzaqroOH40eRvXiHSJKbNNNcm2hpQdPZ/IGBfZ4PXc
         WBD5niBItoWHWwJxVGlx8oGA32FbOOJYSKtl4sWKq8T247yv1Nu0JcAaC88ykdI9cN45
         Sfhcl/fUPnJrxb32liGyRSM3f1jsrQaADbdIVgpH5QQJjZlyE0w9t/oXqOSD+NET1p9D
         1YOxXjBoH/xOLm+tqn4+qni3OsOutp1PZ0WIXl01MVEekPU85QR7/2jLDsBLTs1ko5T9
         PAxw==
X-Forwarded-Encrypted: i=1; AKwUvBzE2YvlmK0bYwG4jQsRy+L85uQNu7RHv6Vzo0S8EJSlBJFE92ZTqqAiDxFKE6J0zJMxPqcScdOKHdL3OXlyTkQ=@vger.kernel.org
X-Gm-Message-State: AFq9FYL6ArpyR1NEId67lFL6Iil8kDZV6epfQFjNPkHJe+CDZk5qh7Zs
	LrDHAYdso+iNsXsS5ccrdfSd+PFnUeVCOcMH586NzYCQulhoNo+hB56pVvg3kIv1WsM=
X-Gm-Gg: AYBFou3dqdJ9+FZWkCD9aEYixOy96UpgSMTHStQ0o8tdzZeUKQ1HZYbICNUzpLpD5Fw
	/S2ppXJxZ0noxPWfUkRnCkYkrLoXMTaOb1yQE3E0ficzlhJw85aUDhQmQB6UA7iR2ntWfldKQ1f
	zjo4P407lOOUEPuVPbm4ckUEmT5rGPm2KSKO6HxMDAXigxAUsHOPrc3p1RD6th+tSV2KsxjmssA
	BsPPZuHCEujqYaTQQmT9S4Y/D+nTgi/StlPW6XeJigkgqRAyhTF+qEGBC5gMP9gyxOy3wXpt0OV
	z3hOfitTF4Y+QH7/kgLDk9CMsv1/whQxdL+3g+gHPTYgSNMH8pGhdvTAzcqKDxcymxDDos3vZ8S
	Wc5Hiw2A1BDG47FvA2ZIQGMZvZcWVo8i7NWfA1czDh7hQlC5zITq++JjKskoMr+LnQJx+6Mbjzm
	6fAcmDCytU+giZIf1JRAdG5hzyQovdqgMVl//xu85NmvtBaPrwyEIjCZUZRo9YGwnk2Xz10jZmS
	w==
X-Received: by 2002:a05:7300:ce94:b0:345:84eb:7153 with SMTP id 5a478bee46e88-3537e033341mr12296308eec.11.1791779189344;
        Sun, 11 Oct 2026 21:26:29 -0700 (PDT)
Received: from localhost ([122.172.82.240])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-3537c61eaa0sm32289042eec.0.2026.10.11.21.26.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 11 Oct 2026 21:26:28 -0700 (PDT)
Date: Mon, 12 Oct 2026 09:56:25 +0530
From: Viresh Kumar <viresh.kumar@linaro.org>
To: xiong yining <xiongyining1480@phytium.com.cn>
Cc: "Rafael J . Wysocki" <rafael@kernel.org>, Shuah Khan <shuah@kernel.org>,
	linux-pm@vger.kernel.org, linux-kselftest@vger.kernel.org,
	linux-kernel@vger.kernel.org, chenbaozi@phytium.com.cn
Subject: Re: [PATCH] selftests: cpufreq: stop CPU hotplug loop after cpufreq
 update test
Message-ID: <asxhcagRL3myS3m_@vireshk-B250M-D3H>
References: <20261010100148.297720-1-xiongyining1480@phytium.com.cn>
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20261010100148.297720-1-xiongyining1480@phytium.com.cn>

On 10-10-26, 18:01, xiong yining wrote:
> Original test uses a fixed 5000 iteration loop to trigger CPU hotplug
> for verifying cpufreq synchronization between CPU hotplug and sysfs
> writes.
> 
> Two issues exist:
> 1. Background hotplug task keeps running after test completes, causing
> redundant CPU on/offline operations.
> 2. When cpufreq frequency setup is slow, the hotplug loop may exit
> before frequency updates finish, which breaks test purpose.
> 
> Introduce a file-based stop flag to control the infinite hotplug loop.
> After all cpufreq updates complete, create the stop flag file and
> wait for the hotplug task to exit.
> 
> This makes hotplug run only during cpufreq sysfs write test,
> align with test objective.
> 
> Signed-off-by: xiong yining <xiongyining1480@phytium.com.cn>
> ---
>  tools/testing/selftests/cpufreq/special-tests.sh | 12 +++++++++++-
>  1 file changed, 11 insertions(+), 1 deletion(-)

Acked-by: Viresh Kumar <viresh.kumar@linaro.org>

-- 
viresh
