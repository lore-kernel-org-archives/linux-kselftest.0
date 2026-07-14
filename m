Received: from fanzine2.igalia.com (fanzine2.igalia.com [213.97.179.56])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A6F362356BE;
	Tue, 14 Jul 2026 14:17:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.97.179.56
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784038630; cv=none; b=CMio8v2NMri5mWvSwfPAMXAT8z4jwbtsBGEu6A8D8MF4yt3Km1wxum5JDgAlayNP6KXWIAcq7KwCgSgxD52JG6tlJTc2QiatRO2mfmCWXdqJrkDR7J6IaszjECjr5nnV9GPYRYSRYFaYfZaWR01++a4m0uoCQ7+kwsRSsE/jOzE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784038630; c=relaxed/simple;
	bh=d6t1lluETEnkRBAnuUtRmpBg+OqjWzgr+JDC5n3f6A0=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=pmt5/xnA1KBWPe73aCYDmp0L2Oropu+/9WKto170XTe9qqsp7EdW75RJs5wUOJcfYCygwcCjRwy69oEJ/fjwnVKn/zG2FL6/tbRDzkaRBx+91f52rNgt1eMTyqSsnRtfRVL8XDIxg1rrSxhR0imCuh/XhYy1cFyQdDYRyVBjFeU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=igalia.com; spf=pass smtp.mailfrom=igalia.com; dkim=pass (2048-bit key) header.d=igalia.com header.i=@igalia.com header.b=W9thd32G; arc=none smtp.client-ip=213.97.179.56
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=igalia.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=igalia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=igalia.com header.i=@igalia.com header.b="W9thd32G"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=igalia.com;
	s=20170329; h=Content-Transfer-Encoding:Content-Type:From:Cc:To:Subject:
	MIME-Version:Date:Message-ID:From:Reply-To:Sender;
	bh=jlqbFRX2QtRy/R/bVMwA2K2CEG/Qm3mHU+wqHpVNcNY=; b=W9thd32GsjebQS8x9r/smkGKpV
	vtR1g3GG2WBPTEZ/OVZGpOktuF5NC6NvkE251TRtuv3HMfLAVUvPwcTs6Gj2FA626n/VBOLd1+TzX
	JWRT9kS+HZv8qIm3p+uDwxGJp4LLrRUC9sFPm2E7giSHOhmAeIQuUXGPTYASHWKQCVKxYNjxMVGaP
	tA/FZj+CNlG/tqLsehMcJdEqESER6jXsINHTP/ucGC1gKwWBYh5e0thLFK6nHb65FLJZyqiSuUnvh
	FyIVeUYSp3PAjAUR958TB6yF/gWrjYNDMEOdk/yYD5PRP6QeA/gmRXtNzMScBJx4ZCsOfMJ7Woiwx
	/awmHzLg==;
Received: from [191.19.134.91] (helo=[192.168.15.100])
	by fanzine2.igalia.com with esmtpsa 
	(Cipher TLS1.3:ECDHE_X25519__RSA_PSS_RSAE_SHA256__AES_128_GCM:128) (Exim)
	id 1wjdwG-00F1XL-Ta; Tue, 14 Jul 2026 16:16:49 +0200
Message-ID: <7a36edc2-c0a4-4220-b068-37cb36dddc7b@igalia.com>
Date: Tue, 14 Jul 2026 11:16:45 -0300
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] selftests/futex: Give circular-list nodes static storage
To: mileskrause5200@gmail.com
Cc: Thomas Gleixner <tglx@kernel.org>, Darren Hart <dvhart@infradead.org>,
 linux-kernel@vger.kernel.org, Davidlohr Bueso <dave@stgolabs.net>,
 Shuah Khan <shuah@kernel.org>, Peter Zijlstra <peterz@infradead.org>,
 linux-kselftest@vger.kernel.org, Ingo Molnar <mingo@redhat.com>
References: <20260711-futex-robust-list-static-nodes-v1-1-723754d75cf5@gmail.com>
Content-Language: en-US
From: =?UTF-8?Q?Andr=C3=A9_Almeida?= <andrealmeid@igalia.com>
In-Reply-To: <20260711-futex-robust-list-static-nodes-v1-1-723754d75cf5@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

Em 11/07/2026 23:47, Miles Krause via B4 Relay escreveu:
> From: Miles Krause <mileskrause5200@gmail.com>
> 
> The registered robust-list head has static storage but points at three
> automatic lock nodes. GCC warns about storing the address of a local
> variable in the static head when building the selftest with -Wall.
> 
> Give the nodes static storage as well. This keeps every object in the
> circular list alive through child exit without changing the list topology.
> 
> Signed-off-by: Miles Krause <mileskrause5200@gmail.com>
Reviewed-by: André Almeida <andrealmeid@igalia.com>
