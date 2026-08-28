Received: from mail-lj1-f180.google.com (mail-lj1-f180.google.com [209.85.208.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 966A2381EA2
	for <linux-kselftest@vger.kernel.org>; Fri, 28 Aug 2026 04:08:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.180
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787890087; cv=none; b=AcZq0v4eBATzzFv/cx3E5ZtxgfGKbqfeADD5ElqfJwINNmaAn7uPBQPrqzjtCAMQAn+tcv68bwMPh9reFnELoxt8SSeYumKtEBIkZbhTrDEaIAVPcxrHWZuwSloWQ6OpdxsDRyNIX74PV8mXAqKOIbIHF7UpiFo2hLDYN9tCWms=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787890087; c=relaxed/simple;
	bh=va2D4PPN7bDWy90o+kzcgFaY8tPz6FoVSh30o+YpqKo=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=gNdFBQbmYfJMAAIthyJvxCZD/quS3tWKM2Y3OD7/Kksu8xpqZ6PVdrq9vxTtTn9edvHobR4zoIXLsRZTgp4vheRtwWzSnoyLtnDhMXhh9Ld0G5oabtdSwCw/rtrt7Mr6rYH7odZ3Xm7tuVKWh85gNAG7ObYdILEpL3l8FQqQ42w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=ic+TGs3M; arc=none smtp.client-ip=209.85.208.180
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="ic+TGs3M"
Received: by mail-lj1-f180.google.com with SMTP id 38308e7fff4ca-39c9a3acd40so3854821fa.3
        for <linux-kselftest@vger.kernel.org>; Thu, 27 Aug 2026 21:08:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1787890083; x=1788494883; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=3CKdSKdLdxXqUAJ8+SDUUepiueedYKIw7PG3SRPgDmM=;
        b=ic+TGs3MjG45smJ3BTxH7bVhgihYT8NO4AgAuwHsKuktXZxOJvuF5rxF5aijy8drMx
         Wzr9iq0lhJB93c/FvWZEYLEEH7rWi1KnlTsaSU9r6ymstejj/PhHZOHsqz/b6Q24pBIj
         MOnedHXRoF94plUtXL2aOA3bZRkBpIG6saFJaUzeB0fcrqq65GCuv6EHwjUcGv6oTd4R
         ZLikpKcLvP1QreRn2Jg35dCLLqfQQGcD7T4Shq3g7s6+XNv/i5sIrJ+pRd3bHCZfvH8S
         enFCEM7buM+zMV92/UMNph5I37zuudKONNsLYuTAvQ1Qe4vGdworXcih83Zl6JTdjf0H
         RaFw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787890083; x=1788494883;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=3CKdSKdLdxXqUAJ8+SDUUepiueedYKIw7PG3SRPgDmM=;
        b=AjPgqtN/yEBevuXSzSXRJA00OtC0C7QXmzeo98wuObRLjgLR8GDsVZt0YrocGNMG27
         coKpHuBdchP2319gQti4jkvHp2QWPPBCev85XSJDwDeNlwIvWYM4MQnQPBuQAd0ajVOI
         TAgK107Bg2tLFAhqe73fEPDTJW31yjXT4d7Q1VkxzTPmuD1+OVO6sYvolnzbipGReywv
         lUykIntCicKiyXLYux7kcSrwCFvxWsB6eu6RIv1UTpUYhrZW4pYN4ZTeGZifSDg4VXvy
         qRUJWuBoebn7TxptEntt/AfpjE68BQjK4E/NLzlJgbjOI++UjU4siERjZhK46c3p0UWq
         9ODw==
X-Forwarded-Encrypted: i=1; AHgh+RrEmiu41GyVXx7ombdeUGGGdlfeaSrr+xukerNDEbVEZfeDTqgsTU9d5OlF6YJeymKNvIgNX1h7lZm7wblUuWc=@vger.kernel.org
X-Gm-Message-State: AFuF++kw40NdzZe3JCgVZRE9SY/MSucIlJBEXeEZ6yj1MLnY3uJATzbB
	G1+oeiz3cmeR+HNStgZoRtltulK4Cw4gPV7LECeCWoYmFQEoQw/0Ys3B
X-Gm-Gg: AR+sD132AOL5dONQgGi0RYQ+CzyvnbLbH//lTznerj9DsYG+C5dbLcKBY8r/X83lYAE
	P028N0ZntCd4QB/8W5Zc9p7pA85CyMCDK/cqMZNQNISxE8BA9HKOci3PNBnSrGdKaseqUW6g9yR
	ZUsJRjJmGbC6IYd1GHdt4bSICBv+eplVFa/b1+kE5eEBQGehaf9A73tGGxTq7n9VC/38meo0YGq
	GJx/q41YrtkYN4C0427L3ePocA9A0GVMgiyGBdiV0uFXvrRlNjOdsp/ZgaDyP7l96/+3xAcu4Oy
	OBLTNLcoHqgAx4Mj1w8ov2OWMHPPg+5Yh9AIskU8PKxB1zMV1qGF0xng+n3TsHWD6I60eKs345u
	LK6TVmlhFGJ+fU8OzbBSn8owuwAS3iSGyhIIPdZQyQx12aoclT23mQPZjIP4p4o5Ja+anriZaex
	Y8PyaCeTWtJSO7DEjPHx00SqGTss0NzhWD5qUnk8ekWt3Us+eLfBFtVCJ5cVAkEL0=
X-Received: by 2002:a05:651c:1445:b0:3a2:eb57:8a99 with SMTP id 38308e7fff4ca-3a301afd639mr5669501fa.9.1787890083299;
        Thu, 27 Aug 2026 21:08:03 -0700 (PDT)
Received: from mobilestation ([2a00:1fa1:829d:a0d6:4e24:60c8:bd9:494f])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-3a305575833sm701491fa.35.2026.08.27.21.07.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 27 Aug 2026 21:08:01 -0700 (PDT)
Date: Fri, 28 Aug 2026 07:07:15 +0300
From: Joseph Steel <recv.jo@gmail.com>
To: Ovidiu Panait <ovidiu.panait.rb@renesas.com>
Cc: maxime.chevallier@bootlin.com, andrew+netdev@lunn.ch, 
	davem@davemloft.net, edumazet@google.com, kuba@kernel.org, pabeni@redhat.com, 
	mcoquelin.stm32@gmail.com, alexandre.torgue@foss.st.com, shuah@kernel.org, 
	joabreu@synopsys.com, jun.ann.lai@intel.com, yi.fang.gan@intel.com, 
	linux-kernel@vger.kernel.org, netdev@vger.kernel.org, linux-stm32@st-md-mailman.stormreply.com, 
	linux-arm-kernel@lists.infradead.org, linux-kselftest@vger.kernel.org
Subject: Re: [PATCH net v3 2/5] net: stmmac: Move double VLAN handling to a
 dedicated op
Message-ID: <wmeffk2whc47cwfxnsrs46lwmd52n3ezwb5un6qn4nwnturqie@pd77k47zoeka>
References: <20260825164522.4244-1-ovidiu.panait.rb@renesas.com>
 <20260825164522.4244-3-ovidiu.panait.rb@renesas.com>
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260825164522.4244-3-ovidiu.panait.rb@renesas.com>

Hi Ovidiu

On Tue, Aug 25, 2026 at 04:45:19PM +0000, Ovidiu Panait wrote:
> The double VLAN bits (EDVLP, ESVL, DOVLTC) are currently handled inside
> update_vlan_hash(). This ties the double VLAN state to the hash filter
> update, even though the two features are independent: hash filtering is
> controlled by dma_cap.vlhash and double vlan by dma_cap.dvlan.
> 
> In preparation for removing double vlan support from dwmac4, move the
> double vlan logic into a separate update_dvlan_state() VLAN operation.

The S-VLAN implementation in STMMAC is a complete mess. It seems like
the original code author didn't fully understand what he was doing.

Double VLAN feature of DW *MACs has nothing to do with S-Tag VLANs.
It merely provides a way to insert/extract/filter an additional level
of VLAN header - inner. That's it. Seeing the networking subsystem
provides only the outer VLAN header for HW-accelerations, having the
DW MACs somehow working with the inner one is not only redundant but
had been harmful up until a recent kernel. The Tx path has been fixed
there.  What you see here is a leftover of the incomplete fix.

Anyway if you feel like cleaning up a mess here then the only correct
solution would be to almost completely drop any double vlan stuff from
the VLAN implementation of the driver. That is:
1. Drop EDVLP flag toggle. But preserve the flag being always set
otherwise COE won't work for packets with an inner VLAN header.
2. Rename "double" word to "svlan".

You must not touch the ESVL and DOVLTC flags, since they are responsible
for the S-VLAN tags handling, have nothing to do with the Double VLAN
feature, and must be set so VLAN hash-based filter would perceive
VLAN S-tagged packets.

If you need to make DW GMAC4 not stripping VLAN S-Tags on Rx packets,
then you have to find a way to prevent the networking core from
enabling HW-accelerated S-Tags handling.

-Joseph

> 
> Signed-off-by: Ovidiu Panait <ovidiu.panait.rb@renesas.com>
> Reviewed-by: Maxime Chevallier <maxime.chevallier@bootlin.com>
> ---
> v3 changes:
> - Rebased after dropping the dma_cap.dvlan patch.
> - Added "Reviewed-by" tag from Maxime.
> 

