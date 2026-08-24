Received: from mail-ot1-f42.google.com (mail-ot1-f42.google.com [209.85.210.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 434DC2931F8
	for <linux-kselftest@vger.kernel.org>; Mon, 24 Aug 2026 13:31:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787578276; cv=none; b=ApBSispVFQXiiOkGJ+4fX3blLCFYQHh633mSXpIoP6AO5qdVuc1Ytyg45CPFOgdUALWW/JX44UyBUutUMkeZYXddwA8ypVtk+p1DUIsDxIrGGaqnxmnngxhNQ7MTB/DNAA3aLXrXeD7DEcx1rSmNGNxf08vQJ6V5Rngwkkgl0cU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787578276; c=relaxed/simple;
	bh=uGg/m1YBOeJTowj4uybIy6jrf/stiCcAnS70kdk5Udc=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=MWdiaTWV8104azCiwM1hUqmP9veQ0UYhK5AWn76hUeQoZbBbdcpkvk7iEMHoy9lmNsb64vOxdQA9diaL6q1PDD71bLoUpDuuoqCrsLwjh8pI2bfePdfVnqJnzUst6EShxsziynPV0xhSfgMBp3IclCJOjefePUDpo2WQf1xylFk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=IBeD2Ghu; arc=none smtp.client-ip=209.85.210.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="IBeD2Ghu"
Received: by mail-ot1-f42.google.com with SMTP id 46e09a7af769-7f3ece23165so3631969a34.0
        for <linux-kselftest@vger.kernel.org>; Mon, 24 Aug 2026 06:31:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1787578272; x=1788183072; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=y60jwkQhoD4s3eswGlcI736vrGSva62DV1OEGb13gfY=;
        b=IBeD2GhuMv+wZ4tp5hrIbamZda45IfxUCzStv5gTB+BxmKE+5dMkfIzmb5/qxTkyr0
         djPAt7CQ1PcM0D/jdtwWpjtvYsgokGjb993nsYnBq8hUBZV2pLHz58GxyGWq7Dl3VaKO
         XM9xFN0no+U/vcBceyEvunzz1Vrt8uZfid7xU3BLOp2rRQWeK72thoOtx3xQMwaYeWxC
         08pY0brQSNH4qu7o6QZgJ72wY/WWQqx5bWgGIxfQC/dnuWYEVDsJXDc7BIW5wwPh7BzH
         1uggRCVLgiis+2ed9gmjeHRLsrifJjkQTy4Wme7nt8aYo+DXGJbMfVe8laPXt+edroad
         bJ9g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787578272; x=1788183072;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=y60jwkQhoD4s3eswGlcI736vrGSva62DV1OEGb13gfY=;
        b=tHfelbY1JlF0srfvMDIFCMCqzHCYisug33CCyTHWFFjUGunkPxFS8m7qBlc1xjR14T
         qC6J3p99B7AH713qR7uiJTMnekNow0P+dfdVnHLASPOwP6guNPSvNjL7gZgxS4eDPAQV
         cGz0LvDIp1Q1fiXxwaImJ8qPDy/ptE09Qg4Kp7hx5aCNhZ+NQ6aadAPHIy24oJ9WAaCM
         27+0eUPot94+3b8XRz8qxtij+8G0gCxLlJdbqmqROkZA6kHfm1JGAHzQMtdATumIAYfG
         3yCafE4zLNQRarIgDXmmKIdqMwHErSI6g8z5i17WNnbGBWJq3pw29iMd2tvX+43EfVNu
         HjDw==
X-Forwarded-Encrypted: i=1; AHgh+Rq/PgWuygtJCc9oiLv/mecX/maDPRXQ0lKGLHWsHXmcuSfhOu5GCMFoESkZzIIOuudSNidq0QYfJLW1lpLuZ/A=@vger.kernel.org
X-Gm-Message-State: AFuF++mhaeGoi+O11R6c4W/WrN5/dHwy2XmRXshcGdvCa/D4tL4WDmCw
	SpA1akbdO/SoonCRmhkXwNATx9U2IwKZrUTtZR91YBI33AbyDG30xRQa
X-Gm-Gg: AR+sD11CPzSD6nGrQ3dRxc/TFsWFK/S9V4Lf5CL8hBd54o3sVRmT07QcOtRqh7JREVn
	YNBfhJguzXRsvTYRQSjAkYJIILKtKlbShxWQ61xRGpbbVoaa2uOQ300ExM+wraVpYA5ms2p77D9
	RfSxSaTnGMpKPheYjWIrSHhIS05R0QTMPGQZNUVdKfmGZ+E+l0JTIHq6iF+Qh6M7be/mi9/f/Ge
	MCcomlji85AhhQrnKAtsPLwqFfMYHAdkALnR7VoqsiINdGU/EtjBOIJ1ocNfu0bbq6fQ9QrA2yH
	MWfOvQQJTdGtFGx5EdP8rLWp6G2R/BaIhHIIviEPtv2EX7sovjZcCi3Jtz2hSROFlcxsumS1cyZ
	EVZvf9/Qd/bRwDlkD77L641nVP+pWQVartWIYeDhuy0K7A4ub//iDdTR3M8wZSFkFAtU5WbqvT5
	v+OLdvt98pxaK1S1actIArHlB3STFwADH+We2SjHALDSFKR5yRnoNHhNSEjDy/kIq/TtiWkFrg2
	volpyRCl9hbh4d0RjV9Qfn+5EFdQ0oAQvYM0sD9ydBZuNpApFbOY4HuF30lZbuPR4XJvPkZOg==
X-Received: by 2002:a05:6830:600d:b0:7df:5fc:3fd5 with SMTP id 46e09a7af769-7f461421249mr32340464a34.1.1787578272534;
        Mon, 24 Aug 2026 06:31:12 -0700 (PDT)
Received: from fedora-laptop ([172.245.82.59])
        by smtp.gmail.com with ESMTPSA id 46e09a7af769-7f48fcb4fa2sm4207470a34.25.2026.08.24.06.31.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 24 Aug 2026 06:31:11 -0700 (PDT)
Date: Mon, 24 Aug 2026 08:31:01 -0500
From: Ming Lei <tom.leiming@gmail.com>
To: Yang Xiuwei <yangxiuwei@kylinos.cn>
Cc: axboe@kernel.dk, linux-block@vger.kernel.org, shuah@kernel.org,
	linux-kselftest@vger.kernel.org
Subject: Re: [PATCH 0/2] ublk: fix force_abort leftover after quiesce recover
Message-ID: <aoxHlXhGrrFDN8SE@fedora-laptop>
References: <20260821103047.369522-1-yangxiuwei@kylinos.cn>
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260821103047.369522-1-yangxiuwei@kylinos.cn>

On Fri, Aug 21, 2026 at 06:30:45PM +0800, Yang Xiuwei wrote:
> Hi,
> 
> Quiesce on a batch device leaves ubq->force_abort set. Recovery does
> not clear it, so batch fetch fails with -ENODEV and the device stays
> QUIESCED.
> 
> Patch 1 clears force_abort in ublk_queue_reset_io_flags().
> Patch 2 adds -b coverage to recover_03.
> 
> Tested: recover_01, recover_03 (with and without -b).
> 
> Yang Xiuwei (2):
>   ublk: clear force_abort in ublk_queue_reset_io_flags()
>   selftests: ublk: add batch IO cases to recover_03

Reviewed-by: Ming Lei <tom.leiming@gmail.com>


Thanks,
Ming
