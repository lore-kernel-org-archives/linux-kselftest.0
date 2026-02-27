Received: from mail-pf1-f169.google.com (mail-pf1-f169.google.com [209.85.210.169])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 18CEE2C0298
	for <linux-kselftest@vger.kernel.org>; Fri, 27 Feb 2026 02:31:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.169
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772159475; cv=none; b=rGSUGiTW6tkmcTiTtC8e5hWXmln3fMMxVpm7n6tHIB2Rz1+i8PtjYXtzTw58vmmtdHR8xCT7f7hgcJdHk3w59YyGTSfzpS2xn19L88et2RqNZL3XI6/KZeSfrWtxj/njnP7cLeP5jwkFCMMZGhe5RS/znJsIXBoV6OHw/u2gEG8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772159475; c=relaxed/simple;
	bh=4JHlwT/Yu7ajcqtEUyhud7CE8o2J493+1Itcav9ilXk=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=LJEZAZrFeCBFLAjyIw+YVdaBmxQYpfmmMkvzlpAsfTOlcUd2H9fG79hqt5raQGfy9XDeBhfManHkrkFoMW/z809Y7rTyWh2sxDKpa8fypaGxqWohWCU5L8LVbXCeMCHbVNcU2SviZhkHA6GRaXRqrKlXhF7IB2HgFbMIM7JalDE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=dGHRCG76; arc=none smtp.client-ip=209.85.210.169
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="dGHRCG76"
Received: by mail-pf1-f169.google.com with SMTP id d2e1a72fcca58-82746ed8cb1so539459b3a.3
        for <linux-kselftest@vger.kernel.org>; Thu, 26 Feb 2026 18:31:13 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1772159473; x=1772764273; darn=vger.kernel.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=QWTjg9cfCivxy21OkK4YMlplEZZRzQTGceSoJr86ceY=;
        b=dGHRCG76hRvK7Wrlw0HNSvnJ4sFueIKDAQKc511NJZMqyIgdfvBrzjm3RsAl8G9AyQ
         Pjv2Siu6wqTmSpWesahJBdshr2VzRQ4iWjAkPvh+OpB4Kzqq05bRBoP3YMUSNhg7WaQk
         Vjt5t9KpFZtFL5ee7noyv8xwyk2QCs4KWsLjJTxKqQLreKE0hJXby1H5DsbHgJavBPvS
         cfanH8W713uyQAKFCP1UxU86Am3N7FlAZ35wEKGseXwy/rKvRv4Cr8sKVnfGCsyVMTjR
         W4J90lKtlbkYLpzlUJNMywPOziQfK0aZLF2o5vDsj+LulSjLIAGZouM4lppUwhMEjW10
         nPzg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772159473; x=1772764273;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=QWTjg9cfCivxy21OkK4YMlplEZZRzQTGceSoJr86ceY=;
        b=qqjcxE7qjQtkZRw56O7/hfYmgTmP8sVmPUQZyTA2VuCQ30M44u6ysoX+pLAyZuCN8K
         LNyUXAeULGeRsA583nnoIPitAYyU0WLgIKEJdVwl/LFjNw84JkFaco7HEM0XjdVKHuh0
         9GtCGz6RsV8DyvHEhDT6qlu85Kk6u3rerdJJdlfjqQxQIrJHrMuxHzV0ijfhtUr21xgS
         ZGTezRca3BDfYL4axwvmJDubO6Io/1HiYDAClyqdOsPI8to7NKk166n31RzIgV8FpGuP
         vmqobkVx6OGGbU6B8aRVDqNAE1s3gowojWfydSBpOdHeEgVxo9Z2K4hC1BDaW04BEm4G
         ACoQ==
X-Forwarded-Encrypted: i=1; AJvYcCXydDD9v4iqCmua1Q3K68YFwdWSfVEvwogPOWXEaxqiPn0YkGxQ+GZmjHoETRmBjDEElXtnhO3A2rG+RHNf7FY=@vger.kernel.org
X-Gm-Message-State: AOJu0Yzrdnn0Xdkrx3GY9gDSr+AXDLnYrfA9wF4wWXhntq5ZTczQenNx
	9r8K+xfKyXgk/FH+kvZGuS/bm4vv94bGNvKpBf+HzBX5ODmtVU/rypIi
