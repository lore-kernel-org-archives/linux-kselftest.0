Received: from mail-pf1-f177.google.com (mail-pf1-f177.google.com [209.85.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9EFB13446DE
	for <linux-kselftest@vger.kernel.org>; Thu, 18 Jun 2026 20:43:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.177
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781815412; cv=none; b=VCGrovsHt1irdaqagtpbois17VQuT3q5jmDyPfCaHNpaIEqyqDIDwsZ6L1XREBIuBkltqHqJpfQafPkgpHz3uUTbpdaEhT1agQH7NY1wII7zyjID8Rjl+bKx6X58JvB3hB1x9Mt7bu7J5XbEzYMCce1hVepNo9bC9dF2bh12h+c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781815412; c=relaxed/simple;
	bh=8hBCLfH/eUYN/8OyUODW+AbWvZee25ehqy42zoDceEU=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=mBjhubI8ClRZIp8a5nZI6sbGhglpOYp8IuaKl/LMu91IfkW2WwwyghKBh4/Zkdi7Xga0unG3/p0YRk71MSwkS72dSxGAnNnchfs19tjFEuRrWlMLLgzyq+EvjI+GFY5b0lRuXr3SyElVZyz7uXWX4QJY0AH1XydFItYlz5+fI8E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=inusxuyK; arc=none smtp.client-ip=209.85.210.177
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="inusxuyK"
Received: by mail-pf1-f177.google.com with SMTP id d2e1a72fcca58-842358aaf36so637745b3a.2
        for <linux-kselftest@vger.kernel.org>; Thu, 18 Jun 2026 13:43:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1781815409; x=1782420209; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=cl1wOvElj8v4VpvcZneMj5bA/9tCB8HmI7qNhRYEvSg=;
        b=inusxuyKj4Ggnj9/OAxZcVO5oPVjLoKWl4wqrAWDwVpl2fb10SaboVexcZwtYjlgLQ
         HozXVi5unI2w3kx5N0O/LXgNDMumzdm7C0W4SB2d2HcIQpV2+w0QQOAhl2jdMUF7IF1v
         CNCsIJGHWZp228UbETaoZKlqqwuYxinZmYGVLl3tmfeZg/MsvSTrl0FhuYkfflQS83cJ
         9Rm9unr/VqW75h9FISq9WDBLZSa+Q7gTiFCEtGfhlJVbydPwlksPS99KhXD0OnQP+/h1
         mkY8V+k7E55dGDSsbC+eNrER0fm+nEhGYEH7sQxydazXYKisvRa/2vsvsTXg4Slz9ph8
         h3/Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781815409; x=1782420209;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=cl1wOvElj8v4VpvcZneMj5bA/9tCB8HmI7qNhRYEvSg=;
        b=tG1xSigTUcXA25fEBQMvA/jnXJzWPAKdsWPmwG93Qx10nsFjL96uDU9vKbg7bzdHWN
         6NuKfu2Xe6WZecEm6vItx1zugA7tbbPdj00DkRtAH31pcqX1rCC5xRd5muqiY83wSLjF
         OKUOxhmqyy+v6aZNQYEkNd58zq5l7h68+51NRr6fEA6BZIoXBGE+bCx4ZQg7NVxZacN+
         LXzImRbmVaYtcGh1lXG3Fuu+O1fn5ZdCKdI68tdPWzrl4YgBjo7ui6ejwK9iWuN9TUBF
         xYV4VNxUsq72alIXGE5JwyWkexhSIiObQrBwGXspyTQ3pVmFFSkAYLRkPJaTYZMvc7TP
         qNzw==
X-Forwarded-Encrypted: i=1; AFNElJ9kPY/VraNqPD5hT7pC4CjTLTSIHXawVmJBKSQqXfbnz1Z2PRl/yDxM6SomYTvmUKfHbyVuIFbRo6v2ACNqM/g=@vger.kernel.org
X-Gm-Message-State: AOJu0YzqfQxiAJk7GFonqgFXID76pfaTaYmmZbpzT+ul0L1QwXBKyVwA
	SjlENcqUyza/Hk4mmuIo40z8c6qAX5iTI5t7HcrjJfb5fn6PN/N6+oq6Hg0qSqJlPv0ceWizNGw
	e6HjDVQ==
X-Gm-Gg: AfdE7ckDLbTj0PEQDqPm7jYd5KozH75Zyv8xyZ8FpPnywQIZoR7Csq+zdjIWxMGTncr
	S4mD095oV4WzWt0che/7GGPFRovmdVj35xwsEOXwh/OeEuE6x7hx1hfH+YKgHIZF/WibjACW3Nz
	tlBXEc/2x530g/pFAxVGv7ecpfkG9NqHR0Ax6JYDjGX2Wi1NzXpvdPAtUqrdx9VKmSLlSXbPRfg
	7Z4Gis4VHd+89+Qy9v3iJa8yZrz5Hm66qJROiYW5JDBii2rA3Mqyv7YDnybbEWaw9o0rMwtkgHZ
	59DOR7PRxNC0HSDo+SdMtS0R2Vl0YNwzir36vrc+IYf1+UNPpm7QyUo8Bc2wb02Oa7XefX3Vg9/
	iKyfgkjrk2KTJgVzpA+3MPoiLPjwZi0pZc9oDObUA+1uogzSXw/VEm5fwRrALj55TprVnxdBK9+
	5z58mU0w9LsYEMWNSuFCRiI8MHHy5OlTM7HUtKvl1CQt2p53X/le4=
X-Received: by 2002:a05:6a00:2a0c:b0:842:7cb7:a3aa with SMTP id d2e1a72fcca58-8455089274bmr650023b3a.33.1781815408580;
        Thu, 18 Jun 2026 13:43:28 -0700 (PDT)
Received: from google.com (56.149.168.34.bc.googleusercontent.com. [34.168.149.56])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-8455364d4e7sm28363b3a.11.2026.06.18.13.43.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 18 Jun 2026 13:43:28 -0700 (PDT)
Date: Thu, 18 Jun 2026 20:43:24 +0000
From: David Matlack <dmatlack@google.com>
To: Rubin Du <rubind@nvidia.com>
Cc: Alex Williamson <alex@shazbot.org>, Shuah Khan <shuah@kernel.org>,
	kvm@vger.kernel.org, linux-kselftest@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v14 4/4] vfio: selftests: Add NVIDIA Falcon driver for
 DMA testing
Message-ID: <ajRYbI-4ZczC_V7B@google.com>
References: <20260609232855.3808971-1-rubind@nvidia.com>
 <20260609232855.3808971-5-rubind@nvidia.com>
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260609232855.3808971-5-rubind@nvidia.com>

On 2026-06-09 04:28 PM, Rubin Du wrote:
> Add a new VFIO PCI driver for NVIDIA GPUs that enables DMA testing
> via the Falcon (Fast Logic Controller) microcontrollers. This driver
> extracts and adapts the DMA test functionality from NVIDIA's
> gpu-admin-tools project and integrates it into the existing VFIO
> selftest framework.
> 
> Falcons are general-purpose microcontrollers present on NVIDIA GPUs
> that can perform DMA operations between system memory and device
> memory. By leveraging Falcon DMA, this driver allows NVIDIA GPUs to
> be tested alongside Intel IOAT and DSA devices using the same
> selftest infrastructure.
> 
> The driver is named 'nv_falcon' to reflect that it specifically
> controls the Falcon microcontrollers for DMA operations, rather
> than exposing general GPU functionality.
> 
> Reference implementation:
> https://github.com/NVIDIA/gpu-admin-tools
> 
> Signed-off-by: Alex Williamson <alex.williamson@nvidia.com>
> Signed-off-by: Rubin Du <rubind@nvidia.com>

Acked-by: David Matlack <dmatlack@google.com>
