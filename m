Received: from mail-pj2-f0.google.com (mail-pj2-f0.google.com [74.125.227.128])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2BB3E419300
	for <linux-kselftest@vger.kernel.org>; Tue, 30 Jun 2026 18:21:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.227.128
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782843669; cv=none; b=SZjVIH8URIiRFmiK0/NRya7JRxm6LiyvHlYrJ50nSl+EWKtPrKPrtn+bpbqGnNpYtDFx2njbG1xzre7c19080gXL+X/xNdI7fUbfWaFSeumGPaaX9c7uae6Fohtuh9jx6ILJEG/zNJCYNpobDjohdqrcbEVD7r+bmEoI6T8QeuE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782843669; c=relaxed/simple;
	bh=S+bs5YY8NX9MFni5ePZnk3auDFAdp7FktKQwrUCbjzk=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=bMpK5ygAmrmfcWDpev0gUNB7ikOYqPfSPPNFWudFqp4CZiqAnBgNjTPO2xHjHYUICPtK+THpNuZ5G5skptR01tDmKtiqeSi/Bdagnr+CDlDqIEzvOaGhYLYMG7fqYc5+6hQ73tM2PuL4M4DLxnq3B4HW5SVY1p+qU9Mai2feXAA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=JWSEllub; arc=none smtp.client-ip=74.125.227.128
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="JWSEllub"
Received: by mail-pj2-f0.google.com with SMTP id d9443c01a7336-2c99784b434so4092425ad.0
        for <linux-kselftest@vger.kernel.org>; Tue, 30 Jun 2026 11:21:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1782843667; x=1783448467; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=moTdohrP+sT6ghuoSBO6hBwLx93Lg4139OZjTwnLapA=;
        b=JWSEllub/oy0geh1hNIMvNZxLHNkAdSvzdKjzioSVyU8h3ZxU5iUx2JZlqDCbZRA2T
         wcHHuUsDnGb/BcEqwqxVB6hUYkohbSGwGUCvGIaVx3Y8OA84SRyRwmNqJfE2157DqHdD
         0Kkbzo7lEpcOTObenhEND3Bhgo9mxvvYF0xad42yLVs1PBNg6Y0qcLUOi2VGABST724a
         2fl0iF/pIZNcBMNzu+CSKiSAkEd6s9zgVOpkHnJXqHc+DQi+6coP8wA5xxNHoavnweK6
         CY/J6r6q85EduTGZmbub5jMni7zUuQw5q2XUurGkgLWoCrPI+zrWSVowQb9SgIq9tnsg
         XKRg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782843667; x=1783448467;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=moTdohrP+sT6ghuoSBO6hBwLx93Lg4139OZjTwnLapA=;
        b=o+Q0BILMc1WK6VgEDvqID5kuhP2/VBkvpXdUaiQcmbujIxAxdyE4IJNqCRFxTL9jgM
         4jxYvf1AmmuNJ9qpcKjbEoJpeicGkaZmMOP7CCz26mHC0OHZDNiSIUscpaoN3Zr3pvrs
         LBYZBXk1dKujJtuF8FarRybea9uXGTzmD/goO/revYIc0k1IfyZIZsSTVbjT1HQFOQRM
         uQg5nsJSGkZM9S/nfJY3wiS36JH5CuZPMH/DKSed4hToQxZA3trj8Kx2/LChJtBVzwTq
         4pH8RJ/DJZrlg4tAHSTaQ6sKIttPIRiv5x5Kr5zm7uunc2c/BF7vgZsokB6OldpcFmev
         lKWQ==
X-Forwarded-Encrypted: i=1; AHgh+Ro6duRrbCEkqjvYyPxw39o0hKanXl/p1J+FYuVt/32jEqjpmC/VM3N69K3kLG9WCJfQuQogbE4dMGlWSVyqRlw=@vger.kernel.org
X-Gm-Message-State: AOJu0YyQn8/PAD4HxvtT9d35iRlJopd1KGNYWXpfFpQJO0EbiZqORpFh
	ZPVYBGUCFrOoD9/4gJM7CrrXNfZMY6IfV25D6Ncm7gO26JsRirtJoXrx
X-Gm-Gg: AfdE7cnYvWrniYUn/aHHtC16+Bm5/QR6tr91/ATGcVpa859glIo5wodQKxd6ffp/CrQ
	sTGffSDR/ArFDZmgfbNUwKxs3kUqfC+qgSkcp8hDxLtF7YyagwSW1cx59rtlvXpHZZfQDqRhqEB
	ysq/dM6bz7fHwOfzgfzKxN3+g/taZecU9TlIso95wtL+se/fAY0oXI9vrop79xx5/ySlo+YRfVs
	bE7qoS3zWmN+r9lVdUnMMDlmAdcPYEp6is0j0X5B+Y1Ol0Go/eF9W2sCH3ymUqdnEakhWBgT8ba
	f76rWQFxd9zZRgO5hfOxtiBFgbJXF7MQjOUV7yxeApIBx5rFBQ2ai3JFDqqNJAmCbGl0RMUY6Qm
	YvwLvJsxWas39wYg9dUSyrOUs2cQaty717XNVwRqvKHKgRMgFgLHRXsow+vA+ZJh7t4curDzvl6
	GTfJ/MoUXNAYZrywg+
X-Received: by 2002:a17:902:cece:b0:2c6:beeb:d7db with SMTP id d9443c01a7336-2ca2d55fb55mr39847525ad.16.1782843667531;
        Tue, 30 Jun 2026 11:21:07 -0700 (PDT)
Received: from localhost ([2a03:2880:2ff:40::])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2ca37a71053sm19735655ad.8.2026.06.30.11.21.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 30 Jun 2026 11:21:07 -0700 (PDT)
Date: Tue, 30 Jun 2026 11:20:39 -0700
From: Stanislav Fomichev <sdf.kernel@gmail.com>
To: Breno Leitao <leitao@debian.org>
Cc: "David S. Miller" <davem@davemloft.net>, 
	Eric Dumazet <edumazet@google.com>, Jakub Kicinski <kuba@kernel.org>, 
	Paolo Abeni <pabeni@redhat.com>, Simon Horman <horms@kernel.org>, 
	Willem de Bruijn <willemdebruijn.kernel@gmail.com>, Shuah Khan <shuah@kernel.org>, netdev@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-kselftest@vger.kernel.org, kernel-team@meta.com
Subject: Re: [PATCH net-next v2 3/4] ipv4: raw: convert do_raw_getsockopt to
 sockopt_t
Message-ID: <akQI8dwSsRcok272@devvm7509.cco0.facebook.com>
References: <20260630-getsockopt_phase2-v2-0-193335f3d4d1@debian.org>
 <20260630-getsockopt_phase2-v2-3-193335f3d4d1@debian.org>
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20260630-getsockopt_phase2-v2-3-193335f3d4d1@debian.org>

On 06/30, Breno Leitao wrote:
> Continue converting the proto-layer getsockopt callbacks to the sockopt_t
> interface, switching do_raw_getsockopt() and its raw_geticmpfilter()
> helper to take a sockopt_t.
> 
> The thin raw_getsockopt() wrapper keeps its __user signature for now: it
> builds a user-backed sockopt_t with sockopt_init_user(), calls the helper,
> and writes the returned length back to optlen. The helper uses
> copy_to_iter() instead of copy_to_user(). No functional change.
> 
> Signed-off-by: Breno Leitao <leitao@debian.org>

Acked-by: Stanislav Fomichev <sdf@fomichev.me>
