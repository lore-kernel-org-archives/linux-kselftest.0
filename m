Received: from mail-oo2-f41.google.com (mail-oo2-f41.google.com [74.125.231.169])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EBA863D3CE2
	for <linux-kselftest@vger.kernel.org>; Tue, 22 Sep 2026 17:01:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.231.169
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790096473; cv=none; b=mVToO/HRThQp2bO+ibJeaYqzODk6S3rqE9Sfr2CvkSxG2ViVAymI/ytASj3l7Nx0fka+0UL+RtpMQXHdQCA9azUvSm33TFjAfJPmOZNXvTmP43C9TY93USkJWaTOslzvk5wwMp1iS564lJ4jt6brd9CjKcNBxL6JmPl7l2VsTOQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790096473; c=relaxed/simple;
	bh=qQJNstfTwv8iNMFEAMGwgqeGoCJp+DtUVQAv7X3CIJc=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=VrF1OqaaW9TwUDVWTTk8EkAeL8hDZtvmje7z8IWhfXETWGPMQuydEUO1vPBaJZFMTptD3F7sXhOAwfE1VUTDe6bW6m79+CrM3ahSTJldqWq5YDFkBCelOckXi5ayKBwAG05miLfiTOCoo2WdNlcyidD/pw18pgsseTUYG6A/2bI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=openai.com; spf=pass smtp.mailfrom=openai.com; dkim=pass (1024-bit key) header.d=openai.com header.i=@openai.com header.b=K5I068TP; arc=none smtp.client-ip=74.125.231.169
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=openai.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=openai.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=openai.com header.i=@openai.com header.b="K5I068TP"
Received: by mail-oo2-f41.google.com with SMTP id 006d021491bc7-6b1ae736c63so40317eaf.1
        for <linux-kselftest@vger.kernel.org>; Tue, 22 Sep 2026 10:01:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=openai.com; s=google; t=1790096471; x=1790701271; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=x9YLkzZ28C/6ZrOI8QJdDbKRDoNHJA/GmIfIJsBNLEU=;
        b=K5I068TPjV9liWWYwr3JJnaVOZUY+7NEnuaI5vHQI1YOo/tX9359vu+rUgb83158mX
         fiIxQnMdPanBMvVq7/ybZvzVRNNyp+t/f6e9Q+mw6oh/N+rS1VpvBqDXok/Vaqe26f8r
         5IjhwZ8FbChSAOVBb7b1FYDk62ruBclKtXIAk=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790096471; x=1790701271;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=x9YLkzZ28C/6ZrOI8QJdDbKRDoNHJA/GmIfIJsBNLEU=;
        b=m4AtCe9ydCQ3/p7hJ7BU1rbx3+vnt9tDKEeJYt7q2aEM2lAu0ir9MqXiECgBNm2lFu
         p9qendiIg29gpA5fMCLsfi/Ii6PKFEi+OKPZTzg2oPnExHSiLsKX6jCWyRPLB74o24Tf
         wpLhuEnZ/MldqSwWJ3hOy7gjB+i4LDD1t5aIZKoeEK6xmeGR+rTbFy9ytdfGv0rBxjdm
         o776FuWD8fCcYrQHP7gQPQcAlXMJgL3aTFJi9G0VGER8NHBZFwwh0WGp2FO7KVPDyAAi
         MpjCrxxiRwA3d1YxR5EXSxknk6d+H9wLJyhPH9axsp275MYGfdjTOvtEOULDj8TaH7Nu
         ZI9A==
X-Forwarded-Encrypted: i=1; AKwUvByid/dX7vqnd+2WhXt5JCDjIlIlKHQXYzh55AN0MpL0cVJPvQcu+uKiDy5YN87b6+MhsuN8DyeNy2GSENLMEC8=@vger.kernel.org
X-Gm-Message-State: AFuF++kvGI1ChXabLz2q1vvmnyvHvzeWmkxcxzzoD8YKtlRciLU2YYwz
	fWwbDGAR1v0GbiFzwQ4ChG9fVkGGawTFzc+oVvv0YnweSGWinRpNoziNHIXQbHyeVUo=
