Received: from mail-oi1-f176.google.com (mail-oi1-f176.google.com [209.85.167.176])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3D6AD1F7569
	for <linux-kselftest@vger.kernel.org>; Sun, 25 Jan 2026 17:12:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.176
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769361132; cv=none; b=C63xVtSm54agBbHiAsYtQBhaShqcGQq5hGCeSsKsUhmJRVlYv3CmLhr4C2I5gCAgpGRGE/z4gRKuSFSMbJEaBhHY7yu3/cWoUvIUjS4i6UQWGEj/gJoasxcBBJg7OMZ2xhdHhlGiTzpuEd/ICPILnLO6Z6hCmS8u4pmjKKjnxGI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769361132; c=relaxed/simple;
	bh=/QEo7Wqu3iUNMjgPZIJZJSjNsND2rsdpxLPDFpvSVRw=;
	h=From:To:Cc:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=cn5P5Fh6ZXx44D6ykkxsawIlsljykUYg4o2Rsmt1j5qtcoURy8lX/bdovrfwk4c0H1Dw9HuWRS6DMK99Eh96MxrlvvTm9ufwoCh8ybWOMzpIJy2YCdsrDWAjzY723bTUAEAtAuj5Q6dtc8sCRfv7zA1+UvYgltzgOuycOR65AGo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=kernel.dk; spf=pass smtp.mailfrom=kernel.dk; dkim=pass (2048-bit key) header.d=kernel-dk.20230601.gappssmtp.com header.i=@kernel-dk.20230601.gappssmtp.com header.b=zG6h2k3P; arc=none smtp.client-ip=209.85.167.176
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=kernel.dk
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=kernel.dk
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel-dk.20230601.gappssmtp.com header.i=@kernel-dk.20230601.gappssmtp.com header.b="zG6h2k3P"
Received: by mail-oi1-f176.google.com with SMTP id 5614622812f47-45c8984fac8so904578b6e.3
        for <linux-kselftest@vger.kernel.org>; Sun, 25 Jan 2026 09:12:11 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kernel-dk.20230601.gappssmtp.com; s=20230601; t=1769361130; x=1769965930; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:date:message-id:subject
         :references:in-reply-to:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=HTG/UusmHhSRHax119uDW0R9FQMeUnyKXFiplnDVLQM=;
        b=zG6h2k3PO+hGnwhfxa2hw73QiE1wpIv6Um8AM3v4Taor85tnUAEVsn9ZLuUulwvflE
         1qOcmebdfsKb8MI2P9qZFBhK+hCiiY3YjdDa9+evPjWwLDYAeUjRRizNKh8B9+RRJjCR
         41SIJzK56YFbUDqJO4SDznjvJ97E5VW6X9wba5z09CDDo3XaGdq/wLs4TdHm4OF6zjOt
         rWghRbNl0c40W7If2uvBUbkMFrlxBhiQrHl2e/wqgTA8NHcXf/aoy+Wevb3KiVw4oqtB
         KXOCyzbquMB1yVi5sSKS64HZ6tUojm+SVof/1Z7Qkoe08VIsqfnuGc/8Jzv6A333+TEu
         zehA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1769361130; x=1769965930;
        h=content-transfer-encoding:mime-version:date:message-id:subject
         :references:in-reply-to:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=HTG/UusmHhSRHax119uDW0R9FQMeUnyKXFiplnDVLQM=;
        b=wcg9NXo40P5EvDedErkAfqj9nfOztDxYvzl9klALTNwLICbzYr41l0zlsruMQKE7DW
         N3SZDL/PaxBbZcztrAJUCXzyQFMf/LIqNTE+VpaT02qEzIyllv9AeJ5WPNAWAGCn99Se
         7xZ/XRqiS0vzn/BbeHRFW8YKuG1Xv4hMK6Zf5CcYIROCgiODTKWQY/X+zxbygOMV46mW
         Ym7dHdg7lEPbDF8GMEb70wuzD3yZuct+dkXMwl6OiDRzB3H6LRFKy1+2gUY4oTWkkMf3
         aJtOEscaFjswk4kS5Ar2pixDoNl2jiDDgXfgCUgwNXQcnWRJEh5Lwpibp9uayCGPzgLD
         bJVg==
