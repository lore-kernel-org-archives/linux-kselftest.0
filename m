Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 265173C9457
	for <linux-kselftest@vger.kernel.org>; Tue, 10 Mar 2026 12:28:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773145720; cv=none; b=Buu6+oqNqXTYrSkgAVML3nllCfcGumUk8IGlWESA9xsatpONbCvcrD1qZn+58Fhycp6RZKrbDZKxpo8FQ4jT5oDNzaOxBIo4qCL24D5wL5L8cyQsdvIvt50csvdNqsQttwuoYcEzkJpjGJguxrOaZTCLzGw1dekt/7e8/ONQ0NI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773145720; c=relaxed/simple;
	bh=ziEQMgEt6cFWlyD+Y8SF8ydZXv730TVs827bnSESCP0=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=PIAPVHh7M7z+oFI1DqepS3QZNzLdKouRAYnFNXEO/icZoPRFc0w19X44MX3Je38vYocTrIUS2o4Z0KGZrEfXtSoG1gqxvTLCUlH6LE8fs/G6r8CJdpI6g3h6gKj/rMdQKh0fuuYti78mIkmMMvsLGCvxBx4wWYDfqyUs2rc+n1k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=D9vXL/eY; dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.b=EmhJizYd; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="D9vXL/eY";
	dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.b="EmhJizYd"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1773145718;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=NE9w9NeJUlvy56dU7aps282nSTS20Xf4YKmb2h8N6aw=;
	b=D9vXL/eYyga5CcXywDCkovqBTrJLKwlkfVaj4Z9avnXEy6q+JjxmXYD3HgUVUyFcO8yZlW
	8RkKxcaqJLGW+2mh19x/tTs9J9qQY+b+603mqElQj4rcpX45ckP2PtXVGXlsqLfnD7dicU
	FFnnb75wvLG0okfjbS69O0Pr1H5xUhw=
