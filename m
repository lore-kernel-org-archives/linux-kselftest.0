Received: from mail-wm1-f41.google.com (mail-wm1-f41.google.com [209.85.128.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 300F73DB31B
	for <linux-kselftest@vger.kernel.org>; Wed, 10 Jun 2026 14:47:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781102837; cv=none; b=g7ZEswNQZrLPo9MRG712pCxGpX/ZH1qDekX7HhkX3qH25d0lATwfCHEKPYY92sajsxG9RHt47kkFgoBk5vtsBLYDGvEeUB37NV6OZLffL7mzKuLyeze3h7Nkd2u0/zFpObC48Xj+U6YUuy2LGInMiGVVoIwnkNoaVoyELUmVAFA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781102837; c=relaxed/simple;
	bh=COX1VHjRoe/ogspb3mFubjljRixbXBFDulSIQg2GM4U=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=o8bBLx+fOBJx4Jhct21H+Y1smN/Gk7wjsTX6nBWM9f5bJ2Ysp2Knr4LtYtcB8pd08h8qmsaZjQpunEEO+Nm/hCv9Xmi04NiI+X2eSo+eLzBz4iSw2IpwMXxSIIhXahmEsEodticWrNqXBY/ukb0Ic7hJxMTLEIdhApPVh6y8QWE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=MQqLqCt3; arc=none smtp.client-ip=209.85.128.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="MQqLqCt3"
Received: by mail-wm1-f41.google.com with SMTP id 5b1f17b1804b1-490aaeabdb4so44869905e9.1
        for <linux-kselftest@vger.kernel.org>; Wed, 10 Jun 2026 07:47:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1781102834; x=1781707634; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=pW0vQ1fZte9oW2h1t9hL6NwsrjoJkK4YR5wSpSnn56o=;
        b=MQqLqCt3ATJllUbg1LRp8A7Mv/bntmshft8sq8LA/wVR3hqf9HAuzYAen08+XLaErK
         NAGDoUswlI/f+fe9HiVA/Ed6cfiUATUJZmWhhKi2iQdhuy6BTVyRyDNGzLUEOKzMT5pJ
         wwoAbNEgO7B7L1E3Z6ZBmDfP1Aq5qrEyuzrkbRr+kQNhxReryy6s5L1HsLv1M4gBdqKi
         GY85v3TE3NZNJMTgBkmko2FlS6iSBv5ABJZNa2QDthjy2Yt0yLJ+7I/cnfzOFZJlVKdI
         gphsrEXtLAtDYQo3PsFMIkE9S7D4z3ekPSa3ojOi7hlpiCrS4Rm6LuQ/cJUDK3Br/aVT
         LvsA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781102834; x=1781707634;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=pW0vQ1fZte9oW2h1t9hL6NwsrjoJkK4YR5wSpSnn56o=;
        b=VwwlMICXJm4jCFxulhH2+DKMbe/rsBFrH7B3juBA/rBQtlSg7fSmTEUvYY1yy3Hy/8
         L5iMAO6C7TyyRNXbRV+M/ZYtRSWgV+aOQrpXi0jbQAphVnnpG8gnlbcRAB5PzqPHjhOP
         CcZGAByqFH/Lhca8i3OHxyiqi6k+YChCTgQTutqht9NOc2ZhtyKjLYXSbAI8K4E0EtKI
         aWqSL8xNGq3OZbOwWIovTfWMXka6bZqyyMND0sAnYpzL+MVBEvBB8DMdUUaaJheYJViu
         CmCzRjXadUnnZWud326ao8xn6gr43C5zHYHAGUl8//LeWvLPjJ6gUdg8kuvZlvWnHAqf
         1U2w==
X-Forwarded-Encrypted: i=1; AFNElJ/sfrB6UPQMUkBixcHotiqrSiynSjZlnO0FDgei20JIqFljz0jc0n1mTMt6AxiGNuhl3pxWjlkVN0kkMK1pfv4=@vger.kernel.org
X-Gm-Message-State: AOJu0Yxl1QY3cL20oA1M13X94N6SkEJQ79HS80eXlNrkhwzi3fAa4wq3
	+vbnxz9H9I2uLO+8PdWpo3gKE6ylwBkLFG4OZcsk4gktWkVS6XjtFO/C
X-Gm-Gg: Acq92OHM1IyVP4TCsgmS5VtCEAr8JddtdqmSOnJFuc5zbmihTpcChZzsAdUcyc5chuf
	7RCVyOf/VE9vMN8Q4QRFuj6F9AKlgxkCTnbmT+D7fDPQeGHgmfFm8s03GXDInlFFcxPZetUNeLz
	RDM9crdehGJlja9et40UmgacFj/6Au11s/dTuPstNYSPVA+/0zYlSpzT3ASlaL7/+8G89y3zDTA
	2Uc6Ae9H3S7d/iDTX3oW9VCUK7Gcf4xpMMYQi/BzQk7SaRgekvgGRxdgcZb+m3HZbqqP7UzTLyO
	pzjD0FtAf5opQRqA6H+sK+SoHLggXkXzZltcU7wHFz+Jq2bP4PHKtGMCd3xXOn4jMJ5FOJqfEli
	H2qdRd0V93PL7kSJ/XL5PMLhCdsVNaBn0pJbhuvAiYbK1Pu/hHIORsISbemqgujCXugj0jByTdx
	GnvfJLjs+Jzyg8I6kYtd+Etb1p84C9+RbZkSnw1c73j8Hyd/IbgIXzR7r5r78pzWkB0gWpLD2TU
	mzpDimd4xlopZOVyXEuywAfdzvhAl/d
X-Received: by 2002:a05:600c:3f0e:b0:490:d38c:7836 with SMTP id 5b1f17b1804b1-490d38c7867mr165452235e9.3.1781102834318;
        Wed, 10 Jun 2026 07:47:14 -0700 (PDT)
Received: from gmail.com ([2a01:e11:1403:8620:65d0:ca2a:aeaa:7c0c])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-490dcab9092sm41419235e9.1.2026.06.10.07.47.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 10 Jun 2026 07:47:13 -0700 (PDT)
From: Paolo Pisati <p.pisati@gmail.com>
To: "David S . Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>,
	Paolo Abeni <pabeni@redhat.com>,
	Simon Horman <horms@kernel.org>,
	Shuah Khan <shuah@kernel.org>,
	linux-kselftest@vger.kernel.org
Cc: Paolo Pisati <p.pisati@gmail.com>
Subject: [PATCH] selftests: net: fcnal-test.sh: rmmod br_netfilter at function exit
Date: Wed, 10 Jun 2026 16:46:18 +0200
Message-ID: <20260610144618.35252-1-p.pisati@gmail.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

fcnal-test.sh loads br_netfilter to test bridge-into-VRF scenarios but
does not remove it at function exit (the second modprobe around line 4158
has no matching rmmod). Since tests run sequentially, any test running
after fcnal-test.sh inherits it.

Signed-off-by: Paolo Pisati <p.pisati@gmail.com>
---
 tools/testing/selftests/net/fcnal-test.sh | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/tools/testing/selftests/net/fcnal-test.sh b/tools/testing/selftests/net/fcnal-test.sh
index 890c3f8e51bb..de7b6768882a 100755
--- a/tools/testing/selftests/net/fcnal-test.sh
+++ b/tools/testing/selftests/net/fcnal-test.sh
@@ -4176,6 +4176,8 @@ use_case_br()
 
 	setup_cmd ip li del br0 2>/dev/null
 	setup_cmd_nsb ip li del vlan100 2>/dev/null
+
+	rmmod br_netfilter 2>/dev/null
 }
 
 # VRF only.
-- 
2.43.0

