Received: from mail-oo1-f43.google.com (mail-oo1-f43.google.com [209.85.161.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 70ACF34753C
	for <linux-kselftest@vger.kernel.org>; Thu, 18 Jun 2026 23:12:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.161.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781824341; cv=none; b=p/WEoZKyBKCwGuU88L9PIKE4jH07Jny3dAaj5XP38SZyHeN1MHUm/Z5KMhjepWVKNLoC6kW+Pkh0cEBaUxmDrvTDi88jfaDr8LvTOr3jdg3fHNvtoImsM+NskHfTeVPpJ/3zwf1TAT7CBOsj5cddN20U6DIA+pam677a3p86TAg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781824341; c=relaxed/simple;
	bh=Rb3Y//Sre39/nyDeLBoFOg1YSjOfc4f0txYFimZDY3Y=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=m3ZTUwShhKEIinFSXqT4/FZq+gfOAtsJhBW2vaWE9IrP0XEj45K/3JC8fAxQ7vIBdfWgdfb9mS8XEkhNa5/K3eFvguE9yDprltZxNkufxUggUDwNtgg5ujDy2zeCpbm7aVLjGHp0RGCjF7LFhoeECInw9GJzfkBIchtG/Ju7J4M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linuxfoundation.org; spf=pass smtp.mailfrom=linuxfoundation.org; dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b=EAaa5iv+; arc=none smtp.client-ip=209.85.161.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linuxfoundation.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linuxfoundation.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b="EAaa5iv+"
Received: by mail-oo1-f43.google.com with SMTP id 006d021491bc7-6a0ddedcd00so27736eaf.1
        for <linux-kselftest@vger.kernel.org>; Thu, 18 Jun 2026 16:12:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google; t=1781824339; x=1782429139; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=ZF2qOydljuKl+xI08v46srAj3OTtgmDQPahr/mcPXfI=;
        b=EAaa5iv+aDeyQcI1EGD6mRTqnTy5KwjR5ojBEBJnsDbgvwJ9JlGgcp7nLU6L8fA9fc
         dzyeLGkJs7tAmCdlFvxFzN6x32Pg4yjNR05UTrwUu/3wgGiWk24HI3AbRTmE+jKwJ5kW
         wN/nuAplUrMKsPOgXIieUUOseaJ1VlRMATraM=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781824339; x=1782429139;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=ZF2qOydljuKl+xI08v46srAj3OTtgmDQPahr/mcPXfI=;
        b=OxkpXHebxCpMtgc+GHyyzK+O4uXRDYTYF+1iWGm4hskbaFe9E2QFCJB3tB1XvB6psG
         rDKSSHdkTvrWJBoG6NjroB77ux84gif/YLZm3oJFJ3UTyrVcsWvw5hhcH+70+Vk8jfVW
         qomO+XH10poyos9d9okuFZHqv0y9uZKSuFopN9Vm1OBVMvqjWob4ongFAFU+5Y1NBl4P
         9G+mJziMhghnxe3DjzOg+M0rF9G3PKbEjvQ05PqPsomWfQD6XnPh7NvlfislWdokLfd+
         oDMjZDOMgAaQRR4bSGyJTW7can8/Bh2dHYZhoL34UgZwcbXopHxnC9UF1lLubnX0OUAC
         L2qQ==
X-Forwarded-Encrypted: i=1; AFNElJ8aGniJYk+W3C2hRWv+Ex6+Ntw6CjJZjmCaPJCkEmHbxIXOrte0cp9sI0W2OeLlc4d48qbrSotnJikbHRMetng=@vger.kernel.org
X-Gm-Message-State: AOJu0YzcsWLIghLvAgol8U+8/IOi+xMbDMgW7kpQqsBTrvhqF/tclSNR
	3f/Y7QbcR4qiUqYDK1AVc2gDOjmoC0Wizr3fD6DQj4BlfOarYqGhdD8sEQl3aLCMfqbPBZdJ1kH
	gxnSh
X-Gm-Gg: AfdE7ckE+hnFDy3+qRfg46j/bRKrHvAS+3BBL2boVSGl21waSsgs1KTX2A8BvE1V57v
	PY9UKfZwl+RmkhMCkgkPGRZwPQHIrkhU+0MVU77l1Prn2DQOBpOFG4ogEf13xXnjJfqTztWz5vw
	oNO6XSChNsx6eipGu1JFIAkEeF3uJHwmeM0re1tAcPFRvWOS2ryHR835oqfZIoNQ/OcTVH6h2qk
	+UzPw15w691NXevmZeIWW1yAWsnyQ0173HRTRDjSb5lqZyHIcuWbbBMU7a1tsyXqvbSQqo2EVOC
	kdhFgAUlmY3fdB/l79YCfPI7MVOJLzlUsOJUT1rbdtKa7EGipXJyjIgIjiGU+nP8CHMllM2U3Wy
	7oDe5ztDzpUqr0IdoJrR9H/YQ0cZm1VorQWpHKx2lu/tVJX0Mgwwebaz/flIFX5Ac5bAvNFlbfp
	1q7cqMZ0B6jqxxn/mF6rTA
X-Received: by 2002:a05:6820:4b04:b0:69d:513e:1a41 with SMTP id 006d021491bc7-6a0d89bc335mr1222609eaf.50.1781824339435;
        Thu, 18 Jun 2026 16:12:19 -0700 (PDT)
Received: from [192.168.1.14] ([38.15.57.99])
        by smtp.gmail.com with ESMTPSA id 006d021491bc7-6a0d9040c7bsm652846eaf.11.2026.06.18.16.12.18
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 18 Jun 2026 16:12:18 -0700 (PDT)
Message-ID: <86e7cb01-fb00-4954-a44a-8c10bef0b23b@linuxfoundation.org>
Date: Thu, 18 Jun 2026 17:12:17 -0600
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] kselftest docs: remove reference to obsolete/archived
 wiki
To: Brett Sheffield <bacs@librecast.net>
Cc: Rafael Passos <rafael@rcpassos.me>, shuah@kernel.org, corbet@lwn.net,
 linux-kselftest@vger.kernel.org, workflows@vger.kernel.org,
 linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org,
 Shuah Khan <skhan@linuxfoundation.org>
References: <ajOvQKne74gN-7Y2@karahi.librecast.net>
 <1306d609-3375-4f52-8239-b4c2fffb7bec@linuxfoundation.org>
 <ajQ1iGNw2lf_ZHqp@karahi.librecast.net>
Content-Language: en-US
From: Shuah Khan <skhan@linuxfoundation.org>
In-Reply-To: <ajQ1iGNw2lf_ZHqp@karahi.librecast.net>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 6/18/26 12:14, Brett Sheffield wrote:
> On 2026-06-18 11:02, Shuah Khan wrote:
>> My apologies  for not taking your patch earlier. Considering the effort
>> you put in with a re-sending the patch and following up here, it is
>> only fair for me to take yours instead. Hope it will apply cleanly on
>> top of kselftest-next
>>
>> Rafael, I am going to take Brett;s patch instead of yours.
>>
>> Apologies to both of you for the mix up.
> 
> Thanks Shuah & no worries.
> 
> 

Your patch in now in linux-kselftest next for my next pr 7.2-rc1

thanks,
-- Shuah
