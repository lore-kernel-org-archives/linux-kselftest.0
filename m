Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 636803BF67D
	for <linux-kselftest@vger.kernel.org>; Thu,  2 Apr 2026 11:17:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775128660; cv=none; b=k/LjPDRT7HMbWufag3XF6A+X8Sk5d90x6Ltdd9zmpi1HtfaCvW6wD/luD4+mzaJ9x0grJc87Mko69UIS6+XPKkgwYY7xAciaGczK5oT7Hz2NHGTN9UNjVkAVmK1OkQq9Fpn23aQwjb4zhpD9Gp32a+r0XpvpMA5sBm1rvJ76yV0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775128660; c=relaxed/simple;
	bh=GWWUAnMaoAnXvUfbVWwutVCS6bQJQeajr3pFkbiEsfs=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=WGtJSER1Kc3Nf2OIvoCArlOC/emvL595Dah9SKNhHatcdwFnTrvw+Wuf/Nykudkht5cPHkf4bGYjsdT0Gn2Tn7M6vNjbYkCFizZB3fbl6n8YX6hTNC7hhtfA4hrelKDKm4UOZ6P30dXvgXzwS4UeotpgMezaMaelwUkH7k8/fbE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=HBBnWrG6; dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.b=KyQoorG1; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="HBBnWrG6";
	dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.b="KyQoorG1"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1775128654;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=8eKcE5S57vmQb8/l9YcFNLF3LkeSC2enqXF3R6bEYVk=;
	b=HBBnWrG6g5cze9nuBRTIxklGsHAA+aevWeuCrX2JcndhRr0+FDHRLpAppEw27cIjyAhnaM
	Jh9+jh0sElQDeJ/pITSsnTDOosZSvE8nUaKziWPmolwpscgfr5Xfa0wdJH0Y0mjTWEhOvp
	E+2T3RCItZX4rzJUIdYUP3a89mZGRkk=
