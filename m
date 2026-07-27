Received: from mail-pj2-f11.google.com (mail-pj2-f11.google.com [74.125.227.139])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5D190390218
	for <linux-kselftest@vger.kernel.org>; Mon, 27 Jul 2026 15:27:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.227.139
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785166029; cv=none; b=kDVSaQNOS3uesFyCD5JynXuqqvTqg6/KrVkd+2Bi95Vl/qYFncDadMbGZ+rra1lDvB0JgHgvL2OggfCWA9c80oMeD8gjNHF7HuFUbw1XCJ0+G/SOHkxdc/NC82ewoHRrYRUFYxovjwV706eYrQerHOmCTryindyJzaiRalSiqRg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785166029; c=relaxed/simple;
	bh=RCMszCJlDtXUzAucA4CPTK6T8J9yaphFlk12h49frKQ=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=ZGlzfEKkDZ6M2AT6s6fM7D8LoJvxrBq8pKqBNJAzkMWXgF8jJ36Gu5CIT8w40eCKRfGHrdvSj7YnJYZNiaDYlnX9LLpukRsbh0h4xh8k0j4rAGsxSbntek+tho4laweLJRTnPnMZu+4x7PCMDxyh4QGBlKvyhCP4a4ivPfhama0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=KSIVHuG2; arc=none smtp.client-ip=74.125.227.139
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="KSIVHuG2"
Received: by mail-pj2-f11.google.com with SMTP id d9443c01a7336-2cf02ecb572so45104515ad.1
        for <linux-kselftest@vger.kernel.org>; Mon, 27 Jul 2026 08:27:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1785166027; x=1785770827; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=5y4b5oEa+hE1ReLew0hc95qd67MVZsyBvHPuZveM4yw=;
        b=KSIVHuG2We1xJpXK8g7YWyzw6Sn6dQhMkz8k8DNVIin25pSGEEEkgmkYOvx7YGjxsO
         gpuc5NfH0QwLn2iHJuD+j/7k3rSIYZb2WdMf8/n4x/Glw1P+o8nnc2snF7fcc//F4CZw
         2k2lXCf4RQfqsySu0wj37U5Z5K0uiI5PRMqluZmvnPOJBSzexoi6p24bYiKuiiZ7Ey8K
         25rfkuswVX+NzO07Pc/Bh/xonjUjadS1vvG7mZTOLx/eiBjmnIg4TXhYyGqxfRFNzThx
         pZRnprE7C39c9BOR7M9Wl9fkRzl6ZYn78QBEQPAuQ6DJ3Hl/sP2o31l/DN1nxji/D0He
         eVLg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785166027; x=1785770827;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=5y4b5oEa+hE1ReLew0hc95qd67MVZsyBvHPuZveM4yw=;
        b=dZ7N2N0qCAPXv30lQ7vXuN+La2xe7YbNh2JsbF9twv2bI1jcoGpenrxqaC+kRgumME
         K3XB2Tbyc7MjFwv/vrkvtgL+ol1bsNOp8MP+vqTs/jcOSgUyFQ5xofiJwZ7gwnWEwuw6
         tM4qJq1Jb73SXBOh1eZ76TsIDmeT8FJneiWbmOgviqF/T3dxEJdqqgnD/lxUMMAT8v2i
         B7s1optByBiGEdyYanRLNIaY9jGoGC5HVKrVGJPQOghdKOlAvw9JR5hE4Hwlyq9IjMr7
         Hz3GWs/AAWp7+3rXpoz5bAyW7dqsJe4caMV7NcuFhG8Ym/DBa3qjerDIeLTRKLLho38Y
         M3Jw==
X-Forwarded-Encrypted: i=1; AHgh+RpIb4sb1dph8Z9XlnJc4jD+wfI6lMLwapayrezbvB/5ZKkemLCLFQO7gJHj1rqj9Czn4eQTyuDftrFgM6/zJZI=@vger.kernel.org
X-Gm-Message-State: AOJu0YxfSN+2GNlE42jtYWiFUBl0N9Wa2mIVqoxtQbX0awjYRl3P+n5O
	rWTeHa+VMOSHm9mGVggmVwnzqhGEF10sbXdjP5Z1iXEMANhmKV/EkLHG6Nbr1IIKiig=
