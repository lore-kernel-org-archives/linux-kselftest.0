Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.229.8
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793917269;
	b=P1DQsnVj3NUHQZDMCOLthUSJrvFLlzY6j9Z2daxdZdKau7Qaip41UuzVJr9s3k+PbKHP
	 TNqDfu7bpO2UiA9JwTdvw3uEo96MnXLLHbHnXuhpcbjc00ci1NNNG1v+3HbsD/ChoiuCs
	 lL1xGeHZ+e5ze6173M8O3tcaQlwbRHRVia3wv/TF8LJz/bG6UHG4XwTV2H7CZsHx3hQpd
	 kFnEBjx6tb48fZGSv5rJVal4hM7RpzK6CcmuyKou5OmltF6R2tXSNx7lZ4zDxE3Si5uQI
	 CmZI3Ng37WAiiRRulJR9nuapc0obRkdqYHK2W49rK8k15NAv1f6bFFLjo/3JAowcGkg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793917269;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:X-Google-Original-From:To:Cc:Subject:Date:Message-ID:X-Mailer:
	 In-Reply-To:References:MIME-Version:Content-Transfer-Encoding;
	bh=4db2AlEwBuJ3NhUvd6DttANYOsA8cpC5/Z0gBUqIqT0=;
	b=h5WEEPYd7uMNTKFmVz6avDFeBl/fpPGiEDZtswQvPY6NuEf2fZZRujURejR1+vUNr0GU
	 7gBaNS7/g7OUZS42wTg3wabXtm58WY5RxzGthPKzVBHHpWM1toMKTgupKxwewimBYNgAD
	 2cdsqoKUiDVIgXZYUUo5k4ma7gpPyb97o2RBJNx6jIXHbIJoYxc5w2iQHMzj4zAGGjZvx
	 RH5uXRqLwdw5HjCum4T/9uTt+ZCbYmxn3aSbV7dazOxa6Vb3Yee0jPPZ+b0Xv5fwQxEfU
	 Os6Kw2D2/GMgs3MY/qQsgsdh68Jcem8Myc95zLaHAiXzQQb0B0Wi6oRI11ZoISOw2KA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=ZrlqBW95;
	arc=none smtp.remote-ip=74.125.229.8
Received: from mail-dy2-f8.google.com (mail-dy2-f8.google.com [74.125.229.8])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ABCDF606D83C
	for <linux-kselftest@vger.kernel.org>; Thu,  5 Nov 2026 22:21:08 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org ABCDF606D83C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=ZrlqBW95
Received: by mail-dy2-f8.google.com with SMTP id 5a478bee46e88-36c9919c659so963eec.1
        for <linux-kselftest@vger.kernel.org>; Thu, 05 Nov 2026 14:21:08 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793917268; x=1794522068; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=4db2AlEwBuJ3NhUvd6DttANYOsA8cpC5/Z0gBUqIqT0=;
        b=ZrlqBW957FVRSJmhWtYT2LZ20iLqM9RUGB7Z0X1CqCOXFP0vE1Q7C6Q2nXJgpBFRq4
         Y0uMg2XCt+yCfud4FgOvOKF0JHJPs0lVYLnGJQ4jcxxF70pQppH8nnLD50s6trUzqKW9
         HGpBPaeom520SaQnpAAKksjsd0wAIXkDsU+aD/KgENAMz/PYFf5jq4jUvqCBiJJpoqLG
         v+bH1XZdZ6WrabNwkAW+3z+BeWR94LS0RIHFvavciURbGe8OriTuxF/R+Rx58PPkE5Js
         VeLlpHVqQwrZGLRVasQ9dARnv4xZUCKPjgg+Sgd9mEmFSk4Osvn6arU4uu75Bok6gbqw
         aZQQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793917268; x=1794522068;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=4db2AlEwBuJ3NhUvd6DttANYOsA8cpC5/Z0gBUqIqT0=;
        b=vODoqrflEvlGt7iUAQGGpwOcuOAxU9tCil1eOhw8Mx5UMwB8w6kIMOzpO4ohjg5Fjj
         +mtqNGcIM6xN4mKGOrpSaQhEaqIEboylq7h+jbqgLUrAO+lS+g7h85p+O/dgT/fVFRpY
         OM3pu+c7Krc5Whct1lwdPV/4dxeR3XFr7LtLj74U15mkP7ASmkVB4/AAy6LtrLukWMfc
         ZdXzj5f0P0wNx5GS7cemA7L+NVFs+IynQ7xh7tjoXnT7rRKoa91SYydgb/Bu0YMU132Y
         doYwU5ppw7B9eaSD4yCZ90yTy5xTEXdxi6jrc/9a+goouPfubWc4stp1k0hz2E7DKq9R
         4vOg==
X-Forwarded-Encrypted: i=1; AKwUvBzbWEhNSUHBOIxuU7nbrnZYPLT4m2wDxjgC6NLuCcGjS/qAVFo0nCUW2ucZP+klxlhwipdipcvhfELZ0zSTzMk=@vger.kernel.org
X-Gm-Message-State: APuU4Z91LnlwNvR2mGzeq7gaFtFe8EDJ9vxElZMidCNhDgEFMa6ekW93
	bbefvM8YqbT+7szOACWWXTzGsNhH0RwYMlZjWVw95JkB5mnAwv+6ta1u
