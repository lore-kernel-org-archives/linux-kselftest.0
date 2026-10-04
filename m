Received: from mail-wr2-f8.google.com (mail-wr2-f8.google.com [74.125.225.72])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 23AB03F0A92
	for <linux-kselftest@vger.kernel.org>; Sun,  4 Oct 2026 14:01:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.225.72
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791122499; cv=none; b=t36wZOTwzTU07EQIuaxsuiIWhJgqMAHI3yC0xGR+B5KYq2aiBOw2GKAivytARmMvnfRCCSP/IA9Oxu4LcSlhLxgeLwnKP+bvXbdxBkR1Mo3fn+PzKy+V6nwctJeU0I7Gp9mdJQECeMyRtX8TlI2mAiHI92M8MxuHfS86TnErL4o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791122499; c=relaxed/simple;
	bh=KE2VmvcgzRzsohaFalSlwnQNko9IVpTrrNAyx5LHuyY=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=nyJv4R9iVsu7cgp7ZZf0y155EI5lH2G7QgFQdOwMxY4YXoimrEt9pnV/vMVtO+P+3+3g7h4OcjExeKOT3/Mcku3aumutozylZoLdDIr0Q9aW8PGhe9zpC76Jq3Za/MjWVCFZpQ96HGQF6bsJlFMGsnNtgl0JGABPQomV8lP/5Rw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=blockcast.net; spf=pass smtp.mailfrom=blockcast.net; dkim=pass (2048-bit key) header.d=blockcast.net header.i=@blockcast.net header.b=phmghlLS; arc=none smtp.client-ip=74.125.225.72
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=blockcast.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=blockcast.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=blockcast.net header.i=@blockcast.net header.b="phmghlLS"
Received: by mail-wr2-f8.google.com with SMTP id ffacd0b85a97d-48b007d7d2cso359649f8f.0
        for <linux-kselftest@vger.kernel.org>; Sun, 04 Oct 2026 07:01:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=blockcast.net; s=google; t=1791122496; x=1791727296; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=+t3C+Ja2CFaTDIBFicfkFdbgjtRqzlYdCsfo/CBmKMg=;
        b=phmghlLSJkI3H3iSSBw3OChHW2O2WhqHWlFdENK3fr46De+zJsx17yB9RStrkX643W
         Wd4/6Z7ymdrXVFGcRkBBfKYv4YiZALeI/qJYuA6kyoimXo3QzeVm3QAYHpiFGK5waVp1
         Y4XjP6UWXnYETtVAYu9c98c/xgvsyQvEOv109ui2GruRvG/WDmB7mQSMyL6VdGTWyefg
         owat9LxruSd2ywuz3OmEWfUThuIo1oZ+6K/2tPcP9g27qmJWbeSwRZ4GzsWXB//eUMX7
         PFuUTFrKdJHn75VA15oEFnF1lMULSQd/WdNHzrXorSqopkoJsPjtP5PJ8jcgj+pED3xi
         aj2w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791122496; x=1791727296;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=+t3C+Ja2CFaTDIBFicfkFdbgjtRqzlYdCsfo/CBmKMg=;
        b=vQg3Nzs+yr8Z4c+ORkjCDvaycCbdUDShsC7sPIvCv8rcaWKYONNkfo1ALz7ss4lWsI
         zVd4uLDzhSedq2TpSQFPR4OI65OHc3zGndA0QDxXSvOrEAIBIqcPR5OCNsbwUeJkNtm/
         LQRAoIE+iKDQMaNv5lAKcYTVLmiea6qcad2le6bDWt5PfY44KaYJRZwp8EDP/HJwgJaG
         ReabOWEmK1neH+L/MsVRGTg5abmiFEUvXpGflIP4TcSegP+Z6d9hrZlWKvGqei7i2Kz4
         IxEo3PGf2HNPoIfX2WZ5mxQM9SStRqmL1JhD6hRP6f4+OMPfG6bMBAVmt6LFYRKA8z+d
         KppQ==
X-Forwarded-Encrypted: i=1; AKwUvBxbU8tn4FBGxM9fHUeGwuKnSKXrbtiNCydulr0oIvs1YjcOsKCgf5jlOrRhN0vF8fj2qxDBH66n1/EZ1p/SYiw=@vger.kernel.org
X-Gm-Message-State: AFuF++mJacmlx0yXHDyqnNL9uspxMS+IS/ZopnUIifZO4gEoeurrTym0
	fui2jBvImSfzG396sTudWN0gnfd3606qKF52etkFX+aPePqCb5dc8dReyc6/bWEu/TA=