Received: from mail-wm1-f72.google.com (mail-wm1-f72.google.com
 [209.85.128.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-523-5GYo5y-BPCqiufzn1j32ow-1; Tue, 10 Mar 2026 08:28:37 -0400
X-MC-Unique: 5GYo5y-BPCqiufzn1j32ow-1
X-Mimecast-MFC-AGG-ID: 5GYo5y-BPCqiufzn1j32ow_1773145716
Received: by mail-wm1-f72.google.com with SMTP id 5b1f17b1804b1-485375aa56eso19145105e9.1
        for <linux-kselftest@vger.kernel.org>; Tue, 10 Mar 2026 05:28:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=redhat.com; s=google; t=1773145715; x=1773750515; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:content-language:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=NE9w9NeJUlvy56dU7aps282nSTS20Xf4YKmb2h8N6aw=;
        b=EmhJizYdZn+HECUY1Zld2iv9HrBt2FC9nEfxF5ttvFCaw9hCFy/J8h5CPeThoW8bW6
         H7bsr77uLlve4J6cVFY7BRDINsxPV+gyMXKVXsltBgM+aeaXO8/mSOYadXUokK1jH7XL
         o2dARg7XgjZqFKJt/oBOGABUxlycq0XEddbqDB6RLMHzY6oCts7FnyGONPRHeHOWkmGR
         JDqIjjcLEe64HHft12qaKc+WkMenJsbAcNgiAce6u8SKSA3NMU9DgDyPscEgudfhoXkl
         oUB+3WyZjiyuaJw5fQAymoGCz/wSScIvlLvyT1zTlUVphlVdXPx6mpULqm8U7gkYCxDm
         L6cw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1773145715; x=1773750515;
        h=content-transfer-encoding:in-reply-to:content-language:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=NE9w9NeJUlvy56dU7aps282nSTS20Xf4YKmb2h8N6aw=;
        b=CenAysuw2dHnSbT2jirqVLragm6Uwu2/4SZrrwFRkyia4DNOe2eSxnRbWb/NTTS5cH
         6pQxajyKJsKZIp7zmCfBchLQ5kUuIFY2cOLSf4HLW3UT4leFlnS+O9aUUOOFRNSSBdBv
         AqHbppgifumfOGhL46KZT3B+bSVoUb66pv2XnRm+JGG9uZ1HVhju2p4zjZQ2aB4Qkv4H
         0b2FR6Fmn8zZDCHncsH20Fu4v8eXvSCoCnrZXhR7256Emhh4UN/deonq29qPTQen5yme
         6KHLe/Qc28Cm2jEx0hZ91Yo1uLpk0ZagsA1MuwVMrnsJ1N2wv3PlqObWSYTE8vPg5Vyw
         Cmyg==
X-Forwarded-Encrypted: i=1; AJvYcCVETIll1uelORxxdRpsgrHoaAP6AjMDFv7alQlWCcDw5nuA0t/h896omKsLbleIrsCzTaLd8S04DXaI86i5M3M=@vger.kernel.org
X-Gm-Message-State: AOJu0Yzyp24AhHliAE/GZmtsEfXIe8kSOTIcJl0EAmwl02xNHKfaCde9
	Ah7jen8d/70kBw912iZkkSGcWKlmvpLC8Fe0VfMrGaGAWTR6KExuKysntMKqiVn9QxH/AKDeAdo
	xMH2L9He/2z407pUoC+FoaJuwlzRo1xj8hhmtQ4JbIPfGKOvmWtsda+tN6NI5m4OscPAjMRe+lA
	3/sZg=
X-Gm-Gg: ATEYQzzRFZc9TGeS5+L49CLYiTYiKBeWOt8TkXUHXauALdEhRWcoOxzs+9U16Hp2nh/
	FNko5xVi14s01Wtq5SfhpUTOQv7YPYyAY1StrnP2gpqG4/V6uR5no6jqrVh7TWfwYqEWg/bn1VE
	rl1lqFnu149J5KbYDvDR2W0+u44KmGmTiZEuHL5DOMlkMsA5WxbFNvfMBnSPZnBbkaot6ac28ZU
	P5K/OLpqPkebtMgSlnDenqlHl8pqLWcP5I/dV8ZXTl+/AYXyvcVkOBgourG/nn3dmychq+didEd
	fcDfsBTSFGnXnPZAkP/yQd3rXJwfWj0ED7rGhiOUzSTetxBPDQ2IO3FUEgt9Vtfkz6xbqWGmxix
	Rojv+nfv6Ug==
X-Received: by 2002:a05:600c:470d:b0:485:389b:ee5f with SMTP id 5b1f17b1804b1-485389bf08bmr137552235e9.2.1773145715575;
        Tue, 10 Mar 2026 05:28:35 -0700 (PDT)
X-Received: by 2002:a05:600c:470d:b0:485:389b:ee5f with SMTP id 5b1f17b1804b1-485389bf08bmr137551685e9.2.1773145715088;
        Tue, 10 Mar 2026 05:28:35 -0700 (PDT)
Received: from [10.43.17.131] ([213.175.37.14])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-485419c2930sm124103475e9.0.2026.03.10.05.28.34
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 10 Mar 2026 05:28:34 -0700 (PDT)
Message-ID: <6a914824-178a-47c3-98f7-f3c3086ab831@redhat.com>
Date: Tue, 10 Mar 2026 13:28:33 +0100
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/2] selftests/bpf: Fix read_iter buffer termination in
 test_bpffs
To: Sun Jian <sun.jian.kdev@gmail.com>, Andrii Nakryiko <andrii@kernel.org>,
 Eduard Zingerman <eddyz87@gmail.com>, Shuah Khan <shuah@kernel.org>
Cc: bpf@vger.kernel.org, linux-kselftest@vger.kernel.org,
 linux-kernel@vger.kernel.org, Alexei Starovoitov <ast@kernel.org>,
 Daniel Borkmann <daniel@iogearbox.net>
References: <20260310102145.857810-1-sun.jian.kdev@gmail.com>
From: Viktor Malik <vmalik@redhat.com>
Content-Language: en-US
In-Reply-To: <20260310102145.857810-1-sun.jian.kdev@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 3/10/26 11:21, Sun Jian wrote:
> read_iter() always NUL-terminated at the end of the buffer, so strstr()
> could scan uninitialized stack bytes on short reads. Terminate at len and
> use O_RDONLY.
> 
> Signed-off-by: Sun Jian <sun.jian.kdev@gmail.com>
> ---
>  tools/testing/selftests/bpf/prog_tests/test_bpffs.c | 6 +++---
>  1 file changed, 3 insertions(+), 3 deletions(-)
> 
> diff --git a/tools/testing/selftests/bpf/prog_tests/test_bpffs.c b/tools/testing/selftests/bpf/prog_tests/test_bpffs.c
> index ea933fd151c3..e8021ff0581c 100644
> --- a/tools/testing/selftests/bpf/prog_tests/test_bpffs.c
> +++ b/tools/testing/selftests/bpf/prog_tests/test_bpffs.c
> @@ -17,11 +17,11 @@ static int read_iter(char *file)
>  	char buf[1024];
>  	int fd, len;
>  
> -	fd = open(file, 0);
> +	fd = open(file, O_RDONLY);
>  	if (fd < 0)
>  		return -1;
> -	while ((len = read(fd, buf, sizeof(buf))) > 0) {
> -		buf[sizeof(buf) - 1] = '\0';
> +	while ((len = read(fd, buf, sizeof(buf) - 1)) > 0) {
> +		buf[len] = '\0';

Does this fix any real issue with the test? I can see one very
hypothetical false negative when the uninitialized memory would contain
"iter" but that seems very unlikely to happen.

Viktor

>  		if (strstr(buf, "iter")) {
>  			close(fd);
>  			return 0;
> 
> base-commit: 1f318b96cc84d7c2ab792fcc0bfd42a7ca890681

