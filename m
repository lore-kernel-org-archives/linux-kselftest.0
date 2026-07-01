Received: from mail-yw1-f175.google.com (mail-yw1-f175.google.com [209.85.128.175])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D807E3B8BC6
	for <linux-kselftest@vger.kernel.org>; Wed,  1 Jul 2026 21:52:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.175
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782942763; cv=none; b=U4ucD/YxJ7yL9+u8z7vJfiHfP+aA41WarXeCG/hgFgT8g2iMMR15HNnGy1jR0oWv1m+yOZ0FXSE+uSr6fTjotZY1KMRKDjDCqxSt0H1QFfMhfnk3begWDcUHEPcPyICc+GLlk6HLr7uIkXL9/tc6KM+rlXwqKcI+n3YPbQAl2MM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782942763; c=relaxed/simple;
	bh=1Y6DjJ1LCeD3sBL3Az1XXEM2jcbtGBHHZuKScutYlCE=;
	h=Date:From:To:Cc:Message-ID:In-Reply-To:References:Subject:
	 Mime-Version:Content-Type; b=WdshnIqSxDYFkEnIdGDCdyGOox6jttih6PMMs5La4vRmP+gKyO1WWww9Ku3krgOZPw9l+cw+15soAYbhqFD91VZUd5RIwcuqn9PBNS+nOYYIynj1vcxIuKdtbczux/3RHBauuWCCkFdl9ykn6rANcX/8q0u/yQo3fh+xj8TMX2g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=VB52gjnb; arc=none smtp.client-ip=209.85.128.175
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="VB52gjnb"
Received: by mail-yw1-f175.google.com with SMTP id 00721157ae682-80bb41f7f3cso13041017b3.2
        for <linux-kselftest@vger.kernel.org>; Wed, 01 Jul 2026 14:52:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1782942761; x=1783547561; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:subject
         :references:in-reply-to:message-id:cc:to:from:date:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=fecQlwD9cDVj4gbPcRpMSFTPB6deWnmpM1J4y46Iqls=;
        b=VB52gjnbFRBPGf+vpZHpRNhjJWzOmR4WTobLinp+ZhcgsKMaasNs+NWRlmLzxLYhvG
         gcrAWSmGyEETdo3M5K/a188nb+3cEu5gXlHKa1WOZD2p0DTbtHWyH8w68/XF/ev52hsk
         4ToQEOhHt+kjdE6InZ/79ZinOGCzD9ZNBtzP5UcdxZiZC0lxLa8dtVvjMQjIKGMVNq1f
         wW50t8PAw3XpBauO/W868SJcuS46CwcGKL0rkHheGMqpAIig/lOZd6WH3SrzuSKO59UD
         oFomFH7Qm5nbPqezpF0ee5o1/uwj0sFpN1AhioSIiIoIhV+cBXReAF/41Ra0cCFBicRe
         SyRA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782942761; x=1783547561;
        h=content-transfer-encoding:content-type:mime-version:subject
         :references:in-reply-to:message-id:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=fecQlwD9cDVj4gbPcRpMSFTPB6deWnmpM1J4y46Iqls=;
        b=f0vgYf/S++Wk6vpixaYo2QqCGkmc0e6N6RWUddo8mpCvuXyWY6ypkL5B2WExre4KAZ
         nVHZOJEHPLabstQ65Pkzdg6fQq+HUFIBXkRGj+VjD3iBU+Ra3/kW6aWbgabAsp68pkG1
         zIDUn2NCdAuBP1B+lqQMnA3/CeglgRZwPB61VSP9UYYTqR/jh4oBP0ez7IbddJpY50lN
         PbFP70Lfilw9HamcrcYhHryDIdAMmvZUPDlJHZRyVoEBpjXh6UM1+CLV4ur2QbK5c4lW
         +o36shnDx40fXc/0SbBG1rEMo2b2na/uk3vhpkcoOHmexJQMkeYLmR9d6ZQYQVNPMj+i
         0qRQ==
