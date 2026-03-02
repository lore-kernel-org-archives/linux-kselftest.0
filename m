Received: from mail-pg1-f176.google.com (mail-pg1-f176.google.com [209.85.215.176])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4C5C2332ED0
	for <linux-kselftest@vger.kernel.org>; Mon,  2 Mar 2026 10:39:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.176
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772447970; cv=none; b=exS3ZUo+5eiZ1ErA5V7DdDHKdB4c+/neQDFl8HsVtF/WrbAXtyqBiCGShVeaUmbtOS6i3sfsNArNtf02w5uCnLofGVmmFut9EKWTND446iK7RZ9MtXIe9HTu0ZL5e7FJFaQ2Agr5R1Ects6+d0WSMaciVfXaoEtcuuw55Irs8ho=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772447970; c=relaxed/simple;
	bh=IXVKly4vZrqTzYsukfCbusZZsbWwT/ncueUw5X7V6KQ=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=XiDcK35XbHiEEklRSR9bQBw4dLMn2GuVaSREtqrql9sYq9m3o4DaSg2kLP0nIVE16gHyQzS17v+al0/BbgX7WQFQvh5u7WmST+gvNY5LByjGIO7FF1E34B/sG3qr1XtJVfAFExIpnsvXsInqYhMbdZEtl1mcTxJwkIzuUsXqxP8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ingeniumdigital.com; spf=pass smtp.mailfrom=ingeniumdigital.com; dkim=pass (2048-bit key) header.d=ingeniumdigital.com header.i=@ingeniumdigital.com header.b=WRB82fBn; arc=none smtp.client-ip=209.85.215.176
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ingeniumdigital.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ingeniumdigital.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ingeniumdigital.com header.i=@ingeniumdigital.com header.b="WRB82fBn"
Received: by mail-pg1-f176.google.com with SMTP id 41be03b00d2f7-c2af7d09533so2706710a12.1
        for <linux-kselftest@vger.kernel.org>; Mon, 02 Mar 2026 02:39:28 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ingeniumdigital.com; s=google; t=1772447967; x=1773052767; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=OhNp0kZiQhroSex4KBqfau9jIzn8Q9YBLyXvEf6AG2I=;
        b=WRB82fBn6Mt0KWT3LyX/aTua8f6u6bigfEF3NFsndNoAGHLjlF2DZBGABE5rEZkkCo
         E/0okwxAhKddlNScGiT9lzCnwWW1bFe4A8t/JcR3SZT+32NYcRLyH99b21NXiTIC1OuR
         qgWgjZ0Xmi428yuiBwE2l+6C8Klze8pruEtcVqVazzMbgfC9jzBszRBT2s8UMtDF1QML
         rzvGthu/RpGE4QHcIjl8sSItIczJD2CFCQnwUIeOpnyMH0hSRVae0LFGEgy+hEZbk+ZM
         e/xsjx1YhRX/GPJOT+S/OT0bcRY7ih/TigTBsllxGDXgJz7wWClFD0wll6w1+I+8VbP2
         zAgg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772447967; x=1773052767;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=OhNp0kZiQhroSex4KBqfau9jIzn8Q9YBLyXvEf6AG2I=;
        b=h/8i44uKtQNy2W+lY56K2ki1hbI/Q1pGpKKMBbAxU2Grj0yH6nMvNtb9GKjRu/wvp+
         mmZywGdmGofii60cSmrF0i35xvZ+a2p2UgP/f6jdiemj2YkMB1njPQYK6PTzTbWTam7z
         lSUciKCzdy/SVluQhsl6+txfD3tY3NxaIInnKw+RBeRfkJ0zVPHdulMWZavLy7COrKiL
         clcvUFxEnUnz8OIb8tanM10esdZD1QgaCG6btIyxLCQ5a7mpIR0ScsKuASCdGaY2j0W1
         MYgml8IOmMDN7wThz7fz+unRgJpZdYxU2LMEtDdFV+f8w2frw/kDIQRE4NIgJd7lDqFR
         Lx+A==
