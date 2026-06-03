Received: from mail-qt1-f178.google.com (mail-qt1-f178.google.com [209.85.160.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 305E03CF04F
	for <linux-kselftest@vger.kernel.org>; Wed,  3 Jun 2026 14:08:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.160.178
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780495734; cv=none; b=SX5DxegX3A4Q1WZfTK0LdEqS4ZNniRp8IRJaYoeP1y3dObY0EMPXFuxZNZShdia9a4AzJNBCFHxMAJ9lnTWEtLjuwDM0nGlxXrGJHRMYv9PRtqy31MZqTC+W7z3cF+oL8q/TUyFCrcRHWa6dC/1Q7+67Lsk9BDjtY+kiOYqDKFo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780495734; c=relaxed/simple;
	bh=mpS386OIWn/1uIQD+RKTH9RuXoPv4nzB312kCyDGUao=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=eB/wMtsIvDmHYfhsDnGJgKCN5JKR4g2RQgeXr3hPnDvE9kxpUAkH8XMshZbtuJayPBvKKREvG5uVQZykNKMH/k/hCddiqureUxr1Rrb81GCsHb73RU+gFiTHSYEnZTqrBg10na3kKJlUpyPEkj/o5thq39c7wOjtsz+ifqdPJms=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=hVWVUH/R; arc=none smtp.client-ip=209.85.160.178
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="hVWVUH/R"
Received: by mail-qt1-f178.google.com with SMTP id d75a77b69052e-51765531803so486921cf.0
        for <linux-kselftest@vger.kernel.org>; Wed, 03 Jun 2026 07:08:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1780495732; x=1781100532; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=vrZsZos3Mt/QxzkZ4e65PaNc9Xnu5WiDW2BXX/YqZXg=;
        b=hVWVUH/RKllFZFJmITfTRctd0FViCC4PACSb2i3UxM8zgIW76CsBS6NtmHGRJtVx+Z
         g4taImmuboCCmayGibcptpeslhVfCpDlnrY008XBHrXotAE4PvbGFc2hKvWQV9a1OvwQ
         gf6i/GIZ0D6DKDQcHgd4Qj+Jc7NPqU+ZTKPTr2O6puuCgobSmasJuEuU2XIANwkRNAAm
         jOiLs9pkzvACD+/F7auxiR3wzu/fKktH+S/mmzEAqofWIhfHGbj+VAGWl41lzB9QUam7
         7A9o1evkaiYC/XtRGJH15j/NMw9SiWc935iQkF4VJ/f/7qczKjEQMwjVJrFmycoAMpFZ
         YYOQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780495732; x=1781100532;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=vrZsZos3Mt/QxzkZ4e65PaNc9Xnu5WiDW2BXX/YqZXg=;
        b=YtCGJCE9EZcyBTp0Y1MRIHAITFZvpvFRIcWOcGzrXkAS7UbrSnX6OKhGRD4FkjOifO
         ofBZS/Vvn4IxfDVxzmctGP/PdEG7oYgFli/Dcu6xGXRle9D9UO6PQ2uSTT3s7ULUg9R0
         enUbV10+TlKTv5tV2+wLOSsPQmdk80cZTkH9u4mvqUhX1D0ZbHmpTCUGFWmvaoK2CotT
         yEVJIl0CbeL1vd1lNqMTaN+2anAQPv57hs/d+ubbNeVBJfLeIETumUM/VSuQbRemYdP5
         lPw/48t4D8kFvr7w2VvwXSOQvhv3IQYBg97f33CScZpvCnYNPUerJKIVuFr08+kwt3pu
         Jszg==
X-Forwarded-Encrypted: i=1; AFNElJ/TC1B2aQj3BKOTeGs79H4Uhth/q3tnLqIP6X++sjee8eYljilss1w1vSROPFxit2UJ+qhVLLUNjFFdC9ne5Xs=@vger.kernel.org
X-Gm-Message-State: AOJu0YxAUkN8vj/UG43mCewQ9b63P4nbpepN0fWQ8x1l3VUtG8udqjHA
	Co7sSAb959/YK0SQlM7c5pWPEIwIDfGl8fm4IqwEPy2BTwnOTPAeJpTA32VFH1/zXspEHe8UNgJ
	GZffHew==
X-Gm-Gg: Acq92OGbqOu8x+0BsvMfno6UXQJzVM3zmtLzxaJgFYrYwdv5KFJlq+JsdvftlXQByhE
	453ERivdAYO8FIMzASvoFQxIGglW3fh0Y9muIw6isanPtqTN53XVED7XayBJBSNSkjqK4EGHFM3
	cWv4rsMoMsr0kMngw5Kwvz9GItkkNkM6gTaOAz4LGj7vn/81j41gQIubpMs4M5fqlbJLWfEW1jt
	KyGoUNeNsbkHA7ZZLAJ2sDfrBo2/lnXdEUBQ5bBfFoLxI9qiFOn/2aGan0qDsLHeWI1pBBCMBNM
	UNAiJK6iMn7qFMRGL4cgk0rlGhlGEJv1prF6tyKK6fl71A5bgGlQHjES5s30eUa2lVnslrVl6dW
	42GQMYmfwAcrfcoqylODDbMbRC0eezNidJKRI8zWhK4uHmQxu20ympEdhFQfrXkZ4M4cpRUEoWd
	Twm7tXHZLVI7XizyIgzNpTTHGwcwm5O7Wzc0Qaz5Fvh0xryedbnvPcH23YmXla5Rn7DSTk3jmgS
	E/5/mysRw==
X-Received: by 2002:ac8:67ce:0:b0:510:f9b:fb5f with SMTP id d75a77b69052e-5177bad00a6mr6870781cf.16.1780495731395;
        Wed, 03 Jun 2026 07:08:51 -0700 (PDT)
Received: from google.com (199.255.142.34.bc.googleusercontent.com. [34.142.255.199])
        by smtp.gmail.com with ESMTPSA id d75a77b69052e-51775c08234sm24412491cf.6.2026.06.03.07.08.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 03 Jun 2026 07:08:50 -0700 (PDT)
Date: Wed, 3 Jun 2026 14:08:44 +0000
From: Pranjal Shrivastava <praan@google.com>
To: Nicolin Chen <nicolinc@nvidia.com>
Cc: jgg@nvidia.com, kevin.tian@intel.com, joro@8bytes.org,
	baolu.lu@linux.intel.com, iommu@lists.linux.dev,
	linux-kernel@vger.kernel.org, linux-kselftest@vger.kernel.org
Subject: Re: [PATCH v1 2/7] iommufd: Reject invalid read count in
 iommufd_veventq_fops_read()
Message-ID: <aiA1bBMVyur0Rntu@google.com>
References: <cover.1780343944.git.nicolinc@nvidia.com>
 <e1111adcc8a8882fbfd84accd6674dc846dc5689.1780343944.git.nicolinc@nvidia.com>
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <e1111adcc8a8882fbfd84accd6674dc846dc5689.1780343944.git.nicolinc@nvidia.com>

On Mon, Jun 01, 2026 at 01:42:33PM -0700, Nicolin Chen wrote:
> The read count must be large enough to hold a vEVENT header. For a normal
> vEVENT, it must also hold the trailing data following the header.
> 
> iommufd_veventq_fops_read() does not validate the count, but returns 0 as
> if the read had succeeded while leaving the pending event in the queue.
> 
> Return -EINVAL in both undersize cases.
> 
> Fixes: e36ba5ab808e ("iommufd: Add IOMMUFD_OBJ_VEVENTQ and IOMMUFD_CMD_VEVENTQ_ALLOC")
> Cc: stable@vger.kernel.org
> Signed-off-by: Nicolin Chen <nicolinc@nvidia.com>

Reviewed-by: Pranjal Shrivastava <praan@google.com>

Thanks,
Praan
