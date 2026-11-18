Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.210.49
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795010991;
	b=H832QGDaw6ISXW3X3D1qfMl7BPTrib9q6RPVuZ0LyuK2Y+bMZgHwpa+NDvu5PVpYly/3
	 F3VLvdrnJEWGgX/O2gseceJ3iJs2rQLsJMXmVrjiCdRzYNv4b6ayS+Dc5B5zckgMt5R5k
	 k5hsGVlRp4CwiPCoHyMF4gjAl+uYtX6cJbeU5A6R0Qu98u7vXpizekSfrPFpkWY0Yo7Lp
	 TkRcqbdvcCqVGzjND2fQ5hL+Yug9IRiYMrkUjT9hjpe9GhFxsVQnReTpRFtxR05nQfus+
	 UfHePdwxrLmX5FcVZzsJq1WTf34dqyWYczRQTDa1iCnawFE5RmINRpIDfVESRbd3r9Q==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795010991;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:Date:Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer;
	bh=yZCkizolyAVKMK4/2ALDW/1erdTmZwOxyhHtP+ECgyc=;
	b=LtUkiTrRVmZg5j3fK2cZQY04RiKLq0A6T2xeHi+K/450sq/1ELL/+viSxifZbFjigARj
	 oqh/BnyDf/iANNzIfiR8k1rsieN8/EIRoLnsBdP3YLmZWaesOlygxjzCdV+IgnQltc7sY
	 g4lPqFqJuckv2Ffgi559nr/ERv8u5dd8ov7Gx0mSC97ZjjlyCPXPp8IKDU7cxlcEoFBy+
	 +rik9436ZCB0J/bson/IWmCqYk0jtb5CZiCDoX+nueVqq5/rjq4u7Scdc40pxTMRURofz
	 2VK7HrZq2Kl1CQgFsBOQxIPQmKp1/Eb70UQPRMv9OboLuwRDaSYHAHa6VbNe7OXU45g==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=YdxWSs9f;
	arc=none smtp.remote-ip=209.85.210.49
Received: from mail-ot1-f49.google.com (mail-ot1-f49.google.com [209.85.210.49])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7402D60A3811
	for <linux-kselftest@vger.kernel.org>; Wed, 18 Nov 2026 14:09:48 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 7402D60A3811
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=YdxWSs9f
Received: by mail-ot1-f49.google.com with SMTP id 46e09a7af769-862aca1ed4dso377867a34.0
        for <linux-kselftest@vger.kernel.org>; Wed, 18 Nov 2026 06:09:48 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795010987; x=1795615787; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=yZCkizolyAVKMK4/2ALDW/1erdTmZwOxyhHtP+ECgyc=;
        b=YdxWSs9fTeNhMct595/oVLiqo4SORe9IZRf2m8BIulFoNjelWGz3xxKz/0uNqyrWl6
         wIzJKUTM8CjnEhCcnqMD+1LV0RwB91mxHek4mpx0nvDFLbowzBoVWbSHjHYbq0TpxmFD
         XJhn5g4hwSe9EmuDvXrMiFDLDEvPvl3FjljJOtuR/TeUsC5u4QrYzpRgDXIAyA1swFXC
         Eo/3EN+d3uVlCYetbfxkJK3YzuAjAAD1d3xcn5+49qLvDD9PJzuKZaIgHPBEAYjJbh0m
         nbACq/u6aE+kGjfzjSxjx8kjXcANZOYgMXTDrbIKNxJJXKIRZOCs7s4mnYlVdRVBlqiu
         z+Gw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795010987; x=1795615787;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=yZCkizolyAVKMK4/2ALDW/1erdTmZwOxyhHtP+ECgyc=;
        b=lC4Ck8QcgptqLQoeW3cFclGHDl1YTIqv1svZg5PmAcyzEastkGVsMscXB3H4mYnvE8
         Cn7q05YQawSbWuhTR15/cmqeUB8xgxBpNtmaQa3CCzI1G7ac8hyLgR1NlySzy1WHYL//
         NQkmy4kvb5y3Db++EWwL4XIIZxIFrBTi0c3zHtTSNzXc7sFTPqNLhUh8QONWHMm/KV+u
         bMglpojRh1vIpxFPCGnMYz2ZTnMatAcUbrkLjDim2V10vVLueFpH2lZjp1RWufWCkqiz
         pyUlP0nx/dOMKEvIrM60oGBAOQDpYsepYSs1CCgwWgOmVrjB+x8hLi1OInxASwuD51a6
         C+Gg==