X-Forwarded-Encrypted: i=1; AJvYcCVC1SpgoaziDsZoNoHiqQPuD9AHpnMmtG+HgrVnGbh2UbjFm5dHrHg8HVA1n/OFWOK6dkXdSwy+NI6YFdmSoaw=@vger.kernel.org
X-Gm-Message-State: AOJu0YzSZWxozQ5h62gmZ6me5Z8d+1K7fOEzHOx/V01Rn/NXcWSXc/nF
	8mftpzDBcoxIMLWVDIukj1m/RtEGPFUUs4vlQqMO+tfJI+EyGhwjopKiQzsmeTWnX2T2umqsoUc
	7mlYwfF5g
X-Gm-Gg: ATEYQzzeshsHuDi13ohZrEKA56BlmFtzIa812J3azNry2ByHJAxWVrFnzD/3IKVycWZ
	PhOXu8sZGh/f1by/MurVV8B3bbYG5T8KDUSRDXef5e+FU+lFAW/qUmlNVh9GsV1OvPB1DWhF8xf
	UNm0LiGePUOi6CNHecYITU7xH+tT5wRHt2nyRojrGU8EXhjtoaWs15acaWSYDjjYK2E+dz7YCTr
	h+IPx6tl5fm3UnF20XBXsabjuMUPfm67pcmuLgWPSiyF5Oxl7namY+KdDHMmoY2N2FW6eUydCdC
	hmr4wANuTVVaXU0a+IwmZ+dZY16K2ncGqEqBjuagrk3AXgvt+gnD2VG4kkaXQR4RA8lh7PvOYXF
	RowK9uWSS3V5HJ1LtHj0lhGUcVcT3LB9cM7sBtKYvucPZYRzfrpJ2WqJ2Z7CH+AFkxfHrPyHgZ0
	HIrwvI5Xg3B0NjC/Iy79/2HgPYFHyLFgh6CeXxM9fwcw1CYfl1foiYuoeIvOSGuIPSvcIZc0nBg
	tr3Be8aKA==
X-Received: by 2002:a17:902:d48d:b0:2aa:d802:a010 with SMTP id d9443c01a7336-2ae2e3e71fdmr110572055ad.10.1772447967486;
        Mon, 02 Mar 2026 02:39:27 -0800 (PST)
Received: from ?IPV6:2001:8003:8824:9e00:6d16:7ef9:c827:387c? ([2001:8003:8824:9e00:6d16:7ef9:c827:387c])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2adfb6fe4f3sm130805925ad.91.2026.03.02.02.39.24
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 02 Mar 2026 02:39:26 -0800 (PST)
Message-ID: <b1ff54a9-bbf0-4a59-976b-4b5dba21359e@ingeniumdigital.com>
Date: Mon, 2 Mar 2026 18:39:22 +0800
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] kunit: tool: skip stty when stdin is not a tty
To: Shuvam Pandey <shuvampandey1@gmail.com>, brendan.higgins@linux.dev,
 davidgow@google.com
Cc: raemoar63@gmail.com, linux-kselftest@vger.kernel.org,
 kunit-dev@googlegroups.com, linux-kernel@vger.kernel.org
References: <20260227123136.91086-1-shuvampandey1@gmail.com>
Content-Language: fr
From: David Gow <david@ingeniumdigital.com>
X-Clacks-Overhead: GNU Terry Pratchett
In-Reply-To: <20260227123136.91086-1-shuvampandey1@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

Le 27/02/2026 à 8:31 PM, Shuvam Pandey a écrit :
> run_kernel() cleanup and signal_handler() invoke stty unconditionally.
> When stdin is not a tty (for example in CI or unit tests), this writes
> noise to stderr.
> 
> Call stty only when stdin is a tty.
> 
> Add regression tests for these paths:
> - run_kernel() with non-tty stdin
> - signal_handler() with non-tty stdin
> - signal_handler() with tty stdin
> 
> Signed-off-by: Shuvam Pandey <shuvampandey1@gmail.com>
> ---

Reviewed-by: David Gow <david@davidgow.net>

Cheers,
-- David