Received: from mail-wm1-f69.google.com (mail-wm1-f69.google.com
 [209.85.128.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-711-Z5J_WgjuMVCGdCfrQKGtkQ-1; Thu, 02 Apr 2026 07:17:33 -0400
X-MC-Unique: Z5J_WgjuMVCGdCfrQKGtkQ-1
X-Mimecast-MFC-AGG-ID: Z5J_WgjuMVCGdCfrQKGtkQ_1775128652
Received: by mail-wm1-f69.google.com with SMTP id 5b1f17b1804b1-4837bfcfe0dso11767595e9.1
        for <linux-kselftest@vger.kernel.org>; Thu, 02 Apr 2026 04:17:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=redhat.com; s=google; t=1775128652; x=1775733452; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=8eKcE5S57vmQb8/l9YcFNLF3LkeSC2enqXF3R6bEYVk=;
        b=KyQoorG1szluKpdf511A5DSC6k/YSoUZqE8RL4iYjmG4bwEXm1vEFSkUI26q7PipNs
         walVn28m5mX9uJw4Wq3Cvm9WHCTgSnBsNbdaptBogTEweNPpXAH32v90318Up3ab0pPH
         aFKqHlXYvtvrbZJVf4JJ7QlHZIX0CImLqgxKD2qq7kvYl62gQLEmBF0YtXkdQOPCJLdf
         Lw0X8ipzsOPJAQF+oBhOxz1tluuHEpFcoMpB/8qIpjgX49RBW61FR8YjMqxafXVlTqbg
         xq1FpOKIEHbqMMqtIkZ/QIiiIUylylFwFcJJo2CcykRuv5TN7vk8O+UD5YRWoXNSgJY3
         FkUQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775128652; x=1775733452;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=8eKcE5S57vmQb8/l9YcFNLF3LkeSC2enqXF3R6bEYVk=;
        b=rpE9+2/8ZecRX2sZUKlrJHA5ISzPN0s9PtcL413LPNJZkVeckWgGkS5pYWTP5tLizd
         oq7QzMpMC/KERzv+YfOqKF/6auZM/xt6mA64pMkGCHhlqZyWyJpoZZWCFY0YXDz2xntw
         9i7DYt4SkrNe1IhPJv5UVVPTIVjnh1BOZYM92tINVkvgwaEoZ1AWBHlDTE0nAp8I7mgU
         RGOLvu/qHGPUREQSH8Ofe2nCdwOjDjlGQ0HRaWjWVDPDoUZaJZYFbe6lOEY5HHuPIecg
         zJBVZoWfotj99LdxVz32avlXzsENkL9564v0sgcoV3AWPmcZSMtBNZSrnpgfaE2b7mNk
         mPsg==
X-Forwarded-Encrypted: i=1; AJvYcCVL8l6+7J9VyUtFyKORYfgKGECDLVsE021LzBevQF2qMKwHZRbg++61lwAxQEYlJXsBJxmYs//vAtunEq96MAA=@vger.kernel.org
X-Gm-Message-State: AOJu0YzJkDmLy40HVd7eFg4qiQ9jQvkNCckLG+w3R2evscfSBAoPIPxy
	eZvZ2pWvk809iowR7zuWrvO3dVpVnpeYQfpTH2ma6s27sqfeLRESPl4jpQfMlp6TpfA4guEO91V
	rsK7zG/bp+0WS6/+BnADu0580iW6rCwSb5kHq8LbsxzT2B7StGdkFGmaIENGrF5WuJ1Bmkw==
X-Gm-Gg: ATEYQzz/KK/N2BjA5gDu46oB6rhPSXDJKPX4WDRpCshcfsqP9QhFflz9Bz7yd4F1u1I
	/dDt9KV/aUQyFjOFJaQxeokLQ3HQRnZpOVQST9lq8nxu/13UciiXcNo52Fm0Xco79r9hXSB0YK8
	OlDLvixFaZYRQT33wDNvT8ghU9IZeywBD4HXJsSJCtCuZEjiIwrkDrrIEr0I+hyKIGcVhzfaiEJ
	8UOC/SNc3aHNFN2b2Ug4FS/aWZ8oHYj2bNdBRGRShVhRET+h+U9gMUoGFpPzvaKHsuKbVc5K1WH
	E19DeeGdH5jR+gBF4tpDDR8ukO0ahCwK18yW3Vx2eN39hEYoljNqUPpsFPWIPBByMR2jLzFe+Ua
	abnoNRxwNCRHEVIWayhQmFCW3Aq6BUhSpyQJR2yaHKbjjbaQYiXzn2CLu9g==
X-Received: by 2002:a05:600c:4f95:b0:485:7f02:afd5 with SMTP id 5b1f17b1804b1-48883568005mr124877485e9.13.1775128652084;
        Thu, 02 Apr 2026 04:17:32 -0700 (PDT)
X-Received: by 2002:a05:600c:4f95:b0:485:7f02:afd5 with SMTP id 5b1f17b1804b1-48883568005mr124876705e9.13.1775128651550;
        Thu, 02 Apr 2026 04:17:31 -0700 (PDT)
Received: from [192.168.88.32] ([212.105.153.248])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4887ad477f6sm64087705e9.7.2026.04.02.04.17.29
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 02 Apr 2026 04:17:31 -0700 (PDT)
Message-ID: <cb43761b-d414-4878-bf41-4ef6c988f881@redhat.com>
Date: Thu, 2 Apr 2026 13:17:29 +0200
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH net-next v7] selftests: net: add tests for PPP
To: Qingfang Deng <dqfext@gmail.com>
Cc: Jakub Kicinski <kuba@kernel.org>, Dianne Skoll <dianne@skoll.ca>,
 Shuah Khan <shuah@kernel.org>, "David S. Miller" <davem@davemloft.net>,
 Eric Dumazet <edumazet@google.com>, Simon Horman <horms@kernel.org>,
 Felix Maurer <fmaurer@redhat.com>,
 Sebastian Andrzej Siewior <bigeasy@linutronix.de>,
 "Matthieu Baerts (NGI0)" <matttbe@kernel.org>, linux-kernel@vger.kernel.org,
 linux-kselftest@vger.kernel.org, linux-ppp@vger.kernel.org,
 netdev@vger.kernel.org, Paul Mackerras <paulus@ozlabs.org>,
 Jaco Kroon <jaco@uls.co.za>
References: <20260330035604.133073-1-dqfext@gmail.com>
 <20260401081030.29b050d5@kernel.org>
 <CALW65jahWApDnVmFReW+Y3HDxBEmCwzsT1oyh03SW7X5ry6PzA@mail.gmail.com>
 <20260401175621.549c492e@kernel.org>
 <CALW65jaTbaosbO8ypKZ6G37HxuxXabeTaP_Fhq72xTovmDj+8g@mail.gmail.com>
 <50ae3c69-2c4e-499f-a46a-cbd207ff5f09@redhat.com>
 <CALW65ja1FV-OcqSazgKZhQhKf3oqr=kcGxyGkOGbhurGLOJ0-w@mail.gmail.com>
Content-Language: en-US
From: Paolo Abeni <pabeni@redhat.com>
In-Reply-To: <CALW65ja1FV-OcqSazgKZhQhKf3oqr=kcGxyGkOGbhurGLOJ0-w@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On 4/2/26 12:13 PM, Qingfang Deng wrote:
> On Thu, Apr 2, 2026 at 5:48 PM Paolo Abeni <pabeni@redhat.com> wrote:
>> Note that similar failures in the past in other test-cases were usually
>> due to timing issues. i.e. the pppoe-server starts in background too
>> late for the client.
> 
> I don't think it is a timing issue, otherwise the PADI negotiation
> won't succeed. The "updetach" option on the client side also make it
> wait for the negotiation.
> It's likely that the pppd instance spawned by pppoe-server fails to
> find the "rp-pppoe.so" plugin, so the connection fails when handing
> off the session from pppoe-server to pppd. Note the naming difference:
> the client loads "pppoe.so", while the server loads "rp-pppoe.so" by
> default.
> 
> What distro do you run CI tests on? On Ubuntu 24.04, "rp-pppoe.so" is
> a symlink to "pppoe.so" in apt package "ppp". Maybe an additional
> package is required for the distro you use, or I may work around that
> by manually creating the symlink.

It's fedora 43 with ppp and pppoe installed.

ppp provides pppoe.so, and AFAICS nothink provides rp-pppoe.so, and the
pppoe-server is looking for a non existing /etc/ppp/plugins/rp-pppoe.so
plugin.

Before I mess with the nipa testbed, could you please double check that

ln -n /usr/lib64/pppd/2.5.1/pppoe.so /etc/ppp/plugins/rp-pppoe.so

should solve?

Thanks,

Paolo

