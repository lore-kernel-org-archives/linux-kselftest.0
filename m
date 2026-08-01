Received: from mail-qk1-f178.google.com (mail-qk1-f178.google.com [209.85.222.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A3B5821ABD7
	for <linux-kselftest@vger.kernel.org>; Sat,  1 Aug 2026 22:33:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.178
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785623617; cv=none; b=PK16ISqzBQWaKjvrCyDqdbvyQ0DeLPKCmx//PXkL49bC3NDh+53NRI8mHfsPiF/OhLsRf4XswxfLNuWKHB0783pmmSB/l+dQQl2R9a+5O0/qvhsYc4l5VsJ1FSeIVRWOrAv5ip4E/WqQQaXzsyiT8OQwMOhJKgqto8YWCg0HhEI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785623617; c=relaxed/simple;
	bh=G+LtcF0822ze7+hUeyMKJ83zwbyDrPlfTSSC5mxVrV0=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=bFKiUNjIQkCjBzhKbKOM/ec8niOsJPZcYU2i7imr/Ew5RjMqtw04RXZbdTGQ9gVKmyrQ3VNR5lIyBaexhmPz7wGZQYR0oghx4RHTvQ1sodkhd0IXGTooW2PHeK44W9P7f+iULX93L3056zH8BPFeJMQIaJCYlhFADQezIubZ+68=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=SXLIJimm; arc=none smtp.client-ip=209.85.222.178
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="SXLIJimm"
Received: by mail-qk1-f178.google.com with SMTP id af79cd13be357-92e6a434cabso101232585a.1
        for <linux-kselftest@vger.kernel.org>; Sat, 01 Aug 2026 15:33:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1785623615; x=1786228415; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=G+LtcF0822ze7+hUeyMKJ83zwbyDrPlfTSSC5mxVrV0=;
        b=SXLIJimmGeDWS2ucnK2l+6D+UPt2Y+AXy4hHJCtvJi5qS4fh9RBmON4R0UikOYfmeb
         XpRPkHhccd15dUXK96QgjPWHpDsM+RAboPSwFqeKt2bDLdSaRIWrjo9QFDUr0vGM4gmM
         N0fJTOPY+UMaoibWy+fdJIaLd0J6a0a+lc04n/yX9E9cMD0vBfyashpy/7M8WPQNsgjf
         XkaDCIXXhYYbsB0v5cDL2R/u3/d7W5FdHKym3PpRy8X+UMH4rMG/ymhQrCTCiy45QqzL
         KZOPM8Qkv/g3deO0HI500GQNUasCHfb5XtrqADLh6N8tFb+V0DrI9KqQeoYB9APVCBzD
         3F8w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785623615; x=1786228415;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=G+LtcF0822ze7+hUeyMKJ83zwbyDrPlfTSSC5mxVrV0=;
        b=TVuI0fmiX/qlMKOhayL1HT6kgYrmeuim9V1nHf8MwkgSvw7SArlWC/FZ41ftjx2YPF
         M4EXFura9b+Adpd2mYOGAqN3RO7HmEtiTHYYYi1rZO6PdEm2y86fo7lTGIyiGeANz9Aa
         zqueI5WLrbsg36ytodw46ftdsbkUko5BmnyAIXrOQBy5xUSPE7GsWggsyicAIMuy2nA1
         5DJFqWTot4kYIgbG+CCE4yioNV42DY0NLckke7HZhWfyE4AFolz+huDnU60Oj48IOB6l
         kX+rXvO70aCgHfdIddXV3TrE/ylHk8ygA2yPL0SA2lCVFf6conOrprMsIzgdXf4Vetxe
         H8xA==
X-Forwarded-Encrypted: i=1; AHgh+RrRBjRX9ogGjGcfgKKLfsvzqTPwGYmhsmQRTGZj4Y+bpVeYejBdOsbASN8VdNCy12PhqrpK5P8W+0ijfG7rkHs=@vger.kernel.org
X-Gm-Message-State: AOJu0YxAHLOFkefUPpAEEagtIRH5vXZfDy3eRIAr3w0ajQwzm2CzxDOb
	mIn7mvBgN5r7YFpb199zq9gPct8/Ntbwj+1lR6l+Rp4t8HTp4qB0BHEW
X-Gm-Gg: AR+sD10f3FAcZ0JMMWHoBWfOc8QTu87feU41eQdymEHuAvBhv09ERvfAaP9a7csr7Kp
	KL83cqPEc3JC3sbS83KJoxwjc7qa/rvBehb4eeD/iEGjg0uUKTzRwfAR5nx8ed3I1KUztKWBE9f
	sVTMPp5o4qRW4TlGUBD1SoD6EyO0sFRHa3hzxgChKIDt/7O3+ki7YAcDeeAdgAkEjyD/DQgf00u
	WIPbqlhQS6eqq/N+o4XMUyyP2Yz3mQ0VdFBgv0keje8NPXGtIQHiIBUvXjSvvRPsXIIMRsvtgDL
	jKudRRLvERN65+TodziOwUqi/4ymIuSoXaSMwfDvIHrWM0nRd4c6YHCYtg//MioIuBJShvgS0Vf
	HEU+ikQAlQXWb3YH8v7FHz/fSEpHutwYNE2UF4PdKilvrTzNc/8ogs7hjxGt5wYZ1c1fedyJ9d/
	55inEKWYx6vG2ClmoRXKvBNHPHjpbcRQy7JP05F24HhHkaUjnazSNokv+jH2MUirhe47jPGVRVu
	zyqB223dbE1C1qrAZ74PHnLDekZt+K/xLW6/hbaVmu8eEdVRdRA2mYTOcRHg9xzbmP4ferq2V61
	Gg/0IvLDum6qqbQ=
X-Received: by 2002:a05:620a:19a9:b0:934:851b:f3a2 with SMTP id af79cd13be357-934a06dfd64mr1041044985a.8.1785623615584;
        Sat, 01 Aug 2026 15:33:35 -0700 (PDT)
Received: from ip-172-31-15-253.ec2.internal (ec2-32-195-55-166.compute-1.amazonaws.com. [32.195.55.166])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-9349c1e0e57sm348827985a.43.2026.08.01.15.33.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 01 Aug 2026 15:33:35 -0700 (PDT)
From: Deep Shah <deepshah146@gmail.com>
To: Simon Horman <horms@kernel.org>
Cc: netdev@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-kselftest@vger.kernel.org,
	Richard Cochran <richardcochran@gmail.com>,
	Jakub Kicinski <kuba@kernel.org>,
	Paolo Abeni <pabeni@redhat.com>,
	Vadim Fedorenko <vadim.fedorenko@linux.dev>
Subject: Re: [PATCH v2 net 2/2] selftests: ptp: add a regression test for the frequency adjustment overflow
Date: Sat,  1 Aug 2026 22:33:34 +0000
Message-ID: <20260801223334.39150-1-deepshah146@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260727112823.106914-1-horms@kernel.org>
References: <20260727112823.106914-1-horms@kernel.org>
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Thanks Simon. v3 drops the #if and casts to the type of tx.freq instead, so
the assignment still happens where tx.freq is 64-bit but long isn't.

I went with the cast rather than just dropping the #if, since dropping it on
its own would bring back the -Woverflow you flagged on v1.

I also ran the sashiko prompts over the series myself before sending. The
only other thing it turned up was the missing .gitignore entry for the test
binary, which v3 adds too.

https://lore.kernel.org/netdev/20260801222923.39017-1-deepshah146@gmail.com/