X-Gm-Gg: AYBFou3c/l92b/ICKFvEF+IoON7L9TiK+O8j2W9hAOM3nL0XRiX2oogliwUricvaMoy
	Al3yi66m2Zr5o2qnvssWVMqhbcXlLjDYFJY2oyklzD90ezE5bUtl+WG5QLk5GsdIpe5atEs4MFo
	gxgrCufkyibeAZeb5AvKYsLbeFyqRCxuiJfbDipT7Q4IwrRz4haOlUrBs8fFpSWpn+c4A9IPM2t
	kWAu/xbIC4rlNapKqG1sYnfAbQKnYAFleFtlXoSkEAYWtDr5afA8LN6IDwMQo0UsvI7QgrhogBv
	ds+KcdtOZ4A4Hpq+ah8CB+xuXRJL3OErou0DMil3uD7C9pmaWLSmeTQ7qUpcnLicZAIHxvn/dtu
	alVAfL5kPCvL5oGawatGREC44G3gbGpzPs4gtpoh+edSEhMkA6Z12JRjNVJ5nCLjurz749+bZSq
	0GkKM3nQLPRwhEo7Zb1dCen0vBzdovrUvK7LQLGPl165PM3Y+O9z0s64F19ztzJjqmyIMNo/WUq
	F3+nx310vG1TD8oYULnHLwA5mmImqgIazOdDs8OgCQydISdO8sobp/cWQH67NEQ2am9DDd8578j
X-Received: by 2002:a05:600c:3e14:b0:49c:fa20:cc00 with SMTP id 5b1f17b1804b1-4a027585559mr141267525e9.23.1791122496260;
        Sun, 04 Oct 2026 07:01:36 -0700 (PDT)
Received: from localhost.localdomain ([197.51.72.2])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4a039505568sm226480455e9.3.2026.10.04.07.01.30
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Sun, 04 Oct 2026 07:01:35 -0700 (PDT)
From: Omar Ramadan <omar@blockcast.net>
To: netdev-bot+sashiko@kernel.org
Cc: Taehee Yoo <ap420073@gmail.com>,
	Andrew Lunn <andrew+netdev@lunn.ch>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>,
	Paolo Abeni <pabeni@redhat.com>,
	Shuah Khan <shuah@kernel.org>,
	Simon Horman <horms@kernel.org>,
	netdev@vger.kernel.org,
	linux-kselftest@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH net-next v2 1/2] amt: mark relay data as a UDP tunnel packet before sending it
Date: Sun,  4 Oct 2026 17:01:23 +0300
Message-ID: <20261004140123.94341-1-omar@blockcast.net>
X-Mailer: git-send-email 2.50.1
In-Reply-To: <179106416186.434549.2202047416681649119@kernel.org>
References: <20261002212458.34247-1-omar@blockcast.net> <20261002212458.34247-2-omar@blockcast.net> <179106416186.434549.2202047416681649119@kernel.org>
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

On Sat, Oct 3, 2026, Sashiko wrote:
> Should this have a Fixes: tag?

No, on purpose. Eric asked for this to go to net-next, since the bug
needs a non-default setting:

  "Note that tx checksum offload is off by default on amt, so the bug
  would not trigger by default."
  "A better fix would be (for net-next) to call
  udp_tunnel_handle_offloads() in amt_send_multicast_data() like other
  UDP tunnels do"

https://lore.kernel.org/all/CAL4Wiiqw_7Mxa5W1EQgw2=KpJNNxG=cBLXsHvpio29GvD1UKZg@mail.gmail.com/

> This is a pre-existing issue, but it is closely related to this patch.

I have not reproduced it; so far this comes from reading the code. It
would need rx-gro-list on the relay's ingress device, and tx
checksumming plus tx-scatter-gather-fraglist on the amt device (all
three off by default), and a GRO aggregate that passes ipmr's DF/MTU
check. It predates this patch, and the cover letter already lists it as
not touched and untested. I will send a separate fix for it once I have
reproduced it.
