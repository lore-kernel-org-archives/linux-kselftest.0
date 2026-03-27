Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D56C73976BC
	for <linux-kselftest@vger.kernel.org>; Fri, 27 Mar 2026 12:58:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774616331; cv=none; b=Irra/176eCPAqDCaJMggIKv0EynZvQNaSkz/nbDlKlD4Q5c+86gER2p6dE7DMQ8V85uP31/uQVKaI74lIdotrLcMZ/rPK1KeIuPJzMbQyqXptj+dr8mFXWtTdlBICBemgWqjNB8BOVHxvjVRAUgKZprK03dFmIuGZ2BsPEZh3ng=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774616331; c=relaxed/simple;
	bh=T/MncoWZVwS48wLOvcaP5pmO5KoCebx4I8w5SbYrRow=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=r/AmGjN0Wkj/QkjxzqZsXevRkPR/wNllFK5A3Mv/kDfTPGTuxM1gPyaFrpOgDQbHGUIRQtsaQDFBmQC/PWuCzl/Zj3yDGyvhWg69GGKKg793cAv+3AQJzHVhresvklHJ2LRPyRBQgQ3qKUN0neEhAqZBarz7UhtFgzfPUtR1WHc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=eHx/pxhM; dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.b=pnMWSKA+; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="eHx/pxhM";
	dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.b="pnMWSKA+"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1774616328;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=Xhz+6dozSsvrLdg2FUPvcHN2R/yxft2xWhen9c3tayI=;
	b=eHx/pxhMv6g/Wkz6PTOdRXWrxYEQVrePQDEou4SS2U1/0Qf7Z3+fZUrUa68/2aJ1Vpg179
	qoWBUNNk1SeoyhJewBKZgjh8WpTnJRG6NAzgdkrhDwpjX14LSU67mGHEtuzuPCzJLg8Mbr
	VPQXUp0+yl6Tu+UHtmCTdAWAnGq8BkA=
