Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.171
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794893405;
	b=Hgqp1ZSeMCgwzyiSgIq4U2IrFApdTDJyl7C/aYGNeDUfBuh5xneLCmZ3yRp0yTZtAgJg
	 gOFXPcNnaSVRK/qFpJXIlrGJ6FAYOTVLffTRa4mrKVzBVVK27HsNFETymOuDbkmhB7B7K
	 wcYdXG0bMjpCHJ3n8X+6eJUL1nCbAEfSijnZDj7LVLxQTWUlN82f3cAP0mhTLXwhur3fx
	 Yy0beRSoTZzOdN0wywdQwe7C82ucY470yettlF293f8p1JcffMbRiNG3P7xk0ruVuDEDy
	 iS4BQecvlM59w2XDD/VnHc7f4IhO11kFq1/MbnRfERy+FELWSvpwnnB61tn+gStObQA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794893405;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To;
	bh=ftrMizvuhIHObTCvAdpIahRgmk2EwZxg4CfQaHM/YjU=;
	b=0nwV0MkTCQp4SLZ6y3o4YmJncnW3ra0uSUP0kMPA5TV1a8Q1kc/73dTAAZlPpXP8eezy
	 Ye2aiSJUtrTV7kOk4nM7Y4Xx52fGOEsVEs/y9Pzo0rn8+/RqIkjTaIjZFQeIAg4sSdLSb
	 QzwNpzIavjE/uKIRPSeLRWS+/qmzdUYFj3YZLxidtkf4wvk5Xsd3qEbgyHN8v7yTkClvb
	 Fu8lb4Ju07cxtwwkywDclTH19gZeYjB3xIes2Nb3hdnw1fVrUC7svIu7IRQRpstbRkeXj
	 JVdINrxqMCCQhH64vnBKMX1G3Qnn7RWjd9eYGLgsXJzcU9WYQ0lVktMQBvcVpGKOdIA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=linaro.org;
	spf=pass smtp.mailfrom=linaro.org;
	dkim=pass header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=Jx5pGRxE;
	arc=none smtp.remote-ip=74.125.82.171
Received: from mail-dy1-f171.google.com (mail-dy1-f171.google.com [74.125.82.171])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0A28A606A330
	for <linux-kselftest@vger.kernel.org>; Tue, 17 Nov 2026 05:30:04 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 0A28A606A330
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=Jx5pGRxE
Received: by mail-dy1-f171.google.com with SMTP id 5a478bee46e88-37071c0f42aso6311087eec.0
        for <linux-kselftest@vger.kernel.org>; Mon, 16 Nov 2026 21:30:04 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1794893404; x=1795498204; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=ftrMizvuhIHObTCvAdpIahRgmk2EwZxg4CfQaHM/YjU=;
        b=Jx5pGRxEn/r5S4/3N0yhzLTza9aPjKIstDeFKgSij5nK+aSlmAC86wdabmnPytAen/
         kxVwbjGlPYVnJBopzfjTvdRf0AGe/mTwz9tkopS2yB958I883j92ZadhqHMX4+Yjexf2
         Vz0NXVbpAR1i7P8EAYmA6xDiuz+JVh2Zj1v4OF/C6tf2VYGfjVaVcAQaqwWBIv3rWwOq
         qebu8KuRr+cQ/mJQ9ETfZXkafs/HTLzQDS1LwuJsLZsxEq8T1xRUxCWCEZ+3Y9Or1I7t
         cPXn2Y4iVfSC6C0gTujGvgEaJr1XTp2sFgNww6DJ5dtiHVV8biEK8U9cXdxZb8dZwAJr
         WsqQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794893404; x=1795498204;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=ftrMizvuhIHObTCvAdpIahRgmk2EwZxg4CfQaHM/YjU=;
        b=Vzza0JPQnBZRGwhawbbDUWjwSUVm1wd0iWUIVf+J2fSXe07/7vtfB2BNc0TqcV3uUA
         GroDbyE9+5WbQqOwzKP/ptMcXqjOuBTwBINVaWoHvDHlAG1BqSmhUkeKuJZRv6J7yI35
         fFMXK+FUKEBjnFB2s2fdRu4XMAYY+MHbvkcDK0l93WvXXxyXEiDHOPEeJ3xG6trdcdtM
         ARjCWJiOXabEl1sKeB/JmSlHLC6VHZ6ScEx/7A/LRcWxbA8c1rrjNXqVwc24Ihz8DPBo
         2orQMZu5eYYgmXlhBWalpIaajB0kSHG9qrUhIpEG3YcoPuJ4ZeoRXkGwCUmYhn0aXxh/
         JadA==
X-Forwarded-Encrypted: i=1; AL+hErF70XIpYkJ3rcrjh2EEYG2yaA1p8y5VvkWKOhMtsJDIuuY3izAl4D/Hb35vOcmAePtrLALQFjQQ06fcEBthuOE=@vger.kernel.org
X-Gm-Message-State: APuU4Z8TVSQ3VmUI9Y+vXNf+bOXQH+dT74PAP1UEW/5o1eTXCKdJ5neN
	5nSrMlR5WfNGpGE+pYyO6fDCp2ng0lNYLiv9hJyRBaGp6EIHjA1aHkutr2r4D55MrJ+S05CfhQy
	qWoch
