Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B6D5443E073
	for <linux-kselftest@vger.kernel.org>; Tue, 21 Jul 2026 22:28:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784672929; cv=none; b=A0Y9RvCJYkCzmxuIBpVZmMyAnY41TXORRVVmnNigPfHFUi3RtXqZ3m8cRIbYDfvsrCgurfCRMUtuUKv+gzA00N9SRllM3IgE+fElYGIWiSqdzZUG8gB3ZsKfEPuUOjTHMhQ3HKf8wnupsZ2lafsYzGP6JswyLLYh+cquzl4TmSc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784672929; c=relaxed/simple;
	bh=nciU3NeuaTSZ8O853ftXD6oFoJxNPsiTyXqRtPWCJEE=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=LnX0jlpGmcuOyNUC13AQVOiKVSrGSKoWG2ug6Csf2v+Nf/CApiHWtpcjMrPBvKaYsrA1Y82C6jUYf+U8De/7Jf+AO1q4KUiTwmoSLzfGli0nTTPBGbcXQdi+2aP6dBHjZ6+mIfr4v8B95C3WUmRkcsVKOdfg+UOmTRSS/hmcS8g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=HAxbtjca; dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.b=PiBAMlRj; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="HAxbtjca";
	dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.b="PiBAMlRj"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1784672924;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=JwW1meCVxWROjXbBywYZJqHlMgBxDCAsmiZp91jHxi0=;
	b=HAxbtjcaVoP0Qw4M/cZ6Pk8VJEI9OjDMsF+JUYd0MKTDgR7dfD20f7FxzsweKquDdLepAL
	TGtWbpb8/4RjUzKKbq8c/ymftmxcc4pTxUBMJZI50pg1SYLu/FxLMZMfgjH1HZRl75Vuxb
	0RBfQNEmVHrnwLFCpoWJK8ARmiLWZx8=
