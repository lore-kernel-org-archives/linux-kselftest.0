Received: from mail-ot1-f97.google.com (mail-ot1-f97.google.com [209.85.210.97])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9E60B38BF7B
	for <linux-kselftest@vger.kernel.org>; Thu, 26 Feb 2026 18:47:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.97
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772131628; cv=none; b=jQON3SGaFY8nqvv6bAu8KjM4a4i1Rl5HIAzi1fbENHks4BKdR2nwCIt0UNj278k2mwQ5lP0yrVq17xKMHEDwbNhbIJ6O/sKy13kvOcbwV6us+TpWvwSeqfSFK/oldnfsG8BjngGccDMRMmfpwK/W6n1epHtiqDnF5gFiXRn0Kgo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772131628; c=relaxed/simple;
	bh=W86nEt6NxrH/azDYUo8e8qcXbO9XW3P9ASHlOypQvuE=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=scbITsn2GO8QAEbLfWWrIT3WzDxo5AQ7T/wWvsmHyTfoAyCS82fUHPtgrutPszNYdMe/4rDsf/JVv29xNSCrVRDfwyBL5N2ZlmgEC9NoVN+ENOuOlHydO/PjxBwnFZJf2oMUMKcFTizxFDey0UdIJrADYXAnT09B6aPuNyV8ZH4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=broadcom.com; spf=fail smtp.mailfrom=broadcom.com; dkim=pass (1024-bit key) header.d=broadcom.com header.i=@broadcom.com header.b=BMjhZwl+; arc=none smtp.client-ip=209.85.210.97
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=broadcom.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=broadcom.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=broadcom.com header.i=@broadcom.com header.b="BMjhZwl+"
Received: by mail-ot1-f97.google.com with SMTP id 46e09a7af769-7d4c9537f90so814157a34.0
        for <linux-kselftest@vger.kernel.org>; Thu, 26 Feb 2026 10:47:06 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772131625; x=1772736425;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:dkim-signature:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=HBpIii1a6ci9G3XxJ980AkP2auUKLh+wfXsf/L+7o90=;
        b=jLa2cKQTRw8kzvZkS6eZqhUXEV1xXlO8i8DWcurvUX23TIaYRTBEtjIxze1PWYvzxb
         zPvklQtRHdWpYcHj2L32da7kaii2b1rVHhEAX8vlfvJniOHNxOeVqfN/wn4pPmRMr0ai
         +2kV3Aem6AThRz5UMtYlFji2zWZSWeWfXisbaREBA0Z6dmPDwbCqIWNur2BvP3fh+nxI
         O+Uf24QMO9Vy5yrefXJfEeUvS4sLRSbBA7wjDVEOvFngjWn0XP88OUej/Yg84A0OI0jz
         emmbTl6weKjydmuHGWgwQ2WjPtYrt8gRd20xriQyzUz/uSOkVHTGkJ4TPMwp867v0Nh6
         +6FQ==
X-Forwarded-Encrypted: i=1; AJvYcCWXjNY5MRpF0fM55+pr2LybNdKCZp3gvdwqT69PIUHUQ1XL1eRpv3JS9MdVdkDwyP7H5rn7wc/dF24sxA4IOTA=@vger.kernel.org
X-Gm-Message-State: AOJu0Yw5jL2Ma5XCnb6+4E2INiz+A2O9bU9ykvms4t3GuDmoYVcBpm6O
	k71JVJdTeltXRDCEwC1ip2S6h8kQhRto7p5PqWPLhEGXpR/ouYEZ+MQ0aYj61PxNxvyfnO8OrTk
	BNoGVrF9guiAv2/M70MJUElZaA400J1uYgL+mtb1pDm61f8tSGMBsHuwNLM03p8htMwdyXNhZmj
	pvjr0BKLYQZkQ6p7k3N43oO/sEUrLuoow3Nyjx/jD6akfdE54TMJvJ1fnThdbMvMEDapRyxZLw0
	N31l4nawJH0jZoNU25L4Q==