X-Forwarded-Encrypted: i=1; AL+hErH57QNOISj6J7zi/plr049tUvzvH4L7fqgrVqaieszTBk7VK935DKt4zMXgUnxEAIsIVrAV0uQZj3BjA1NR7kc=@vger.kernel.org
X-Gm-Message-State: APuU4Z9LsQ7PEaUnb0i0abPTJKgrraW/+qhF2R4PfOdvVreNDDvupxlW
	0+/9FAi58TF7p8ykLPvVFYEGlqhN7wcieAHT4Gzq5evZIsUhE+ahKH0x
X-Gm-Gg: AYBFou3LFtg9o4fhw3t/91I8ygB5Gu4Oj+vsIscxTy6fiJsbn6PEbo9tM/daSey2aQR
	JJVI8d1U1UzlO6/NGFprluFtnXAsu+M75PatM/JkjoDM3iCsHHuV9eXeCauKCivfSmghujt3FjQ
	UcvsXq5JUfZpOI2DfmYNvADZT2UPWACg1+WdYFS0a39O94Gf/IIHZq2PLh2QHEJVMZvUrczxaJd
	1WIb2cDWU2b8nKldCAQXDJuSfVaITStDm7sApr+48jvu1xXrWvvQaePaHuzvFYiUPn/f1F7swJl
	55YE0Sgs29lGVW794LJxLvnEa73Kag4z8ZN+hEKDvHS93BNOQzu6PspTeqI+sE6ZwQiYWg9Bwjl
	IfKEW/zj1Wlml31TbYaAsqMp7T2S3+YZN9vuR9gqlYbzjQ4OguTBW6EEt3hxBx/bnqKAOBneCPy
	va9MEujDAM/MQY4D5OOXqOZmAMYkrkw8DtqFnLSJJf2JNOVyPvj1XqgWmR0zVDGUjwvq5xfaADg
	gKK2skUJxcrbxpbM3k0AH0WzXupUJYisKLmmOY3e0vrmkDWN6Kg0EJgTk5RID4LUd2gpjhip6j9
	DED3mgUqq1cYlv2qo26NDKxz2Q==
X-Received: by 2002:a05:6830:440a:b0:862:e7cf:187b with SMTP id 46e09a7af769-862f08fa17bmr2758111a34.7.1795010987177;
        Wed, 18 Nov 2026 06:09:47 -0800 (PST)
Received: from localhost ([2a03:2880:30ff:2::])
        by smtp.gmail.com with ESMTPSA id 46e09a7af769-862f021295csm2161023a34.15.2026.11.18.06.09.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 18 Nov 2026 06:09:46 -0800 (PST)
From: Daniel Zahka <daniel.zahka@gmail.com>
Date: Wed, 18 Nov 2026 06:08:06 -0800
Subject: [PATCH net-next v5 4/6] psp: defer tx key deletions for SADB
 drivers
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Post: <mailto:linux-kselftest@vger.kernel.org>
List-Help: <mailto:linux-kselftest+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kselftest+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261118-psp-v5-4-b9ec840e0296@gmail.com>
References: <20261118-psp-v5-0-b9ec840e0296@gmail.com>
In-Reply-To: <20261118-psp-v5-0-b9ec840e0296@gmail.com>
To: Jakub Kicinski <kuba@kernel.org>, 
 Willem de Bruijn <willemdebruijn.kernel@gmail.com>, 
 "David S. Miller" <davem@davemloft.net>, Eric Dumazet <edumazet@kernel.org>, 
 Paolo Abeni <pabeni@redhat.com>, Simon Horman <horms@kernel.org>, 
 Jonathan Corbet <corbet@lwn.net>, Shuah Khan <skhan@linuxfoundation.org>, 
 Randy Dunlap <rdunlap@infradead.org>, 
 Donald Hunter <donald.hunter@gmail.com>, 
 Andrew Lunn <andrew+netdev@lunn.ch>, Shuah Khan <shuah@kernel.org>
