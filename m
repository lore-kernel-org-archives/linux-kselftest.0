Received: from mail-dl1-f45.google.com (mail-dl1-f45.google.com [74.125.82.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 029673EAC72
	for <linux-kselftest@vger.kernel.org>; Wed, 18 Mar 2026 15:03:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.82.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773846209; cv=none; b=Qn8n4g0wST2rZv3B3Ik4yiry2W1ogaM2o927I62gGIirqvHfhu6bCMtQ3/UC3vGiSOy3Zehrt60UAvkSf5ulR1oDXJAeWxVdYDqwaaaL0jHW/+jaU+oRig9uBcXd+ck7AF5FswDCiiYSOvzNIcQvhAxMeRIW8AJmJQ1CORAXUBc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773846209; c=relaxed/simple;
	bh=5NcsxaHVIQ2NmCj9OLQh+nSLlXz0JVUjSv0mBYVb1MM=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=m+YJosUXXQ2WMnT7UCEE2dWBGKe/AcmaRJtKJG8eybydD5JPJiSxdSO14HgZo/2J3cd12RrYosGJLQv07QN+MVHS/Q0IzPXSxYHpfJ+aKjY72p5gRoyLPx5LORDR/4KoNoDDhQhPHLL4tBHkwUJCvQpXE8/7i8Jbrt15lH/YZHw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=fomichev.me; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=74.125.82.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=fomichev.me
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-dl1-f45.google.com with SMTP id a92af1059eb24-126ea4e9694so2428610c88.1
        for <linux-kselftest@vger.kernel.org>; Wed, 18 Mar 2026 08:03:26 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1773846206; x=1774451006;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=HbyBRqP1dM0VO6fEJ4blZH7JfwL0DV5fAiX12aFZ5no=;
        b=nNp5lAnvoocEvnOSmGdQl1ELm0iljckmfHLZTlqY1N9TOtnGOj1Vn0c/LESsKsg18D
         UlWdNTvzjLrHBt57SNe5R75bhpCeOhqxLXoIhyYcaeJQzo5O5Wcuj6KW6vH6yhGolvMv
         Um0qYiWt2o/eA31M2V7x+ns9HQjBUveMvg21oYSL/OEkRumyTt04TT/BzawF8Bt4Xn7X
         l7CbSreXWvKjvU6+AfTvc8vjRfj1OhjQWzecqETai+q7ksUrALWi4G6uTh1Bn38oIOVg
         ucUxHKoA08iKf/XFbrvwUgYunZU5rSh2mfa+VyPAMuoN/+oGZm14F/9eb9w+0GdJ4sL8
         78cg==
X-Forwarded-Encrypted: i=1; AJvYcCVWALjgOdLG0ZB/K1IOhIvZWnYGpU06IeSOBl2xdPCNud0DOOrCshFzD4eKcN0wicDnOLUz4iGW4EJlHFv8Uk4=@vger.kernel.org
X-Gm-Message-State: AOJu0Yzom1YbvqkfLUP8iQPs4cXshKCk1YcQfFY4jRj96rdUWrGBQAgS
	5c6OhseUAWYBLRc5XiOh/C1Q5JB8WhoDYShjmYC18hemjiQ05/D5waA=
X-Gm-Gg: ATEYQzyiav+dythtocte6PX74X+LAAcdcA3h+WsFEG1CbLe/X2ZOiUIsXVyHFZw5B5g
	x9oAlHGnav06Ex7eLSIu8YAanATWShf4hWbchuMHoXbdPYqVQ8PVxu7sD9GkmseAks6BVhWK8Wf
	FY+EJC9fstx5VTEE8xPoefsosQd6POsqEEmGJJ9ucXrgLGQQyKMTbk8H5vzNxEuPF1hkvLVaJcH
	kXsDjNawFh9bgaFF5neC/tTbXM46MGgk9+AB7qtBiDD4ijrD1phM+hDinFIVxN8YGj56+Zie3tg
	UibJFrXUItQBKPH8Kdf4d87IFyVXmVOeRV+tkxYYJKX0CC1XU/0zAegt7DsCvuEv4AaVDNUtPgP
	jY0NP8UXH6vrLPEkJrOGQ9ZVz84TA4mW+gz5c9USGtKvotrmQodbeSmX9Q2j7kGhsQ871u9U9Fn
	FnN4ZgMu7kcym3bLa/art6ZpRTRLMD0HdAmN9Ynbi4mSgVifvPBI+wVZeUjLJ71+7hIYSaSYxIU
	WAFmI+RAo1BSW0ZMA==
X-Received: by 2002:a05:7022:b9f:b0:128:d51a:5161 with SMTP id a92af1059eb24-129a715e828mr2027441c88.27.1773846205882;
        Wed, 18 Mar 2026 08:03:25 -0700 (PDT)
Received: from localhost (c-76-102-12-149.hsd1.ca.comcast.net. [76.102.12.149])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-129b41271aasm3384562c88.11.2026.03.18.08.03.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 18 Mar 2026 08:03:25 -0700 (PDT)
From: Stanislav Fomichev <sdf@fomichev.me>
To: netdev@vger.kernel.org
Cc: davem@davemloft.net,
	edumazet@google.com,
	kuba@kernel.org,
	pabeni@redhat.com,
	horms@kernel.org,
	corbet@lwn.net,
	skhan@linuxfoundation.org,
	andrew+netdev@lunn.ch,
	michael.chan@broadcom.com,
	pavan.chebbi@broadcom.com,
	anthony.l.nguyen@intel.com,
	przemyslaw.kitszel@intel.com,
	saeedm@nvidia.com,
	tariqt@nvidia.com,
	mbloch@nvidia.com,
	alexanderduyck@fb.com,
	kernel-team@meta.com,
	johannes@sipsolutions.net,
	sd@queasysnail.net,
	jianbol@nvidia.com,
	dtatulea@nvidia.com,
	sdf@fomichev.me,
	mohsin.bashr@gmail.com,
	jacob.e.keller@intel.com,
	willemb@google.com,
	skhawaja@google.com,
	bestswngs@gmail.com,
	linux-doc@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	intel-wired-lan@lists.osuosl.org,
	linux-rdma@vger.kernel.org,
	linux-wireless@vger.kernel.org,
	linux-kselftest@vger.kernel.org,
	leon@kernel.org
Subject: [PATCH net-next v2 11/13] dummy: convert to ndo_set_rx_mode_async
Date: Wed, 18 Mar 2026 08:03:03 -0700
Message-ID: <20260318150305.123900-12-sdf@fomichev.me>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260318150305.123900-1-sdf@fomichev.me>
References: <20260318150305.123900-1-sdf@fomichev.me>
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Convert dummy driver from ndo_set_rx_mode to ndo_set_rx_mode_async.
The dummy driver's set_multicast_list is a no-op, so the conversion
is straightforward: update the signature and the ops assignment.

Signed-off-by: Stanislav Fomichev <sdf@fomichev.me>
---
 drivers/net/dummy.c | 6 ++++--
 1 file changed, 4 insertions(+), 2 deletions(-)

diff --git a/drivers/net/dummy.c b/drivers/net/dummy.c
index d6bdad4baadd..f8a4eb365c3d 100644
--- a/drivers/net/dummy.c
+++ b/drivers/net/dummy.c
@@ -47,7 +47,9 @@
 static int numdummies = 1;
 
 /* fake multicast ability */
-static void set_multicast_list(struct net_device *dev)
+static void set_multicast_list(struct net_device *dev,
+			       struct netdev_hw_addr_list *uc,
+			       struct netdev_hw_addr_list *mc)
 {
 }
 
@@ -87,7 +89,7 @@ static const struct net_device_ops dummy_netdev_ops = {
 	.ndo_init		= dummy_dev_init,
 	.ndo_start_xmit		= dummy_xmit,
 	.ndo_validate_addr	= eth_validate_addr,
-	.ndo_set_rx_mode	= set_multicast_list,
+	.ndo_set_rx_mode_async	= set_multicast_list,
 	.ndo_set_mac_address	= eth_mac_addr,
 	.ndo_get_stats64	= dummy_get_stats64,
 	.ndo_change_carrier	= dummy_change_carrier,
-- 
2.53.0