X-Gm-Gg: ATEYQzw7twUq61qKONSA3BnUzJWaOq37mZDumUo0wDBZESgakSgwo2XvbBWozhrlnc1
	tO/NHEzc7AiOUqEvaG9sHB0Wj/ku0DxRd1DIsln4yrimS9ReArciuWuodr7eHhJWUFpqZrasOfg
	mgMavrrgzWcpvB8yXZMfUuun4FaEny33gNItdKAj++Hf7YmdJbLe792YaZ2j/MzVq27gkTLo+ju
	T1LSHrdQxrahwJ8u3hZ89SRGkK/T8mXfn+n/yVuQ9I3gbNOp2JdC3HW68ZN73xsLjpIBdDFVldS
	Dl2oFd7o4Dp0zEgKVW6Viw5BlYQlPONDKUY04MKuVpzI401y138B7wUIWe2yTDMmidk70FdOivo
	pR7zgAFTnBdE/aQzgBppnwTAkcPLd9U2gOjPDQoFqVxZoFPUCUUQItRSXjCUX4gME3o3nwi2RAx
	ss36VWajWL9vVvULw/3tQHBpehf5Vaw30x24JZEG0fwiJ3rjIvf+ACZWqldw==
X-Received: by 2002:a05:6870:3044:b0:409:99bb:1eae with SMTP id 586e51a60fabf-4162706478fmr144574fac.53.1772131625393;
        Thu, 26 Feb 2026 10:47:05 -0800 (PST)
Received: from smtp-us-east1-p01-i01-si01.dlp.protect.broadcom.com (address-144-49-247-103.dlp.protect.broadcom.com. [144.49.247.103])
        by smtp-relay.gmail.com with ESMTPS id 586e51a60fabf-4160d21f7aesm384949fac.9.2026.02.26.10.47.05
        for <linux-kselftest@vger.kernel.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Thu, 26 Feb 2026 10:47:05 -0800 (PST)
X-Relaying-Domain: broadcom.com
X-CFilter-Loop: Reflected
Received: by mail-qk1-f199.google.com with SMTP id af79cd13be357-8c71500f274so123363685a.1
        for <linux-kselftest@vger.kernel.org>; Thu, 26 Feb 2026 10:47:04 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=broadcom.com; s=google; t=1772131624; x=1772736424; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=HBpIii1a6ci9G3XxJ980AkP2auUKLh+wfXsf/L+7o90=;
        b=BMjhZwl+v5s540crhK+DbKGFvgdHrEnRvb5G9cmDJgjnTnyIEZfbV3EuiMwSdvKMFU
         hasOfPLbTeCeBYUv5aaViH5ZF35IPwPZ83O1m9p+jIEfJn/2nt3WAyAKlWd78fBY4df4
         Stv0iwVGeQjkPVldaBeoWWCJSvWW7gM63k9Lg=
X-Forwarded-Encrypted: i=1; AJvYcCXOBhnI5AUco7KhBUgimMyMWt4w+ljTkkYcF5QNBgD5Ah4SvqMYCAppA0/7rUtMCShw3p9fC8cB41fKA2IQ1NA=@vger.kernel.org
X-Received: by 2002:a05:620a:1a90:b0:8ca:55:ac60 with SMTP id af79cd13be357-8cbc12294fdmr421801185a.78.1772131624400;
        Thu, 26 Feb 2026 10:47:04 -0800 (PST)
X-Received: by 2002:a05:620a:1a90:b0:8ca:55:ac60 with SMTP id af79cd13be357-8cbc12294fdmr421794885a.78.1772131623840;
        Thu, 26 Feb 2026 10:47:03 -0800 (PST)
Received: from lvnvda4076.lvn.broadcom.net ([192.19.161.250])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-8cbbf6f5c41sm255721485a.24.2026.02.26.10.47.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 26 Feb 2026 10:47:03 -0800 (PST)
From: Kiran Kella <kiran.kella@broadcom.com>
To: davem@davemloft.net,
	edumazet@google.com,
	kuba@kernel.org,
	daniel.zahka@gmail.com,
	willemb@google.com,
	pabeni@redhat.com,
	andrew+netdev@lunn.ch,
	horms@kernel.org
