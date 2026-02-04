Received: from mail-qk1-f170.google.com (mail-qk1-f170.google.com [209.85.222.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 65C92395DA5
	for <linux-kselftest@vger.kernel.org>; Wed,  4 Feb 2026 21:43:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.170
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770241429; cv=none; b=hCOUqOJiwYE5cjbZvvBA29xiBCJPCqMC9ImUe5Nh5SgAQlD6ZjYyYXful12Q4k947q4GDmV9aujeI+SRI+5Y06AR65uJpHFhm2lGgI4+CSR/P8q9XbKJo5U5s0iz2Tv1nYWGukPvXEXnSFDZWDNSDdPVipi2cCaiHJ7DLn5ihS0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770241429; c=relaxed/simple;
	bh=uSjSJKl78hq5Lia6xEiKVGn/CTPRc1DWNzhv5Hr+Rp4=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=PPhCi/7LrDduP+IKYEtzsjFeXNiBhBJp/kTXonYR/6TyflOehj1l7HTgaYRneYAt4tNqpiUEAqbRKc55oezGNEOTze46lIAv6MCPhyGwr0r+mE82M4jRCJXRp/M8OQxxP2sP4/cl5TKI620mHUj7abP6RszFEKIPxeGAxmT7rNk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=bYPKNrHs; arc=none smtp.client-ip=209.85.222.170
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="bYPKNrHs"
Received: by mail-qk1-f170.google.com with SMTP id af79cd13be357-8c6f21c2d81so19367285a.2
        for <linux-kselftest@vger.kernel.org>; Wed, 04 Feb 2026 13:43:49 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1770241428; x=1770846228; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=XXsIhyRwNN/Bse960XszdsU+YtMe68nKzM0mD5g1vRY=;
        b=bYPKNrHsV8znY7lqPqQvUv14MkFB5e7QtFWiH8Obk5YnF9vPzafoFdxX38ItBOPtgd
         sSwsRma+jiWhA2DkK2IMFTb2gpqjvwlYKgMy3wG4cjTQeRu6ZqAQCELs7tJ2MOhwVoLf
         DdnOR2ANOU1HFcIuWvuiDlPQ7xYgBM553S0lFfUGUCljVkUdvcH6Clm2quCnz8wKF/QW
         MZblvLahM/bY0UhKXHA+W8smfJ41ljiJnccuUMQR0dVp9uha+PTEQRejqlEy49TdJPNV
         yaHc6T7QEixpsGU13r+9Vt2tGUvpwFOosnwtcKlI8QwdD3LiSIl2d/MpMIiORUxQekDV
         OUgQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1770241428; x=1770846228;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=XXsIhyRwNN/Bse960XszdsU+YtMe68nKzM0mD5g1vRY=;
        b=GNWNuvfsVGPoERInT2QOjDcBOBSVIhVn6tU9omW6OlGc891VciV1bygO/Q0coGh29n
         br4eylw7k/tDyk5hTJdw/deJw+Y85D5CAbtENAxW6iaMsCNdSGby1EplbfUnrliCFp5T
         GV7wP6vTXvdb0pJkGxYbqY1sYqdC6lWU93WMZvWPOC0i7X+ccendwk8Hf16G7nLJlnWa
         oQWPoAsIzdhTMy0mTmG5eGLq8kcbkzee+3NvGG9rB15ElQ3jcW5Wsr1ff70KWulal3yI
         S6eBi1hfsnn/M01gDEMoa4g9ZNrObyGfAZ8EEXleQlVq9C72xVVWagHd+i8v8CBfM7WC
         UdoQ==
X-Forwarded-Encrypted: i=1; AJvYcCWt5z/BZ+VcBJhPckzEpMMUtgBlMB3SOB0a+Kr6+kdwpyziY1STdWUe/ShHvg4pWYYefeEn6T+XC/Mhztafpk8=@vger.kernel.org
X-Gm-Message-State: AOJu0YxYsx9d3/8AYwhRyUqWE62fFe7VPbjN6pPWg6WzIwVIB0IVeIpd
	uxFnPy2lccPlBqsPVaE37x7d5yA3HvzeA/heyypOOxmFyqc6OWvqRoa8
X-Gm-Gg: AZuq6aK6N97sEVdVvQfnFRNRCOzp84tjSbSLrjmxv+e9VIBI8dlUQLZ10w2QWGagI4B
	PojNijPUHTRQhc1IgzoIVxhCzuE5bICSxzeXz+vs24dvDwSX5iyT7wItW5v2YjEngyDeCZAVcY/
	yx+vVZP7VRtyMJqWq79htYBRK/lbNEWpN9rRF9F8sjcOSq7KbcfTlHWKI6VQ6NQN88+Am78K+tQ
	SVMyj7m3H7+u+cEYxvqe5zWXrB9vqUIXvXMN183qpXf9ipZg0VenPeT2sdSZNuQhgpf9c0AkfBS
	yrZE3uLbcB51Qw9E0pMyZxFYrODTmXIHUNG38nmoeBhARrmbQNdUIK0KTxrpfiFyrEgPpv2Eal9
	vkVi4QcaumdSn4m7KqriMQsITUAH7HRAUZk14SxwyJOVAWdLnEVbHeCPAs2Veeqs6Fl2YMCHMsq
	C3V9C/vDQ6rDgtX4MDhgfFoW1Z3VDPcxQq8I5OPxCo7IYXcUGaYLKeLIr5gSRJXcyWoQ==
X-Received: by 2002:a05:620a:4cc:b0:8ca:305b:7481 with SMTP id af79cd13be357-8ca305b7504mr455744485a.61.1770241428298;
        Wed, 04 Feb 2026 13:43:48 -0800 (PST)
Received: from ?IPV6:2600:4040:93b8:5f00:52dd:c164:4581:b7eb? ([2600:4040:93b8:5f00:52dd:c164:4581:b7eb])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-8ca2fd2df44sm269881185a.30.2026.02.04.13.43.47
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 04 Feb 2026 13:43:47 -0800 (PST)
Message-ID: <f3560398-d6fa-4f05-9496-f0e59a5c0fd2@gmail.com>
Date: Wed, 4 Feb 2026 16:43:46 -0500
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH net-next 0/9] psp: support rekeying psp protected tcp
 connections
To: Willem de Bruijn <willemdebruijn.kernel@gmail.com>,
 "David S. Miller" <davem@davemloft.net>, Eric Dumazet <edumazet@google.com>,
 Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
 Simon Horman <horms@kernel.org>, Donald Hunter <donald.hunter@gmail.com>,
 Boris Pismenny <borisp@nvidia.com>, Saeed Mahameed <saeedm@nvidia.com>,
 Leon Romanovsky <leon@kernel.org>, Tariq Toukan <tariqt@nvidia.com>,
 Mark Bloch <mbloch@nvidia.com>, Andrew Lunn <andrew+netdev@lunn.ch>,
 Shuah Khan <shuah@kernel.org>
Cc: netdev@vger.kernel.org, linux-kselftest@vger.kernel.org
References: <20260204-psp-v1-0-5f034e2dfa36@gmail.com>
 <willemdebruijn.kernel.37bf21c78aadd@gmail.com>
Content-Language: en-US
From: Daniel Zahka <daniel.zahka@gmail.com>
In-Reply-To: <willemdebruijn.kernel.37bf21c78aadd@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit



On 2/4/26 3:45 PM, Willem de Bruijn wrote:
> Daniel Zahka wrote:
>> In the case of tx rekeying, as soon as we install the new tx key, we
>> have no use for the previous one, and it can be disposed of
>> immediately.
> So this defines a rekey event as an instant in time. An alternative
> choice is to rekey at a specific seqno.
>
> The difference matters only for retransmits.
>
> Not sure there is a strong reason for either. But probably good to
> state the choice explicitly.

I suppose if we think about a rekey as occurring at a seqno we could do 
away with the deferred key deletion, and instead just wait for data sent 
before that seqno to be ack'd before deleting the key. I would say if 
nothing else that would be a significant improvement over what I have 
right now.

