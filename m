Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.216.72
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793306010;
	b=lPIcPV7BKP9dxQeqm9DX+Wp75nGZyqmSy2sRQHNiXLKfEqBImf03dr2Yh4/CGH/to5el
	 1f6VQ96CZLQYEyhSbJKr3BW+CkeasFv1Xtz6iX2yXEE1B0Fzyqz/Uoc6P7tNVW7CaHHJp
	 94cMXWUlGEybPYBpKGBtBy+6Dd/7sdxJILmNfE3aAu/iFpw3kqR2ffOPrlZ9+mLGwMMj7
	 dtYe67NxiL0qzCWxH8FjC0qvhJso8K6a45BHRCsthJHn62lcsOsMBIMfKLThwjme2pVqk
	 n92AjgTEhSNQH5DGk02goOArGnDjgQDsSZP7gSgymaKAVDOIrnR3oWkD1MF6PwUAmOg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793306010;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Received:Date:In-Reply-To:
	 Mime-Version:References:X-Mailer:Message-ID:Subject:From:To:Cc:
	 Content-Type;
	bh=tDfMnHPOVxE98+9TE/nBvfLsdX5oZKXJTQxV9ofrPB8=;
	b=l/wwdo14PrQV2bzUxTN5fawxhU8/gS7xXll+1SQG4wslJbrSsmuQ5pLhPcfnpSRLFBGG
	 kaW3ybBZgG/r6OsoongQjm7+XDpzI4xEgPORrqGElepld7EXW5MlG4YMFyAnDItcRB0sJ
	 s6OHgAihRvITTDSDdjLSC9++BjCJXjw6/3So2NsffvRqRv6IfUu3bdOv8F9JopdsEv9Ch
	 nTOP1QvSjutoKj9lkdTTGSuAdPrc60nzKMbRd5V4R2X120XEVsZeH95WHvfzJ3b56K2+F
	 CP/xbDwxR2lO8FHz+ZkZSxdaWprFlnFbAMxU42UXbLOeLk1dbShDU7vKFx0MAf8qnwg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=google.com;
	spf=pass smtp.mailfrom=flex--dmatlack.bounces.google.com;
	dkim=pass header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=jVFy5+f3;
	arc=none smtp.remote-ip=209.85.216.72
Received: from mail-pj1-f72.google.com (mail-pj1-f72.google.com [209.85.216.72])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EB5C360A2602
	for <linux-kselftest@vger.kernel.org>; Thu, 29 Oct 2026 20:33:29 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org EB5C360A2602
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--dmatlack.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=jVFy5+f3
Received: by mail-pj1-f72.google.com with SMTP id 98e67ed59e1d1-3abfcf726dcso3193926a91.2
        for <linux-kselftest@vger.kernel.org>; Thu, 29 Oct 2026 13:33:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20260707; t=1793306009; x=1793910809; darn=vger.kernel.org;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=tDfMnHPOVxE98+9TE/nBvfLsdX5oZKXJTQxV9ofrPB8=;
        b=jVFy5+f39q99V15VIlErwgQ/W4JaK3puuVFnmWxDh5qTYdzYTJm/i5S26DvU74eokY
         dEBszj0wP7s60Ia5DwLR246rhtEnlUJLcrW89C+l/iTHE05Mgyua3tJU2eIIVEn7QGa2
         1tP7NcSxuZN+unp/iskwvxXQ1DN9j+EpgKQftNQ1WYbq/mOK4Q7833DHO/d3tcd2rg0y
         yHshEZmt8XPPm7p82kjx5mH6lZZMkBSmHaAzogxKryBwnvlU4dmXHUnd+h4jJyPAeX6i
         g1KvAV2uq3R4Ybl9rxrMFMQwuWvdlwGlpZPDprdmvJXJM0Tq5Na/aG/AruA+chpCVvcC
         oqqw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793306009; x=1793910809;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=tDfMnHPOVxE98+9TE/nBvfLsdX5oZKXJTQxV9ofrPB8=;
        b=JdDZsDElWFMmJ4fiVinANW8BozLJxuWn3DD5VBtjGxvrRIkrQciSFMdddbl7E29uU2
         tac+rSLKAIywrp0Ownyi49OW3yXOA+1d0OCiwlgjmocxPG7ZagoOnKDX7F/MOWHHrqIr
         jZ7aDc6RwfQViL94NDZMs+OlCLWtpRr8bG94ackHRU1yN5MHqW+yzK6WkDUvHwmql+nQ
         LBKZGOjHHK9sz9HeyMX6oNQYAT4G8kQwrmwi1BloAtqtm4kpANdIn8wBEL1fEnIFt/YO
         XyBt3BMVvTL/9U2z55NtaS9b0odxq3QNtd6p+U4a4/yhBzYkYkyoDoJlsf4vVMlf/sG1
         bLvQ==
X-Forwarded-Encrypted: i=1; AKwUvBxkOcwJ1dw7UtyE8XnssFYWR7VD9E2WqlPo3DTpfZkEiHxbgOtqTgMcQeq2hVhXxDwz2s4EB+Id1gcBiLxXNvM=@vger.kernel.org
X-Gm-Message-State: AFq9FYLRHigDqw9Fgk8/UTkwSgRhQGeXTjW/hSvjCqAlYDIMpUNgdWf9
	aDdhsQ7VLzQER0Iyj7ynI2pCmTKOauDQKsm4sO+G1TOF5MzsjrQWZC7yt/0cj744DzOR6o6gjYB
	x1XxWCKsS5AEbTg==
