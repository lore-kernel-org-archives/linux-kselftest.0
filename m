Received: from mail-oa1-f44.google.com (mail-oa1-f44.google.com [209.85.160.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 86502560AA7
	for <linux-kselftest@vger.kernel.org>; Wed, 14 Oct 2026 15:47:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.160.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791992867; cv=none; b=Ad3FCz/9/b5RhpaOyRvp6vIbw1WaQ4CQBRg78g5E+Cadsab53cJrtYICKh2BjoZlQAiu5rxrjpSGB6VavLbF5GCfkNfhW2u10mJbR4k3d9yJai2RsMlvplj5r4oh52qsNBkPtwDIgK9leyz3Cmi8maZch1uqDyXfF9yfVk6wm5A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791992867; c=relaxed/simple;
	bh=SkAmdc7sm1QGFa88r7L2o9h1gMKzRqFxqZadMw5RWWg=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=PpHHvb38LBz5L2JpmvMiCQbqK87iZvYdrw6NhNvtSZZt49YCJpQlKejBG7DYzi0fXGgZ1k6wP3DEaUFVV10CqjUgy1RAOwE89ZcGHKT2XglR4MjAGp2O8k5s0pGv/3faF684sk/JvgcVUuieyX7I39xoRw/jlzf5drxFqX8a1O4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linuxfoundation.org; spf=pass smtp.mailfrom=linuxfoundation.org; dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b=YJVvz27t; arc=none smtp.client-ip=209.85.160.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linuxfoundation.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linuxfoundation.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b="YJVvz27t"
Received: by mail-oa1-f44.google.com with SMTP id 586e51a60fabf-43bf9548df4so3796686fac.0
        for <linux-kselftest@vger.kernel.org>; Wed, 14 Oct 2026 08:47:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google; t=1791992857; x=1792597657; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=w5511ufpkaRG+DS2pNSBB2urvZrk4kAcuDxdZDLA2qs=;
        b=YJVvz27tC+x47sjJCos/rtOw8nA1vqoAgxoCp8avlT6s1QnQOTPcmtgPLt4fAakC0a
         b+5qvhoW0hJg2a6lL4LIZoDOiglAZaEooDsoUO/9WTkyppA4psczRZRXk7NhRhRGHpEr
         16qMUyN1Nk21YmsdJR/3SLThCoOcU8euxgHXU=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791992857; x=1792597657;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=w5511ufpkaRG+DS2pNSBB2urvZrk4kAcuDxdZDLA2qs=;
        b=yOrVvBFIJcm5G/KHdORqGTjC0LLTHAp00aKwor628JC/Tm7g6d7FcEecKmcQA7kZVW
         WgJ8cCEQIEPt+NueYsgwtvDHlc5n8ExvLTn6t0zMVwCkE6REcSmm36Xiaz1ZZWK3f+aq
         4GFnzWjPKTzuYZEfRBEOKcEZlT/iBqf6ewnbNdX6+nxNIRpOgkudWlMtlqtBDEsKYAzC
         wlAedLCyRiev6bcnBWyjF7rgzseDDrY2+/BxaP5Nf6S4sV/MviFtAuElTPzc6zCXa6Xl
         qRtTRjJr7UzTe4y2q6iyZ9q4piwK7idJlM+cUoSGJjUiWc/5OXLP1rfn7ekb3f0wIkaj
         kNlg==
X-Forwarded-Encrypted: i=1; AKwUvBwfTklzCljk+ZYmqNvqvty02EWU4tA7mXuhZllb12vYBjlkunRT9ouGkbOYNoA/uuM+gRRWoSyNEUxoRHVGy/0=@vger.kernel.org
X-Gm-Message-State: AFq9FYImHobh3dQVES4HrobsoFEkVKjqveaPxW4UCOg4ocBj2KKupbym
	1uojQvJ0b+5vxjy8hgepzGlL1bLqVTOBrkoCO/OSPO6c6ehLb03cOeiu+rOy3Q+91dg=
X-Gm-Gg: AYBFou3/9ULLWtAR8q/DLemipJ9PnU4YKZ8wJmU3EWaQgFMA8TuVDpDXClTgloOwucP
	O6yAn7MHpEvAOTOlXs0KfvlTPgnyw159+E76SqjN56ZdU6ech3nZwSofOMWEAxEGfAPmqggREeS
	sLWujwUur4P4SkgB79CUR5x6U3Mw39f53zyK+qNE8gvuniwxJtrn8qeZpJG2kczdCq5PomJmzsw
	lZNmtyruuBf+IY4qePGndla/RxfIXY5lKf2FO6OQpkUWO2BPw3Kkada0QqKjlPbTo2cjCWMlIbw
	4IvnDk4AKVNIY8aGkjTIO6t+Z3exiYfTgqTWWs7o3+3c9tpAb7rD+FirGITTEAAJvBeMD32x/zF
	9d3HoZJ5mJpurUB0a47wYLBZtlHit9LaN4Yxk929zQHJE7aiB6zfIAySonEM+C9kA1f9q33sdO0
	kzr7VpdvjAMzDa9nh8CTsgTdHqWdNX6cd2tGVAFeWbHMau2gjymr06dcaoD+sxHLPChqvRBdl8a
	EGGdKEU
X-Received: by 2002:a05:6871:7a1:b0:49d:c9ed:21f2 with SMTP id 586e51a60fabf-4a2a8937f07mr15344175fac.18.1791992857074;
        Wed, 14 Oct 2026 08:47:37 -0700 (PDT)
Received: from [192.168.1.128] ([38.15.57.99])
        by smtp.gmail.com with ESMTPSA id 586e51a60fabf-4a6df881fbfsm2366117fac.2.2026.10.14.08.47.35
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 14 Oct 2026 08:47:36 -0700 (PDT)
Message-ID: <9534e333-c44f-455a-9704-d8d0f32d0d80@linuxfoundation.org>
Date: Wed, 14 Oct 2026 09:47:33 -0600
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] selftests/ftrace: Avoid unlink error on first run
To: "Masami Hiramatsu (Google)" <mhiramat@kernel.org>,
 Jaewon Jung <jaewon8868@gmail.com>
Cc: Mathieu Desnoyers <mathieu.desnoyers@efficios.com>,
 "Steven Rostedt (Google)" <rostedt@goodmis.org>,
 linux-kernel@vger.kernel.org, linux-trace-kernel@vger.kernel.org,
 linux-kselftest@vger.kernel.org, Shuah Khan <skhan@linuxfoundation.org>
References: <20261014114839.6258-1-jaewon8868@gmail.com>
 <20261014142147.95DB11F000C4@smtp.kernel.org>
Content-Language: en-US
From: Shuah Khan <skhan@linuxfoundation.org>
In-Reply-To: <20261014142147.95DB11F000C4@smtp.kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 10/14/26 08:21, Masami Hiramatsu (Google) wrote:
> On Wed, 14 Oct 2026 20:48:25 +0900, Jaewon Jung <jaewon8868@gmail.com> wrote:
>> On the first run, ftracetest tries to unlink a symlink that does not
>> exist.
>> Use rm -f to avoid the "No such file or directory" error.
>>
>> Fixes: 7dc1e125f07a ("ftrace/selftests: Add softlink to latest log directory")
>> Signed-off-by: Jaewon Jung <jaewon8868@gmail.com>
> 
> Looks good to me.
> 
> Acked-by: Masami Hiramatsu (Google) <mhiramat@kernel.org>
> 
> Shuah, will you pick this?

Done.

thanks,
-- Shuah
