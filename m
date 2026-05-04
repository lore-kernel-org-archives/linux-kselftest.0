Received: from mail-oa1-f46.google.com (mail-oa1-f46.google.com [209.85.160.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5005132D438
	for <linux-kselftest@vger.kernel.org>; Mon,  4 May 2026 20:58:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.160.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777928312; cv=none; b=WvLknMr6J7iyukiNkqoakcAQNnONZ4vTNJJITY+u2QEIGwqLaIN0kRPzwx4GP/alV5O9pl9xtYqRwVTJ82n+EZy9WaeO7Hq2GA2zUAoCQ8RoqlJXJfo1rqmsruEzhmg5gW9gESC3mIwN3xJA/OaDWLHJBI1GnAE2OEN1yoew2P8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777928312; c=relaxed/simple;
	bh=AnHqmTk7h+qZbfpUtv/6QvkRxKkNv38kGyl2d1Y1klo=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=DUAWuImivCdnKsYd8t/i0NiJh9MGDCqgRtYvTRfXKCrqDhNX7kzjPivvawcq5H0G7tQjjcAibAxQMTuiaRBUGcOO92FU2820EGODcSfHL3Khgzrk5pyBGJ9ImA3N7k+wkWj7NFHEXOJABneunyPOEJmZCRnDKhSm3x9PY5+yBVI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linuxfoundation.org; spf=pass smtp.mailfrom=linuxfoundation.org; dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b=CIfgjEuW; arc=none smtp.client-ip=209.85.160.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linuxfoundation.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linuxfoundation.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b="CIfgjEuW"
Received: by mail-oa1-f46.google.com with SMTP id 586e51a60fabf-42fdab683b7so2385667fac.3
        for <linux-kselftest@vger.kernel.org>; Mon, 04 May 2026 13:58:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google; t=1777928308; x=1778533108; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=0amaTMBgDEgs3tF4RCm1e9Dle/WjpaIw0roTFTHbcEU=;
        b=CIfgjEuWFXT2dSbfPdLSygsJ1jexgKi2KKMddjnqAn9oA6KqvICrx/50cpA6l8Cgbp
         BvIQKVLfJgKfURSIkO9tlO6DZHBKsJ/iuMQ4cLFsh5bzIfLNRJdzrdA1FVNRyCZBPWYu
         lzD+ex9/GsrtRnyjrgHIufY42K/K+Gp9ue+gI=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777928308; x=1778533108;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=0amaTMBgDEgs3tF4RCm1e9Dle/WjpaIw0roTFTHbcEU=;
        b=DWEcP0HByqJfQjOTOpuLHpCDoBSjjMWQGXcgTDrb8Jytcmsa3o3AGyToZpQx77O3t+
         zv11nRSLsojsS34LcbkLQp9eJ7p0W3ITBQRzQPuYwqBdvLDzu7duYoIaIF2lpE2heiUg
         GXdLj3rT4uJ8bhhb4CRnjwRfPN2s3OxN229q1p7fOA8scrhsRsXCZshrK0Y9NMts5Hx7
         /rdPXY2kGlAZKBVjNk9SHZRvRABCOmCXEXuqL3UTm/A8sJE46RrTa2sfEGa7VMzKcMna
         ySEXPb7GRH7lKtmk7546FPO/M9GCF661PZUshiJUbkwUrRokHpFybUbUXiTf9Pi1gkmc
         F1LQ==
X-Gm-Message-State: AOJu0Ywzws6YTbJNPoKQdUYYu16Ht+zvVvXKNZ2cgK9Ckhdu/rKy8/tz
	5nbur67eAU+yVusYQAiai8OV8bTnrggzQA18N0AGPmTirtupMtLxbVR3e3jWSE8+uR3ikRmJiAZ
	UWw74
X-Gm-Gg: AeBDievd7nZLMfkU1HYCR6hBkhjir4caQ/nZ7LJk+MDIQmixbTEwKrdtuqoaxL0AQpR
	48IRiKyhRWjTL2guWQeYVmkpUFoFmIic9wzAW0TPLn+H8qngT1WLK/JIOOvZFkO3VFCTQ+J5UOt
	r5V4KXYveS3xX9XzshIA6NQB35etobr6+vUmivbVErLkjYH294BwwstnBT09DEgIY/JG75d0cHR
	0gK4hTAcezu0X/GhgKNJ3cDrqAltKPrcLRVmdxbaQ85BwkBAWV0f90vspWOPkywkQ/praVD1x7m
	OGoMpRmW2idl0M/XCEkhcjGEAhC++4pHD46kKkS7fxKjKakC1sMNwbXWnc53G/z9EISF0yZ/jAO
	qYU52FN4HBwkyU+EoSWib21WiDHGiFkRUszY9DzBdBZvIQVz+Av2B2TlSOqH7RPLZxzepwCgjtW
	7JZXhDk4XZeqdGLAexclhLuX7Pr6EhoqA7Mc6kT/4n6w==
X-Received: by 2002:a05:6870:1776:b0:42c:ecc9:58b3 with SMTP id 586e51a60fabf-434760613c0mr6278794fac.10.1777928308251;
        Mon, 04 May 2026 13:58:28 -0700 (PDT)
Received: from [192.168.1.14] ([38.15.57.99])
        by smtp.gmail.com with ESMTPSA id 586e51a60fabf-43454cbbbd7sm10977170fac.10.2026.05.04.13.58.27
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 04 May 2026 13:58:27 -0700 (PDT)
Message-ID: <444d823c-40d0-4c14-ac8e-4f810a5a2f04@linuxfoundation.org>
Date: Mon, 4 May 2026 14:58:27 -0600
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] docs: kselftest: Document the FORCE_TARGETS build
 variable
To: =?UTF-8?Q?Ricardo_B=2E_Marli=C3=A8re?= <rbm@suse.com>,
 Shuah Khan <shuah@kernel.org>, Jonathan Corbet <corbet@lwn.net>
Cc: linux-kselftest@vger.kernel.org, workflows@vger.kernel.org,
 linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org,
 Shuah Khan <skhan@linuxfoundation.org>
References: <20260417-selftests-docs-v1-1-32e4a78214eb@suse.com>
Content-Language: en-US
From: Shuah Khan <skhan@linuxfoundation.org>
In-Reply-To: <20260417-selftests-docs-v1-1-32e4a78214eb@suse.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

On 4/17/26 11:36, Ricardo B. Marlière wrote:
> FORCE_TARGETS has been part of the kselftest build system for
> some time but is absent from the developer documentation. Without
> an entry here, users relying on kselftest in CI pipelines would
> have to read the selftests Makefile directly to discover the
> option.
> 
> A build that exits zero despite some targets failing can mask
> real breakage and mislead automated systems into reporting
> success. Add a dedicated section so that CI authors can easily
> find and adopt FORCE_TARGETS=1 to turn such silent partial
> failures into hard errors.
> 
> Signed-off-by: Ricardo B. Marlière <rbm@suse.com>
> ---
>
Thanks Ricardo. I applied it to linux-kselftest next branch.

thanks,
-- Shuah
