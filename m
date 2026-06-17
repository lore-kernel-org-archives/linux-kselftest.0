Received: from smtp-relay-internal-0.canonical.com (smtp-relay-internal-0.canonical.com [185.125.188.122])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1CEBC3B3899
	for <linux-kselftest@vger.kernel.org>; Wed, 17 Jun 2026 06:10:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.125.188.122
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781676660; cv=none; b=N54A2b8GXh6JpmHYh5h4NTkK+bQpbS0WZOjDDIaY0Kak+gJP1xXjEk5EvxBeSmXl2JrzilyTN/groK6O0piqptz+U2D8NResjW0hL7GfIVGL0mZGe6BzMwv0Ex4DHZb6aik+t5sZfcYbuzre9yqXNfTD/kjd+jABwEhCZ4+eSes=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781676660; c=relaxed/simple;
	bh=oJAtrOLVtF+GBmtQGqaY9bBzbr0/iVZWQUsi/oY1hhc=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=VdmO2jURD/lwPbbEQpnVJDfmyYciC4lOZAfuvAwpRH7X/Epk1KU1dQ2AzuR1SfEverjtZHwanuMblcorxePKNkx7G+YEeRkRilZlIS1ZB2/9cedk1ICOO36gOnZb26f3vp5mnxIJEsQul0TjBY6FJgP68HuntPalKsLnTgD1fKg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=canonical.com; spf=pass smtp.mailfrom=canonical.com; dkim=pass (4096-bit key) header.d=canonical.com header.i=@canonical.com header.b=L1dNSXLd; arc=none smtp.client-ip=185.125.188.122
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=canonical.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=canonical.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (4096-bit key) header.d=canonical.com header.i=@canonical.com header.b="L1dNSXLd"
Received: from mail-wm1-f69.google.com (mail-wm1-f69.google.com [209.85.128.69])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-relay-internal-0.canonical.com (Postfix) with ESMTPS id 7782A3F63D
	for <linux-kselftest@vger.kernel.org>; Wed, 17 Jun 2026 06:10:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canonical.com;
	s=20251003; t=1781676656;
	bh=yYyjbUwTbz5kYjrY+YDLT8Sq9O45djIje08c44tj+s0=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version;
	b=L1dNSXLdhygcRMn7A9AblErsG9ZIB//1tFzNasW3PyXsr0MPvoj0xX4nPdaK88C0U
	 OCU35XLLR1R3HJ0CKUZfxDVrHdhEPjaAz4q1qPmE452CfLdLwIVY7pXukPGErtaQ+p
	 ihzRghRE32xA3GBkr6Kedhbzvh+6du8iwEvWLvl44pEog9ldySC+PC73Dq/hFzpVHy
	 3xVDZs3qA9uIQ8uX5Og4h3wSNb+14RKAf5qhI0Y/UNtZTrGLOZAOPSfeNxhlzuR36q
	 zx2W/C2jezx5x0YfYH102h2hulc8mjKuPTnXTU3QLguxzG4UzR1bFNsz+WPyjxgSQH
	 /iHf2WZnA9rPTRVU2f2al3UVoi2TomeiZZ+hk17FdOIz60LWfRfQ9EKPW0dAy3dMzg
	 E40wueYTxcU7KjhX3pgBhTuYpsCXq3Sg8I6NoJrKJIFLLLndPoBffluPvJMaQa9qrI
	 p8WuU0PY8Fk6JyXYQpAoPrq+dY5axMOavoDgrPBJrm8usvyPq711WVoViHgAgi9AHE
	 dhX44iTr+HVmJ05GhQZyYhBfwq/ZK+Jv+uQBPc+JodgSNgRxuGw0f2CagNlvTpxJAl
	 YDi0sumNWriNVVZMHk7uU7rHmQcMpssKkGHfC56SmvGWTHlFw/UQZ6D/TQnbK1yvda
	 3yPwtNmhk/t8EIAONgLCC8Ao=
Received: by mail-wm1-f69.google.com with SMTP id 5b1f17b1804b1-490ae0167ceso28625345e9.1
        for <linux-kselftest@vger.kernel.org>; Tue, 16 Jun 2026 23:10:56 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781676656; x=1782281456;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=yYyjbUwTbz5kYjrY+YDLT8Sq9O45djIje08c44tj+s0=;
        b=ElPQ0iw69JefEC/sJqfHGo6LUO7aUQQjVTF8Spidd8M+DE/VYVostj/PrTfOpHQfZU
         0u3A7wENWHbapOAd4oTqldEIM+kAb6KPgRgEmAfmDiYOYoh0X30yX9ld37sKncA+Cid8
         8qaCyvzW8wIl8PnmG34GrTLiOa0c7dtaT+mhhkPU+SKlarPXUzOTqW9fxgShpqfSAoi+
         ko3o4RPv24RblD5SOpO5By3XoCUj/WJ+6POr2bJsmLWK6ulR0ZxgcRL8mXTvThmW6qUr
         oIbbVCw2ZCON5IGzzurM2SADjMoWwqJOUOnpzfC7LbuKQhki1uEaQv8ETx13IQGKwPxZ
         kKtA==
