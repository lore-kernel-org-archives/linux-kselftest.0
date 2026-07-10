Received: from mail-ot1-f45.google.com (mail-ot1-f45.google.com [209.85.210.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EF9212E7F17
	for <linux-kselftest@vger.kernel.org>; Fri, 10 Jul 2026 17:31:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783704679; cv=none; b=Xr/XB2nXMNkfJUIynHG9SEs3/ii74j2To5+y51fsBFYBsg5dNll/+MT3VhSuHKro+SNNp0O5saze0P48u3kGs9CsO8Q8Z4kHm+wW8N/APhgMu0lvK6nh8BMSwdy8zpNpDiFEf1pa0tZMlZytKw+kQYOu2/E+VRm/muMVCvtUFBc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783704679; c=relaxed/simple;
	bh=z2C8CVEChR8wGjCxGwBW35WZ9ORNbC6kr+MOgf81bCY=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=My1ChQz2qMMA2/Lrfdlwiaoa2bWaCHUc/NuQWhtbT/qD87d3PNnU5FjpJ4DEvKISwJYFLhh0dLTnf72ytg44Gp54ugXszBHpOAAzfiwbyr1AZObk6LXzwb4IW7c/rNnEEob07WbFgV9VnHD208Zuvk6aJvA6e9Bn81beJdCCngo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linuxfoundation.org; spf=pass smtp.mailfrom=linuxfoundation.org; dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b=f63QTJp9; arc=none smtp.client-ip=209.85.210.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linuxfoundation.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linuxfoundation.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b="f63QTJp9"
Received: by mail-ot1-f45.google.com with SMTP id 46e09a7af769-7e9ef94c0e2so599364a34.3
        for <linux-kselftest@vger.kernel.org>; Fri, 10 Jul 2026 10:31:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google; t=1783704676; x=1784309476; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=l4+NLBnB0rHrMKuhhVwyzWB3Dd7RcWNPm8QZ4toNsA8=;
        b=f63QTJp9Cw65pGJsUDqkHZO2OQimp8PM815IYB0idpMJAn9mm5Y4uwpTi62eniTGlO
         Soy8V3qvjzWW7JeigKx0oxC30I4hv/04AEWpybeFbBhmK03VuecM+dQ4PblypvScOVc0
         Ko1iQ+YsHxwGXXhfSOqeG1/H1lgc7j/4exozI=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783704676; x=1784309476;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=l4+NLBnB0rHrMKuhhVwyzWB3Dd7RcWNPm8QZ4toNsA8=;
        b=RrAklT0xP4iZeKQ0E1dFjqiId80PQJS0CW3+M1l2kB+/QVBVJ2IJ8rxsjeZIP8JxZX
         N5gOCztwqXvRxK4XpfWiZvAdJFT9DbOj9XXaXBBUwOxjvisCPR89JSJR8k85wN0ZKuPg
         5D/hEAbxpnqJBcv+A57Z0oNj6AyXfqUHGKRDQIWVtwsBW8NwpLHCGhB+vs7XcppCnyEK
         OVQkkULGAPxyXrh2LECvjfTRQgkkbKZDFfh8JVlFTmFdiMSXnZfu5ePNQNpmThoN2Xwb
         X9+h7mFExlUWnTo/o/Jpl09id/nqXIcO4IBJKC2hmZusqA2NsHkSAFyGSFxt9W6Ms/Wc
         x/HQ==
X-Forwarded-Encrypted: i=1; AFNElJ+uiPgBko54BMcubyesVmVSaUcb/O8WP8fefHbFyEOHg7Gmy8ZWlOCEfG5HcBRfSAaYYAxkcMPRWfapgmZyKoo=@vger.kernel.org
X-Gm-Message-State: AOJu0YzV68E6aROmEuP79lGcGsFp+CpI3y49Z7nhnpf68YPHvfWoT1SA
	497Nsu7VUXBDi5NdBSwoWiN9TpRvZa7CSieaoBkBkOOGym7LeACIAKDWrywsVjQ1iOY=
X-Gm-Gg: AfdE7clq+/dhSxFehUfKt7iexUu4bu0aCWq0IMygWvBFbFqFc3aY4l3DfZM4ryDORcM
	5KcoLgNg6YT4hTNhG/h9YljgG4dbnXkipxkeV93fMRYZ7/ZY1r2DekvlmQHMzCg/uPsR1v9RT4W
	2mByj7s1sIsQWju59BEL1VMrwNIp8IK3oANZkLjOzxRBVs3opw3AqhXYVtL9kEupqs6E5C5ruT9
	/os9f5BY3FISRGfQ3tG5p7kbRdwfEHljNTr9Ozyso9N8/lC0QBaOiYCJFIn6iS7T8eteuA/2Sam
	4xDc+RWr+yiGAYfov2feL0ntqOF3yTGg5Be75zc6nDA3XbThsx5JVytzs1Vwn+gipoJEuP2vt6P
	U3spp9tOBYP08sNrLNT4zQr7fb/+uh8itXpfHpVfM6nR1TPEJIkYSaqeHmqKJA+gLdw+yftyJJ3
	DtvoukqPXaUXbNXLCemqHcfAyXWESr6a7l
X-Received: by 2002:a05:6830:6119:b0:7e9:e709:44f6 with SMTP id 46e09a7af769-7ebcfe99c23mr9582153a34.12.1783704675799;
        Fri, 10 Jul 2026 10:31:15 -0700 (PDT)
Received: from [192.168.1.128] ([38.15.57.99])
        by smtp.gmail.com with ESMTPSA id 46e09a7af769-7ebcb2bda95sm6635283a34.24.2026.07.10.10.31.14
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 10 Jul 2026 10:31:15 -0700 (PDT)
Message-ID: <58d4411c-000a-4031-8a0d-e5858f056c82@linuxfoundation.org>
Date: Fri, 10 Jul 2026 11:31:12 -0600
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2] selftests/ftrace: fix spelling error in poll test
 comment
To: "Masami Hiramatsu (Google)" <mhiramat@kernel.org>, shuah@kernel.org,
 Wang Yan <wangyan01@kylinos.cn>
Cc: rostedt@goodmis.org, mathieu.desnoyers@efficios.com,
 linux-trace-kernel@vger.kernel.org, linux-kselftest@vger.kernel.org,
 linux-kernel@vger.kernel.org
References: <20260702015634.366201-1-wangyan01@kylinos.cn>
 <20260702142719.4e5f6ed1691c6dedaf2a0cd6@kernel.org>
Content-Language: en-US
From: Shuah Khan <skhan@linuxfoundation.org>
In-Reply-To: <20260702142719.4e5f6ed1691c6dedaf2a0cd6@kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 7/1/26 23:27, Masami Hiramatsu (Google) wrote:
> Hi,
> 
> This looks good to me.
> 
> Acked-by: Masami Hiramatsu (Google) <mhiramat@kernel.org>
> 
> Shuah, can you pick this through your tree?
> 

Applied to linux-kselftest next for Linux 7.3-rc1.

thanks,
-- Shuah
