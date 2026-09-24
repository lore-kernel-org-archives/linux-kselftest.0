Received: from mail-qk1-f178.google.com (mail-qk1-f178.google.com [209.85.222.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 87E42207A20
	for <linux-kselftest@vger.kernel.org>; Thu, 24 Sep 2026 22:47:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.178
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790290068; cv=none; b=RJsg3aSGy/47Tu0JymV8BOAW5ebyBvyEuFY0D21CYZN4kaw3j9Pmr1mOhYGPHC6sxIcD+PalanPEYr6HgfyzOEXMm0QnMdf2lsNSbDtcJ2ximtEt9nEK6XptruBZ8pQ1hAgClzcPzc6Rms0V2C7hlppGEBU5JakWObe15AnO3ok=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790290068; c=relaxed/simple;
	bh=7SCEEkuBWLZ4T8qu3VgLTnKuBPOEuVnxK68IIqaxVZw=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=pr2igbFYHVU7Oa6J7wbvM/p0tC7MExlB0oBFOBtV/0Dw01gIN5LQqZKv2XJ2HymxQw0K6Fedch8p1Vami8+qJwhs+2Pb9uK7me/KUq16L2P4bVLwzCyvO3LKseZil/aqdIhH4mMyrSJRon0UZaokmE6G3pyO5+jfINP6M6tRtMY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=openai.com; spf=pass smtp.mailfrom=openai.com; dkim=pass (1024-bit key) header.d=openai.com header.i=@openai.com header.b=FQSuiEs8; arc=none smtp.client-ip=209.85.222.178
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=openai.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=openai.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=openai.com header.i=@openai.com header.b="FQSuiEs8"
Received: by mail-qk1-f178.google.com with SMTP id af79cd13be357-93a40a9a01aso124731385a.0
        for <linux-kselftest@vger.kernel.org>; Thu, 24 Sep 2026 15:47:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=openai.com; s=google; t=1790290066; x=1790894866; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=L9YuvIHbEaXAjwyRmrBnPzvZ0AzYrFC0d+yhFwM5Vvc=;
        b=FQSuiEs8yk20C3cgH+Uol14ljRLfcc7POmRtMmQZigymu8xU/aemuc/PLEretOlkpr
         pRJcISTV6fatfEXxbRj5EwUW2CSYIbR7U30nml9yd5Hmtyrt0gLSHctneWWoMVuTN7jt
         fkGk8QayFLortbs8rK2nrh5dD208Q/7VroKIs=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790290066; x=1790894866;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=L9YuvIHbEaXAjwyRmrBnPzvZ0AzYrFC0d+yhFwM5Vvc=;
        b=qNDp5cxmVLFyuTXVEknYPMmibIXPQAdrRpgRnItZVIfSkGSlkocQx6SoUPAOq+qTNR
         sXO8h9H7mkZj/HbaWM1B7+IDwBcNyNwuQsu5TAyrW50emxD+SVOGET4zAeLf23GyRg8W
         fkFbZRLkgddqxje8LLuqyuOSldvMGJ1BZsvLcocbWNGl3i7DZPHuHGl8T7eBOZ7021pa
         CmRsbbNj65m5mL82kqMGjG785ryqNjxXmsGWnV1dZjMy6AYeWi+z0V2u9wxtZ+/BWAqi
         MySWAkI62Q1GYFfm9N/8NHi6BSE+hcsjcEUStxGpm4IAhcEYqu79ApzIlbiENftChYNG
         bqDg==
X-Forwarded-Encrypted: i=1; AKwUvBzNv5Tq1cUMJ+MsZc9zsWctk7H1RYLAYZMvtYmW6+LsPrxHac6dcg77Wt40ERt6mu0J/zodt6Pw4WablgSSaKE=@vger.kernel.org
X-Gm-Message-State: AFuF++nVwb3qqTrdKMmZnPZBUqpSlPujeKz31BJNVSYDSWzJcnM6M0mo
	WRCHH/2WjULzz1got/SOcSq+uTdX03HdraXK//LTfs6bu4Wiy8cih4EjbFKpbXCNKPU=
X-Gm-Gg: AYBFou3pAQQSL4UaEs3Ghqi1xAgCqrHRrqnzfrLukaaSgnCBbOWwu5h9m4FFjPbCaWa
	3n3jOcsBCGWzITBuYt0YXx7CZGvTyHp12OGxOiY7vBMNWTmeLuZD3in2kGZ1YMyZ2F5Yji6vwRO
	dn+cScJMccLQ8YgGY0t4sY5FWePVO3GgOUT1t8oOtfXnmyIVdndp9qkmA5+QwLjjwrjkj46Lcej
	IfK28bix9kf6q4ov5Dh43M6j0NuL7SEQ9rpdZfv9S6Zlfkd1xzfhXot7Szrd7b1GNBwAA4rkjhF
	xyQBBVyLkkYhyTxTtMIfRyXkGvwg5zP88x28QHV+Mp4ftnnl+EwW7aFbfq7qi6QbBl1hOH3XJkA
	wZhndSyNVNWEIbb3HhI0MucMtG5x/Nzay+bYpJ38P2qZ8Thg652fcIv7VBlznB2Ii7hfNclU7F8
	D+nWlQozc5ejEBLFwnn9ZNZZ5agpA78IxuvUumqXL9T+uRGttEOf9IZrds9JvC/xUuc2GHiaC/4
	Oc48791iu8Kqicn+o+mzYKXDVz7L6+lcmXakEU5p4eqBwdVKmDBwg==
X-Received: by 2002:a05:620a:271d:b0:939:b783:1748 with SMTP id af79cd13be357-93c43be8e87mr134440885a.7.1790290066467;
        Thu, 24 Sep 2026 15:47:46 -0700 (PDT)
Received: from com-94485 ([199.47.143.14])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-91430dd2858sm3966786d6.21.2026.09.24.15.47.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 24 Sep 2026 15:47:46 -0700 (PDT)
Date: Thu, 24 Sep 2026 15:47:42 -0700
From: Jeff Jo <jeffjo@openai.com>
To: Neal Cardwell <ncardwell@google.com>
Cc: Eric Dumazet <edumazet@google.com>, netdev@vger.kernel.org,
	kuniyu@google.com, davem@davemloft.net, kuba@kernel.org,
	pabeni@redhat.com, horms@kernel.org, shuah@kernel.org,
	linux-kernel@vger.kernel.org, linux-kselftest@vger.kernel.org
Subject: Re: [PATCH net 2/2] selftests: net: check timestamp echo after an
 old ACK
Message-ID: <arWojplQqr0nRjcY@com-94485>
References: <20260921222609.50824-4-jeffjo@openai.com>
 <20260921222609.50824-6-jeffjo@openai.com>
 <CANn89iK00zXGA8sdpH9Y1CkFK3n=uKG9Bci3+=69fGV0UDQ80w@mail.gmail.com>
 <arIE_i8Ysz5nOI2W@com-94485>
 <CANn89i+nY499TfuGMvMq3P=Pxw6vBxe+uYH1zioK=bhU--GXYw@mail.gmail.com>
 <arK0UmX8qJy3O-rS@com-94485>
 <CADVnQym70oFVCvcsGsf1PRcKX4cPK5N60uW3Masf9nNV3c+yrA@mail.gmail.com>
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CADVnQym70oFVCvcsGsf1PRcKX4cPK5N60uW3Masf9nNV3c+yrA@mail.gmail.com>

> Jeff, if you could revise your tests, re-run both your tests and the
> existing packetdrill tests, ensure they pass, and then re-mail the
> patches to the list, I'd appreciate it.
> 
> Thanks,
> neal

I've resubmitted the patch with the proposed changes here
https://lore.kernel.org/netdev/20260924224456.55690-4-jeffjo@openai.com/T/#t.
Thanks for all your help!

Jeff
