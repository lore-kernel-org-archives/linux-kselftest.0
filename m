Received: from mail-pf1-f169.google.com (mail-pf1-f169.google.com [209.85.210.169])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A4B523246ED
	for <linux-kselftest@vger.kernel.org>; Wed,  5 Aug 2026 20:02:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.169
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785960170; cv=none; b=GCSW3xzVg27QxtiNYGqjGuZXm47GloL4okpCA8jZPGNWiLKetVTY2rESxGapjppPe0xDRQiq3B9krWRZ5NPDlT92D3hI5lnhlF/kAbsycT/ZaHG1gBGLa8LbDBOKkVr3ifOXNMVUl045eBHNPkj68vm+GnPvsxNz3XVUNRUeAkw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785960170; c=relaxed/simple;
	bh=PzZRcZhQFmV4ewefRXZ9vDashnRjjc8Kp9zauHFIrHA=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=mH9EZVe7oW/n2SqnupBtJZei5JjeWNm6fAWRkcnB6z+g3NYgoCB85K3il07XHYdaWWM+1u4aMlD5a6d5vHPDWFz1w80J0+qKJCJ93h8kQGC396laOIu8XtkmFAaBOb8VGwZwBMZ6RRx2okml36hcDeBSn9hSZ7DXjgtTMAl2LVY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=QxiV+ml7; arc=none smtp.client-ip=209.85.210.169
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="QxiV+ml7"
Received: by mail-pf1-f169.google.com with SMTP id d2e1a72fcca58-84847482584so201028b3a.0
        for <linux-kselftest@vger.kernel.org>; Wed, 05 Aug 2026 13:02:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1785960164; x=1786564964; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=EbrTOXLeVxsWo074U114gwpQMfyignFAZDFVp0G0ZTc=;
        b=QxiV+ml7n4mskTtv0GsqHyJCQEhWIQEAO0Rkjy/7tQrd0cS4wl/kfFGbOECh3q6jHQ
         LAXGvdT8gmwHOSsyZJP3sPAgH9XUKlJDpxrydaC6tgA2AEvLaWUxeC8e70Lz2zsnyPFF
         g4h2IuctOSzsePJineZaDI/uRuJGVVQzH5qrriLAja1xdsoE7+fnFmGTfoifIi0XMVZ4
         nQJv7VuqU6OD8Wpiio4zwv0LVZfUpeCLEXLm9uY1GHN9BxQoUB7yz94k9yl5Sr0fI9dp
         gWXegW7uimiepAZEWUa3Z2W5k0MVRWBHXnqaAN2nedSxuGOwJXsUZdY+g6ysD7w8n1E9
         ttYA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785960164; x=1786564964;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=EbrTOXLeVxsWo074U114gwpQMfyignFAZDFVp0G0ZTc=;
        b=DEpdKCqTYN59zbJ3qrKI6qhv1o7uyW1NkQ0BPaHGLBOZ+kDP4xhfOl1lGelR7rTZ+3
         oAKaj2LrVfD7XFaRN7nS2mqRYeqWmaSiRh7gRQhtQlUwtqPYNInjQy9MaEbosQLaXpkf
         m/y6yYfHdpHhTJb5G/i8tCF2Cd6p2Snfe//MJ0RiEN7iWqtPyuqXz+3d5sRuySGh3l4E
         2KVQTOT8nP4cO8I4vu5Y3dF/tWQEITtyVItxvpjvUWt556pnb0xKp/IouT+di38n2KfQ
         iNM/E+PoHoCb45W5fHT8A/7dnZzy1WDK0sFiNjbcy1tXNFZYojsT6UGUxr913gTClos+
         iO5w==
X-Forwarded-Encrypted: i=1; AHgh+RqplHucJcoKglShwNYrb9ucwekSOEFk5psTskiLmjawCieYXUjqTBPuedHboot24TQmZBVqjFjvNSgd/nqIMYw=@vger.kernel.org
X-Gm-Message-State: AOJu0YxLEawxEmwGkw9H2tmz0OuJCbWe3mt/G4CLnxZfp0sd+vI3zX+2
	u6C4drTiJ+w5J00Y80Ja9uXHjKPL5OmmgU2/Snos0zaM1f2oiwslu3Un
X-Gm-Gg: AR+sD10IsF+YEdK7u6wTQtWKY4XLe2XccUpe0u2ighFDclz/AmhfMN3HBhBjnSCy3C8
	PBzaKJ+dePxyj/ZHU3Eavj/bgpzZk0DHWHcyX0W+ifu7WJ+m7xJap7w8gk+ZUY0wj8gu1JhJsHa
	e8r9zu5EX57fl7t3iA3TLBI0vJvya1j0ok/rxwwsyzjkthnr+rFCu1QzUHBj8b85UDeEhcJimqe
	wxZZolAvHVa56A84kLa28FLqnasRKddISK18boOZKMHLvt1B8o6bUDqMsL27F6fqEhvjDEHutx7
	99OQaDP6VT0xBQwSNIqWznEiSfipdVrdKiwlTAU/hxfrkKobTzJk4ON7yYa1I5w0Z6a4mNvjqQr
	9FqAMxpEET+Wp+oCUbAwhpMOJ0NauOTSdysGIL/p3y758j69THjmVWzEqN4bFzaX6ZqpZgaoq4K
	o+OrgvhPJ1Dtiyrxy8ZBR8zUqNol3HgFoEkLOOKerbGKz+URgQ1Ul9r05yA1k2gbu1b/HWf8NEE
	rEINukT
