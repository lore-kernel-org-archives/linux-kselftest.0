Received: from mail-pj1-f45.google.com (mail-pj1-f45.google.com [209.85.216.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1FB1A382F32
	for <linux-kselftest@vger.kernel.org>; Mon,  6 Apr 2026 16:36:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775493381; cv=none; b=cHmpUUdW0MPBOQVBJOt9z5d5CmWmuEGaQlSQPCCjgosd62cVh2f0X6vLeLzUhjTExGjmOA+ppaoUNXX3RqXZQ29XQWNxzrOtLO1s8Ozu3Wcaf9/juyH0pohmIIoysv/9Ixn53iCRm4TEcXBaX66nxrnXiJCBB/YY7pSW60se4ko=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775493381; c=relaxed/simple;
	bh=rajS4uc0L0+t10VW0XFFtH22sRejpovKT5Dfo/1dm9M=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=ek+vCXFelni7VPCO2i7Dql0srGPbe7ovTA1hGZfi49LyJim8skhmQWhlVg33F3EYPn0uZoZDccbF1T76cmGtg8ZfsV9Al2TiIYiDsupkTDRXs6t/X6Qa5LNZd/q6kqtBsnzHw+Jad6UFSyYIPrpJKdjfhYUrNMwg6NLrTUEHylQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=dama.to; spf=none smtp.mailfrom=dama.to; dkim=pass (2048-bit key) header.d=dama-to.20251104.gappssmtp.com header.i=@dama-to.20251104.gappssmtp.com header.b=GpUOx00f; arc=none smtp.client-ip=209.85.216.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=dama.to
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=dama.to
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=dama-to.20251104.gappssmtp.com header.i=@dama-to.20251104.gappssmtp.com header.b="GpUOx00f"
Received: by mail-pj1-f45.google.com with SMTP id 98e67ed59e1d1-3590042fa8eso2933296a91.1
        for <linux-kselftest@vger.kernel.org>; Mon, 06 Apr 2026 09:36:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=dama-to.20251104.gappssmtp.com; s=20251104; t=1775493379; x=1776098179; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references
         :mail-followup-to:message-id:subject:cc:to:from:date:from:to:cc
         :subject:date:message-id:reply-to;
        bh=oiCiCfseGuUt36OVkBJsO+mSwQagEkjvZ4GHrhi5KdU=;
        b=GpUOx00fx1p7AGHO45fVjJK205Xl1LYFrUt8QOMEhCZAvJSQOQ0E90UqzCj3VtmOir
         gce5XjKrKNLtHqwwFU+dKNE287nf40VUmmpcWHBYodh1vL4l55oeK8HSgIWuKTpNdErI
         5C0+972tiUybAP308J1Yv3E4P6JSSg+qcYadz+aiks7tKMswnhG9doF9JhVI2dA+RVmK
         Ll5RTqFEfZOITkm7disUBxoK/5O9C8DqDiBPYKG+XEUiONEreXsJf5rbRHRw3dp2GhCk
         H+vdvvaxFHauFG3safGc0cV+ctXVuml6+9a6hawBdTQ5YehTMqWZlHX9+tJ0XdS40Frn
         b8xA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775493379; x=1776098179;
        h=in-reply-to:content-disposition:mime-version:references
         :mail-followup-to:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=oiCiCfseGuUt36OVkBJsO+mSwQagEkjvZ4GHrhi5KdU=;
        b=iaCAgWyVvI5PpPticY3nmKprQYWrw0VXkgvGNlGijz6XVIwSSjs5xAkBQ2vmC3R6PC
         P/gjL/mxXxg9MhYY/IID6GauPiqum2h7o18m6CyC3C6z4AR4rlhHNTU1SfggnNGrVNob
         /MdEgMzSBp2fp3vakkRsDBVx8G8D9irfi1Mo+SZB2RJ2JYZfyAAA5uHrJ4HQFL/KDy9F
         JHizXbjK4WTIVSx1nY+nYvyT4ROMA5lT7V8EhPCz0UXP7iEs2ASDPuPg0bTnQj7wozaf
         8mb9PO+Yt8X3lGSbqFOYD3BR7TL9FnOKjgCOARr9ZLLYfzQBU94eUb9C8BzqR4AHQbXP
         tiBA==
X-Forwarded-Encrypted: i=1; AJvYcCVhMw7DvgBu4uKx9EihgxGeBdyn26GRSVgOGTcP3UHNQ8Fh5cbVKD5dLQcjSq6VVALEBhGq4zKYmIQ8WvJfVHk=@vger.kernel.org
X-Gm-Message-State: AOJu0YwcWxC/o1Ez3IvVvI4dtx6ojh9mMoM3h0boY7w3yYWeWkan3ffa
	eaeSqW+jvDT+vnhse2FiBfo+NLuPOHYLFGu4qJjIeLMgMAxkDrdwfaGUS6pqwq86KZY=
X-Gm-Gg: AeBDieuieULUZqQ6T3YYazd2MSLmb5FthGrodvsDXkp1lzVGoR33xvJyG3v860u1mk/
	ytXK/IrUMUS+iBstI1spaUZCl1wWW1XXgH8XE7goqnRhLftSgGBikhOJFoMZA+9oDXKc2r5sPqv
	u7QMoW1FU4V5NqDpDPAv0kZaCZLNElQzo3/Xzv/cM91VPLGHNr7IgT36KCaWOFxDQQ8hjwI0Kdt
	ZHtNsUbPyZ/mKhtHY80HFQVDtw9V5iAKNbMT5jGA8dk7X098+FNVVjKlDGQfvIMnhnVQkjBOM9/
	0+70n5LkUs48zFUWgK7DiMyvqn+cyhb4zbLIpC9hTAQ8UN6vob08ktJ3qlCp/+6Pv2YZB+pPVUU
	TiK7ElLRHJZ7bzWEdIg5LyyYcWOVxgnHQalDUyWBeVqLeZR9Lb0OnLGm8yWb48a79QQ8rRfcK3d
	/KxCr2
X-Received: by 2002:a17:90b:1d08:b0:35d:a84d:e27e with SMTP id 98e67ed59e1d1-35de681380dmr12576218a91.6.1775493379463;
        Mon, 06 Apr 2026 09:36:19 -0700 (PDT)
Received: from localhost ([2a03:2880:2ff:72::])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-35de6a5e62dsm3935913a91.13.2026.04.06.09.36.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 06 Apr 2026 09:36:19 -0700 (PDT)
Date: Mon, 6 Apr 2026 09:36:18 -0700
From: Joe Damato <joe@dama.to>
To: Willem de Bruijn <willemdebruijn.kernel@gmail.com>
Cc: netdev@vger.kernel.org, "David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
	Simon Horman <horms@kernel.org>, Shuah Khan <shuah@kernel.org>,
	andrew+netdev@lunn.ch, linux-kernel@vger.kernel.org,
	willemb@google.com, linux-kselftest@vger.kernel.org
Subject: Re: [net-next v2 3/3] selftests/net: Test PACKET_AUXDATA
Message-ID: <adPhAj5gZKzHTtyE@devvm20253.cco0.facebook.com>
Mail-Followup-To: Joe Damato <joe@dama.to>,
	Willem de Bruijn <willemdebruijn.kernel@gmail.com>,
	netdev@vger.kernel.org, "David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
	Simon Horman <horms@kernel.org>, Shuah Khan <shuah@kernel.org>,
	andrew+netdev@lunn.ch, linux-kernel@vger.kernel.org,
	willemb@google.com, linux-kselftest@vger.kernel.org
References: <20260403233240.178948-1-joe@dama.to>
 <20260403233240.178948-4-joe@dama.to>
 <willemdebruijn.kernel.3ad8f36da2a1f@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <willemdebruijn.kernel.3ad8f36da2a1f@gmail.com>

On Sat, Apr 04, 2026 at 11:10:13AM -0400, Willem de Bruijn wrote:
> Joe Damato wrote:
> > Extend the packet socket selftest, adding a recvmsg path, to test
> > PACKET_AUXDATA. Check basic attributes of tpacket_auxdata.
> > 
> > Signed-off-by: Joe Damato <joe@dama.to>
> 
> > @@ -322,8 +376,11 @@ static void parse_opts(int argc, char **argv)
> >  {
> >  	int c;
> >  
> > -	while ((c = getopt(argc, argv, "bcCdDgl:qt:vV")) != -1) {
> > +	while ((c = getopt(argc, argv, "abcCdDgl:qt:vV")) != -1) {
> >  		switch (c) {
> > +		case 'a':
> > +			cfg_aux_data = true;
> > +			break;
> 
> These are intended as independent test cases: test_auxdata,
> test_drops. By using flags the flags can be combined. Are all
> combinations of flags expected to work? Else maybe we should instead
> have a -T "test_name", or so, to keep them mutually exclusive and
> easy to reason about.
> 
> Or just a test that two flags are not set at the same time.

Sure, I can add a two line at the bottom with the existing flags checks. I
don't think adding a -T "test_name" is worth the effort, though.
