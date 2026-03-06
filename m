Received: from mail-wr1-f54.google.com (mail-wr1-f54.google.com [209.85.221.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AE4543009E8
	for <linux-kselftest@vger.kernel.org>; Fri,  6 Mar 2026 13:45:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772804749; cv=none; b=UHfSTGiCauM7jJe1tnw2GSu/G8BLYi42p95TplLesZ1A5mY7hUcwkPHNvEDZ14X4oj6hW+rXR4OnpJpkKcpVCoikzH9s75hPvJSQ+pqvrBczl2RAe6oW3IVkwCpsR4RuVKQ/PqLG5sFbajxjHkyeDXeQXoLmoeCb+eGXMTrVeZU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772804749; c=relaxed/simple;
	bh=IZcCd046q2xhrrrrEWiiXgi3zY/ph1FdsWl/I7S37Qw=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=d2c7wkgERI+zFHVpoUIv0Rh5jNZnwAFDBGKcTlXmFxs4KbvhpeRTsM73R9mlkBrU179QWOOKxIfOHDuI405DiJVhepIw1Gm07pirBtspiLr8UuLVRzaFU3aWh7Uk45ofTVoLaO3MHrZVxZIgFk4WdC+QvhoQjh35q1Tlm1VpEVY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com; spf=pass smtp.mailfrom=suse.com; dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.b=VR3PDYyw; arc=none smtp.client-ip=209.85.221.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.b="VR3PDYyw"
Received: by mail-wr1-f54.google.com with SMTP id ffacd0b85a97d-439cd6b09f8so1706471f8f.3
        for <linux-kselftest@vger.kernel.org>; Fri, 06 Mar 2026 05:45:43 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1772804742; x=1773409542; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=OV6EE6RoCxw1rbG3/V3MYG74ysZnRV2qqRKRpT6tbsg=;
        b=VR3PDYywMouetVyqIQS3SP3yf18vjdDYJO1kbIO8mVu534I5xPTqgPUyHS5KdoTuet
         R2TilY2To17mpUcOiblicJ0iPIt5ojNsr/1D2lfGsGZFPHSLELt5z+vLxZnUte0pRc1f
         Mzh9PSaAiRM7P/ugWPwXQ834Dw9ZHezI1i75hAWnbnON6ihB8kp9EDUQiomyTEUgW3WL
         EaNp2Lc6SyKests2xQkC0d6PVJm/Q2s2Gb3zMfaLRNxPbvAL9g/bsN7PnuR01ggTEOra
         EPW9HGubz2S6j/XDKXEnkm8q2eTFqsdA71FlORyAuC3yneqbyHbJQO1ri0KjFThqioyI
         dnBQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772804742; x=1773409542;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=OV6EE6RoCxw1rbG3/V3MYG74ysZnRV2qqRKRpT6tbsg=;
        b=hmWiSA/zWUCH/1CHKbPTzu6K/y6K2frElWkr3jfoSC5almWZ8gfvaeFwNsSlYZKkDW
         53U7ywuQ6cKRdK+RQQiymYkq/3DT2qFkYCqL27hDuoK5DzKiArvBQIdF8bqyTyFRQhRI
         BKF9ptcOpbiZVlSo6db0q6rkLEk+JQWSegWsrboq4/Vgb1g2C6+QpITWhmxgMeH9zvUk
         DVnMLwWPKTkC11t+cQLWoyKuPg4F8XHci2dmBzG/z8nQhea+D6XTQ/0HodDQWFxVpyQK
         9G/3fYQv6/up40+XihIHq+EOw/pgmhpgaKrpmzMlMEi0yJC5Hg4iQ/M1OPot5nw1cK/d
         x88A==
X-Forwarded-Encrypted: i=1; AJvYcCVPs8lwpRApxUQKzDQ7bf48hvKhBQ/TIbW2X4Awm52IflOvacwQ7NO+iXLidFa/58IyO9U39pWa2TU1l2LpiXU=@vger.kernel.org
X-Gm-Message-State: AOJu0YzXpDedGemLSDSx3kftqhzbTeQT6U3AiO9X6588EBGavz2v8KX6
	6uRd9pX6y6/iSHa4aNT1HDYzIvgPuG44DFC3Jce2A5FM5pHMGcqOnzg5zdzQ/Mgb+4M=
X-Gm-Gg: ATEYQzybTMbryfaZ1S17AB/n1DkMiGkwJAX8KdATfj18k7TzxInIdsmdamB87fX98Ri
	IcO+3ys2sbUlLNxY5/xBuU9XflrqgRfWMnUNiiyoRqtEZ+ePuY7WmHz+twsVSFpIWC1+AkCGcEz
	Qox8dj7mpaA8K0zpZ8QNbBSBp98peS/UySmEgF3FJFibiJ2S3wtnUSOIpxsJnJeTA6YmNHktqpW
	17y8pcHnnsMfGk9eLaBzbSpvCwk+2b9/I19XRFnLA6L+/WOEGA0Sqq7lPg9l3crMH0TW/kQfFsL
	vgBhZjNFSoWJC5EhY+jcNWgN+BzhE9RjYz8Ru2hUjbs+UfeyuUhf9d8XzAV+Qw1uEzR7g+Naf2L
	z8e2sG1ENPyBFjzwRGtuoMAdWB1DbldfkQJ35IRyQ3ZEqb0UMC33+oaH1eS7jAbl41ODLvK3ikl
	UBjmaIs25jUwbadSHWq4Zq9YMiLU7rsM0QmiHe
X-Received: by 2002:a05:6000:3112:b0:439:b79d:b9a5 with SMTP id ffacd0b85a97d-439da35f63fmr3688028f8f.37.1772804741726;
        Fri, 06 Mar 2026 05:45:41 -0800 (PST)
Received: from pathway.suse.cz ([176.114.240.130])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-439dadb29fdsm4191867f8f.16.2026.03.06.05.45.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 06 Mar 2026 05:45:41 -0800 (PST)
Date: Fri, 6 Mar 2026 14:45:39 +0100
From: Petr Mladek <pmladek@suse.com>
To: Marcos Paulo de Souza <mpdesouza@suse.com>
Cc: Josh Poimboeuf <jpoimboe@kernel.org>, Jiri Kosina <jikos@kernel.org>,
	Miroslav Benes <mbenes@suse.cz>,
	Joe Lawrence <joe.lawrence@redhat.com>,
	Shuah Khan <shuah@kernel.org>, live-patching@vger.kernel.org,
	linux-kselftest@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 1/2] selftests: livepatch: test-ftrace: livepatch a
 traced function
Message-ID: <aarag5K43WElzDqT@pathway.suse.cz>
References: <20260220-lp-test-trace-v1-0-4b6703cd01a6@suse.com>
 <20260220-lp-test-trace-v1-1-4b6703cd01a6@suse.com>
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260220-lp-test-trace-v1-1-4b6703cd01a6@suse.com>

On Fri 2026-02-20 11:12:33, Marcos Paulo de Souza wrote:
> This is basically the inverse case of commit 474eecc882ae
> ("selftests: livepatch: test if ftrace can trace a livepatched function")
> but ensuring that livepatch would work on a traced function.
> 
> Signed-off-by: Marcos Paulo de Souza <mpdesouza@suse.com>

Looks and works fine to me:

Reviewed-by: Petr Mladek <pmladek@suse.com>
Tested-by: Petr Mladek <pmladek@suse.com>

Best Regards,
Petr

PS: I am going to fix the typo mentioned by Joe and push this patch.
