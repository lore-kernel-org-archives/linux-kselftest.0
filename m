Received: from mail-pl1-f198.google.com (mail-pl1-f198.google.com [209.85.214.198])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7115049E5E6
	for <linux-kselftest@vger.kernel.org>; Tue,  6 Oct 2026 17:34:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.198
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791308057; cv=none; b=dFPnLFkq4gqYkO2RGV4aEnY+YikMDJBfuqvmWVLO/KSrr/Wbh+3NjuIhEY1h1qmvn4Dh70wtLhjVBl1YL4aSz94BZdsujjW3pqFYfnoMJrZJHVil8eNp7Ixe5/1A2NqY8l1ZwrydEZ8jeELUPFqgU1ish1yjj6hlYkXXf0MAryU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791308057; c=relaxed/simple;
	bh=UQg2/5CHu7O1x5BAjQ3xuuPFjSNU3U6/KG90m4SUe0Y=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=h3aGHh4tYJIXTqTOYMv1k2zX4DRBnGGP18BDhppZ3BeQzCdx8e7ZWdZlqnNZuvBRZkWSCD9hA6FibKFbC83W0Y352DxQqJLw3TwxuwHFyoR1Lp9JK4sSE7hwJhbw2iQ89bqgIWnVLxSBd5ang84c4A+Uitr+pFbFd/5OPNhZlaE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--rathodpriyank.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=PsHe4hmL; arc=none smtp.client-ip=209.85.214.198
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--rathodpriyank.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="PsHe4hmL"
Received: by mail-pl1-f198.google.com with SMTP id d9443c01a7336-2d7443e0f0bso51117175ad.1
        for <linux-kselftest@vger.kernel.org>; Tue, 06 Oct 2026 10:34:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1791308056; x=1791912856; darn=vger.kernel.org;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=yUt4FoYtKMqRJhdW7eHbQsmX20bJY/aY8hH3stNtQxg=;
        b=PsHe4hmL8GhB0X9j+0tGTO+7V6MrCYnDl447+WT6xoU5i8eMM1Aa46zbDOw/AkfE6j
         2BRGVzp9QOrjt6c1q61s5l6gLiybF4OAQyV3akwNbtuHnExNWfzffnu8uzGmzR+phuF+
         H7QbXC+AnTWAeIEWZk80rYTNcAq8VVO+QcZdjik/9iM8yxpYmFQzTAb41zgYCYLRF1va
         OyrOQqy7HueYXjFgayIYSmBxrZkAIp/WDzXnmJnv0ZpMl45N4Ez1/k7n8NbtoCEWVaUW
         ptt8e6a5Vjg+ut8GDa4mLBjuPSQAvt/USczKSSu4M0lUCMXtcLloW9W2vAzJssPz/r34
         7ICg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791308056; x=1791912856;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=yUt4FoYtKMqRJhdW7eHbQsmX20bJY/aY8hH3stNtQxg=;
        b=Yd8WqpaV3RqMKYh7sDj2ZpZsY8u0PCZj5qkkqCwEi7HG3GsQTQ+eqRyHPD3+pjWGw4
         jlO0dFnlTYW97jd5jbQFgUgxyknqDfUEgyz0vRt1rWCZK4FyBZQ+4ifwcbaZ8MXgx3lH
         VpMKAYgWHSxPyRneL5zHpdPmvwPem7eDrUMOfWAtweRNGFtufVFCPBBOqh01tYwZ4cqA
         69aXJIk0lGjLjMtwfjzHvevjTfoN280jMoOHcbchhEMSqbE+zEyrNOHUu5/Mne/2SlG5
         rbvBdGLfO6hZA4xnfGZDf74bl59e9fkAsS7ZoG/3ytTLEhNvdO2vxA0eMOkY7Miy3228
         ZulA==
