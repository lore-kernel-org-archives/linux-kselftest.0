Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.210.197
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793306009;
	b=nLKOOq2MyeiT32a+OP/RkpzDGdarpd1hA5ut/UNlY5NIxaBi7YnVzHkA+rxGqzb0DSRR
	 UISDwn7jkosC1LUEz4BzgvED5EOz63VTAkwgBxXPREZbrejiL+8odxWFQqRXkRqF9nEHa
	 Sh0cyNdcXkOGhgNiqLi5agTAe+rSRRU521E1yW/sjQWzGsbqOg7B5Rjs/ZAaAZ+Kx5g0L
	 fS68YjlIOE6DRvSI7+c/li5EdnRoy2m2uxFd5+RdECmbel/ztealgqXJSyl6ewatVD6Pd
	 AAlbo0uv1LvyvwBm55AzbI5ChkUEn5w2Pk5WeCxc88r3wLYNxkZQ9W8uPbVatUfKRVg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793306009;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Received:Date:In-Reply-To:
	 Mime-Version:References:X-Mailer:Message-ID:Subject:From:To:Cc:
	 Content-Type;
	bh=1nHo9LSuLUSo1ctkTfXz3MdvvMC6Xb44b3d2+BYjEH0=;
	b=4gsVP/yeQRPnPOv4gUwh2e6sFtzPRFcprxQE5Ixw/IkXHOLpDx8T3i+EcIF139xwyu4t
	 J0AC1BBoc62Yu5X0o2W70Kf3WDnpe1BcYdAtFyRk2miojS+k1B0UX23cljz7GLGyd47pT
	 lDZ4SYssUIIfPEyNJa0juH76na9qWecWq/ccax/X/8H7wPLuELLurhBKMnBPW6Beo+Ol1
	 YWCwTCnAXH5y2t+IkJ2nBYJb3U/sW78XfLL7/YC5sM0N/iDVhd7x+i2iZ8qiArwyt5y+L
	 bpkwz56dY9No0aPYG6YT+NStYBu8tNJSqWXBBRY1H4lEqFgvIOLxP8/7JwEeP5oYSfA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=google.com;
	spf=pass smtp.mailfrom=flex--dmatlack.bounces.google.com;
	dkim=pass header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b="oyMZl/rb";
	arc=none smtp.remote-ip=209.85.210.197
Received: from mail-pf1-f197.google.com (mail-pf1-f197.google.com [209.85.210.197])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2E763606A333
	for <linux-kselftest@vger.kernel.org>; Thu, 29 Oct 2026 20:33:29 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 2E763606A333
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--dmatlack.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=oyMZl/rb
Received: by mail-pf1-f197.google.com with SMTP id d2e1a72fcca58-8a030e0f9c1so2758785b3a.2
        for <linux-kselftest@vger.kernel.org>; Thu, 29 Oct 2026 13:33:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20260707; t=1793306008; x=1793910808; darn=vger.kernel.org;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=1nHo9LSuLUSo1ctkTfXz3MdvvMC6Xb44b3d2+BYjEH0=;
        b=oyMZl/rbfnscD/YU3wgziViiSLRMb8xd1veh6EaqUzMYD9xiVIHELeMsFxFRYOXbp+
         BJs0hY01nzVj5nlQcbkPq4YqRpCuXaVNIhQnW+vaX8apZk6GsrmPzjQ4maFFmL+qxkvx
         Q1QaHkYkVNQ0KP+kbY2o95HmV9d5R7WrA0AloSPhos9GSaMl9Mxvl4SPo1LPErbyaQLk
         HbTm9rar216088rz5nvPuT7+V9bxAp2BwI/qGJvrXq0pf030BdbZQ5vTAVGtY3wHpQqV
         eJMvJ0k9WjuO12XHkqR/wZL5Gk9wyoxg1gp2jDdCpJKbFXwphtWmMrwqpAdiC8RUpTHX
         3cAw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793306008; x=1793910808;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=1nHo9LSuLUSo1ctkTfXz3MdvvMC6Xb44b3d2+BYjEH0=;
        b=CXqjkIQqDEgfTPGAogWr76/vFs/c1WQlpsJ8i8wSOUVyXM1wcJjyCYNOLbB8xHT2tO
         vCgzW8ehjbkbBaz4SQERh3kmueJcLwCSs8Wg5KOTSaLSQcnb1jJZcYz669yG+M76o0/O
         lRJbVG+3lKFY/fwcIpJ4b67Y5dzZ+mwK9WXN4RIyU7lFzTzf4TatDgLjHHZmbii2t5cr
         mBFZ4oyhvPdhv6J7yS4tSPIfrbbK+jYGGPxhi7tCq44gUQUmqQXO7iNlD6yksMAGhB2P
         KgOze0JgcwbI8gzTU+9dWBLwexRzCG4/BQco66Ry9iLNYc3eF4lVI7L8jIL6Q6W0+9zd
         sUJg==
