Received: from mail-wr1-f48.google.com (mail-wr1-f48.google.com [209.85.221.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 047A23E9C2D
	for <linux-kselftest@vger.kernel.org>; Mon, 13 Jul 2026 11:42:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783942969; cv=none; b=sZhiwmlOUNYUCy/l+4fO+bdtdvj0/3FdnSxh0VWim+2km5m61qRaPicJdTGtDS7El0QYnyMew7ndQIoRRoTa5yLkwmV8vb5wUE7AxOEbuva/JxtcN2DaYb4O4H0y7433yW05pya1XA8S1/kDkumP1WUmX1GE/7JK5r+FukAFxFU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783942969; c=relaxed/simple;
	bh=JkbTCkSFok8pzMwNoDJhNxzudjFtN+Y7wellUDbyKV4=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=p0HLLbQIYDQFd9UAL5GCvHsbd2qKaKLTyjLiJx3BFACnG8P2Vp8dX9kfIO7bjxaYGMc3CqS0vK7O4GPE+L7MPBrApp+fvsXhOCuCT6wz4VJ2adzRoSxYYT1Hb/dD659lmU2U1TNv6uRYjF3UpiCrrQyN+WVk/OUOflnb/Eg4At8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=openvpn.net; spf=pass smtp.mailfrom=openvpn.com; dkim=pass (2048-bit key) header.d=openvpn.net header.i=@openvpn.net header.b=dUPA5kzW; arc=none smtp.client-ip=209.85.221.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=openvpn.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=openvpn.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=openvpn.net header.i=@openvpn.net header.b="dUPA5kzW"
Received: by mail-wr1-f48.google.com with SMTP id ffacd0b85a97d-470174001a0so1811651f8f.0
        for <linux-kselftest@vger.kernel.org>; Mon, 13 Jul 2026 04:42:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=openvpn.net; s=google; t=1783942966; x=1784547766; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:organization
         :from:content-language:references:cc:to:subject:user-agent
         :mime-version:date:message-id:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=/BI+PK8dROb8ix9/i5YgRp0GeZ+iS8+CIrvJVAabmjw=;
        b=dUPA5kzWomtOnJMXoX9kM+7oUVHwDQ95bBuBhJ+8k5BoAqss0auASZ7i0lY1PnmFe/
         jsoOD+86P6mG51X1/6iLy+o9jKr3FUIuc5ly4NVn1bGx3T1a2aqN3ZPfKkrTlz1ADibK
         MvjaRAqMDntlyWtk/bJIGLGea3hbOrW2bBW3HfORxz2AfYpzEvTasVToPRkVIHGzAzKJ
         AEsqj88XeoDSVFEpqtAaCAiwpxH4qUkiTorM1NAnZ5l5iXQW81Us6fkwLZnXg8EGIGvi
         syzhYbptYK9cRL7Tu+t6VgJYAJHcpGjWLGV6VCg+67po39UZWZ5jadinGpL6xoXcZOzy
         eOsQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783942966; x=1784547766;
        h=content-transfer-encoding:content-type:in-reply-to:organization
         :from:content-language:references:cc:to:subject:user-agent
         :mime-version:date:message-id:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=/BI+PK8dROb8ix9/i5YgRp0GeZ+iS8+CIrvJVAabmjw=;
        b=kNaYetkOmg2CHLydSBOyRfDGDEDJaerS8wj1JhwEnHLuo164uvF5eDLpBY4WJg7IGd
         pUX8lymXbE5kDLFrqVvqODDnJChDeHUEfzMj/ISjsc+MeTetEG7A6eVNANZAJoRhDBDN
         tTURA+fBv2os95ot95tjj4RHxSwo02QiEkwOghwedmSw+xxbyIER3hWz/XQ2wlsIg+Ly
         Aycf/0uTUfWPjmT3Kso/EXTuTVxZ8vcjOwh9X3W4/emYHYs52y5TyyCTEb+uMouWi75Z
         o2o8ABPTwC1YhQVlpWV0cBF8zfBpEBecHFLVtDUIO19TBgKcHlL06Lj0A+tQ7FvEuSaU
         i6sw==
X-Forwarded-Encrypted: i=1; AHgh+RqeFNynejSRTuaMNhN6CiJGI3rK2xYoKuGpPfL4fNp7oMY7jvcGVWxwvB7CnuovS3AyxtV9V4ynyNlJ3SfdMpw=@vger.kernel.org
X-Gm-Message-State: AOJu0Yy912aYHA+IsOFP3kszZyvPA+wC2UwpvErJJYiHIDsuy73CeOFG
	zDCekKamddUkyVItHzrAwFWKiylVFUvF11xSuDm9DyvCqiTtXOi7pdVhhzmnHA+n0VMwM+kx2KL
	7OQ7fSFHHHLg52aogPdzme0pH4WIK84lhhW0O7exPuKJQIiJjpkzNynRqpGKNMPY=
X-Gm-Gg: AfdE7cnod+KqUKP+60r8wJxsMvj8Onv/fJO1FLOJBLQxf59NSN/OaUVvPWbpM97dcSH
	EaWz61p21E8ek+BX3o8Wx5S0nfcNu0PUO551Vs9JjUV6Q26EI8enM7wSPdnnTOKzKe/0/Skid9t
	J/YRNqQny8vM8ExrlKYaASBMYbMqlwoIa0D4QGmZZH5Prxa71XlU35CCRVC5UEB0qvq6C3eyDHX
	VwEtOFGQ2FOXMKOgkSKZIlXhDBrpWZZ+UtlRDlJP6CQnvLl6SB/tQ+0UeUbidmQOiKpzJpHqqDM
	FRlRtGfhn2cuEk+UrdnsRnntT8nrDMXrRGXVNhqRGrYza2Y+AU7bSbeNBmlPGeCp18UFO9wMXIZ
	8hVi3j2yoCfCrdoxJ3EnCrCKRiiYhjrD3/ecAeoy4D1yfbD6z/h1BvU7jj5KguE39D3daGNbjIW
	ytRj2PUvz1SIZYa8gzLgRAfEZLCBAm2RFh6dyo3bOmKkge449YAr4=
X-Received: by 2002:a05:600c:c4b7:b0:493:bd2a:93be with SMTP id 5b1f17b1804b1-493f89523d2mr86184745e9.6.1783942966286;
        Mon, 13 Jul 2026 04:42:46 -0700 (PDT)
Received: from ?IPV6:2001:67c:2fbc:1:cb9f:b978:adcf:f7ae? ([2001:67c:2fbc:1:cb9f:b978:adcf:f7ae])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-493f49755f9sm272831015e9.8.2026.07.13.04.42.44
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 13 Jul 2026 04:42:45 -0700 (PDT)
Message-ID: <0fcbf44d-10db-4745-b89a-faea329c0074@openvpn.net>
Date: Mon, 13 Jul 2026 13:42:44 +0200
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH net 3/7] selftests: ovpn: add IPV6 and VETH configs
To: "Matthieu Baerts (NGI0)" <matttbe@kernel.org>,
 "David S. Miller" <davem@davemloft.net>, Eric Dumazet <edumazet@google.com>,
 Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
 Simon Horman <horms@kernel.org>, Shuah Khan <shuah@kernel.org>
Cc: netdev@vger.kernel.org, linux-kselftest@vger.kernel.org,
 linux-kernel@vger.kernel.org, Sabrina Dubroca <sd@queasysnail.net>
References: <20260710-net-sft-fix-containers-v1-0-a2915c294ef5@kernel.org>
 <20260710-net-sft-fix-containers-v1-3-a2915c294ef5@kernel.org>
Content-Language: en-US
From: Antonio Quartulli <antonio@openvpn.net>
Organization: OpenVPN Inc.
In-Reply-To: <20260710-net-sft-fix-containers-v1-3-a2915c294ef5@kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Hi all,

On 10/07/2026 20:04, Matthieu Baerts (NGI0) wrote:
> They are required to run the selftests:
> 
>   - Tests are executed in v4 and v6.
> 
>   - Virtual Ethernet are used between the different netns.
> 
> This has not been seen on NIPA before, because the 'ovpn' tests are
> executed with the 'tcp_ao' ones, merging their config files. These two
> kernel config are present in tools/testing/selftests/net/tcp_ao/config.
> 
> This issue is visible when only the ovpn config is used on top of the
> default one. This is the recommended way to execute selftest targets.
> 
> Fixes: 959bc330a439 ("testing/selftests: add test tool and scripts for ovpn module")
> Signed-off-by: Matthieu Baerts (NGI0) <matttbe@kernel.org>

Acked-by: Antonio Quartulli <antonio@openvpn.net>

Jakub can pull this one directly without going through my tree.

-- 
Antonio Quartulli
OpenVPN Inc.

