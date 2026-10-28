Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.160.45
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793221605;
	b=0ivdkfwe4tDKKuGAlactbE0twlKvKEzFx8CjL2009IrQiIia/XbOCG76LB1u9ZHMDBgY
	 mZBf2LSNlsLPFgykUKULBNi6WHF19KIZClaDAHyVYSZU9uqAwoJaZf0wHH6qmT5l7www0
	 JOQvEHRnbRS/1dUoP3kk2xV2xFFDtYBgVD7o5DISoGhpzh5BlMYd179LQPmr22rS9bUqs
	 XSbRJ9eQbiSfIMRvTQrwI6rrhqMQbP9Af21ryMNgtT1RvbRuAddn2vPaHg5rdSAu4L8Kj
	 BiD3dV6HKWUkinqMBFB1wep+qf3tFrXmFWcreGiAjdLh/Stlu5Cgf9eqIZDA3qgOmzg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793221605;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Message-ID:Date:MIME-Version:User-Agent:Subject:To:Cc:References:
	 Content-Language:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding;
	bh=dYdUZQkYdLc0vauWbIqi3zABPNcb2nwtA8yBjqhaLho=;
	b=AI3ptde6PY+QVHQ6iWOnEWLAj87c/gknQr4Dlm/zhVaK5x302w8y7mEPt+LL/QCv0i3c
	 11Zva3XLnj/4flUEOtoRRogZZXqgzoZTSd4EfJyyqyGE1WJfG8G9KiM4bxw2JzvZd4xwT
	 ghEPt37GYN/GQwUBsadFs2rrQLqVGeoisTORBeELNvNj+6yBCLrOev4OBfPtcj99of7Ks
	 5TyrB5m68LGN4RVV49dfdYJcmWVeU4KqinFHRXeszB8z4ZuWSTh0TT7bI2YobnH2Wie5I
	 eUhtW2F9RhsLV+3G6Yoi6C4HURqw8TMKz6lpDMLb1jAWS54GRC4nXqwJADqllSA5/tw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=linuxfoundation.org;
	spf=pass smtp.mailfrom=linuxfoundation.org;
	dkim=pass header.d=linuxfoundation.org header.i=@linuxfoundation.org header.a=rsa-sha256 header.s=google header.b=RZKnL3TU;
	arc=none smtp.remote-ip=209.85.160.45
Received: from mail-oa1-f45.google.com (mail-oa1-f45.google.com [209.85.160.45])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8DAE5606A31F
	for <linux-kselftest@vger.kernel.org>; Wed, 28 Oct 2026 21:06:43 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 8DAE5606A31F
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linuxfoundation.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linuxfoundation.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.a=rsa-sha256 header.s=google header.b=RZKnL3TU
Received: by mail-oa1-f45.google.com with SMTP id 586e51a60fabf-4a75171af39so408270fac.2
        for <linux-kselftest@vger.kernel.org>; Wed, 28 Oct 2026 14:06:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google; t=1793221602; x=1793826402; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=dYdUZQkYdLc0vauWbIqi3zABPNcb2nwtA8yBjqhaLho=;
        b=RZKnL3TU91MknhH0PBI6QZVMUcwt1SUpPSrfgEKjkIikcI2UgLeVieNt6W/vKdD+ni
         ZlzEvAK8j+4uYNKqrUDlDHihQtPPOUoBEy0s0xfMsaOvZ8lBWNpEMl2uWLzPY6g38BiG
         HkEslqoetMhPitOO7lA3e/fOsmOLctT24KIE4=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793221602; x=1793826402;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=dYdUZQkYdLc0vauWbIqi3zABPNcb2nwtA8yBjqhaLho=;
        b=ukeNUv2r7ZxnAB0GtIjcXNpD1XYy82caWnI25DS1OcVsS/+SsRAyJSj0ulRtM/Ez1B
         Na7VzY9fK9V9LwZuyGkw5k/JK7ZwdiyE0CfO866j7bw9ZZWKpyUc+90hSHG9dlZBwaPm
         nHnDLGOD4XnxtKB8R1rBt2ypTKagB05bP+HMu+KwoEMY0+BppH/4amdFi+/U1+mQMKIa
         Ii73w+TWU0w0P/ejqsoOoudD1gAbjqwvTKCD7VDmM6hUvoB7mCK3ESift58Ihc7lW5Cz
         UjW/EueLhm9iaY6TzJGQmBG2w4YlhYf8N9Byf2CoRYc9NB8spDGYETjgQ1c0BLT0ITjo
         GClg==
