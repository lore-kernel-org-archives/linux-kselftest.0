Received: from mail-qk1-f177.google.com (mail-qk1-f177.google.com [209.85.222.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DB698370D5A
	for <linux-kselftest@vger.kernel.org>; Tue, 21 Jul 2026 01:48:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.177
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784598482; cv=none; b=bTaDAFOVxNrU3TBISfjQdTENVl5E3ToMQtBDpIHmUD6zy2GCQNhdXWDG5P0K1OapfNMLgxbQNYxLwpzR4hnyODc6xuX3IHK0V6CbLdPFSpNMeA0UxNcAj8W6fhhKzEKgc5RsOArQ+zqgoJ+FYd5tVLZ0IVXzq9mJg/tFUUGNOC4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784598482; c=relaxed/simple;
	bh=dTVNk9f+ebsUE3FMkNKiqFCHr7hKIHI14NzUNt0oRP8=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=rfdVw2eRjKLtySKbLoXem+bnxIGepRA6w/pSFMFUu4Ow0EthcZaXrKl7DwakkRmDFJCSK6CSwj+MCsPxEgR/lsJrzag+IwUY/5m2Z/IEdolLFYPNxmelWfS30m/l0I+0RTps1sFLZi0uZiw469URaJIxYOBwfE5vHubQ/nBI9uU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=dYMqiPoI; arc=none smtp.client-ip=209.85.222.177
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="dYMqiPoI"
Received: by mail-qk1-f177.google.com with SMTP id af79cd13be357-92e5cb052edso584749385a.2
        for <linux-kselftest@vger.kernel.org>; Mon, 20 Jul 2026 18:48:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1784598480; x=1785203280; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=dTVNk9f+ebsUE3FMkNKiqFCHr7hKIHI14NzUNt0oRP8=;
        b=dYMqiPoIM12TTfM5LjzoQQZdRdlNqec8FwZaIujINebLnfzQUpWARroF1jVQFO4ObB
         MOZ/TrbFH0TdwqupHq5EHCzB1Mej/NzD0hwkQHM8ohDNtpj7WMotQUG/dEC5RiHvvHfY
         qgeu4SjTTNCo/LyDzWKYUxoTYxHQavSP+QDcjq5f7HH4ku+7almKscMS8qgZ65ysUE8l
         voVghql5mmpZ3bPj9FQhPsZ/JFlEYsaOsxu4pd8OxtOsrkMCXl30W+a4pJym+5Sf8cHk
         M0ibLg8JPFVu4KVETyagLtm59JPAe6GL+5gUMXCl+9iAb8SJh1hIb0Bi8AvxT6emsuyw
         IIcw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784598480; x=1785203280;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=dTVNk9f+ebsUE3FMkNKiqFCHr7hKIHI14NzUNt0oRP8=;
        b=sDl4KSVMWwZTP+aWv1GKsbcSGWLZg0yHnWqgKoV/iTdmeUaVgkFDQR2t5k2iyW8mmZ
         QV1pO/yfl/A9ByxRs02v8+0M/15luA/vYNOX2AYhtlDTHxZLQZiHF+mQ1Bskr0xj/B6L
         Nc0ylsVlnXpMFhz+FK3NT+spZLS/1OgY8lpSmDZV2i0pnOMdX7U/paO7rtsyuljavTvM
         QPKj5lvlryF1r+OjhoBgzoqMNNWVQF6erzEISQ6kg6Q6ysuRnElyjVhhLhGJP9aCufBh
         1hGNB2MmgrwDE7c47KZvn2+9c44YuAkW7e9IzfF/GXKiVZxpUvie07tGdDpxN3CaCdd0
         0gnw==
X-Forwarded-Encrypted: i=1; AHgh+RrP9jxiDXr2K9kvuj/H0YI0HoEc1X4fftCBntmj49/v5B8121SR7VRcbfSOCT0VeqGYNKFiLOJ4AjItnSEIGTA=@vger.kernel.org
X-Gm-Message-State: AOJu0YybOSbvPVwfG1rM7rbSQl0srQVgo7cFKulQogA0vuq5YJZ7aNll
	+AnDmPgKzS+d79HEDKU0JGPP/Mz5EpWosQ0EgtjEjVdQTeb0LkAj2gZB0SDz4Y+0iOc=
X-Gm-Gg: AfdE7cmGCKf7SaLfFfh94g75aKzwvZF/pW7V74+Qj1l1U1v6+26nI5GaJfuzIbEsq+q
	TtHQ7edEEjg/Ox3JHrtj9IZvit52vRjyBSmRrASBUj0wGFpfE8CIU5z/IY5kE4LIDBlzfXVmpw5
	ECxgbEMHgCrP3WZwaj8e8QI6w17HwLiiwmGv9UXj4RBX7lxuYOFOz1bzJ2wAuFEsB3Vsxtb010N
	ZTYJcxOGzb53dYqeTuFYQLgbNKVxYWEz0jMnlL1Ba69lLsyBmBv/kbn+RyT3pbxQTBU+GwC+Zsw
	7SiHPFz0HmVzwAdqcxyIGjMvVlEiTBPVBw3pIciXy/LLeloXEfLd+jWwur5muj8TRJWeSySjcmY
	aid+UY8c59KZUVUULDVVWUNNFL7mro6mAycERthU/Q6RCqTa/sLjyy/QFQ8zytRRIQ1Y/wQQf4o
	wTspKIymTwW1UXUQKGo6QnisyPRvlWtilNKsdhsn8eag6a/u92dcoCzOynvD0Vi0KjI83/rjloU
	yhG5h5tGWheevrR//dnxNWLN0I=
X-Received: by 2002:a05:620a:224b:20b0:930:bd54:c073 with SMTP id af79cd13be357-930bd54c18dmr1012046885a.3.1784598479797;
        Mon, 20 Jul 2026 18:47:59 -0700 (PDT)
Received: from ip-172-31-15-253.ec2.internal (ec2-13-222-20-6.compute-1.amazonaws.com. [13.222.20.6])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-930b545e47bsm1016668785a.35.2026.07.20.18.47.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 20 Jul 2026 18:47:59 -0700 (PDT)
From: Deep Shah <deepshah146@gmail.com>
To: Simon Horman <horms@kernel.org>
Cc: netdev@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-kselftest@vger.kernel.org,
	Richard Cochran <richardcochran@gmail.com>,
	Jakub Kicinski <kuba@kernel.org>,
	Paolo Abeni <pabeni@redhat.com>,
	Vadim Fedorenko <vadim.fedorenko@linux.dev>
Subject: Re: [PATCH net 2/2] selftests: ptp: add a regression test for the frequency adjustment overflow
Date: Tue, 21 Jul 2026 01:47:58 +0000
Message-ID: <20260721014758.2235-1-deepshah146@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260720112842.106914-1-horms@kernel.org>
References: <20260720112842.106914-1-horms@kernel.org>
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Thanks Simon. v2 addresses all four points:
https://lore.kernel.org/netdev/20260721014256.1876-1-deepshah146@gmail.com/
