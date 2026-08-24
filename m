Received: from mail-ed1-f44.google.com (mail-ed1-f44.google.com [209.85.208.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AF93B3E6DC8
	for <linux-kselftest@vger.kernel.org>; Mon, 24 Aug 2026 06:48:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787554086; cv=none; b=ooE673nqZpSjh8vckCdmwz6yjyVjqPmyW/PXxarQP5oPUQQamgluASKjBvnQWU2GynFwWLKYOMtw+Zwly/fWCOEcDBN9uTGHid/N1HlqLi3n4esoGCkPMRQa6cb/IHzqV2hAFVb0VPs0fXqK0JSE+fAkxkJ03d8C9HHVNcDb4XM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787554086; c=relaxed/simple;
	bh=gsh3FwRHXOEoHxf9WDBD7FV63wrPPPV+1wXS/k/EffQ=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=n3Y9mKnbIBW78dMZkhiMayu3o4EHH85uayfGS42N3RaQJrMUt9DZXdmveYqDHijNt1k0lpSqCUr+ptNoIj4djWkg11wosoXABmorR9/U/kGwcycjHb9C6JZ4VZ5iuPf2ubEUKcayX46Vl1BYqtl/iMS/KMplY26p+U44SB6OhyA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=W+Yo88Zs; arc=none smtp.client-ip=209.85.208.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="W+Yo88Zs"
Received: by mail-ed1-f44.google.com with SMTP id 4fb4d7f45d1cf-6a0de062db5so5465687a12.1
        for <linux-kselftest@vger.kernel.org>; Sun, 23 Aug 2026 23:48:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1787554083; x=1788158883; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=ROwzLFkAwtTrfltmkckqtugY5BGlQdk0vedqqolGcRo=;
        b=W+Yo88ZsmjtZ33a3NWARzSQAs8oRKliSMcDl035Dj4EH0RPi7F9Lh+8PsZT/cny/OX
         SznLq5BPLQ4d3f909/cEABZ/WRiG7psRIBko6BPFtqA7t38pp5cclj5aLFaQEl6lHxZD
         4nXj2ykgNN8/2qrAKo88QQZG7ljJD6atBEJjeNPyuBpY757iMjZMXKw5ox80druMfUlR
         dzM8qFLbECR12OFMuFExM5OYSITrEAEss3APkMkP/36mApq3bErzSG95nEAfthdASp+l
         9romZtb6a2Re4VvAjNv3qM1r7SqyKPCaasxMODV6pXPzRXo5lNgXPl7RDWAHLV+PPbDc
         7OrA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787554083; x=1788158883;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=ROwzLFkAwtTrfltmkckqtugY5BGlQdk0vedqqolGcRo=;
        b=M/4DCX/RNedwFeABdlGp1H+PX20PZH/qaRxcVy9GThv8/DD8fkxossn6KJFNwWEM8n
         6B7IU12jVAjmejsXLycUsD+Ul1OqsOq9y7dEaqpi+rrlabc9iebiVw8QhSdOrQGg0K0x
         LhG1o2SMI7Lz3CCI8+hNAk9FOZ9XgQqp/04zto2t4ULY9aprhaVE5LSifCkqPFxVx6p4
         GtwJu4/GylOQxa5FwiASN6c2v5dL+woN7N3FKLIPRTACBDEEsJLm0AXppMWOkHhrfMwp
         kUaZYPXtOHQQSeyoOaXG2WM6YRzR2T1Xm+5aPoAHvPR2BLseTI2xm3fhbcwLyrDpdzft
         b6yg==
X-Forwarded-Encrypted: i=1; AHgh+Ro+o1Cvy5nz318TAoxY+8iZq5KveIc0lldQvXNLKxYRUPst68PmZFLvVrImXkZdnHNENqgUSoEg0UnSz2ZMGWM=@vger.kernel.org
X-Gm-Message-State: AFuF++nQIXrSQKnNZpPF3tkS3r/sqExLpZS0fRE3TB8Kzd5EFWjeLXYz
	Mzvpx5T9bHxO9pxeDjXLcmY5+VQRYAh1IXrAKmsICksnRXY3+E2ji+6C
X-Gm-Gg: AR+sD111M914u8jZqDepzFjDfMcECiHaZIXlfV67swV6G+Tl/sQ311dalS7PLkfQsY7
	+A9H5BfVq2XTPYVZ9sQcUEl6Tg3yN7su4oLEUoF+CjBJkg9cKLD+3tpxoSujvso7vjjbwyKMO08
	IMLlJYxfj0tLSo3uVigPC5p6gWu30cI2mwaGpSSIbXrYEpwewy3llQlmMT9wnQwIC66gCnJLi9Z
	Sd9JoQLtDTYGYl8F1JRRTnLw8G+fIcU6pOfzNadlMjllorGSjWYtiiKJfoa52H3K8Icwk8RelBJ
	hYI9g2KqpUgrM+aG53Y3Y33IbmxTpfKFBEwPQ/eKhkKS1jkWySn03DKCHg4MgqsI2Gwyi+0mZ6C
	/QBf5NFW+SV+YyOjrD4P4bsQaLkwr95dhoMnauwhoxc+Lj1nLdZR04W1Iesk3MXWF1SQANwhTAe
	5nbizyD5mPjcD9m9OgY50IvjI2SOPgJ8/VvsBlXnImGqAI8+EXDzwpDwDpNyq89we9
X-Received: by 2002:a05:6402:4498:b0:6a1:44c8:edc4 with SMTP id 4fb4d7f45d1cf-6a42f21ee3amr8021391a12.12.1787554082677;
        Sun, 23 Aug 2026 23:48:02 -0700 (PDT)
Received: from mobilestation ([2a00:1fa1:c28e:9a7a:6251:3e2d:4f32:3e5e])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-6a59e1cdbe9sm7097133a12.24.2026.08.23.23.47.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 23 Aug 2026 23:48:02 -0700 (PDT)
Date: Mon, 24 Aug 2026 09:47:57 +0300
From: Joseph Steel <recv.jo@gmail.com>
To: Ovidiu Panait <ovidiu.panait.rb@renesas.com>
Cc: maxime.chevallier@bootlin.com, andrew+netdev@lunn.ch, 
	davem@davemloft.net, edumazet@google.com, kuba@kernel.org, pabeni@redhat.com, 
	mcoquelin.stm32@gmail.com, alexandre.torgue@foss.st.com, shuah@kernel.org, 
	joabreu@synopsys.com, yi.fang.gan@intel.com, jun.ann.lai@intel.com, 
	linux-kernel@vger.kernel.org, netdev@vger.kernel.org, linux-stm32@st-md-mailman.stormreply.com, 
	linux-arm-kernel@lists.infradead.org, linux-kselftest@vger.kernel.org
Subject: Re: [PATCH net v2 2/6] net: stmmac: Enable double VLAN processing
 only when supported
Message-ID: <a77cwrdtjmzi6zextnlg7llrqh56behj6zl6jkon4ta6gwnbdj@unwirtt36qwn>
References: <20260821170959.79708-1-ovidiu.panait.rb@renesas.com>
 <20260821170959.79708-3-ovidiu.panait.rb@renesas.com>
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260821170959.79708-3-ovidiu.panait.rb@renesas.com>

On Fri, Aug 21, 2026 at 05:09:55PM +0000, Ovidiu Panait wrote:
> stmmac_vlan_update() turns on double/S-VLAN processing whenever an
> 802.1ad VLAN is registered, without checking whether the MAC actually
> supports double VLAN processing. That capability is reported in
> dma_cap.dvlan.

This is not true. S-VLAN is never reported by the dma_cap.dvlan
feature flag. Double VLAN tagging and S-Tag VLAN features are fully
independent.

-Joseph

> 
> This was found while investigating a separate bug in the double VLAN RX
> stripping path. The outer 802.1ad tags were unexpectedly stripped by the
> MAC (because the ESVL bit was set).
> 
> Check dma_cap.dvlan before enabling EDVLP/ESVL/DOVLTC bits, so that double
> VLAN processing is enabled only on supported hardware. Also, advertise
> NETIF_F_HW_VLAN_STAG_RX and NETIF_F_HW_VLAN_STAG_FILTER only when
> dma_cap.dvlan is set.
> 