Cc: Daniel Zahka <daniel.zahka@gmail.com>, netdev@vger.kernel.org, 
 linux-kernel@vger.kernel.org, linux-doc@vger.kernel.org, 
 linux-kselftest@vger.kernel.org, Willem de Bruijn <willemb@google.com>
X-Mailer: b4 0.13.0

Devices that store tx keys in an SADB can hold references to key
handles in tx descriptor state. PSP core needs to make sure all of
these tx descriptors have been completed before calling
psp_dev_tx_key_del(). Before rekeying, this was ensured by skbs
holding references to skb->sk, and sk->psp_assoc being cleared only in
the socket destructor.

Rekeying introduces a code path where a psp_assoc is detached from its
socket and may be freed while the socket is still alive. This means
skbs may exist in the driver ring that were rendered into descriptors
using that old psp_assoc. We cannot delete the key from the SADB until
we know these descriptors have been completed.

After a psp_assoc has all references drained (refcount and rcu), PSP
core records the BQL queued count for each active TX queue and starts a
descriptor grace period. It then polls the queued and completed byte
counts until all data outstanding at the start of the grace period has
completed. After that point, any keys queued for deletion before the
start of the grace period can be deleted from the SADB.

Make CONFIG_INET_PSP depend on CONFIG_BQL.

Drivers which install Tx keys must meet the requirements in
Documentation/networking/psp.rst.

The deferred deletion work takes psp_dev::lock before the netdev
instance lock, following the order documented in the previous patch.

Adding a time based rate limit per socket for tx-assoc to prevent
wasting SADB or deferred deletion queue space is possible for future
work. For now, users should avoid presenting PSP devices to users they
don't trust to abuse this.

Reviewed-by: Willem de Bruijn <willemb@google.com>
Signed-off-by: Daniel Zahka <daniel.zahka@gmail.com>
---
v5:
- take a psd reference across mutex_unlock() in psp_assoc_free() after
  handing the assoc to the deferred queue
- move the psp_dev_unregister() locking rule to a separate patch

v3:
- document that Tx descriptors must be completed or discarded
  before psp_dev_unregister()

v2:
- move grace period mechanism to use bql instead of driver callback.
- allow tx rekey on SADB devices
---
 Documentation/networking/psp.rst |  42 +++++++
 include/net/psp/types.h          |  18 +++
 net/psp/Kconfig                  |   1 +
 net/psp/Makefile                 |   2 +-
 net/psp/psp.h                    |   5 +
 net/psp/psp_deferred_del.c       | 231 +++++++++++++++++++++++++++++++++++++++
 net/psp/psp_main.c               |  22 +++-
 net/psp/psp_sock.c               |  22 +++-
 8 files changed, 334 insertions(+), 9 deletions(-)

diff --git a/Documentation/networking/psp.rst b/Documentation/networking/psp.rst
index 43f222b38d3d..ceb1e232317f 100644
--- a/Documentation/networking/psp.rst
+++ b/Documentation/networking/psp.rst
@@ -202,6 +202,48 @@ Drivers must use ``psp_skb_get_assoc_rcu()`` to check if PSP Tx offload
 was requested for given skb. On Rx drivers should allocate and populate
 the ``SKB_EXT_PSP`` skb extension, and set the skb->decrypted bit to 1.
 
