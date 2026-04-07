Received: from mail-wm1-f45.google.com (mail-wm1-f45.google.com [209.85.128.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8C4F23AF672
	for <linux-kselftest@vger.kernel.org>; Tue,  7 Apr 2026 11:57:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775563024; cv=none; b=DqeZBkiOMHgBHsA/RaOfyrUvOSZypQhgC0/LLze9c7Wb8DVBBAs7lWwvRsTWb3/YZBfyZD6yyhK95b4q7NlfofjYKIo9OvSlFT+coyr8fV+kDOVYNVw7hFkDvnxvzEj0Dbm1d6icrdsKCtUi/qNLPVP+JzXFL3S0jKEl54e1M9I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775563024; c=relaxed/simple;
	bh=xW1oQelSJEebLZHmbEvIR9VXRTnFxofuUfen+XobBRU=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=KZRZ0HMsP/0o7yim7SifuDJJrZuCF7UuZKba3+b1Ci6QQHl39R5/mc0Zg0zjK71fGZPRwaIysNK/qyZBzNOHK9ikoDxUL5sR0h6rTsN8JT79wbaoLoIxgYNE89viVSO71IlULWwZHXARovZGprbjnd0mtEKH6fBsvhxZSwgSfug=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=resnulli.us; spf=none smtp.mailfrom=resnulli.us; dkim=pass (2048-bit key) header.d=resnulli-us.20251104.gappssmtp.com header.i=@resnulli-us.20251104.gappssmtp.com header.b=WWD0ZBkV; arc=none smtp.client-ip=209.85.128.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=resnulli.us
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=resnulli.us
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=resnulli-us.20251104.gappssmtp.com header.i=@resnulli-us.20251104.gappssmtp.com header.b="WWD0ZBkV"
Received: by mail-wm1-f45.google.com with SMTP id 5b1f17b1804b1-4887ca8e529so36389215e9.0
        for <linux-kselftest@vger.kernel.org>; Tue, 07 Apr 2026 04:57:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=resnulli-us.20251104.gappssmtp.com; s=20251104; t=1775563022; x=1776167822; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=xW1oQelSJEebLZHmbEvIR9VXRTnFxofuUfen+XobBRU=;
        b=WWD0ZBkVadGAYZjOaNHkGOE1H9Ad53aeOWrJZ+nvnriOgDqYyLGFktbnH2c431ayk7
         73N3Mfpd+qPOolHsTXptEVmk/at2zask83YhIvCDh+L4LEzewNWIAj2EHMhEU8n6CfIU
         z6lmyeB6HH2qeq2NGspuBRYafPjj3x0Xn6Ann9v1ETFVreFYLjyqBjx5HVLdh1H1IBYz
         1WTiyNLJRqoY/B31beEKzaisZJjGv09IpxanIW3X5KaK5mLhrr0HwYkVg+BaFKMeGicE
         fQ1Hyll+2xzpmzRcRiLJMUKGvM6ypdNY/uSXglEE75cHchAJu+77EFVVE8eq/h74iPI8
         0+oQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775563022; x=1776167822;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=xW1oQelSJEebLZHmbEvIR9VXRTnFxofuUfen+XobBRU=;
        b=RnnbEi2f6uBv4vKti0VOZS0Dhj1dE14o6NdrLHu8hHFOxL9lcPKeICn2IkrBou4vX6
         qN8z7WAiBjwq/J0xapQ5qD1mhGUGsxY7dGA2BPXWOZrfAhk5Zytm2IEH9Pjd57SWVzrf
         O51p9PjMRLrHeDnpELLCiE0GXh3d4KJa1/9A1lGdtMLQGXgtbUKG5xRW8XnqYyfbFa/I
         25AsVvTQXDOAcE6uUEUP5+g+sBzXFw9cDMutNaoG46uK1/a+tF67Z7DklePYQ6mck/19
         iAh3mgTd2sgXAhHt47fi5neTyJ0Lxd3uzWWeV4tjz08ksiEO4ih3HlyhdWGD4EX6T+BC
         ESsw==
X-Forwarded-Encrypted: i=1; AJvYcCVx7fyTE+NcGVQCSdQApTIwveLx2+taDSIwM9OYmBn06x7fIVFqb0QbASkQp4npvrFs7yGKCC3SNmoLtQGxHf8=@vger.kernel.org
X-Gm-Message-State: AOJu0YwZJmLdwjKb6sTdiEBvFUFHBAEZYhToCb+/SZbsv40dI7peF5EX
	wBcxbcGb48raOBWjjSiuubzEbqgJsDWp2P4RA3zycSlciz7s57fPqUysK8xBtRrqX6c=
X-Gm-Gg: AeBDievL1nOyYZM2h7et+6wPTS2uzu/8/biijVpwkmQLkp+lwjoi6ruYhsoYWJxcpwb
	JD3PmCaH4ttGC1WeX+GDuKftldJ0J+4OUSSs5lfEGv7pNJL3OF9ySRq/0G0vNBpj1Y1uy4+FvHh
	woUYfp/b/DxZjUfBv+OQvtdH66Z0GHktQ7nmEaGKF06JWSE8pPXuB3RLLe9we/oOjsJuE4iQTDy
	vf3UHDbvCOKqUDwIR1OmVsiPHEDtYb8Tkni5ES7zJP1UoQ0SuR9fAtHdwQ1hPxhWo9sMU5xeXeu
	P+7ndwLwR8CfttJkU6pRi5F5BznMShXkJWeDSn10kg2HpeEvDR/Qq7eTJgHc4rYkoQA3GtUHLXI
	B7ceGjXfQcwvNH9sKxEg/Xmvu0Biq1havKM6q7FdGFmyH9LO+DPrfEI2EAoCCfXLMCYeJAqfS7Y
	FN2pwxzsRoTWQbn9hzuq3ysXVENfqqkM+TwnYZDCereg==
X-Received: by 2002:a05:600c:c16f:b0:488:c239:d498 with SMTP id 5b1f17b1804b1-488c239d786mr9174875e9.8.1775563022032;
        Tue, 07 Apr 2026 04:57:02 -0700 (PDT)
Received: from FV6GYCPJ69 ([85.163.81.98])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-48895e19c10sm352553545e9.8.2026.04.07.04.57.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 07 Apr 2026 04:57:01 -0700 (PDT)
Date: Tue, 7 Apr 2026 13:57:00 +0200
From: Jiri Pirko <jiri@resnulli.us>
To: Marc Harvey <marcharvey@google.com>
Cc: Andrew Lunn <andrew+netdev@lunn.ch>, 
	"David S. Miller" <davem@davemloft.net>, Eric Dumazet <edumazet@google.com>, 
	Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, Shuah Khan <shuah@kernel.org>, 
	Simon Horman <horms@kernel.org>, netdev@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-kselftest@vger.kernel.org
Subject: Re: [PATCH net-next v5 08/10] net: team: Add new rx_enabled team
 port option
Message-ID: <fbco4oaoyqr26y4e3dmdl63bosxm7nquurclagu24mwi3yc2e5@honrlddrowpa>
References: <20260406-teaming-driver-internal-v5-0-e8a3f348a1c5@google.com>
 <20260406-teaming-driver-internal-v5-8-e8a3f348a1c5@google.com>
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260406-teaming-driver-internal-v5-8-e8a3f348a1c5@google.com>

Mon, Apr 06, 2026 at 05:03:44AM +0200, marcharvey@google.com wrote:
>Allow independent control over rx enablement via the rx_enabled option
>without affecting tx enablement. This affects the normal enabled
>option since a port is only considered enabled if both tx and rx are
>enabled.
>
>If this option is not used, then the enabled option will continue to
>behave exactly as it did before.
>
>Tested in a follow-up patch with a new selftest.
>
>Signed-off-by: Marc Harvey <marcharvey@google.com>

Reviewed-by: Jiri Pirko <jiri@nvidia.com>
