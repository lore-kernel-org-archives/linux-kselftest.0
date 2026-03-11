Received: from mail-pl1-f173.google.com (mail-pl1-f173.google.com [209.85.214.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1E3921EDA0F
	for <linux-kselftest@vger.kernel.org>; Wed, 11 Mar 2026 02:17:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.173
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773195474; cv=none; b=Q4ps5n+ZNpMXmGqK2OLsZbs8/mCKSJLwhK0+ZD2J5xdqXODOBJoUvDWhGOEfcamARdcXn0E4XMtWgG1xWyGAuS+17Fe79VCw22fdmbzaAK74aqDqYpYWxSkstXJvhZm60B4T7exST0WM1rr3YFrX+4giBmsHOl3fFsJJKzuPOmw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773195474; c=relaxed/simple;
	bh=CZeHveheAeadX0UEZpxNLvWqoeKOmWKP6TM+p1mI3Cc=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=YosOrIUdysWIf5VeGedMcq1TrpvmMjzNanj86yekOtBcbP7onbE25JuKi17rFp8UwLODz84+VqML6AeIy7wjEXZHjM/nglZ/ig1zy4lQvJFyxc+0LmFmP1x9lhK4w3YhH1hlKr7sSE0tzfSPvhytoZ/62wQ67SNBLAQWHeL6xYY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=LmuO4hWA; arc=none smtp.client-ip=209.85.214.173
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="LmuO4hWA"
Received: by mail-pl1-f173.google.com with SMTP id d9443c01a7336-2a8fba3f769so59606615ad.2
        for <linux-kselftest@vger.kernel.org>; Tue, 10 Mar 2026 19:17:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1773195472; x=1773800272; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=lNIznmqrMaqnx+se5M0cKItTRTQ1UgUfNOmgMa/FK0s=;
        b=LmuO4hWAcwfWz8/Ktov1da9O3Ya+6U9EQUsMYjaLZbcftzmZ0C2yeACA3SNKAYHgto
         /m/TmJ05ibgidsAVEEPJuVsofhSGwCTgCX362SBMYD+0U6CbpFpN5I21G44HVFW0O+cy
         jQe1fD5ezd260luhEy3qi3KqfaWgCvBZCCWUhKtfi7+mSPgVweU23x7i+Uok64aIn8WQ
         G0aHN1gKcJkd919eN7w+zcdSu28Ur4RW7jnVBBBw5DWludwDvtsqkAzCOhiJZvOwF2tH
         wDEydBoq5ezMt8lSaMInz+E1OZjaTjvWdiswznoyxOATGDxEMUhF9H9YPqIA4aYQeKOQ
         Qw/w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1773195472; x=1773800272;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=lNIznmqrMaqnx+se5M0cKItTRTQ1UgUfNOmgMa/FK0s=;
        b=kJJPE2Fna5261HSkHQFP9F9amrkwZBSeTfh7CxHZ0lUvCh5Xi8NMCY2BMF89mxUREN
         mfwOT2hlRGzVUzu2QbpjBwDQ/h5Cl9VuujS6JQyYWKDOJ42Ys6uweQiBGcTMQMj77O/M
         n3lV+7SWyHjCys+tX0Vi8d084nvWgBMqVUp/xNY7r3hBzihChkVkjU9rxgLKFSUd/uSr
         2dVgBQGuiP1gAfirfhlcPdiQX4TCFBM8Fpg5cRKtRe1plmchGMUusjYoFd5Nvtz7DDVr
         Hm8HFrY791r6RG1R994yqnNRb+J9kawJ0J3k7VySdZtEiRAP8C7TuJqK3lDTphLd+hPx
         uTNQ==
X-Gm-Message-State: AOJu0Yxzrqd1En9s8MTZIplR0MBdKM3304UNicDk1DC6+IF+jBMvqyT9
	jmsUOuDfZLGlLUuOqqgrH252caMSXqqX+9eTcP/pp1eEfg2Zoie19YgS
X-Gm-Gg: ATEYQzxkS46Dt9HtTDh/N52H2LeSkbFFnixzYqPrUfZiDNBzGOTlaoFEJDFewWYYRsJ
	b06BQDMcZPAb9NHjQiqOeil7Lr24g5rHBXCY10hX2x93HX2xkOuZLhclw8HTveypogp5MmLQQj/
	KCRurJ00eb6oGtHJ1Dv2LrN5abNIJFUpQi8RnDRRgFA2Kcuvufglq7VI51GbM6zVAUSNiTzBAAT
	IX1Z6tRPp1xCWEMlqgQzLhsyjagywdN2ejbJTvXgg25lmTbGBpvo7ZOfV0NoqR0fNmv2dL8FLl/
	Wu7MPkdlV6SCPJMNy5/HXi4fklfXC1+8bLGNyvD/YZd73jeDSYY29OmRGdj3fHPilizOOQElEc/
	YhLzKboUUIeAg7ssS0SdbDoLBThPbxR2n1IdpC05F00FGO5sLGEMP+Ph3tyCiizUqUlvXOkg+u3
	WlvPsrYxAkRS7KhLIj2jdOtbKoh1g=
X-Received: by 2002:a17:903:3887:b0:2ae:69d3:5b9f with SMTP id d9443c01a7336-2aeae928e9dmr10936355ad.52.1773195472364;
        Tue, 10 Mar 2026 19:17:52 -0700 (PDT)
Received: from fedora ([209.132.188.88])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2aeae34dff2sm5892155ad.57.2026.03.10.19.17.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 10 Mar 2026 19:17:51 -0700 (PDT)
Date: Wed, 11 Mar 2026 02:17:46 +0000
From: Hangbin Liu <liuhangbin@gmail.com>
To: Shuah Khan <shuah@kernel.org>
Cc: linux-kselftest@vger.kernel.org, Brendan Jackman <jackmanb@google.com>,
	netdev@vger.kernel.org
Subject: Re: [PATCHv3] selftests: Use ktap helpers for runner.sh
Message-ID: <abDQyvRGhRIsRGaU@fedora>
References: <20260225010833.11301-1-liuhangbin@gmail.com>
 <DGO2DAIFY07Y.367VMZA7XGT4U@google.com>
 <aajisr9n2pInS7jm@fedora>
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <aajisr9n2pInS7jm@fedora>

On Thu, Mar 05, 2026 at 01:56:09AM +0000, Hangbin Liu wrote:
> Hi Shuah,
> 
> Is there anything else I need to do to move this patch forward?

ping

Hangbin
