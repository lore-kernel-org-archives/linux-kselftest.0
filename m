Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BBB493E121A
	for <linux-kselftest@vger.kernel.org>; Tue, 21 Jul 2026 22:28:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784672886; cv=none; b=X12px8KKBKLM2TWcNFzgUpuIr9j52ISeid5QJIhkzi6Yfe3FrAxGMmYHxh9V+McBS40OTsB8Lix3vM/5g8yYM/lZMMv6eSerXyCxhColqHoifExFIOFg9bK3lHZC5zzASZnRHCXaErdo+m70Rb7tTyC3Hp04zGM/S6Rxb0AugSY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784672886; c=relaxed/simple;
	bh=AiL273mSE4gg9a3rOKpInyl33G7+dlhsLzpFmrnkztE=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=H5iLexBQx9hKd0Y8SjpA+1+HU/uKy26tYyb816QF+d4/pYR5sBb79XJ/hosilt931qx2+kt4L6hTk04Dp2dQ5N7Imp0OoJXyrvzSz3MtMYrn6BTYYkihvwnzyKe1U2XW+KuCS9qiDOxblPkgwx6hQF/QbZAl8AtBVM4ANCpQ9fM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=FAOekFqB; dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.b=CIF8Qka3; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="FAOekFqB";
	dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.b="CIF8Qka3"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1784672881;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=Yt36Kd3pJoDwA98nx3FwkXQgd23O8Obc951fqCUv4hA=;
	b=FAOekFqBx2hE0q6xu0KR0eOjniZ+BLiRrBSvfENp/D98IAEcIf8kMbeAd8moB9iIJd0+XA
	iBZbOzCwAEKhwh7tmctCAB8pDnAkQ09cma17f6Q6imPH7O5eOSNGKx1rJ9udK14hufpKVh
	QdMyvbmp1wr/YpbnaNVkkZOPHkU6Hww=
