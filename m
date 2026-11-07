Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.171
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794051262;
	b=hsC33aY2SUrW1H1PFaD5ln2BXVSFy7BgHGEhArUJVDURsXuJhXYkBWL8hVRu94ys2eJO
	 7URqE7w4FRdWgo3DYI6yXSjVGEbkS/Ht+EMSTXjKbDSv30vka1PKzi0SJ74M9VXT3Aq7G
	 LNGZCGXfDxfykMYxTeG6jvCq6zBgVt4+nay9rEdp/EVg5E5mp37Yam39mmi/qpAbfmVPi
	 VK37KOeyHXvluY1mmaMQWT0e5+IhmT5EHswlgi+Xj7eFbt5ZCYRjFtQoSaJYLG1wq6olP
	 ei7yWStKvylrfpxELYx/HF/uQE/FFDQegum5gfTa8koTkYzg6pFee1bblV6aXCTz+iw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794051262;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding;
	bh=8Y4wuXjHScY3iujceiUAqjM+xKc+nuPmQr+0vb7xGNE=;
	b=hkVa4EWD636VLGB/EhPcPhTbePLGcUmAk+bBo7fo7Z749MuGie3dl1kkOEmCsJOrJW8Q
	 Vnw5C4xkqcj7wk+c9pvc2EzDXoR4wMRZPze1FpzY3BgPbNNK0YZeG5lM7eIyAy2DHxV9U
	 XuKqnAogO+CivHjRRjkZA8EFdWFosouTuktBbfucj0txWhHeq985Da+0HcB1vZ14hsjIw
	 gY8+wC09u/UU0xzBM6t2X8PE2DGzwx33HW698W7zGDY5tAsJu6SvtHR9OtbLZWAaV+ehs
	 0hzycqc3NAwMUFR6IooauwNu3gqqF9CWXWmxX7hbhRhVfdSzTK/Z1qoG5MO9Ccb3W8A==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=m9zxtFYa;
	arc=none smtp.remote-ip=209.85.128.171
Received: from mail-yw1-f171.google.com (mail-yw1-f171.google.com [209.85.128.171])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 59F3B606A32C
	for <linux-kselftest@vger.kernel.org>; Sat,  7 Nov 2026 11:34:21 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 59F3B606A32C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=m9zxtFYa
Received: by mail-yw1-f171.google.com with SMTP id 00721157ae682-8b0dba37a7fso13191047b3.0
        for <linux-kselftest@vger.kernel.org>; Sat, 07 Nov 2026 03:34:21 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794051260; x=1794656060; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=8Y4wuXjHScY3iujceiUAqjM+xKc+nuPmQr+0vb7xGNE=;
        b=m9zxtFYaW4rqF4n2ETlXK1c7uIu5mPJG+AfCoWhTQmmytmIZYqW9GyZfgAfD2t4L2t
         SEQ7u2uUbqPOvBHld75cet4UMRPPOQ3RlpurtiqE8g0er+0m5KtBGKsE+xAnaIXmNxw5
         YKutkRPdD0O94ZXff70gZJP1ft+wwWHQrUpCWoXioczrPuT1aL9PzI6m1FcxS27EmDpx
         pTx3IM99eDbwudPCUoAbNnH0dr9jsMMLPeW72BI2XgvXPIuPHbz9eCsQ02jOSE0GeRA1
         faY2/UGfXDZz3LA+7B20wZNiNCAZgPH2EeN0uyk9Be4ERctQjOgcsl9Kt39a7P0ZVZ1x
         z23g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794051260; x=1794656060;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=8Y4wuXjHScY3iujceiUAqjM+xKc+nuPmQr+0vb7xGNE=;
        b=yfjeOUsqr7bOsc6buaDghBiGVg9PlM/xT9223RE2mSVyTchW6lyNkwz4JCw8FlYS/i
         Bp1Z9NqQ9++TqbEyGoziBllz3wTNTMsEPRc5/oiQyZG5HyXKlaE8kOjSeWREIoqyxSpB
         ORZAWqwC9huVCeibWDWgMXR1nZ+jF9u+ZG0nH3LczBaVUiMAf6LH5VsJFJp6PVf+JbkG
         D+H+f1U2D3Igg3h9GY/VSxPZBmhKwBuJHLOyKdSHzynppSNYw32jYV5wOn3smazeQFxQ
         2ZCRcaRKAYDvT+UA4M8xcQFaCtWwMtwrARjazAeqVwf8j/A+0meTwPN6KftBGaS/fRM1
         GgXw==
