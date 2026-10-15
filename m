Received: from mail-yw1-f180.google.com (mail-yw1-f180.google.com [209.85.128.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F18A02D0614
	for <linux-kselftest@vger.kernel.org>; Thu, 15 Oct 2026 15:12:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.180
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792077141; cv=none; b=rye8xWpOe0rGy+tYE46tV4tVx4Omjxl6b3Wh8i1lBuscTIGM/LXUNfievZpt0Bsb8EbJtnD1dTuKbMRbYevZt+EjLkcGUC0p3pgfqdq3vq5vw4qlA7ePkcyznrzqNzT9iJFAMMuu9xynHANgdDjkkceyf09U2e9ZnKBviOyyfvc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792077141; c=relaxed/simple;
	bh=rQ5DoMf8ZnQyBuNcuUdT0zQ4ECEYfTAmcSFNHkaDc7o=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=Vf8iX+BDXNG3JN2ePU7LRw8zRkz8eyOuR+QLzg6t8MoC+umBCUZ1+N3GhWtw1ndAaqcmdz6Ac9qOp91i01jCmzTKR6m5AHdYjJasH1D5jVo3BrPUIiow6Ioz8oCjvXcQ0rsPB6P1fZ18RW20WxVfC7pBqKNHsN533CGQAmwe378=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linuxfoundation.org; spf=pass smtp.mailfrom=linuxfoundation.org; dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b=QhgCQAsT; arc=none smtp.client-ip=209.85.128.180
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linuxfoundation.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linuxfoundation.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b="QhgCQAsT"
Received: by mail-yw1-f180.google.com with SMTP id 00721157ae682-8b0d126f631so13941487b3.2
        for <linux-kselftest@vger.kernel.org>; Thu, 15 Oct 2026 08:12:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google; t=1792077137; x=1792681937; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=4f47ccrTPzkKKb0Ghz6v3dOkmhYk8321RuCtsSygqc0=;
        b=QhgCQAsT7RVOz38TRpDbWHfkOSjHKnpNOby4P7lc2JBYH8LYDEEZdf0+V2/6cYqaY7
         iYMhppPh1Ydru7IqzpbkuJ6sI1uXCN6kIJuECJTiULLgQxQfZSzNzHY37oBt6umdvmbe
         dKohXThSEVKZ3D7Gca/2x4pj7hwDnXgN0yc4M=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792077137; x=1792681937;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=4f47ccrTPzkKKb0Ghz6v3dOkmhYk8321RuCtsSygqc0=;
        b=fJPZp8UgIHpfSISY4Ag1HL8N5qYP4NUs6tro9XW3DMaMmCP59WGt5qJSYya3lyCviQ
         ItKVP7sUc2u3OPgyG0ZE+xJh/O4AHyP3ai6kZ/YX1Ow0ABZMJaZcinnu3XWWPUtxN2Fg
         hWiHnx2fuYBM1JNYfnvPE7+hB55YWr7vzl4bjZMCmjfojHDuxyLaalHcMoub3dWe5DkO
         HE5FQPZuUFPyW+5dUjcnF9Se32FroitYjL8tqS66zTgF3Wyq9LPFl5c/Sh2IMiIeliji
         Rf79gqJBlO8/vesbOgjtpu5a5kiFSfkJBbYJNyW0ykNhk0agqz4/LzjYSAbP9H9rWt11
         rasQ==
X-Forwarded-Encrypted: i=1; AKwUvBxKhiS0imHn+0bV4U3ZbTKkWQIaUsz7esOM5Z2H01AybqzGtz6ykhae+t83KhAHl2GlZJ6BjwUkOg+JJVcfV3M=@vger.kernel.org
X-Gm-Message-State: AFq9FYJDemBhR1ScrTaJ0uhEObR0sFKQJVOQ5s2GSH5RRGXIqzbpC9fH
	wjN2GIzOFPuIlvUI0rgte6UQ6CkkUE8D2eLowB/lHecznOxit2L5xnTh1g1w82GsaoQ=
X-Gm-Gg: AYBFou3mR4tLyosqvx7rRFMQHUXUDccVwipWhgFDeAKWqb0AVZ6gEk+o3hyerpWqWEC
	5BIGxqtp/b3kIQmMzfkY+i/yQjWsWKWVs49qRIiLHguEnI00ilgUN/9VStCU6NOoqm611/+dTWb
	KZqCsukUU2FoeWePMeWNd8b7rGv6LpF8UY85quHxEURYGk7Vklb+a4M+BxeHMUQUOPBOf++xlbX
	iEhc44JJ3FhF1Ux5CB+FMMx4PBIcpb/+gpTBSG5Ko3IZCXDonTA0cGkRu4cq4SmZ1kNlVnnI/S0
	s0mTRttwncj3ZSWW6AysvtSm1K6YneqUDjuan0xmlNLqlnWyHdJqwFdLguwt6NfzgBH9I8UtjpG
	OapsnZ4joMXNlfp/hK/oeV8eq6f+dA0gONIN2tzDe/6JcVUfQqiOmYo02Y9ChvailI49gg6Z0gP
	2sN5Jd8UE/XbIPX/eLb4rrWoblflyX62+5jjr92NI0ZufudWRro7cgUgeuuq+TgHUl9WbhSbl+b
	8JPgC7Erw==
X-Received: by 2002:a05:690c:e3ca:b0:8b0:a3a8:5f9c with SMTP id 00721157ae682-8b0a3a87f2dmr46357577b3.40.1792077136707;
        Thu, 15 Oct 2026 08:12:16 -0700 (PDT)
Received: from [192.168.1.128] ([38.15.57.99])
        by smtp.gmail.com with ESMTPSA id 00721157ae682-8b07f263bc8sm66643697b3.45.2026.10.15.08.12.14
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 15 Oct 2026 08:12:14 -0700 (PDT)
Message-ID: <97e9479a-d64e-4905-b6f3-7f8831bf7f22@linuxfoundation.org>
Date: Thu, 15 Oct 2026 09:12:12 -0600
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] selftests/ftrace: Add nice dependency
To: "Masami Hiramatsu (Google)" <mhiramat@kernel.org>,
 Jaewon Jung <jaewon8868@gmail.com>
Cc: Steven Rostedt <rostedt@goodmis.org>,
 Mathieu Desnoyers <mathieu.desnoyers@efficios.com>,
 Shuah Khan <shuah@kernel.org>, linux-kernel@vger.kernel.org,
 linux-trace-kernel@vger.kernel.org, linux-kselftest@vger.kernel.org,
 Shuah Khan <skhan@linuxfoundation.org>
References: <20261015022416.43534-1-jaewon8868@gmail.com>
 <20261015145557.7AFB41F000C4@smtp.kernel.org>
Content-Language: en-US
From: Shuah Khan <skhan@linuxfoundation.org>
In-Reply-To: <20261015145557.7AFB41F000C4@smtp.kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 10/15/26 08:55, Masami Hiramatsu (Google) wrote:
> On Thu, 15 Oct 2026 11:23:39 +0900, Jaewon Jung <jaewon8868@gmail.com> wrote:
>> The tests use nice but do not list it as a requirement.
>> Add nice to the requirements so the tests are unresolved, not failed,
>> when it is not available.
>>
>> Signed-off-by: Jaewon Jung <jaewon8868@gmail.com>
> 
> Looks good to me.
> 
> Acked-by: Masami Hiramatsu (Google) <mhiramat@kernel.org>
> 
> Shuah, will you pick this via your selftest branch?
> 

Applied to kselftest next for Linux 7.4-rc1

thanks,
-- Shuah