X-Gm-Gg: AR+sD12uP8lpChlIeEGKrl8WtRzS3wP73VDSLyEoQHp+poGO+eMbFrYRsfknYDXn2WO
	DL4GcGARS1x350OwUyMKsYPBgIwPZwSwN+IWY1a8u8rAF+A+bAA1t6vSziGoiOyzNtamwurKG3f
	12u4v0TWuyAYeax3SShrW2poZvouGk8YMb3F4nuVXOBhgatQiIfZefzgscPAZCt/mAedwRmXrtK
	xpKQQTAC4cJCm+Y26zOhLJAGrHdhZArut8tNbUCeqPPSpskVXE631in3pmer3CR7llnILrayIWo
	C7Nxydg5FwU8tQQXQsQwvmHoAdZMWFrHzjkBHr/mVBPk2oP5AVKZFovg3btxHdmqbyD52u+r4mE
	DZRmLVNq6yrTi/ZnJr+D1ZgcxGnkvq5GDS9A0/GiqfgOcmj7zGtINb1MForkmOyYsPlYcUw==
X-Received: by 2002:a05:6a00:1798:b0:848:89ee:9de6 with SMTP id d2e1a72fcca58-84e88b4c1cfmr830748b3a.58.1785166026723;
        Mon, 27 Jul 2026 08:27:06 -0700 (PDT)
Received: from localhost ([2a03:2880:2ff:3::])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-84e532ad0f2sm3189796b3a.25.2026.07.27.08.27.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 27 Jul 2026 08:27:06 -0700 (PDT)
Date: Mon, 27 Jul 2026 08:07:14 -0700
From: Stanislav Fomichev <sdf.kernel@gmail.com>
To: Breno Leitao <leitao@debian.org>
Cc: sdf@fomichev.me, "David S. Miller" <davem@davemloft.net>, 
	Eric Dumazet <edumazet@google.com>, Jakub Kicinski <kuba@kernel.org>, 
	Paolo Abeni <pabeni@redhat.com>, Simon Horman <horms@kernel.org>, 
	Alexander Aring <alex.aring@gmail.com>, Stefan Schmidt <stefan@datenfreihafen.org>, 
	Miquel Raynal <miquel.raynal@bootlin.com>, Remi Denis-Courmont <courmisch@gmail.com>, 
	=?utf-8?B?UsOpbWk=?= Denis-Courmont <remi.denis-courmont@nokia.com>, John Fastabend <john.fastabend@gmail.com>, 
	Sabrina Dubroca <sd@queasysnail.net>, Shuah Khan <shuah@kernel.org>, netdev@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-wpan@vger.kernel.org, linux-kselftest@vger.kernel.org, 
	kernel-team@meta.com, Joe Damato <joe@dama.to>
Subject: Re: [PATCH net-next v3 1/7] ipv6: raw: drop unused level argument
 from do_rawv6_getsockopt
Message-ID: <amd0G_gICVRdcEsR@devvm7509.cco0.facebook.com>
References: <20260727-getsockopt_phase4-v3-0-e89627544639@debian.org>
 <20260727-getsockopt_phase4-v3-1-e89627544639@debian.org>
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20260727-getsockopt_phase4-v3-1-e89627544639@debian.org>

On 07/27, Breno Leitao wrote:
> do_rawv6_getsockopt() takes a level argument but never uses it; the
> level dispatch is handled by the caller, rawv6_getsockopt(). Drop it,
> matching ipv4's do_raw_getsockopt().
> 
> No functional change.
> 
> Reviewed-by: Joe Damato <joe@dama.to>
> Signed-off-by: Breno Leitao <leitao@debian.org>

Acked-by: Stanislav Fomichev <sdf@fomichev.me>