X-Gm-Gg: AYBFou10jUMMd41b5CzNDAV8klMtW146Tj00lQpuWK+MI+/XYJ0VgmkcWs8ytO7F9ic
	5AeATdzOlIFOOnb2JRUBhROgYjjTUBxeszhj6M6P9fVunJn75Lcw3gYecfGCrJODIkMLfrlHnB1
	HI7OZfSd8ZXU5p11zU9qoLK9uEIev+7dYViJ9Iy+41DFOYO96wir6zFMb3Rh/7L2WMnaWLL/tgf
	bPbjhDKQh3Lvaviglra3mwv3qhAKlghJb9uoWflNR/uLFFG4GyiBm89wfa/064dEVOcdwMTpmxT
	pitKRL9a6E16VglUzCz84svDWUtl0ZFC9+63UBgmNVg4uBQqZFTOXLRA0GmBJcsB1ZEfW/xsyOl
	Wcx1Kqq/uSxF97wmwasoBhc1yDSGPq+7f4+nxMX/mG3svnTjOUW471vY2+BbQyNYsqK/Hu8YRoV
	JHa7HzvHKXPpKjWZcF5lYhcbN4fP14vmsSvBc+V5P8sXqIpNqwNMUEsVIm75T8d+uWKPs9hvYTR
	FWWHy0ITlhpfokVqXA5tfB3ALRYQo2rem97G57qfkUEdD0THXxTl3p124BdRd2/
X-Received: by 2002:a05:6820:619:b0:6be:b2e3:27e with SMTP id 006d021491bc7-6d2cff43388mr26252eaf.16.1790096470557;
        Tue, 22 Sep 2026 10:01:10 -0700 (PDT)
Received: from com-94485 ([199.47.143.14])
        by smtp.gmail.com with ESMTPSA id 006d021491bc7-6d2cfc4a98fsm35786eaf.15.2026.09.22.10.01.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 22 Sep 2026 10:01:10 -0700 (PDT)
Date: Tue, 22 Sep 2026 10:01:06 -0700
From: Jeff Jo <jeffjo@openai.com>
To: Eric Dumazet <edumazet@google.com>
Cc: netdev@vger.kernel.org, ncardwell@google.com, kuniyu@google.com,
	davem@davemloft.net, kuba@kernel.org, pabeni@redhat.com,
	horms@kernel.org, shuah@kernel.org, linux-kernel@vger.kernel.org,
	linux-kselftest@vger.kernel.org
Subject: Re: [PATCH net 2/2] selftests: net: check timestamp echo after an
 old ACK
Message-ID: <arK0UmX8qJy3O-rS@com-94485>
References: <20260921222609.50824-4-jeffjo@openai.com>
 <20260921222609.50824-6-jeffjo@openai.com>
 <CANn89iK00zXGA8sdpH9Y1CkFK3n=uKG9Bci3+=69fGV0UDQ80w@mail.gmail.com>
 <arIE_i8Ysz5nOI2W@com-94485>
 <CANn89i+nY499TfuGMvMq3P=Pxw6vBxe+uYH1zioK=bhU--GXYw@mail.gmail.com>
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CANn89i+nY499TfuGMvMq3P=Pxw6vBxe+uYH1zioK=bhU--GXYw@mail.gmail.com>

O Tue, Sep 22, 2026 at 10:09:42AM +0200, Eric Dumazet wrote:
> I saw you sent the packetdrill patch for formal inclusion.
> 
> Let's wait for it to be merged and our runners to be updated, as the
> kernel bug is minor.
> This will allow us to get a nicer packetdrill test that exposes the
> issue directly instead of via a workaround.
> 
> Thanks!

Sounds good, thank you!
