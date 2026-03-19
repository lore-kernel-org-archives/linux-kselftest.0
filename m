Received: from mail-pl1-f169.google.com (mail-pl1-f169.google.com [209.85.214.169])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A1F7C230BE9
	for <linux-kselftest@vger.kernel.org>; Thu, 19 Mar 2026 18:29:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.169
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773944993; cv=none; b=XY0GFGmfbXgZU0cmGxgOvYOMeV1crYzkP26Fzk8uRC1Wl3aEYYfRmlfqArOxdbKR2eXsOWOAb1y7oUBlJqVmiSC3IdLk8VYrypZ5sURmMDPmIl+tCUd8lMmRw7j34taM9GMhHsvwqR7RuORmM3U1xkKSEXblxCOguw9TySyeyDQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773944993; c=relaxed/simple;
	bh=l+b+ARBQj3dJ/ZowWqKuBa047ok7XkTYvsb110E9hQE=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=TVLD0F+xlD4Sr7/+LmLiWCi9wKw8V1MNQvg3X9KgmGCaZfX8fMbVQhf849eXCETrbWJIPK+B5LDHHSKApEy/Q4O6lWPZlsPdmr8m+02O+7XDXOqjT9Rwpc9Vy7lwIS3WuocXDMCOKVFC7lJ7cRH+pU1IY8VTQV9NGjO3cB6DZ8g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=fkyBdYg0; arc=none smtp.client-ip=209.85.214.169
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="fkyBdYg0"
Received: by mail-pl1-f169.google.com with SMTP id d9443c01a7336-2ab46931cf1so19603025ad.0
        for <linux-kselftest@vger.kernel.org>; Thu, 19 Mar 2026 11:29:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1773944992; x=1774549792; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=l+b+ARBQj3dJ/ZowWqKuBa047ok7XkTYvsb110E9hQE=;
        b=fkyBdYg0UYYEFTzz1iHXDkP6Jtbl4V51bg5x3MNQ2RlDKz9pn84MncTxSyv7z5Fwn7
         l7Gta53hEyPyVojun9uERa3KXcf8xe89B8cK217SHwLghp4WgQUtfnml0eMaBOSjyo1j
         idvIlr3V329B7RVMekLhMQsS5BS1cg4+tGZVVXs92US9hdYAkpp+36o/3jUFc+3GHEiR
         cDDs9sGcy9NLCDPEIdOw2NNzhNA0iR18KE68Z8D6Adi0BcsDITQZTtzmAgx3Rv0SJjsY
         jt3yngYp7jImpI5IuCeU6EgUg1Nq4KoFUR+Uy/VX0AM8qa6O5BuTm5YvtpG5epHYu72D
         TZPA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1773944992; x=1774549792;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=l+b+ARBQj3dJ/ZowWqKuBa047ok7XkTYvsb110E9hQE=;
        b=QFYTGiviz9iii2oLHqfo6+Cz2nlszmZ28kYJkuTCOtlyeocn7/dltHmp2JFkZC79Hh
         2hIZzCxCbrktgJQMmyt8G0ZrzQrX582ZXRf4bMpnw3Ffih8EiPnTS8z91AMojtcedPQy
         WN4/WxDujM8O9SOQatc8iPRtrRW743BP1U0hxb9HzdMhrITTRyZdTjpk36j0CqpM5ECq
         Hn5L0iRbJQyWJmvwS7/lhjH4y/pUFpSNQu1BkXVIJGffr1xjmk62IJZGuumy62Duh59L
         UXW6eMrRNA04heWa0GGUZ6OwuJ6DnFCPgrOmuPodM3I7T6ivkknR9NMOn8GcxZoEC/fN
         S6hQ==
X-Forwarded-Encrypted: i=1; AJvYcCUEiX1yhoEH8T2ATUoNYNCZwHCSuhYVmmFz8Nvn5HYABVr0VWsctYsrE0MqvX+lUL7isLveCMSevWtjTzxZ+vM=@vger.kernel.org
X-Gm-Message-State: AOJu0YzGORDwSYDB4eZvMl6/7NzpL0GmK+2azAANTQMA6aDhmpwYECBa
	vfwiSMhJqT4Rp2Z/+XiKAbnXW7a3AX9Y3xPsPi/8EulW/EIxgdpxHx2gUELgA/jEPJk9PxwNMRU
	Ol28RmA==
X-Gm-Gg: ATEYQzz3RlTS1SRd2ZmL2Dciozz44ukVb9u9DBIA0s3KulrVMspoWwZWZqKEuP8GVA6
	KYjc5MrR43+OElIWp0lgXVaZ1cpbdkDFUAeTwNl2fnRvHx1J2IE5KnrUXx5HHPHjsk2GW6zSe4f
	876+i5Y+JU2lIhgJdtKaVhaUpp07un8lMl18vvjXDN56+7DTG2o6Uf65F9IaALVp638uz+lzJqJ
	Nd3Lx1UlzP8QHLI1V+8KptGMkCTEt2xBWw54HkHpJI1SJyPI5HQsxg9UED5OqK43BDaK5SjTlqQ
	8F+Tk/MwkA9XPZ9ddlzQeG0lAbC+2yxeuibmj9Km9iXF1v/I6YYBk9OEj+4gMZOIkIM2bEVkQIA
	Ea1uChsvJhVMeB+GD3D/LT6fvSXaTONnCq1UhpvJtAnhbwzxygQxOMIKMuzOKO211ajLXfmAhl+
	Cq0KRB+vU16Dkkwg36VQKO/JhtrExhSF0rugWw5u3SZHHLs48edxlCJS1OZ124GQ==
X-Received: by 2002:a17:903:11c9:b0:2ae:5ab4:f4c0 with SMTP id d9443c01a7336-2b0827bcf04mr2347095ad.13.1773944991550;
        Thu, 19 Mar 2026 11:29:51 -0700 (PDT)
Received: from google.com (239.23.105.34.bc.googleusercontent.com. [34.105.23.239])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2b06e5f12d9sm62873345ad.39.2026.03.19.11.29.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 19 Mar 2026 11:29:50 -0700 (PDT)
Date: Thu, 19 Mar 2026 18:29:46 +0000
From: David Matlack <dmatlack@google.com>
To: Rubin Du <rubind@nvidia.com>
Cc: Alex Williamson <alex@shazbot.org>, Shuah Khan <shuah@kernel.org>,
	kvm@vger.kernel.org, linux-kselftest@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v9 1/2] selftests/vfio: Skip MSI tests for drivers that
 cannot raise interrupts
Message-ID: <abxAmnZ6yncRVCIY@google.com>
References: <20260317214239.124857-1-rubind@nvidia.com>
 <20260317214239.124857-2-rubind@nvidia.com>
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260317214239.124857-2-rubind@nvidia.com>

On 2026-03-17 02:42 PM, Rubin Du wrote:
> Some device drivers may not have the capability to trigger MSI/MSI-X
> interrupts from software. Add checks to skip the send_msi test and
> the MSI portion of the mix_and_match test when the driver's send_msi
> callback is NULL, allowing these drivers to still run the DMA tests.

I would prefer not to make send_msi() optional if possible. We sould
need changes like this in all future tests that want to use send_msi().

Is there really no way for the nv_falcon to do something to cause the NV
GPU to send an MSI?