Received: from mail-qt1-f200.google.com (mail-qt1-f200.google.com
 [209.85.160.200]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-186-ldA-S4GDOZ23bZitnjQSog-1; Tue, 21 Jul 2026 18:27:58 -0400
X-MC-Unique: ldA-S4GDOZ23bZitnjQSog-1
X-Mimecast-MFC-AGG-ID: ldA-S4GDOZ23bZitnjQSog_1784672878
Received: by mail-qt1-f200.google.com with SMTP id d75a77b69052e-51c0199faafso181603661cf.3
        for <linux-kselftest@vger.kernel.org>; Tue, 21 Jul 2026 15:27:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=redhat.com; s=google; t=1784672878; x=1785277678; darn=vger.kernel.org;
        h=user-agent:in-reply-to:content-disposition:content-type
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=Yt36Kd3pJoDwA98nx3FwkXQgd23O8Obc951fqCUv4hA=;
        b=CIF8Qka3NL53C4uMfi62eYlWFmp9gPVWV/UaBV7z3I55PDtxwVVMU42+T8lJcBUXvb
         Re4uptBFBttMq/1BhoT7EBFtW3icg4UmckYbDzUvpGAxkIgF2FZfoVtncDfKakhK3Zr8
         7GHKoOLmYbpKEHKPn3H6c1OH7ZlFsyYSzITjiqlnoho0iUVqtU6sWDlkTCcPdFjpgqGS
         b60q0pgFJUNsDQL9fEfZAsXyCsyNWwbhcuLBZNCzr7pLIeWwqjBCxsg9lWgOWuInS5x1
         Mqh9xXiunUQMo13dTzGlMh36UWrb0Nqd/jFXWkMY0mkJ+MbC6QxltoWblJufwqdh+CO5
         CXoQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784672878; x=1785277678;
        h=user-agent:in-reply-to:content-disposition:content-type
         :mime-version:references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Yt36Kd3pJoDwA98nx3FwkXQgd23O8Obc951fqCUv4hA=;
        b=ALL+GFv8atafFHAGwpxO/MosZXLYkUKJivjSEJ+gTp+pmH70kYYs+na4fhiBBENd8V
         AcF4VyDxppzDDnMg5QynO7I68HsuKZHJEKPqy9tLhNRzh//XVAqRNXPipYP+unm9ctTT
         XSjr9kGto3DPEoV9x/O7fSG4NAqLZSyoGNYW3zdWdeuIOvW28qj1TrYiyNVREXdbgEnz
         1jTjeP4B5Umzp+o1IN8iYMq0eMXenMqlgeJtzfGWpEE6AaHBdIYaomkeO7w+6JriDEx3
         KPGLS89MPUtDK/PSS+09sbkcJbCRxdEY1GakzhbHJeqwQJsqIsUbnkRKXbfGzTq1uKbr
         icLQ==
X-Forwarded-Encrypted: i=1; AHgh+RoXffV89yQBY3Y59ZZ4u7wA1e6MmZvMp/0ktEOGIUwQzzOpaO4OiOMfBWxQPLCKNXc/x/My6L2ztLwT6QFD+do=@vger.kernel.org
X-Gm-Message-State: AOJu0Yxz9Mtjn0FWlBrhXfTv5hWmXCMfbEKPlk7FlbKBVJVSvZIzzZbF
	h2kO413EuKdCczEWkmAMBb4uIBlsVh/btBiss5i7r0cpiLE3/rvWkVMcTo7Czmuys8n5fiCDWha
	jSpKKHNGLrdKQdUUB+ukJGUnpN6VVWunsGpzhNKdOzmoHRV4Vn6pnTiO6HH5haYJOCScZKw==
X-Gm-Gg: AfdE7cmRKikqush5kqj89K/L+LgWqjykMlEzBqZkB/DMgXCfGtCn43uBNPRE1TMtH00
	2zmhvsg9CxNK1G0YgbuFgJr+xy/uoU1fPfJqaWlih+mltyUv7IMROYExwJi1F049pp6vot8jGOl
	BCxJeTYvH2H0L1maJRFBYPC2M0lW6ZnO1VYwQPWYGjK7ripRz22xincjz0NWLhq0h128JJWOa/u
	Zo5ypRdi7hvZ1s8SoxxYFTOVnxXcwr8NIGPjCrMJhpIuScyAUS/Ooh6twtLiGVbzZGGbqbHGrVD
	5DUBgo2up1iQaWMg5Elr0MOAN/4IWUpV6l07+j+T5oRWLleZSRl5kelP8UUW0h4i7OOdO2LTt6B
	0deKL2pS+20xD8StQT97CQwUhL1m7U4rxXUw=
X-Received: by 2002:a05:622a:110c:b0:51c:167d:b346 with SMTP id d75a77b69052e-5213c5f3a9emr187338611cf.23.1784672877799;
        Tue, 21 Jul 2026 15:27:57 -0700 (PDT)
X-Received: by 2002:a05:622a:110c:b0:51c:167d:b346 with SMTP id d75a77b69052e-5213c5f3a9emr187338451cf.23.1784672877293;
        Tue, 21 Jul 2026 15:27:57 -0700 (PDT)
Received: from redhat.com (c-73-183-53-213.hsd1.pa.comcast.net. [73.183.53.213])
        by smtp.gmail.com with ESMTPSA id d75a77b69052e-527d3a47ee2sm3811811cf.26.2026.07.21.15.27.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 21 Jul 2026 15:27:56 -0700 (PDT)
Date: Tue, 21 Jul 2026 18:27:54 -0400
From: Brian Masney <bmasney@redhat.com>
To: "Miquel Raynal (Schneider Electric)" <miquel.raynal@bootlin.com>
Cc: Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>, Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Brendan Higgins <brendan.higgins@linux.dev>,
	David Gow <david@davidgow.net>, Rae Moar <raemoar63@gmail.com>,
	Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
	Pascal EBERHARD <pascal.eberhard@se.com>,
	Wolfram Sang <wsa+renesas@sang-engineering.com>,
	linux-clk@vger.kernel.org, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-kselftest@vger.kernel.org,
	kunit-dev@googlegroups.com
Subject: Re: [PATCH v4 2/7] clk: tests: Add clk_parse_clkspec() Kunit testing
Message-ID: <al_yahLEBEucckrM@redhat.com>
References: <20260717-schneider-v7-2-rc1-eip201-upstream-v4-0-751547e160e5@bootlin.com>
 <20260717-schneider-v7-2-rc1-eip201-upstream-v4-2-751547e160e5@bootlin.com>
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260717-schneider-v7-2-rc1-eip201-upstream-v4-2-751547e160e5@bootlin.com>
User-Agent: Mutt/2.4.0 (2026-06-19)

On Fri, Jul 17, 2026 at 05:59:18PM +0200, Miquel Raynal (Schneider Electric) wrote:
> Create a new set of kunit tests to make sure clk_parse_clkspec() is
> working as expected. We currently verify if we get a proper device when
> using indexes and names. If we make an out of bounds request we expect
> an error.
> 
> For testing purposes, we must ensure of_clk_get_hw()'s symbol is
> exported.
> 
> Suggested-by: Stephen Boyd <sboyd@kernel.org>
> Signed-off-by: Miquel Raynal (Schneider Electric) <miquel.raynal@bootlin.com>

Reviewed-by: Brian Masney <bmasney@redhat.com>

