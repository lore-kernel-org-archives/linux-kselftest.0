Received: from mail-wm1-f65.google.com (mail-wm1-f65.google.com [209.85.128.65])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7043B3BFE5A
	for <linux-kselftest@vger.kernel.org>; Wed,  4 Feb 2026 09:56:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.65
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770199017; cv=none; b=sF6ppniSmyTKaajwoqgK5/8kFsPt3SJ0WWaLdz91UQ5gv4zu3pzMDwPFp8DPKm3kyETYojNgstjtK21QYPWvhbLAdAJHJ/lbTb1jVB2MPULhp3cZyWnzipWLLZgSeu4O6/fKb84tNNtawLQ8DTxQi3gEfAYFLMeJ79sFAwcvYAw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770199017; c=relaxed/simple;
	bh=c0SSiNKESavwRZtHeDYtsFbwwGk+w/EGhOCZVlQW4wQ=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=iYyrJIjVT1mRNb89pntbsBAYIlZ9iwA1+qtytdAcate8kHvakNol+Q+nO6wsodNCQS6NYvDvxF9PUSqC9Jms8ZHYlWP8DbnYygjT/V0/ZjkmkVm8qVRAeV1qtMkcYR+tf3hQT5qFvccwyjEwE7vJtL7xLBD9fCx1J0T9E0kDarw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=resnulli.us; spf=none smtp.mailfrom=resnulli.us; dkim=pass (2048-bit key) header.d=resnulli-us.20230601.gappssmtp.com header.i=@resnulli-us.20230601.gappssmtp.com header.b=yQXnBIkG; arc=none smtp.client-ip=209.85.128.65
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=resnulli.us
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=resnulli.us
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=resnulli-us.20230601.gappssmtp.com header.i=@resnulli-us.20230601.gappssmtp.com header.b="yQXnBIkG"
Received: by mail-wm1-f65.google.com with SMTP id 5b1f17b1804b1-4806f3fc50bso65971765e9.0
        for <linux-kselftest@vger.kernel.org>; Wed, 04 Feb 2026 01:56:57 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=resnulli-us.20230601.gappssmtp.com; s=20230601; t=1770199016; x=1770803816; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=TaBsez7vELTsNb/sMEe0+EHGenrpZkeztrL57KkgMuE=;
        b=yQXnBIkGW0ElIC/OXWcyplPwOOU0IIyJdg2coACLZBwEAL3kAFpLZpCqnTmfDTPtiG
         2zVbqzDrgzqlUL7Ja9XWDQV0ujbRrO5KZL3G5M0n+dPQwbNMj3+CF+EZfFliCM6N5Txa
         rJDqCgzxoFgzjS0did4KHpryRo02BpSKDJ5y5T0VqSbZTfwlHO0/fFwwV2T0Vf4EIVlY
         rIOegYO/OE1z3Su9rBc5No3IDgGWqcEHRb9NeGDzU+kEenwKqvCoQoQKtdcWRsUgtQPp
         lisED1YCVMCvDSG0056FrhEsGYv8OwiFcsE5MZXwmgR35UH9O7JhFcEvjVLyvS3s3WjO
         DT+Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1770199016; x=1770803816;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=TaBsez7vELTsNb/sMEe0+EHGenrpZkeztrL57KkgMuE=;
        b=q8lzZAFwNe7+R5qrZ1BlDdNd8/u5A/aaXWvMcsVGUM8BCvxdXcraHk6aYiHzEWT1e5
         eZntRnGqNHXmMDe/CMPvYdswbggNoKBQ2L2aPgqI/gBiQ6X/mnYnu8jf/VckfQv3MP8X
         ApPLmU2IdLnsqCh3rOFwRGBvuxFISW4tbq2GCAc+urweqE1PoyV0XOUMPY9lOEvvbtvn
         9t4pwgynN6/YByRthdYag4I9l1nWJWfvSpQCPClYtbw/yLmHIQArqh5yAmhXiX3Sm61I
         xjrRp7jE+uCon2FydQKGDSxFFKJ0V9v7yRboUhEcPNaDnKcWMbMQLyBGbzF6ooK2Zx2H
         YbXA==
X-Forwarded-Encrypted: i=1; AJvYcCXWy4Fu7VZcWEnBL+XLO9F9609XS11aV177Jxiq0ARGc5Dv6vzYNXUq8Lv1QUZtPq7IKV8WkB4Nuk5jMO6McEE=@vger.kernel.org
X-Gm-Message-State: AOJu0Yx9NwheB99seu6kptl+mDT4otx5PhDYGm0Fd0QdJ2XD2ADhhnwv
	mH+2kLD42ZsZowmG8U+PZuHncHqJXpFxgIv1XqH+GkO5NP2REOZiaq/oLp7in3eIVC8=
