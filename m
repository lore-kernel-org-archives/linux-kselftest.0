Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.167.200
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795046524;
	b=LruVU+xuPWcP/TDttvQcT9iwKcb6sGI2vUE+BX4XOL8lClRZ8NfClUzjzW3M+mNeJ6ak
	 aNdePdAFmZgSaayBkFDRH/9kMopj/XGvoEzpj3uBgenu8toDnx3ecxe3aof+BzsBGn63h
	 03tYulS2ZMUopwXrld9b5CeVpplmunQe/UPY9X9UNMCLd027G8NhAa5zfD8ugFpQyyzrh
	 JlxW9Xjhf0TgkDulCV9YHktpxNuLu4CVVvFmUnlORUNWBeblEbVV/Kt5AynCnCsemCTv6
	 JEH1jlGGGKM3tNAb0dGq6EhXjRFDGqlsc6wLC7LorU+/V/DDvU7DNQuGid9xMyCTYbg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795046524;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Received:Date:In-Reply-To:
	 Mime-Version:References:X-Mailer:Message-ID:Subject:From:To:Cc:
	 Content-Type;
	bh=w7Woz9FOzyEI61pXAlfURrfx9J9JG5qwKCh+RDSinsc=;
	b=t7Bl+16To4nEALZG7wG9n/CrXNasOTDHJsX084mJYmPtsj2VVHi3ZYC4yioJixvRa7x7
	 b7OvjckAqoSky5oqwnWm5fcJmo1a4dgHhIt3v40wD8mEoBqO3uRyV6mcdC58rbZ5Sd/pJ
	 mGMId5onO2mxzZDwmA7Qv4YrNKdsTyh17FxH2NBQYeESlwdACT4luHqcixOpJ9IusACeP
	 iXl0BCb1pNIqHw7b6Y56w+nmG5T3xlXlEx+V+nLIm3eATNde6aVjLPq6YWNcifF7WM/45
	 sueREGPV/55ugPLbsJleIs6fhiQXQ79akXAvQhM94mp2WPG4/Sdl1i7Dd17CD/PC65g==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=google.com;
	spf=pass smtp.mailfrom=flex--dmatlack.bounces.google.com;
	dkim=pass header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=nsRGs9Ga;
	arc=none smtp.remote-ip=209.85.167.200
Received: from mail-oi1-f200.google.com (mail-oi1-f200.google.com [209.85.167.200])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6CF2260A261B
	for <linux-kselftest@vger.kernel.org>; Thu, 19 Nov 2026 00:01:59 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 6CF2260A261B
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--dmatlack.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=nsRGs9Ga
Received: by mail-oi1-f200.google.com with SMTP id 5614622812f47-5735cd94235so1549256b6e.0
        for <linux-kselftest@vger.kernel.org>; Wed, 18 Nov 2026 16:01:59 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20260707; t=1795046518; x=1795651318; darn=vger.kernel.org;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=w7Woz9FOzyEI61pXAlfURrfx9J9JG5qwKCh+RDSinsc=;
        b=nsRGs9GaEnVL8fDz7RDR30xI5x0zjXluUYy96pdI+goVmdQ/rT3JwxAmAhoLV7IDji
         FS84Q+VArgYKbMS6JeL5lnSR17EEK/kS8NluDXXIf5fdaK0K5/O4hA4LhOdIVwsQHusy
         tNa0z0tp7R9qIDPlxXbE45AY95n18rw2FY54ZBHmWxHVQHEbSMqXosjNYqECUWKhjng1
         Kb1rirxYgDO2Sg1zDFL9Ma0uNUMmPJH1ugn6x0cPwmpaRO8Db8iomGD0Tv/c0yl7CPah
         rIaMJ6cz4p4Hm9pWzg/iaGIZtw3bj5dZUCnbxRPsamBCwXb0jav8YU19AMB2vkXnm1rD
         hQaA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795046518; x=1795651318;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=w7Woz9FOzyEI61pXAlfURrfx9J9JG5qwKCh+RDSinsc=;
        b=G6EyQnTP0J8EShFbXOQn+lP0fb5yUaI9v6vWxjvoHVDHAtd2rKziDrj9wO6nNVpxjv
         YqiIaVEYQgbzlhXhfxsPZKY4kAKq78R1FgsjY3xuCuYFGEIGtaYymSXSQjFwzFqtLT9X
         gkS4Tgq+TQEXLEyQ8fHulU1NyWzKEc8aU3Bw3/1w+KrMEa+uft2vz5bPXR7GJsaEc2Uz
         zzmSnWMCteIIhEBUyaZLQPSMpdTbCaTTnAlv8/p4PH3ngUancXMf/kcrilI6IOKkhcEU
         sEpJwGcxtwjEf/B+O+JIhTsM/qJCCdam+wkw8tYx2MCwmfi92ZMPvf+TVMdO/nUmFMxA
         D5GA==
