Received: from mail-pg1-f180.google.com (mail-pg1-f180.google.com [209.85.215.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 53934315D3B
	for <linux-kselftest@vger.kernel.org>; Mon,  6 Apr 2026 14:55:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.180
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775487353; cv=none; b=Y8ux5jAKQflZ+RhN5KIHe4/yzLorIVjSPaK2IP+9TU/fo/ENSXoD1IpxQfT0AbjXKHXgtezUJ1JEStVXUlsz1XI5/bBayzTCgkOQMtiuCB6f4nzfLgPjdullAkKpAI1UEK0GvhwgD5+7+qYRgZBHjr9qsHmSzDlZaWWeetBJsCM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775487353; c=relaxed/simple;
	bh=aGSrexrnXCm1FNc1OAp6YvvAIl1RtimWhDTpstk2OGk=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Tb9IIls+9gLRwV+FhMSYsxF06XXc6ELtYWKsH23TTiMEYSic79Naj8JdccOHjPCp7cHuFyfOcGJWjcmuTwyzYBi6gcjo7o7TFaszsxKXREnjgA+l6ww4v0Sbf2hvs8pIgeaBf0ToqRqEHgaCwZSB8/QhX9gljvdqMVjWNsFt6js=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Y5aibJvo; arc=none smtp.client-ip=209.85.215.180
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Y5aibJvo"
Received: by mail-pg1-f180.google.com with SMTP id 41be03b00d2f7-b6ce6d1d3dcso1361894a12.3
        for <linux-kselftest@vger.kernel.org>; Mon, 06 Apr 2026 07:55:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1775487352; x=1776092152; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=eoQfLFyrOhghKg6a7mdY4wVOPU9MO1lbVxnOVJ4i8oU=;
        b=Y5aibJvoxVoOhoJ0vHHUKi0ikFBUbvRjiQKD48LsPmi0n41MjXjcGWKx2gGnsqK4UF
         DPzYFJMN5MnO80wrRbXsKIwifqNmNuHUZmwrYSqXR9fVZOVgJpXvGIcBneq8Fchjrlqp
         ybWrh+Zn7kppFuAHuMwZegVvg20ehqeW8d3s30aC0dT1sW1GQBmmvVbPR+qXFZR59nyG
         SDL89NlVb5345AZh3FQE0EsW5PPEtEuV/FymD7rb/G+BKG4FBN54daXbsdf0DzA1w3Xx
         pcLoOcklAQMlzTeHA0MjOlvqCZLLuRozmZshjcVBRfDcsbAVpUCkq4Wd3TTLDKBs3Sa3
         O/aQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775487352; x=1776092152;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=eoQfLFyrOhghKg6a7mdY4wVOPU9MO1lbVxnOVJ4i8oU=;
        b=BbJ7UQ5DqdV7UMwga8gInmx8hUk8ogORElAe80PB5EMn/HN/1yJepsigT0PJeAeWEk
         dIlBZiHRD0cS0jg712UpEHStYVeW49XzvKlCnS9I1VMnFZlpUUqjBI5CtJPMcEMtReOo
         KifSeFjfy6K3dfHD0d3cgPIwslHSCOo0xuKlAx41TbwxBJoOPkDiV290qsBHGfJIlpRW
         gA+hldWOnmjCMOvdV2m7lg/DRQGsUCssnqNiWDspBOa1udwVhDTyJkeMKZ+ZCg0MmNE8
         d066C+1FVCf2y1lDEiEPDd7jQgEty+aCh5QSc96PG2obwEtTSu4GZ2cMgII/DoML+N/f
         EpJw==
X-Forwarded-Encrypted: i=1; AJvYcCUV2mthkx7V6fg0mTsV1uWNC1we1YI0xAXkqyaBzAQIVvoEC3ajwU/ea5BNy1yvGRiKoF1ijw43uIHwKJTqjt4=@vger.kernel.org
X-Gm-Message-State: AOJu0YzssHYBQBz0VA0lAnNWnqEt3uooDKhI/S1YbWMw6PwMbt/wbuo2
	+wQoi12LtobpTjLb300OCjSN6ncsCmmRxrpaHfuh0gPFADe5WzftOn4=
X-Gm-Gg: AeBDietJgQXOaKx5/wB/w3eD2JzxITopkPsP7l2Yuar+q8/+u3/Pq73rdlRzpTcnGUc
	kUXOh8oidq84mDmIetI2herOQY+dfBfGoKxvDeXXQwVbgwWS6KCzfuc51wZ79u7S/x4ndjN85rx
	oycl+BgWRYYf0oid11nKewUeAJfjHJQeyrzDhansJi1YUkmM0JbvAwi3ZZP5fzIkGLAkcv4GMdU
	O0ii2LoaFqdBMxjwSKTNAJ2J7O6/JvNbO5Ei2k+dDPtFvJDpOJ5xYxpl1/TzY1wTTnie5QPdfho
	2pUc6fGTDFgGFhEdhZ9R7qvYuK23CXUoFP1uWRNmMKUzG/3dLd3i9FaaQ+eZW+8zzPwqqZbYby+
	0znu9uZMhf6e99RayjH+P8BhsLBS1/ipZgasVkXNj5S80qGHX5dypKn/B5D4GPvw/UF1vys364B
	kkKdNLxgY7Moxi3agtx1dnWF1aH7UQJ6pnu6WMCgiqWG+0q0p0EOdUiGUGDbcOXaAd5vgTO273S
	KslZsoWu+ployHHbA==
X-Received: by 2002:a17:903:1ae6:b0:2ae:4a4e:1e25 with SMTP id d9443c01a7336-2b28183595amr138943555ad.25.1775487351544;
        Mon, 06 Apr 2026 07:55:51 -0700 (PDT)
Received: from localhost (c-76-102-12-149.hsd1.ca.comcast.net. [76.102.12.149])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2b2745c480dsm187051655ad.0.2026.04.06.07.55.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 06 Apr 2026 07:55:51 -0700 (PDT)
Date: Mon, 6 Apr 2026 07:55:50 -0700
From: Stanislav Fomichev <stfomichev@gmail.com>
To: Jakub Kicinski <kuba@kernel.org>
Cc: davem@davemloft.net, netdev@vger.kernel.org, edumazet@google.com,
	pabeni@redhat.com, andrew+netdev@lunn.ch, horms@kernel.org,
	leitao@debian.org, shuah@kernel.org, hawk@kernel.org,
	john.fastabend@gmail.com, sdf@fomichev.me,
	linux-kselftest@vger.kernel.org
Subject: Re: [PATCH net-next] selftests: drv-net: adjust to socat changes
Message-ID: <adPJTsDhi6ZNyUUw@mini-arch>
References: <20260404230103.2719103-1-kuba@kernel.org>
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20260404230103.2719103-1-kuba@kernel.org>

On 04/04, Jakub Kicinski wrote:
> socat v1.8.1.0 now defaults to shut-null, it sends an extra
> 0-length UDP packet when sender disconnects. This breaks
> our tests which expect the exact packet sequence.
> 
> Add shut-none which was the old default where necessary.
> 
> Signed-off-by: Jakub Kicinski <kuba@kernel.org>
> ---
> CC: leitao@debian.org
> CC: shuah@kernel.org
> CC: hawk@kernel.org
> CC: john.fastabend@gmail.com
> CC: sdf@fomichev.me
> CC: linux-kselftest@vger.kernel.org

Acked-by: Stanislav Fomichev <sdf@fomichev.me>
