Received: from mail-pf1-f182.google.com (mail-pf1-f182.google.com [209.85.210.182])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8143947CA77
	for <linux-kselftest@vger.kernel.org>; Wed, 29 Jul 2026 12:08:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.182
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785326908; cv=none; b=QZ+0FB2hGNZ9YLv1vxMfvN25AtY/zVnf+eNHImD15VvGgvaS9c3Hq/jRgkUuLRSt5bUNNXFa+4U2L8/Y70TjmAqEx22Xrd6HYy9pwnx232qVUyDtSvLMbGpB0JyEQuXXttH68y1Ob8hWfelrGoS1SouVNTljdgqAv8XyFGM5+tQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785326908; c=relaxed/simple;
	bh=B7TewygujZnaDoAvFCdYw3/qv+UCkSEJvMuQcq5Qjm4=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=MrwplFwyNmixtiWBKdg4/jYJ3V61O+2krIUAEk3mtAK9e8hFQ+Taz+ihsIAKjahJVpicMb/oH2DmZ4CBsthykEUvC2voBWjOHVC6FlDzfXFBUfO2TZOILG9vLH8IdLwYtSwm2MiphyKBCfm+r1I5ryb88Y4EiFmnINbMHU8HDSY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=jeBq08CV; arc=none smtp.client-ip=209.85.210.182
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="jeBq08CV"
Received: by mail-pf1-f182.google.com with SMTP id d2e1a72fcca58-84e0688b7e8so710213b3a.1
        for <linux-kselftest@vger.kernel.org>; Wed, 29 Jul 2026 05:08:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1785326906; x=1785931706; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:sender:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Gzb9FT9wUkGMcUEIoMcEc4INRD8xMXaz2c0lYN6UOZs=;
        b=jeBq08CVF0F7/p6XcWm8lVsaFnjt4sPzpKFOfA9VgEBrozFr3w4Fv4d7kSnOAes0Kt
         v/xQ6plUM6OHZeQZHsFlGpbUAAyOU6IapAkqI1k4hi/n1h9EGdoJFtwr8h5wHTuMdYJF
         bfU874jmuu3HcvvNLgSwf5ZCF2myF62Jjk9XBky7qEV3m+vhj2RRvgwrbsWZH7tDtRdO
         N/1fCiN05I+UVyllz1/HuKxZ6qhOpV4LewLVA3OWIxpHshCFxhtVZAEqf94n98EuVrT4
         32yBzcq+uwqKbyM8paWs9XBQMRakkKfmEB5HUPuOmcumWOGSfYoyJfYNuzg3StqfsW/4
         yNCA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785326906; x=1785931706;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:sender:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Gzb9FT9wUkGMcUEIoMcEc4INRD8xMXaz2c0lYN6UOZs=;
        b=pheQG4Jdii1usB8kp3EZ6mepZiTECiI/Xro3OfohE0tlW7YhFc4LE3bVnUr+wlS4yD
         noOkJQng+wvFXtEiQCGSe8RoJWNQsG1G6kWzp45XhQqykBJvHXUj/SWQma05TLmszH1w
         /399mrMsBkm5NY3Ij8dQ7dxPMbf8sfASQpJsXuhl3PLXgOC8Cmggev1uRzKToVUF7mb3
         Co2LeI+98UATb3wDGoIHB2qsyD8iELU7RW8gySnC9G/R45HPZoxmMQf+wRBht1sJZWQ0
         9h10MBlALiIGmfFMI8e71Y5vwv5beVLXHMudm9fOngVEIlJtSV1C+mD1/pwvnR8PpKZz
         jLxg==
X-Forwarded-Encrypted: i=1; AHgh+RpLHCvtrp4TaqsFIeoqx+nBNwTj+NzI4v/ktRAaLVfHeGGzxinAu00dUgvpfPqcSHesjDqmr4gaTj+aTJTiEbM=@vger.kernel.org
X-Gm-Message-State: AOJu0Ywq8mk88Qs5FTRjP2z1jW1afqS/clWRWURtMkC/4SyTN6zElx1W
	cBIvfktQOmkfQ3GRfVzun7idFcg97FSknEWWVPqSk98FQOpshuYJ+KUu
