Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.210.54
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792674770;
	b=On3Xn69sMsiwSp198+/5NRzx/UwPuj/3u9MpRm2VMArQujmpc16i9myhb0GCyf4ndTmT
	 J8N1/wCo/ZOut4VZSD2spwI0PJRH+Mg3MgKc7LnMcYf2IUaEGCPpE8tQsFsG4xH7G/ovf
	 mkU3Cw90T+OsyL+1dlWn2OZP8NCY8UNb+VndV59X4RPN16rm3hLOqqZDqFGnzOeBw4SvX
	 HoktakEfJQzjH1ZJPbUEJ3erkI/RuV69pvQvUrBxKL/NaoRtyb7zJ55cxG4YQoRrJnVDz
	 srOmAWc71GFWsZT5GKzHy5N9DUOk4sHvUlWgqQFY0DJQepd7srUHjBZYZIUu1H5YmkQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792674770;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding;
	bh=nfYEKhh0NOwW5bByBsDPAiJ4npQywhU8FLsAEbKDB48=;
	b=4akQMvzyTGB8uht8DKtNpxFaktXreVwxu+fSvKAZucn7xjSJyVjlcWzjC6FO6/2pNHyI
	 Nbb3HZioTteTUUEAnVbVHQ63/yBsbrzlPrwIeLvFA1XkW5rpLycTCRGx50GmEe6JGbdt4
	 pqMnTCbgGDk2Wzi2e7YPc7igmistWF6/XpJsadNKUtg2CcsMPlMODF5jaX4ScyxN6+CMR
	 +Bz0S5mE/dJYIPysf94y6SYycokHtN6uVVlDu06CsAA4EJ59OB3p81vrIPIY20yK6RwHx
	 2n+l7JTY3kRw0QSZPGqydTdfILwBWFauM2GiyAAbLnAFOHpNKVi93H2vnVp1pQJ/TxQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=KxXoZ8Xw;
	arc=none smtp.remote-ip=209.85.210.54
Received: from mail-ot1-f54.google.com (mail-ot1-f54.google.com [209.85.210.54])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1E1B4606A31D
	for <linux-kselftest@vger.kernel.org>; Thu, 22 Oct 2026 13:12:49 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 1E1B4606A31D
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=KxXoZ8Xw
Received: by mail-ot1-f54.google.com with SMTP id 46e09a7af769-843a4ca671eso978354a34.2
        for <linux-kselftest@vger.kernel.org>; Thu, 22 Oct 2026 06:12:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792674768; x=1793279568; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=nfYEKhh0NOwW5bByBsDPAiJ4npQywhU8FLsAEbKDB48=;
        b=KxXoZ8Xwh7KC2aQALTuewMxWvaHNn6UmnLWRXkdyerqGZENDMu+EfBR6edkfMvKdgc
         kVxgq6n7IYfs19f7pP0x0wxd2WAJThGvfW4qbYt113uERGax1qPT1YyNMcY+gzKmyTzQ
         KM/6ahsIzcVF/Z+Z9bh08ezu7HaC4vIcStgj5Y8ayIq4J5XRVIyAAGQXZPO9rlfrBAWs
         jziHTij+XebNr+CLXAIQx4oEZSpzH51xVQdB576N1VmKF117KmzHs6qV1gwuiUOFz6fY
         b2Yno05KXnSn46h+3DYEoRlJSWrtEGC88CJTLtlmbUwYy81ZsDIgt92VFny5a13vjJ35
         eAdg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792674768; x=1793279568;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=nfYEKhh0NOwW5bByBsDPAiJ4npQywhU8FLsAEbKDB48=;
        b=eC84CtEu7xtWnpRV//wq92XW5jjkVaRrAuf5V7U+jHNjYOjzd+wObdVKjfCe2pA+G5
         JrObwN5BTYJVe8JWFsZ/WwyrrweMR1kG/53J25DdHm6ws3C81tVzm3UHfyerthCMudvO
         cp57VOQx1TBWch9rmL8FmId4kz6URzR8Pq3V++jAOybjtuiHb+/XyRsJpdh0391cSy4z
         0GY4ITX6wLKz1mxIXxn6WFMlYuchZGeJF6tDnAD7P4P1nZFXWdSG27C23WZZEouZGfsb
         8NWPQijhY/UDWwcDQRz3tUx6Vxo65jcuXPYzIzOrEj0EsRJOP+ThFOSTLq+jnuF8uIRV
         WZew==
X-Forwarded-Encrypted: i=1; AKwUvBzmbasmcZFMtL9tBaOICzXrXbYKUFisIYtm+z3evDmNcedZoN1VtPdQ/uUKTtoyLyOf0rK3vVKmKSoEcYMA3xg=@vger.kernel.org
X-Gm-Message-State: AFq9FYJOJRZHsrqO1WbCBep5Ql5tGCA0EpEZ3avbOIFp/Pic2x2U4Sld
	FkIPmUMVaX0H9vnMA2ZWiBvh/6MbJKuad4iFaAWYx7+t2kASirR0Otp8
