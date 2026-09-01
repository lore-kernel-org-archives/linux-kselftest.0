Received: from mail-pl1-f169.google.com (mail-pl1-f169.google.com [209.85.214.169])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2EAEF3A8724
	for <linux-kselftest@vger.kernel.org>; Tue,  1 Sep 2026 15:34:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.169
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788276860; cv=none; b=cwiWzOzQXSgmxZC1QMTMvwfYwJDvAzrIv0zlyfM1zWU0yrAw04nHDI5gjeizbYba38c6xkdhzpfV+nLgVGMUpksP7fwrI35eQOmJ7CqekO5NoQLJqgTq+GlWtOxEy7g9AxahH9t8TeIY4z3L3oVgEmzMsTcSfowxZREhaY5oKYA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788276860; c=relaxed/simple;
	bh=iKD8ulE/7j+UTASizItruNbYincTMOqWILEWStCXBq4=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=AsK/9JoMkJdAKX790UwBwQt/hLF1KClnQE9hnr+ODoKZ/mlFDBcJavajXwc1wSGsXAfwW1I/Tf1i3kS7vNpcAcvBT47iHDbd+Rki1/QUsYMyzTWMg8mUUW3smsIkYfWUvdmiT9kUdQhgA/tZMkd7Fkto9w5b1/Z8DEiFBvy4teY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=dama.to; spf=none smtp.mailfrom=dama.to; dkim=pass (2048-bit key) header.d=dama-to.20251104.gappssmtp.com header.i=@dama-to.20251104.gappssmtp.com header.b=qqMjHbWa; arc=none smtp.client-ip=209.85.214.169
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=dama.to
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=dama.to
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=dama-to.20251104.gappssmtp.com header.i=@dama-to.20251104.gappssmtp.com header.b="qqMjHbWa"
Received: by mail-pl1-f169.google.com with SMTP id d9443c01a7336-2d9db539a54so3536425ad.0
        for <linux-kselftest@vger.kernel.org>; Tue, 01 Sep 2026 08:34:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=dama-to.20251104.gappssmtp.com; s=20251104; t=1788276858; x=1788881658; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:mail-followup-to:message-id:subject:cc:to:from:date:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=tXnScza6YsSOijKy2kCYJ4+3czNea5Mz9Jc+EvPjn4U=;
        b=qqMjHbWaSN/JwOsM1TrtG409Y9rK7KlGz8wudN60+jbOef/FTEUJRUePrQF1REROdQ
         0tStiUPDUkrkNinhPo7DYnOArZRT7xleNxrYbvzp2eppIlczslElBrGDrk9UKjB1ry50
         3pzesgWzijXF1McdrUwmn0aun7Nr+VhYgs1Bk2JgOPWKr41ikROMU7mFnLqavniVKblN
         hrtmEXQZ9JK81JaJcWGfZGAIwSiggUMB5h6p4JqOinc9alM66A0yDCbO5eJd6+QJr/cK
         iWL1HdU9OsiWDqhIFxPFvIpBT6PHqSx9Ky6BZD0NiPmbBwuojr8voBvyxq2jlKcQ7oRH
         5d2Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788276858; x=1788881658;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:mail-followup-to:message-id:subject:cc:to:from:date
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=tXnScza6YsSOijKy2kCYJ4+3czNea5Mz9Jc+EvPjn4U=;
        b=RP2PPlPlsghHybra5FldeHWe94tbpd0jrl0Av6AOamOC9vbRskPq9FlHAcr9dljdMc
         xhnLr5V5qv+q/l6uvibyR3jTP2pFwMt3dXzZaHR/voN+pwWKPBq03uKesf3OW962K5EA
         32/unFIzCpVx95sczJEyb90TZrlwvQDAz046pgh1du2yJehAsRIwCIRidV+Yme1R3lH3
         HwJXgeau6/3dCUA+D84THYdfwXRfdUoVgaMapq5h3KOcA6g+Sz0HQnPK9jFTzC/TGBn9
         tsOPXq6+Dcpx579e76F/OWWeWTjH186wB6gXXzrAzDJx7x7se4L20yty4dJ92mO3qIrd
         KOQg==
X-Forwarded-Encrypted: i=1; AKwUvBz5LdvevFVU9nDKm8jbj5rQyzBau0GodNnoaHF8JuAknM2e7W4PTkyhX0Q+fDWmHr1EijGZpLrZ+Ds1skScwR4=@vger.kernel.org
X-Gm-Message-State: AFuF++l1Wlxn9g2/x+5bbuYlCaQD6BrKBq+5h2FSpZdhXAmZ4VLalvD7
	AvVWfe/XmdbVPnC3F+9TdxVQuMNN0d2trV6up4x89wuRNv7WaKM3NjY8Wlh4RX/hHfU=
