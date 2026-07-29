Received: from mail-yw1-f178.google.com (mail-yw1-f178.google.com [209.85.128.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 769853BB109
	for <linux-kselftest@vger.kernel.org>; Wed, 29 Jul 2026 07:49:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.178
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785311400; cv=none; b=nOo4KadCM5ZQyLViP93XXQx/BzC9Ct3lCTeHBZ60LArVKe0LRcA4y9zEMfstqZMdju1Px4yuMacTjQwEQERw9OERHKHdYqog1/EvQNIT49Q+udTDCoCrKAQB/lo84PWxpUL8TRh4wMchZLiVGrztRe1ecCSUNCbKX8HxtdMoodA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785311400; c=relaxed/simple;
	bh=AvtCVfcWgWbYEWNQXDKLlpw6QKu9G16znCcJfeto8sA=;
	h=Date:From:To:Cc:Message-ID:In-Reply-To:References:Subject:
	 Mime-Version:Content-Type; b=Ard/6wN6lEaBTLQ+hf59b8eO9/k3a9SvOprXCLVYqEPvmsKplc0wRWLr5+fRgRYO7QFh9LWbFRV9MsIFi7gqB/SPZLBeJ090Q0HLf38e++8GF1OgWsT8VALaXzMGFe+MHPTI6qo1nBjueFxrNvxPOwnQpI7f1c2S3d5nZW3IIk8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=eTRvS+ks; arc=none smtp.client-ip=209.85.128.178
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="eTRvS+ks"
Received: by mail-yw1-f178.google.com with SMTP id 00721157ae682-81ed073fed0so10492687b3.0
        for <linux-kselftest@vger.kernel.org>; Wed, 29 Jul 2026 00:49:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1785311389; x=1785916189; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:subject
         :references:in-reply-to:message-id:cc:to:from:date:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=fG9on5R0A/VDaaNskVD5jkrua+u9JPH3I1rvPYIlxxc=;
        b=eTRvS+ksXEX99Kks3dX8Dy7B2A/05Z+NcOh1OVuwr571TpRDc0UzZp4GYJsslebQVc
         W0BDn9MJgsrPy3fiFZiPCS6RhTVOmwiKAz9oI5WYfk1qe4e7AwCdaSRIp7TU5oPr+1lZ
         ojWHw5+vqRs/nLNn+sakwa/e2yzFPhGZt+57Ldv5QgHLGFgJmeVv3dUA8RpoXmHG+p1v
         S/yM0yIeB3KgsSCGhGDaPjjV7JJKoNHhxoglEYsJmQwNWUyUuAo1DkXGVURAZfqvjxur
         0kLwwJ7hftzmkJXbhpXlhgKbICakrh3jXFD79LItX6OdxEvTDTGgrdsbxS6aZA5AadKZ
         C3nw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785311389; x=1785916189;
        h=content-transfer-encoding:content-type:mime-version:subject
         :references:in-reply-to:message-id:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=fG9on5R0A/VDaaNskVD5jkrua+u9JPH3I1rvPYIlxxc=;
        b=OdJz8JzleAkex5iFOku7EmBYCZON6F4jlVKMbhDCxAmD21DiUVQ4Ctw1E/fdwT6kz7
         XG9TyTBQiNXD3W6N5geRPOC5+Op9KIMzsIFjOK3RUjS4HPvDJqkuE96XrzvE0bv0lnhr
         QFkOEb3NwedjUveXK6pcpFIMElkwOBwZIuHbOEwO9CIsWbtUST7vvJjWVFBO7xjJWggY
         qHs+oFeTt66fkdT8dBwODZgdENrg2fJM+mb5Cr73pZT4n95lZp/M2KvgBzFQrZ2mJVeH
         MZvSN1JkE6z5zbGhot5zqEpWG7BC87bBzK/FaSMHuPnG6M4ur+aAPm2bIVMR93jRM8wU
         Pdnw==
X-Forwarded-Encrypted: i=1; AHgh+RrljLx71fLZjErQ0oNEGATcRTeOI3EuU8EEg+rackxkwEf1o3fzAXLKKcKc8lQarzu93QAEhUtCKs21MjfRDHQ=@vger.kernel.org
X-Gm-Message-State: AOJu0YzmER1OQ6kg6Gt/Gkb2S+2Fik9rztYEBHmiHCgLuc7Hhe/4qgRG
	VbcG3DBZlJe6sLgG2pymBlQAZVDyf6W25afUf+t1GirrxbVqT2QOCt62
X-Gm-Gg: AR+sD13794nBz1VVhKZoN7UqPqDXdWz0pxN/BtDR2O6XLc7fr+6uRF5vLbMpOY8+MJ/
	qx3PcL34muFTf9nJgtUa4a117OJLHEpxXCGzoGD/NmSLfLNIv3TCrgWxWnMGg0D606CPO3d9tk7
	RSSWWiItDai2Sr05dDHFBncRhPL9mcw2AeLHecBNCkWiFyQquqDt+DZXtB5zXLO9Or5zO/T/mUh
	hQJrWVzXJ8OiTa7c4ci101JWPiJky89ktduWdSCK4Oi8rwvv0dB1d/8L+6AGxRuE7n7skrSVDo2
	e8IkR8UAmimJBBjepwddaCadUb4F3afDcVQY1cCN2geyHaxPFfETeJ1xOv0kJ2/J5Xw9B6I5MsN
	Ilp900QS5JM5t3Qwc8zoNojkBVmUQqhwuMOxdAJv+4xy7RmeOYojN6b025PQdOTk9snwvHKAFnE
	DUvvieshn3qhaHfK+886Vxgtinn2a3QfsykHXRZJ7Qhp2/SDS7ZY1eRuM+C1OdcGk2bjIC89VGG
	k2FIjHuNlIpx0Xv8pgj3Nh0r7fo1hT5hw1A
X-Received: by 2002:a05:690c:b03:b0:81e:b981:3eb5 with SMTP id 00721157ae682-81f99152f46mr28749767b3.23.1785311388862;
        Wed, 29 Jul 2026 00:49:48 -0700 (PDT)
Received: from gmail.com (250.4.48.34.bc.googleusercontent.com. [34.48.4.250])
        by smtp.gmail.com with ESMTPSA id 00721157ae682-81fa29b1f9csm13559087b3.46.2026.07.29.00.49.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 29 Jul 2026 00:49:48 -0700 (PDT)
Date: Wed, 29 Jul 2026 03:49:48 -0400
From: Willem de Bruijn <willemdebruijn.kernel@gmail.com>
To: Joe Damato <joe@dama.to>, 
 netdev@vger.kernel.org, 
 "David S. Miller" <davem@davemloft.net>, 
 Eric Dumazet <edumazet@google.com>, 
 Jakub Kicinski <kuba@kernel.org>, 
 Paolo Abeni <pabeni@redhat.com>, 
 Simon Horman <horms@kernel.org>, 
 Shuah Khan <shuah@kernel.org>
Cc: andrew+netdev@lunn.ch, 
 willemb@google.com, 
 linux-kselftest@vger.kernel.org, 
 Joe Damato <joe@dama.to>, 
 linux-kernel@vger.kernel.org
Message-ID: <willemdebruijn.kernel.ab3e673de325@gmail.com>
In-Reply-To: <20260728160935.4128982-2-joe@dama.to>
References: <20260728160935.4128982-1-joe@dama.to>
 <20260728160935.4128982-2-joe@dama.to>
Subject: Re: [PATCH net-next 1/5] selftests/net: psock: Generalize psock bind
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
Content-Type: text/plain;
 charset=utf-8
Content-Transfer-Encoding: 7bit

Joe Damato wrote:
> Generalize packet socket binding so that types other than ETH_P_IP can
> be used.
> 
> Signed-off-by: Joe Damato <joe@dama.to>

Reviewed-by: Willem de Bruijn <willemb@google.com>

I'm generally in favor of splitting out series and subjective, but a
few of these patches could probably have been squashed.
