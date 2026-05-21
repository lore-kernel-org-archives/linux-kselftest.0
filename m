Received: from out-186.mta1.migadu.com (out-186.mta1.migadu.com [95.215.58.186])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BEAA33AA195
	for <linux-kselftest@vger.kernel.org>; Thu, 21 May 2026 10:58:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=95.215.58.186
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779361088; cv=none; b=hRaqHWa1G7BVAEEguhmeSZftbtXpyqKazSFpLPr5XqcRM5CNeSxYPZkegGf7NUWdR+VQTqoDSMrJ1Ka+RhWc8GXYuSDmEnCfnBxfB9fDwmSTbFoN+T92kqCt0cPiGNsGxUCiPaTChLx7y3aEnT4u5nsxr3HjO63N4/7Rf46J8d8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779361088; c=relaxed/simple;
	bh=fh+GUaxsgqLWS6ryQDsMxL9t3QlgJryYzSiMvwNgTI8=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=U9uq1iPzP6gZoHm9x1rZp1afiJsOcSAF4oRrBWa9wcFH54F5lxK17Ja4cU9ON3x5IoJf52J6EatUbtSevgbpqCOZWrMJV/S98hMMqMoO1s3+E9gIXbwpy5GiffkGElA6gBXXFPh7kXyrs7W7l7Zsuhp7WxXjhwJhacrxML2+Eeo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev; spf=pass smtp.mailfrom=linux.dev; dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b=aQqOxkaF; arc=none smtp.client-ip=95.215.58.186
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b="aQqOxkaF"
Message-ID: <5978f34d-dbcf-4196-8a95-13165a5ba034@linux.dev>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.dev; s=key1;
	t=1779361074;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=uZNzMc5nC0pYCsQzpVY1yiRB0QD6dbT5pt1SyEwFs/A=;
	b=aQqOxkaFXfvIEAVrIYSsLChxrwpQV7FLwVjCI3ThPHXtIpCXTsS+coildE7bmWv3UGDE3I
	uHZXu0mEitZxahUuHQ7LiUKrXrqMSw33j9CoKAtUW3wezCxBvKGGJfiwZeUnIEJIqyJCNp
	yccULdsT72cxXKcuHCcf+pr2hsXudWk=
Date: Thu, 21 May 2026 18:57:32 +0800
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Subject: Re: [PATCH net-next] selftests: tls: use ASSERT_GE in test_mutliproc
To: Geliang Tang <geliang@kernel.org>,
 John Fastabend <john.fastabend@gmail.com>, Jakub Kicinski <kuba@kernel.org>,
 Sabrina Dubroca <sd@queasysnail.net>, "David S. Miller"
 <davem@davemloft.net>, Eric Dumazet <edumazet@google.com>,
 Paolo Abeni <pabeni@redhat.com>, Simon Horman <horms@kernel.org>,
 Shuah Khan <shuah@kernel.org>
Cc: Geliang Tang <tanggeliang@kylinos.cn>, netdev@vger.kernel.org,
 linux-kselftest@vger.kernel.org
References: <0ee9f412b6bd1a260a547d19f979f73b396746ac.1779354585.git.tanggeliang@kylinos.cn>
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
From: Jiayuan Chen <jiayuan.chen@linux.dev>
In-Reply-To: <0ee9f412b6bd1a260a547d19f979f73b396746ac.1779354585.git.tanggeliang@kylinos.cn>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Migadu-Flow: FLOW_OUT


On 5/21/26 5:11 PM, Geliang Tang wrote:
> From: Geliang Tang <tanggeliang@kylinos.cn>
>
> In test_mutliproc(), when send() or recv() returns an error (e.g.,
> -1), the test continues to execute the remaining code and fails
> repeatedly due to using EXPECT_GE.
>
> For example, if a TLS connection is broken and recv() returns -1,
> EXPECT_GE(res, 0) records a failure but does not stop the test.
> The test then proceeds with left -= res (where res = -1), causing
> left to increase unexpectedly, and the loop continues indefinitely.
>
> This results in a massive number of identical failure messages:
>
>   # tls.c:1686:mutliproc_sendpage_writers:Expected res (-1) >= 0 (0)
>   # tls.c:1686:mutliproc_sendpage_writers:Expected res (-1) >= 0 (0)
>   ... (hundreds of identical failures)

I think it’s worth backporting, so a Fixes tag is necessary.


> Fix this by replacing EXPECT_GE with ASSERT_GE. When send() or recv()
> fails, ASSERT_GE immediately aborts the current test, preventing
> the subsequent undefined behavior and endless failure messages.
>
> Signed-off-by: Geliang Tang <tanggeliang@kylinos.cn>
> ---
>   tools/testing/selftests/net/tls.c | 4 ++--
>   1 file changed, 2 insertions(+), 2 deletions(-)
>
> diff --git a/tools/testing/selftests/net/tls.c b/tools/testing/selftests/net/tls.c
> index 30a236b8e9f7..9b9a3cb2700d 100644
> --- a/tools/testing/selftests/net/tls.c
> +++ b/tools/testing/selftests/net/tls.c
> @@ -1549,7 +1549,7 @@ test_mutliproc(struct __test_metadata *_metadata, struct _test_data_tls *self,
>   			res = recv(self->cfd, rb,
>   				   left > sizeof(rb) ? sizeof(rb) : left, 0);
>   
> -			EXPECT_GE(res, 0);
> +			ASSERT_GE(res, 0);
>   			left -= res;
>   		}
>   	} else {
> @@ -1566,7 +1566,7 @@ test_mutliproc(struct __test_metadata *_metadata, struct _test_data_tls *self,
>   				res = send(self->fd, buf,
>   					   left > file_sz ? file_sz : left, 0);
>   
> -			EXPECT_GE(res, 0);
> +			ASSERT_GE(res, 0);
>   			left -= res;
>   		}
>   	}