X-Forwarded-Encrypted: i=1; AL+hErFTDibMTijcDAgZkSF23WpezuRULKpRDumLdXtI4XHPC0DUktUohpcHIC3jyGkuFLL6iK9XN3/mYWqyI7fPGj0=@vger.kernel.org
X-Gm-Message-State: APuU4Z8pFmoNniq+EvQIjLIMT+EfOiBkIdVWCQPdgqAeORR7f5UiLFqQ
	QRcpJ7i3m40z8AyMxBus9ZPaM1YCBiW7FCMwtsiCiCaPT7O1JXpiFQJO
X-Gm-Gg: AYBFou30CvkODUWQFSRBkFNyRWXHHkSO9zfz4V7rmrS+mDQKmyb2o7LsmuWGoaYqdZ8
	qvHKHi1C0CFYtl79RpIAzbLBBPtEuhI8KAEGmunL5xLsnrG2tYnYWk5S04ZNF2jZPYRu8UBGmFt
	2KqKjZ7Ye/tqc0gS9aU3Lz/mD8oMwVeNhfonogc4pmWD+UmYC9auXL3QUElW3X+C95Kthvj+k0Y
	Kaeuhm740jvEHUg54z4M4laYKu50vB0th7Mb99e0lhxN7hbXL1YSzFZ8Kxso+88ZdI0I+NasyHK
	e0DCqsEEvgZjVV/8ePvSqlnFcnlzumaiEpveNFeb6BTcBf2Glmch0BCOmAaRn32T9tPctIadak2
	Ius9PArnGyX2Xr0FK0i2xGW/D8iY+K9EIo0U+zFhzDCTay5adAxmPwLRb5ajS3FXgPtlB77jo+3
	JRze0WMsn4vPtsaP2lnYhg+gczyRW1ckpPXk7mABOOsKtUo6Ps2B3oa0PDnnYwkOOFuBXroBCXZ
	pW4qvNsPOkDY0uytWcqW1OkltD4uK4kCpdrMrUSPtwjxvv/IJF17dblnLO7ViSzbp4Qaesll7IJ
	ugTU9s7PbK8taGxvbCBHBJ2C
X-Received: by 2002:a05:690c:82:b0:8b3:150b:43b7 with SMTP id 00721157ae682-8b3418dfef7mr27601517b3.22.1794051260195;
        Sat, 07 Nov 2026 03:34:20 -0800 (PST)
Received: from houminxi ([61.170.225.237])
        by smtp.gmail.com with ESMTPSA id 00721157ae682-8b33f5f2d5dsm40084597b3.2.2026.11.07.03.34.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 07 Nov 2026 03:34:19 -0800 (PST)
From: Minxi Hou <houminxi@gmail.com>
To: netdev@vger.kernel.org
Cc: Aaron Conole <aconole@redhat.com>,
	Eelco Chaudron <echaudro@redhat.com>,
	Ilya Maximets <i.maximets@ovn.org>,
	"David S . Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@kernel.org>,
	Jakub Kicinski <kuba@kernel.org>,
	Paolo Abeni <pabeni@redhat.com>,
	Simon Horman <horms@kernel.org>,
	Shuah Khan <shuah@kernel.org>,
	Jamal Hadi Salim <jhs@mojatatu.com>,
	Paul Blakey <paulb@nvidia.com>,
	dev@openvswitch.org,
	linux-kselftest@vger.kernel.org
Subject: [PATCH net v1 0/2] net: openvswitch: fix a feature leak on a failed change
Date: Sat,  7 Nov 2026 06:34:01 -0500
Message-ID: <20261107113403.797779-1-houminxi@gmail.com>
X-Mailer: git-send-email 2.56.0
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

ovs_dp_change() records the requested user features before it calls the
update that can fail, so a request rejected for an empty per-cpu-pids
leaves the datapath claiming a feature it never enabled. The tc skb
extension key is a reference count shared with cls_flower, and the code
that would keep it in step is skipped on that path.

Patch 1 fixes the ordering. Patch 2 adds a set-dp command to the
openvswitch selftest tool, and a test that sends such a request and
checks the features the datapath reports afterwards. It fails without
the fix and passes with it.

The problem turned up while the YNL spec for this family was being
written: describing the ovs_datapath set command meant reading
ovs_dp_change(), where the ordering stands out.

Signed-off-by: Minxi Hou <houminxi@gmail.com>

Minxi Hou (2):
Minxi Hou (2):
  net: openvswitch: do not record user features when the change fails
  selftests/net/openvswitch: check that a failed set keeps the features

 net/openvswitch/datapath.c                    | 10 +--
 .../selftests/net/openvswitch/openvswitch.sh  | 64 +++++++++++++++++++
 .../selftests/net/openvswitch/ovs-dpctl.py    | 50 +++++++++++++++
 3 files changed, 119 insertions(+), 5 deletions(-)


base-commit: 30c71476d842b094651bd7712f6c8ee8716147d0
-- 
2.56.0

