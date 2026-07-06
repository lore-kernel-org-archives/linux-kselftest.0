Received: from mail-qv1-f50.google.com (mail-qv1-f50.google.com [209.85.219.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D1BC941A78E
	for <linux-kselftest@vger.kernel.org>; Mon,  6 Jul 2026 18:02:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783360933; cv=none; b=fv/2xZxVlVfdkHTDk7FNXYiT8678V+LGouAd4MuH3e5RJp/VXuFwt5pnMwVELxhNeRi9tPa05uRUiWSSwOqLAhAF2Iz89n3nbHfsI4K1T67ZhIYYzLp3EMeHAbFXsvWIVbT73ETid3W/diVN6SMaUekHV3AITWA8bzFpR2vLhPA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783360933; c=relaxed/simple;
	bh=kXDlM4ALMMZ+goUgzxjE8iSzN63pj5SPv611+8XFIGI=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=gsIe8NoMhFY2uTvYtQhI2w5cFm/ds2Ewvovhx96BPPXhBKP5rZ95+UzGoavMFZA9q17racv0s5US2Ia1/NCDK4enwRllfTS7XX9c0uTtyW+9vJwyV3+3sEM1bymY10RhocAO5gQ/q7nRmvqyQRAHv60SUbXkwspkmYIK4gYwWYQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ziepe.ca; spf=pass smtp.mailfrom=ziepe.ca; dkim=pass (2048-bit key) header.d=ziepe.ca header.i=@ziepe.ca header.b=SazfPKw5; arc=none smtp.client-ip=209.85.219.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ziepe.ca
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ziepe.ca
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ziepe.ca header.i=@ziepe.ca header.b="SazfPKw5"
Received: by mail-qv1-f50.google.com with SMTP id 6a1803df08f44-8f18d92172aso46474326d6.2
        for <linux-kselftest@vger.kernel.org>; Mon, 06 Jul 2026 11:02:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ziepe.ca; s=google; t=1783360931; x=1783965731; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=kXDlM4ALMMZ+goUgzxjE8iSzN63pj5SPv611+8XFIGI=;
        b=SazfPKw5hQYTg9bVJDJxEiMKZV1JBN2c83Jh9Wiidbl6iqOJJBFCWRI4jWimKnfY13
         teafepspQADfGRWblUzKOGf1QNE2Yr0WLmGhqe2+KZ8o11DQYPO0jlAi7rIAxPXLOnUa
         zXDWcmnZntZTSPGBfmPj3FMwjfni8AXvVq00h10UItFUMdq0Xs1T2BTV8aChiUJDZIFC
         utzw9jNpTbhQcDxVzKSlC/yT8fgoxTzZrHd/vypd2YdWBhYRtgjnSO/qOkqMUqRKkB/4
         7/Alf79DViSMccTpXF7ynnJf8FKlNXnrOfx/f+Mu2KkUpK7CiKSTkvfHrxPV4AwkgKmr
         PBng==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783360931; x=1783965731;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=kXDlM4ALMMZ+goUgzxjE8iSzN63pj5SPv611+8XFIGI=;
        b=OENpQF1NLHkfuQpYe287mKAlfcF7Hk8XtQdRquSm1S26eT0BR96Lk2ecKdJw+EO8BG
         qG/I1eWt4ZSzNy5MGsOT7LVByv/SJAunv9dsh0kV7/n2AjT8vVO9/H6nJbioeU4dzb3D
         5QSLV1FMhxUL7DofJJFnYcRgASTCCzE6JfSJriG4G4CZqh21mKdTLs2xrbQkQhiTsyfk
         7oUow15lVUsf+EAO7Xk+jEuLTn9XMdAdUaPXK9nrWc4g7G1Lnk/PWZeNtgRyFF7a9qMH
         Z9h/yCSY9xx6sn1DL3MTVjuF0bW+UspEM9fxoBbJ5iqXguhqYu73wFZ5zpNvQi5p/3JD
         xjdw==
X-Forwarded-Encrypted: i=1; AHgh+RrcHSgsPp3spBB1+TUHnHfnXxNw0r3V1w6uEBh6onzp9pcFoLW3s4kQ3cV1LGZ8IFcGtsW54UtNO7v443BvAho=@vger.kernel.org
X-Gm-Message-State: AOJu0YyDn63P8VO624eM3tyahoUWj59W3pmDnGktKZK9kgWEVkrPgpze
	a+vifYxFzNmuvPhdqVvgq2ueSMmD84/4kRvtnKqvcDB47mQtqdNoF0Df1JHXvEt6uAM=
X-Gm-Gg: AfdE7ckY69hTD8m05+zaGFxiufcojppe1TivJBUypdb0Nw3KqY+WCbi4OoUTRbrGr62
	6PBm9u5Cd+X/SQ4NFoug//AlTjA0iGFdhT/6CR8tymts4Lcu8LnIOdJzrkzFZZoULdBKDXjjfxq
	FcCu873c+GwtqUwFZ6VKgxppWYOxlZm85S7ghzvwHRgBCX50UyKnN/83DwEGQLZ8YPI0sgevE1S
	ZcWL3pPWCVG/WwkVk8VNQeww7j3cPU3eIpw9IxYTg/Swy1RAK63A7EHklfHT+QUB7z5cR5DRmx+
	twHXWDFPf3P8fzS2eFVMfiVC0khcjvaGp+f94Y0o5fIqOLTRy18Qfe/zZkbfumIwDRu9u5J90tB
	8qfrsw3SkLe5dSGSuqIqlDHnlNH47kWhduu6mDJkvlWP+wTJuZ66SOvAvJRSQNysJsICRdLY=
X-Received: by 2002:a05:6214:590c:b0:8ce:ca7d:b099 with SMTP id 6a1803df08f44-8fcb2990a80mr21004896d6.18.1783360929999;
        Mon, 06 Jul 2026 11:02:09 -0700 (PDT)
Received: from ziepe.ca ([159.2.72.92])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-8f46e371f44sm150118746d6.2.2026.07.06.11.02.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 06 Jul 2026 11:02:09 -0700 (PDT)
Received: from jgg by wakko with local (Exim 4.97)
	(envelope-from <jgg@ziepe.ca>)
	id 1wgndw-00000000dS8-35OA;
	Mon, 06 Jul 2026 15:02:08 -0300
Date: Mon, 6 Jul 2026 15:02:08 -0300
From: Jason Gunthorpe <jgg@ziepe.ca>
To: Stanislav Kinsburskii <skinsburskii@gmail.com>
Cc: Liam.Howlett@oracle.com, akpm@linux-foundation.org, david@kernel.org,
	corbet@lwn.net, leon@kernel.org, ljs@kernel.org, mhocko@suse.com,
	rppt@kernel.org, shuah@kernel.org, skhan@linuxfoundation.org,
	surenb@google.com, vbabka@kernel.org, kys@microsoft.com,
	haiyangz@microsoft.com, wei.liu@kernel.org, decui@microsoft.com,
	longli@microsoft.com, linux-doc@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-kselftest@vger.kernel.org,
	linux-mm@kvack.org, linux-hyperv@vger.kernel.org
Subject: Re: [PATCH v6 2/4] mm/hmm: add hmm_range_fault_unlocked() for mmap
 lock-drop support
Message-ID: <20260706180208.GB118978@ziepe.ca>
References: <178336023903.504354.7500950448226027718.stgit@skinsburskii>
 <178336050736.504354.6052508493877924780.stgit@skinsburskii>
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <178336050736.504354.6052508493877924780.stgit@skinsburskii>

On Mon, Jul 06, 2026 at 10:55:07AM -0700, Stanislav Kinsburskii wrote:

> +The caller must not hold ``mmap_read_lock`` before the call.
> +``hmm_range_fault_unlocked()`` takes the mmap read lock internally and allows
> +``handle_mm_fault()`` to drop it during fault handling. If the mmap lock is
> +dropped, the function returns ``-EBUSY``. The caller must then restart the
> +walk from ``range->start`` with a fresh notifier sequence. ``-EINTR`` is
> +returned if a fatal signal is pending during retry handling.

It doesn't make sense to me to expose this to the caller, the caller
isn't holding the lock and there is no reason to redo the mmu_interval
at this point, so why not just loop inside hmm_range_fault_unlocked ?

Jason
