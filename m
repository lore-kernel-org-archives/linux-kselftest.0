Received: from fanzine2.igalia.com (fanzine2.igalia.com [213.97.179.56])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0CCB91A681C;
	Tue, 22 Sep 2026 20:06:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.97.179.56
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790107607; cv=none; b=YAlII7svyIawxcLLIUAFPcckunkoHEHXIUzS5IaYObKvtxXwEnc+5s31Ugia8jlar/gaL7lPsDpUHiEl2KbECFZt5KPnMNZS0Q6lH4htRbwv3/ny8vKrb3aSvGl7MppoAHVSEmkxtmjR/FTjZpjXLVXyUgKzOekfhqFSpDktCKA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790107607; c=relaxed/simple;
	bh=D4UxEF6/pvKbyoQO1fYCbIVR5As5fVqIzlmZXh/IHcI=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=AItqIcd1rJplnFwC9YbnKllYWjPwIFvDzknDg2p499Ob6anHQfmSIy2Asv5IdaavtpN57RfB55PnwfSfWB04ceJiohksJDP6gRvtshF654tsVvQcLUZNaJ7BrcG8/t90uRFZlcQpl9GYUNWEm8GkZiYDg4z36nCO7xDbnruO1i0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=igalia.com; spf=pass smtp.mailfrom=igalia.com; dkim=pass (2048-bit key) header.d=igalia.com header.i=@igalia.com header.b=ZQB8SOEX; arc=none smtp.client-ip=213.97.179.56
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=igalia.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=igalia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=igalia.com header.i=@igalia.com header.b="ZQB8SOEX"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=igalia.com;
	s=20170329; h=Content-Transfer-Encoding:Content-Type:From:Cc:To:Subject:
	MIME-Version:Date:Message-ID:From:Reply-To;
	bh=07RPrSeFJye88nWliAW6Te99gLBcKf4wUCeJdoVqqoI=; b=ZQB8SOEXHuP49ApyZd/V7138CN
	IZCM07ptKitEHInoRWMVMOfCWnHU1e9KhJoQqRj2z9lMK1H4ZtA+yogxevPjeIgqLqWp9cDFUpogX
	up4fGViAn58WZECsfmZE1cYBWZFNPoGJk2MPLTf8VlSJVtNY2y3FU1gM6elLisC/GVEl06EW43Zmq
	BTt1Kpl1Cmk1QOdZ36//1jgnWgNjr7wbTq58F8JjRSHfx3m6/uaLj1NjBDHo+5aBGODVIHY4HqGMW
	yBAqBcrLOF9vHLcQCLeRcUQsMJicZj5m3j/J/2uM6KDb3tQqYvGjf/LVfBXPq7Tu2ro6ig9aifczN
	iqWfIn6Q==;
Received: from [177.172.123.214] (helo=[192.168.15.100])
	by fanzine2.igalia.com with esmtpsa 
	(Cipher TLS1.3:ECDHE_X25519__RSA_PSS_RSAE_SHA256__AES_128_GCM:128) (Exim)
	id 1x96kr-005nuS-8g; Tue, 22 Sep 2026 22:06:17 +0200
Message-ID: <dfb3afb2-cec0-42e0-8e5d-25e89f54215b@igalia.com>
Date: Tue, 22 Sep 2026 17:06:17 -0300
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] selftests: kselftest: Fix debug message formatting
To: ZhuangZhuang Wang <wzz_123123@163.com>
Cc: Thomas Gleixner <tglx@linutronix.de>, Shuah Khan <shuah@kernel.org>,
 linux-kselftest@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20260916190423.1892-1-wzz_123123@163.com>
Content-Language: en-US
From: =?UTF-8?Q?Andr=C3=A9_Almeida?= <andrealmeid@igalia.com>
In-Reply-To: <20260916190423.1892-1-wzz_123123@163.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

Em 16/09/2026 16:04, ZhuangZhuang Wang escreveu:
> ksft_print_dbg_msg() passes a va_list to ksft_print_msg() as a regular
> variadic argument. As a result, format specifiers consume the va_list
> representation instead of the caller's arguments and print garbage.
> 
> Add a va_list-based helper and use it from both message printing
> functions. Also annotate ksft_print_dbg_msg() so the compiler can check
> its format arguments.
> 
> Fixes: f2662ec26b26 ("selftests: kselftest: Create ksft_print_dbg_msg()")
> Signed-off-by: ZhuangZhuang Wang <wzz_123123@163.com>

Reviewed-by: André Almeida <andrealmeid@igalia.com>
