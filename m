Received: from smtp-relay-internal-0.canonical.com (smtp-relay-internal-0.canonical.com [185.125.188.122])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 83F4D3E1211
	for <linux-kselftest@vger.kernel.org>; Mon,  8 Jun 2026 14:52:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.125.188.122
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780930339; cv=none; b=UdyYY7ie1RyoVGeE+uMHlSZQjmzepjTKL11mpWHyNt/aGbZOfhaV/D7nr0/PVj7W1vgUX4z65MXE5YuznNRrxs5aruNQg6j+Gt7ZzCegMwKwphQ6q7JZddMqGPJjTwVIvKnsRk6k+Hh+Vh2zXZ+0Mpho7YirfzYP7yP4+xR2m5M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780930339; c=relaxed/simple;
	bh=rpXnnfiHVzHB7ncZ9FTFRFhCJjEV5nU6ygT9vS6g1Dw=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=rO3fZ3DduYKDxxXyuUucUFiCvEZz28XZryjqiKhGaGT0XGr1zN4rRJyO4QG74LMfUhZuyOy2EpjYnkGPGFL9/gc7YxDcu6MrKefT5F8g+sKv/XEyPyS0mL+qgvQ1TvXAnZYpVtoa/mVSAnjix9DYvqJXFz6Ng3G6F/2k//ubKZQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=canonical.com; spf=pass smtp.mailfrom=canonical.com; dkim=pass (4096-bit key) header.d=canonical.com header.i=@canonical.com header.b=lwvYLV27; arc=none smtp.client-ip=185.125.188.122
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=canonical.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=canonical.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (4096-bit key) header.d=canonical.com header.i=@canonical.com header.b="lwvYLV27"
Received: from mail-pj1-f69.google.com (mail-pj1-f69.google.com [209.85.216.69])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-relay-internal-0.canonical.com (Postfix) with ESMTPS id B67EE3F468
	for <linux-kselftest@vger.kernel.org>; Mon,  8 Jun 2026 14:52:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canonical.com;
	s=20251003; t=1780930328;
	bh=b1pX3FZIzR6JtivhZtR5O2oycxLZ7mVagYmhnEiYG4Q=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type;
	b=lwvYLV27F7oDIAYT5ufo85O2nrP6AVjpKxCNaXn23/fbNLZGowueC2j4PdTfOcWnC
	 ZxJAhKXPvVKvP/Dp+mrsJmNf0f90KiQf20jWYOOVgvdvF1sCbpea6sI7qEZFJ2iCPV
	 9Cjj9OjyAe2deWqcrlSRCaEh9ytHG/gxQgovE4bC8UNl0lsnv8L4SYZk5+SrYThp1s
	 zPVzP1PHzmTa7R97645CvFtwO4JM3rk38+/wkwtO/Y010IsJ8Pz3/3qTHai3js61fv
	 Hwe0KhyNq6M2yX95G9nsiwLZu5aZ8U74lVqnsJaWmPn4fycnYi4NxFxdgyYjkWWhhX
	 PgFlr4eUh0oy1qy7SCnNp7wn5akkxmowTVPrPNfL4P27+/ixVl0YSYpRae189Bbpzu
	 e7pC/VISdVJEvFL2Yw+GL6ORqwCFePHM2PIx3fLJai4ej4vWYpG8nv8lbh8IQtto4P
	 5u5WkTj4pGlzCln1AfR5GDCjL9kvqw92ddq+3oFlbekoaslot17tkTkvlMOr/3PmEi
	 LMwI0GL7hb/MQ6N1uwBmanCwcAr86FsFlJv227/DtlvNQaV7jHg9jI6sONE8SDVuo3
	 B9794cT5Z0TR4wi3nvOU4DV+WVU0JOkZTUAz/HRkDEZp2pH4OhrpX0YgIKy8XQOCS3
	 9XwUu4X+/AO8+YuPhBXOKENM=
Received: by mail-pj1-f69.google.com with SMTP id 98e67ed59e1d1-36b982ec27aso3232838a91.1
        for <linux-kselftest@vger.kernel.org>; Mon, 08 Jun 2026 07:52:08 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780930327; x=1781535127;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=b1pX3FZIzR6JtivhZtR5O2oycxLZ7mVagYmhnEiYG4Q=;
        b=TqsittoVm+V4XrSeUWBn+yvC+B0otP2Iby+ZsSG4f8DnzN4s3dzIb2qlLSt17NWzF2
         QSma+wOc1uEaNBE+lf00oFpNQSd+Ru7pYoKl6GoMwcuugaqT7c7m7aVvAjabjuZpKZzi
         wyXF1P8dSuF6/yyhNuMGgbBFXp9fk+s5BtLN4GeAcS5j9RtReQrMqPwfyEOIXNJ9eSHL
         tA1WXQpoQ4rsdAjqFDmqBv4Fvh2ylw5hheb9Ko6XdQlrQaN857Kn2dQPP+HlT+to2JHR
         heGO+RHcr8AtysU2IRd9YP/UHJkrAfaZtoYJ9iZblo+YocYm5/FDCMLY8fQFjEpdsXtw
         zdVA==