Cc: shuah@kernel.org,
	linux-kselftest@vger.kernel.org,
	netdev@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	jayakrishnan.udayavarma@broadcom.com,
	ajit.khaparde@broadcom.com,
	akhilesh.samineni@broadcom.com,
	Kiran Kella <kiran.kella@broadcom.com>
Subject: [net-next, v3 1/2] psp: Support for transmit on logical device when the underlying transport device supports PSP.
Date: Thu, 26 Feb 2026 10:46:53 -0800
Message-ID: <20260226184654.3180648-2-kiran.kella@broadcom.com>
X-Mailer: git-send-email 2.45.4
In-Reply-To: <20260226184654.3180648-1-kiran.kella@broadcom.com>
References: <20260226184654.3180648-1-kiran.kella@broadcom.com>
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-DetectorID-Processed: b00c1d49-9d2e-4205-b15f-d015386d3d5e

This is achieved by propagating the psp_dev from the lower device
to the upper devices in the device stack via a netdevice notifier.
The lowest device owns the psp_dev pointer while the upper devices
just borrow the pointer. When the lower device is unlinked, the
borrowed pointer is cleared in the upper device.
Assumption being that psp_dev is set on the lowest device before
any upper devices are stacked on that lowest device.

Signed-off-by: Kiran Kella <kiran.kella@broadcom.com>
Reviewed-by: Ajit Kumar Khaparde <ajit.khaparde@broadcom.com>
Reviewed-by: Akhilesh Samineni <akhilesh.samineni@broadcom.com>
---
 net/psp/psp_main.c | 117 ++++++++++++++++++++++++++++++++++++++++++++-
 1 file changed, 116 insertions(+), 1 deletion(-)

diff --git a/net/psp/psp_main.c b/net/psp/psp_main.c
index a8534124f626..303a3af3bdf2 100644
--- a/net/psp/psp_main.c
+++ b/net/psp/psp_main.c
@@ -3,6 +3,7 @@
 #include <linux/bitfield.h>
 #include <linux/list.h>
 #include <linux/netdevice.h>
+#include <linux/rtnetlink.h>
 #include <linux/xarray.h>
 #include <net/net_namespace.h>
 #include <net/psp.h>
@@ -110,13 +111,45 @@ void psp_dev_free(struct psp_dev *psd)
 	kfree_rcu(psd, rcu);
 }
 
+/**
+ * psp_clear_upper_dev_psp_dev() - Clear borrowed psp_dev pointer on upper
+ *				   device
+ * @upper_dev:	Upper device that may have borrowed psp_dev pointer
+ * @priv:	netdev_nested_priv containing the psp_dev being unregistered
+ *
+ * Callback for netdev_walk_all_upper_dev_rcu() to clear borrowed psp_dev
+ * pointers on upper devices when the underlying psp_dev is being unregistered.
+ *
+ * Return: 0 to continue walking, non-zero to stop.
+ */
+static int psp_clear_upper_dev_psp_dev(struct net_device *upper_dev,
+				       struct netdev_nested_priv *priv)
+{
+	struct psp_dev *psd = priv->data;
+	struct psp_dev *upper_psd;
+
+	upper_psd = rcu_dereference(upper_dev->psp_dev);
+	if (upper_psd == psd)
+		rcu_assign_pointer(upper_dev->psp_dev, NULL);
+
+	return 0;
+}
+
 /**
  * psp_dev_unregister() - unregister PSP device
  * @psd:	PSP device structure
+ *
+ * Unregisters a PSP device and clears all borrowed psp_dev pointers on
+ * upper devices (e.g., VLAN subinterfaces) that reference this device.
+ * This prevents use-after-free if upper devices still have borrowed
+ * pointers when the psp_dev structure is freed.
  */
 void psp_dev_unregister(struct psp_dev *psd)
 {
 	struct psp_assoc *pas, *next;
+	struct netdev_nested_priv priv = {
+		.data = psd,
+	};
 
 	mutex_lock(&psp_devs_lock);
 	mutex_lock(&psd->lock);
@@ -137,6 +170,12 @@ void psp_dev_unregister(struct psp_dev *psd)
 
 	rcu_assign_pointer(psd->main_netdev->psp_dev, NULL);
 
+	/* Clear borrowed psp_dev pointers on all upper devices */
+	rcu_read_lock();
+	netdev_walk_all_upper_dev_rcu(psd->main_netdev,
+				      psp_clear_upper_dev_psp_dev, &priv);
+	rcu_read_unlock();
+
 	psd->ops = NULL;
 	psd->drv_priv = NULL;
 
@@ -313,11 +352,87 @@ int psp_dev_rcv(struct sk_buff *skb, u16 dev_id, u8 generation, bool strip_icv)
 }
 EXPORT_SYMBOL(psp_dev_rcv);
 