+Deferred Tx key deletion
+~~~~~~~~~~~~~~~~~~~~~~~~
+
+Drivers which implement ``tx_key_add`` and ``tx_key_del`` may hold key
+references in their Tx rings, so PSP core waits until descriptors
+containing these references are completed before removing the key from
+the underlying device. PSP core uses accounting based on Byte Queue Limits
+(BQL) to wait for a suitable grace period before asking the driver to
+remove the key.
+
+Drivers which implement the Tx key callbacks must meet the following
+requirements:
+
+* The driver must be "ops locked"
+  (see Documentation/networking/netdevices.rst).
+* A PSP skb accepted by ``ndo_start_xmit()`` must remain socket-owned until
+  every Tx descriptor referencing its PSP key has been completed or otherwise
+  made incapable of using the key. The driver must not orphan the skb before
+  that point. Otherwise, the socket destructor may free the Tx key while key
+  references remain in the Tx ring.
+* Every PSP packet accepted by ``ndo_start_xmit()`` must be included in BQL
+  queued bytecount before the function returns.
+* Completion bytecounts must exactly match enqueue bytecounts and preserve
+  queue order. A later packet must not be reported as completed while an earlier
+  packet can still reference its key.
+* Before calling ``dql_reset()`` on a queue, the driver must ensure that all
+  outstanding descriptors containing key references have been completed or
+  discarded. If called under the netdev instance lock, then descriptors can
+  remain outstanding after the reset as long as they are completed or
+  discarded before the instance lock is released.
+* When decreasing ``real_num_tx_queues``, the driver must ensure that every
+  outstanding descriptor on the queues at or above the new Tx queue count
+  has been completed or otherwise made incapable of using its PSP key
+  before the netdev instance lock is released.
+* The BQL state of a queue below ``real_num_tx_queues`` must reflect all
+  bytes completed or be reset after the queue has been quiesced. Failure to
+  do so will stall the grace period algorithm.
+* Before calling ``psp_dev_unregister()``, the driver must ensure that all
+  outstanding Tx descriptors containing key references have been completed
+  or discarded. PSP core deletes all remaining Tx keys during
+  unregistration without waiting for a grace period.
+
 Kernel implementation notes
 ---------------------------
 
diff --git a/include/net/psp/types.h b/include/net/psp/types.h
index 9eb89d2d680c..f3e1fe97224e 100644
--- a/include/net/psp/types.h
+++ b/include/net/psp/types.h
@@ -6,6 +6,7 @@
 #include <linux/bits.h>
 #include <linux/mutex.h>
 #include <linux/refcount.h>
+#include <linux/workqueue.h>
 #include <net/net_trackers.h>
 
 struct netlink_ext_ack;