X-Forwarded-Encrypted: i=1; AL+hErF7Avoqv5I4uPVGof5i94oWUQRoSbGQOXnyn3SGXO+GCFK1n4Qgcv7KnLZbx9HQzw10P5wXfZY2+gYnaukTQIk=@vger.kernel.org
X-Gm-Message-State: APuU4Z/HkcEaFkm3dCKfxBPWJlxy3eDWf4xJhjIRt9XgJJMcH/jQ7cmO
	W5BOhlZy51Jds4ueh6Bfuu0fLzxirW7lhcY7UShSbz5Z7GbDYcjrv65EShWqDIjvplIxEdoQq9l
	33kSAtLyzKqW/NQ==
X-Received: from ioi14-n1.prod.google.com ([2002:a05:6602:c64e:10b0:9ca:d7a7:e72f])
 (user=dmatlack job=prod-delivery.src-stubby-dispatcher) by
 2002:a05:6808:518b:b0:4f5:d3bf:edf3 with SMTP id 5614622812f47-57742b303c1mr4468950b6e.59.1795046518039;
 Wed, 18 Nov 2026 16:01:58 -0800 (PST)
Date: Thu, 19 Nov 2026 00:01:44 +0000
In-Reply-To: <20261119000151.442543-1-dmatlack@google.com>
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Post: <mailto:linux-kselftest@vger.kernel.org>
List-Help: <mailto:linux-kselftest+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kselftest+owner@vger.kernel.org>
Precedence: list
Mime-Version: 1.0
References: <20261119000151.442543-1-dmatlack@google.com>
X-Mailer: git-send-email 2.56.1.708.g77570a6a1d-goog
Message-ID: <20261119000151.442543-3-dmatlack@google.com>
Subject: [PATCH v2 2/8] vfio/pci: Annotate lockless accesses to vdev->sriov_active
From: David Matlack <dmatlack@google.com>
To: kvm@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-kselftest@vger.kernel.org, stable@vger.kernel.org
Cc: Abhishek Sahu <abhsahu@nvidia.com>, Alex Williamson <alex@shazbot.org>, 
	David Matlack <dmatlack@google.com>, Raghavendra Rao Ananta <rananta@google.com>, Shuah Khan <shuah@kernel.org>, 
	Vipin Sharma <vipinsh@google.com>
Content-Type: text/plain; charset="UTF-8"

Use READ_ONCE() and WRITE_ONCE() to annotate the read of
vdev->sriov_active in vfio_pci_set_power_state() and the lockless write
that clears it in vfio_pci_core_sriov_configure().

vfio_pci_core_sriov_configure() intentionally clears sriov_active
without holding memory_lock, so the write can race with the read in
vfio_pci_set_power_state() (which runs under memory_lock). The race is
benign: at worst it causes a spurious -EBUSY while the device stays in
D0. Mark the accesses anyway to document the intentional data race and
avoid KCSAN reports.

The write that sets sriov_active is done under memory_lock and is
serialized against the lockless write by device_lock, so it does not
need to be annotated.

Fixes: 40ef3edf151e ("vfio/pci: Use a private flag to prevent power state change with VFs")
Signed-off-by: David Matlack <dmatlack@google.com>
---
 drivers/vfio/pci/vfio_pci_core.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/vfio/pci/vfio_pci_core.c b/drivers/vfio/pci/vfio_pci_core.c
index 4289ec9bc32f..511dcb49d2f6 100644
--- a/drivers/vfio/pci/vfio_pci_core.c
+++ b/drivers/vfio/pci/vfio_pci_core.c
@@ -329,7 +329,7 @@ int vfio_pci_set_power_state(struct vfio_pci_core_device *vdev, pci_power_t stat
 	lockdep_assert_held_write(&vdev->memory_lock);
 
 	/* Prevent changing power state for PFs with VFs enabled */
-	if (state > PCI_D0 && vdev->sriov_active)
+	if (state > PCI_D0 && READ_ONCE(vdev->sriov_active))
 		return -EBUSY;
 
 	if (vdev->needs_pm_restore) {
@@ -2393,7 +2393,7 @@ int vfio_pci_core_sriov_configure(struct vfio_pci_core_device *vdev,
 	 * state transition would at most result in an -EBUSY, leaving the
 	 * device in PCI_D0.
 	 */
-	vdev->sriov_active = false;
+	WRITE_ONCE(vdev->sriov_active, false);
 
 	mutex_lock(&vfio_pci_sriov_pfs_mutex);
 	list_del_init(&vdev->sriov_pfs_item);
-- 
2.56.1.708.g77570a6a1d-goog