X-Forwarded-Encrypted: i=1; AFNElJ+J2WM9/MZnqTPXkQomGwtIuPga4yFbf2Q3HYXxFGpL7IY0q5g6NrT5BvYMHWIwE6CRPBL6wr/ayIs2eC4I7oo=@vger.kernel.org
X-Gm-Message-State: AOJu0YxG0SApSS98xX140grJLCSne/vmDSFp8wkD5iFXGlbIqDcCoCJm
	IPxfNPI8EbN7WAB0IofkkpqPl41K/8has/f9CIZ28H2DK4pw+O6iYj+t6UPfBZOmjWe6TJomYlv
	BW7OmbGCVjF17TrS8xOdZoQWr7ZWJF3OzQ5nV9gNzggTWWqXiBJo9Z1yU1WWmWox1P9eJL+b0If
	lUjsvScve57GyNmrMVxo79
X-Gm-Gg: Acq92OHg7tfeVEni5F8CdMoJXb00X/r3/SEospL1iz0bM2AbLy/PzHZX8/7x/BNa215
	YtGR7ICeMAS8YfzjzCL+s+5yhgKCeqMROUVUBo3gUbzSR8FBWk8KBdwLNCqJ+0TdEhjFbzcC4Rz
	7sSKHMrmyfptOjQ/fzmzUjvr2t7JbH6l2z+/tiE+UwlhlIzVdNvSAsrAO3A9BarxD7nICeSfr1o
	k5z+9TLGvgtTBJHwnpXA15fs0rlWO42C6o1lB3Xgi/lkuiA4zU6cqbhT4dAsJRsAr83E32ceUES
	K4dfZviW+z1YDa7k2QBLPe7TATik0DY2OgE5c2uS1VH/K3bPwANXbOluL8MYPO5iiJo7D05zAhX
	L2/wnfimT2pK5RacpjZDpzPfW2JQHahbt/vEdawmBQY6ojPhpPejHrGz+4cD6CIGA8RVHERRhuZ
	yvMGY1Pfrt
X-Received: by 2002:a17:90b:5747:b0:36b:9798:4f67 with SMTP id 98e67ed59e1d1-370eee03facmr15824953a91.8.1780930327073;
        Mon, 08 Jun 2026 07:52:07 -0700 (PDT)
X-Received: by 2002:a17:90b:5747:b0:36b:9798:4f67 with SMTP id 98e67ed59e1d1-370eee03facmr15824914a91.8.1780930326374;
        Mon, 08 Jun 2026 07:52:06 -0700 (PDT)
Received: from ?IPV6:2409:8a00:48c1:ca00:bd04:9263:b15c:15f? ([2409:8a00:48c1:ca00:bd04:9263:b15c:15f])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-36f6e828eacsm16073363a91.16.2026.06.08.07.52.03
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 08 Jun 2026 07:52:06 -0700 (PDT)
Message-ID: <79c7ede3-e174-487f-bf0b-fc9347fdde9c@canonical.com>
Date: Mon, 8 Jun 2026 22:51:59 +0800
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/2] selftests/ftrace: Account for 8-byte aligned
 trace_marker_raw events
To: "Masami Hiramatsu (Google)" <mhiramat@kernel.org>
Cc: rostedt@goodmis.org, mathieu.desnoyers@efficios.com, pjw@kernel.org,
 linux-trace-kernel@vger.kernel.org, shuah@kernel.org, wangfushuai@baidu.com,
 linux-kselftest@vger.kernel.org
References: <20260607072431.125633-1-hui.wang@canonical.com>
 <20260607072431.125633-3-hui.wang@canonical.com>
 <20260608181716.726cb9c81d41d49095e7f3cf@kernel.org>
Content-Language: en-US
From: Hui Wang <hui.wang@canonical.com>
In-Reply-To: <20260608181716.726cb9c81d41d49095e7f3cf@kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit


On 6/8/26 17:17, Masami Hiramatsu (Google) wrote:
> On Sun,  7 Jun 2026 15:24:31 +0800
> Hui Wang <hui.wang@canonical.com> wrote:
>
[...]
> +    for config_file in \
> +        /boot/config-$uname_r \
> +        /lib/modules/$uname_r/config \
> +        /lib/modules/$uname_r/build/.config
>
> Hmm, also I don't like this, because this highly depends on the environment.
> Instead, we can add CONFIG_IKCONFIG_PROC=y in tools/testing/selftests/ftrace/config.
>
> Thank you,
>
Thanks for the review. I'll address all other comments in v2.

I have a concern about this specific point. On Ubuntu kernels, both 
CONFIG_IKCONFIG and CONFIG_IKCONFIG_PROC are disabled by default, so 
/proc/config.gz does not exist. If we drop the /boot/config-$(uname -r) 
lookup and rely solely on /proc/config.gz, this test would become 
unresolved on every Ubuntu kernel — a regression, since it works on 
those kernels today.

There is also existing precedent for the /boot/config-$(uname -r) 
fallback: tools/testing/selftests/mm/va_high_addr_switch.sh checks 
/proc/config.gz first and falls back to /boot/config-$(uname -r).

So how about we keep /boot/config-$(uname -r) as a fallback, but drop 
the /lib/modules/... paths you objected to. And add ftrace/config as you 
suggested here.

Thanks,
Hui.
>> +    do
>> +        if [ -f "$config_file" ]; then
>> +            grep -Eq "^${config}=(y|m)$" "$config_file"
>> +            return $?
>> +        fi
>> +    done
>> +
>> +    return 2
>> +}
>> +
>>   LOCALHOST=127.0.0.1
>>   
>>   yield() {
>> -- 
>> 2.43.0
>>
>>
>