X-Received: by 2002:a05:6a00:1827:b0:848:452d:9a14 with SMTP id d2e1a72fcca58-84f41e50e61mr1757709b3a.16.1785960164251;
        Wed, 05 Aug 2026 13:02:44 -0700 (PDT)
Received: from devvm29614.prn0.facebook.com ([2a03:2880:ff:1::])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-cbe708bfae6sm2204233a12.20.2026.08.05.13.02.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 05 Aug 2026 13:02:42 -0700 (PDT)
Date: Wed, 5 Aug 2026 13:02:37 -0700
From: Bobby Eshleman <bobbyeshleman@gmail.com>
To: Jakub Kicinski <kuba@kernel.org>
Cc: davem@davemloft.net, netdev@vger.kernel.org, edumazet@google.com,
	pabeni@redhat.com, andrew+netdev@lunn.ch, horms@kernel.org,
	shuah@kernel.org, hawk@kernel.org, john.fastabend@gmail.com,
	sdf@fomichev.me, bobbyeshleman@meta.com,
	linux-kselftest@vger.kernel.org
Subject: Re: [PATCH net-next] selftests: drv-net: hw: reset HDS mode after
 netkit devmem tests
Message-ID: <anOW3YqpLw1iAIZw@devvm29614.prn0.facebook.com>
References: <20260804151040.2755153-1-kuba@kernel.org>
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260804151040.2755153-1-kuba@kernel.org>

On Tue, Aug 04, 2026 at 08:10:40AM -0700, Jakub Kicinski wrote:
> HDS mode has confusing semantics. On GET kernel reports
> effective mode. On SET kernel expects explicit config.
> Effective mode on GET means that we know the current
> state, but we don't know if it's a driver default
> or user setting. This matter because driver default
> can change automatically when e.g. XDP is attached.
> Explicit user setting must not be lost.
> 
> With that in mind, we can't restore the HDS setting
> like we restore other NIC config. We should always
> reset to default ("unknown").
> 
> This fixes an issue with tests running after the devmem
> test not being able to attach XDP, e.g.
> 
>    Exception|   File "./xdp_metadata.py", line 105, in test_xdp_rss_hash
>    [...]
>    Exception| net.lib.py.utils.CmdExitFailure: Command failed
>    Exception| CMD: ip link set dev ens9np0 xdpdrv pinned /sys/fs/bpf/xdp_metadata_test/xdp_rss_hash
>    Exception|   EXIT: 2
>    Exception|   STDERR: Error: unable to install XDP to device using tcp-data-split.
>    not ok 1 xdp_metadata.test_xdp_rss_hash.tcp
> 
> Signed-off-by: Jakub Kicinski <kuba@kernel.org>
> ---
> CC: shuah@kernel.org
> CC: hawk@kernel.org
> CC: john.fastabend@gmail.com
> CC: sdf@fomichev.me
> CC: bobbyeshleman@meta.com
> CC: linux-kselftest@vger.kernel.org
> ---
>  tools/testing/selftests/drivers/net/hw/devmem_lib.py | 3 +--
>  1 file changed, 1 insertion(+), 2 deletions(-)
> 
> diff --git a/tools/testing/selftests/drivers/net/hw/devmem_lib.py b/tools/testing/selftests/drivers/net/hw/devmem_lib.py
> index 0921ff03eb81..4e6316c7de96 100644
> --- a/tools/testing/selftests/drivers/net/hw/devmem_lib.py
> +++ b/tools/testing/selftests/drivers/net/hw/devmem_lib.py
> @@ -37,14 +37,13 @@ from lib.py import (bkg, cmd, defer, ethtool, rand_port, wait_port_listen,
>      rings = ethnl.rings_get({'header': {'dev-index': cfg.ifindex}})
>      orig_rx_rings = rings['rx']
>      orig_hds_thresh = rings.get('hds-thresh', 0)
> -    orig_data_split = rings.get('tcp-data-split', 'unknown')
>  
>      ethnl.rings_set({'header': {'dev-index': cfg.ifindex},
>                       'tcp-data-split': 'enabled',
>                       'hds-thresh': 0,
>                       'rx': min(64, orig_rx_rings)})
>      defer(ethnl.rings_set, {'header': {'dev-index': cfg.ifindex},
> -                            'tcp-data-split': orig_data_split,
> +                            'tcp-data-split': 'unknown',
>                              'hds-thresh': orig_hds_thresh,
>                              'rx': orig_rx_rings})
>  
> -- 
> 2.55.0
> 

Reviewed-by: Bobby Eshleman <bobbyeshleman@meta.com>