X-Gm-Gg: ATEYQzw/5jcQb/PcwMfDoxzWtkZ+9eunxq/Zg6UWlhZjXUaxwji2z2jcDi5hcHukUHw
	jEXNhDPwt4dVxa5677GaDY7HOUUGnLC/ghBiRrFl98rkLUAY+rjLeaz/+tc+Y/M85+EoAuUk9Ol
	Ju8nuOziRD8LZOS6GhZfBDw/1q7OyEndeLZ3MCPpTCGwij5j69Dz7eLgxcgv4ZlGXdEXeE4dHEh
	nhTAEGM+vnzZqziW78w+DkVPH9/5n6Gd9Rz8DNE9SSwme6GNlv6MCQnZsu0n9rPAKrG+kw+Liwy
	xd9vMMfZV5f8RlUtqHpS7aYPzJsF/PWyvYZ4HhsVf25aETOkt1NwNX6JRYqzQ6zMrBhHBjcuUCO
	TN/SfA+5r5lSv9TsYiNQjy3O305dt5rAlkTGV9Sz9AQPZ83/jenecys3oA8gcNGblEh8OavFuWD
	adXYGTqJaYuQWzkOlFpiYBjhZbdOQ=
X-Received: by 2002:a05:6a20:a12c:b0:38b:e68f:4648 with SMTP id adf61e73a8af0-395c39e0edfmr1273869637.14.1772159473315;
        Thu, 26 Feb 2026 18:31:13 -0800 (PST)
Received: from fedora ([209.132.188.88])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-c70fa5e4abcsm2970390a12.5.2026.02.26.18.31.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 26 Feb 2026 18:31:12 -0800 (PST)
Date: Fri, 27 Feb 2026 02:31:05 +0000
From: Hangbin Liu <liuhangbin@gmail.com>
To: Jay Vosburgh <jv@jvosburgh.net>
Cc: netdev@vger.kernel.org, Andrew Lunn <andrew+netdev@lunn.ch>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
	Shuah Khan <shuah@kernel.org>,
	Nikolay Aleksandrov <razor@blackwall.org>,
	Mahesh Bandewar <maheshb@google.com>, linux-kernel@vger.kernel.org,
	linux-kselftest@vger.kernel.org
Subject: Re: [PATCHv3 net 1/3] bonding: set AD_RX_PORT_DISABLED when
 disabling a port
Message-ID: <aaEB6X6WPs7EBM33@fedora>
References: <20260226125331.28147-1-liuhangbin@gmail.com>
 <20260226125331.28147-2-liuhangbin@gmail.com>
 <942584.1772155015@famine>
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <942584.1772155015@famine>

On Thu, Feb 26, 2026 at 05:16:55PM -0800, Jay Vosburgh wrote:
> Hangbin Liu <liuhangbin@gmail.com> wrote:
> 
> >When disabling a port’s collecting and distributing states, updating only
> >rx_disabled is not sufficient. We also need to set AD_RX_PORT_DISABLED
> >so that the rx_machine transitions into the AD_RX_EXPIRED state.
> >
> >One example is in ad_agg_selection_logic(): when a new aggregator is
> >selected and old active aggregator is disabled, if AD_RX_PORT_DISABLED is
> >not set, the disabled port may remain stuck in AD_RX_CURRENT due to
> >continuing to receive partner LACP messages.
> 
> 	I'm not sure I'm seeing the problem here, is there an actual
> misbehavior being fixed here?  The port is receiving LACPDUs, and from
> the receive state machine point of view (Figure 6-18) there's no issue.
> The "port_enabled" variable (6.4.7) also informs the state machine
> behavior, but that's not the same as what's changed by bonding's
> __disable_port function.

Yes, the reason I do it here is we select another aggregator and called
__disable_port() for the old one. If we don't update sm_rx_state, the port
will be keep in collecting/distributing state, and the partner will also
keep in the c/d state.

Here we entered a logical paradox, on one hand we want to disable the port,
on the other hand we keep the port in collecting/distributing state.

> 
> 	Where I'm going with this is that, when multiple aggregator
> support was originally implemented, the theory was to keep aggregators
> other than the active agg in a state such that they could be put into
> service immediately, without having to do LACPDU exchanges in order to
> transition into the appropriate state.  A hot standby, basically,
> analogous to an active-backup mode backup interface with link state up.

This sounds good. But without LACPDU exchange, the hot standby actor and
partner should be in collecting/distributing state. What should we do when
partner start send packets to us?
> 
> 	I haven't tested this in some time, though, so my question is
> whether this change affects the failover time when an active aggregator
> is de-selected in favor of another aggregator.  By "failover time," I
> mean how long transmission and/or reception are interrupted when
> changing from one aggregator to another.  I presume that if aggregator
> failover ater this change requires LACPDU exchanges, etc, it will take
> longer to fail over.

I haven't tested it yet. I think the failover time should be in 1 second.
Let me do some testing today.

Thanks
Hangbin