X-Received: from pjff12.prod.google.com ([2002:a17:90b:562c:b0:3a6:daac:15d1])
 (user=dmatlack job=prod-delivery.src-stubby-dispatcher) by
 2002:a17:90b:3812:b0:3ad:183f:5e3a with SMTP id 98e67ed59e1d1-3ae89574cc8mr139687a91.4.1793306009170;
 Thu, 29 Oct 2026 13:33:29 -0700 (PDT)
Date: Thu, 29 Oct 2026 20:33:22 +0000
In-Reply-To: <20261029203324.1637772-1-dmatlack@google.com>
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Post: <mailto:linux-kselftest@vger.kernel.org>
List-Help: <mailto:linux-kselftest+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kselftest+owner@vger.kernel.org>
Precedence: list
Mime-Version: 1.0
References: <20261029203324.1637772-1-dmatlack@google.com>
X-Mailer: git-send-email 2.56.0.317.g454f8302e1-goog
Message-ID: <20261029203324.1637772-4-dmatlack@google.com>
Subject: [PATCH 3/5] vfio: selftests: Add vfio_pci_find_capability()
From: David Matlack <dmatlack@google.com>
To: kvm@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-kselftest@vger.kernel.org, stable@vger.kernel.org
Cc: Abhishek Sahu <abhsahu@nvidia.com>, Alex Williamson <alex@shazbot.org>, 
	David Matlack <dmatlack@google.com>, Raghavendra Rao Ananta <rananta@google.com>, Shuah Khan <shuah@kernel.org>
Content-Type: text/plain; charset="UTF-8"

Add a helper to find the config space offset of a capability in a
device's standard capability list, mirroring the kernel's
pci_find_capability(). Return 0 if the device does not have the
capability.

This will be used in a subsequent commit to locate the PM capability.

Signed-off-by: David Matlack <dmatlack@google.com>
---
 .../lib/include/libvfio/vfio_pci_device.h     |  7 ++++++
 .../selftests/vfio/lib/vfio_pci_device.c      | 25 +++++++++++++++++++
 2 files changed, 32 insertions(+)

diff --git a/tools/testing/selftests/vfio/lib/include/libvfio/vfio_pci_device.h b/tools/testing/selftests/vfio/lib/include/libvfio/vfio_pci_device.h
index 007adc322c1e..1839e95cc792 100644
--- a/tools/testing/selftests/vfio/lib/include/libvfio/vfio_pci_device.h
+++ b/tools/testing/selftests/vfio/lib/include/libvfio/vfio_pci_device.h
@@ -79,6 +79,13 @@ void vfio_pci_config_access(struct vfio_pci_device *device, bool write,
 #define vfio_pci_config_writew(_d, _o, _v) vfio_pci_config_write(_d, _o, _v, u16)
 #define vfio_pci_config_writel(_d, _o, _v) vfio_pci_config_write(_d, _o, _v, u32)
 
+/*
+ * Return the config space offset of the first capability with the given ID
+ * (PCI_CAP_ID_*) in the device's standard capability list, or 0 if the device
+ * does not have the capability.
+ */
+u8 vfio_pci_find_capability(struct vfio_pci_device *device, u8 cap_id);
+
 static inline void vfio_pci_cmd_set(struct vfio_pci_device *device, u16 bits)
 {
 	u16 cmd = vfio_pci_config_readw(device, PCI_COMMAND);
diff --git a/tools/testing/selftests/vfio/lib/vfio_pci_device.c b/tools/testing/selftests/vfio/lib/vfio_pci_device.c
index 4063a0e2b3df..2afbc465d30c 100644
--- a/tools/testing/selftests/vfio/lib/vfio_pci_device.c
+++ b/tools/testing/selftests/vfio/lib/vfio_pci_device.c
@@ -260,6 +260,31 @@ void vfio_pci_config_access(struct vfio_pci_device *device, bool write,
 		       write ? "write to" : "read from", config);
 }
 
+/* Bound the capability list walk in case the list contains a loop. */
+#define PCI_FIND_CAP_TTL 48
+
+u8 vfio_pci_find_capability(struct vfio_pci_device *device, u8 cap_id)
+{
+	int ttl = PCI_FIND_CAP_TTL;
+	u8 pos;
+
+	if (!(vfio_pci_config_readw(device, PCI_STATUS) & PCI_STATUS_CAP_LIST))
+		return 0;
+
+	pos = vfio_pci_config_readb(device, PCI_CAPABILITY_LIST);
+
+	while (pos >= PCI_STD_HEADER_SIZEOF && ttl--) {
+		pos &= ~3;
+
+		if (vfio_pci_config_readb(device, pos + PCI_CAP_LIST_ID) == cap_id)
+			return pos;
+
+		pos = vfio_pci_config_readb(device, pos + PCI_CAP_LIST_NEXT);
+	}
+
+	return 0;
+}
+
 int __vfio_pci_device_reset(struct vfio_pci_device *device)
 {
 	if (ioctl(device->fd, VFIO_DEVICE_RESET, NULL))
-- 
2.56.0.317.g454f8302e1-goog