X-Gm-Gg: AR+sD10x1wC14SqmFk0Czs6hrzAdPGIo0fw+y5ySu/0/rhCrK/ChAImOcI985lGWi9D
	/4ZPmsU40Mwj5JS1E2fGzcSpPXXW/HJmo9e3MxvxCDIP5tsoZQiYJvaOgnZJrjZ8vfCFKnQ9l1L
	isrHzNERI3j+hwalq8pGpCY58Ia6JlrbXfeY4dg/mi0BHvjfADUCQBYaPv8L7nM/qaqOJJ/7yJw
	Gwn9hpeb5uNuhQ3KMM0DMoRdeP77rOCKYcmwI3YCOhSYC2+zAyMvnoVh7t53d1LkKEcYYs24GU0
	szdy/KoqAS/Nw4ARZ9lbvM0lazKMAjOouPnHDdanbpm6zaOqVKvT4LJUeh1YEWMyQxXlLcBda3l
	x4ao0F/xzwSDVykvrxKGB61G5PqBphN3td7bvmgV8H1ccLM32QM7V0dSeabxnnwJ+ivBojdAt8g
	ZnczgZju/+L8k7AqrS8+dtanwNufDoI9EEAww9Ls0DeIlyM7hkl/iRiMALdVUYkkBRm5q20dPam
	RsBneBRnib1CSiprjVAcf8Fyp2V75zvWfPlug==
X-Received: by 2002:a05:6a00:10ca:b0:84e:456d:ab2d with SMTP id d2e1a72fcca58-84e933af6e8mr6425269b3a.45.1785326905311;
        Wed, 29 Jul 2026 05:08:25 -0700 (PDT)
Received: from m-upc-A520M-HDV.lan ([2400:2410:3f60:500:c705:d3b3:a6d9:8512])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-84ea0300ac2sm1263482b3a.35.2026.07.29.05.08.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 29 Jul 2026 05:08:24 -0700 (PDT)
Sender: Yuyang Huang <uyoko90@gmail.com>
From: Yuyang Huang <sigefriedhyy@gmail.com>
To: Yuyang Huang <sigefriedhyy@gmail.com>
Cc: "David S. Miller" <davem@davemloft.net>,
	Bobby Eshleman <bobbyeshleman@meta.com>,
	Chris J Arges <carges@cloudflare.com>,
	David Ahern <dsahern@kernel.org>,
	David Wei <dw@davidwei.uk>,
	Dimitri Daskalakis <dimitri.daskalakis1@gmail.com>,
	Donald Hunter <donald.hunter@gmail.com>,
	Eric Dumazet <edumazet@google.com>,
	Gal Pressman <gal@nvidia.com>,
	Ido Schimmel <idosch@nvidia.com>,
	Jakub Kicinski <kuba@kernel.org>,
	Paolo Abeni <pabeni@redhat.com>,
	Shuah Khan <shuah@kernel.org>,
	Simon Horman <horms@kernel.org>,
	Stanislav Fomichev <sdf@fomichev.me>,
	Willem de Bruijn <willemb@google.com>,
	linux-kernel@vger.kernel.org,
	linux-kselftest@vger.kernel.org,
	netdev@vger.kernel.org
Subject: [PATCH net-next v4 07/10] netlink: specs: rt-route: add route notifications
Date: Wed, 29 Jul 2026 21:07:36 +0900
Message-ID: <20260729120739.47880-8-sigefriedhyy@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260729120739.47880-1-sigefriedhyy@gmail.com>
References: <20260729120739.47880-1-sigefriedhyy@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Declare the RTM_NEWROUTE and RTM_DELROUTE notifications and the route
multicast groups, so that generated clients can subscribe to route
changes. Both notifications reuse the getroute reply attributes.

Signed-off-by: Yuyang Huang <sigefriedhyy@gmail.com>
---
 Documentation/netlink/specs/rt-route.yaml | 19 +++++++++++++++++++
 1 file changed, 19 insertions(+)

diff --git a/Documentation/netlink/specs/rt-route.yaml b/Documentation/netlink/specs/rt-route.yaml
index 33195db96746..62b215614210 100644
--- a/Documentation/netlink/specs/rt-route.yaml
+++ b/Documentation/netlink/specs/rt-route.yaml
@@ -322,3 +322,22 @@ operations:
         request:
           value: 25
           attributes: *all-route-attrs
+    -
+      name: newroute-ntf
+      doc: Notification about a created route.
+      value: 24
+      notify: getroute
+    -
+      name: delroute-ntf
+      doc: Notification about a deleted route.
+      value: 25
+      notify: getroute
+
+mcast-groups:
+  list:
+    -
+      name: rtnlgrp-ipv4-route
+      value: 7
+    -
+      name: rtnlgrp-ipv6-route
+      value: 11
-- 
2.43.0