X-Forwarded-Encrypted: i=1; AKwUvBweT8GV9rBgDDEuq/ADl9Wr1ZIEDmmlf+o04RfLaayFaiIfhyxccWnY8Gjq41eLr50Q9CNDLibD2Utb4VpjejU=@vger.kernel.org
X-Gm-Message-State: AFq9FYKdRmkACzF0vjQMW4SpnKadAx4J7lBuWscHEhJciYEiRBtHdXtw
	MVKhS6yENr3Dp3GLd0w8RChqdXfMldHMTjRf2QMcmv2ZY6dyMeEzs23g8WmXov2Ty8g=
X-Gm-Gg: AYBFou2Bnn32bt8PQUayAM8nrv5Wd2U2zUFnBWV53a9Bvoq6outyzozdCAz52GZX1Yf
	TNSrrb02nKpPxxKxMFkmoftsgcMJp1gyduu5vLRifqgixOYstSDqF0l7mOBly3hWSM8cTnB8H9T
	AdQrH1Bc76/wbHt16JWsbDp29mGvQhFU2VPXD2f7kLU+OR8pXXYIbFOMuuWApKXZlsAhuIHmfJv
	Ryyyzu9puZIT1B9Rvf/yWH+OnbmQ1cvLBjF04TNRxyPn4oJvP5pm05rt8nfpNREydN5Iho2XY6o
	gVlLQrPzixJh1Fo53St+ywbIdmr6JbSp8scCKQOPbEy7TCK/Y5IxGk/8bKDianbjhMqecZsaUEU
	RcAi6QDNRQpEb/8DnwrBEgro2omIoxTjt/DOW7Xu1PeHED7YUj96sRVr2ocsv0YjQ7pROdjWCTv
	z+X6XcUmzl8F0lM7cDz+qZqverGwaIgAk8vsqVCmsv4HBNHvPfQhGhBljjQFimKTPJi19hLsFTm
	75Yvwxna1+Xx4ud47HEc/zkrWFAruzg0aIFOcqhNy1L5JWzGzE3gtdJBeUdeNPyWEdJwyR5jmvY
	gaC17bzf0d5w//uShh7c8q/jsbWHylhMM48gxiE=
X-Received: by 2002:a05:6870:d184:b0:49e:4ed0:11d4 with SMTP id 586e51a60fabf-4a8bb701e65mr2458445fac.50.1793221602376;
        Wed, 28 Oct 2026 14:06:42 -0700 (PDT)
Received: from [192.168.1.128] ([38.15.57.99])
        by smtp.gmail.com with ESMTPSA id 586e51a60fabf-4a8b77ac4e4sm3068523fac.3.2026.10.28.14.06.27
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 28 Oct 2026 14:06:29 -0700 (PDT)
Message-ID: <9c65a285-9144-494b-b4d8-e3d0deb671c7@linuxfoundation.org>
Date: Wed, 28 Oct 2026 15:06:26 -0600
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Post: <mailto:linux-kselftest@vger.kernel.org>
List-Help: <mailto:linux-kselftest+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kselftest+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2] selftests/ftrace: Add missing spaces after ! in probe
 syntax tests
To: Jaewon Jung <jaewon8868@gmail.com>, Steven Rostedt <rostedt@goodmis.org>,
 Masami Hiramatsu <mhiramat@kernel.org>,
 Mathieu Desnoyers <mathieu.desnoyers@efficios.com>,
 Shuah Khan <shuah@kernel.org>
Cc: stable@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-trace-kernel@vger.kernel.org, linux-kselftest@vger.kernel.org,
 Shuah Khan <skhan@linuxfoundation.org>
References: <20261025075044.1750113-1-jaewon8868@gmail.com>
 <20261028011923.2050009-1-jaewon8868@gmail.com>
Content-Language: en-US
From: Shuah Khan <skhan@linuxfoundation.org>
In-Reply-To: <20261028011923.2050009-1-jaewon8868@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 10/27/26 19:18, Jaewon Jung wrote:
> Add the missing space between ! and grep. Otherwise, the shell tries
> to run !grep and reports "!grep: not found". This always skips the
> conditional checks without checking for kernel return probe argument
> support.
> 
> Fixes: 25f00e40ce79 ("tracing/probes: Support $argN in return probe (kprobe and fprobe)")
> Cc: stable@vger.kernel.org
> Signed-off-by: Jaewon Jung <jaewon8868@gmail.com>
> Acked-by: Masami Hiramatsu (Google) <mhiramat@kernel.org>
> ---
> Changes in v2:
> - Add Fixes, Cc stable and Acked-by tags as suggested by Masami.
> 

Thank you. I will take this for 7.4-rc2.

thanks,
-- Shuah
