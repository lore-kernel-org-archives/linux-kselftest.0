Received: from mail-oo2-f8.google.com (mail-oo2-f8.google.com [74.125.231.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 397883E49E3
	for <linux-kselftest@vger.kernel.org>; Tue,  4 Aug 2026 13:00:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.231.136
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785848421; cv=none; b=eVA25rtGhZAUAHdhuJP6YM5e5MHPnZzmvLDUpApeVmeKom08JoY9kYUKzunEzJrDLi+SLVXjE/vEzXHcaUPJSfknLCmM6Z/+ZCP9uyIBa5z+D8v+hJ/Wi9KDhBfNaLbk/VTU5rtf2GrZgEI3JoncQuoTDV32hwWBnSuYhIZIBoo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785848421; c=relaxed/simple;
	bh=XLRSb6L6okHQBaejlEPLkXThc9+M67XMopiLNGrZd8c=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=P5287ODu4/k1SZvas6NhUat2xnV550Sswp01D3gCaRKdmhfje9FOQebJi+oj56TCmaqH1aLRZ8dZm3hqXn9B5ZP6+rIngXIri7sHrVmimYaNkeDs2CtiDXCIy/1f+g7lKLMntwJb940xlzl5eoW2YgfpOuyw5j4LWvNZxZnE3sE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=kernel.dk; spf=pass smtp.mailfrom=kernel.dk; dkim=pass (2048-bit key) header.d=kernel-dk.20251104.gappssmtp.com header.i=@kernel-dk.20251104.gappssmtp.com header.b=Z5dQJIWD; arc=none smtp.client-ip=74.125.231.136
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=kernel.dk
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=kernel.dk
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel-dk.20251104.gappssmtp.com header.i=@kernel-dk.20251104.gappssmtp.com header.b="Z5dQJIWD"
Received: by mail-oo2-f8.google.com with SMTP id 46e09a7af769-7f0355eb4b3so1308674a34.0
        for <linux-kselftest@vger.kernel.org>; Tue, 04 Aug 2026 06:00:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kernel-dk.20251104.gappssmtp.com; s=20251104; t=1785848418; x=1786453218; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=9XZ/r2/VyuSPo973uko6yyIonoRUHPTACZI/0tixoT0=;
        b=Z5dQJIWDb0gCmH0HHVCj+/FK/GD1+fJb2sAMfRXvNV6qr1YFuHe3Do9C4LGYwVX4iG
         Yg71ojJzF3Ck653DSAj0e2X+cotlX/6b8am7IDFza+z8VhuucNr2D7IulvHr/3lMwos9
         JHOt3UZmIpDrrINRHcasKmEjdWdIPe3s22QNiaOsbDlBxeyYpAN8fpQd6BcAEIjDbUlO
         GK7pJvmdvd84poTZtxCWxAfKUbj9NcX/Vzpp+Q6irjoIg1d7jnxNlQdA5DiEH22cIRTj
         8AGBFqqZoiJhSg0/iljy01sIhx43lDDVO0DVnFhgsyY4FmxUJSX6KsXCKbS+1xV+GOuQ
         LFhQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785848418; x=1786453218;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=9XZ/r2/VyuSPo973uko6yyIonoRUHPTACZI/0tixoT0=;
        b=eY/A5mpcNgy4TXQ1t4LSq4XIGii7QC1eGkJrsiFJZuMYzPUy1IyYooErbnTCIkogCm
         v7m9YqJDhuO+rDlUCifRTvatKoXZ2WLb30HlWCHSHEOqaYc48iYfvtQTDtkFy7GMLwBm
         o/WgAI7tPrEyz4oxdeVeqRtBs23AwMV36qhFTNwp+T4ucA0FlqILULvOx0XkqIQ7RO2U
         8GhBIAfE3jDoAn3seyRqi3PHaS0xaShc21K8QEfmOllTEHfJ9gmxofdIyVm4h0eWR3ST
         9sw+qNBjDkpAxggcsTWeCyoEj+MtxXpLvSrkwp9dhn/N6smV+8lKKYz/D9jOg0EV2P2j
         WM4w==
X-Forwarded-Encrypted: i=1; AHgh+Rr/YWjJMaSh8MzzCA+P0rx2Tr9PBq2P0lApG2Y3kxC5NECYxc41hxbCWEgQkORMh9MUSlwOwjWTV5ts8XAXyuE=@vger.kernel.org
X-Gm-Message-State: AOJu0YzEoGDh+vnNwytS6CTyupLGI0L20AsTBVMmW0tsY3mD29wiO4+y
	RRQTYaowZ99vXD5Vt+4i/4wdg9ukOFEK4Av24HimJ9BbJ3f1yVx+c6w/nFQ+0RkOIyU=
X-Gm-Gg: AR+sD12b/EiMV8hzv5gzWKXEZw/OoP8gzgu7Ou19RRA49kFkT/SXgTSieVfjJB6T9dV
	g57fTgBcnbGYpICEluvwAgI01ZQT05xpjYovxgO5aEVUqtxG7cnC4BvWxbyWRVqnRL+fGHLlVpZ
	i4wVhVIPJMWsd+BgOGcwWRyIDDqQrITbfjaUc7vBmk+v7OOuKki3I8Ks+4MuuSJipHOJQaxuEBf
	XQbd/kJgSTPhH//SAqRI0YrLc4ZkCHwU3QL2AgBNyk38kaLmbNdUCl9g+ZvEnAx6Xfku01V2mno
	0fhGM7q48wor3uyM0UXJ+0ejjrWqpFWC37dVSE6wUGCH2BmwnPT03uvUJv0xZlOiolWH1BMs1t7
	lxPJqHn/qFxBF/dSUuUJXw4+Yx2JR8kbZyRMpctMfqOQGr9+znJuaWeLEyFhVEmtIUNfneuFo1O
	Fl/Da+B2gidPZ0DxRd5uTXs6zlaDL7S1FgoJpsOqQSE4X3xlsqAEZbs0eGoGmwgQfBjDCbhTYV7
	aiSzHXkBmSoVc8hFD8leSbE6hiOrSVsZOViQC5LldSTZxU=
X-Received: by 2002:a05:6830:3498:b0:7dc:e37b:b5d3 with SMTP id 46e09a7af769-7f196c0a081mr23593639a34.7.1785848417733;
        Tue, 04 Aug 2026 06:00:17 -0700 (PDT)
Received: from [192.168.1.150] ([198.8.77.157])
        by smtp.gmail.com with ESMTPSA id 46e09a7af769-7f1df2fd101sm724604a34.2.2026.08.04.06.00.16
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 04 Aug 2026 06:00:17 -0700 (PDT)
Message-ID: <b0c53f03-6386-4d36-b7dc-28df02ce71b4@kernel.dk>
Date: Tue, 4 Aug 2026 07:00:15 -0600
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] selftests: ublk: add rotating auto_buf index regression
 test
To: Yang Xiuwei <yangxiuwei@kylinos.cn>
Cc: tom.leiming@gmail.com, csander@purestorage.com, shuah@kernel.org,
 linux-block@vger.kernel.org, linux-kselftest@vger.kernel.org
References: <20260730024050.1062354-1-yangxiuwei@kylinos.cn>
 <178581121634.578215.15829017092257405641.b4-ty@b4>
 <20260804063201.3740465-1-yangxiuwei@kylinos.cn>
Content-Language: en-US
From: Jens Axboe <axboe@kernel.dk>
In-Reply-To: <20260804063201.3740465-1-yangxiuwei@kylinos.cn>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 8/4/26 12:32 AM, Yang Xiuwei wrote:
> Hi Jens,
> 
> On Mon, Aug 03, 2026 at 08:40:16PM -0600, Jens Axboe wrote:
>> Applied, thanks!
>>
>> [1/1] selftests: ublk: add rotating auto_buf index regression test
>>       commit: d507d3cb19e71f10336e41deeac517cdc21c34ea
> 
> Thanks for picking this up, and also patch 1/2 of the driver series.
> 
> I notice for-7.3/block is still missing patch 2/2:
> 
>   ublk: clear auto buf reg before updating io->buf in batch commit
> 
> The rotating-index selftest depends on that clear-before-store fix.
> Could you please pick up 2/2 as well? It already has Ming's Reviewed-by.
> 
> https://lore.kernel.org/linux-block/20260730010910.799346-3-yangxiuwei@kylinos.cn/

It's because your postings end up being broken, I had to explicitly grab
1/2 of this series too (which is why the reply looks odd.

Added manually now.

-- 
Jens Axboe