@@ -81,6 +82,11 @@ struct psp_assoc_dev {
  *			device key
  * @stale_assocs:	associations which use a rotated out key, or were
  *			superseded by a rekey
+ * @tx_del:		deferred TX key deletion state
+ * @tx_del.active:	TX keys to be deleted after the current grace period
+ * @tx_del.next:	TX keys queued for deletion during current grace period
+ * @tx_del.work:	delayed work item for periodic grace period checking
+ * @tx_del.txq_state:	TX queue state for deferred deletion grace periods
  *
  * @stats:	statistics maintained by the core
  * @stats.rotations:	See stats attr key-rotations
@@ -110,6 +116,13 @@ struct psp_dev {
 	struct list_head prev_assocs;
 	struct list_head stale_assocs;
 
+	struct {
+		struct list_head active;
+		struct list_head next;
+		struct delayed_work work;
+		struct psp_txq_state *txq_state;
+	} tx_del;
+
 	struct {
 		unsigned long rotations;
 		unsigned long stales;
@@ -158,9 +171,14 @@ struct psp_key_parsed {
  * enum psp_assoc_flags - flags of struct psp_assoc
  * @PSP_ASSOC_SKIP_TX_KEY_DEL: Do not delete Tx key from psp_dev. It was
  *	copied to a newer psp_assoc during an Rx rekey.
+ * @PSP_ASSOC_DEFER_TX_KEY_DEL: Send Tx key to psp_dev's deferred deletion
+ *	queue. This psp_assoc was detached from its socket during a Tx rekey
+ *	and requires device descriptor state referencing this key to be
+ *	drained.
  */
 enum psp_assoc_flags {
 	PSP_ASSOC_SKIP_TX_KEY_DEL	= BIT(0),
+	PSP_ASSOC_DEFER_TX_KEY_DEL	= BIT(1),
 };
 
 struct psp_assoc {
diff --git a/net/psp/Kconfig b/net/psp/Kconfig
index 84d6b0f25460..36c12493784f 100644
--- a/net/psp/Kconfig
+++ b/net/psp/Kconfig
@@ -5,6 +5,7 @@
 config INET_PSP
 	bool "PSP Security Protocol support"
 	depends on INET
+	depends on BQL
 	select SKB_DECRYPTED
 	select SKB_EXTENSIONS
 	select SOCK_VALIDATE_XMIT
diff --git a/net/psp/Makefile b/net/psp/Makefile
index eb5ff3c5bfb2..40decd8fe050 100644
--- a/net/psp/Makefile
+++ b/net/psp/Makefile
@@ -2,4 +2,4 @@
 
 obj-$(CONFIG_INET_PSP) += psp.o
 
-psp-y := psp_main.o psp_nl.o psp_sock.o psp-nl-gen.o
+psp-y := psp_main.o psp_nl.o psp_sock.o psp_deferred_del.o psp-nl-gen.o
diff --git a/net/psp/psp.h b/net/psp/psp.h
index 92d7b92acaed..0cfc82c6c711 100644
--- a/net/psp/psp.h
+++ b/net/psp/psp.h
@@ -18,6 +18,11 @@ int psp_dev_check_access(struct psp_dev *psd, struct net *net, bool admin);
 bool psp_has_assoc_dev_in_ns(struct psp_dev *psd, struct net *net);
 int psp_attach_netdev_notifier(void);
 
+int psp_deferred_del_init(struct psp_dev *psd);
+void psp_deferred_del_stop(struct psp_dev *psd);
+void psp_deferred_del_uninit(struct psp_dev *psd, bool unpublished);
+void psp_deferred_del_queue(struct psp_dev *psd, struct psp_assoc *pas);
+
 void psp_nl_notify_dev(struct psp_dev *psd, u32 cmd);
 void psp_nl_notify_disassoc(struct psp_dev *psd, struct net *net);
 
diff --git a/net/psp/psp_deferred_del.c b/net/psp/psp_deferred_del.c
new file mode 100644
index 000000000000..cfbac72577e9
--- /dev/null
+++ b/net/psp/psp_deferred_del.c
@@ -0,0 +1,231 @@
+// SPDX-License-Identifier: GPL-2.0-only
+
+#include <linux/bitmap.h>
+#include <linux/jiffies.h>
+#include <linux/list.h>
+#include <linux/netdevice.h>
+#include <linux/slab.h>
+#include <net/netdev_lock.h>
+#include <net/psp.h>
+
+#include "psp.h"
+
+#define PSP_TX_GRACE_POLL_MS	1000
+
+struct psp_txq_state {
+	unsigned int num_tx_queues;
+	unsigned long *drained_queues;
+	unsigned int to_complete[];
+};
+
+static void psp_txq_state_free(struct psp_txq_state *state)
+{
+	if (!state)
+		return;
+
+	bitmap_free(state->drained_queues);
+	kvfree(state);
+}
+
+static struct psp_txq_state *
+psp_txq_state_alloc(unsigned int max_tx_queues)
+{
+	struct psp_txq_state *state;
+
+	state = kvzalloc_flex(*state, to_complete, max_tx_queues);
+	if (!state)
+		return NULL;
+
+	state->drained_queues = bitmap_zalloc(max_tx_queues, GFP_KERNEL);
+	if (!state->drained_queues) {
+		psp_txq_state_free(state);
+		return NULL;
+	}
+
+	return state;
+}
+
+static void psp_tx_grace_start(struct psp_dev *psd)
+{
+	struct psp_txq_state *state = psd->tx_del.txq_state;
+	struct net_device *dev = psd->main_netdev;
+	unsigned int i;
+
+	netdev_assert_locked(dev);
+
+	/* Any instances of ndo_start_xmit() that observed these keys through
+	 * psp_skb_get_assoc_rcu() must already be accounted in BQL's queued
+	 * byte count. ndo_start_xmit() runs with BHs disabled, which forms an
+	 * implicit RCU read-side critical section, and we are now at least one
+	 * grace period after any of these psp_assocs have been cleared from
+	 * sk->psp_assoc.
+	 */
+	state->num_tx_queues = dev->real_num_tx_queues;
+	bitmap_zero(state->drained_queues, state->num_tx_queues);
+	for (i = 0; i < state->num_tx_queues; i++) {
+		struct netdev_queue *txq = netdev_get_tx_queue(dev, i);
+
+		state->to_complete[i] = READ_ONCE(txq->dql.num_queued);
+	}
+}
+
+static bool psp_tx_grace_done(struct psp_dev *psd)
+{
+	struct psp_txq_state *state = psd->tx_del.txq_state;
+	struct net_device *dev = psd->main_netdev;
+	bool all_completed = true;
+	unsigned int i;
+
+	netdev_assert_locked(dev);
+
+	if (dev->real_num_tx_queues < state->num_tx_queues)
+		state->num_tx_queues = dev->real_num_tx_queues;
+
+	for (i = 0; i < state->num_tx_queues; i++) {
+		struct netdev_queue *txq = netdev_get_tx_queue(dev, i);
+		unsigned int completed;
+		unsigned int queued;
+
+		if (test_bit(i, state->drained_queues))
+			continue;
+
+		/* Drivers must meet the requirements documented in
+		 * Documentation/networking/psp.rst to guarantee forward
+		 * progress and avoid ending the grace period prematurely.
+		 *
+		 * We snapshotted num_queued in psp_tx_grace_start() and need
+		 * to determine whether num_completed has since reached or
+		 * passed that mark. For a given queue, we can consider first
+		 * whether or not dql_reset() was called at any point between
+		 * when we read num_queued until we read num_completed and
+		 * num_queued here and then separate the space of possible
+		 * states based on that.
+		 *
+		 * Not reset: num_queued and num_completed only increase, and
+		 * dql keeps num_queued - num_completed <= INT_MAX at all
+		 * times. We can form three exhaustive sub cases:
+		 *
+		 * (int)(to_complete - completed) <= 0: completion reached or
+		 * passed the mark. At the time to_complete was read,
+		 * completed was in [to_complete - INT_MAX, to_complete].
+		 *
+		 * (int)(to_complete - queued) > 0: to_complete and queued are
+		 * both snapshots of num_queued, so queued has advanced more
+		 * than INT_MAX + 1 past to_complete. num_completed lags
+		 * queued by at most INT_MAX, so num_completed must have
+		 * crossed to_complete.
+		 *
+		 * Otherwise the mark may still be in flight, so poll again.
+		 *
+		 * Reset: By the driver conditions laid out in
+		 * Documentation/networking/psp.rst, if a dql_reset()
+		 * occurred, and we are holding the instance lock, then we
+		 * know the actual state of the queue is drained. The check
+		 * below is then conservative because there is no risk of
+		 * falsely declaring the queue drained. As long as dql makes
+		 * forward progress the check should eventually report
+		 * drained.
+		 */
+		completed = READ_ONCE(txq->dql.num_completed);
+		queued = READ_ONCE(txq->dql.num_queued);
+
+		if ((int)(state->to_complete[i] - completed) <= 0 ||
+		    (int)(state->to_complete[i] - queued) > 0)
+			__set_bit(i, state->drained_queues);
+		else
+			all_completed = false;
+	}
+
+	return all_completed;
+}
+
+static bool psp_tx_grace_active(struct psp_dev *psd)
+{
+	return !list_empty(&psd->tx_del.active);
+}
+
+static void psp_deferred_del_work(struct work_struct *work)
+{
+	struct delayed_work *dwork = to_delayed_work(work);
+	struct psp_assoc *pas, *tmp;
+	bool need_reschedule;
+	struct psp_dev *psd;
+	LIST_HEAD(to_free);
+
+	psd = container_of(dwork, struct psp_dev, tx_del.work);
+
+	mutex_lock(&psd->lock);
+	netdev_lock(psd->main_netdev);
+
+	if (psp_tx_grace_active(psd) && psp_tx_grace_done(psd))
+		list_splice_init(&psd->tx_del.active, &to_free);
+
+	if (!psp_tx_grace_active(psd) && !list_empty(&psd->tx_del.next)) {
+		psp_tx_grace_start(psd);
+		list_splice_init(&psd->tx_del.next, &psd->tx_del.active);
+	}
+
+	netdev_unlock(psd->main_netdev);
+
+	list_for_each_entry(pas, &to_free, assocs_list)
+		psp_dev_tx_key_del(psd, pas);
+
+	need_reschedule = psp_tx_grace_active(psd);
+	mutex_unlock(&psd->lock);
+
+	if (need_reschedule)
+		mod_delayed_work(system_percpu_wq, &psd->tx_del.work,
+				 msecs_to_jiffies(PSP_TX_GRACE_POLL_MS));
+
+	list_for_each_entry_safe(pas, tmp, &to_free, assocs_list) {
+		list_del(&pas->assocs_list);
+		psp_dev_put(psd);
+		kfree(pas);
+	}
+}
+
+int psp_deferred_del_init(struct psp_dev *psd)
+{
+	INIT_LIST_HEAD(&psd->tx_del.active);
+	INIT_LIST_HEAD(&psd->tx_del.next);
+	INIT_DELAYED_WORK(&psd->tx_del.work, psp_deferred_del_work);
+
+	if (!psd->ops->tx_key_del)
+		return 0;
+
+	psd->tx_del.txq_state =
+		psp_txq_state_alloc(psd->main_netdev->num_tx_queues);
+
+	return psd->tx_del.txq_state ? 0 : -ENOMEM;
+}
+
+void psp_deferred_del_stop(struct psp_dev *psd)
+{
+	disable_delayed_work_sync(&psd->tx_del.work);
+}
+
+void psp_deferred_del_uninit(struct psp_dev *psd, bool unpublished)
+{
+	struct psp_assoc *pas, *next;
+
+	lockdep_assert(unpublished || lockdep_is_held(&psd->lock));
+
+	psp_txq_state_free(psd->tx_del.txq_state);
+	psd->tx_del.txq_state = NULL;
+
+	list_splice_init(&psd->tx_del.active, &psd->tx_del.next);
+	list_for_each_entry_safe(pas, next, &psd->tx_del.next, assocs_list) {
+		list_del(&pas->assocs_list);
+		psp_dev_tx_key_del(psd, pas);
+		psp_dev_put(psd);
+		kfree(pas);
+	}
+}
+
+void psp_deferred_del_queue(struct psp_dev *psd, struct psp_assoc *pas)
+{
+	lockdep_assert_held(&psd->lock);
+
+	list_move_tail(&pas->assocs_list, &psd->tx_del.next);
+	schedule_delayed_work(&psd->tx_del.work, 0);
+}
diff --git a/net/psp/psp_main.c b/net/psp/psp_main.c
index ba44154cf8dc..789315dae237 100644
--- a/net/psp/psp_main.c
+++ b/net/psp/psp_main.c
@@ -3,8 +3,10 @@
 #include <linux/bitfield.h>
 #include <linux/list.h>
 #include <linux/netdevice.h>
+#include <linux/slab.h>
 #include <linux/xarray.h>
 #include <net/net_namespace.h>
+#include <net/netdev_lock.h>
 #include <net/psp.h>
 #include <net/udp.h>
 
@@ -75,7 +77,8 @@ psp_dev_create(struct net_device *netdev,
 		    !psd_ops->rx_spi_alloc ||
 		    !psd_ops->get_stats ||
 		    (!psd_ops->tx_key_add != !psd_ops->tx_key_del) ||
-		    (psd_caps->assoc_drv_spc && !psd_ops->tx_key_add)))
+		    (psd_caps->assoc_drv_spc && !psd_ops->tx_key_add) ||
+		    (psd_ops->tx_key_add && !netdev_need_ops_lock(netdev))))
 		return ERR_PTR(-EINVAL);
 
 	psd = kzalloc_obj(*psd);
@@ -94,13 +97,16 @@ psp_dev_create(struct net_device *netdev,
 	INIT_LIST_HEAD(&psd->stale_assocs);
 	refcount_set(&psd->refcnt, 1);
 
+	err = psp_deferred_del_init(psd);
+	if (err)
+		goto err_free_psd;
+
 	mutex_lock(&psp_devs_lock);
 	err = xa_alloc_cyclic(&psp_devs, &psd->id, psd, xa_limit_16b,
 			      &last_id, GFP_KERNEL);
 	if (err) {
 		mutex_unlock(&psp_devs_lock);
-		kfree(psd);
-		return ERR_PTR(err);
+		goto err_uninit_deferred_del;
 	}
 	mutex_lock(&psd->lock);
 	mutex_unlock(&psp_devs_lock);
@@ -116,6 +122,12 @@ psp_dev_create(struct net_device *netdev,
 	mutex_unlock(&psd->lock);
 
 	return psd;
+
+err_uninit_deferred_del:
+	psp_deferred_del_uninit(psd, true);
+err_free_psd:
+	kfree(psd);
+	return ERR_PTR(err);
 }
 EXPORT_SYMBOL(psp_dev_create);
 
@@ -142,6 +154,8 @@ void psp_dev_unregister(struct psp_dev *psd)
 
 	lockdep_assert_not_held(&psd->main_netdev->lock);
 
+	psp_deferred_del_stop(psd);
+
 	mutex_lock(&psp_devs_lock);
 	mutex_lock(&psd->lock);
 
@@ -154,6 +168,8 @@ void psp_dev_unregister(struct psp_dev *psd)
 	xa_store(&psp_devs, psd->id, NULL, GFP_KERNEL);
 	mutex_unlock(&psp_devs_lock);
 
+	psp_deferred_del_uninit(psd, false);
+
 	list_splice_init(&psd->active_assocs, &psd->prev_assocs);
 	list_splice_init(&psd->prev_assocs, &psd->stale_assocs);
 	list_for_each_entry_safe(pas, next, &psd->stale_assocs, assocs_list) {
diff --git a/net/psp/psp_sock.c b/net/psp/psp_sock.c
index d497f41c483e..8de313805af0 100644
--- a/net/psp/psp_sock.c
+++ b/net/psp/psp_sock.c
@@ -114,8 +114,23 @@ static void psp_assoc_free(struct work_struct *work)
 
 	mutex_lock(&psd->lock);
 	if (psp_dev_is_registered(psd)) {
-		if (psp_assoc_needs_tx_key_del(pas))
+		if (psp_assoc_needs_tx_key_del(pas)) {
+			if (pas->flags & PSP_ASSOC_DEFER_TX_KEY_DEL) {
+				psp_deferred_del_queue(psd, pas);
+
+				/* The deferred queue now owns pas's reference
+				 * on psd and may drop it as soon as psd->lock
+				 * is released. Take another reference to psd
+				 * to ensure that psd isn't freed until
+				 * mutex_unlock() returns.
+				 */
+				psp_dev_get(psd);
+				mutex_unlock(&psd->lock);
+				psp_dev_put(psd);
+				return;
+			}
 			psp_dev_tx_key_del(psd, pas);
+		}
 		list_del(&pas->assocs_list);
 	}
 	mutex_unlock(&psd->lock);
@@ -287,10 +302,6 @@ psp_sock_tx_rekey(struct sock *sk, struct psp_dev *psd, struct psp_assoc *pas,
 	struct psp_assoc *new;
 	int err;
 
-	if (psp_dev_has_sadb(psd)) {
-		NL_SET_ERR_MSG(extack, "Tx rekey not supported on this device");
-		return -EOPNOTSUPP;
-	}
 	if (!pas->peer_tx) {
 		NL_SET_ERR_MSG(extack, "Socket PSP state is not fully established");
 		return -EBUSY;
@@ -322,6 +333,7 @@ psp_sock_tx_rekey(struct sock *sk, struct psp_dev *psd, struct psp_assoc *pas,
 	list_move(&pas->assocs_list, &psd->stale_assocs);
 
 	rcu_assign_pointer(sk->psp_assoc, new);
+	pas->flags |= PSP_ASSOC_DEFER_TX_KEY_DEL;
 	psp_assoc_put(pas);
 
 	return 0;

-- 
2.52.1

