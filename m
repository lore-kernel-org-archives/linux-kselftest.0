Received: from mail-yx1-f47.google.com (mail-yx1-f47.google.com [74.125.224.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EA0FF25B1DA
	for <linux-kselftest@vger.kernel.org>; Mon,  9 Feb 2026 02:37:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.224.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770604643; cv=none; b=lZdliML5nRGs38T9YUXcPwBHFMsmYDiYMtIQTJnT/fD8Tu6HivLRihBiLPVI+Qtsz0EOmVqUmE7JnDyuOj2F0GIQ4xvnm6CWELgr60doGUyejaI7mUhQYu4WXqjNykyDkBLDOvineBPaU6O/rb4dnZQ5tEIpgFiNwA38d9wzU+4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770604643; c=relaxed/simple;
	bh=pRQAO/ZYBYUQ77y7rK0JvvKA04zg434VlWUpr7akJJU=;
	h=Date:From:To:Cc:Message-ID:In-Reply-To:References:Subject:
	 Mime-Version:Content-Type; b=VUHCKjYJzB77ROCvZqLcj/RrayLFKwZEsL3ZcST3FPjdgZoM61tqhbO9UdznoT3P1k80VlJiYODgdpV7foSpz0BLxR+ZRdU1/funbuED3s6aMuyK04UHVwYLqGZqYPL0PtsUAmyj1JrVCvJ4WtlYv2z+myiBj16aHo5q47r2Z3A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Z8Gl5npm; arc=none smtp.client-ip=74.125.224.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Z8Gl5npm"
Received: by mail-yx1-f47.google.com with SMTP id 956f58d0204a3-649c070ef3bso3701061d50.3
        for <linux-kselftest@vger.kernel.org>; Sun, 08 Feb 2026 18:37:22 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1770604642; x=1771209442; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:subject:references
         :in-reply-to:message-id:cc:to:from:date:from:to:cc:subject:date
         :message-id:reply-to;
        bh=1/V4WyWhAAZkw5TNJuCQHRUvYWFPGZ8OrTECOGPh6Dk=;
        b=Z8Gl5npmF3h7BCvIlBv/pdDg14pBOhE7A0097ii0q4ziW3+5N36BhFE4j1+cpzG2yf
         cdTB2cL805tGfyxtCQQC6CU3bTStqPz3l4AKPwTXROewVrmtDSNxCQt8omTSMbGSfS59
         juAkqXrhv7bipf8K2Rx0/ApHj9AEaB0zbEVDOeZL47+nZrkxEvLmn9y8oFNOcNMbTKMa
         whuYLwmUGsYVr8fUV555PoinzLiDT/wSy4xoz+ne4MjXzzb/VvKrvt0iBLaGlhyZZho5
         UBqy9/Xw8NU7eWFGFeTpEUMLP4V4RJcrFIovsHg7Hh4tuBuK2PMrZBRNZuhcDsqrmnxQ
         aVEA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1770604642; x=1771209442;
        h=content-transfer-encoding:mime-version:subject:references
         :in-reply-to:message-id:cc:to:from:date:x-gm-gg:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=1/V4WyWhAAZkw5TNJuCQHRUvYWFPGZ8OrTECOGPh6Dk=;
        b=w5oUQoryEkTZmImyW+9Mpg+E3iNarzeR3qb7UMPqWtb00RqsSlPd52MQaXOiUNwHBO
         3+ffZn1SHFxWvBOjIbnNoZrMnI8aKQBTVQ73BIaCVtt5CNt6j+oZ+quyDuxCKPOcHFmj
         0qZ86hKHmqqzZflcBY1hnSTdTUyF1LlFjKhupPsWrc6na3jFn85VEIaepQzfEFy295po
         BnJ3BU/ktzy9fHWKg6mtqh2PPg3gFDag31/PrGf+G7JFjGWjq9jzra6SmpzhedsTw+fK
         IJaoLELjuK+ae1v/zOUmE0qL63Xw9j9b5OwXblYDmKeRsWxG9gDUBG9RHl6TbREqs/5j
         mQ9g==
X-Forwarded-Encrypted: i=1; AJvYcCU2tO4FqARSihkpzvlIBY0FT2iqXZ6ktx67XZyyYDUReXMBK5fVbRwcBQEFuZ+bq5TUmDqBVrKpiy006z2VROA=@vger.kernel.org
X-Gm-Message-State: AOJu0YxssLYCkNPOvLwlO7JID1Q9jTn51zLVxSYRzxzRo5syc7MENzzB
	6/KKcr6muZDIWxYfMGHe5stgFR+gpqUnRgcdbSVsz1iRQkuGxNHehal0
X-Gm-Gg: AZuq6aK5gip73S/AfFaisupym+IO75xk4H0DsCwihil3nkEEsB4CcW3O6WTXW6Kp0Pf
	1pstbAPunSi9I4uN1F0+U0bHoCmHnLeYB0fH44tXtRytPgjEXh17E0IaaBoOR0SCikXX5dlhcbD
	0HTx0nzrTfuLoS4g29IJ+0QxKVoc7qWKhwiuney23O3QpvrlNPT1zOyIOOuZOH1H04hR3LtdqHL
	ec7UE5LObziCM6943Vu0VQBFD/dDP/Vlz2LI4FaBLIaVtZpZ1zU4PtNM/0/iyacaimqkXjuobSl
	E0N6cEwvu0yIOSeduqQnFjVDdbBQvqt0iP7hsv5jCx8Y2OBOt2Sra/roUs49LOkw+NV3LuYVa5m
	ENyi4yA1BNd0PAzdkzL+dEuToIp7H0K+XZQ1hz41zEmSvdHAmQkOtThK3Hk7ExXOd1dI8+I8TdV
	PBxOlQ6ItjqEMGArZVX6dJc05Y5AtFglExDr7J48xCFLRiiI+0Ez3XwjGXjVGflPVqXc9R6w==
X-Received: by 2002:a05:690c:c50d:b0:796:4486:b7d7 with SMTP id 00721157ae682-7964486c022mr20245177b3.26.1770604641852;
        Sun, 08 Feb 2026 18:37:21 -0800 (PST)
Received: from gmail.com (21.33.48.34.bc.googleusercontent.com. [34.48.33.21])
        by smtp.gmail.com with UTF8SMTPSA id 00721157ae682-7952a1db63csm80694087b3.33.2026.02.08.18.37.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 08 Feb 2026 18:37:21 -0800 (PST)
Date: Sun, 08 Feb 2026 21:37:20 -0500
From: Willem de Bruijn <willemdebruijn.kernel@gmail.com>
To: Jakub Kicinski <kuba@kernel.org>, 
 davem@davemloft.net
Cc: netdev@vger.kernel.org, 
 edumazet@google.com, 
 pabeni@redhat.com, 
 andrew+netdev@lunn.ch, 
 horms@kernel.org, 
 shuah@kernel.org, 
 willemb@google.com, 
 petrm@nvidia.com, 
 donald.hunter@gmail.com, 
 michael.chan@broadcom.com, 
 pavan.chebbi@broadcom.com, 
 linux-kselftest@vger.kernel.org, 
 Jakub Kicinski <kuba@kernel.org>
Message-ID: <willemdebruijn.kernel.35e36b64302f9@gmail.com>
In-Reply-To: <20260207003509.3927744-6-kuba@kernel.org>
References: <20260207003509.3927744-1-kuba@kernel.org>
 <20260207003509.3927744-6-kuba@kernel.org>
Subject: Re: [PATCH net-next v2 5/9] selftests: drv-net: give HW stats sync
 time extra 25% of margin
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
Content-Type: text/plain;
 charset=utf-8
Content-Transfer-Encoding: 7bit

Jakub Kicinski wrote:
> There are transient failures for devices which update stats
> periodically, especially if it's the FW DMA'ing the stats
> rather than host periodic work querying the FW. Wait 25%
> longer than strictly necessary.
> 
> For devices which don't report stats-block-usecs we retain
> 25 msec as the default wait time (0.025sec == 20,000usec * 1.25).
> 
> Reviewed-by: Petr Machata <petrm@nvidia.com>
> Signed-off-by: Jakub Kicinski <kuba@kernel.org>

Reviewed-by: Willem de Bruijn <willemb@google.com>