X-Gm-Message-State: AOJu0YxF43PYEekr6kWMRKtZALu8sCai0kZPEhl7BjneaR709q2vWrla
	KLo5qgmnBlhiUV47hXvfiThN0klOgMAVZdC2S/5K7AcqtzAkU1aaqPGYchCTxgTPFgHhVOmOXC7
	en3WCeOiPR1HQVN6rmul1gVi7l4i4+KBAR9JQIJ4YOSjPdY9EHMVVFdX10MNO9yA2fhROIbSOyD
	lpxs1nsmw+5I0ELgSeEG2y
X-Gm-Gg: Acq92OEMwvJ7eZntym4L0mccUOa0FVyuly+tXS8vXUwKnK6fTufjw/XPt+VNKO/Ifmz
	mi31rixbOSd/uo/iQeuN4uzHykqShhgE3YXQ8q1YaAUy2InO5TJijq1PdHp1REBkTanPedDv1k6
	c4yvSLC33+1jKuD9FYy9D1kpOTkXiH+M0IZ6EKSVdoymGe8s1inq/O4DHNVsfJaEdDH0FKeNodf
	lt/TMslSXdXDQtyMPCHrvt2Jre7mBacXJRPf6OMgMZQfoKKejSEmVPf/VV64Fer5CWXLos061pQ
	7DPU6p7lcGA5vQKcYhr0jjyRZk9mG9yngaMtgK97nGjg89CTSx6mG5P2FVMn5b9R6KGO9iiAV1H
	qy8XLBX/iAWU=
X-Received: by 2002:a05:600c:5644:b0:490:adb6:7957 with SMTP id 5b1f17b1804b1-49234141d98mr16811835e9.33.1781676656064;
        Tue, 16 Jun 2026 23:10:56 -0700 (PDT)
X-Received: by 2002:a05:600c:5644:b0:490:adb6:7957 with SMTP id 5b1f17b1804b1-49234141d98mr16811665e9.33.1781676655730;
        Tue, 16 Jun 2026 23:10:55 -0700 (PDT)
Received: from ross-pc.local ([2001:67c:1562:8007::aac:41a0])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4606f26f309sm46674988f8f.14.2026.06.16.23.10.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 16 Jun 2026 23:10:55 -0700 (PDT)
From: Ross Porter <ross.porter@canonical.com>
To: linux-kselftest@vger.kernel.org,
	netdev@vger.kernel.org
Cc: ross.porter@canonical.com,
	stable@vger.kernel.org,
	Edoardo Canepa <edoardo.canepa@canonical.com>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>,
	Paolo Abeni <pabeni@redhat.com>,
	Simon Horman <horms@kernel.org>,
	Shuah Khan <shuah@kernel.org>,
	Brett A C Sheffield <bacs@librecast.net>,
	Oscar Maes <oscmaes92@gmail.com>,
	linux-kernel@vger.kernel.org
Subject: [PATCH v2 1/1] selftests: net: fix file owner for broadcast_ether_dst test
Date: Wed, 17 Jun 2026 18:10:39 +1200
Message-ID: <20260617061039.79717-2-ross.porter@canonical.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260617061039.79717-1-ross.porter@canonical.com>
References: <20260617061039.79717-1-ross.porter@canonical.com>
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Ensure the output file is always owned by root (even if tcpdump was 
compiled with `--with-user`), by passing the `-Z root` argument when 
invoking it.

Cc: stable@vger.kernel.org
Reported-by: Edoardo Canepa <edoardo.canepa@canonical.com>
Closes: https://bugs.launchpad.net/ubuntu-kernel-tests/+bug/2129815
Fixes: bf59028ea8d4 ("selftests: net: add test for destination in broadcast packets")
Suggested-by: Edoardo Canepa <edoardo.canepa@canonical.com>
Tested-by: Ross Porter <ross.porter@canonical.com>
Signed-off-by: Ross Porter <ross.porter@canonical.com>
---
 tools/testing/selftests/net/broadcast_ether_dst.sh | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/tools/testing/selftests/net/broadcast_ether_dst.sh b/tools/testing/selftests/net/broadcast_ether_dst.sh
index 334a7eca8a80..5e7a8fe23c7a 100755
--- a/tools/testing/selftests/net/broadcast_ether_dst.sh
+++ b/tools/testing/selftests/net/broadcast_ether_dst.sh
@@ -44,7 +44,7 @@ test_broadcast_ether_dst() {
 	# tcpdump will exit after receiving a single packet
 	# timeout will kill tcpdump if it is still running after 2s
 	timeout 2s ip netns exec "${CLIENT_NS}" \
-		tcpdump -i link0 -c 1 -w "${CAPFILE}" icmp &> "${OUTPUT}" &
+		tcpdump -i link0 -c 1 -w "${CAPFILE}" -Z root icmp &> "${OUTPUT}" &
 	pid=$!
 	slowwait 1 grep -qs "listening" "${OUTPUT}"
 
-- 
2.53.0

