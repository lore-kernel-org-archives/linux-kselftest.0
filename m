Received: from mail-dy1-f172.google.com (mail-dy1-f172.google.com [74.125.82.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 469C529BDBB
	for <linux-kselftest@vger.kernel.org>; Thu,  9 Apr 2026 20:28:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.82.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775766503; cv=none; b=rLslkFoM2Q5GuLANp0LQFgxpDBW9yhRvSwAOwXP/cvO2ZRDxdrOEw9NM5+FlAMaggQJkzYQxIPtNGAm25uzfPM54UDK7hacNrforqwSSy6bzVYbih8pg/zBrrRKhqt6tSvYhiZPZipSlkHsxlott4iuoMLLLmzflSpI7cZz11lI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775766503; c=relaxed/simple;
	bh=t17D4EbdduWXrTX7hugrjnsvI2RAttx70eAujI9t0fk=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=Wot884FEIjMtpvNscpa1wM/mcTGQXhDM7iRRhVOsp2GfD75km21cgavQyaO9QImivmTkyWOFbhntcZ3OodEvmUjncnYTn2DCL7u+2gQ5RUSlwV7Mqkt1n9kUXRzPs2BBwbgL7cEyHx5huki+SbboV0We83fN9odUQ7SyvwCNAiw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=mmG/uT3v; arc=none smtp.client-ip=74.125.82.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="mmG/uT3v"
Received: by mail-dy1-f172.google.com with SMTP id 5a478bee46e88-2b6b0500e06so1785107eec.1
        for <linux-kselftest@vger.kernel.org>; Thu, 09 Apr 2026 13:28:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1775766501; x=1776371301; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=PZW4/FYr/TJOQAnQTjLdgFoQga/P4omv2yM1nIJFsTE=;
        b=mmG/uT3v6j5FGFWbBU8YvBdA3CynvAuqIlkZ1yDC209ldYvYkzay5jwQuQaqdraGls
         eBaaeX/yVrS+m9BlkxTrHTtInilMhq+fCVrHiqRlYl2nkk+ywKL8A6mW+QbbFz/gs9oz
         p2r91brLrQbyKZTTrC7/F1hLchDXolBgeW9ic/kK/waKbak/7h+W9iRQQbdI8VPCS0SZ
         KWuurkULIDIbun+3/AvqvHodVOtEYCI8+WbXsHmWx1hr7o7vrQ6KHEo8znvn2bCIDvVv
         rzOMIgBhmmS/fwkwPYuAflk1qJ7K5WI22NhZ+mSbEtldsXWLiE9S4AYnZtaLg0Gkb4n7
         x9dA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775766501; x=1776371301;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=PZW4/FYr/TJOQAnQTjLdgFoQga/P4omv2yM1nIJFsTE=;
        b=pJy47xVNjWXFAifH/iEzvWmocJ/G26CI7sOY+pLmC2CUWiv+btTdqC0zNNadg/0wI+
         lDKRVQd65Sa3zspve3VlhoiLhtvCOaa4ym1piIaWOg96oWQ4RrB2YO44GH1RVW6c8tdI
         1DfJlZzZKGO76EseunHH9/i1SQj3F/4kPcA9iqWxOhm5ZWb0yKqMyEc6TY10oRwtIwLV
         qZrvWjh1Qp8cZvBEDoa1Kvxoof8VnEqBL8xZ4dM9JN7zRj7ClAd6yRp8/Gxv5Yl9ksc5
         TtY2RDjFxKQ9UqvL7kjMzPvf4Ry3VVAqEqXnDpoZonql++z5s5rtt5KWT3UQ53H7xA6V
         s7OQ==
X-Forwarded-Encrypted: i=1; AJvYcCUpYt6/2UXg0vvnwfuqBfYlacxSXGWussINQozkhgyR6/W2Yg9JII0pLWLOkoLQ2ytM/uwOVfafkRb4HjqjPcs=@vger.kernel.org
X-Gm-Message-State: AOJu0Yz/t37iRlDiONm0AL7grdflVq7OC6pPHZcwUTojlgPI2WwMncFY
	EpRYPvr3dE64Szbyh8dYjboK8fF85jm3qthg2qXQhT9booN6hCepTMWJ
X-Gm-Gg: AeBDieucxOzC+Yk8rhzEkQNiuglvfkvI8wajusZprYm21G2Kd4nntFTiXfOfom7b394
	PzN2wK17NzItLFBnG+USKNq6glOuXLG5l8vqxbZb2OP6gYRA7Gka9cw1q35lK3SHoBJnwZDPy09
	/034m47i7rKqpfQcQHsu2eE09nXXAXXAtWTzT1y4mhNQrWTXkegTDb4ha0uuO0YxeXa28Ef+y/a
	Y056bYnnOAoyoNp8phcY7zF0hFaVFfQau6UGB05Y9hOa96E8ma8DecbhrnGzO+w542/cAQ+syN+
	60iCCgDBsb7rqiCgFYY9/eFKNhZz7BaClxYzGKt5sYorI2RyOKRSiO7uRDo7g/EaP7FtYhVBrEh
	ke1k76owBodlP8uvHEQk+wx3AmnD+FHcOeML6qyCGlcKIkndFdD8DTOjcCp0STxmh584fjx+gNq
	sYOdMGyCg0WkRF4g41qxcQsVKJH4KLmz1FASKZFfmL+4MAglGWbpLfMyz/XaZAb8mXXM8dYnVoe
	DGD4NWE+QU=
X-Received: by 2002:a05:7301:1003:b0:2d3:dff7:13c0 with SMTP id 5a478bee46e88-2d5891766ebmr333903eec.14.1775766501331;
        Thu, 09 Apr 2026 13:28:21 -0700 (PDT)
Received: from ?IPV6:2a03:83e0:1151:15:c24:4ad9:f660:1904? ([2620:10d:c090:500::50d6])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-2d55faa556esm1531480eec.8.2026.04.09.13.28.20
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 09 Apr 2026 13:28:20 -0700 (PDT)
Message-ID: <7de45664-d468-4f6a-9a0e-2bd56aaedb47@gmail.com>
Date: Thu, 9 Apr 2026 13:28:19 -0700
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH net-next 1/2] selftests: drv-net: Add ntuple (NFC) flow
 steering test
To: Jakub Kicinski <kuba@kernel.org>, Michael Chan <michael.chan@broadcom.com>
Cc: "David S . Miller" <davem@davemloft.net>,
 Andrew Lunn <andrew+netdev@lunn.ch>, Eric Dumazet <edumazet@google.com>,
 Paolo Abeni <pabeni@redhat.com>, Shuah Khan <shuah@kernel.org>,
 Willem de Bruijn <willemb@google.com>, Petr Machata <petrm@nvidia.com>,
 David Wei <dw@davidwei.uk>, Chris J Arges <carges@cloudflare.com>,
 Carolina Jubran <cjubran@nvidia.com>, Dimitri Daskalakis <daskald@meta.com>,
 netdev@vger.kernel.org, linux-kselftest@vger.kernel.org
References: <20260407164954.2977820-1-dimitri.daskalakis1@gmail.com>
 <20260407164954.2977820-2-dimitri.daskalakis1@gmail.com>
 <20260409085055.0834111c@kernel.org>
Content-Language: en-US
From: Dimitri Daskalakis <dimitri.daskalakis1@gmail.com>
In-Reply-To: <20260409085055.0834111c@kernel.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit



On 4/9/26 8:50 AM, Jakub Kicinski wrote:
> On Tue,  7 Apr 2026 09:49:53 -0700 Dimitri Daskalakis wrote:
>> Add a test for ethtool NFC (ntuple) flow steering rules. The test
>> creates an ntuple rule matching on various flow fields and verifies
>> that traffic is steered to the correct queue.
> Hi Michael, how accurate is the stats refresh timer in bnxt?
> This test is seeing ~10% of flakiness on bnxt, fewer packets
> got counted than we sent. Could be something else but I suspect
> the stats just didn't get refreshed. We give it 25% margin right 
> now.
>
> Dimitiri, this skips for some drivers because they don't auto-enable
> ntuple filters. Looks like other selftests have the same check and also
> skip in netdev CI. So probably a separate / follow up task but I think
> we need to add code to enable the filters if they were disabled.

Sounds good, I will follow up with enabling ntuple filters across the
selftests.
