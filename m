Received: from mail-pf1-f172.google.com (mail-pf1-f172.google.com [209.85.210.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 57765480943
	for <linux-kselftest@vger.kernel.org>; Wed, 29 Jul 2026 12:08:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785326911; cv=none; b=lhcefy2A7RPWVHxNFBS6qWbcQaxGlYfO9iZWAMlIlP1DvUUk4kU7Ygyimi29aLr+4uccHr/aKX/CHr0a+G6kG8ruAJqcuNyfmajJaqrxW+kg+lZLrfhpTHHHJkIfIWTP3rGiwYWMYL9YdOglj7m013lMVyP/xNhNeHeze6BAGa0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785326911; c=relaxed/simple;
	bh=/1aVlWW0aqZciYFSw+AOVrBgxkbF7Mvd+1bStEYFWQ8=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=ABwuu52Tbh0nOI7NdoCYb2O9k+9eoLE5gq2XlMHuThqWhiNb7Kt8VfL8F7qXInR4t7jJ0KsVkhIoIPaiX5vwoPxTH0+wONcgHYwOatLLLIKO2SU7ERznUgHOf+p8moZ4TZqnTTCbD4Eiy2yWCZiLkgdJSt7KyJtUaKfuW/dGdMA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=VjSfGnZe; arc=none smtp.client-ip=209.85.210.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="VjSfGnZe"
Received: by mail-pf1-f172.google.com with SMTP id d2e1a72fcca58-8423f236418so654154b3a.1
        for <linux-kselftest@vger.kernel.org>; Wed, 29 Jul 2026 05:08:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1785326910; x=1785931710; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:sender:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=yuxY4tXM3iR0bUsRR6CCNuiHoOS0/eoyg0oTXxAyJpU=;
        b=VjSfGnZeerrSMtKMf30hC0mQiEE1zpMlTZEKxr4lis8XO6vKfVHM/murCf5lVGhh3R
         0VJYfT6dCjWVxc2aJKETvvrcFL0IwbBjHLGpE5EY2iRAUx44cCc9pISWbt2rx3L7ez44
         Zky1qrn4KBeiWmB1xCdxGSPFqoKhc5ZqmUdXAHJdHyn1m59sGKm3EPPWnTAhztBNKXnq
         vV9/fikOhHvUjGSKXj2s4jmbkbB4VHnKFJwe80+2eGXZ3tUPQHqDC40GjfNdaVk1AScQ
         YjQujbHuF8UgKxEdo3ooklaat6V0Sqpx3ouCIi4LJu0dhY5degiafg/WF1CI3Xsf/c6Z
         MSOA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785326910; x=1785931710;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:sender:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=yuxY4tXM3iR0bUsRR6CCNuiHoOS0/eoyg0oTXxAyJpU=;
        b=Uaelu4MQldv99pth45U0joSYwSx2Rh0sIMEPIzpqNXs3M9WumHoWqmol8lWk49P7/G
         GwT6G9EZRBFJKYdMQpsPJnwyPIffB0SjLqnecqHh7W0VgfkA2PxFtwrTP0dZLrEtBqQK
         w18nwBBNlxAm2OJ1AokU8TMveKezmuxW+lnRht+wV7cO86/t0PGqzKwIShTiM2OYXFil
         lvB9igNHsjbx3FDHi/SEx12KWY2EdvCmY0Bb35by8mybnpympiselKL3lczfsCjPxgLD
         HYS7GmK6aY4PIZXK+8Gl5U8XJ+yW+cdJgapfBobhgWZviZS5+v+Yjhh41OUp0LBBkph0
         MTtQ==
X-Forwarded-Encrypted: i=1; AHgh+RrHREaOVQ5X+Cc2Q0QMVw06BdU3gxFWSCjCMViqOdl3bju6aKzIjvBqrOVXJRTTYG5TulVkRRxuWSHqYBcQwNI=@vger.kernel.org
X-Gm-Message-State: AOJu0YzSN4WXk2zwlwhaPpQU+TF7fp18sw52sUlAHTLkRodX2p8Iqq8z
	WZ08vgtlvVKhzM+IzdXh9sTw9l132O5eG8D6TsDGm/fZ6EfFqVeqr5kn
X-Gm-Gg: AR+sD11qUTCMFTAq24SBeINuXIFnE672G908DEo5Zv0/u0UyuDu7Klg4cStgZQ0fTC/
	3KeglQ4QiiqAxe/Na3gzZEvNFvgA6sujSLzf2x9/LPovtUyD8xS3EjhhqlnjS9whgSZKModvqHr
	9WNkflszubC7JHka0JHqYVOE8ccs7+TEquTZk5V45nEsSZa1OiWQQonvfNO3NU+FSELxMNzxzKA
	uH9XG6mpSRD7qgp2x4LvHa93ZzdjWZMG0lwVE4uFh/yH6NUywb54h9oGkYDzNhp0rQn4PvX7CNQ
	XoyZDbdgGXsxhGgx5z/1IWvPdG38ZVIoMDZbyyHB+m3747gRuUYjU3XteFsLGORsQe8npRNEoy1
	RFiUEJVVziY4fZjIi9vTDGbnhYBC4D6WdQNU9eOO1EI2CFt1HaL0HbBB9taHQfiWyfVNiNeENMH
	Xpeyi9IYVF1LhslId5dUQ7L9CcnuDuHGvwXao1hwakYfFz/yMg4HTcuh7yz9+mPrEwCG97z4ZaC
	EK5olwjUZoNac3F8ELHT8i5TvBX8jJsUuEJBQ==
X-Received: by 2002:a05:6a00:1889:b0:845:c694:5c3d with SMTP id d2e1a72fcca58-84e9310d9b9mr6927453b3a.1.1785326909669;
        Wed, 29 Jul 2026 05:08:29 -0700 (PDT)
Received: from m-upc-A520M-HDV.lan ([2400:2410:3f60:500:c705:d3b3:a6d9:8512])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-84ea0300ac2sm1263482b3a.35.2026.07.29.05.08.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 29 Jul 2026 05:08:28 -0700 (PDT)
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
Subject: [PATCH net-next v4 08/10] netlink: specs: rt-route: split out the request attribute list
Date: Wed, 29 Jul 2026 21:07:37 +0900
Message-ID: <20260729120739.47880-9-sigefriedhyy@gmail.com>
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

The newroute and delroute requests alias the same attribute list as the
getroute reply, but requests and replies do not carry the same
attributes. Give the requests their own list.

The two lists are identical today, so the generated code does not
change.

Signed-off-by: Yuyang Huang <sigefriedhyy@gmail.com>
---
 Documentation/netlink/specs/rt-route.yaml | 32 +++++++++++++++++++++--
 1 file changed, 30 insertions(+), 2 deletions(-)

diff --git a/Documentation/netlink/specs/rt-route.yaml b/Documentation/netlink/specs/rt-route.yaml
index 62b215614210..9f4a1a253676 100644
--- a/Documentation/netlink/specs/rt-route.yaml
+++ b/Documentation/netlink/specs/rt-route.yaml
@@ -313,7 +313,35 @@ operations:
       do:
         request:
           value: 24
-          attributes: *all-route-attrs
+          attributes: &route-req-attrs
+            - dst
+            - src
+            - iif
+            - oif
+            - gateway
+            - priority
+            - prefsrc
+            - metrics
+            - multipath
+            - flow
+            - cacheinfo
+            - table
+            - mark
+            - mfc-stats
+            - via
+            - newdst
+            - pref
+            - encap-type
+            - encap
+            - expires
+            - pad
+            - uid
+            - ttl-propagate
+            - ip-proto
+            - sport
+            - dport
+            - nh-id
+            - flowlabel
     -
       name: delroute
       doc: Delete an existing route
@@ -321,7 +349,7 @@ operations:
       do:
         request:
           value: 25
-          attributes: *all-route-attrs
+          attributes: *route-req-attrs
     -
       name: newroute-ntf
       doc: Notification about a created route.
-- 
2.43.0

