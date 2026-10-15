Received: from mail-oo1-f46.google.com (mail-oo1-f46.google.com [209.85.161.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E529B481A96
	for <linux-kselftest@vger.kernel.org>; Thu, 15 Oct 2026 19:22:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.161.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792092126; cv=none; b=TxN1WACwjw4TcnCS3KkGntYslO3+ScnMmZQO1a/U+dg6w4YjYj8ZpCvei7PPbf95uLDsu7iTWeCLxq1oxBAPHWWVIT1Dc4DnTmomtW5GaZklNF7r71/zQvMOpJMJB7WWm/FQaxh680PSOKL5W+e8QAw5djLDkumP3POwae0EBR0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792092126; c=relaxed/simple;
	bh=X39RIv25b3bYLzGX3nJBQeZQTXxsGWcMfKL+H6FOhQU=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=JQHbBHe2QaCWKfo8O8TZMJ7l95vNrctOn/eXhgvFyRtD3WK7OHmnbp+7taWSOk8B+GzbogsduECNwVh9edaiYPodg9TY/nhMZl/yMRG/QQna5WPCWu/Oc6bnDLBv9qrbjTtJ0gUdVS55s0nolkrz4pe+0MFJ+M+w+JbaRL8F1cw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linuxfoundation.org; spf=pass smtp.mailfrom=linuxfoundation.org; dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b=OrmjBn4D; arc=none smtp.client-ip=209.85.161.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linuxfoundation.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linuxfoundation.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b="OrmjBn4D"
Received: by mail-oo1-f46.google.com with SMTP id 006d021491bc7-6df5e315bd1so3665021eaf.2
        for <linux-kselftest@vger.kernel.org>; Thu, 15 Oct 2026 12:22:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google; t=1792092123; x=1792696923; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=rgdX2zDefc4wSeOQxvDkXIDVDbH9LUXjTZ+Al6mQkaE=;
        b=OrmjBn4DdEu3oYJ+UNEnK9yQtYG8KtxoFCJeyfKzkArkA/atKqnkQ6AYySpMfr/Woe
         sz5/DeGaUjtRR4Le/m0fYtEKTOSULKuFRVA9liBDH9aSlpFejDLgpgoZN/tcynvdsJTM
         zNerKLHJ8gwfTBoa/XcJteshj1vfJXmGu4JSw=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792092123; x=1792696923;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=rgdX2zDefc4wSeOQxvDkXIDVDbH9LUXjTZ+Al6mQkaE=;
        b=BEpujzDNi2Nwi2c377m+Ou1v25Ho2loTpILOubd6W8fNuzz4yhYijpX2zVFFyQFuWd
         uTXu1rXZyTi1+0jXWpdtyks2zcHNj/LFgMAvLNyVYlkv0mgRBwrjzwnjs/4lCxNP2jhG
         2QHjco4XRHfF506Xva/DRMGJzGZIKDxeBwGJfoJG5IoZw3cUaM9Bcr9BVmHdQobQG8EZ
         CPIWcAikiqiTL/k0PYYGjvGdoK6XC4TbvTA88KZvx8MVxs7fP5tVZ9cQcTnALM+OsZtW
         H603DfG8n4rMUdzAkJBERu+Ja7OF2bFJWofWuUqfj9JSsdNeTeXr9U2HgZGC3W/rBMUK
         A7eA==
X-Forwarded-Encrypted: i=1; AKwUvBw7JkeQibz6nELhK3qUxKJW9mF+aUKGab4rv4iWgPys6I+i0Z158PkVAbLx6+gC7E7M4Exd/bWUU+kHtpF47No=@vger.kernel.org
X-Gm-Message-State: AFq9FYK6fdp26iZ/RPCB4QlE4is1+QVe3Hz5eMevOnBzjGieFNCA/3Re
	4a6kLIQzkfp7+qUdv4dn4DbzGUDum0KdKZcHt3HcYDnRDHnWB41hByoLiAHIX2CxGsw=
X-Gm-Gg: AYBFou1xefOox7xs5Cb2gnLkYFHpz+t2b0coePqa49wtIIGcfC7toAIigvwZKlT8dK7
	azqN6PYIzNs95AuEr7R+8PxonfJ52yx4kMs8OIaqdJSdiJKh0hPCw/Ober2HDHJMriRhXiaEAC3
	Ar/H+RDFmnTp1r3Mhc20byLxIZRThqLxrQdmTWOL7MCaH8yAHD3On70I4+kAMt4mlSEfZumpZ5l
	HJmitppAbC07Usq4ObLdEjwA6FKa7tTwmwQZy65PgdgDFNBuoKPN31vHCGzIVIPtDfwRsjms5Et
	/s13Kkogpjmx7ByOuYKirrUG21BHG5ZlC5B+cbkrMGUa5CUmXfQazi/gmkpIb/wgDPmWk3CIScb
	vgDkXnX9qwudyjzbUVF4I01DKgq+jeDfgP7dEMXu5D/uQAUyXgPQxtvk/57NWltzn/ExU8EtJxI
	KuUpzLStra/w1jnImKf7hUmTA+EXQ921bzlY1FAiIAbnLYtwBBzUG3b3ib9iuDqj+l5Y/g+jsP0
	UQDgx3Z
X-Received: by 2002:a4a:ee17:0:b0:6d7:ee8f:50ea with SMTP id 006d021491bc7-6ef10097af2mr13590593eaf.48.1792092122623;
        Thu, 15 Oct 2026 12:22:02 -0700 (PDT)
Received: from [192.168.1.128] ([38.15.57.99])
        by smtp.gmail.com with ESMTPSA id 006d021491bc7-7018e73fa0asm153146eaf.3.2026.10.15.12.22.00
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 15 Oct 2026 12:22:01 -0700 (PDT)
Message-ID: <d7550cd1-e0fe-4e85-8a93-c2bf4c789e59@linuxfoundation.org>
Date: Thu, 15 Oct 2026 13:21:53 -0600
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/7] selftests: keep the build status from wrapping to
 success
To: Mark Brown <broonie@kernel.org>, Sasha Levin <sashal@kernel.org>
Cc: Shuah Khan <shuah@kernel.org>, =?UTF-8?Q?Ricardo_B=2E_Marli=C3=A8re?=
 <rbm@suse.com>, linux-kselftest@vger.kernel.org,
 linux-kernel@vger.kernel.org, Shuah Khan <skhan@linuxfoundation.org>
References: <20261014200115.1363363-1-sashal@kernel.org>
 <20261014200115.1363363-2-sashal@kernel.org>
 <f64e8221-cedb-4b4e-aed4-a87ac23c26cf@sirena.org.uk>
Content-Language: en-US
From: Shuah Khan <skhan@linuxfoundation.org>
In-Reply-To: <f64e8221-cedb-4b4e-aed4-a87ac23c26cf@sirena.org.uk>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 10/15/26 12:00, Mark Brown wrote:
> On Wed, Oct 14, 2026 at 04:01:09PM -0400, Sasha Levin wrote:
> 
>> Record a successful target instead of multiplying statuses. The rules
>> still fail only when no target succeeds, and FORCE_TARGETS still stops
>> at the first failure.
> 
> Reviewed-by: Mark Brown <broonie@kernel.org>

Thank you both. Applied to kselftest next for 7.4-rc1

thanks,
-- Shuah
