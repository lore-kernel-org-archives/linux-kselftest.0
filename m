Received: from mail-wm1-f47.google.com (mail-wm1-f47.google.com [209.85.128.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A5F1B3C1D6E
	for <linux-kselftest@vger.kernel.org>; Thu, 15 Oct 2026 15:52:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792079554; cv=none; b=kEU0HVFGT18YjGsnX9h/ZKAVRJYYBD/WqsMEPfd4bEbm6ka+UTzaMQ5kVgLyQZ38Lw0EFBxWFCnO5lVNWigCx1gY3+E1pxLh4YZb/7dZMFtV5gkqPXiDru98gqhUG7X2EcPrFkdTt3bE+kESybffUwf7HIMKye0DidSCj3qJSrI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792079554; c=relaxed/simple;
	bh=8+TCZ/zrpvva3iiL9OUxATXfSB4Da998tMTbnuEx5QY=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=jMzYapAc3zmLKWuppzHITVbdDrV25OEeuzCCwJP9RGZYeNYWPO+kSc+s8aaEQ6REsTZQU6WjDA+K5vcACmH8T2vAmtFq5oK/COU+Xj6IXAoqyh60IiXAEU+B19+LaiAxMZpoi5lNnSgMr1JpU10Wv3KXsU4rE0BegitRKHdVGig=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=SmtnTtFm; arc=none smtp.client-ip=209.85.128.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="SmtnTtFm"
Received: by mail-wm1-f47.google.com with SMTP id 5b1f17b1804b1-4a140e7405dso22259445e9.3
        for <linux-kselftest@vger.kernel.org>; Thu, 15 Oct 2026 08:52:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792079541; x=1792684341; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=AHZqp2tUL+jR2ac8WD4oADqX9Z4sM0KD+dcaF1HV3NU=;
        b=SmtnTtFm8vO9k+tlGe/PFyR4FCyq5uyshYnCTbSN/ImvLGEHZtL4P/o9Xvomrd8AG1
         5gv1495Eqv23P1iwbFaACmegZztRjo/9RxFA7Z1xfkSWQ3NZV5kUTGFOaCkwsuXcBvvt
         FghwSjz4Vj8ohvWqFIUYy/NACCxx0P4ymZktYH9hRQE8UYig05Zzuw7gsrHCBL9t0ep5
         zfOKB7zNuFHLAs/Zx3/EVInZN/THVGma+1YBU9aHEYolT5BQsT/cP4ZfDqs0xirKbYHH
         pEe4coy9EFZJHT7PwCtUTzv7Jg/t7w3iwZZTwTMBaomIPwkeV68vww/sAT7G52Ufy+42
         iOeA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792079541; x=1792684341;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=AHZqp2tUL+jR2ac8WD4oADqX9Z4sM0KD+dcaF1HV3NU=;
        b=dO4FN2lTTNZGfwpKpbSynII0xCP4yaXuynmPNV+bYZr+xCQTlClubd9dt6ShBFcsoc
         cumWQVR9qzdWQ4mHYJffxXuPD5AITVd/WlwmeHnG91hQhH5KQuAOHxxT/K23SkrBmVQX
         DLRjw3cUy+PYnUDKf04Ulsk3muGtu6tRCIHkWS7J4Sa2/ikftNF3tNN+UUM1Wh/bl8Tl
         7wyXS2CtMh1mKA96DlldGndenwls1G2Ekc5aIHw2KPprihvF4FycxDtcpyYMYPZVNrrW
         hgl0KsMXY9PkXtKKgEy1jB875R0ss1uEn8JRRKNJ0usw01PmbOEbVA3O7Oe3Hd7jyPR6
         I4IQ==
X-Forwarded-Encrypted: i=1; AKwUvBw3z28dACGmYHR3w4bX+x1BXXeo9PYg2JWb1u3PRFI7l/N2kRpDvhmoMU3YEOvJ9UbyixUp6f3RyoXpfEBFnIU=@vger.kernel.org
X-Gm-Message-State: AFq9FYLJ9qDyD8XmRpREKdNTv0v1/x0IoGJiCpXUEwXJEXzM+eyLo1kB
	xvQibLzsf8E6u7M5K0V/itKw6TZiLCclXtFxotxnmgb9VTa6Wk49vZUN
X-Gm-Gg: AYBFou3M45uItn1JToyGPC+NnjFQRSPjoz3maBS/JD823OWO1k7tYiAImAcKVo8w5jb
	n+3tItxH1leXRZYFMhu5cSnvKmnSEsz4dKMFAsvo+bjQwL+KZzyzLIUO0R59t0qI3peAb4WIK+L
	RJ6k0rQgV4l9lBKvS8RaWtWxgwqCAAjgdVf7++bT615pYr0zf/WLBCPsUkAK+9H7Qez9IA9A0j3
	1GKCaFJ7NPlrNQKhJO7EOXgUuZVcTXwKPDUP89QOs7AeAtvxt3MpJA3XGG8FgTvnZpp7UiI7GmA
	jny60mClG3M0dfJ3/DvmvmcTIKiYpXXgxYJj1BX5zqSJNMynnIEUCrn/Spxo0FfVVBPGV7R9rZX
	9fzdcfgiwOtQOW4UAL3xznfI8i+f6oH65xH4IFYy/SWTYDTqHfcNQlRp1PQUnZSWbAXjmmFNFPg
	GuFgkQ1PtUwSXszV/DfAzWrLlPDd3nHxOIe6k6KNlm2ZF79PTLVTjeU2Wtt+Qh5+QDhG+Zbg/0h
	K+MmAiwmfhqKjrmhkiqHHSyyAHnoPZ86jAq0Fg7WrVp+A==
X-Received: by 2002:a05:600c:620b:b0:49c:fc6c:be19 with SMTP id 5b1f17b1804b1-4a18e4d12e7mr366480965e9.31.1792079540501;
        Thu, 15 Oct 2026 08:52:20 -0700 (PDT)
Received: from andreayoga.wind3.hub ([31.189.109.133])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4a1bd993caesm157053315e9.12.2026.10.15.08.52.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 15 Oct 2026 08:52:20 -0700 (PDT)
From: Andrea Parri <parri.andrea@gmail.com>
To: Jason Gunthorpe <jgg@nvidia.com>
Cc: Samarth Narang <samarth.colleges@gmail.com>,
	Kevin Tian <kevin.tian@intel.com>,
	Joerg Roedel <joro@8bytes.org>,
	Will Deacon <will@kernel.org>,
	Robin Murphy <robin.murphy@arm.com>,
	Shuah Khan <shuah@kernel.org>,
	Joao Martins <joao.m.martins@oracle.com>,
	Alex Williamson <alex@shazbot.org>,
	Yishai Hadas <yishaih@nvidia.com>,
	iommu@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	linux-kselftest@vger.kernel.org,
	stable@vger.kernel.org
Subject: Re: [PATCH 1/4] iommufd/iova_bitmap: Clip recorded ranges to the bitmap
Date: Thu, 15 Oct 2026 17:52:13 +0200
Message-ID: <20261015155214.472218-1-parri.andrea@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20261015002647.GA3575173@nvidia.com>
References: <20260925161142.189813-1-parri.andrea@gmail.com> <20260925161142.189813-2-parri.andrea@gmail.com> <20261015002647.GA3575173@nvidia.com>
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

On Wed, Oct 14, 2026 at 09:26:47PM -0300, Jason Gunthorpe wrote:
> If we silently truncate that to the range of the bitmap, like this
> does, then we also are silently lossing dirty marks. The userspace
> will call again with an iova range stepped ahead and instead of seeing
> the early blocks being dirty they will be marked as clean.

Right, the clip turns an overrun into silent dirty loss; failing the
call is better.

I also saw your reply to Samarth's record_dirty() patch [1]: with both
changes, a dirty entry that is not wholly inside the bitmap fails the
call.  Samarth offered to send a v2 of both patches; I'm happy to leave
1/4 to whichever of you prefers and rebase my tests on top.

A few things I'd like to check before I rework the rest:

1) The dirty bit is still cleared when the record fails.  In the
   record_dirty() you proposed, as in visit_dirty() in io-pgtable-arm,
   the entry is made clean unless IOMMU_DIRTY_NO_CLEAR, whatever
   iova_bitmap_set() did.  With start_va rounded down to the entry, a
   query that starts or ends inside a dirty huge IOPTE now fails this
   way too, and a retry with an aligned range sees the entry clean.  Is
   -EPROTO meant to be fatal for userspace (e.g. abort the migration),
   or should the clear be skipped once bitmap->err is set?

2) Could you point me at the patch that adds bitmap->err?  On mainline
   iommu_read_and_clear_dirty() ignores the return of
   iova_bitmap_for_each() and returns 0, so I assume that patch also
   changes this.  Does it cover the VFIO DMA logging path as well
   (vfio_device_log_read_and_clear(), with mlx5 and pds calling
   iova_bitmap_set())?

3) Patch 2 tests the clip, so with your change it fails: the 1M IOPTE
   at MOCK_APERTURE_START is rejected whole against the 128K query, and
   bitmap[0] stays clear.  I can respin it to expect EPROTO, keep the
   guard check past the bitmap, and add a query that starts inside the
   IOPTE, on top of the bitmap->err patch.

Patches 3 and 4 still apply, I think: iova = 0 with length = 0 passes
iommufd_check_iova_range(), and __iommu_read_and_clear_dirty() then
walks [0, ULONG_MAX].  With your check nothing gets recorded, but the
dirty bits it walks over are still cleared.

[1] https://lore.kernel.org/all/20261015003412.GA13920@nvidia.com/

Thanks,
  Andrea
