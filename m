Received: from mail-ot1-f47.google.com (mail-ot1-f47.google.com [209.85.210.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3B2503E3D8B
	for <linux-kselftest@vger.kernel.org>; Fri,  9 Oct 2026 20:47:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791578829; cv=none; b=qO34NKkh9cJzs2w7h7o3QozD0kq1ODr71CXwpRJMe0csCXI9W/LJH6Se+vixKYO+cmumMpHslfuim2Tzw2SwppKtv4D/p6u/4dJ3aFvlr7ga1h5S+JrlgrglWae90UCE79TsL+G0tgX4RZJNaDXTBJgkrxt3Lfz/18TGkZzFqOQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791578829; c=relaxed/simple;
	bh=eg9j00BGMzaM3XowWWwmk78ElbgXwqJxhVi0DcTkYZI=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=rEmHSqHjwtR6jhaxmDed8YKhC2VnX+r0eZ1KWNXCIrsmBzFAX/5N2eTOXvWa6RXCo5uiCL/cHUr1gIornhwUPWx7XR0L7WxpNLmEuoCX2BqPY9Tw7mujGEwGKGNir0458IdKu/D80jCxmzCSOFkKknwOB8PlwW6LaLKyMyqNURE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=cs8R5YWH; arc=none smtp.client-ip=209.85.210.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="cs8R5YWH"
Received: by mail-ot1-f47.google.com with SMTP id 46e09a7af769-825572e6701so129311a34.2
        for <linux-kselftest@vger.kernel.org>; Fri, 09 Oct 2026 13:47:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791578823; x=1792183623; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=NWWfuMib1chkkl+AwUigFyecMwk+S9h7AAzDYy9VHxs=;
        b=cs8R5YWH0+ebY7/f1J2bz8hVh9aHu1yjHJSL6t59EC51d8kAQydRmG13c+ek9Oqx8Z
         LZqn8U2VXBchwJssChGAVZhmS8lwOPinLp8kN3VYNC1zPwEc1qckmNcYgrVUgnbe+NZ2
         cntmCQ3KQroRpHk5O8gBGsI63Nm8PlJIIOSI755LLochGeMCDW6CRaOhnJh/+2J7mBSF
         Xg3MPqOoN7+1PA+yNsiNTjC98fjFpWBEli/C3TolpM/e9Nq11fCg/6+A1vzU1BYVrHJD
         pXDZNxfzgDmrhjYG0sGqhs3U/zGspV+cC6+4UtbGnU6Z+fJ5turThyxN7zGHljlkhD8Z
         QI+g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791578823; x=1792183623;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=NWWfuMib1chkkl+AwUigFyecMwk+S9h7AAzDYy9VHxs=;
        b=MMYTq/RNOSkFgG59JzAFS1Lz+TgYa9bn9mH81wd6jgAaKw/1WPl7v1RAN1+s1rywWV
         AEG/hSHqqt2U6oC3y1PDftHSXUmc8Q2DUEEuyLflNiqw74eeWDQwsXbAVAJ27XwpHfsT
         rKZ7s6xCusbhv0ybkmslM+SVZ2uC97oFIrEn4iWBalG0TvaGIRkfJf2XZ8BQ3Xn1yykH
         T+RGN+jAmSALnM+UdhwCokyT2dw50MTVxTRno+7d1bDnGJswNB9FES9azYsawV2JXiUm
         z3oqWTBwmGJueW0X0K1mv4Nh4jJWq+pEZ2b/QG4f9gB+f1XWnXwE3E33ifC112BHRSJ/
         2gsw==
X-Forwarded-Encrypted: i=1; AKwUvBw/Kjz0Uj5B0fj3ShiiF/Ggg6mi8zWTUTC0F31rARbRVtr9N29RtDgX0iD5jZw+jBtLcLdHqqIemuTe+6/J+vk=@vger.kernel.org
X-Gm-Message-State: AFuF++nJbRGF+kcMEd2mmUJcE9lhczNLIeqZH0dfL7Js2laJVfdFqenv
	ihJTlAcfX6qNaxyFoi2qeinBZYaunyBDBoypPvZ/JWeCBjmvLdIO/JtQ
X-Gm-Gg: AYBFou3CNvhSFqaQ500gGeOiq6tBYsJVBHVsKGhGit3pgZUp6voyQZmXhQqw1Zsyy9g
	eKwOOJgCJkkaxg6iODy3QNIYL2XHaxLZ/7VIOjglYJhzUfCSmH9FTqsKJbA3hX6oKqFPx6cH8Qi
	LtrJ2kEV07OeAHC222KVBp4cNFsWRO4aMOwLxnvyEt66cu4yGcjMWwLL5axZlk/H3phuHCvyYDy
	ezYjwsnSs8cdzFHVTe+cPHiXekM5Dfr/DTJuyI9l43RvI0nduO/Pi7FdQ5VhSIengw28bee553P
	x85fLfa+eg9QSLM5xKJPyuBWVVxSca4NDT0yIDv8qCe5gub1UDkEVb+zf04KzpYrQacdn2Vi8m7
	26Q7sPNGf/ERCvFoAt8shdMxRYbAC8mQz9XdOXvQfHJq+aT2jvmmXidnQMdtkrKgSwqQ1kGB6Pb
	yTKQl5T4ZgZRQwpFnYR45tavXRX1OYponevFVfWg8uRo204LK2NDO5uuGhXJuamaZFD/shXqJ87
	eFB404=
X-Received: by 2002:a05:6830:82e3:b0:826:1ccc:8bb9 with SMTP id 46e09a7af769-830946a18a8mr2446538a34.6.1791578823079;
        Fri, 09 Oct 2026 13:47:03 -0700 (PDT)
Received: from localhost ([2a03:2880:30ff:75::])
        by smtp.gmail.com with ESMTPSA id 46e09a7af769-8303a328ee6sm2924004a34.23.2026.10.09.13.47.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 09 Oct 2026 13:47:02 -0700 (PDT)
From: Daniel Zahka <daniel.zahka@gmail.com>
Date: Fri, 09 Oct 2026 13:46:43 -0700
Subject: [PATCH net-next v2 3/7] psp: defer tx key deletions for SADB
 drivers
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261009-psp-v2-3-5596ab50f677@gmail.com>
References: <20261009-psp-v2-0-5596ab50f677@gmail.com>
In-Reply-To: <20261009-psp-v2-0-5596ab50f677@gmail.com>
To: Jakub Kicinski <kuba@kernel.org>, 
 Willem de Bruijn <willemdebruijn.kernel@gmail.com>, 
 "David S. Miller" <davem@davemloft.net>, Eric Dumazet <edumazet@kernel.org>, 
 Paolo Abeni <pabeni@redhat.com>, Simon Horman <horms@kernel.org>, 
 Jonathan Corbet <corbet@lwn.net>, Shuah Khan <skhan@linuxfoundation.org>, 
 Randy Dunlap <rdunlap@infradead.org>, 
 Donald Hunter <donald.hunter@gmail.com>, 
 Andrew Lunn <andrew+netdev@lunn.ch>, Shuah Khan <shuah@kernel.org>
Cc: netdev@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-doc@vger.kernel.org, linux-kselftest@vger.kernel.org
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
core records the BQL queued count for active TX queue and starts a
descriptor grace period. It then polls the queued and completed byte
counts until all data outstanding at the start of the grace period has
completed. After that point, any keys queued for deletion before the
start of the grace period can be deleted from the SADB.

Make CONFIG_INET_PSP depend on CONFIG_BQL.

Drivers which install Tx keys must meet the requirements in
Documentation/networking/psp.rst.

Regarding lock ordering: the order of taking psp_dev::lock before
net_device::lock was established in commit 1e6e0cec0dab ("net/mlx5e:
psp: Make PSP steering config dynamic")

Signed-off-by: Daniel Zahka <daniel.zahka@gmail.com>
---
v2:
- move grace period mechanism to use bql instead of driver callback.
- allow tx rekey on SADB devices
---
 Documentation/networking/psp.rst |  38 +++++++
 include/net/psp/types.h          |  18 +++
 net/psp/Kconfig                  |   1 +
 net/psp/Makefile                 |   2 +-
 net/psp/psp.h                    |   5 +
 net/psp/psp_deferred_del.c       | 231 +++++++++++++++++++++++++++++++++++++++
 net/psp/psp_main.c               |  22 +++-
 net/psp/psp_sock.c               |  13 ++-
 8 files changed, 321 insertions(+), 9 deletions(-)

diff --git a/Documentation/networking/psp.rst b/Documentation/networking/psp.rst
index 5c4e4215d906..769c7b21045c 100644
--- a/Documentation/networking/psp.rst
+++ b/Documentation/networking/psp.rst
@@ -202,6 +202,44 @@ Drivers must use ``psp_skb_get_assoc_rcu()`` to check if PSP Tx offload
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
+
 Kernel implementation notes
 ---------------------------
 
diff --git a/include/net/psp/types.h b/include/net/psp/types.h
index 52c78cc72f1f..8ffc566cec2a 100644
--- a/include/net/psp/types.h
+++ b/include/net/psp/types.h
@@ -6,6 +6,7 @@
 #include <linux/bits.h>
 #include <linux/mutex.h>
 #include <linux/refcount.h>
+#include <linux/workqueue.h>
 #include <net/net_trackers.h>
 
 struct netlink_ext_ack;
@@ -80,6 +81,11 @@ struct psp_assoc_dev {
  * @prev_assocs:	associations which use old (but still usable)
  *			device key
  * @stale_assocs:	associations which use a rotated out key
+ * @tx_del:		deferred TX key deletion state
+ * @tx_del.active:	TX keys to be deleted after the current grace period
+ * @tx_del.next:	TX keys queued for deletion during current grace period
+ * @tx_del.work:	delayed work item for periodic grace period checking
+ * @tx_del.txq_state:	TX queue state for deferred deletion grace periods
  *
  * @stats:	statistics maintained by the core
  * @stats.rotations:	See stats attr key-rotations
@@ -109,6 +115,13 @@ struct psp_dev {
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
@@ -157,9 +170,14 @@ struct psp_key_parsed {
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
index 273b010d2355..e118b8019e7e 100644
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
 
@@ -70,7 +72,8 @@ psp_dev_create(struct net_device *netdev,
 		    !psd_ops->rx_spi_alloc ||
 		    !psd_ops->get_stats ||
 		    (!psd_ops->tx_key_add != !psd_ops->tx_key_del) ||
-		    (psd_caps->assoc_drv_spc && !psd_ops->tx_key_add)))
+		    (psd_caps->assoc_drv_spc && !psd_ops->tx_key_add) ||
+		    (psd_ops->tx_key_add && !netdev_need_ops_lock(netdev))))
 		return ERR_PTR(-EINVAL);
 
 	psd = kzalloc_obj(*psd);
@@ -89,13 +92,16 @@ psp_dev_create(struct net_device *netdev,
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
@@ -111,6 +117,12 @@ psp_dev_create(struct net_device *netdev,
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
 
@@ -133,6 +145,8 @@ void psp_dev_unregister(struct psp_dev *psd)
 	struct psp_assoc_dev *entry, *entry_tmp;
 	struct psp_assoc *pas, *next;
 
+	psp_deferred_del_stop(psd);
+
 	mutex_lock(&psp_devs_lock);
 	mutex_lock(&psd->lock);
 
@@ -145,6 +159,8 @@ void psp_dev_unregister(struct psp_dev *psd)
 	xa_store(&psp_devs, psd->id, NULL, GFP_KERNEL);
 	mutex_unlock(&psp_devs_lock);
 
+	psp_deferred_del_uninit(psd, false);
+
 	list_splice_init(&psd->active_assocs, &psd->prev_assocs);
 	list_splice_init(&psd->prev_assocs, &psd->stale_assocs);
 	list_for_each_entry_safe(pas, next, &psd->stale_assocs, assocs_list) {
diff --git a/net/psp/psp_sock.c b/net/psp/psp_sock.c
index 060149f3d72a..d21f7afd830a 100644
--- a/net/psp/psp_sock.c
+++ b/net/psp/psp_sock.c
@@ -114,8 +114,14 @@ static void psp_assoc_free(struct work_struct *work)
 
 	mutex_lock(&psd->lock);
 	if (psp_dev_is_registered(psd)) {
-		if (psp_assoc_needs_tx_key_del(pas))
+		if (psp_assoc_needs_tx_key_del(pas)) {
+			if (pas->flags & PSP_ASSOC_DEFER_TX_KEY_DEL) {
+				psp_deferred_del_queue(psd, pas);
+				mutex_unlock(&psd->lock);
+				return;
+			}
 			psp_dev_tx_key_del(psd, pas);
+		}
 		list_del(&pas->assocs_list);
 	}
 	mutex_unlock(&psd->lock);
@@ -290,10 +296,6 @@ psp_sock_tx_rekey(struct sock *sk, struct psp_dev *psd, struct psp_assoc *pas,
 	struct psp_assoc *new;
 	int err;
 
-	if (psp_dev_has_sadb(psd)) {
-		NL_SET_ERR_MSG(extack, "Tx rekey not supported on this device");
-		return -EOPNOTSUPP;
-	}
 	if (!pas->peer_tx) {
 		NL_SET_ERR_MSG(extack, "Socket PSP state is not fully established");
 		return -EBUSY;
@@ -324,6 +326,7 @@ psp_sock_tx_rekey(struct sock *sk, struct psp_dev *psd, struct psp_assoc *pas,
 	list_add(&new->assocs_list, &pas->assocs_list);
 
 	rcu_assign_pointer(sk->psp_assoc, new);
+	pas->flags |= PSP_ASSOC_DEFER_TX_KEY_DEL;
 	psp_assoc_put(pas);
 
 	return 0;

-- 
2.52.0