+/**
+ * psp_netdevice_event() - Handle netdevice events for PSP device propagation
+ * @nb:		notifier block
+ * @event:	netdevice event
+ * @ptr:	netdevice notifier info
+ *
+ * Propagates psp_dev pointer from lower devices to upper devices when
+ * upper devices are created (e.g., VLAN subinterfaces).
+ * Excluding from this logic, the upper devices that have multiple lower
+ * devices eg., bond devices.
+ *
+ * Return: NOTIFY_DONE
+ */
+static int psp_netdevice_event(struct notifier_block *nb,
+			       unsigned long event, void *ptr)
+{
+	struct netdev_notifier_changeupper_info *info;
+	struct net_device *dev, *upper_dev;
+	struct psp_dev *psd;
+
+	if (event != NETDEV_CHANGEUPPER)
+		return NOTIFY_DONE;
+
+	info = ptr;
+	dev = netdev_notifier_info_to_dev(ptr);
+	upper_dev = info->upper_dev;
+
+	if (netif_is_lag_master(upper_dev))
+		return NOTIFY_DONE;
+
+	if (info->linking) {
+		/* Lower device is being linked to an upper device.
+		 * Propagate psp_dev from the immediate lower device to the
+		 * upper device. The immediate lower device would have already
+		 * got the psp_dev pointer set in a previous notification (or
+		 * owns it if it's the lowest device).
+		 * Upper devices just borrow the pointer.
+		 *
+		 * Use psp_dev_tryget/put to guard against a concurrent
+		 * psp_dev_unregister that may have already cleared the
+		 * lower device's pointer and started freeing the psp_dev.
+		 */
+		psd = rtnl_dereference(dev->psp_dev);
+		if (psd && psp_dev_tryget(psd)) {
+			rcu_assign_pointer(upper_dev->psp_dev, psd);
+			psp_dev_put(psd);
+		}
+	} else {
+		/* Lower device is being unlinked from an upper device.
+		 * Clear the borrowed psp_dev pointer on the upper device.
+		 * Any devices stacked above upper_dev will get their own
+		 * NETDEV_CHANGEUPPER notifications as the stack unwinds.
+		 */
+		psd = rtnl_dereference(upper_dev->psp_dev);
+		if (psd)
+			rcu_assign_pointer(upper_dev->psp_dev, NULL);
+	}
+
+	return NOTIFY_DONE;
+}
+
+static struct notifier_block psp_netdevice_notifier = {
+	.notifier_call = psp_netdevice_event,
+};
+
 static int __init psp_init(void)
 {
+	int err;
+
 	mutex_init(&psp_devs_lock);
 
-	return genl_register_family(&psp_nl_family);
+	err = register_netdevice_notifier(&psp_netdevice_notifier);
+	if (err)
+		return err;
+
+	err = genl_register_family(&psp_nl_family);
+	if (err) {
+		unregister_netdevice_notifier(&psp_netdevice_notifier);
+		return err;
+	}
+	return 0;
 }
 
 subsys_initcall(psp_init);
-- 
2.45.4