X-Forwarded-Encrypted: i=1; AJvYcCVn5slQjxqptsWo2lKhD8b4nRIgzbPNxRM+MF2CRB9UpIWz3BxWI5WgiIHZeuMtvJIMUeM5MVUKZ8isFYZXIkQ=@vger.kernel.org
X-Gm-Message-State: AOJu0YwD8we520ytl78vOGWXWf4BuXGIiGq2rRMUVLXpgSpwanDVnmDp
	sglRsf6H2B8TKn8XcrPZeudmdiS8D2tsifxNZT5kszfA9CQXi3Axgh0RPCEkUOICq3Y=
X-Gm-Gg: AZuq6aJJHSGXSXmZFmswkLwJRDSD1xRIycLesUSrTt9mBHBBBrep/YZ5mBNZx6FLVar
	nrDzrpdHtnmG/8CHQlOBB3jlgwLi60Im8PGu5D3Zs+q60C0qsD0SrsjFiRh2CxOIm2QK/zQaZt0
	IbdsSL5O8pOQyqJ0M4ncfYtlPMUxN629AiwOW7YiQ5SgGWPSzJEiSulyGlOTAOdKzj0QkQmMvfO
	mAO+UVjaUAqytKwcsjRg26PJX+mOyaaumEXOJb0/YVxr61lYvdGexZJPRtWSvf5VWLbBGscwt41
	RB8T9t8dDcmFBK28t4ZrAb3bc2stsEkajmP/uvqOp7TY3ew3Yj3lGfzVLWbnHha8btqLqGGYDa0
	vX53PFWzUKShf70lJ9A97UablJAptav8kkrfJHQjs3B5csaDOyMIuQ2xfQ80yQc3vGShj/pHCdq
	unWDJ2LwKIBiLpZzDga/6BSwwkGSDnP4usmSZuzcL3wnYUSgimbbkXmDALhkVGjLtR
X-Received: by 2002:a05:6820:4a8e:b0:65d:163:3e5 with SMTP id 006d021491bc7-662e04616a9mr616403eaf.47.1769361130058;
        Sun, 25 Jan 2026 09:12:10 -0800 (PST)
Received: from [127.0.0.1] ([198.8.77.157])
        by smtp.gmail.com with ESMTPSA id 586e51a60fabf-408afc0a17bsm5629457fac.19.2026.01.25.09.12.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 25 Jan 2026 09:12:09 -0800 (PST)
From: Jens Axboe <axboe@kernel.dk>
To: Ming Lei <ming.lei@redhat.com>, Shuah Khan <shuah@kernel.org>, 
 Caleb Sander Mateos <csander@purestorage.com>, 
 Alexander Atanasov <alex@zazolabs.com>
Cc: linux-block@vger.kernel.org, linux-kselftest@vger.kernel.org, 
 linux-kernel@vger.kernel.org
In-Reply-To: <20260125085747.1631424-1-alex@zazolabs.com>
References: <20260125085747.1631424-1-alex@zazolabs.com>
Subject: Re: [PATCH v2] selftests: ublk: add missing gitignore for
 metadata_size binary
Message-Id: <176936112869.8973.14050161093900489800.b4-ty@kernel.dk>
Date: Sun, 25 Jan 2026 10:12:08 -0700
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.14.3


On Sun, 25 Jan 2026 08:57:46 +0000, Alexander Atanasov wrote:
> A new utility metadata_size was added in
> commit 261b67f4e347 ("selftests: ublk: add utility to get block device metadata size")
> but it was not added to .gitignore. Fix that by adding it there.
> 
> While at it sort all entries alphabetically and add a SPDX license header.
> 
> 
> [...]

Applied, thanks!

[1/1] selftests: ublk: add missing gitignore for metadata_size binary
      commit: 8e5bcc3a955a2cc4460b391f55d3b49905eb248e

Best regards,
-- 
Jens Axboe



