Received: from mail-wr2-f12.google.com (mail-wr2-f12.google.com [74.125.225.76])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3A73643F0BF
	for <linux-kselftest@vger.kernel.org>; Thu, 24 Sep 2026 21:16:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.225.76
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790284603; cv=none; b=H+r9QD1WOcrg2H0zGHG4Lj/kExaT6J1qBpfokwjOmV/yVGYL0CzjLKAkeKzSaYhcW3D81N2MV9CE+c25G0Z83DHN8qANTPx3nzW4Qd92mGDbyqkhwEXsdnh7ahQYs4mp5rX+Nh8kVt0wh+u4qgPomi6CTwK8KE2eqihsC0JwcWE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790284603; c=relaxed/simple;
	bh=GSpi19COajyBmeu00h0HL0wMdy2XKh2WLArdLFA54KQ=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=WDVgACJLU4/irxXplYpNE8Zn3J0AVT1zq7cyxaPOjpxmH83R6lT+Hy8PVKH4tDYMzSCKFeOcEbkm9hoDPxNBRGLdxChEB8bcF3JHFdyNEt49AYBoot3K0JTKedYK8DfE/GuX/L6R2c8mtlaqfoj33qEH9Yf2XbdCdoZzck95osY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=a6Pp+Ngg; arc=none smtp.client-ip=74.125.225.76
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="a6Pp+Ngg"
Received: by mail-wr2-f12.google.com with SMTP id ffacd0b85a97d-4843971bdd0so30831f8f.1
        for <linux-kselftest@vger.kernel.org>; Thu, 24 Sep 2026 14:16:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790284595; x=1790889395; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=KfGvfwNr/tckeUTW0rQax9csKD8upwKYtURB0NTilpk=;
        b=a6Pp+Ngguqb1Ow+2ob0ojGblJ4rb3uzRhiqmBB2FAMIP8jsC/nHzn0UqIeCIb2i1oU
         br1hFZ1QhozdoyGXU45NOW1asGFp/3dWmqKwXeCIVYP2T7hyi7+EcLpJ+tqNVtKuDZhP
         QoXv/iGQ7ziov9uM1OZ6CqLRrzdcyQBZBHrYYFyD0yowcWO/lT3fvQlgaSahBaphC/2h
         4CA85hF0JVXZgv6mpA9+GqRszu6UEldvwCCHz3WYyd3FONPvnw5CXwZOLL7z/JaIaJFi
         kO4izjCaFNKaMCbufrhN49MelKfhCa40w0gA/XMiCIISiXgAa8bITJucqTWBVcEPxjh6
         CCag==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790284595; x=1790889395;
        h=content-transfer-encoding:content-type:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=KfGvfwNr/tckeUTW0rQax9csKD8upwKYtURB0NTilpk=;
        b=U27r2NXM6urYAaHuotENV0LddkW3snbB+Zc9C0f9dD28jBfd/06WRhdPM6DYuDRBzF
         Ox9apVmG06bN9Rpw1Tx1urrVLatf0OO8OtnHycDKxd5pAmfdAWltb4AUCW362m3DiWIv
         j36ufpIVMQokGK/SlxF2u/mOcFG+FdymWH+Oh0XlIDQNed5uqRbUR9fQ+Q3aWwxxe++L
         XsxOuMAU9dlN8ob+3ZX68jYf2O49JD4ZmsVgBrnUozTxzMIoz+R+V41tbAJe+boSFpvv
         GBA2diOrycPN8dCPAMG8/rf7DLhMmjN+jxZDpUXUfWoj0cQz7o/fKCBc9xNu7SN6FuRi
         +0oQ==
X-Forwarded-Encrypted: i=1; AKwUvByMbWw/aFNYdQgSASBfvJT2jL3YIFTn7ALiI0Wehx4M+V64wZheYm0/BYfnCwlXNM9z4jkQ/RwrPILGXTHFC4U=@vger.kernel.org
X-Gm-Message-State: AFuF++lU/SIs6JnojKsas/Hl+agNPKF7V6J4S8/tPwQSeaVnSojTFP9X
	YhnUKLWbNZFHU/f6CHpw1sEeseVPt+NvOxesNu3fRJ8jZZ4kvCsTO5OT
