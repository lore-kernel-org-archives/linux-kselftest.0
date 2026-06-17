Received: from mail-pl1-f175.google.com (mail-pl1-f175.google.com [209.85.214.175])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 551D031F9AE
	for <linux-kselftest@vger.kernel.org>; Wed, 17 Jun 2026 19:08:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.175
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781723312; cv=none; b=T0kzVpYYAmNwExK3Q+OBjxlHa1XTY4m0BOaGeU2HDM1Y5YoyAMpv8GJmpwyasVyn9IrmqcaLJxS5WZFQqt+bChlarRLfzSXHCnuyKqT6Sw/1PIivcc4JTGpiBaQiPGXiu3kaLPlrFo7NapsXwbmAU+IKbUerL50PLPTQdtYjTiQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781723312; c=relaxed/simple;
	bh=o8Soy+GG06sJoGEVVtsbHdZkGXoSQoZUBkizaoLwmd0=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=ecA8aQpx68jUGt2QvDi+hUBAhnsS7H+W2e+uVHPM7o/zZm8V0iolQmQucT8mFiiTcPjk9YE0IePEOq8/CHPF+KRGm+FLEmgoEVMVRIf4soN6pDixxSI14ew1WV75nkg9F3amc9TRl/mj/ZrHJ4WAlxcFtQOoIwxnpfvox6unV4A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=GbrNuoAJ; arc=none smtp.client-ip=209.85.214.175
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="GbrNuoAJ"
Received: by mail-pl1-f175.google.com with SMTP id d9443c01a7336-2c6a4eccab1so10245ad.1
        for <linux-kselftest@vger.kernel.org>; Wed, 17 Jun 2026 12:08:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1781723311; x=1782328111; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=j+uzwrFGJAcNQVQMCnTHy2evwlubyHfh6u8CWpZkX/U=;
        b=GbrNuoAJ9DC3JwE6rojBU4KPCwdC0/JN8Ngqjm/53z+XqCetNy61K+uLKD0tQ6ozJ4
         2Gfo4P3YIksCanUA0MucvFXbwpeGM8vexglqrGNMnmJRUFTa1PKu1gpKNySDDcYfULmc
         epfHtNQG21sUIfdPUD33CDEP1kwg0f+ossTegBE33bQmb6w/yjuJIAIWVF7eTkPLXE6W
         Pcb3E0UTJtUVX82eqFs/FZXQ9s9MyZ/1Xq4zf7VTrcmkYgLAeeY0SL1Zp0nMd5eWChd+
         TUida0mcztaLW/3vnAq3ss8f94gnp+faHw0YhWb6nDdAJi8SZxFFv3sQ04e6mQ6RdN8F
         Mefg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781723311; x=1782328111;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=j+uzwrFGJAcNQVQMCnTHy2evwlubyHfh6u8CWpZkX/U=;
        b=TesW/MPdpl74Ki6yK+EKnU7+PgNyNg10utB7F/mwPPPR/M2MzuDF1E1t0BcuZsiUQM
         pY1EtEEiqeLaxqQLCkNLw0rV8kMIiWm2I2etZhyiVIRptuiySYOuYmqsumGx6LzhZj8t
         cTk1cKlQGbHZkeoNZJoDcm5tx4jvxXnTuqZnCv6C2MEfKbJf0r7ERpq9AQEtVTJjqLjH
         XRyJzPXcgKNuXLEA2lFNrYAG2zDcxYyyu8XrIbSp6Jv0UoCDvf8k5URZhgMpZ2y6PYFT
         kNfudep4/aIofM4ea+u6g2dn4lK9Roy8phhGJBdXCVsGQQEU9YAdpHZ6WxR7r4xEcMRA
         MsOg==
X-Forwarded-Encrypted: i=1; AFNElJ9aMohNY7Uaz/X3fL3XH2zZwFVOLjUbjuVmGwgQF69IKTTuxzS+MSX3XVNf6x/4nMwJEvcYC5wtLSgr4qO6yQA=@vger.kernel.org
X-Gm-Message-State: AOJu0Yy3W8ZpL9w+Hq8GxP0RWOHIRENVR+hyOiVgSvja2qsbshLEuDiC
	okly2Ukc4PQWO4bc1tY8BN7kQcRbuQnFC91rbl4Os8I8PwPdcq1AmUCjPAkYBNURag==
X-Gm-Gg: AfdE7ck/jkaOm8nmPSKFyJe3ZDTKI9uQPmn5KU/pA3M1VCn29TVb44hebGhxL29oNDU
	EucyeUH85sQpPKfBfm/S3tZUIUsslJeHtou5Sv52+DNhHzfBeoT1/Bv8T2xJ7hUb08eSu8TU02b
	gKDS5ti9UwcvgayUL9FjlRo1M6uOWNS/sLBGwc56FNn0GCrXWdUgNZZURIzkwGl2FHGd+ElD2ou
	lnYtUUKaO6fyYCX+duKm0sORfasdroXR2RT23tAsdHtcFxl7NgO/8p3mSLu67nKY4NsYrEVU1CR
	+6SkwMGgemqa3do7x2OSQZbj8+jsr8MZOuA2jhtHfP8zLr45Ed1btn4IehKE6Mk46JT516Y89rm
	apysBn6qavdchsqatyktCMdbtAjdo6KEw/Gk0KWIgTAL+JtN6BuIYDbhRhQuNUyhQmna2PTraqd
	QRk05u8zq1JDqWNL9V1VnzvzbbR9DIGkrI/ldmb415nnwJTVA=
X-Received: by 2002:a17:903:350c:b0:2bd:6dad:3dfb with SMTP id d9443c01a7336-2c6e2435553mr295865ad.25.1781723310281;
        Wed, 17 Jun 2026 12:08:30 -0700 (PDT)
Received: from google.com (60.89.247.35.bc.googleusercontent.com. [35.247.89.60])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-c866325d156sm15559385a12.13.2026.06.17.12.08.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 17 Jun 2026 12:08:29 -0700 (PDT)
Date: Wed, 17 Jun 2026 12:08:25 -0700
From: Vipin Sharma <vipinsh@google.com>
To: Mike Rapoport <rppt@kernel.org>
Cc: pasha.tatashin@soleen.com, pratyush@kernel.org, tarunsahu@google.com, 
	skhawaja@google.com, shuah@kernel.org, dmatlack@google.com, 
	linux-kernel@vger.kernel.org, kexec@lists.infradead.org, linux-kselftest@vger.kernel.org
Subject: Re: [PATCH v3 0/2] Make liveupdate selftests library
Message-ID: <20260617190754.GC2704872.vipinsh@google.com>
References: <20260612214512.464146-1-vipinsh@google.com>
 <ajLtfkuMP4DEGlqe@kernel.org>
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <ajLtfkuMP4DEGlqe@kernel.org>

On Wed, Jun 17, 2026 at 09:54:54PM +0300, Mike Rapoport wrote:
> Hi Vipin,
> 
> On Fri, Jun 12, 2026 at 02:45:10PM -0700, Vipin Sharma wrote:
> > Hello,
> > 
> > This is v3 series of refactoring liveupdate selftests as a library. It
> > exposes common liveupdate ioctls as a library which can be used by other
> > selftests like VFIO and IOMMU.
> 
> Let's revisit this after -rc1 is out.
> I don't think there would a need to change anything, it's just the matter
> of applying the patches to the right base :)

Sounds good, thank you!
>  
> > Currently, there are no users of this change but it is being used in
> > VFIO and iommu liveupdate series.
> 
> -- 
> Sincerely yours,
> Mike.