X-Gm-Gg: AYBFou2OICDm5RY52vGw1QOe8J+1HXUjrQs6OqzmcHBsORRLLvjA1W70XEfn9dus1Ix
	cpLXiMiou9s2CAzSVLnAeGzsDh7zEjF0ZdbxRGXDkq6gDFkl3Htgux0gWK8GqVcEolhfZnpcoVH
	8PNQpO1JdGxhHCaidbELD4rS9HIYEdZFSXBLLs6k93Ra/Ew8S+8Z0ZF2duXd5cDIRIqxB47P9YP
	YRim1Gvng+KU0UsYEBWFLef8Yb8OMcpvb6jITY4i31kMkHfw7fax8oryzjSt/qtsZtaoQV62rA4
	RgZgX9yq18o8OUJoNZRMQ/lF+NnU/1irD/tHJqYkjTbloDUqW54QeQzLBayxQMuPfX7VWkddfsJ
	p2/frxMRwo4JluZfQaif255I6gLJ449S1pQ75y1zwkwbMtFkqdpKPUc2iGwDvaDyuQdIozZXJCD
	A1uR3DRAQTy4S+YxrrggoxXczDxMUPy+7204LvMg9QbCnPDICYdHlpdb6o/mQVEdE/ggsWXdMVv
	WsBYt25I1d/If6agPupUyuZuYDtpaYxlq05WuwzzHgycv0ybvackJLlKWdIfftIiFGBPuMoIKzW
	sfsfXv7Sx5FHkXOXnHbg9Q1DwWn1LA==
X-Received: by 2002:a05:7300:e9ce:10b0:368:7c2d:a612 with SMTP id 5a478bee46e88-37966c4738fmr12899653eec.10.1794893403702;
        Mon, 16 Nov 2026 21:30:03 -0800 (PST)
Received: from localhost ([122.172.83.36])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-379563df84fsm77630203eec.20.2026.11.16.21.30.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 16 Nov 2026 21:30:02 -0800 (PST)
Date: Tue, 17 Nov 2026 11:00:00 +0530
From: Viresh Kumar <viresh.kumar@linaro.org>
To: Gyokhan Kochmarla <gyokhan@amazon.de>
Cc: Shuah Khan <shuah@kernel.org>, "Rafael J . Wysocki" <rafael@kernel.org>,
	linux-kselftest@vger.kernel.org, linux-pm@vger.kernel.org,
	linux-kernel@vger.kernel.org, stable@vger.kernel.org
Subject: Re: [PATCH] selftests: cpufreq: Disable the runner timeout
Message-ID: <avvmWA6YX2I-ovJy@vireshk-B250M-D3H>
References: <20261113163951.1510082-1-gyokhan@amazon.de>
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Post: <mailto:linux-kselftest@vger.kernel.org>
List-Help: <mailto:linux-kselftest+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kselftest+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20261113163951.1510082-1-gyokhan@amazon.de>

On 13-11-26, 16:39, Gyokhan Kochmarla wrote:
> cpufreq_basic_tests() reads and writes every policy file, offlines and
> onlines every non-boot CPU five times, and then shuffles all
> frequencies and governors of every policy. The amount of work scales
> with the number of CPUs, but the test runs under the default 45 second
> kselftest timeout.
> 
> On large systems the hotplug loop alone does not fit. On a 256 CPU x86
> machine each offline/online pair takes about 0.5 seconds, so the
> reboot_cpus 5 step needs more than 10 minutes. Even with the timeout
> raised to 180 seconds it is killed in the second of the five loops,
> and the frequency and governor tests never run:
> 
>   not ok 1 selftests: cpufreq: main.sh # TIMEOUT 180 seconds
> 
> A larger fixed value would only move the problem to the next bigger
> machine. The basic test has a fixed number of iterations and does not
> wait on external events, so disable the timeout with timeout=0, as
> ftrace, timers and net/forwarding already do.
> 
> Fixes: 852c8cbf34d3 ("selftests/kselftest/runner.sh: Add 45 second timeout per test")
> Cc: stable@vger.kernel.org
> Signed-off-by: Gyokhan Kochmarla <gyokhan@amazon.de>
> ---
>  tools/testing/selftests/cpufreq/settings | 5 +++++
>  1 file changed, 5 insertions(+)
>  create mode 100644 tools/testing/selftests/cpufreq/settings
> 
> diff --git a/tools/testing/selftests/cpufreq/settings b/tools/testing/selftests/cpufreq/settings
> new file mode 100644
> index 000000000000..d3e07370a7e4
> --- /dev/null
> +++ b/tools/testing/selftests/cpufreq/settings
> @@ -0,0 +1,5 @@
> +# The basic test hotplugs every non-boot CPU five times and then walks
> +# all frequencies and governors of every policy, so its runtime grows
> +# with the number of CPUs. No fixed timeout fits every machine, and the
> +# test always terminates on its own, so disable the runner timeout.
> +timeout=0

Acked-by: Viresh Kumar <viresh.kumar@linaro.org>

-- 
viresh
