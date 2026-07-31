Received: from mail-ed1-f52.google.com (mail-ed1-f52.google.com [209.85.208.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 96A822D97BB
	for <linux-kselftest@vger.kernel.org>; Fri, 31 Jul 2026 16:25:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785515116; cv=none; b=E9371832qcTb509FU9WF8hJk81szNqJB0Z4LDXlKSvzKeapX840L+Ay1mWBs2xMBfPEdQd3WuaYK/imtYKS5CNZLDq6RKlg6Kl+WBMF1+vZb2g/vxgL+5ibTqiLkhTI7bdmuBdHJsEHk/Zg/eyfmrB6ATY0Zhlv5nAgYhYKdZpQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785515116; c=relaxed/simple;
	bh=mmCa+FdRO+K+/IkGEw0Xm9vDEfMDaGW/xLX+tz93PlQ=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=lF0ZdIeLFo/V1/KLJsp88gGkXtNGJ0UkAP++lXU4vz342QSNrPBQn/nRI871Mnt6uS5rcFU3nYxf5185NdoV3qs5+xQwYjNioFpc5YuCsfyvAi8b+47RTYkm83I4YJo+CivPLte9Tk9cRgTemHji3xlKJ2HMLzKY+kKFp1SCfJM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=CpHA6gPC; arc=none smtp.client-ip=209.85.208.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="CpHA6gPC"
Received: by mail-ed1-f52.google.com with SMTP id 4fb4d7f45d1cf-69fc6a09b5aso2161987a12.3
        for <linux-kselftest@vger.kernel.org>; Fri, 31 Jul 2026 09:25:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1785515113; x=1786119913; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=cpDVb8o2CW8R0i27JDWwyUc9WY4TavWFBH3ru2q2sb4=;
        b=CpHA6gPChMzv/eiKZ4yAxAYjqYXLfnwhF5kPcBFXFalkd/O2TA3UbPvTMWP9oNydgH
         E7xh8jBUWnWX5WduAuUJBQXunU3fXY6XTIWbpdEpIuM3rO0MbxPY6YjHMzuLufK4OzhO
         7SnbuqvNFCTM/YMpRDT/MocHJFWx918x6AV3hp6GoLSa/w0vRBIhJw+x1W4Ec8aukbtL
         wxeARj1TDLlUon5VwQ3W0b0bG4bmG94G5PXbjD/i7gGRNNe+/sF2QPv0HntpGIdSUuHT
         eXxyMZAxgsckOzjCPkmW/plhUqzvu4gC/BNEfuS6zD0LxchtII1UKVJgFdhCe86TgIdN
         hf4g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785515113; x=1786119913;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=cpDVb8o2CW8R0i27JDWwyUc9WY4TavWFBH3ru2q2sb4=;
        b=afrjh5HzrXBZLYqbcJ1Br4vP90ESkDtYWot1kxyVNYTimgzRZMnL22JKwTT9VSDID+
         QKGNvyPiDS6OJgN3Bns0nsMg5r68uwJdGNkqV6XUl1WjG5yRIxgtZDFo62LdyrJCMfn8
         UtaWydR+ags3+7kul3qGGIHTXsDa3PV/utXv6maR3jaTJ3UmyqiN89RsXH5ckyQudvZl
         JO/JGl8PokjCr1jrciAkI1TiUEv7WKEGTHQQdbStgI0zODYyVBF8Cc0gQvRKhkLxd9Ne
         MylJ6zvH/S66aM5FvkZVZpdhyGuvC85rHjlg/Dqad15aQCkgVnJmjOENnvqeQUVFM+8f
         Ol4A==
X-Forwarded-Encrypted: i=1; AHgh+RqilvBWs7XKTG/XStAvgwqqzzfgZmYSbZTF60nKtPPCD5jkQ5K7sSupKDPnK1cf+xK7GTWjygufUI9/3KFZn2Q=@vger.kernel.org
X-Gm-Message-State: AOJu0Yy9bN2XhN6PZbdRSKJIlQCLnMnYv0AXh7rJ2e8cOp8Sk/WkuXSa
	FUkE1f/tTJPy94WI2jvRxFUWL9F9+VE/iS6KiXwJvU+OizU7bK05BDFa
X-Gm-Gg: AR+sD13h6W5+dF9LjxOvG+rZE8RWazpVqPodOQ4Q9Jh6EmUBr06nITa167vPmSbz72a
	+Dc6hAgkNiSksAC2fDP0k1FxbXFvNDvJBjVl7M6CzaSTZCD3vYEw/PffcqnreEdCbBxX/MjtoQ/
	7s/Mi/rdkYc8c6nV9/2kUaXShPeI29vmikUd9eVeQLAgsURY5NRRhOs2kW3nYDtlywFQRACyhbv
	8YQGv9yRW27zzs77hD0Kgx7A7QNikgBxEPSY68+KMHzVa08vGTadWWW+6EPrwjjKDwhj0h75qMC
	NL7bYoruyj1COVIdMx72fZFj4+5Bi3DsqhQUZidsNyW4yAZgz4YTGUct9t72kpIlPrssRZw7gdp
	LSxdQEaVIm0VnWFumFhRgvBRP0UGHcc2vNqSeoef3qOXtD+FMJoWNiPvXEn+QISLx2h0OuGS1Jn
	o95SPncIzR1zwIyyp4+m31QvAIxzRPUSCoywXFsu5oVoOoadUksOekbUR+aLb82/uDpXa1rO4ia
	RMEScDwMMTv795RKr90ejgwHxxuzXCQoq4OMUPTflFpYT+JJMvkuz/RfdmtKgiDHFsk
X-Received: by 2002:a05:6402:4542:b0:68d:92cf:52f4 with SMTP id 4fb4d7f45d1cf-6a0a7c5e9f1mr180913a12.5.1785515112462;
        Fri, 31 Jul 2026 09:25:12 -0700 (PDT)
Received: from fedora-laptop ([172.245.82.59])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-6a09c655626sm2838383a12.22.2026.07.31.09.25.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 31 Jul 2026 09:25:11 -0700 (PDT)
Date: Fri, 31 Jul 2026 11:24:57 -0500
From: Ming Lei <tom.leiming@gmail.com>
To: Yang Xiuwei <yangxiuwei@kylinos.cn>
Cc: Jens Axboe <axboe@kernel.dk>, Shuah Khan <shuah@kernel.org>,
	linux-block@vger.kernel.org, linux-kselftest@vger.kernel.org,
	Caleb Sander Mateos <csander@purestorage.com>
Subject: Re: [PATCH] selftests: ublk: add rotating auto_buf index regression
 test
Message-ID: <amzMWY8FcK8SZWnz@fedora-laptop>
References: <20260730010910.799346-3-yangxiuwei@kylinos.cn>
 <20260730024050.1062354-1-yangxiuwei@kylinos.cn>
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260730024050.1062354-1-yangxiuwei@kylinos.cn>

On Thu, Jul 30, 2026 at 10:40:50AM +0800, Yang Xiuwei wrote:
> Batch AUTO_BUF_REG COMMIT must unregister the old auto_buf index before
> storing the next one. Fixed per-tag indexing (A == B) masks bugs that
> clear after overwriting io->buf.
> 
> Add kublk --rotate_auto_buf so each tag alternates between two sparse
> buffer indices, and test_batch_04.sh to exercise that path. Without the
> driver fix, the request ref stays stuck and I/O hangs; the test uses a
> short timeout and kills the ublk daemon to recover. With the fix, a
> small write completes quickly.
> 
> Signed-off-by: Yang Xiuwei <yangxiuwei@kylinos.cn>

Looks fine, 

Reviewed-by: Ming Lei <tom.leiming@gmail.com>

BTW, this selftest patch should have been part of
"[PATCH v2 0/2] ublk: fix auto buf reg ordering around uring_cmd"


Thanks,
Ming
