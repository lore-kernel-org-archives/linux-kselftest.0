Received: from mail-oi1-f179.google.com (mail-oi1-f179.google.com [209.85.167.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6FD78393DE4
	for <linux-kselftest@vger.kernel.org>; Wed, 25 Feb 2026 11:15:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.179
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772018155; cv=none; b=gFrTNf0ztQxVntgfh8Z6YA/0MlkVUhhSusM6DL2eAuX+bY0cSh1CmzIP8Nn0sgHZ0kC0H/1zOCfriZCHQxcqCHe0j85R09gcuy6048ecXlT6QrYdhaGjJuim0KSWWYPIEaV5G9tZp0oP6D9LE0FQsJc9eUekoGny1mMjoqVpctI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772018155; c=relaxed/simple;
	bh=z9U3voXKAW1dQW4AvalaDk7/sRwNuHWW6nH2z8AUJ3U=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=OYokz9C1ZzsHVweQrXA11/WeVCMjalHrmrTUFmSKKfF5YTiesEvuahqLQBC6weGf7uSwK+ZJ/EFZYC1F1lRyz+/36djHfhPVptagRCt8a95YFaginsGdod1p2b8icfCvd0oMcTt140aXfLfWgkCX6hXEsywngqDQAIQ2f0VUT/0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=FY5+aEiN; arc=none smtp.client-ip=209.85.167.179
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="FY5+aEiN"
Received: by mail-oi1-f179.google.com with SMTP id 5614622812f47-45f18e8f2f5so4686247b6e.3
        for <linux-kselftest@vger.kernel.org>; Wed, 25 Feb 2026 03:15:53 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1772018152; x=1772622952; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=amTmzSl8ryBjjcQX/dMxltL1tsvRdkBfJuWHJ8vklYI=;
        b=FY5+aEiNLYtcVcEvpFjqs0KrYjN7m6rWAP8vDbSmTe4afI7cOjcSsGST9+4uObu+QA
         SvpyFA+ywSIJpnJ4tBSd1Q7qV86sxb0Z9mJ47AF0mlNpDzSVj+bm/s+3kTI2qNzzmZuM
         Fcno5b68VobhOHEcjeVeZA4ZGKB4yrp+va+XEajKUi2MIDKkhDtqtWy/63DbA2kPrKwT
         h9d55NtV76F3nmUI4TMMkaDce3B/qvYkVqfPBvwjQ9tGWS/HvG0l8SeBWghn77oMflF3
         oRZxgm6Fj/IL7a6wO39XQ3XF+6OxZlh13J9+/9MFxaV4wPwREKDDigAY4ATzTPnTTvVM
         SXfA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772018152; x=1772622952;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=amTmzSl8ryBjjcQX/dMxltL1tsvRdkBfJuWHJ8vklYI=;
        b=guM/viR3O28GrYF5jij4UfU4+Xt0v8mAzibRulJ5M7baw2tPbDClqYq1RIbtok5RNQ
         DFP0tDGJrKv5yzsXxj+wI6JvWocqK2m4H/JAtZ+8PNwzZn/vhfkRwkltlDac/he8Ulb/
         d9IGd3XgbcaQuXezAHCpWeH4+0ovnJGiErG0Ff+Nt3PPb1Xk1epRKIpMnS4v7AMHPFBu
         tRZgi/VqjFvBRlZ0OoFFuht31iHF9v9ORVWuwxqHp0EwybH0WFw72SozK0uqyKiRxNLX
         l+0M5nmIQ+qTHpjruz1SlRPTH957JBe0mtm3SS/GqbxzXl+3x3i0hhhrAVopGlp8C+3A
         jk7w==
X-Gm-Message-State: AOJu0Yy4JJDpXasjMt+lntAFI2FAOEG52GtwGeGylyklinNIKnmQ5vT1
	FXnIfC25JAJLF7rCoNwy+sayHXRrZu20fTlrI7QIPXMhZLKnzbvuyOC8
X-Gm-Gg: ATEYQzwBBMZPV9VPUyYfUiEJudZtxWiKhuLv4syG8x/u6SM6zCzUqHitaEx00WCvMj9
	cewPRXfZ5oZzoTwVujXI6FK4ZhAsyVJ8imEuheixMtstOvnLtnfhaS7xq/sWqwMLSusQF1JD/k8
	hx+iguXz6dD1gOSAq94oqPRsa/V2kIEcLG7vdxw6FhfexNhVF2fvPUIzIFzk4F30AdOx2XzIZel
	Sj9JhUeliQa7LnaKsowqE6ypJJhsbJ7rzRD9l+yFDKLH06IzUrSVymExUbHTaTT3BNGVzkqiV9a
	ejsqsN8aHukCRGEPwWjij1oufFZ3Fyy/HaCauxzit2iPFVN65BrqUkztW3RRdUdgvVzhHZ3GV/7
	zk5VUwrfzSuTE2u4Pl6uITEjz5BqmhpEmDTxjuCpkYmzouYDFjYxrrwko9C1v90K6oQMgHoVaNH
	pfgpk1vRLIM02wvNYuzqMVVtib70hoVHyBhA+tCh1K7T94MxRll0poRELUzPxSLyZ71frgRFCDg
	Y1MhCxWg7VxhHbTMtLbY/3FBJY/vUupjA==
X-Received: by 2002:a05:6870:c1cc:b0:40e:98cf:e01d with SMTP id 586e51a60fabf-4157ac6d17dmr8762285fac.20.1772018152330;
        Wed, 25 Feb 2026 03:15:52 -0800 (PST)
Received: from localhost.localdomain (108-214-96-168.lightspeed.sntcca.sbcglobal.net. [108.214.96.168])
        by smtp.gmail.com with ESMTPSA id 586e51a60fabf-4157d34a224sm13053927fac.17.2026.02.25.03.15.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 25 Feb 2026 03:15:51 -0800 (PST)
From: Sun Jian <sun.jian.kdev@gmail.com>
To: Shuah Khan <shuah@kernel.org>,
	Jakub Kicinski <kuba@kernel.org>
Cc: linux-kselftest@vger.kernel.org,
	netdev@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Kees Cook <kees@kernel.org>,
	"David S . Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Paolo Abeni <pabeni@redhat.com>,
	Simon Horman <horms@kernel.org>,
	Sun Jian <sun.jian.kdev@gmail.com>
Subject: [PATCH v3 v3 2/2] selftests: net: tun: don't abort XFAIL cases
Date: Wed, 25 Feb 2026 19:14:51 +0800
Message-ID: <20260225111451.347923-2-sun.jian.kdev@gmail.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The tun UDP tunnel GSO fixture contains XFAIL-marked variants intended to
exercise failure paths (e.g. EMSGSIZE / "Message too long").
Using ASSERT_EQ() in these tests aborts the subtest, which prevents the
harness from classifying them as XFAIL and can make the overall net: tun
test fail.

Switch the relevant ASSERT_EQ() checks to EXPECT_EQ() so the subtests
continue running and the failures are correctly reported and accounted
as XFAIL where applicable.

Signed-off-by: Sun Jian <sun.jian.kdev@gmail.com>
---
 tools/testing/selftests/net/tun.c | 12 ++++++------
 1 file changed, 6 insertions(+), 6 deletions(-)

diff --git a/tools/testing/selftests/net/tun.c b/tools/testing/selftests/net/tun.c
index 8a5cd5cb5472..cf106a49b55e 100644
--- a/tools/testing/selftests/net/tun.c
+++ b/tools/testing/selftests/net/tun.c
@@ -944,8 +944,8 @@ TEST_F(tun_vnet_udptnl, send_gso_packet)
 	ASSERT_EQ(ret, off);
 
 	ret = receive_gso_packet_from_tunnel(self, variant, &r_num_mss);
-	ASSERT_EQ(ret, variant->data_size);
-	ASSERT_EQ(r_num_mss, variant->r_num_mss);
+	EXPECT_EQ(ret, variant->data_size);
+	EXPECT_EQ(r_num_mss, variant->r_num_mss);
 }
 
 TEST_F(tun_vnet_udptnl, recv_gso_packet)
@@ -955,18 +955,18 @@ TEST_F(tun_vnet_udptnl, recv_gso_packet)
 	int ret, gso_type = VIRTIO_NET_HDR_GSO_UDP_L4;
 
 	ret = send_gso_packet_into_tunnel(self, variant);
-	ASSERT_EQ(ret, variant->data_size);
+	EXPECT_EQ(ret, variant->data_size);
 
 	memset(&vnet_hdr, 0, sizeof(vnet_hdr));
 	ret = receive_gso_packet_from_tun(self, variant, &vnet_hdr);
-	ASSERT_EQ(ret, variant->data_size);
+	EXPECT_EQ(ret, variant->data_size);
 
 	if (!variant->no_gso) {
-		ASSERT_EQ(vh->gso_size, variant->gso_size);
+		EXPECT_EQ(vh->gso_size, variant->gso_size);
 		gso_type |= (variant->tunnel_type & UDP_TUNNEL_OUTER_IPV4) ?
 				    (VIRTIO_NET_HDR_GSO_UDP_TUNNEL_IPV4) :
 				    (VIRTIO_NET_HDR_GSO_UDP_TUNNEL_IPV6);
-		ASSERT_EQ(vh->gso_type, gso_type);
+		EXPECT_EQ(vh->gso_type, gso_type);
 	}
 }
 
-- 
2.43.0

