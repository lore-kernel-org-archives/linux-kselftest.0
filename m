Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E5D271547EE;
	Wed, 21 Jan 2026 17:58:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769018332; cv=none; b=dGnu/6iW+wxCcsSS/Szgl0Y/px9tPsOPdEbTzHAZMwgQIvnsPTuPihy9O1ItJg+MgdowBoV/h6blyDHH62kA9sxfXIy4i+/NS2flIwQLWlKqecO35qnsSU9s8QxjivGBjbpmMJWu78i6LlhI1aBndlfd2MOQ4A1NLwsOOspFs8o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769018332; c=relaxed/simple;
	bh=5b6kmHZCjjKQcKzWTicDO9z/ypW8lleM50hvt2wZjQc=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=UvoUTHq7BmHx73LENAzB88a/YeTsHfuuwvVxDrfc5kI6+rfA9GgDmB4tdypza8LWfo2oAa0YCrFwyfLbiOenRYueMFbvDVCEZlxqJd0y+qgE8QvAM5w/ZCPoknwKbrjdxbDRaaw2tPHn1DogqZShSCXeXDDnezxYnrymckxzeSI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=PgcHdzLZ; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="PgcHdzLZ"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2655EC4CEF1;
	Wed, 21 Jan 2026 17:58:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1769018331;
	bh=5b6kmHZCjjKQcKzWTicDO9z/ypW8lleM50hvt2wZjQc=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=PgcHdzLZVkqK8sywTObVO7EcnqPzMhED/JVjbqzbABUPeNUQMK1lYPgoioXYkULD0
	 2KVM554HZ96Pa9PTIyKXrd1g9Xo424FbvCYcuvKMEsJh1hQsgZwPznG702pz/xwrX3
	 ZzEjwW5Uh4kMBpcWLuJOt3GPDtgLXtsk59EVzi7CDMqcC6M6Ybc7lnZ7TeYh9JfYuh
	 SsJLcXzVsmCPb9vIPWlSgVoBfUIEKmWSJVcU1BYXv7AsvA7cSpi3QSxTOlq6Mhlj6e
	 OtTPHbBKcEPA/jpMjhEwCZfGufud/jK7cVj3Zw5hs5dtODyYpxY3ysI6X37xPdoheU
	 YYDha8tFcBv3A==
Message-ID: <695c6cd7-b6b8-41fb-8922-7f227152db59@kernel.org>
Date: Wed, 21 Jan 2026 10:58:50 -0700
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2] selftests/pidfd: fix typo in comment
To: Ziyu Chen <chenziyu@uniontech.com>, Christian Brauner
 <brauner@kernel.org>, Shuah Khan <shuah@kernel.org>
Cc: linux-kernel@vger.kernel.org, linux-kselftest@vger.kernel.org,
 zhanjun@uniontech.com, niecheng1@uniontech.com, kernel@uniontech.com,
 Cryolitia PukNgae <cryolitia@uniontech.com>,
 Shuah Khan <skhan@linuxfoundation.org>
References: <20260121060333.4160937-1-chenziyu@uniontech.com>
 <20260121094147.4187337-1-chenziyu@uniontech.com>
Content-Language: en-US
From: Shuah <shuah@kernel.org>
In-Reply-To: <20260121094147.4187337-1-chenziyu@uniontech.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

On 1/21/26 02:41, Ziyu Chen wrote:
> Fix the typo "untill" → "until" in a comment in pidfd_info_test.c.
> 
> This typo is already listed in scripts/spelling.txt by commit
> 66b47b4a9dad ("checkpatch: look for common misspellings").
> 
> Suggested-by: Cryolitia PukNgae <cryolitia@uniontech.com>
> Signed-off-by: Ziyu Chen <chenziyu@uniontech.com>
> ---
> v2:
> - Fix unintended whitespace removal in the comment ("we're killed").
>   tools/testing/selftests/pidfd/pidfd_info_test.c | 2 +-
>   1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/tools/testing/selftests/pidfd/pidfd_info_test.c b/tools/testing/selftests/pidfd/pidfd_info_test.c
> index 6571e04acd88..8bed951e06a0 100644
> --- a/tools/testing/selftests/pidfd/pidfd_info_test.c
> +++ b/tools/testing/selftests/pidfd/pidfd_info_test.c
> @@ -229,7 +229,7 @@ static void *pidfd_info_pause_thread(void *arg)
>   
>   	close(ipc_socket);
>   
> -	/* Sleep untill we're killed. */
> +	/* Sleep until we're killed. */
>   	pause();
>   	return NULL;
>   }

Applied to linux-kselftest next for the next release

thanks,
-- Shuah
