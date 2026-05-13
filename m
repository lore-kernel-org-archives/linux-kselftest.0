Received: from mail-ot1-f47.google.com (mail-ot1-f47.google.com [209.85.210.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A643339AD32
	for <linux-kselftest@vger.kernel.org>; Wed, 13 May 2026 12:12:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778674379; cv=none; b=TCKUq674yerZ4RMUAs7Hwj8/yFfh3mBnJHt8Agp9rJm3yqN6xQEV0YHEVy0Gt6wOREj1yToH9nbsSQ4psVy14lQrSF7PrbpvgxZfezpt3D8iZ0foRXLgLzz/RU7f4xZhhCUzCaKitSQMQxcDzzuTlnv/zxedUfblvbD4+zlHIGM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778674379; c=relaxed/simple;
	bh=sIVkmbnPi62X8BjG8OyL5YZgklagbQK9bg+ZcgvmI4g=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=i9EX2b95HMgQxsHiPrHfA7dDIoOu3Wq/7bye9/oJJmHQK7WC0RW7quTvRaa1cIU1yk2yUUa/pRXo5CvsbfE+qSKZFwmxY7Js2ylbpTYoDKppkH/J4r7NAuY6Nvwoc4+qGMubwERb0c4qMBtfXPPyUFZ0rWrCt3QUfBBrU9+0WLY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=a4Wb0CE6; arc=none smtp.client-ip=209.85.210.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="a4Wb0CE6"
Received: by mail-ot1-f47.google.com with SMTP id 46e09a7af769-7d4c383f2fcso5271794a34.0
        for <linux-kselftest@vger.kernel.org>; Wed, 13 May 2026 05:12:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1778674377; x=1779279177; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=bFWZYsDIujsbYZ6k3QHQTk5T7lp4/robhtHZwKO93sc=;
        b=a4Wb0CE6nOkp7nT7LngOlBsUGsbweu8Pw54qyYoMK9N+KIhglr+2VsOdlBP1TG50La
         0JkEBR8x9VrFrSKJg6AyX0p6JGOsz6gDZj7ZSeQJHJPzRy0ih+VH9K0KDyaDQQWOOdxq
         yZHkcjge2xxmtXfmg22w0jAhOpWzOvUe/s67yob0kMj3Iy+n0/W3m8LD2nl67rJmzDKu
         5A5JrurKy3JX8YloERz3D/4PR2HPcmTP5981UDwd/bGsp84ARnEKo/GirmugjmH/uJI/
         7KWvIXb9w6Swpp54VIb3hjKCrEarIkrzl5ay4khCx0AdeoVvr0tyCpMY709jkMaPQHfx
         iD4Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778674377; x=1779279177;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=bFWZYsDIujsbYZ6k3QHQTk5T7lp4/robhtHZwKO93sc=;
        b=eXrijczIlBXQhogI6wNfbz5dsOZHHkg89hbqqp++YEqmEVlF1Jc2XJgs8KRla83oct
         qEUZBRuUZsg3fAtmRMnAdgluJJy7DnjOFhmxrrtDbXTulq9ook5Ubv55ZcmBE8gdLEoU
         REMilGqw0EgSxKaYb6DOdAjOQulPiJMhzsxlq0pTpzw7fPkoPpdVihkTJUavXYjb3Iwe
         svQe6H8Ed+CR7WHmBce/FKKHJMQXqXadLhN9xB9ZUvjh1vDB/ITctKJ/ttQjLnXZoAdg
         2BRjYU9wirMerG1jQRQnRd7o4guHgUt7zxma5acuOgjJuCzPVmTT8kCHe5GGiB3ExOaJ
         jylQ==
X-Forwarded-Encrypted: i=1; AFNElJ+V6wdzIe1vKzjjQTcm/EsQ8nkDLYHGW4DzEOY8FZtiPJU7PxHXTwA3yYRWjuJ/JLiSdLRRsbDdHw0xGeE7c1U=@vger.kernel.org
X-Gm-Message-State: AOJu0YyC/A0RZMeZKmmdtsiI5guWqyenBh+Vqp1Q8CHE8nhr/5zGvqXQ
	fydl/G9J5x5Hn41KtIpdbovqwgQG8lNSmDUVHyKTRJuAffK6gPsH4gml
X-Gm-Gg: Acq92OFOluPFjAJECb3r28pEui3dskDNPeQepGE4M7ULVwnyxr5mL2HTeiNE+XF66vb
	QvrXDPeiE/uLyJ64kys021FyNVS3x5hyERLpLzoD2pFOGzvQF4SlhtwMko94nGB1+juCYEYzbAt
	DKLMiQuO7A06FGsi6f9rt2Mu6yN208BnTxG3TrlRoYqtnhW1InWRO3N8RXl/juVOWbWi6Dbt6+1
	IOZsDD6Gh4GYS3FmeVXlnT28HEtD9P6c0DRGcSWVdC+pt0eSjsijqFsWI2kNybtMuI/os9PvmgP
	owpQSUmfp4mqgY6ouEToCJbFdVx8K2aPyqKwV58WRz2emr/5ziVVNnxLiHhQfIk54MFy+c5uKz3
	vQggHSzbAlrRJvElXPtcF1M9V5RNcykIgeD0Nsi6ufPmyzqMWWDj30+kgUGeY9x4Gnqsv0VM+4Z
	Wh6BGcQgux3r3HDnk=
X-Received: by 2002:a05:6820:609:b0:696:15bf:ca5f with SMTP id 006d021491bc7-69b78d82eecmr1615367eaf.19.1778674377518;
        Wed, 13 May 2026 05:12:57 -0700 (PDT)
Received: from houminxi ([72.244.37.221])
        by smtp.gmail.com with ESMTPSA id 586e51a60fabf-4355736dbc0sm15189442fac.11.2026.05.13.05.12.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 13 May 2026 05:12:57 -0700 (PDT)
From: Minxi Hou <houminxi@gmail.com>
To: netdev@vger.kernel.org
Cc: dev@openvswitch.org,
	linux-kselftest@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	aconole@redhat.com,
	echaudro@redhat.com,
	i.maximets@ovn.org,
	i.maximets@redhat.com,
	davem@davemloft.net,
	edumazet@google.com,
	kuba@kernel.org,
	pabeni@redhat.com,
	horms@kernel.org,
	shuah@kernel.org,
	Minxi Hou <houminxi@gmail.com>
Subject: [PATCH net-next 0/5] selftests: openvswitch: pylint cleanup for ovs-dpctl.py
Date: Wed, 13 May 2026 20:12:35 +0800
Message-ID: <20260513121240.2590767-1-houminxi@gmail.com>
X-Mailer: git-send-email 2.53.0
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

This series cleans up all pylint warnings in ovs-dpctl.py,
bringing the score from 7.62/10 to 10.00/10.

This series applies on top of:
  [PATCH net-next v10 1/2] selftests: openvswitch: add vlan() and
  encap() flow string parsing
  https://lore.kernel.org/netdev/20260512070841.1183581-2-houminxi@gmail.com/

Patch 1 converts 86 %-format strings to f-strings.
Patch 2 fixes misc warnings (unused import, bare except, unused
variables, redundant expressions).
Patch 3 renames classes to PascalCase and variables to snake_case.
Patch 4 adds one-line docstrings to all definitions.
Patch 5 suppresses complexity warnings from pyroute2 constraints.

Tested with vng on x86_64, all OVS selftests pass.

Minxi Hou (5):
  selftests: openvswitch: convert %-formatting to f-strings
  selftests: openvswitch: fix misc pylint warnings in ovs-dpctl.py
  selftests: openvswitch: rename classes and variables in ovs-dpctl.py
  selftests: openvswitch: add missing docstrings in ovs-dpctl.py
  selftests: openvswitch: suppress pylint complexity warnings

 .../selftests/net/openvswitch/ovs-dpctl.py    | 794 ++++++++++--------
 1 file changed, 428 insertions(+), 366 deletions(-)

-- 
2.53.0