Received: from mail-wr1-f71.google.com (mail-wr1-f71.google.com
 [209.85.221.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-237-N48RnwIiM3CA3DUr_8JKnQ-1; Fri, 27 Mar 2026 08:58:47 -0400
X-MC-Unique: N48RnwIiM3CA3DUr_8JKnQ-1
X-Mimecast-MFC-AGG-ID: N48RnwIiM3CA3DUr_8JKnQ_1774616326
Received: by mail-wr1-f71.google.com with SMTP id ffacd0b85a97d-43b8f23bdc7so734193f8f.3
        for <linux-kselftest@vger.kernel.org>; Fri, 27 Mar 2026 05:58:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=redhat.com; s=google; t=1774616326; x=1775221126; darn=vger.kernel.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=Xhz+6dozSsvrLdg2FUPvcHN2R/yxft2xWhen9c3tayI=;
        b=pnMWSKA+hGjYZ9CoXOfasqoeJE+S767+gz7suvfWUIH0aNICqAJklTfoA2r0sPxt+O
         7PJwuiX+4eH3ORnI78TaUvzHrzoHlSgn3I7bH0fvr+qzdoH7NM47L3H8iIhP7BG+65mn
         9CWtFwv+jt1P0rdp0tuIv1TOIi4nKlinUqOV5eZ/SAI0uaCwMswZ+vWOUYp4+/7JwGbM
         cpKW2cUmjODk0RnKxbyHSEUtfCSSmQNkBxjLVDwvvmxyELOnKkNbyWBPK9VYCdoANI7a
         e2hK7f5nXfa3V/ppsfkhvJSbMPudcVwuH2Em29IWG7esY/aKkKnabW8FN10M51rfJNyN
         JEjg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774616326; x=1775221126;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=Xhz+6dozSsvrLdg2FUPvcHN2R/yxft2xWhen9c3tayI=;
        b=CHT3EfxQKDS/SQS6zAABXJAyRain0LIx3PNz0UM8e5Y9CSpplyI84yaGPoVjKl4iOu
         tDshHBASvvK6hhFCJREVpfkOaYjxfzm3TqHkTUVej7UQWe0dRMR3wC7xu4mCDe81uvGz
         lxlL3pgRzJ8hvDytuDf1gjOMjo7hnI8fCQAyz2/YHr/YlEh8P3XMphPq/I/01rIARfxF
         E7BuiHw09xyALCkPXASFOiyajYr19YFLXHwc6Ta6jrViWe10tZ8VW8dEHFLs/Yn1TpMG
         SNI9hzl1zxagwPWfuoELbeBlnUSHZmQz0j2p7reemDLY1KKYA6GzA+sRGw65AbWgEcAO
         MskA==
X-Forwarded-Encrypted: i=1; AJvYcCVte1vj2vzAtr2VOGDAqq5lPJu/WGSJUT248B4ZTWokQvyGQu+xvJn8Mtvd00fjAbKLzJNDr+xKPIPfAqzUtxM=@vger.kernel.org
X-Gm-Message-State: AOJu0YwQ2VRDdCCk8NGSkFY6mupTnnr5+/UwX1d5HD1w71bx0jTuEV6H
	KwgP+3PcXrhEScO9V2YkpvwDMGMEJ72QJG1jTPr/MAuFED6w24DY5Y+847WKYv6EHpphMEt/+af
	o0fmD696dzF5sZBQNhPjnJznkYRRgUcq3XDX1uJFc54ZS7/+W4bcjp8uXlLwi5001ZSDbWQ==
X-Gm-Gg: ATEYQzyzuAmkuhf+Jk6MkmvistnkSI+ofQ/eZX+Dg1nSQbmFE4orzMFkgF0ADL1FtWr
	qtcTk/b91N72JM6sqBip1yXkr6P+jhOzf2YNbfg3bEEeTB+ARs+k2H7Iv0gQVAOCvKjbSrMECNe
	O3LredOwV4aGw7dU0kwfsi6XmY5rdj0vR4mueah9ggNjFnJyJSPmR8oMAhDKi2Z1Yk0/iMim5AJ
	1aUeXgdqrtmXmUe20Lhx+W8Gpvzc4UYKJhVuVh6KbAiDlMS0RQmWC+727CoK/LrvC0tAczpeTqB
	aQJGvlDQVvb2y+VkuHSYiRUH9lRhTcdAc3t3iz8P1P1G62OoGzgIZpINJHsnbNo89Zx4aeKA7P0
	obTvkExw0vaHMzxXK07TomwKKfWROZKdKKYD6vDfoOEMgq7zv83w7Iv23VFq0i42ybsRVV903cw
	==
X-Received: by 2002:a5d:6107:0:b0:43c:482b:afc1 with SMTP id ffacd0b85a97d-43c482bb099mr289820f8f.36.1774616326285;
        Fri, 27 Mar 2026 05:58:46 -0700 (PDT)
X-Received: by 2002:a5d:6107:0:b0:43c:482b:afc1 with SMTP id ffacd0b85a97d-43c482bb099mr289762f8f.36.1774616325794;
        Fri, 27 Mar 2026 05:58:45 -0700 (PDT)
Received: from debian (2a01cb05923c9a002e69015071700bd3.ipv6.abo.wanadoo.fr. [2a01:cb05:923c:9a00:2e69:150:7170:bd3])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-43b919dfb54sm14881269f8f.31.2026.03.27.05.58.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 27 Mar 2026 05:58:45 -0700 (PDT)
Date: Fri, 27 Mar 2026 13:58:42 +0100
From: Guillaume Nault <gnault@redhat.com>
To: Qingfang Deng <dqfext@gmail.com>
Cc: Sebastian Andrzej Siewior <bigeasy@linutronix.de>,
	Shuah Khan <shuah@kernel.org>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
	Simon Horman <horms@kernel.org>, Felix Maurer <fmaurer@redhat.com>,
	Antonio Quartulli <antonio@openvpn.net>,
	linux-kernel@vger.kernel.org, linux-kselftest@vger.kernel.org,
	linux-ppp@vger.kernel.org, netdev@vger.kernel.org,
	Paul Mackerras <paulus@ozlabs.org>
Subject: Re: [PATCH net-next v4] selftests: net: add tests for PPP
Message-ID: <acZ_AgXhJVyUT_yj@debian>
References: <20260326021642.29170-1-dqfext@gmail.com>
 <20260326081304.xKa7-s_1@linutronix.de>
 <CALW65jYdzn_rZWa2zwYd5J+Gd=kyaGMsVFyX0fMJfKfgULMO6w@mail.gmail.com>
 <acZp3gRUqVIbw9yb@debian>
 <CALW65jZNi3oA7V7at_Jr5Vr4AdL03JYdA9WeK5G7cNr-XS2Bvg@mail.gmail.com>
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CALW65jZNi3oA7V7at_Jr5Vr4AdL03JYdA9WeK5G7cNr-XS2Bvg@mail.gmail.com>

On Fri, Mar 27, 2026 at 08:39:11PM +0800, Qingfang Deng wrote:
> On Fri, Mar 27, 2026 at 7:28 PM Guillaume Nault <gnault@redhat.com> wrote:
> >
> > On Thu, Mar 26, 2026 at 04:26:23PM +0800, Qingfang Deng wrote:
> > > Hi Sebastian,
> > >
> > > On Thu, Mar 26, 2026 at 4:13 PM Sebastian Andrzej Siewior
> > > <bigeasy@linutronix.de> wrote:
> > > >
> > > > On 2026-03-26 10:16:24 [+0800], Qingfang Deng wrote:
> > > > > Add ping and iperf3 tests for ppp_async.c and pppoe.c.
> > > >
> > > > Oh thank you for doing this.
> > > > I haven't look in detail but this cover the "invalid loop" cases that
> > > > ppp tries to catch?
> > >
> > > By "invalid loop", do you mean transmit recursion?
> > > https://lore.kernel.org/all/20250715150806.700536-2-bigeasy@linutronix.de/
> > >
> > > AFAIK, this can only happen with PPTP or L2TP, which were not included
> > > in this patch.
> >
> > The problem was originally reproduced using L2TP, indeed. But I guess
> > that it could also be reproduced with PPPoE by using a UDP tunnel
> > device like VXLAN (like sending a packet through a PPP interface,
> > handled by PPPoE, running on top of a VXLAN device, that routes the UDP
> > encapsulated packet back to the original PPP interface).
> 
> Yeah I've thought of that also. It can technically happen, though
> there's no practical use. For self tests purpose, I may just add the
> recursion test into PPTP or L2TP tests.

Yes, no problem.

> Regards,
> Qingfang
> 

