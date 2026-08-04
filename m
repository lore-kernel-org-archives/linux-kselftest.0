Received: from mail-oi1-f170.google.com (mail-oi1-f170.google.com [209.85.167.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 34B07386422
	for <linux-kselftest@vger.kernel.org>; Tue,  4 Aug 2026 02:40:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.170
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785811222; cv=none; b=QozLD8EVVLpysy10VGnCL/RL6C5jqVqWFxvnkdI9Rr6xnp4t6KVD0r1cZw5Q4Xgjym2648GguW8UOm+OXfhK0+dzbSCsgZI5cOwqjwWz/kb2F0WTx2oEXm7jx2pHIVvkYp/Nah6zuLo3cACh2Rpk/44HcJdn3g8s6GDyQpiwUjw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785811222; c=relaxed/simple;
	bh=1HSgYboTRu6H27orjBsE1aFDVcS9z4TV/7JMPiRGVTA=;
	h=From:To:Cc:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=a3YEfKvkt41H7ur3y5l/G6M2f54BN/UvRav2Mh0ZLyhLfSzDG/YzzYOr0eC6TuIF8wmhZYi7GiXgcB6hwKT++7KaFJtWs1665r1illmcdpVh/v0I+z19p+2aF1DJp6R/wZtkKtAijS8NILw4256OAcjZkE7+cl1Yb7XYRfkDkDE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=kernel.dk; spf=pass smtp.mailfrom=kernel.dk; dkim=pass (2048-bit key) header.d=kernel-dk.20251104.gappssmtp.com header.i=@kernel-dk.20251104.gappssmtp.com header.b=CsKqCerK; arc=none smtp.client-ip=209.85.167.170
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=kernel.dk
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=kernel.dk
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel-dk.20251104.gappssmtp.com header.i=@kernel-dk.20251104.gappssmtp.com header.b="CsKqCerK"
Received: by mail-oi1-f170.google.com with SMTP id 5614622812f47-4af7283bf83so788347b6e.3
        for <linux-kselftest@vger.kernel.org>; Mon, 03 Aug 2026 19:40:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kernel-dk.20251104.gappssmtp.com; s=20251104; t=1785811220; x=1786416020; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:date:message-id
         :subject:references:in-reply-to:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=io4WL+YWrlpsFuzWq71yS+mK/D8qrSsnCYuW1KxwtOM=;
        b=CsKqCerKv8JDarWVh6JbnCzyEXb+3Lclfut+x3qZ06usSW8TnGRiB7L0ZOJD596TkX
         u2NREuPTy5z9BxyANdnUwKFsE3DnZof7KG/xAJvIOlPVvNM2VrqHoAiIOYpc6An/ZLqC
         0DnO+Knpejjlw0Dhz4zUTZGRLtkjNzOw4/fCEjepGk+NW4l3bENYRXPUhmrZljwjr91z
         JMmLB6ahml7X0FaAkZni6p5k1k+DL+qSJLvDizqlryDeO+vwSNycsty55oOQ1IyTZ2fN
         wOGScyW2cdb7TSCmKdZqGQQNAQJyaiZR/lo/HG3BvX0aU87ovQFqC++CTUOb0/yvNbqW
         6U/g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785811220; x=1786416020;
        h=content-transfer-encoding:content-type:mime-version:date:message-id
         :subject:references:in-reply-to:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=io4WL+YWrlpsFuzWq71yS+mK/D8qrSsnCYuW1KxwtOM=;
        b=VVaJoRBwmuu5hfDoeaXGgUtijpKZQ/mXw79hA7+zbHHEnaVYfvJ1G6jhvHHl8nNqGP
         GsXbc/mr4g+OOnVku1F1n8jc2E1CrFDUMfWdnGPeqXQsJXfnSa7lkVHGhNHRAx+yVphN
         YD2B86ANZ/gU+cuWK0wfDb0x4pqBjdiCcIdwQlwYeJToNzH2p0rgflA+Un5/qdGZKykK
         mYCOGTxrSTtg9pmz9E0dfJzTKTnx9muC/6e26yoyk67vkdJaySwnt5L99eq0Ru6oCRD3
         O5WrAR3qbfmvXKS1M+Z6Nm0uPYGWMNJWWKK9MABnzLE6yOqKvbXm0XtohvrUqgmrNe0D
         ms2A==
X-Forwarded-Encrypted: i=1; AHgh+RokkD/XnupPSKLIYaxErgh7foBroIPFtluH1Y5heI8cP82ZpuEuh4zsYkLFNiUTo1W6ohfH6lcZL/wY5aePddw=@vger.kernel.org
X-Gm-Message-State: AOJu0YyMH+nugEffTaxMWxbT84gfsQehutQ6gfV5Cuw7QKZ65YBc5Tq2
	tTDhs/sYQFSmZL8VX8ePHDrNUtoscYrhKHyROjh9n023P8yb9JoXcCb4nmXioKBu78w=
X-Gm-Gg: AR+sD10uNnTdSjlxrVc4ortUSl6l/iy9LY4+ZPft7wYXlqE+5uMdACeAAy7JB4CaqeF
	1w2efjrzsGUOLDEJInj8UT5xo7wpeTYe4XIUGAcDmtTPJ3vQg34Xwdjg8Er484FDQtxFTFV3imu
	r6W21kFsf/Oc/73R2jOar4dEohfqJwdinsf02Y+bNrCRtVlLXTgItayV4v7LW5mjVOcU++QL+ac
	/QoxCsRftrdL4hHIi+LA7pXfFCPt1sQJfosTRiS3v/kbLrifV4N/+JXLQ3D6AC95KFOSdmtKod2
	P0OxiK2EhTd6CV1sd4FRPwBoyTQ/19CTYGKOgooXOoVzdRtp6tUzuHT3nPqyuTIziktCUDJ1ujw
	ZurGKVXAAV56LO1Gb5LK+Jg4MaICd61Gf5uduEig+HHSwygAFyiJEqG/mYKRzVwg45suWopl2Pm
	H4v3p5IR0FUoKSBizu25KRfRVKrNke46sa3ZFBKx9IMj9pieCCgZGllbpTUOgCA+FuEdb+6M6gW
	vVALm7eOprg+JZo8nuoGHPyYOvQn+2fGuF/iBn1xw==
X-Received: by 2002:a05:6808:2f0c:b0:495:fa73:2e44 with SMTP id 5614622812f47-4af5e227274mr19676806b6e.15.1785811220010;
        Mon, 03 Aug 2026 19:40:20 -0700 (PDT)
Received: from [127.0.0.1] ([198.8.77.157])
        by smtp.gmail.com with ESMTPSA id 5614622812f47-4af58f25e00sm7725503b6e.14.2026.08.03.19.40.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 03 Aug 2026 19:40:17 -0700 (PDT)
From: Jens Axboe <axboe@kernel.dk>
To: Ming Lei <tom.leiming@gmail.com>, Shuah Khan <shuah@kernel.org>, 
 Yang Xiuwei <yangxiuwei@kylinos.cn>
Cc: linux-block@vger.kernel.org, linux-kselftest@vger.kernel.org, 
 Caleb Sander Mateos <csander@purestorage.com>
In-Reply-To: <20260730024050.1062354-1-yangxiuwei@kylinos.cn>
References: <20260730024050.1062354-1-yangxiuwei@kylinos.cn>
Subject: Re: [PATCH] selftests: ublk: add rotating auto_buf index
 regression test
Message-Id: <178581121634.578215.15829017092257405641.b4-ty@b4>
Date: Mon, 03 Aug 2026 20:40:16 -0600
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.15.2


On Thu, 30 Jul 2026 10:40:50 +0800, Yang Xiuwei wrote:
> Batch AUTO_BUF_REG COMMIT must unregister the old auto_buf index before
> storing the next one. Fixed per-tag indexing (A == B) masks bugs that
> clear after overwriting io->buf.
> 
> Add kublk --rotate_auto_buf so each tag alternates between two sparse
> buffer indices, and test_batch_04.sh to exercise that path. Without the
> driver fix, the request ref stays stuck and I/O hangs; the test uses a
> short timeout and kills the ublk daemon to recover. With the fix, a
> small write completes quickly.
> 
> [...]

Applied, thanks!

[1/1] selftests: ublk: add rotating auto_buf index regression test
      commit: d507d3cb19e71f10336e41deeac517cdc21c34ea

Best regards,
-- 
Jens Axboe



