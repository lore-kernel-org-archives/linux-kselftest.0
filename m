Received: from mail-yw1-f169.google.com (mail-yw1-f169.google.com [209.85.128.169])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ED54327A12F
	for <linux-kselftest@vger.kernel.org>; Fri, 22 May 2026 04:34:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.169
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779424479; cv=none; b=gZDjKcnI6qmIOWkruMAurlpWUT49PFIFjgE8vg1zE//UG8VU0mq2NZeRI4xbMqJGbAw3CFVTnLagjbtIVixM0Pf+BZxfB6aTfGFJduSbldEC2HbLMvIZz7av2BEXhdyzLL+gr4yXKsnUhs3+alKExTQc0vBfavvbXUa1X/3rvUA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779424479; c=relaxed/simple;
	bh=ID/CA1JUu+vSL2WViBxYaJS7zNva0ko/lsuTwTKoGAU=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=JhqSFlbZOMkqapSX6YdOVPoqVrDCQPNeKZlct0d+m7D40YXhZygYTkibBGJnF7WgMHQvDI1RfmrvcwIVJDSpsf5oEth5Jde1C/8crAnAGSt54jBufo65wDuDQ3e6seZ99ygugxzrflSYfwuQY33oIttgPcVIt3hgRmtK6MFkuWM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=KJSSkU/s; arc=none smtp.client-ip=209.85.128.169
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="KJSSkU/s"
Received: by mail-yw1-f169.google.com with SMTP id 00721157ae682-7bf0b47d2f1so61528777b3.3
        for <linux-kselftest@vger.kernel.org>; Thu, 21 May 2026 21:34:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1779424477; x=1780029277; darn=vger.kernel.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=O1xzaqBhMDGVGNZbdTTocwyFc9fa0Vk+PAieH/4U9sc=;
        b=KJSSkU/sJdzUA6XFDnxR2o6XaKL0EOQwDAsjkVYS4mBkFjjU2xmeXNgfzRsNZDUCYm
         SKNmHNGKL/0IJ9lzFebXWk/RP81ZRUPNeQlUUPMPab95477Ztkg5Vthv9F9UmVOKFG+A
         mSR1Fm1n4fmYbSO8eO+uXPHxigDY4Mc5TUFtLwc9Ec+ew0vn0B737TjzC9Ljry8Zsgsp
         aRiM5twIQJuHeqsnUiloCGiAZQK4Q89KvuyNmM+o1a7zPY/EK+WmDwaKHlBKvnddr7oP
         04J0yQnlCiEshbISo6RvOsmHNVrG6WqWMlBDEki3bLoNB3CebNOA0tjjXS9kXk1MUzga
         0AYw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779424477; x=1780029277;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=O1xzaqBhMDGVGNZbdTTocwyFc9fa0Vk+PAieH/4U9sc=;
        b=Gas7RNbM2eobkoVEeKyScQbqTiqwB77kxm1V5q78j0FH6UF16pemBmXk9scrj1Z2/Z
         qxkJ2ejVu2Jl0x/WjS7J/LM75MvxkkUiEEboJY3GNmUp+FfnIY8WRtyIj8EddOf/5D/S
         BawbCahPg7uNyUzRdRaI5PxAkNaMZ6HwAo37NbJFVGeg05ugWAgeNaKIUuYjuIGnqoei
         wT1Wyrweq0ghSiaGSnCrqawDkp4DlOyXJDwkRKD81mcttdPN6TlA4Apf//W+m5/lnKFG
         8bklML49qd4vHAxbEvi7aTLsK+qdG9eeMFrp9Ro3VVg2ahiqim4tSjhvtSxnM76Y9Kze
         t82w==
X-Forwarded-Encrypted: i=1; AFNElJ+FQzDQNbhDVV0Kj8kUXyfDpj3PYss5XUfUEfYmJOMFIGaOueI6H9kyacMMtAFSHc2qYNEdfL3bsfpG0IC5wvw=@vger.kernel.org
X-Gm-Message-State: AOJu0YxlK7DdXBlu2n1XMjpdtxZIil0vRj+k8fi3846JzYl5HZrAcaRq
	LVlPVM61bv7M2JcdAQ8cuOq8FPrfTSHF7P6N4QUzs4QwGdRpwArgNJu+