X-Forwarded-Encrypted: i=1; AKwUvByrJlx+/BY9kvPwIJSZ/rJLObPh5FDFoAR8gWCMeQDaPeDurxeJ28C1NhoJJVoVqOQCs3kWBaaAWTC0BD596Z0=@vger.kernel.org
X-Gm-Message-State: AFq9FYL5I+fLfr3/pjUidJ3pmMrSLtq5I++rmTsI8KLk7RiMQdINlL3T
	t3z0boSZ5LEJY+xr/+/RDvWRs+dNf31j8W+PfLSQx2yh01IEUrnd+0z7QY0iOTSyziZmwASMW5M
	GsOK4k0jlaCwKWA==
X-Received: from pgcgn23-n1.prod.google.com ([2002:a05:6a02:6a17:10b0:cd6:db2:b293])
 (user=dmatlack job=prod-delivery.src-stubby-dispatcher) by
 2002:a05:6a20:7345:b0:3de:8ee8:8323 with SMTP id adf61e73a8af0-3e928956a7cmr407720637.29.1793306008350;
 Thu, 29 Oct 2026 13:33:28 -0700 (PDT)
Date: Thu, 29 Oct 2026 20:33:21 +0000
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
Message-ID: <20261029203324.1637772-3-dmatlack@google.com>
Subject: [PATCH 2/5] vfio/pci: Annotate lockless accesses to vdev->sriov_active
From: David Matlack <dmatlack@google.com>
To: kvm@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-kselftest@vger.kernel.org, stable@vger.kernel.org
Cc: Abhishek Sahu <abhsahu@nvidia.com>, Alex Williamson <alex@shazbot.org>, 
	David Matlack <dmatlack@google.com>, Raghavendra Rao Ananta <rananta@google.com>, Shuah Khan <shuah@kernel.org>
Content-Type: text/plain; charset="UTF-8"

Use READ_ONCE() and WRITE_ONCE() to annotate the read of
vdev->sriov_active in vfio_pci_set_power_state() and the lockless write
that clears it in vfio_pci_core_sriov_configure().

vfio_pci_core_sriov_configure() intentionally clears sriov_active
without holding memory_lock, so the write can race with the read in
vfio_pci_set_power_state() (which runs under memory_lock). The race
itself is benign, at worst it results in a spurious -EBUSY while the
device stays in D0, but the accesses should be marked to prevent the
compiler from tearing or otherwise optimizing them and to document the
intentional data race (e.g. for KCSAN).

The write that sets sriov_active is done under memory_lock and is
serialized against the lockless write by device_lock, so it does not
need to be annotated.

Fixes: 40ef3edf151e ("vfio/pci: Use a private flag to prevent power state change with VFs")
Signed-off-by: David Matlack <dmatlack@google.com>
---
 drivers/vfio/pci/vfio_pci_core.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/vfio/pci/vfio_pci_core.c b/drivers/vfio/pci/vfio_pci_core.c
index 95aee6b7cbb3..9a62797e50bc 100644
--- a/drivers/vfio/pci/vfio_pci_core.c
+++ b/drivers/vfio/pci/vfio_pci_core.c
@@ -332,7 +332,7 @@ int vfio_pci_set_power_state(struct vfio_pci_core_device *vdev, pci_power_t stat
 	lockdep_assert_held_write(&vdev->memory_lock);
 
 	/* Prevent changing power state for PFs with VFs enabled */
-	if (state > PCI_D0 && vdev->sriov_active)
+	if (state > PCI_D0 && READ_ONCE(vdev->sriov_active))
 		return -EBUSY;
 
 	if (vdev->needs_pm_restore) {
@@ -2396,7 +2396,7 @@ int vfio_pci_core_sriov_configure(struct vfio_pci_core_device *vdev,
 	 * state transition would at most result in an -EBUSY, leaving the
 	 * device in PCI_D0.
 	 */
-	vdev->sriov_active = false;
+	WRITE_ONCE(vdev->sriov_active, false);
 
 	mutex_lock(&vfio_pci_sriov_pfs_mutex);
 	list_del_init(&vdev->sriov_pfs_item);
-- 
2.56.0.317.g454f8302e1-goog

