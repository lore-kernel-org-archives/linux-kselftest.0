Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.44
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793737897;
	b=ldlEA6O3gyZevlmY9QYIioOKI5phvbBQhSRbduEESG9hcXsmsFdb6GyJjY364Mv9slSF
	 mUkU+/lmst1ADD/9nILNXHiYPPDO58ueaSYWLj4sP77IEpCfpdU848+Z1We85mxeXIUXM
	 +sogMpK2+68aQkuJxVP+dfQSOLuggfirsD7zeIwdFBQ95traGzVgTQIE9MtIHU8/V0gQZ
	 mDe2NxJKMhEwHRrvZtZ2mvRxJcxoLqwzVRfptUd7reyT5Fr2LZmXrVigWNDeDAMeNMWqB
	 rHxtAuhtVVAJLpwPTt5PAKG15+Pyd7jMoojDhn3QUYphISomzIGv/XOUBgrCJ3vgmxg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793737897;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:Content-Transfer-Encoding:
	 In-Reply-To;
	bh=yH/XRG7heWWZ+jvry39cY9jHOPmxtv5uOcm4fDn0jL8=;
	b=ZD/ZLnnX7C5vpoYAjgGsVpF9v7W2n4Jc0jeU3RYTk7bG/K7yJrHMAKPxsvxqo9OuEnkJ
	 bx+RmbtXC03ZDg6SQOKv1SzR/TnbyDam7JowbWKvhQ4gBqn4AkmTh3s7albOqz13kRHug
	 FkFPjYCLOnbGnsa3eNm8UMFcbPKAZ15bakmqiRf9AgVVoa6FPz0ssiWL0/gqphf1kuCmW
	 j55Rq1fvabCy6LSWl0YB3Mh4YAve33AGSF0PfYzx/DH9Dr5imMqOacCgrN0ZLmJ7ETK0g
	 EzpIDpxk4fbakBW7DOdkrcT/YEf0rlO6zrcdBUP9CsRnYu1LmDRNZ56zojQ7NgeaLXw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=RFz8Yp7u;
	arc=none smtp.remote-ip=209.85.128.44
Received: from mail-wm1-f44.google.com (mail-wm1-f44.google.com [209.85.128.44])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8BFA1606A326
	for <linux-kselftest@vger.kernel.org>; Tue,  3 Nov 2026 20:31:37 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 8BFA1606A326
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=RFz8Yp7u
Received: by mail-wm1-f44.google.com with SMTP id 5b1f17b1804b1-4a4d7ae1ae9so45936865e9.1
        for <linux-kselftest@vger.kernel.org>; Tue, 03 Nov 2026 12:31:37 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793737896; x=1794342696; darn=vger.kernel.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :content-type:mime-version:references:message-id:subject:cc:to:from
         :date:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=yH/XRG7heWWZ+jvry39cY9jHOPmxtv5uOcm4fDn0jL8=;
        b=RFz8Yp7uY0eJxd+1QzwiZ7WVFvlDvKXPH/KU7OnSu4C4lVInrMJDIUgw+t6NS3QwWN
         51a1+V0XGOm2kfNpKTsIFbU7XtCaiaeVNmEhgFeFb1/CrgAAdjx6RnrCKSI/GQcbxXIj
         zk4oXe/ZcmhoB/9RZoXaMLelwk9hUZc0kCiiJoa4eh/Mo95xbaQlqYkyTUWpyU5DunS8
         /Rk43e8dBuiwCxXMo+YKIA/4tuqPntQC4r09s1wi8SZN3fTyOhCC4XzaoNcMkwT97oky
         TyvMinMrf3bhPU4GoPScWDTt5Yyl27cvFCNI9OWgSMUN/ce15ceTsoEM8yVAia/L78Wh
         u65w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793737896; x=1794342696;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :content-type:mime-version:references:message-id:subject:cc:to:from
         :date:x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=yH/XRG7heWWZ+jvry39cY9jHOPmxtv5uOcm4fDn0jL8=;
        b=LKCzqTJFtMiApTDf9Bj87HSFCKbRdUUwMiIWF4iNXHxbNh9CCesTeS03kLcXCrfCc9
         ijCbwgUid2tAcwgIFzBfB4VC8LFpCRXM0g77gB6Fa4luRyIk1ozzQ2WEyk7zVchMoFqS
         w/N+CTADuo4jHD4U5EXLU+za43hd0JU7x4YX+9dzmE8hYWwXOMhfc2v1z+RX+GwWpVjA
         n/39AaiBcPsIT4M5XEPrTgehaxLwN49xG3465S8b0tR1ZklwfswHRY1YBIG3FglA7lk3
         Xw6X5cgs0itQVNKtVl2C2EaJ6bIw0eKyEfRRNgJwsFlKagXvzMwfSEsQiROe4om29r9V
         +Tpg==
