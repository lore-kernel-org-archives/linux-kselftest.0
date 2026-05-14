Received: from mail-oa1-f49.google.com (mail-oa1-f49.google.com [209.85.160.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 21D193C4165
	for <linux-kselftest@vger.kernel.org>; Thu, 14 May 2026 14:13:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.160.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778767999; cv=none; b=cW/8T7JHMVx2habyjEHSyqIiW15dEYvyBVKPWfBXC7sndTpuGxgIPxagqef+1kKcKHWVqWZaCmwtuXkNrAHuCPZ7SdQHAfN4BOZp/0W74+0Auulx+Oy/oWHT7HxUNI2myTKnjNZxO2aKCrqPxt+en78zQ6X8+A0bxtUp9PZuXjo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778767999; c=relaxed/simple;
	bh=6+Vy77mlexUq69K/GifNbxsYh1MJdCUIjNEhN5F1vsY=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=aJDHZlyJ26AgaWboSR7y/I7miv/cBNa6ZfDi+0ySeq7yUle4u+m2BhFxo6AK96STb2SCyYOJ/M4oLBgQUIpCFNBoTeVtumuHk/c5Z35l6lHK8JW94zf5TBXgT19LpmSXdLQH31qQUG1cEZf5VpTDRuDpS2RIMnrG6P+16MEmC5w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=pUZwLJas; arc=none smtp.client-ip=209.85.160.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="pUZwLJas"
Received: by mail-oa1-f49.google.com with SMTP id 586e51a60fabf-40ef10ec84cso6323030fac.2
        for <linux-kselftest@vger.kernel.org>; Thu, 14 May 2026 07:13:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1778767997; x=1779372797; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=6+Vy77mlexUq69K/GifNbxsYh1MJdCUIjNEhN5F1vsY=;
        b=pUZwLJasNTJ1Tkg/kdJU4j57rcOJHBX4sZkY/MUdYttTZzy+8kaHashhWEnW0eYTHv
         j6RKrxTp2L1SgutrUke2Z+PDn9KmFmNLBBk83SwYbunnjOfvMWEV6Hn5GLYSib6EXEHX
         dTQ5uifKqHxzvKCtyjSt6Qj588UXeyNFJH/rSruoUTlhILFadLnIpGgXX3v4eiMlEAAb
         Gup2+0BeY0GkqNNHh5bzKoDechD7GPQk5Fh6I4FABchwPx1ewOEBQH/WEYuob6eZSfh4
         TjpZiGENiePqs5s/oT92KlLpMPhSG7eyLxpiKCMaD/tGhV6vNDGoVT0xzANk3CiWB/F4
         QD6w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778767997; x=1779372797;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=6+Vy77mlexUq69K/GifNbxsYh1MJdCUIjNEhN5F1vsY=;
        b=p964dG2KFaTqTxm3/q53gmUEFSJeVpVCRLm1pccf/LkYh7KnmeXPsrwRYm7WzCkeZ3
         VjUH/1KLCMSs7nLSfCYQPRL45yhlgfN/YIi8dNXWzwfgRqUlhb35Rfw4giJhNSZe2fQH
         Y6IgW9jM3UO0JrpOvLP3tnZqfOyT0O0I4Ooh9Oz7A3xDjgVoq9rCehNC8PyLt0pzF0ni
         V/6UHa0ZfTbnIBVqJ+KUG6s37b6UMUtbDFBNZDbYssD/gUjWSXNudNQX4r7ZVZMlfb9+
         G1w4Rgk/ZI8omZrPUlSfmO8RI+Pg5OG0V4Hx92ir32w9CBVIs2djK8YJYdBZOIYC29Ks
         hwHw==
X-Forwarded-Encrypted: i=1; AFNElJ98WmtUHQg8xGGgUUK/2+RKIYDnpu619WrjpngzpXNMptVUcjKiFfHP1d9+RVQGpYVf2miEfKV3t+KdnW3nKig=@vger.kernel.org
X-Gm-Message-State: AOJu0YzrMJMynsFFfJjbqk4vhOTnxBeZzG0gzva643tlLuxxlUtbyGnT
	EOeIgeURWylHikRKotzp0NSmAy6l/gWM+z4H/QwjlaAA0VCmkGzblzej
X-Gm-Gg: Acq92OH542JAJS+Nry/yq1vQgS7o05PnJ1Pixn6k5P7IlSKLSRtHkXhz7oQT5xJ16ud
	32zNOVz3R0u5yfSQDLZmAOZeisaE9b0695V9P4AR+2WVjuqJhxeqIhDtQWz4PNbhZPobzgjssWa
	BXiaOwb3MbGHQtr/Cmhracg7ZSUj4a0XkP+BbJF6sUK8nc/efmxu0rXSdvtAZnAW6HRVnPLAQV9
	VQpn1/ZiSiLGWMabtNF9a2zPwMG7a2BzjzaNDDFglDY7Zv7nGaes0Ds7I1GGhPPhAexPgTC1bOJ
	whyp4By2CZawEQHVtlVA12uVaZ+V48KIMVPAGd6rq0kTL0H2QI+fRkNV9jsDCWybC06v0aWO7nD
	gdDFUvMLk+LynyJ4hvxaF49szW5IyUtWQDXJnMMewgZA/tWX7Yj3ccU/pimKICS/25cYIgWxJGk
	+XI14LlCYDVGjgBJ8=
X-Received: by 2002:a05:6871:54d:b0:42f:7bbc:ce82 with SMTP id 586e51a60fabf-439d2ffc601mr4141250fac.26.1778767997001;
        Thu, 14 May 2026 07:13:17 -0700 (PDT)
Received: from houminxi ([72.244.37.221])
        by smtp.gmail.com with ESMTPSA id 586e51a60fabf-439fc4dcb89sm2018191fac.12.2026.05.14.07.13.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 14 May 2026 07:13:16 -0700 (PDT)
From: Minxi Hou <houminxi@gmail.com>
To: Aaron Conole <aconole@redhat.com>
Cc: Minxi Hou <houminxi@gmail.com>,
	netdev@vger.kernel.org,
	davem@davemloft.net,
	echaudro@redhat.com,
	edumazet@google.com,
	horms@kernel.org,
	i.maximets@ovn.org,
	kuba@kernel.org,
	pabeni@redhat.com,
	shuah@kernel.org,
	dev@openvswitch.org,
	i.maximets@redhat.com,
	linux-kselftest@vger.kernel.org,
	Eric Garver <eric@garver.life>
Subject: Re: [PATCH net-next] selftests: openvswitch: add dec_ttl action support and test
Date: Thu, 14 May 2026 22:12:59 +0800
Message-ID: <20260514141259.4042848-1-houminxi@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <f7tecjeqezk.fsf@redhat.com>
References: <20260514092747.3653656-1-houminxi@gmail.com> <f7tecjeqezk.fsf@redhat.com>
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Thanks Aaron. I missed the le_1() wrapper in odp-util.c. I was only
looking at the kernel netlink attributes and derived the format from
there, which doesn't have that layer.

Will update the selftest to use dec_ttl(le_1(...)) in v2.
