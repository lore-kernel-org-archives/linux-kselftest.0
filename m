Received: from mail-wm1-f47.google.com (mail-wm1-f47.google.com [209.85.128.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DFD8E2FE59A
	for <linux-kselftest@vger.kernel.org>; Fri,  6 Feb 2026 09:37:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770370674; cv=none; b=mU6P45aNtHCB2lo4LNZk9RMfhHKnJe2wYWuq4FBBek8YHkPfH2l+v07JKn1WNuBmUpjAxq3nhplTnvp6iluAqicqLhVGuaoUrs2MQMtPmw07m27enWiUy7cszt/5Nb77Q526ljd8uB04kkJE20Ty4Tfs751SBbLXKf7R9odowb0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770370674; c=relaxed/simple;
	bh=a6WHFOsQ0XLpXBz9nVNPRhoAOYofYpq507RpRUTDNVY=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=bLjxFqMOzTaQgPFP2vKmHBee2t4V7pCIqJJEibbL9zZ7KgAhe2FSiHWr13iBfKllADAFIa0y0X+StVKqFP3lXygo+Y1safBl988LvNiQRtpljNAPwx4Qu9Samc11TrkqJgVDkTqIXHG5nGWXYFRDJbshEfCI+4T/PIPewEm0III=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=resnulli.us; spf=none smtp.mailfrom=resnulli.us; dkim=pass (2048-bit key) header.d=resnulli-us.20230601.gappssmtp.com header.i=@resnulli-us.20230601.gappssmtp.com header.b=muPmwwzu; arc=none smtp.client-ip=209.85.128.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=resnulli.us
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=resnulli.us
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=resnulli-us.20230601.gappssmtp.com header.i=@resnulli-us.20230601.gappssmtp.com header.b="muPmwwzu"
Received: by mail-wm1-f47.google.com with SMTP id 5b1f17b1804b1-47ee07570deso4036455e9.1
        for <linux-kselftest@vger.kernel.org>; Fri, 06 Feb 2026 01:37:53 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=resnulli-us.20230601.gappssmtp.com; s=20230601; t=1770370672; x=1770975472; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=wlRYgpRsjcg2ejK1OLntwoYIyfilHOYKa44N62R1+TI=;
        b=muPmwwzueX6ChKrMLIUoFIuPthLqjLgti/xB4Kj9EoFbpNIvzKFy2b19Ux0lUxQ8aR
         PS4QM0bwvXC5fYZW36TtrJ86G7lfyRYSLyFLNPKOafnSVHcjD7VoPdsI9h6PvGQy+A1p
         9pG2Qjm6hx2+DvLoBPMo2U0fdmtytCIJK4Mt98UnHcMckvf8TOYjzUCq0oIEPLv4H68j
         gQFdUThrQ12CgQE+5tITcOUEYR+MYxOhy5Pa0iLesVWBxWGQZN7scP6KnBvv758bZUr8
         XLDgn1vu3zFI69+zeyrQKo5RDMmkgrHIXTcmlHJvHYiC9MGpRVpqVQs63+Etg/ftiLYd
         dsOQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1770370672; x=1770975472;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=wlRYgpRsjcg2ejK1OLntwoYIyfilHOYKa44N62R1+TI=;
        b=Ihw4VxZpeVLsjlApFuA2sFC0Bma0gxY+EkAGHrd3gMBzRmLlx1SsGbS2vkALj2OJT7
         x77lWsBw6UDsCRkdTvpJSykNiHkqMe9Mc3hfFsaceuSiEY/w6WxNIe8QacRXP0ygwLsR
         OVdjLpFCoSd4k5koIqxaXJRkGm9xP/2byjZrsW0bte010/tfHmJPHp96tTXqqgkwBy35
         dD16GR6yIgR6xARp19MrqsON5pEWb9/5ovuuGcjI4sVYQ0XFKDjyHXP7TjT+AYnM051U
         pGIi29QlJMkuD2AAqniNjqU4enVdMfHbUDMTG96Ws65jZ6uXt1qc736uKIoNxR2ZMrc8
         7MEg==
X-Forwarded-Encrypted: i=1; AJvYcCWyIF9o72h3FbEJwpsvRGCmaOo/qefB0nVT/4HiSr3U+OD5VFCDW3DEO37nzTlgIZmBP6y229XfjNObva5R8OQ=@vger.kernel.org
X-Gm-Message-State: AOJu0YwxCCgVaDYDHURjC0oAg/9scNJBHb3QMF4K+hHp17f8KzQt6x1q
	sT6M5l4jsEj75m5/ji/oMw1nXQTMqc5BYKQHKhosUihmIb1WzqW9/dJBmRPxSymwRl4=
X-Gm-Gg: AZuq6aIh4/YnoG07pQU+O9yqlXUzREavnM6iGP8sjHtQXEDjwlQ4/rxrIvOfg1FnXZH
	hVkMgq1V8xAh+ng/gh3N5jxoZaP+59E/u80Vs2Rj5v6TxD24lPv+PLSRZE5jmayIgBrviCCLvN0
	PkFBfWshVVmV8+lylT6RrPCqmbhGTqE2+m8HKUuPGX8N1YbipXpIxZHkxGCceraW3/Y4mxp+SrR
	J8sSrOfUTHyEVE/TGH46k8vvGZ7FDY2gbYgZGaDdbaMJ/ZVsWud9cyNxNo4+/AdLrKmbxcW6SQw
	z2miR3B9aDH/4AWuf/iIOVHFhATbDwOd/3h5rJj2XhF5A7H0IEvaIVKJZyvtrYH2x8GvCbLDJ1U
	0kZizalBlrZZAhTO0IsYQQju58trNAp3pfGhuPS034h3xD2iPNqarTCvmSb1ECVZXYEzJizQeVE
	8v+gC+ICofcfeMMumg3Is=
X-Received: by 2002:a05:600c:8b88:b0:47e:e20e:bbb0 with SMTP id 5b1f17b1804b1-483201d9fa8mr30397895e9.6.1770370671772;
        Fri, 06 Feb 2026 01:37:51 -0800 (PST)
Received: from FV6GYCPJ69 ([85.163.81.98])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-483206cc7d3sm37505745e9.5.2026.02.06.01.37.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 06 Feb 2026 01:37:51 -0800 (PST)
Date: Fri, 6 Feb 2026 10:37:49 +0100
From: Jiri Pirko <jiri@resnulli.us>
To: Tariq Toukan <tariqt@nvidia.com>
Cc: Eric Dumazet <edumazet@google.com>, Jakub Kicinski <kuba@kernel.org>, 
	Paolo Abeni <pabeni@redhat.com>, Andrew Lunn <andrew+netdev@lunn.ch>, 
	"David S. Miller" <davem@davemloft.net>, Donald Hunter <donald.hunter@gmail.com>, 
	Jonathan Corbet <corbet@lwn.net>, Saeed Mahameed <saeedm@nvidia.com>, 
	Leon Romanovsky <leon@kernel.org>, Mark Bloch <mbloch@nvidia.com>, Shuah Khan <shuah@kernel.org>, 
	netdev@vger.kernel.org, linux-kernel@vger.kernel.org, linux-doc@vger.kernel.org, 
	linux-rdma@vger.kernel.org, linux-kselftest@vger.kernel.org, Gal Pressman <gal@nvidia.com>, 
	Moshe Shemesh <moshe@nvidia.com>, Shay Drori <shayd@nvidia.com>, Jiri Pirko <jiri@nvidia.com>, 
	Or Har-Toov <ohartoov@nvidia.com>
Subject: Re: [PATCH net-next V2 6/7] selftest: netdevsim: Add devlink port
 resource test
Message-ID: <eakcy4lgflnovn64jagsilopjst7xvmhcfujbxwlnphh7pdf5f@jkwcgn5e2ujr>
References: <20260205142833.1727929-1-tariqt@nvidia.com>
 <20260205142833.1727929-7-tariqt@nvidia.com>
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260205142833.1727929-7-tariqt@nvidia.com>

Thu, Feb 05, 2026 at 03:28:32PM +0100, tariqt@nvidia.com wrote:
>From: Or Har-Toov <ohartoov@nvidia.com>
>
>Add selftest to verify port-level resource functionality using netdevsim.
>
>Signed-off-by: Or Har-Toov <ohartoov@nvidia.com>
>Reviewed-by: Shay Drori <shayd@nvidia.com>
>Reviewed-by: Moshe Shemesh <moshe@nvidia.com>
>Signed-off-by: Tariq Toukan <tariqt@nvidia.com>
>---
> .../drivers/net/netdevsim/devlink.sh          | 37 ++++++++++++++++++-
> 1 file changed, 36 insertions(+), 1 deletion(-)
>
>diff --git a/tools/testing/selftests/drivers/net/netdevsim/devlink.sh b/tools/testing/selftests/drivers/net/netdevsim/devlink.sh
>index 1b529ccaf050..272e60eb7bfe 100755
>--- a/tools/testing/selftests/drivers/net/netdevsim/devlink.sh
>+++ b/tools/testing/selftests/drivers/net/netdevsim/devlink.sh
>@@ -5,7 +5,7 @@ lib_dir=$(dirname $0)/../../../net/forwarding
> 
> ALL_TESTS="fw_flash_test params_test  \
> 	   params_default_test regions_test reload_test \
>-	   netns_reload_test resource_test dev_info_test \
>+	   netns_reload_test resource_test port_resource_test dev_info_test \
> 	   empty_reporter_test dummy_reporter_test rate_test"
> NUM_NETIFS=0
> source $lib_dir/lib.sh
>@@ -856,6 +856,41 @@ rate_test()
> 	log_test "rate test"
> }
> 
>+port_resource_test()
>+{
>+	RET=0
>+
>+	if ! devlink port help 2>&1 | grep -q resource; then
>+		echo "SKIP: missing devlink port resource support"
>+		return
>+	fi
>+
>+	local first_port="${DL_HANDLE}/0"
>+	local name
>+	local size
>+
>+	devlink port resource show "$first_port" > /dev/null 2>&1
>+	check_err $? "Failed to show port resource for $first_port"
>+
>+	name=$(cmd_jq "devlink port resource show $first_port -j" \
>+		      ".[][][].name")
>+	[ "$name" == "max_sfs" ]

Test resource name not updated.



>+	check_err $? "Unexpected resource name $name (expected max_sfs)"
>+
>+	size=$(cmd_jq "devlink port resource show $first_port -j" \
>+		      ".[][][].size")
>+	[ "$size" == "20" ]
>+	check_err $? "Unexpected resource size $size (expected 20)"
>+
>+	devlink port resource show "$DL_HANDLE" > /dev/null 2>&1
>+	check_err $? "Failed to show port resources for $DL_HANDLE"
>+
>+	devlink port resource show > /dev/null 2>&1
>+	check_err $? "Failed to dump all port resources"
>+
>+	log_test "port resource test"
>+}
>+
> setup_prepare()
> {
> 	modprobe netdevsim
>-- 
>2.44.0
>