X-Gm-Gg: AYBFou0C9nxgiAP6LPwntZIjpCzzlOz9WFxjl1FHkdmK8ovMzlN5p9CCsGmNFKVYB1b
	l/zyAw+i+RG9Ds5vSSv8/Lo651lLCxefHm+TihVhWf8F+uligUkw7/3PuEYVIclFlZHXFhxyzRS
	BxIBwbvgPG1VpJQhY6C0ZTR56SFNMmkisb3YTEFzRYcDm/7KAudw3F7/LkaGE35PO+RZCDghqY/
	flww2myakXldsoypanEYPAUqk/Qekyoblxh22pijBsD+4UQSJ0Va7iXE+4eaAhGMQ99kc4oyj7W
	kJZ09TBiZnjTwXhOFjBsibVup+PkMP86QjK1Hqsi9Ya13vQe7/0145s/NgK08aoU9CZudtv6Axp
	mg/WmXwoSELZgOdYE/uAsNReoY11RfD9UNU/9x8myx/anfovzMrKcrCMLrYTya0z6kGLPFT8VCw
	6wj+py4dpglBlrRKzwaIlXT3OogGLkxuMpg0SSaeS4Hg==
X-Received: by 2002:a17:903:1b30:b0:2d8:d4d3:da4e with SMTP id d9443c01a7336-2d94a90efd6mr156260925ad.18.1788276858223;
        Tue, 01 Sep 2026 08:34:18 -0700 (PDT)
Received: from localhost ([2a03:2880:2ff:73::])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2dadd39e9cfsm974055ad.34.2026.09.01.08.34.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 01 Sep 2026 08:34:17 -0700 (PDT)
Date: Tue, 1 Sep 2026 08:34:16 -0700
From: Joe Damato <joe@dama.to>
To: Jakub Kicinski <kuba@kernel.org>
Cc: davem@davemloft.net, netdev@vger.kernel.org, edumazet@google.com,
	pabeni@redhat.com, andrew+netdev@lunn.ch, horms@kernel.org,
	shuah@kernel.org, willemb@google.com, petrm@nvidia.com,
	linux-kselftest@vger.kernel.org, noren@nvidia.com
Subject: Re: [PATCH net-next 2/3] selftests: drv-net: split gro.py into one
 test per coalescing mode
Message-ID: <apbweF6mzkEXLPbu@devvm20253.cco0.facebook.com>
Mail-Followup-To: Joe Damato <joe@dama.to>,
	Jakub Kicinski <kuba@kernel.org>, davem@davemloft.net,
	netdev@vger.kernel.org, edumazet@google.com, pabeni@redhat.com,
	andrew+netdev@lunn.ch, horms@kernel.org, shuah@kernel.org,
	willemb@google.com, petrm@nvidia.com,
	linux-kselftest@vger.kernel.org, noren@nvidia.com
References: <20260831163734.1121891-1-kuba@kernel.org>
 <20260831163734.1121891-3-kuba@kernel.org>
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260831163734.1121891-3-kuba@kernel.org>

On Mon, Aug 31, 2026 at 09:37:33AM -0700, Jakub Kicinski wrote:
> gro.py runs its full set of cases three times over - against SW GRO,
> HW GRO and LRO. It's our test with the longest runtime. The 318 cases
> take 12m30s on mlx5 with a debug kernel.
> 
> Bumping the timeout for all tests feels wrong when we can so easily
> split the GRO test by execution mode. Shorter runtime also helps retry
> just the failing portion / mode (we retry failing tests to try to
> detect flakes vs real failures).
> 
> Move the main logic to gro_lib.py and add one program per mode -
> gro_sw.py, gro_hw.py and gro_lro.py, 102 cases each. Move PPPoE to
> a dedicated test. It has been tacked onto the tests in an ugly way,
> and it only runs against SW GRO anyway.
> 
> Note that unfortunately this will case a rename of all test cases.
> The mode moves from the case name to the test name
> 
>   gro.py test.sw_ipv4_data_same
> 
> becomes
> 
>   gro_sw.py test.ipv4_data_same
> 
> Signed-off-by: Jakub Kicinski <kuba@kernel.org>
> ---
> We also saw 20min runs on gve, but those may have been errors.
> The GVE runner is very flaky and even when it runs it doesn't seem
> to execute the gro test. Perhaps because the test times out?
> ---
>  tools/testing/selftests/drivers/net/Makefile  |  9 ++-
>  tools/testing/selftests/drivers/net/gro_hw.py | 14 ++++
>  .../drivers/net/{gro.py => gro_lib.py}        | 68 +++++++++----------
>  .../testing/selftests/drivers/net/gro_lro.py  | 15 ++++
>  tools/testing/selftests/drivers/net/gro_sw.py | 14 ++++
>  .../selftests/drivers/net/pppoe_gro.py        | 46 +++++++++++++
>  .../selftests/net/lib/ksft_setup_loopback.sh  |  2 +-
>  7 files changed, 129 insertions(+), 39 deletions(-)
>  create mode 100755 tools/testing/selftests/drivers/net/gro_hw.py
>  rename tools/testing/selftests/drivers/net/{gro.py => gro_lib.py} (92%)
>  mode change 100755 => 100644
>  create mode 100755 tools/testing/selftests/drivers/net/gro_lro.py
>  create mode 100755 tools/testing/selftests/drivers/net/gro_sw.py
>  create mode 100755 tools/testing/selftests/drivers/net/pppoe_gro.py
> 

Reviewed-by: Joe Damato <joe@dama.to>
