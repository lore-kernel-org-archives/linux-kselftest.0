Received: from mail-qt1-f171.google.com (mail-qt1-f171.google.com [209.85.160.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 67BCE4D4889
	for <linux-kselftest@vger.kernel.org>; Thu, 15 Oct 2026 14:57:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.160.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792076238; cv=none; b=RqU4xTCUdhtENw3NPl5oD60Tte2Sc9aagcnZJqPbC/eV8rqUFCDJJ5gMbaD00hBJmpYDR07Wwj8CJLMHJUB9N3Uzregt2wQC3SruOEYFouyyan8bxBt1jDS8XuIN2m3abD05YduDur116f4LUG+cY+0DHOmq6C0f8I3Q7/l1O98=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792076238; c=relaxed/simple;
	bh=8E8Fes01P0FnMokny4ycUlekwWtVOnV9rLiH+P2xHXs=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=pVs5brH5OJ9dRWmwjL2FZmKKkKbiHiUs9QoFQD5s5KuzjykGvhH/2NBaWPvEJPqKO9+3jI7FPIf6op45XAq0oChH+D2ijzUi3FnsgcOtZEUAKQPSuhNXRtBm34reh8kTXN+SWL020E3i+GZ52ZjsWZl0nS6FKxK+RXaGhP21tsg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linuxfoundation.org; spf=pass smtp.mailfrom=linuxfoundation.org; dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b=L0PhSIgy; arc=none smtp.client-ip=209.85.160.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linuxfoundation.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linuxfoundation.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b="L0PhSIgy"
Received: by mail-qt1-f171.google.com with SMTP id d75a77b69052e-53396adbc53so17783651cf.3
        for <linux-kselftest@vger.kernel.org>; Thu, 15 Oct 2026 07:57:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google; t=1792076235; x=1792681035; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=mdMD7NIIHUonWBQ7tMxlfEgdY/tQZaBr/YCC0/JY/pM=;
        b=L0PhSIgyhUMvFrwKCyH2b0USzjLmsFGOAspSRRwJLlwtPxkKQT2vYhzoZ+wIXgi04X
         9yeMkT3oLuInVlmhd47omGONVKiiaYnXEHtp1+Xy9zGjfInH6azKByKCQndVegZHANGp
         1x5Lx+LIwlMjwHQM/yVuBK7fIhX1BkN0+ZZ8A=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792076235; x=1792681035;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=mdMD7NIIHUonWBQ7tMxlfEgdY/tQZaBr/YCC0/JY/pM=;
        b=d0mRI7ekIPEcuHOoDNanHYDO0DSND+pUyjk8hz9RdOlTh/eVg+7sUTA8Xd1AX0HIEm
         lbKNrgpzM24CsGF1Xa41Jy8/otPqwJwNKaQcRb5L3smLTD1D0PRJApjeSQKF9QQj1S2w
         pXXx7ffzBjRzb7qp8o+rNP9Oekir6j06JZJ2qA1IV1pUYgNbTHS46FECOWSGTx/bndMg
         kx/zr3r1i+SzBDxsZcI7IztqiJCD6SLDuSugi+JN6CkmRerE6ExOG6y6wPU44lZ7KqHe
         LqP1RyZPYiRpbGCED10fvwAaj7cGNo4zYjwJ/I73uCzknNXXftnqF8LfO1if7/HqzSPw
         iEZA==
X-Forwarded-Encrypted: i=1; AKwUvBwMztLIGOS7ahJExo4VTUvRAGOh7JKQsnnRpV6Ukbh8Mql1oqrNZB+Ag6qEsi+IlNqNkTXzYLfR9nNsSXKZoEA=@vger.kernel.org
X-Gm-Message-State: AFq9FYKgWCNH0P2s3YSQJzEDktoBkrz9ADIRXlYw7igpqn4CAkPU72zp
	ipfLqboh5OQRADl6jbLzomEXS4n2JKGTukAxQ+q8l8HUV8lgCDIRrhivtDIhG1OZCwwEXJMkea3
	oeeqR46U=
X-Gm-Gg: AYBFou2sk4NrpthwmdzCCFML9vfFfw5bcU1YTj3sM6yQsDWaCdN6tMkwX28ztWUxB2K
	G993p9WU0QcCLQGlon+66YUOUQfqgxsnBkJPgexbYUzIDSlw++FFg38yt4oirsa5LydXZLZf+yc
	oXA7qJe2dhKfawJd7oN8hy7MnXO+H4aLk28vCdOM2uOFprQ4oPv/Ls/4vuxVy1/bt/KPJZEHjLX
	M45ysBgZe8aDAx11jZcoIIRbqB5SFa67uDKN8DV8Ild/BxyVspA9y3MHVCb9FaHGTyGNKacdpfT
	SV5FsegWqP1TJ/FE2z6Ze3uHmNRrtQk8NzU/b4XV6mjQ+HdY8JzsFwZ+DoNX6f3BEEnz0uiUjzs
	89RSaIxYvbstzDMMCympIenfRa377OeXUxN9sOferolSB09+Ny/0iB6GeIYdb1ptNScyUOhDdWB
	nLqnsTI5ray72Y9YXMAdChIqAgZde9lpimZjaQ7s/mdaise/tcipfb4LiXxz8fWZcYWcJ/IIXkZ
	n/0vEUC
X-Received: by 2002:ac8:5f92:0:b0:535:92a6:22e7 with SMTP id d75a77b69052e-5359fb4794cmr295144001cf.42.1792076235184;
        Thu, 15 Oct 2026 07:57:15 -0700 (PDT)
Received: from [192.168.1.128] ([38.15.57.99])
        by smtp.gmail.com with ESMTPSA id d75a77b69052e-53612830ec3sm27558151cf.27.2026.10.15.07.57.13
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 15 Oct 2026 07:57:14 -0700 (PDT)
Message-ID: <8aad13a4-1097-40d1-a0ed-c44ef84838b4@linuxfoundation.org>
Date: Thu, 15 Oct 2026 08:57:10 -0600
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] selftests: kselftest_deps.sh: Support LLVM
To: Nick Desaulniers <ndesaulniers@google.com>,
 Mark Brown <broonie@kernel.org>
Cc: Shuah Khan <shuah@kernel.org>, Nathan Chancellor <nathan@kernel.org>,
 Bill Wendling <morbo@google.com>, Justin Stitt <justinstitt@google.com>,
 linux-kselftest@vger.kernel.org, linux-kernel@vger.kernel.org,
 llvm@lists.linux.dev, Guillaume Tucker <guillaume.tucker@collabora.com>,
 Shuah Khan <skhan@linuxfoundation.org>
References: <20261013-kselftest-deps-llvm-v1-1-f2ee70ae1b79@kernel.org>
 <CAKwvOdmQkYy3xqTsumSxLdHpaXnt1Hb9g++DVmAYcx=cvjFBeg@mail.gmail.com>
 <38d31a6b-b3d0-4b15-9b24-62d2bd6f9040@sirena.org.uk>
 <CAKwvOdnoZfE3bqNnRBTR4G805V4-iooe9YwS8ZO0ka2h9bgDQg@mail.gmail.com>
Content-Language: en-US
From: Shuah Khan <skhan@linuxfoundation.org>
In-Reply-To: <CAKwvOdnoZfE3bqNnRBTR4G805V4-iooe9YwS8ZO0ka2h9bgDQg@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

On 10/14/26 10:42, Nick Desaulniers wrote:
> On Tue, Oct 13, 2026 at 3:01 PM Mark Brown <broonie@kernel.org> wrote:
>>
>> On Tue, Oct 13, 2026 at 02:07:28PM -0700, Nick Desaulniers wrote:
>>> On Tue, Oct 13, 2026 at 12:40 PM Mark Brown <broonie@kernel.org> wrote:
>>
>>>> +       clang_target[riscv]=riscv64-linux-gnu
>>>> +       clang_target[s390]=s390x-linux-gnu
>>>> +       clang_target[x86]=x86_64-linux-gnu
>>
>>> ^ should this be either i386-linux-gnu or i686-linux-gnu, or does
>>> `-m32` get set somewhere?
>>
>> Hrm, that'll just be a cut'n'paste from lib.mk which does not so far as
> 
> https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/tree/tools/testing/selftests/lib.mk
> 
>> I can see set -m32 - it sets i386-linux-gnu for _i386.  Does that need a
>> fix too, or am I missing something with how it works?
> 
> Ah, no looking at
> commit 624c60f326c6 ("selftests: fix LLVM build for i386 and x86_64")
> 
> it looks like selftests have i386, x86, and x86_64 where x86 is x86_64
> IIUC.  I see you also have a distinct i386 target.  My bad.
> 
> Acked-by: Nick Desaulniers <ndesaulniers@google.com>

Thank you. Applied kselftest next for 7.4-rc1

thanks,
-- Shuah