X-Gm-Gg: AZuq6aIr7m7eFYKgbzbn8yjKwJ1GnmpBPzFkxECSjY1u1yEXRmn5u/yDCUzz+LETYGg
	emKtcImNkNmVmextiuPCBMnhgnZfE0XLI5aRtoONCmP6htp5p219K8GAN/9rJerO4Cbgxrni5jb
	hQ8TNmd+IJUJHDUeYyfoBMCeBEvdUyIypBdOh+YWtON+hDvKkhCYJRYo/d3p091t1jUFQAeHCeS
	I+7ByxzSLZnBXFQrl3zDXdY67ZhnAu+fcPUyVFK2ggxeP7+YV9A0MVx7ezCju71moa0BLcAz/OJ
	EU5Zy2Bd5h/B/7levhc/MaeCZVJz19l+a5uKeY5uzO52ktAI7+wEgOYPViv7xL0tOygYNrsyDd2
	VEOMwqANeFECvlEbgZ/PFsEIMcMKBidlcq0t9O+jrQebugjLU+Ej8BylQfzb6mvfAjQTOFZQB8N
	vTE0+fCDxAZIO8fB5E+Po=
X-Received: by 2002:a05:600c:34c3:b0:480:1a3a:5ce6 with SMTP id 5b1f17b1804b1-4830e93ddd9mr31664665e9.14.1770199015702;
        Wed, 04 Feb 2026 01:56:55 -0800 (PST)
Received: from FV6GYCPJ69 ([85.163.81.98])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4831089d547sm44206485e9.14.2026.02.04.01.56.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 04 Feb 2026 01:56:55 -0800 (PST)
Date: Wed, 4 Feb 2026 10:56:53 +0100
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
Subject: Re: [PATCH net-next 5/5] devlink: Document port-level resources
Message-ID: <ew6f3nuo3u7cwegwadlmqotxl6ns7c6pa3h4ljbuxkqbq3xxe7@sy74qkffcpze>
References: <20260203071033.1709445-1-tariqt@nvidia.com>
 <20260203071033.1709445-6-tariqt@nvidia.com>
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260203071033.1709445-6-tariqt@nvidia.com>

Tue, Feb 03, 2026 at 08:10:33AM +0100, tariqt@nvidia.com wrote:
>From: Or Har-Toov <ohartoov@nvidia.com>
>
>Add documentation for the port-level resource feature to
>devlink-resource.rst. Port-level resources allow viewing resources
>associated with specific devlink ports.
>
>Currently, port-level resources only support the show command for
>viewing resource information.
>
>Signed-off-by: Or Har-Toov <ohartoov@nvidia.com>
>Reviewed-by: Shay Drori <shayd@nvidia.com>
>Reviewed-by: Moshe Shemesh <moshe@nvidia.com>
>Signed-off-by: Tariq Toukan <tariqt@nvidia.com>
>---
> .../networking/devlink/devlink-resource.rst   | 36 +++++++++++++++++++
> 1 file changed, 36 insertions(+)
>
>diff --git a/Documentation/networking/devlink/devlink-resource.rst b/Documentation/networking/devlink/devlink-resource.rst
>index 3d5ae51e65a2..4cdfc1dce180 100644
>--- a/Documentation/networking/devlink/devlink-resource.rst
>+++ b/Documentation/networking/devlink/devlink-resource.rst
>@@ -74,3 +74,39 @@ attribute, which represents the pending change in size. For example:
> 
> Note that changes in resource size may require a device reload to properly
> take effect.
>+
>+Port-level Resources
>+====================
>+
>+In addition to device-level resources, ``devlink`` also supports port-level
>+resources. These resources are associated with a specific devlink port rather
>+than the device as a whole.
>+
>+Currently, port-level resources only support the ``show`` command for viewing
>+resource information.
>+
>+Port-level resources can be viewed for a specific port:
>+
>+.. code:: shell
>+
>+    $ devlink port resource show pci/0000:03:00.0/196608
>+      pci/0000:03:00.0/196608:
>+        name max_sfs size 20 unit entry
>+
>+Or for ports of a specific device:
>+
>+.. code:: shell
>+
>+    $ devlink port resource show pci/0000:03:00.0
>+      pci/0000:03:00.0/196608:
>+        name max_sfs size 20 unit entry
>+
>+Or for all ports across all devices:
>+
>+.. code:: shell
>+
>+    $ devlink port resource show
>+      pci/0000:03:00.0/196608:
>+        name max_sfs size 20 unit entry
>+      pci/0000:03:00.1/262144:
>+        name max_SFs size 20 unit entry

"max_SFs" vs "max_sfs", be consistent. Better to copy-paste actual
command output :)



>-- 
>2.40.1
>