X-Forwarded-Encrypted: i=1; AKwUvBwxV9j0MZG8dlKmWVbziZlyYYYDvaSTpPgE5qvJ73spClIshxkvYUr3YSva1sSzBIEArHaf4tfPfUEQ0+EuvGk=@vger.kernel.org
X-Gm-Message-State: APuU4Z/mhjTT81N7Py56iciyp1kbs9Sz+Pg0FXmn6vYTG2M8C5074SWI
	bp0T64xw2dufWKWFOkExQZycWFzg96pQCfM3SBnsem6d591o0Z7Gx6uPTmAEYvkx
X-Gm-Gg: AYBFou1saXjqf0Y56ofatrTVCsJxv7bBAnlHPZNuOt8Oc0RX6tNG6utSKWtcEsHasPa
	FhXPwk4FEGTui1AkZcCjXATCVM6vpweSYKqO6q96hwgleTM8scU+/Jwo/QCG2ub0LxiemgQaCZq
	b/0vLSgsQMamevVEmgafuZO/HBk/J3M9A/KaqZ8kuZW4zms3qh1ycPltK+KPvhq3iCIDKKvAz9Y
	ctlcEuh9eyaxDrYlJ9JSsXHNzmPuegd3RDNMs0kioxg/xXdM/cel1SmoAfgZOkjqZRb8b5ULTPl
	ld6Q2Sb7Zji/ORQAYNAvZZPFeba5DWXEjaNG78id4nw6NeRji5Qgcy5lrqZx2dM3b6skzBRGowK
	fCs5m901IlemRvYhDXs5fyKirzjjBtliyEgq9gCnqkFW0ow+Xhf6GIs9JB9VpMbjtBwwGJi00vC
	hMyk6SvuElpfsWSe4Kf7IKGrvLRNLSyf3jIkLkiMQeJYxJUjairRHfLWAiO+1VNIPYfI150agC5
	QCpFjlx3oAAoTU8r90fkKLXnx2/1/9fZ3EvZqKAVgwCFs2kX0UcWck/opBmdxOV2YrDHkg4WxuS
	Sk+I9q7kuGxR7j9xPVv6dhooISQahdQMfse2h7F7JTlYgwQFs0YaL3MjLqILoCMGzrTxTVgyxg=
	=
X-Received: by 2002:a05:600c:1c17:b0:4a0:1efa:c74a with SMTP id 5b1f17b1804b1-4ac18b7ddcdmr302817215e9.20.1793737895986;
        Tue, 03 Nov 2026 12:31:35 -0800 (PST)
