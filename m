Received: from mail-yx1-f41.google.com (mail-yx1-f41.google.com [74.125.224.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7C87D3BBFC4
	for <linux-kselftest@vger.kernel.org>; Wed,  1 Jul 2026 21:55:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.224.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782942935; cv=none; b=H6lvpibRizoGJpcibi/U4UEbqLi4pgEE2UKtsGyHYiEcUcGASBrRCoh+EpUka92StQFHjUBBZ2m93HltDVvUI/SX/RgEkO/M2KF2rj0xGlHU6MyAsuP1WRE/aNcpmwocuK/ZlpQKiAU9gSNSPD12fjCR+R2xbHt+hWhCaoGyHW8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782942935; c=relaxed/simple;
	bh=c1GDdq3quHyTY8zCZnTyRm9TRMaTJSeQbkdL9Se68SA=;
	h=Date:From:To:Cc:Message-ID:In-Reply-To:References:Subject:
	 Mime-Version:Content-Type; b=B3lniYuXQwGWrCb0h04rAYa4Nr2wK7rWcL4kMje+Ym9gjqBoL7NNQ/5jOOlef1jaJCMR5O5UJUeFrPx24E8G9P9TA+JKhHrYR3E6frKUSkqu/cHLSdM4CYio99arkDcN90NUVlKBcs3YTZeCkfsRQH7OidFmPJD92tP7QPFVGF0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=bNAIh/wJ; arc=none smtp.client-ip=74.125.224.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="bNAIh/wJ"
Received: by mail-yx1-f41.google.com with SMTP id 956f58d0204a3-664d78637f8so1540565d50.3
        for <linux-kselftest@vger.kernel.org>; Wed, 01 Jul 2026 14:55:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1782942934; x=1783547734; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:subject:references
         :in-reply-to:message-id:cc:to:from:date:from:to:cc:subject:date
         :message-id:reply-to;
        bh=vkZmqTv3KeZXc25LYl9MzDOS+9fgYgJm6HBDG+664lA=;
        b=bNAIh/wJaCJjB0LYZuaamhFA2KcsKQQ1Uel5n8Ha7GcNmoAQegWHaLFqmjmXCf0BOd
         0GU0HiX0rYm9bBCNb5G7VsEP0XdytDyQOYnvdzueocF1uA0VeisREVXmaVILVTwEfSFG
         0Zr+qzAoRod6gDlV6Zo142ktRZ40fSc7OVDfnt//qSn2Ipn3mb5inlvagNZXoMi4FmZP
         ng/3AAJE9Ih84Cwub7y3dCR30uiJf5Z9iCCxRF0r/GFfrn8uViCNE6dHnYqCKrfaFWqG
         tfSRw0vBuXhEAtMa2DHDj6WDkiO+1T80f58fkc8xHmS98dR/vPJQEHVVq/fZ8tG1pM/K
         LRKA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782942934; x=1783547734;
        h=content-transfer-encoding:mime-version:subject:references
         :in-reply-to:message-id:cc:to:from:date:x-gm-gg:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=vkZmqTv3KeZXc25LYl9MzDOS+9fgYgJm6HBDG+664lA=;
        b=ScKbKHP/vAg5kO0PiKK1WSOqQBHESQLn0ad4xoDgf46lpcKSdYgkU4gApauJSYJOIK
         L8U2Y1QCEVutwTZ8GJnLtbP9d+p/PZcd0/hIRAlNls6jB65xc9Y3d6t0vV+oeKPJRbr0
         oouAvcu5a5aJyH8mkwNpnfTAOpX/2qNNv7uvhCDvspTtcuvSP3h/WPkp7JAjbcDSlT8F
         JLfagN9X8xVYgX5tQsmke5QQBldjdVqEq10ZCrVr9nAr9RIk45+o6+50KzPE9K7c8YiD
         lxxfTTXLfM7RmcOxlu/BU8y6sNzgVCUURs6bIfId0Gb74bUDWoI25OtlJzPE2BuyXFTb
         F6TQ==
X-Forwarded-Encrypted: i=1; AHgh+RrHwrHvUghmFQ/JcvB6kaIvId9Qco9idF/vepEEbusdXn38bt8jngsPP4hoyxIaI1KCbzBOxhppGVYY/R1L6Uo=@vger.kernel.org
X-Gm-Message-State: AOJu0YwzpD+KriTs3tC8805cvZdFM22a0POWC8hoODfMjzKw0qmgGWRP
	pMhAowybq/tzjeGPU+VPaLltVv+MP6H7mM3KGlc/BC6wxr/axnh/bEzJ
X-Gm-Gg: AfdE7cmiwHg6EglDPTG4MfGC/VV2+n+eipi76Ws2tRFkhWPABszC4j/Zml1IYxDFbbn
	TQtfzAbLh/inUQyO0eNYlQGg+xWpsufqT//ncsDyUWY4QCk4QAIPC2KIHFitXzvR5R6v9G4v76a
	WaeSHL5XjIYXHblIN9nrWLE7R7xl/xeGzBsERl/mMur2AzhHw7B7LqudZgvyZVTXQ1nkvozYYYk
	cDlqPGfIcSOu06eEy1s1vwoXwk6M1sLDoD1QdzjoNH1NQDpX1AZQbxdMOOptTOzgBpn7Ki6RQOh
	lCBLBYPjcn+5Qo85XtWix4sySTBWrHtsoels/QfVS6cySVqcP8YFSbBnc6nJrmRKNWNivoKMD7A
	DJmqopRV8VTjzUPH8ClyXHjg91AILfQkPqeqXseW6A8OtUfyD8nIrxGT8eZ1rAwsaZ5HhcWqrkG
	VKq8oS2VXtAZTETOxCDhr8GWLQwLRh/h4UyUmikKfFPYyX4BIjBSmyA1qbzTq/rm8XGi4/K5ZMx
	F0k
X-Received: by 2002:a05:690e:4004:b0:663:593b:e30d with SMTP id 956f58d0204a3-66521b04946mr3485910d50.34.1782942933438;
        Wed, 01 Jul 2026 14:55:33 -0700 (PDT)
Received: from gmail.com (172.235.85.34.bc.googleusercontent.com. [34.85.235.172])
        by smtp.gmail.com with ESMTPSA id 956f58d0204a3-66624023d0bsm262809d50.10.2026.07.01.14.55.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 01 Jul 2026 14:55:32 -0700 (PDT)
Date: Wed, 01 Jul 2026 17:55:32 -0400
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
Message-ID: <willemdebruijn.kernel.1dfa2d4f930d6@gmail.com>
In-Reply-To: <20260630-getsockopt_phase2-v2-4-193335f3d4d1@debian.org>
References: <20260630-getsockopt_phase2-v2-0-193335f3d4d1@debian.org>
 <20260630-getsockopt_phase2-v2-4-193335f3d4d1@debian.org>
Subject: Re: [PATCH net-next v2 4/4] selftests: net: getsockopt_iter: add raw
 ICMP_FILTER coverage
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
> Exercise the raw getsockopt path now backed by sockopt_t. ICMP_FILTER
> returns a fixed-size struct and, unlike the int/u64 options already
> covered, clamps the length down to the user buffer on a short read
> instead of failing, so check that semantic explicitly along with the
> exact and oversized cases, the -EOPNOTSUPP path on a non-ICMP raw
> socket, and an unknown optname.
> 
> Signed-off-by: Breno Leitao <leitao@debian.org>

Reviewed-by: Willem de Bruijn <willemb@google.com>

> +TEST_F(raw, icmpfilter_oversize_clamped)
> +{
> +	char buf[16] = {};

Not a reason to respin, but instead of a raw constant, something like
sizeof(struct icmp_filter) + 1 is more robust and descriptive.
