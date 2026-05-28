Received: from mail-pg1-f172.google.com (mail-pg1-f172.google.com [209.85.215.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3F6A9348C7C
	for <linux-kselftest@vger.kernel.org>; Thu, 28 May 2026 22:02:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780005761; cv=none; b=nzpygTmsx0QQM4Mwqujhs+dm8T0w1wQEXNkT/HqHqyTKeW2TvWnBCjJ8D1At0FAMG3p7mP3nLRNDnNJbRL22sI6mtIVQrGPJf2OEWgEDm1er8gtFczFCjTShbI18eJLMcnfZTHgwanLSjxqSvV2yCFmVsfWg9yXRXLdTVVd1Pv8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780005761; c=relaxed/simple;
	bh=LdY5w1w9JKQhpaZBSyVUr8rGqdk+R+saAIJWzDuNvjo=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=T8qgJZUGsUAX/YsMJ3DgPMU4owvFiGjhzRUHtgUcucLgy7j1AMQxNDyGs25/JZqergLoSeg1PIgjdUHoCgmOdQ2/dguvLUVXY8vgw72G8Xrki6cz7vq3XglS0p2sHHEGDlooWXqJrDF1PWCjuyQuzpIuLJ5cei9kDRYMbxU+2IE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=jZwU5P5p; arc=none smtp.client-ip=209.85.215.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="jZwU5P5p"
Received: by mail-pg1-f172.google.com with SMTP id 41be03b00d2f7-c8173b2af32so10093225a12.0
        for <linux-kselftest@vger.kernel.org>; Thu, 28 May 2026 15:02:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1780005759; x=1780610559; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=a7lu1PeNcCkgTIxgc3W2FpjZdWenBKdIMuLJ/NcoWBc=;
        b=jZwU5P5p3FTmdDG+AARv7m1FxkGzt/xkXiN6mu9dlBJJ+wYiJUBE4ZX4bILYM7+Rhj
         gGdZ0fezVJqD7hPQGNyiGQc3C+z7jjK0/LB1Lxw/1fHUR6V9W7gzk1zTmmSswrZcVFmn
         iFJDu5MAd61uo5ATATVm0eV2eojLn1fJ1RdQG9H5vFLvl/lcCcFlOz9XPAnIA0oAr0Op
         Z56mScARGdAwb5wZDzrSNHofRBGuYMQETy/8TlQbOX+MkyimBIDptf7i36rSKCy2v31r
         6A2xIrDD7GOt0/82jKQE/XCWEKMrqSMcdahg7erlbjTZO5UivapaP3wkzMDC2bsIoHAi
         W3/Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780005759; x=1780610559;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=a7lu1PeNcCkgTIxgc3W2FpjZdWenBKdIMuLJ/NcoWBc=;
        b=i0om5Gy7AmrzYNGgBWp5ENNnDiSK1RiAZejGFEtyt5cpEzcPWxyUT9Lclp6ytoFrYp
         QHzmnF1+a9l3QgM6F7a+eMFt6tE5uha/klbCTvgS0H0w9sMR6aiVd3YRNw1T46NEWXyC
         0FzMBqbev0it0R/GdSPqi2bMIwjcmKDleJ+0r+aIW5/TdYHjVzSfiDDE/xIU7UYFNmb0
         3hZDwe7XYr2/21VSAkd2mv7ezer0KHZvM0o1gNa2p4a3dIahFE5/1Jg3n86I2A0kNhYS
         DgoY2Fgzsuvi+Zx6gXJRwIi11wZ4q8OnLImJwTGOWeq44r45FIGvZJ4ZPAD1vMhLQaMa
         1eMA==
X-Forwarded-Encrypted: i=1; AFNElJ8XdHJw4T9WEMcd7D9EkoiBb1wCjRA8Rg9b7So1fQYygjwUePBYj3SxU+dfhTMJvrJN5BrcVErYJ7L2hNm3Emw=@vger.kernel.org
X-Gm-Message-State: AOJu0YxySSZN9PS7Gr97qJLWHYboy1cYxnSOxJx0Xb86ro9uWhQPufb3
	LRQRNSX/KKhjMjxNU805SNOlskbNEWYdTIo4nnihzxoyQ2DWNUA0qAcesbZVfVxf2g==
X-Gm-Gg: Acq92OGNyRChI9ige4MrY8YnlIC0weN0Rlitjf7iNMcCZM7QruxNqNouPvqOZMKPs29
	RkCPkOHU1GgcMnRMNPKEMDy2gtEzPf2xRuVaAKMVyBwh/fb2CPZnoxlcRf6xjgfhX4UL5YgxPOm
	l9zxKuPgMXNI8/ObVT4oIdXxWxg/dLRTzs3Bk07jSeN3pKZ8wJmM2z+zw8SlaM9+0ePiRLfAX0+
	4eWLWbTs/sesn4UAJWbhMUr88In4vSXmqfkSkZPVw75Slq2Q2Dqjha1NDRBu4VjV12sWwXqsMAe
	tfrqKdYKer9KU7nHzcaHZOLxQ3esabprvkNYPRHpY7P3aWeafXoO1KCne16kYBWruVhC7g+HiDA
	jZDj5jau4SjV7Po+t/r8N6W89Fi1LN69i2bg54FNpAGPl7jgWVhf1WLAWxDQz5sd2RcZW/3MHem
	5Dtz7fPlMP1ybHxbJEAyeddr+enWYzSPd7uw5z0BLqX3SMHDiYW1Z0nVvLQh/+3aHBOvHUI0Wf
X-Received: by 2002:a05:6a21:648f:b0:39b:9644:6e94 with SMTP id adf61e73a8af0-3b40e32b279mr628896637.9.1780005758951;
        Thu, 28 May 2026 15:02:38 -0700 (PDT)
Received: from google.com (56.149.168.34.bc.googleusercontent.com. [34.168.149.56])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-c85759af1f5sm31047a12.11.2026.05.28.15.02.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 28 May 2026 15:02:38 -0700 (PDT)
Date: Thu, 28 May 2026 22:02:35 +0000
From: David Matlack <dmatlack@google.com>
To: Jason Gunthorpe <jgg@nvidia.com>
Cc: Alex Williamson <alex@shazbot.org>, kvm@vger.kernel.org,
	Leon Romanovsky <leon@kernel.org>, linux-kselftest@vger.kernel.org,
	linux-rdma@vger.kernel.org, Mark Bloch <mbloch@nvidia.com>,
	netdev@vger.kernel.org, Saeed Mahameed <saeedm@nvidia.com>,
	Shuah Khan <shuah@kernel.org>, Tariq Toukan <tariqt@nvidia.com>,
	patches@lists.linux.dev
Subject: Re: [PATCH v2 08/11] vfio: selftests: Add dev_dbg
Message-ID: <ahi7e1MEoHwk-rtF@google.com>
References: <0-v2-72e9640932fd+2c64-mlx5st_jgg@nvidia.com>
 <8-v2-72e9640932fd+2c64-mlx5st_jgg@nvidia.com>
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <8-v2-72e9640932fd+2c64-mlx5st_jgg@nvidia.com>

On 2026-05-15 02:30 PM, Jason Gunthorpe wrote:
> Enable it with a #define DEBUG at the top of the file. Allows leaving
> behind debugging prints that are useful in case future changes are
> required.
> 
> Assisted-by: Claude:claude-opus-4.6
> Signed-off-by: Jason Gunthorpe <jgg@nvidia.com>

Reviewed-by: David Matlack <dmatlack@google.com>