Received: from localhost (ip87-106-108-193.pbiaas.com. [87.106.108.193])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4b411de95b4sm4931815e9.0.2026.11.03.12.31.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 03 Nov 2026 12:31:35 -0800 (PST)
Date: Tue, 3 Nov 2026 21:31:33 +0100
From: =?iso-8859-1?Q?G=FCnther?= Noack <gnoack3000@gmail.com>
To: Sasha Levin <sashal@kernel.org>
Cc: =?iso-8859-1?Q?Micka=EBl_Sala=FCn?= <mic@digikod.net>,
	=?iso-8859-1?Q?G=FCnther?= Noack <gnoack@google.com>,
	Shuah Khan <shuah@kernel.org>,
	linux-security-module@vger.kernel.org,
	linux-kselftest@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] selftests/landlock: fix the regex_escape() error check
Message-ID: <20261103.06edcd6fc9f1@gnoack.org>
References: <20261103163917.641130-1-sashal@kernel.org>
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Post: <mailto:linux-kselftest@vger.kernel.org>
List-Help: <mailto:linux-kselftest+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kselftest+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20261103163917.641130-1-sashal@kernel.org>

Hello Sasha!

On Tue, Nov 03, 2026 at 11:39:17AM -0500, Sasha Levin wrote:
> regex_escape() returns (char *)-ENOMEM when the buffer is too small, but
> matches_log_fs_extra() checks the returned pointer with "< 0", which is
> never true, and goes on with a bogus cursor. On 32-bit architectures gcc
> also warns about the cast of the pointer in the error return:
> 
>   fs_test.c:7474:24: warning: cast from pointer to integer of different size [-Wpointer-to-int-cast]
> 
> Compare against (char *)-ENOMEM instead.
> 
> The size left after the escaped path also subtracts the prefix a second
> time, which can make a long path fail with -E2BIG. Compute it from the
> cursor instead.
> 
> Fixes: 316d06b01130 ("selftests/landlock: Add audit tests for filesystem")
> Signed-off-by: Sasha Levin <sashal@kernel.org>
> ---
> Found with 32-bit builds of the selftests (gcc 16 and clang 21 with
> -m32, with and without -D_TIME_BITS=64 -D_FILE_OFFSET_BITS=64);
> KernelCI's 32-bit arm builds show the same warnings. The changed files
> build without them now, and the x86_64 builds don't change.
> 
>  tools/testing/selftests/landlock/fs_test.c | 6 +++---
>  1 file changed, 3 insertions(+), 3 deletions(-)
> 
> diff --git a/tools/testing/selftests/landlock/fs_test.c b/tools/testing/selftests/landlock/fs_test.c
> index f725882fa4a78..27a78434d1c21 100644
> --- a/tools/testing/selftests/landlock/fs_test.c
> +++ b/tools/testing/selftests/landlock/fs_test.c
> @@ -7470,10 +7470,10 @@ static int matches_log_fs_extra(struct __test_metadata *const _metadata,
>  	log_match_cursor = regex_escape(absolute_path, log_match_cursor,
>  					log_match_remaining);
>  	free(absolute_path);
> -	if (log_match_cursor < 0)
> -		return (long long)log_match_cursor;
> +	if (log_match_cursor == (char *)-ENOMEM)
> +		return -ENOMEM;
>  
> -	log_match_remaining -= log_match_cursor - log_match;
> +	log_match_remaining = sizeof(log_match) - (log_match_cursor - log_match);
>  	chunk_len = snprintf(log_match_cursor, log_match_remaining,
>  			     "\" dev=\"[^\"]\\+\" ino=[0-9]\\+%s$",
>  			     extra ?: "");
> -- 
> 2.53.0
> 

Thanks for the contribution!  I also stumbled across this one when I
did a wider cleanup, and at the time I came to the conclusion that it
would be wiser to fix the weird way in which regex_escape() reports
errors.

https://lore.kernel.org/all/20261008142604.39107-20-gnoack3000@gmail.com/

Does that seem reasonable to you?

If you are looking into Landlock selftests, you might want to have a
look at that patch set, it already fixes a wide range of issues.

–Günther

P.S.: Mickaël, gentle nudge!  I would still appreciate a review on the
      selftest cleanup patch set, even though I know that I need to
      start rebasing it soon to make it apply cleanly.
