Received: from mail-wr1-f44.google.com (mail-wr1-f44.google.com [209.85.221.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 645C23FA5F0
	for <linux-kselftest@vger.kernel.org>; Thu, 23 Jul 2026 09:06:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784797582; cv=none; b=lv1I+kNSiultLXRzbEi/nrxflXYHKFXFOZzOJw/zNFSvbxeZojwEgMEEFetUWLv1onCK2wveQL5T4KDarRKbcSMXgEYLjxdYvCA/QJPUzQswmFQ2DA5ewvL8AgwZNKnTpgn0wGdSsECGzV4oPa+u8zVPyclzlVyobpzqlRzJckk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784797582; c=relaxed/simple;
	bh=4GzYvS0NiTzZEAKCLNht7hm4a9KoQ91LLgq0quF4TyM=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=AK4D9VhOPIob7t7Qk8vWEtMccZcJNIpRk3teqZYT3RYKIdm1HB0wLlJGMuE+J4IrkMwe0nQQRVoGoFON4WfeIcsKYH59uHI7+d3rGpxpyImms61i5hnwdyrBkUK4q9GiqYmbrvQeflFyH/OesV8lgqZt3hAK04UwnN+90ELFPHs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=LCcaJy4W; arc=none smtp.client-ip=209.85.221.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="LCcaJy4W"
Received: by mail-wr1-f44.google.com with SMTP id ffacd0b85a97d-473987fc217so81778f8f.0
        for <linux-kselftest@vger.kernel.org>; Thu, 23 Jul 2026 02:06:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1784797579; x=1785402379; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=qMKUSv5MV4Vhs6R+V8rT0aIWpGDegg6YGcZIq5CZLYY=;
        b=LCcaJy4WwYw2KJHsmIsBKYNWdFeqzoU8lBQmsuFhvXuC5lnQ46u6FGSy6JMI5NAz4n
         mTlURsvj4dCIHgADlX5eK6XpPkc6d0xRM5Na1Vuty4dqq6QnObP9o7/bI0GFeTQ1y6Fp
         1bH1GSBpdWpj8qLM0X4hq9eJVEg6xdWedKJ+PWreeu1kW/xC8cd6wUdQMZ4xutSa9qCL
         OIeuXMwHRBCwm8bNuFmDSVo2xFf/34D0sfwehXBSYRm9SGMIC9JsfdhVUnyuHXTrG6aZ
         0goneJ/C5AqH2dzN33hjZCSC8XAVewWBH6mAnG7dazTZxnsvHM5U8j/YsmcM3gAHIE9W
         VN+A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784797579; x=1785402379;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=qMKUSv5MV4Vhs6R+V8rT0aIWpGDegg6YGcZIq5CZLYY=;
        b=Dccorpt9Ij+uSQJZ3GOe3LllIicvS3JB6eLAQ58J8RkbSF3sYq7H4X7i6/GHC8AYY0
         TZkisZhHv+O15viffc2PrO5mZJpCfDep/K7f6fwg4Lz9EtaAsxk5qPmMp7DG4A1hn9rR
         NaMAJlkUcHzRFSdyBLi1STDjYbu1PYAmGE2QLSO/AvMb1HFH2yLqbkMncZRiMFCCXYU5
         PWtOfrK+s2QSSmnzRXKdgai0DwHFNwWpqdjHA5j1NYLyvH/TgfVlzayGRp2M64DnJBic
         pQZBDfS1jTZcRfar/wBqnI+1lgm7reBcos45+yHm/nLiIqmmRMSk7WDiAGLLg+O9tDHZ
         LSNw==
X-Forwarded-Encrypted: i=1; AHgh+RqBNVyzJYh7VOTgumeYmiXy/6dt444bECvg0woBwS2zQ8xgALv31hPIAlIMMFzdlcanL0NKCN+0hamkkKdBJSg=@vger.kernel.org
X-Gm-Message-State: AOJu0Yz5xRPiGMU5KS+QGq4aKL6HA04hmVD6FErdZbNRCcXa0ZcIxlBb
	Gq5WOmyJGvGTj5h+kSvRW+BlBKKv5W6x+BX4yOXcRxJBWTYiMz59mDinn2Dtx+EhyE4=
X-Gm-Gg: AR+sD125l2BqzR9jGCtSzvyJYyz+fLfrSke0TRAf+6RnvF3IBc7B2zJtTXY6U5rUh8A
	fJSAGIpCZ9iR97BCyshNTaepldvnyQpSKkxkpVbG5PRw7Ic4m+5kb6st6lfr4ckydrSzBEGZnsb
	ob9Z+gy1XOsTpIfR+T/u/Z0zRHLFFi72zWk2hbWVTc9/2xLVbT9E4iV4Xrlp9Cvx9u2CpHdemhk
	pdN/IxWg7SZggC2+sI/321mV+lRHypr43MIWlbgVXTNkKNnoYU+j92qQRNG8CQkA7prRSHSDyGB
	hyNMAroA0BM85Wjk/LZL0TxUKAH51/U3LfVbmxAs494S7idU/QH538r+p8kSD+Th7+4f0UW0zfV
	WniXh35t+YrH0gC8Of4TyxTJdYX7z6N2ppZNc41IJYyeAdD4Rwb5auZBrPGhGeY5vGxO9KAgtUd
	eGb/mUos6Zs+njybeSH/ab+j1bDKKKV+H15HjT2GCkUl2O8i5ZJt88w3k2bssZwKjgurymBg+/4
	4fyaCmK2W/E3jayJW+lAl/pZN7fiOY=
X-Received: by 2002:a05:600c:37ca:b0:495:4505:dad0 with SMTP id 5b1f17b1804b1-49573c8fd24mr13828015e9.2.1784797579219;
        Thu, 23 Jul 2026 02:06:19 -0700 (PDT)
Received: from [192.168.2.69] (dynamic-077-179-229-147.77.179.pool.telefonica.de. [77.179.229.147])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4956b4e8885sm90392205e9.0.2026.07.23.02.06.18
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 23 Jul 2026 02:06:18 -0700 (PDT)
Message-ID: <4391fd75-e190-4585-a5e0-6dd3099925b5@gmail.com>
Date: Thu, 23 Jul 2026 11:06:17 +0200
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [RESEND PATCH net 0/4] net: hsr: fix GRO/GSO super-packet
 handling
To: Paolo Abeni <pabeni@redhat.com>, netdev@vger.kernel.org
Cc: davem@davemloft.net, edumazet@google.com, kuba@kernel.org,
 horms@kernel.org, andrew+netdev@lunn.ch, qingfang.deng@linux.dev,
 shuah@kernel.org, linux-kselftest@vger.kernel.org,
 linux-kernel@vger.kernel.org
References: <20260722171836.196-1-xiexinet@gmail.com>
 <dc814287-dfb1-4514-b349-104e6754cd38@redhat.com>
Content-Language: en-GB
From: Xin Xie <xiexinet@gmail.com>
In-Reply-To: <dc814287-dfb1-4514-b349-104e6754cd38@redhat.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 23/07/2026 09:59, Paolo Abeni wrote:
> Please have a look at:
> 
> https://elixir.bootlin.com/linux/v6.6/source/Documentation/process/maintainer-netdev.rst#L385
> 
> Unfortunately this is a very bad period for unneeded repost, given the
> unusually huge PW backport. Processing of this series will be delayed.
> 
> /P
> 
Apologies for the noise and the extra work in the PW queue. I missed the 24h rule for unreviewed resends and will strictly observe it going forward.

-- 
Xin
