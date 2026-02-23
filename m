Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 614CF347BA5;
	Mon, 23 Feb 2026 06:17:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1771827471; cv=none; b=BxKR2/+b0d/hPcyTvQbS6O6H/I7HBWfy0Sik8hn61ziClRN6zPA+kZ594qOMU+AhmRbQjQ0ilsy2W8s9SmSGf8jPcJWoeajK9J+4bT6BxosFcVts6ht35EMNA3s9TbmfygnLTAceNc8d4SI0A3xi5Vh5ESr9b6l/FvQd+92HR5k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1771827471; c=relaxed/simple;
	bh=yD2pG/K68/APLZzFaGWMD+tmK+JmbviTLcJrVMHoTUE=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=YGyYeViV615iF/hHEmAXMXXlMOQyN0h/EJZwkd3nrvnJ7539IIgaSOuNJf80KPBCnLL1eSTjFS43MT+RKQgfU2az4M7EmeOit1cBDl/B5BYP0R3ZWu9Y6/YTFk5kMBUKsDmlQiZ7LgYzFEB6t7+767ctTYC3uuHsmG45tRr09o0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=UpWNVy/t; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="UpWNVy/t"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B0B99C2BC87;
	Mon, 23 Feb 2026 06:17:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1771827471;
	bh=yD2pG/K68/APLZzFaGWMD+tmK+JmbviTLcJrVMHoTUE=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=UpWNVy/tC3eOjOfg8ZlrJiHhQMTSw7mNTSw0rJOWVtShuZp8VUoEN5AotWkix4Da1
	 r+HOusIoy3AJKN4fnV658aIIwQOYgRxKRN32+lTt/GdbB0NPeGWt4ttTnrVWZ8jUWq
	 NmQrIFT/PCGPV4sAEk/p/S2gvzB7x7tjhzUdxANdRHLhYtQYrB6kGY8SY4V8tZKcvM
	 nxqAdz2QxP4LmRxV0QcsYf/MLAdxwxbl+sazB119vzAadLNovywxrzv+xrX59h1JiA
	 HYh+ERU+g7BYxadMWJw54AXKujIimId1VlN87wUFdflIWcJJhjYTs/zuTkjpAfPb9O
	 OG9FUSt/ih5tg==
From: Tzung-Bi Shih <tzungbi@kernel.org>
To: Bartosz Golaszewski <brgl@kernel.org>,
	Linus Walleij <linusw@kernel.org>
Cc: Shuah Khan <shuah@kernel.org>,
	linux-kernel@vger.kernel.org,
	linux-gpio@vger.kernel.org,
	linux-kselftest@vger.kernel.org,
	tzungbi@kernel.org
Subject: [PATCH v4 3/6] gpio: sysfs: Remove redundant check for struct gpio_chip
Date: Mon, 23 Feb 2026 14:17:23 +0800
Message-ID: <20260223061726.82161-4-tzungbi@kernel.org>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20260223061726.82161-1-tzungbi@kernel.org>
References: <20260223061726.82161-1-tzungbi@kernel.org>
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

gpiochip_sysfs_unregister() is only called by gpiochip_remove() where
the struct gpio_chip is ensured.

Remove the redundant check.

Reviewed-by: Linus Walleij <linusw@kernel.org>
Signed-off-by: Tzung-Bi Shih <tzungbi@kernel.org>
---
v4:
- Add R-b tag.
- To be consistent, rename `chip` -> `gc`.

v3: https://lore.kernel.org/all/20260213092958.864411-4-tzungbi@kernel.org
- Pass struct gpio_chip * only.

v2: https://lore.kernel.org/all/20260203061059.975605-4-tzungbi@kernel.org
- No changes.

v1: https://lore.kernel.org/all/20260116081036.352286-9-tzungbi@kernel.org

 drivers/gpio/gpiolib-sysfs.c | 11 +++--------
 drivers/gpio/gpiolib-sysfs.h |  4 ++--
 drivers/gpio/gpiolib.c       |  2 +-
 3 files changed, 6 insertions(+), 11 deletions(-)

diff --git a/drivers/gpio/gpiolib-sysfs.c b/drivers/gpio/gpiolib-sysfs.c
index 270e8060e761..1c25a7dd3db4 100644
--- a/drivers/gpio/gpiolib-sysfs.c
+++ b/drivers/gpio/gpiolib-sysfs.c
@@ -1053,11 +1053,11 @@ int gpiochip_sysfs_register(struct gpio_device *gdev)
 	return 0;
 }
 
-void gpiochip_sysfs_unregister(struct gpio_device *gdev)
+void gpiochip_sysfs_unregister(struct gpio_chip *gc)
 {
+	struct gpio_device *gdev = gc->gpiodev;
 	struct gpiodev_data *data;
 	struct gpio_desc *desc;
-	struct gpio_chip *chip;
 
 	guard(mutex)(&sysfs_lock);
 
@@ -1065,13 +1065,8 @@ void gpiochip_sysfs_unregister(struct gpio_device *gdev)
 	if (!data)
 		return;
 
-	guard(srcu)(&gdev->srcu);
-	chip = srcu_dereference(gdev->chip, &gdev->srcu);
-	if (!chip)
-		return;
-
 	/* unregister gpiod class devices owned by sysfs */
-	for_each_gpio_desc_with_flag(chip, desc, GPIOD_FLAG_SYSFS) {
+	for_each_gpio_desc_with_flag(gc, desc, GPIOD_FLAG_SYSFS) {
 		gpiod_unexport_unlocked(desc);
 		gpiod_free(desc);
 	}
diff --git a/drivers/gpio/gpiolib-sysfs.h b/drivers/gpio/gpiolib-sysfs.h
index b794b396d6a5..fd5db5384681 100644
--- a/drivers/gpio/gpiolib-sysfs.h
+++ b/drivers/gpio/gpiolib-sysfs.h
@@ -8,7 +8,7 @@ struct gpio_device;
 #ifdef CONFIG_GPIO_SYSFS
 
 int gpiochip_sysfs_register(struct gpio_device *gdev);
-void gpiochip_sysfs_unregister(struct gpio_device *gdev);
+void gpiochip_sysfs_unregister(struct gpio_chip *gc);
 
 #else
 
@@ -17,7 +17,7 @@ static inline int gpiochip_sysfs_register(struct gpio_device *gdev)
 	return 0;
 }
 
-static inline void gpiochip_sysfs_unregister(struct gpio_device *gdev)
+static inline void gpiochip_sysfs_unregister(struct gpio_chip *gc)
 {
 }
 
diff --git a/drivers/gpio/gpiolib.c b/drivers/gpio/gpiolib.c
index 08a3697dbd5a..d5070c538ba5 100644
--- a/drivers/gpio/gpiolib.c
+++ b/drivers/gpio/gpiolib.c
@@ -1285,7 +1285,7 @@ void gpiochip_remove(struct gpio_chip *gc)
 	struct gpio_device *gdev = gc->gpiodev;
 
 	/* FIXME: should the legacy sysfs handling be moved to gpio_device? */
-	gpiochip_sysfs_unregister(gdev);
+	gpiochip_sysfs_unregister(gc);
 	gpiochip_free_hogs(gc);
 	gpiochip_free_remaining_irqs(gc);
 
-- 
2.51.0