X-Gm-Gg: AYBFou1H5p0Tr/fkDWKrByWDc209KaCcIXhkF6+6yYSZoRbZG8Yn8y4uL/Xwmw3Wuyr
	Sly4w0u7PwSowl3VgXML3NO1g3tRURYXo/bS8oaUJ1JfkOhEEvgWTJZtqgpwbV94XUvY0Xc9LNY
	i/b0Uo/xSCYSvT/sCuKrYljHYhj9rOtopzsdYGvtoHxNoq2Fsao0rbRfiGYOPMYncCYDdc9w19I
	M7zmO5BPpM5Zo2WubQOWJQWMf/guZyAESB1vUBb+OgYJok+QRHF7/pC6jh4jZQdDMqz0R0egG/k
	FWq+2xNP0WKxdXFZmD+wTmFmH3mdMpZakMuwgovV9pCRe7nng9xPU3o2nIbfd/h9s3sGlrYLcTN
	P+uMxcPTqqKVuu/NVO4R5oa0qPXWvVUd5VO3KlEDlQR6x7hcTRKtF84X/Hc5qhjUKOepXi2n8OI
	9WMLLtxgsi2onvgzs1lolq+9uGSIndfNkvr+oRh5a8+v3u0gxFncsnwEQVy+xm3D+14wxsnHhkl
	fuDfiZ+IJqSzO7hMXq/YLqhcbkJ2bGiJTfOtoeojytMnIlFWM9TGPMNXfqdy8rb5Wp4osisLYqC
	nTGZwV0KJEAlDAzkIu2roNo2jLBJunpgm4QJK95ZSuOH2kfCnPeY0J85LWd6b6h2gazT1JcB0i6
	MLnvUwEcYKtXv991SZbAi
X-Received: by 2002:a05:600c:8b4c:b0:49f:c432:885 with SMTP id 5b1f17b1804b1-49fe6702398mr60249845e9.2.1790284594803;
        Thu, 24 Sep 2026 14:16:34 -0700 (PDT)
Received: from ?IPV6:2a02:3100:610f:ecfc:4dfb:2ac9:70ba:48bd? (dynamic-2a02-3100-610f-ecfc-4dfb-2ac9-70ba-48bd.310.pool.telefonica.de. [2a02:3100:610f:ecfc:4dfb:2ac9:70ba:48bd])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49fe5ce4941sm92677785e9.6.2026.09.24.14.16.33
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 24 Sep 2026 14:16:34 -0700 (PDT)
Message-ID: <4cd6377a-e0a5-4058-bc72-40bb32b2d26a@gmail.com>
Date: Thu, 24 Sep 2026 23:16:33 +0200
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/4] net: hsr: fix packet drops caused by GRO superpackets
To: Sebastian Andrzej Siewior <bigeasy@linutronix.de>
Cc: Jakub Kicinski <kuba@kernel.org>, netdev@vger.kernel.org,
 linux-kselftest@vger.kernel.org, linux-kernel@vger.kernel.org,
 davem@davemloft.net, edumazet@google.com, pabeni@redhat.com,
 horms@kernel.org, andrew+netdev@lunn.ch, shuah@kernel.org, kees@kernel.org,
 petr.wozniak@gmail.com, qingfang.deng@linux.dev, fmaurer@redhat.com,
 luka.gejak@linux.dev, xiaoliang.yang_1@nxp.com, skhawaja@google.com,
 liuhangbin@gmail.com, stable@vger.kernel.org, sdf.kernel@gmail.com
References: <20260809121455.1745-1-xiexinet@gmail.com>
 <20260809121455.1745-2-xiexinet@gmail.com>
 <20260813182111.088aee3d@kernel.org>
 <7c09a44a-19d9-43f5-a852-12f5b6579641@gmail.com>
 <20260923103238.cg3tr_40@linutronix.de>
Content-Language: en-GB
From: Xin Xie <xiexinet@gmail.com>
Autocrypt: addr=xiexinet@gmail.com; keydata=
 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
 sNySbH3veZ/55EtlXA==
In-Reply-To: <20260923103238.cg3tr_40@linutronix.de>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 23/09/2026 12:32, Sebastian Andrzej Siewior wrote:
> Would adding a NETIF_F_HSR_SLAVE flag to slave device(s) and then filter
> invalid flags in netdev_fix_features() fix this? This should help
> against enabling and add a warning if a flag can not be removed.
> 
> A netdev_change_features() might do the job then.
> 
> Sebastian

Yes. I'll use a port constraint in netdev_fix_features() to keep GRO,
and GRO_HW (when configurable) disabled, while the device is an
HSR/PRP port, incl. the interlink port. And call netdev_change_features() 
on attachment and detachment, preserving the GRO settings.

-- 
Xin