X-Gm-Gg: AYBFou3CqyPbnxBmzYMGQtcFoemGLSsCToEYiCir3jrELqTBJkk6OIwrz7xcbsoB8tN
	kritLRKMuCvlMaccIH7evQG/3oCgh4T1DIDf1HHkMkmD+9hzVijqd5LeuAFnbU73g/z7S0DQkJ7
	1rHYb2v4WVZJfE08BMoM8HV+TL0jMgAApKDZbteZj6ki03+nNQ+ByPvlMy1iP1uDMsj5TN4LZ4Q
	cByxrtE3dGsth/Au+QGBr8QbpAd4th+jbMyrqHiOk7LIPK+/4AFhimszLp3tazLiwi3tgfskShD
	4FD4AlAKptnC5FLVaemkqt3UuFRamAGLymoaSW9dDixREozZvW5UdtTB+NEe4VGmqkkqyZgeAML
	ntreTrUs9lHIkRD59NBuYYle2laUf4dleXfhJ8qXHD0TAa8Bg8fs5pJVc+4H4iq45X69NLZKJPy
	z0PoEWW9/ac3cOBZZB9aP/A13lOhH1m6zZ9brHEjN4SYbc5DaAp2oic4vt7SfYETW27bWLY5Lue
	bMHqd+z+SpFjylXi6l8dB1vN/nVsoeAtYp+4wDoAjTNNL33lZuSpmI4Y+lrrxQU7ex8VwBITFGx
	TwNtmNnJH9FBPq14h1JIMbrh5YqOpN22S3OwoA==
X-Received: by 2002:a05:6808:30a6:b0:4b9:a88b:888e with SMTP id 5614622812f47-5535be9e63cmr3845871b6e.36.1792674768107;
        Thu, 22 Oct 2026 06:12:48 -0700 (PDT)
Received: from 1u1g-b650-0212.nvidia.com ([72.25.70.131])
        by smtp.gmail.com with ESMTPSA id 5614622812f47-552b6da2902sm4259863b6e.11.2026.10.22.06.12.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 22 Oct 2026 06:12:46 -0700 (PDT)
From: Samarth Narang <samarth.colleges@gmail.com>
To: Jason Gunthorpe <jgg@nvidia.com>,
	Kevin Tian <kevin.tian@intel.com>
Cc: Joerg Roedel <joro@8bytes.org>,
	Will Deacon <will@kernel.org>,
	Robin Murphy <robin.murphy@arm.com>,
	Andrea Parri <parri.andrea@gmail.com>,
	Shuah Khan <shuah@kernel.org>,
	iommu@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	linux-kselftest@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Samarth Narang <samarth.colleges@gmail.com>
Subject: [PATCH 0/2] iommu: Propagate iova_bitmap_set() errors through read_and_clear_dirty
Date: Thu, 22 Oct 2026 06:10:13 -0700
Message-ID: <20261022131015.3281745-1-samarth.colleges@gmail.com>
X-Mailer: git-send-email 2.53.0
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

This is a follow-up series on a6ec38d74c08 ("iommufd/iova_bitmap: Fail
GET_DIRTY_BITMAP when a bitmap page cannot be pinned"), which keeps the
first iova_bitmap_set() error in the iova_bitmap so the ioctl fails. As
Jason suggested, this series propagates the error up the call chain
instead.

Patch 1 makes iova_bitmap_set() and iommu_dirty_bitmap_record() return
an error, and makes the iommupt and io-pgtable-arm dirty walkers stop on
it before clearing the IOPTE. We only clear the dirty bit after it has
been recorded in the user bitmap, which prevents a failed
GET_DIRTY_BITMAP from losing the dirty state of the IOPTEs. This should
also address the case Andrea raised for the -EPROTO path: with this
series, an entry that did not fit stays dirty for the retry.

Patch 2 adds a corresponding selftest. It fails on the current for-next
and passes with patch 1.

Tested on x86_64 in a 2 vCPU QEMU/KVM guest with the iommufd selftest
(mock iommupt domain, CONFIG_DEBUG_GENERIC_PT=y): the new test is the
only change in outcome, with no WARN in dmesg.

Samarth Narang (2):
  iommu: Return iova_bitmap_set() errors from read_and_clear_dirty
  iommufd/selftest: Test GET_DIRTY_BITMAP with an unpinnable bitmap page

 drivers/iommu/generic_pt/iommu_pt.h     | 29 +++++++++-----
 drivers/iommu/io-pgtable-arm.c          |  5 ++-
 drivers/iommu/iommufd/iova_bitmap.c     | 18 ++++++---
 include/linux/iommu.h                   | 27 ++++++++-----
 include/linux/iova_bitmap.h             |  9 +++--
 tools/testing/selftests/iommu/iommufd.c | 50 +++++++++++++++++++++++++
 6 files changed, 110 insertions(+), 28 deletions(-)


base-commit: 04bcf84613346b973a8cc0c59238b6b5bc902688
-- 
2.53.0

