Received: from fanzine2.igalia.com (fanzine2.igalia.com [213.97.179.56])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 76E5C313E2B;
	Mon,  3 Aug 2026 14:54:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.97.179.56
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785768868; cv=none; b=IXbtRhEnJ8qWzUpCSWzZaAP+mePN8lGtV3xixI5y8jQE7Qsy+BhOgpiv4EOU2GfODN4KWlAS+Tuvn/VJ5L+dWpJqGvRnukmmJwGBDa6jBCgQDZNLcaupBPdjo79JQ5wsiUKdLoEne2ktc82ysq9gp7XMGIVuKwh/F+CQGVkIOkY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785768868; c=relaxed/simple;
	bh=MF3pUVHvS2uUwugPLEnxaA+7Kbc2Fixoh8qSuGZAkNs=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=P2ASR/Nfgf4803v+1jdd7CYmab+uWGaQwcjOgDlvmobbpVInmtEYYKMwvmQTf4Cav5Rijzw1y9kKU7DuP7lvbgdT4mBZg14dg/LI6BDVbZymPjBQUsw9Qq45VD8S5s4ZFBq2oAhsD/p6lZEUrxmqElqltFZmmY5eX64apCmi4jY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=igalia.com; spf=pass smtp.mailfrom=igalia.com; dkim=pass (2048-bit key) header.d=igalia.com header.i=@igalia.com header.b=TCGBFwa9; arc=none smtp.client-ip=213.97.179.56
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=igalia.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=igalia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=igalia.com header.i=@igalia.com header.b="TCGBFwa9"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=igalia.com;
	s=20170329; h=Content-Transfer-Encoding:Content-Type:From:Cc:To:Subject:
	MIME-Version:Date:Message-ID:From:Reply-To;
	bh=/W4nXDTylJJJpcuczf2s6oE9MKjDhSlA44aTptm8iI0=; b=TCGBFwa9omMYzlwAWYI6a0c5Lw
	Vo0LJg/nr/UN9FqqS59W4TZhmOfZIfs3cDAVLPrTmu7lfIqhAfKfEQIops34OmWxHfplXWLJvAxKj
	Gu6GDcegDhAav5xeVrblQ02IKA5dxZfWh2Dk77ozswXWtImD9SuTdKAg8WoLRiQadIogF72G/Fm99
	cqMEHW/W1m2PzSACiaVRe1w5lYTBgeXWpPAwsT9Lc+MsuDpxvghgyiLdHfQQHt+yTPiywwXS7OiDT
	L6KAvn6FMdYn6RlU2l5NXtxtG9HJDH9zOTnUq9JNfSA9SyygAI3qvz9C8OtSu/EdXx2EWSWKCWRtr
	wrMGju/A==;
Received: from [179.118.190.213] (helo=[192.168.15.100])
	by fanzine2.igalia.com with esmtpsa 
	(Cipher TLS1.3:ECDHE_X25519__RSA_PSS_RSAE_SHA256__AES_128_GCM:128) (Exim)
	id 1wqu3R-00D0zQ-Ba; Mon, 03 Aug 2026 16:54:13 +0200
Message-ID: <ad4a52c4-3cef-4544-acd5-f93710886216@igalia.com>
Date: Mon, 3 Aug 2026 11:54:11 -0300
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] selftests/futex: Correct pthread_create return value
 check
To: Lei Zhu <zhulei_szu@163.com>
Cc: linux-kernel@vger.kernel.org, mingo@redhat.com,
 linux-kselftest@vger.kernel.org, peterz@infradead.org, tglx@kernel.org,
 dvhart@infradead.org, shuah@kernel.org, dave@stgolabs.net
References: <20260727030832.118316-1-zhulei_szu@163.com>
Content-Language: en-US
From: =?UTF-8?Q?Andr=C3=A9_Almeida?= <andrealmeid@igalia.com>
In-Reply-To: <20260727030832.118316-1-zhulei_szu@163.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

Em 27/07/2026 00:08, Lei Zhu escreveu:
> From: Lei Zhu <zhulei@kylinos.cn>
> 
> The pthread_create() functions returns 0 on success and a positive value on
> failure. Modify the return value check to correctly detect failure cases.
> 
> Fixes: 14d016bd7282 ("selftests/futex: Refactor futex_wait_private_mapped_file with kselftest_harness.h")
> Signed-off-by: Lei Zhu <zhulei@kylinos.cn>
Reviewed-by: André Almeida <andrealmeid@igalia.com>