X-Forwarded-Encrypted: i=1; AHgh+RrXOScxKmXXu9DRnPtaNYn2lKaRsXyqn6jhuqvWUhDigUyTJNhjMmX0qeks1/zR3fifqFK0iMoB/z4EGQoReJQ=@vger.kernel.org
X-Gm-Message-State: AOJu0YyqShFYPGVuw6dBQfIsVogNSzqlPZJDUuu+xVmPYSsWOgEWtYqv
	texpaQTAz5v7kjpKcqzk69Ff3rn3dgoVOpq6y7yhZ5DEKkd+33CTGCLZ
X-Gm-Gg: AfdE7clhwcGI1qkvBcn5bpW5IA2aQdqjNQwxlcH6ZPGoLx2yB7JBTvDuw58c2b9ICtG
	MxTzS7HahGt+BqsfrVUT5BQcMQi5W3N/K5MbixuxIWhdO3vMgRwOdF+cpOoNGlPq2D0tbkf7WJ2
	9gGI+rs4oISS0RywqgzpjXTSzEAMfVTfL/izbDFgLnuHF3F1frZiNuXy/XDhYUxBn4Zn7oXKOqN
	AQJaoNRrrL1LRkK7+nubFk9FckThxaVyjPJL2SSCHPqOF+rdtqZ7cSjlL4x4z2K/dElD1l7HSmz
	5LDphfwyECwd/KXsJVaoSENSuuojqMwCiKxolDwkCAzs7i7Yvi4OJuoee8r4FON6L92V89YmT6U
	Sb5oc6+6MPRxIW9u8RgickvNdyBksc9r1AbYrSn0F8cd5SpGbqnGR3nK199PCzXG85ZslTw9imh
	LoNYy+alTs/qfXDzpS8CfJn6ndMydzNd7+WOgrkzzyqqfsB3uP5vBkz/rz7y2sd9P3jg==
X-Received: by 2002:a05:690c:dd3:b0:812:c9fa:9910 with SMTP id 00721157ae682-81383427303mr29911927b3.29.1782942760965;
        Wed, 01 Jul 2026 14:52:40 -0700 (PDT)
Received: from gmail.com (172.235.85.34.bc.googleusercontent.com. [34.85.235.172])
        by smtp.gmail.com with ESMTPSA id 00721157ae682-81448218f8dsm5218477b3.15.2026.07.01.14.52.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 01 Jul 2026 14:52:40 -0700 (PDT)
Date: Wed, 01 Jul 2026 17:52:40 -0400
From: Willem de Bruijn <willemdebruijn.kernel@gmail.com>
To: Breno Leitao <leitao@debian.org>, 
 "David S. Miller" <davem@davemloft.net>, 
 Eric Dumazet <edumazet@google.com>, 
 Jakub Kicinski <kuba@kernel.org>, 
 Paolo Abeni <pabeni@redhat.com>, 
 Simon Horman <horms@kernel.org>, 
 Willem de Bruijn <willemdebruijn.kernel@gmail.com>, 
 Shuah Khan <shuah@kernel.org>, 
 sdf.kernel@gmail.com
Cc: netdev@vger.kernel.org, 
 linux-kernel@vger.kernel.org, 
 linux-kselftest@vger.kernel.org, 
 Breno Leitao <leitao@debian.org>, 
 kernel-team@meta.com
Message-ID: <willemdebruijn.kernel.dd8394aa10b7@gmail.com>
In-Reply-To: <20260630-getsockopt_phase2-v2-3-193335f3d4d1@debian.org>
References: <20260630-getsockopt_phase2-v2-0-193335f3d4d1@debian.org>
 <20260630-getsockopt_phase2-v2-3-193335f3d4d1@debian.org>
Subject: Re: [PATCH net-next v2 3/4] ipv4: raw: convert do_raw_getsockopt to
 sockopt_t
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
Content-Type: text/plain;
 charset=utf-8
Content-Transfer-Encoding: 7bit

Breno Leitao wrote:
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

Acked-by: Willem de Bruijn <willemb@google.com>