X-Forwarded-Encrypted: i=1; AKwUvBwmUb5JCqZTO+OUDv3UPamn62CAOF/t8lDYj8AfqItMxpAEMlomUXx5ZCV4i5u/M7KTIFp8WLvRvecQ405jwNc=@vger.kernel.org
X-Gm-Message-State: AFuF++m81nBt8SdJjNW/DNy/dH5vNxfgpjYv1C/KA5PUJ4LVhBbXIe5e
	pqbUEAVvMHAfUUSeo5KFW3B6fzrPIQ2ij77+7BvBR6jCvdP874ZnAywFlFF0nwbVY9NOsIcwDTy
	MteOgofP3C2lHd043uDQ3mtnYixuFWGppGw==
X-Received: from plk3.prod.google.com ([2002:a17:902:e9c3:b0:2e2:b496:e205])
 (user=rathodpriyank job=prod-delivery.src-stubby-dispatcher) by
 2002:a17:903:1b67:b0:2dd:c100:a5e1 with SMTP id d9443c01a7336-2e60054441emr1089695ad.53.1791308055474;
 Tue, 06 Oct 2026 10:34:15 -0700 (PDT)
Date: Tue,  6 Oct 2026 17:34:15 +0000
In-Reply-To: <sashiko-outbox-162260@kernel.org>
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
References: <20261006-pcie-link-endpoints-v4-0-ad5398c4260c@google.com>
 <20261006-pcie-link-endpoints-v4-2-ad5398c4260c@google.com> <sashiko-outbox-162260@kernel.org>
X-Mailer: git-send-email 2.56.0.rc1.315.gc6ed9934b7-goog
Message-ID: <20261006173415.1002265-1-rathodpriyank@google.com>
Subject: Re: [PATCH v4 2/2] selftests/pcie_lmr: Add tests for the Lane
 Margining debugfs interface
From: Priyank Rathod <rathodpriyank@google.com>
To: sashiko-bot@kernel.org, Bjorn Helgaas <bhelgaas@google.com>
Cc: "=?UTF-8?q?Ilpo=20J=C3=A4rvinen?=" <ilpo.jarvinen@linux.intel.com>, Lukas Wunner <lukas@wunner.de>, 
	Manivannan Sadhasivam <mani@kernel.org>, Jonathan Corbet <corbet@lwn.net>, Shuah Khan <skhan@linuxfoundation.org>, 
	Shuah Khan <shuah@kernel.org>, Randy Dunlap <rdunlap@infradead.org>, linux-pci@vger.kernel.org, 
	linux-doc@vger.kernel.org, linux-kselftest@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

On Tue, 6 Oct 2026, sashiko-bot@kernel.org wrote:
> > +	up=$([ "$rx" = 6 ] && echo "$dev" || echo "$partner")
> > +	after="$(link_regs "$dev") $(link_regs "$partner")"
> > +	if [ -z "${before// }" ]; then
> > +		ktap_test_skip "$dev: setpci not found"
> > +	elif [ -n "$up" ] && [ ! -d "/sys/bus/pci/devices/$up/link" ]; then
> > +		ktap_test_skip "$dev: no OS ASPM control on link"
> 
> [Severity: Medium]
> Is it possible that the logic for identifying the upstream port is reversed?
> 
> In active_tests(), the variable up is assigned using the receiver type.
> If rx=6, dev is the Endpoint device, so up becomes the Endpoint.
> If rx=1, dev is the Downstream Port, meaning partner is the Endpoint,
> so up still evaluates to the Endpoint device.
> 
> Because up always evaluates to the Endpoint device instead of the
> Downstream Port, the check for the sysfs link directory will always fail,
> as that directory is only present on the Downstream Port. Will this cause
> the test to unconditionally skip the final LNKCTL restoration checks?

For human reviewers: this is a false positive.

In PCIe terminology, the Upstream Port ('up', receiver 6) is the child
device below the Downstream Port (an Endpoint or Switch Upstream Port).
In drivers/pci/pcie/aspm.c, aspm_ctrl_attrs_are_visible() looks up the
link via pcie_aspm_get_link(pdev), which reads
pci_upstream_bridge(pdev)->link_state.  So the sysfs 'link/' directory
is attached to the child device below the Downstream Port (receiver 6),
not to the Downstream Port itself.

To avoid any confusion over the variable name 'up', I'll send v5 with
'up' renamed to 'child' and a comment explaining the sysfs 'link/'
lookup.

Thanks,
Priyank
