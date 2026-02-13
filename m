Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6A83C31A044;
	Fri, 13 Feb 2026 09:31:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770975078; cv=none; b=ncsT83phnt/Sn/al26fWXx3AdfO1A1SOXAlpCctJaBJE6mm+8bqUlY67IRoQh4PDQsvdypb+Asm0RCOhMBtOQZWT1b5jyiobbtwN8Nm2MKj5XR/DNE6ufJOQJV1TBnZkCrc/poVEMUPBpAWnLHnlKkK5ce4wSK0l6dECV8pDcpI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770975078; c=relaxed/simple;
	bh=MhNx3S0dVlpNxKMRcdobUk3hHUbH0H41bs4+2RGrNYw=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=cOkkvWDs4B7sPL+nMTE0SnpTfPto9x2cSiqQHvds1jpe43/YL8jMdIZoMtpjZ4GJFKBVFZjosZG1iH4jjNKB3Uj6RizRIEEgpLk4emGn3gGSSLhXtpP+Z9k5Txe+69pdZjiLFxbx8YWwkkaZJdnSuyzsCAEk5gVmLaMmmPRUzSA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=TWrwKmsz; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="TWrwKmsz"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id F1429C19421;
	Fri, 13 Feb 2026 09:31:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1770975077;
	bh=MhNx3S0dVlpNxKMRcdobUk3hHUbH0H41bs4+2RGrNYw=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=TWrwKmszBLe/Bar8C4Mt8P2JxMjERmVpyNENpy0vWefh6rLl8F/jQzCpGL/f2ff+1
	 IbgTE7zn12xKEzb6j/gNFYRnlsVPzfuKRlhSHtgXGkOZ02XuW1TNrn7aeZw2NwdA8k
	 3DtJC+aJQZe3xc+Eh0f+J0N7GwDAyS8C6e0j/xg66UmERfCvRKhV+uMVRGT/XSpVKP
	 2SwvsbIgc6Uhp4+dg9O/RiNFUFQch2BK2FAPYxJjW8ysRtewLdUrZ+3ZoOGLOmhXmD
	 d6MFxCEk+2pBeCVkn8/54jXpPxPjQYv7AfVD0kfFwEp6ZdvpQ9Q6zPfxUQCA4VhHyo
	 MFsXxqxjGpH1g==
From: Tzung-Bi Shih <tzungbi@kernel.org>
To: Bartosz Golaszewski <brgl@kernel.org>,
	Linus Walleij <linusw@kernel.org>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	"Rafael J. Wysocki" <rafael@kernel.org>,
	Danilo Krummrich <dakr@kernel.org>,
	Jonathan Corbet <corbet@lwn.net>,
	Shuah Khan <shuah@kernel.org>,
	Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
	Wolfram Sang <wsa+renesas@sang-engineering.com>,
	Jason Gunthorpe <jgg@nvidia.com>,
	Johan Hovold <johan@kernel.org>,
	"Paul E . McKenney" <paulmck@kernel.org>,
	Dan Williams <dan.j.williams@intel.com>,
	chrome-platform@lists.linux.dev,
	tzungbi@kernel.org,
	linux-gpio@vger.kernel.org,
	linux-kselftest@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v3 05/11] gpio: cdev: Don't check struct gpio_chip in gpio_chrdev_open()
Date: Fri, 13 Feb 2026 09:29:52 +0000
Message-ID: <20260213092958.864411-6-tzungbi@kernel.org>
X-Mailer: git-send-email 2.53.0.310.g728cabbaf7-goog
In-Reply-To: <20260213092958.864411-1-tzungbi@kernel.org>
References: <20260213092958.864411-1-tzungbi@kernel.org>
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

It's harmless even if: chrdev_open() and cdev_device_del() run at the
same time, and gpio_chrdev_open() gets called after the underlying GPIO
chip has gone.  The subsequent file operations check the availability
of struct gpio_chip anyway.

Don't check struct gpio_chip in gpio_chrdev_open().

Signed-off-by: Tzung-Bi Shih <tzungbi@kernel.org>
---
v3:
- No changes.

v2: https://lore.kernel.org/all/20260203061059.975605-6-tzungbi@kernel.org
- No changes.

v1: https://lore.kernel.org/all/20260116081036.352286-11-tzungbi@kernel.org

 drivers/gpio/gpiolib-cdev.c | 6 ------
 1 file changed, 6 deletions(-)

diff --git a/drivers/gpio/gpiolib-cdev.c b/drivers/gpio/gpiolib-cdev.c
index b028198adba8..2e3484a89a3b 100644
--- a/drivers/gpio/gpiolib-cdev.c
+++ b/drivers/gpio/gpiolib-cdev.c
@@ -2689,12 +2689,6 @@ static int gpio_chrdev_open(struct inode *inode, struct file *file)
 	struct gpio_chardev_data *cdev;
 	int ret = -ENOMEM;
 
-	guard(srcu)(&gdev->srcu);
-
-	/* Fail on open if the backing gpiochip is gone */
-	if (!rcu_access_pointer(gdev->chip))
-		return -ENODEV;
-
 	cdev = kzalloc(sizeof(*cdev), GFP_KERNEL);
 	if (!cdev)
 		return -ENOMEM;
-- 
2.53.0.310.g728cabbaf7-goog