X-Gm-Gg: Acq92OGDrXy2LYPSm1Hlm+lHxX5mLT5rbEDUX2cAcpiSmuGaSER0v8YnMidCDUs9Qvi
	EFU8P3idXBOBEkev8ICvYx6sB86bgazB0HBH3DiFyOEuY5fAuKTTaAXPaP00JRt20t6KDkwwoI3
	KNyOx/JVRHi3DYLU8eJMzVlOwmSFzCuCGWsY8odVxuwkdyBabJfwMgLNBa4x+J/7NA5xo7ovrb7
	w9M/oBmg2r5k/JmzmbVGfSWz8FrLpgis9ygAANCaBVCcE7xAYeLRd2Qt1N0oz1/GiE4LKY3oF8N
	zS4Vob2jzg+FIeQKJUU4PnXhzRkf9S/iYCeC3EagXuqn97yrRrTcFujy2Bob3VSpzE7sdgkk85x
	vadexJHlWwqc3QwxKpAMsSGDY3hTXETZ4YTavOCBSo0AAuCSNzvxfjFU4WPLTGQxE4pBEXqgKFj
	6gdZjSzgeQJ/KDH1nSnPNL5CHPBK6mYH6UqrX8mtcFFGF7TMb7n5lS
X-Received: by 2002:a05:690c:4a05:b0:7d0:5148:98eb with SMTP id 00721157ae682-7d337daf7a5mr24236757b3.4.1779424476861;
        Thu, 21 May 2026 21:34:36 -0700 (PDT)
Received: from hoboy.vegasvil.org ([2600:1700:2430:6f6f:e2d5:5eff:fea5:802f])
        by smtp.gmail.com with ESMTPSA id 00721157ae682-7d38c73ff33sm3491447b3.45.2026.05.21.21.34.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 21 May 2026 21:34:35 -0700 (PDT)
Date: Thu, 21 May 2026 21:34:25 -0700
From: Richard Cochran <richardcochran@gmail.com>
To: David Woodhouse <dwmw2@infradead.org>
Cc: Paolo Abeni <pabeni@redhat.com>, Jakub Kicinski <kuba@kernel.org>,
	Arthur Kiyanovski <akiyano@amazon.com>,
	Harshitha Ramamurthy <hramamurthy@google.com>,
	David Miller <davem@davemloft.net>, netdev@vger.kernel.org,
	Eric Dumazet <edumazet@google.com>,
	Thomas Gleixner <tglx@linutronix.de>,
	Miroslav Lichvar <mlichvar@redhat.com>,
	Andrew Lunn <andrew+netdev@lunn.ch>,
	Wen Gu <guwen@linux.alibaba.com>,
	Xuan Zhuo <xuanzhuo@linux.alibaba.com>,
	David Woodhouse <dwmw@amazon.com>,
	Yonatan Sarna <ysarna@amazon.com>,
	Zorik Machulsky <zorik@amazon.com>,
	Alexander Matushevsky <matua@amazon.com>,
	Saeed Bshara <saeedb@amazon.com>, Matt Wilson <msw@amazon.com>,
	Anthony Liguori <aliguori@amazon.com>,
	Nafea Bshara <nafea@amazon.com>,
	Evgeny Schmeilin <evgenys@amazon.com>,
	Netanel Belgazal <netanel@amazon.com>,
	Ali Saidi <alisaidi@amazon.com>,
	Benjamin Herrenschmidt <benh@amazon.com>,
	Noam Dagan <ndagan@amazon.com>, David Arinzon <darinzon@amazon.com>,
	Evgeny Ostrovsky <evostrov@amazon.com>,
	Ofir Tabachnik <ofirt@amazon.com>,
	Amit Bernstein <amitbern@amazon.com>,
	linux-kselftest@vger.kernel.org, shuah@kernel.org,
	vadim.fedorenko@linux.dev
Subject: Re: [PATCH v3 net-next 0/7] ptp: Add PHC timestamp quality attributes
Message-ID: <ag_c0b0lobeALpFa@hoboy.vegasvil.org>
References: <20260515164033.6403-1-akiyano@amazon.com>
 <20260518182646.2d1337d4@kernel.org>
 <177921463623.22936.15326822041328476600.b4-reply@b4>
 <20260519163351.61b746d0@kernel.org>
 <3685358a639c27a0f0b0ccfe2969c0cfa34cc392.camel@infradead.org>
 <b1c605ae-32ae-42ce-8890-2b32c9945c2e@redhat.com>
 <00c8f25006531726571836a9b2d4ded9227c27d2.camel@infradead.org>
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <00c8f25006531726571836a9b2d4ded9227c27d2.camel@infradead.org>

On Thu, May 21, 2026 at 02:09:55PM +0100, David Woodhouse wrote:
> 
> Ideally, yes. Although I think we *have* addressed that by implementing
> it for more than one backend driver, which Richard already said "would
> be more compelling" in  
> 
> https://lore.kernel.org/all/aIhGJ9BzR1wY7ij_@hoboy.vegasvil.org

Yes, if the API supports multiple devices, then that is an argument.

Thanks,
Richard