X-Gm-Gg: AYBFou2Yv7qP0R0OEh9ygIKg/yMG7xQ+Q8OE/yWSjGiiV1vUDuUN8DkRa3BMiRZFmPF
	Ea7LCcv416roxHhTym30Oscz105b53aGCzutNb5nl86stphgy+NZ+K/bbZUXSyKQ2KZuuEFW9kW
	BG4zIMzcIFB4ve3j9loiCpIAoTYRH06QZizlw3xUvFAg1+FAB6vhwt79m/GDq9esjJZhNV5Ny9J
	WKbQHSJu8oSs0bU021zaGxNxzvDBFzeSfrbOGlT4lIPDjA+WeRusWJBfadZauocTv0+QNx+/2N4
	o7/2iM7/9QSoRMulRSUTT3y5/oHz6soZFezyAlyJevf1PuYzRdS9AFocCWZHaxR3/K0BX1nGfmr
	D8PcMe7VAH7X/PY6FYHMzlelvRqIKezyNPVMwmKXEzbnBYorWDdAZ3BWdqg/NnQoY89SaIsTyhE
	Zt3MM0awL5AYCPsANIYnpK2w5VHWf8/zroOzOIzm7pXFi/S2YGjs/hHwXGvSBD8bgdM3omF7bAf
	DEfiO36TPJeyfVfQxONdhJTVPwq5GopTgIW7yVrR5HBnI91umiX06feSD8JpbVWiPgbgJ5/MMuR
	gOSVeP67H56pzZ3eckiECsU=
X-Received: by 2002:a05:701b:4590:10b0:149:1feb:6d9d with SMTP id a92af1059eb24-1b25d31efafmr453115c88.19.1793917267847;
        Thu, 05 Nov 2026 14:21:07 -0800 (PST)
Received: from localhost ([2a03:2880:9ff:6a::])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-1b245c6f0dcsm26931436c88.21.2026.11.05.14.21.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 05 Nov 2026 14:21:07 -0800 (PST)
From: Stanislav Fomichev <sdf.kernel@gmail.com>
X-Google-Original-From: Stanislav Fomichev <sdf@fomichev.me>
To: netdev@vger.kernel.org
Cc: davem@davemloft.net,
	edumazet@google.com,
	kuba@kernel.org,
	pabeni@redhat.com,
	andrew+netdev@lunn.ch,
	edumazet@kernel.org,
	horms@kernel.org,
	corbet@lwn.net,
	skhan@linuxfoundation.org,
	rdunlap@infradead.org,
	michael.chan@broadcom.com,
	pavan.chebbi@broadcom.com,
	saeedm@nvidia.com,
	tariqt@nvidia.com,
	mbloch@nvidia.com,
	alexanderduyck@fb.com,
	kernel-team@meta.com,
	sdf@fomichev.me,
	dimitri.daskalakis1@gmail.com,
	almasrymina@google.com,
	dtatulea@nvidia.com,
	bobbyeshleman@meta.com,
	asml.silence@gmail.com,
	daniel@iogearbox.net,
	razor@blackwall.org,
	leitao@debian.org,
	linux-doc@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-rdma@vger.kernel.org,
	linux-kselftest@vger.kernel.org,
	leon@kernel.org
Subject: [PATCH net-next v3 6/9] eth: fbnic: set the netmem TX frag size limit to 32KB
Date: Thu,  5 Nov 2026 14:20:55 -0800
Message-ID: <20261105222058.944293-7-sdf@fomichev.me>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20261105222058.944293-1-sdf@fomichev.me>
References: <20261105222058.944293-1-sdf@fomichev.me>
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Post: <mailto:linux-kselftest@vger.kernel.org>
List-Help: <mailto:linux-kselftest+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kselftest+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The TX descriptor length field (FBNIC_TWD_LEN_MASK) is 16 bits wide.
Set the netmem TX frag size limit to the largest power of 2 which fits,
like bnxt. With 64K pages this also lowers the PAGE_SIZE default, whose
64KB frags don't fit the length field.

Signed-off-by: Stanislav Fomichev <sdf@fomichev.me>
---
 drivers/net/ethernet/meta/fbnic/fbnic_netdev.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/net/ethernet/meta/fbnic/fbnic_netdev.c b/drivers/net/ethernet/meta/fbnic/fbnic_netdev.c
index 8a6703afca38..0a2b66202aec 100644
--- a/drivers/net/ethernet/meta/fbnic/fbnic_netdev.c
+++ b/drivers/net/ethernet/meta/fbnic/fbnic_netdev.c
@@ -760,6 +760,7 @@ struct net_device *fbnic_netdev_alloc(struct fbnic_dev *fbd)
 	netdev->stat_ops = &fbnic_stat_ops;
 	netdev->queue_mgmt_ops = &fbnic_queue_mgmt_ops;
 	netdev->netmem_tx = NETMEM_TX_DMA;
+	netdev->netmem_tx_max_frag_size = SZ_32K;
 
 	fbnic_set_ethtool_ops(netdev);
 
-- 
2.53.0-Meta