Received: from mail-qt1-f199.google.com (mail-qt1-f199.google.com
 [209.85.160.199]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-472-9_TKfy6fMQOXrf5FRbrERw-1; Tue, 21 Jul 2026 18:28:43 -0400
X-MC-Unique: 9_TKfy6fMQOXrf5FRbrERw-1
X-Mimecast-MFC-AGG-ID: 9_TKfy6fMQOXrf5FRbrERw_1784672923
Received: by mail-qt1-f199.google.com with SMTP id d75a77b69052e-51c1a97644aso25443671cf.2
        for <linux-kselftest@vger.kernel.org>; Tue, 21 Jul 2026 15:28:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=redhat.com; s=google; t=1784672923; x=1785277723; darn=vger.kernel.org;
        h=user-agent:in-reply-to:content-disposition:content-type
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=JwW1meCVxWROjXbBywYZJqHlMgBxDCAsmiZp91jHxi0=;
        b=PiBAMlRjoORyxsqjZ/DtanqkRDSyeDjBT8vgo4Ko8+pNLudyIbDEBjuylwOGJY14QB
         kRKYWg+XXA79rEi1j8tKWuDtfuWgc6SGyMRsFhI7UiwHpqa4WsFlf5MgU6VabM75KYBB
         owQvdro48ms09jcy3gS7g7bZ6Nf3K32r+3dwMECYB5iy+6hqCHIUkz+yoaYc/Ho4Rdym
         1W8DqBsfcshE5ylxDM2Km5RhCCAQDoaJyYC1Y8nErFy0RnvQS51nwpjvFkNTYOb3jiyE
         hL3ckMcTHRsS2ncc9eLci56LRiv2a8QF1PDTcnfwMIrMSVy+MkgniWZpTS6duaTqzy4J
         JeLg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784672923; x=1785277723;
        h=user-agent:in-reply-to:content-disposition:content-type
         :mime-version:references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=JwW1meCVxWROjXbBywYZJqHlMgBxDCAsmiZp91jHxi0=;
        b=awicq5sBRv017sGGKGY+AxsX/hInrvrYISmitpCAI0bTcyVc6B56DhLxJSLgufBZT0
         n0l6rccFndjQuCZw10lpnmC/vQfhzMKIHUFsCYbBJ5ty6q/Xt1dtbjS0gVdEux6ICkkT
         SjO5jd/Vs2FVs+Rt8h3iehLQZ6eeW9kliVinl2J5QtEBJBCq5qC3dRp1MTvlTrG53VtU
         IpaiXSoOUprnPzYq2uptklIsD4NoRxf/I0/ndQRp9fm0R/QvwRqIon8JrmXiuc82VKx4
         n6kvsb+UtoY6Q2pn6Q1B8F+6K/ip7Y0lcibKoaye1vGw5XyGpKJKa9R63xdKeeFuj14Y
         8mlg==
X-Forwarded-Encrypted: i=1; AHgh+RoYXGd9K8ikwBPFMou3JrFLH8ONmakFiV/FCnZDCrpPnx03Y9TuEF9qcdEtQLfeSCcETq0s9OiOsgORXPqWTTo=@vger.kernel.org
X-Gm-Message-State: AOJu0YxfH+AXus/r1Uz/VpDNQBS83Xh+P97xcJHC2vk2lFksqbDalD3B
	+qK3GCL7uGwB0/e0lc/XRdAgplXSQsmIwuwC986nBKKW6mLMTyqsHqAu8fW02/FWQvk8whe7d1u
	59+MLnt/OiRiJCwa69Y3UI5NdCG4lN3XF6RZVHIO+vKORti/1C7GGST3K+mwNVKRyeSDBUg==
X-Gm-Gg: AR+sD12qS5SkUUpERoekh831RSUu0EiJofEEB81mHDEgDqm6lb0uXsJoUMtNbxMGQkG
	EUqxAEnpTnNDqA1oReSvoa1fzsvjrUWL3pwsL4PlF3xZ3SYg9C5OMgBg0CJkEbVquRt+NsgTctx
	Ea6RU5tMvQlEs8bOKnlIdyz39NQkUpEegdmJ40TgZC18R63p/Mr4D7OcKvWUqaQ2xde3ndjF/PV
	LZ0BbhaE2jUIGSIaAmb0MyuzZ6b38xg88o2ubqzo1lWGLb0VZZpNW91LrhIQkFBeuYZPOK2FkpV
	dRTttCLxCehjrFa+ROECdBhR0Z3zIYcsKe5XVqv/GETrlhCFvWht7xC3UGvEvuyNq+g3SAkB0bp
	mTzGiEZKQ4IdKjACWpNhvAU6SwRZRjN7NSUg=
X-Received: by 2002:a05:622a:e083:10b0:527:631:8d6 with SMTP id d75a77b69052e-52706310c66mr28308601cf.25.1784672922991;
        Tue, 21 Jul 2026 15:28:42 -0700 (PDT)
X-Received: by 2002:a05:622a:e083:10b0:527:631:8d6 with SMTP id d75a77b69052e-52706310c66mr28308411cf.25.1784672922597;
        Tue, 21 Jul 2026 15:28:42 -0700 (PDT)
Received: from redhat.com (c-73-183-53-213.hsd1.pa.comcast.net. [73.183.53.213])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-907ba8b31dcsm6627526d6.3.2026.07.21.15.28.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 21 Jul 2026 15:28:42 -0700 (PDT)
Date: Tue, 21 Jul 2026 18:28:40 -0400
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
Subject: Re: [PATCH v4 3/7] clk: tests: Add Kunit testing for
 of_clk_get_parent_name()
Message-ID: <al_ymM6jjh8xmAPw@redhat.com>
References: <20260717-schneider-v7-2-rc1-eip201-upstream-v4-0-751547e160e5@bootlin.com>
 <20260717-schneider-v7-2-rc1-eip201-upstream-v4-3-751547e160e5@bootlin.com>
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260717-schneider-v7-2-rc1-eip201-upstream-v4-3-751547e160e5@bootlin.com>
User-Agent: Mutt/2.4.0 (2026-06-19)

On Fri, Jul 17, 2026 at 05:59:19PM +0200, Miquel Raynal (Schneider Electric) wrote:
> Make sure this helper is never broken, especially since we will soon
> make some changes in it.
> 
> Signed-off-by: Miquel Raynal (Schneider Electric) <miquel.raynal@bootlin.com>

Reviewed-by: Brian Masney <bmasney@redhat.com>

