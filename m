Received: from mail-pj2-f8.google.com (mail-pj2-f8.google.com [74.125.227.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CE56A2264DB
	for <linux-kselftest@vger.kernel.org>; Wed, 14 Oct 2026 20:53:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.227.136
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792011188; cv=none; b=adx1iV2YrkspgF9gLVvjfEjZwou0tbRpRk0gfsoB3jNr1MwWvHxtpRwT2kgqtJzRzZbR78oiAXmc+jC0bgSKjN59GRCEp8/2r7bCO+axr5xJjwZk0qoJhWwkExHnZZ57sOTbPHRdQQHg8dS6EHfP5ao7QsODqCR8bRJUSHveLNk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792011188; c=relaxed/simple;
	bh=T9aKd540xf386bBa9R9PqsOWWH4LJu1iYaEtdQbv9Mw=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=KrH+KETiowXECpa07DMnxzWuVeSH6kSGrA5o2tO6dVzw4xdgm7zkvj2jJOAuKDpFIaY/qZhKqTtlbZ+vQ3NHa4fcInTtNTvoP47uBmb5Q0EN67z1GEFhYP6TdDwpRVRJAayBUcyhyFcwX1Vufe8BDJjgLvLie2HfepPX3A3gVC4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=EuxwdWxO; arc=none smtp.client-ip=74.125.227.136
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="EuxwdWxO"
Received: by mail-pj2-f8.google.com with SMTP id 98e67ed59e1d1-3ac6fe4aff0so605466a91.0
        for <linux-kselftest@vger.kernel.org>; Wed, 14 Oct 2026 13:53:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792011185; x=1792615985; darn=vger.kernel.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :content-type:mime-version:references:message-id:subject:cc:to:from
         :date:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=QCBsRGTxGdEPIxnDKYA+YkPcLpshjMeTPeYA/qIq87Q=;
        b=EuxwdWxOfiGu6gdL/zvjOvBb6uxP1R5JFKFuQuU+pfR8/nQALPdb0wcA4rDYM2cfBI
         kfsQkaOy0rFnuSPLUF8R0u3SZ9wxuw5lKjCzzOlRgBk3odRy/iREy3blUY1zWPGYLB4v
         5jbsy9etlJRxqlFE8uOtIwbASnSQYf6cuJVtt7eSdcWvmJhaTkQrPpJT3MJJvH7PAKXe
         /B75dP3R3mK+Wwt8BmmGOzpYa55FkziDea5Eqju76hWirkt1z620umkJvX8e8AYYLXa5
         se6iO+n9jeVIvP11s36QfYOBJ1SGsQeZvi0xjPx9to/Ip4toaMjZqpCpwztltkbdM28T
         btIQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792011185; x=1792615985;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :content-type:mime-version:references:message-id:subject:cc:to:from
         :date:x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=QCBsRGTxGdEPIxnDKYA+YkPcLpshjMeTPeYA/qIq87Q=;
        b=xIfncSdQ6NkR9uosfxxauhBykkC34rrsxu6StAn7vCv4qNcfOA0gInm9dXNxV1B05y
         S5mp/DOWfo11yaj/D+DFBMSP+3Yk7P7YOSm2obdY+CuB8hRwQ5jGYCcAwpaEMB8Vf/8G
         Qljmq8LcNIKVskBVCRgV3VgFmfVaz9ikEd2zTvrrwdLft3rFx9dJgzwzDgtWLfPiU6EJ
         I53wnnAduCWj/+o/2q+QKB6lLIdH31qTw+J2glE+apHih/Lgq9v7ME6P8tUBW1qBkjei
         Kq4k4MjOohZ6iVMevNxR0Sw9boxUUodouMgK9Z8Q7ip2VC4oSdil3izhJwDuilFRzt4W
         +Vqw==
X-Forwarded-Encrypted: i=1; AKwUvBzPHS39xgmb67dJiI1PKwzo/ihd6aXG5PpbAKwF86AoKfPl7dbcxICsDMswN+7cMXCf+aegfddoWiQ9m8fRLn0=@vger.kernel.org
X-Gm-Message-State: AFq9FYIH2Tg6UjFCsDLA7RwppFiYro+j84/kQpzgAp4Ib3/fQQjNoTET
	SZ0RMpm0NcBjUM0iBlfumTaXqLaBEFGSGczNqGbuRK4LyA9ex/vkoZh8
X-Gm-Gg: AYBFou0eb8QyywFSg8CjpsmASEs5NsO4P1mLd3wbdpReAYQhkDNZnk5QuXzZE3NX00V
	wBXiHwrwDy/yHB92Rp6QB5GZj4pq6f1u44lo4RpiWOi9m5kxvYlC+M0Bi4kFlAP+oJEXoejfmPT
	IMHs2QZF2LlQSrHkPIvvPQI1S1uAQ7c7E49GQGPh8Z9VRZV4xW3xiyUiPkkRMJPx498nTZ+t/Yl
	4nOMOD52Hd+UeNj+BVWjdkuPjWLmcJf8XDgKehpEG71noYCr/jo6V6XgiOvxPEJTWoeGsLks9H2
	DwvwSa/MM/Brt7m2NBzHHLO1H4rfnPYcVYnoFbxAabiZRIgnlZ48PaWO6yw2anFsqNtrETuhZY+
	rTY9h480PUMe7IRbNm9gco9xPbQBWFGIiDQNR1CkcV7JrRz4cEqIoNtB3HWvyq8PRXjn4Dp8u3+
	F3M03Aj6cLI3pFvMtqI5Mk06VimJR28aQYznV9Uin4gEQ7jOcyX+wkVK3SCzt2KrROtGDahVwBi
	4U=
X-Received: by 2002:a17:90b:5106:b0:3ac:9c37:9426 with SMTP id 98e67ed59e1d1-3ac9c379a27mr68257a91.31.1792011184936;
        Wed, 14 Oct 2026 13:53:04 -0700 (PDT)
Received: from localhost ([2a03:2880:2ff:70::])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3ac9307d287sm671587a91.1.2026.10.14.13.53.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 14 Oct 2026 13:53:03 -0700 (PDT)
Date: Wed, 14 Oct 2026 13:52:52 -0700
From: Stanislav Fomichev <sdf.kernel@gmail.com>
To: Mina Almasry <almasrymina@google.com>
Cc: Jakub Kicinski <kuba@kernel.org>, David Wei <dw@davidwei.uk>, 
	Pavel Begunkov <asml.silence@gmail.com>, Taehee Yoo <ap420073@gmail.com>, 
	Stanislav Fomichev <sdf@fomichev.me>, Paolo Abeni <pabeni@redhat.com>, 
	Kaiyuan Zhang <kaiyuanz@google.com>, Bobby Eshleman <bobbyeshleman@meta.com>, netdev@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-kselftest@vger.kernel.org, linux-media@vger.kernel.org, 
	dri-devel@lists.freedesktop.org, Andrew Lunn <andrew+netdev@lunn.ch>, 
	"David S. Miller" <davem@davemloft.net>, Eric Dumazet <edumazet@kernel.org>, 
	Simon Horman <horms@kernel.org>, Shuah Khan <shuah@kernel.org>, 
	Sumit Semwal <sumit.semwal@linaro.org>, Christian =?utf-8?B?S8O2bmln?= <christian.koenig@amd.com>, 
	Nikolay Aleksandrov <razor@blackwall.org>, Daniel Borkmann <daniel@iogearbox.net>, 
	Tariq Toukan <tariqt@nvidia.com>, Kaifeng Wang <kaifengw@google.com>
Subject: Re: [PATCH net v2 1/4] net: devmem: unmap dma_buf synchronously on
 queue uninstall
Message-ID: <as_rO4eObm460bMd@devvm7509.cco0.facebook.com>
References: <20261012174300.2338784-1-almasrymina@google.com>
 <20261012174300.2338784-2-almasrymina@google.com>
 <as-uBvRisS7HxLHJ@devvm7509.cco0.facebook.com>
 <CAHS8izM9E3YTi19LdNSKY+FWyLtesTAjEmCRHxhgiu=y3t7jaQ@mail.gmail.com>
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CAHS8izM9E3YTi19LdNSKY+FWyLtesTAjEmCRHxhgiu=y3t7jaQ@mail.gmail.com>

On 10/14, Mina Almasry wrote:
> On Wed, Oct 14, 2026 at 9:34 AM Stanislav Fomichev <sdf.kernel@gmail.com> wrote:
> >
> > On 10/12, Mina Almasry wrote:
> > > When a bound net_device is unregistered while userspace still holds a
> > > netlink or TCP socket reference on a devmem binding,
> > > mp_dmabuf_devmem_uninstall() clears binding->dev to NULL so
> > > netdev_nl_sock_priv_destroy() will not touch the unregistered
> > > net_device, but leaves the dma_buf attachment mapped until
> > > __net_devmem_dmabuf_binding_free() runs later on socket close.
> > >
> > > Because dma_buf_attach() does not take a reference on dma_dev, device
> > > removal frees dma_dev while the attachment is still mapped. Closing the
> > > netlink socket afterwards triggers a slab use-after-free in
> > > dma_unmap_sg_attrs():
> > >
> > >   BUG: KASAN: slab-use-after-free in dma_unmap_sg_attrs+0x76/0x2b0
> > >   Read of size 8 at addr ffff88810fae64b0 by task kworker/3:1/53
> > >   Workqueue: events __net_devmem_dmabuf_binding_free
> > >   Call Trace:
> > >    dma_unmap_sg_attrs+0x76/0x2b0
> > >    unmap_udmabuf+0x8e/0x100
> > >    dma_buf_unmap_attachment+0x145/0x330
> > >    dma_buf_unmap_attachment_unlocked+0x96/0x130
> > >    __net_devmem_dmabuf_binding_free+0x156/0x2e0
> > >   Freed by task 9:
> > >    kfree+0x1b8/0x550
> > >    nsim_bus_dev_release+0xe/0x60
> > >    device_release+0xcf/0x250
> > >
> > > Add net_devmem_dmabuf_binding_unmap() serialized under binding->lock
> > > and null out binding->sgt and binding->attachment after unmapping so
> > > unmapping is idempotent across queue uninstall and deferred binding
> > > destruction. Call it synchronously when the last bound RX queue is
> > > uninstalled in mp_dmabuf_devmem_uninstall(), except when a leased
> > > queue is unleased: the physical device is still registered and, if
> > > restarting its queue failed, may still be using the binding.
> > >
> > > The same use-after-free happens when the netlink socket is closed
> > > before the device is removed but RX tokens or the pending release work
> > > keep the binding alive. Such bindings are no longer installed on any
> > > queue and were already erased from net_devmem_dmabuf_bindings. Keep
> > > bindings in net_devmem_dmabuf_bindings until they are freed, hide
> > > unbound ones from TX lookups with an xarray mark, and on
> > > NETDEV_UNREGISTER clear binding->dev of unbound RX bindings for the
> > > device and unmap them, unless the device is a virtual device leasing
> >
> > [..]
> >
> > > queues, for the same reason as above. net_devmem_lock serializes that
> > > walk with the final free.
> >
> > Can you explain net_devmem_lock a bit more? In
> > net_devmem_dev_unregister, why can you not net_devmem_lookup_dmabuf and
> > then rely on the binding->lock? The rest looks good, but the
> > new lock seems a bit excessive?
> 
> That problem that my feeble human brain can barely understand is that,
> in order to revoke bindings when devices go away, we need to hold the
> device somewhere. I decided the a good design would be to keep them in
> the xarray but mark them as unalive; that seems nice.
> 
> Now xa_erase the binding got moved from unbind time to free time,
> which makes sense, but that generates this pathological race, where
> net_devmem_lookup_dmabuf for unregister can actually find a binding
> for which the last ref has been dropped, but _binding_free() was not
> called yet. Fun. I tried to work with the LLM to find another simpler
> approach that gets around that but no luck, the overlords find a race
> with every suggestion; this seems like the simplest thing to do,
> although it is depressing to add yet another lock.
> 
> I uploaded v3 btw to address the 1 non-lease devices issue. Seems
> we've crossed paths again, let me know what you think and I can spin
> V4.

Let's chat a bit more about this :-) Since it's not a super pressing
issue (yanking device out at runtime), would be nice to understand if we
have exhausted other options..

I'm thinking: can we move, for DMA_FROM_DEVICE (rx) bindings, the unmap
back to net_devmem_unbind_dmabuf? IIRC __net_devmem_dmabuf_binding_free is a
scheduled work because tx can drop the last ref from atomic context, but
for rx, once the queues are down, there is nothing to land into those
mappings.. (there is queue restart failure, but we can make
netif_mp_close_rxq return an error and keep it mapped in this case)

Then we are left only with lingering TX bindings you'll have to care
about in net_devmem_dev_unregister.. For those, the race with
__net_devmem_dmabuf_binding_free can hopefully be sorted out by grabbing
binding->lock and doing the same netdev_hold + netdev_lock bs we do in
netdev_nl_sock_priv_destroy before unmapping and erasing. If we make
__net_devmem_dmabuf_binding_free grab netdev lock then it's gonna
synchronize properly with net_devmem_dev_unregister without any extra locks?

Seems like it should do it? NET_DEVMEM_BINDING_LIVE stays, net_devmem_lock
goes away because unmap for rx happens in unbind and
net_devmem_dev_unregister_tx is mostly the same, just under xa_lock and
unmapping right away (the device is already closed at that point) instead
of doing a second pass.

(tangential: might be also worth it targeting net-next since Linus was not
supper happy with the amount of non-critical fixes going via net; maintainers
please chime in)

The below is what I get if I feed the above in an LLM. Mostly your
version with simplified RX and no new locks. Have not run it through
a proper review, but seems less hairy? Will going in this direction make
it easier to reason about for you as well? (what I do like here is
the consistent locking, even if it's that strange dance of lock/hold/lock)

diff --git a/include/net/page_pool/memory_provider.h b/include/net/page_pool/memory_provider.h
index 255ce4cfd975..a999a9b28bc7 100644
--- a/include/net/page_pool/memory_provider.h
+++ b/include/net/page_pool/memory_provider.h
@@ -26,8 +26,8 @@ void net_mp_niov_clear_page_pool(struct net_iov *niov);
 int netif_mp_open_rxq(struct net_device *dev, unsigned int rxq_idx,
 		      const struct pp_memory_provider_params *p,
 		      struct netlink_ext_ack *extack);
-void netif_mp_close_rxq(struct net_device *dev, unsigned int rxq_idx,
-			const struct pp_memory_provider_params *old_p);
+int netif_mp_close_rxq(struct net_device *dev, unsigned int rxq_idx,
+		       const struct pp_memory_provider_params *old_p);
 
 /**
   * net_mp_netmem_place_in_cache() - give a netmem to a page pool
diff --git a/net/core/devmem.c b/net/core/devmem.c
index 71c83730d73d..0c6e308a837d 100644
--- a/net/core/devmem.c
+++ b/net/core/devmem.c
@@ -11,6 +11,7 @@
 #include <linux/mm.h>
 #include <linux/netdevice.h>
 #include <linux/types.h>
+#include <net/netdev_lock.h>
 #include <net/netdev_queues.h>
 #include <net/netdev_rx_queue.h>
 #include <net/page_pool/helpers.h>
@@ -23,7 +24,13 @@
 
 /* Device memory support */
 
+/* Bindings stay in net_devmem_dmabuf_bindings until they are freed, so
+ * net_devmem_dev_unregister() can find TX bindings that are kept alive by
+ * skbs after their netlink socket is gone. Only bindings with the LIVE mark
+ * are visible to TX lookups.
+ */
 static DEFINE_XARRAY_FLAGS(net_devmem_dmabuf_bindings, XA_FLAGS_ALLOC1);
+#define NET_DEVMEM_BINDING_LIVE XA_MARK_1
 
 static const struct memory_provider_ops dmabuf_devmem_ops;
 
@@ -59,19 +66,62 @@ static void net_devmem_dmabuf_binding_release(struct percpu_ref *ref)
 	schedule_work(&binding->unbind_w);
 }
 
+static void
+net_devmem_dmabuf_binding_unmap(struct net_devmem_dmabuf_binding *binding)
+{
+	lockdep_assert_held(&binding->lock);
+
+	if (!binding->sgt)
+		return;
+
+	dma_buf_unmap_attachment_unlocked(binding->attachment, binding->sgt,
+					  binding->direction);
+	dma_buf_detach(binding->dmabuf, binding->attachment);
+	binding->sgt = NULL;
+	binding->attachment = NULL;
+}
+
+/* Runs from a work because the last reference can be dropped from atomic
+ * context (TX skbs, or the percpu_ref RCU callback after percpu_ref_kill()),
+ * and unmapping the dma-buf may sleep.
+ */
 void __net_devmem_dmabuf_binding_free(struct work_struct *wq)
 {
 	struct net_devmem_dmabuf_binding *binding = container_of(wq, typeof(*binding), unbind_w);
+	netdevice_tracker dev_tracker;
+	struct net_device *dev;
 
 	if (binding->freelist)
 		WARN(binding->free_count != binding->area.num_niovs,
 		     "destroying dmabuf binding with outstanding net_iovs: total=%zu, free=%u",
 		     binding->area.num_niovs, binding->free_count);
 
+	/* Only TX bindings still have a device here; RX bindings are detached
+	 * in unbind or uninstall. Same dance as netdev_nl_sock_priv_destroy():
+	 * net_devmem_dev_unregister() works on bindings of the dying device
+	 * under its instance lock without holding a reference, so take that
+	 * lock before unmapping and erasing the binding. dev stays valid until
+	 * we hold it because net_devmem_dev_unregister() clears binding->dev
+	 * under binding->lock before the device can go away.
+	 */
+	mutex_lock(&binding->lock);
+	dev = binding->dev;
+	if (dev)
+		netdev_hold(dev, &dev_tracker, GFP_KERNEL);
+	mutex_unlock(&binding->lock);
+
+	if (dev)
+		netdev_lock(dev);
+	mutex_lock(&binding->lock);
+	net_devmem_dmabuf_binding_unmap(binding);
+	mutex_unlock(&binding->lock);
+	xa_erase(&net_devmem_dmabuf_bindings, binding->id);
+	if (dev) {
+		netdev_unlock(dev);
+		netdev_put(dev, &dev_tracker);
+	}
+
 	kvfree(binding->area.niovs);
-	dma_buf_unmap_attachment_unlocked(binding->attachment, binding->sgt,
-					  binding->direction);
-	dma_buf_detach(binding->dmabuf, binding->attachment);
 	dma_buf_put(binding->dmabuf);
 	xa_destroy(&binding->bound_rxqs);
 	percpu_ref_exit(&binding->ref);
@@ -116,11 +166,13 @@ void net_devmem_unbind_dmabuf(struct net_devmem_dmabuf_binding *binding)
 	struct netdev_rx_queue *rxq;
 	unsigned long xa_idx;
 	unsigned int rxq_idx;
+	bool busy = false;
 
-	xa_erase(&net_devmem_dmabuf_bindings, binding->id);
+	xa_clear_mark(&net_devmem_dmabuf_bindings, binding->id,
+		      NET_DEVMEM_BINDING_LIVE);
 
 	/* Ensure no tx net_devmem_lookup_dmabuf() are in flight after the
-	 * erase.
+	 * mark is cleared.
 	 */
 	synchronize_net();
 
@@ -135,12 +187,86 @@ void net_devmem_unbind_dmabuf(struct net_devmem_dmabuf_binding *binding)
 
 		rxq_idx = get_netdev_rx_queue_index(rxq);
 
-		netif_mp_close_rxq(binding->dev, rxq_idx, &mp_params);
+		if (netif_mp_close_rxq(binding->dev, rxq_idx, &mp_params))
+			busy = true;
+	}
+
+	/* Once its queues are closed, nothing DMAs into an RX binding anymore.
+	 * Outstanding tokens and skbs only need the niovs, not the mapping,
+	 * so unmap now while the device is known to be alive. RX bindings thus
+	 * never outlive their netlink owner while mapped, and
+	 * net_devmem_dev_unregister() can ignore them. If a queue failed to
+	 * restart, it may still be using the binding, keep it mapped.
+	 */
+	if (binding->direction == DMA_FROM_DEVICE) {
+		mutex_lock(&binding->lock);
+		if (!busy)
+			net_devmem_dmabuf_binding_unmap(binding);
+		WRITE_ONCE(binding->dev, NULL);
+		mutex_unlock(&binding->lock);
 	}
 
 	percpu_ref_kill(&binding->ref);
 }
 
+/* Called on NETDEV_UNREGISTER under the instance lock of @dev. Detach and
+ * unmap TX bindings of @dev, including ones whose netlink socket is gone but
+ * which are still kept alive by skbs. RX bindings are handled by
+ * mp_dmabuf_devmem_uninstall() and net_devmem_unbind_dmabuf().
+ */
+void net_devmem_dev_unregister(struct net_device *dev)
+{
+	XA_STATE(xas, &net_devmem_dmabuf_bindings, 0);
+	struct net_devmem_dmabuf_binding *binding;
+
+	netdev_assert_locked(dev);
+
+	/* Also sent when the device only moves to another netns. */
+	if (dev->reg_state != NETREG_UNREGISTERING)
+		return;
+
+	/* Bindings of other devices may be freed concurrently, their free
+	 * erases them under xa_lock before kfree(), so look at them only under
+	 * xa_lock.
+	 */
+	xas_lock(&xas);
+	xas_for_each(&xas, binding, ULONG_MAX) {
+		if (binding->direction != DMA_TO_DEVICE)
+			continue;
+
+		/* vdev is only compared against, never dereferenced. */
+		if (READ_ONCE(binding->vdev) == dev)
+			WRITE_ONCE(binding->vdev, NULL);
+
+		if (READ_ONCE(binding->dev) != dev)
+			continue;
+
+		xas_clear_mark(&xas, NET_DEVMEM_BINDING_LIVE);
+		xas_pause(&xas);
+		xas_unlock(&xas);
+
+		/* binding->dev == dev, so the free work blocks in
+		 * netdev_lock(dev) and can't free the binding under us, even
+		 * if its last reference is already gone.
+		 *
+		 * Clear dev and unmap in one critical section: once dev is NULL
+		 * the free work no longer takes our lock. No need to wait for
+		 * readers in between: dev is already closed, so nothing can hand
+		 * these DMA addresses to the hardware, and concurrent
+		 * net_devmem_get_binding() / validate_xmit_unreadable_skb()
+		 * only compare against binding->dev.
+		 */
+		mutex_lock(&binding->lock);
+		WRITE_ONCE(binding->dev, NULL);
+		WRITE_ONCE(binding->vdev, NULL);
+		net_devmem_dmabuf_binding_unmap(binding);
+		mutex_unlock(&binding->lock);
+
+		xas_lock(&xas);
+	}
+	xas_unlock(&xas);
+}
+
 int net_devmem_bind_dmabuf_to_queue(struct net_device *dev, u32 rxq_idx,
 				    struct net_devmem_dmabuf_binding *binding,
 				    struct netlink_ext_ack *extack)
@@ -319,6 +445,8 @@ net_devmem_bind_dmabuf(struct net_device *dev, void *vdev,
 			      GFP_KERNEL);
 	if (err < 0)
 		goto err_free_niovs;
+	xa_set_mark(&net_devmem_dmabuf_bindings, binding->id,
+		    NET_DEVMEM_BINDING_LIVE);
 
 	list_add(&binding->list, &priv->bindings);
 
@@ -346,9 +474,15 @@ net_devmem_bind_dmabuf(struct net_device *dev, void *vdev,
 struct net_devmem_dmabuf_binding *net_devmem_lookup_dmabuf(u32 id)
 {
 	struct net_devmem_dmabuf_binding *binding;
+	unsigned long xa_idx = id;
 
+	/* LIVE is cleared before the netlink reference is dropped, followed
+	 * by synchronize_net(), so a binding found here can't be freed before
+	 * we get a reference.
+	 */
 	rcu_read_lock();
-	binding = xa_load(&net_devmem_dmabuf_bindings, id);
+	binding = xa_find(&net_devmem_dmabuf_bindings, &xa_idx, id,
+			  NET_DEVMEM_BINDING_LIVE);
 	if (binding) {
 		if (!net_devmem_dmabuf_binding_get(binding))
 			binding = NULL;
@@ -520,16 +654,22 @@ static void mp_dmabuf_devmem_uninstall(void *mp_priv,
 	unsigned long xa_idx;
 
 	xa_for_each(&binding->bound_rxqs, xa_idx, bound_rxq) {
-		if (bound_rxq == rxq) {
-			xa_erase(&binding->bound_rxqs, xa_idx);
-			if (xa_empty(&binding->bound_rxqs)) {
-				mutex_lock(&binding->lock);
-				ASSERT_EXCLUSIVE_WRITER(binding->dev);
-				WRITE_ONCE(binding->dev, NULL);
-				mutex_unlock(&binding->lock);
-			}
-			break;
+		if (bound_rxq != rxq)
+			continue;
+
+		xa_erase(&binding->bound_rxqs, xa_idx);
+		if (xa_empty(&binding->bound_rxqs)) {
+			mutex_lock(&binding->lock);
+			ASSERT_EXCLUSIVE_WRITER(binding->dev);
+			WRITE_ONCE(binding->dev, NULL);
+			/* On unlease the physical queue may still be using
+			 * the binding if it failed to restart.
+			 */
+			if (!rxq->lease)
+				net_devmem_dmabuf_binding_unmap(binding);
+			mutex_unlock(&binding->lock);
 		}
+		break;
 	}
 }
 
diff --git a/net/core/devmem.h b/net/core/devmem.h
index 28d6fa7bcb57..5c3564d29b03 100644
--- a/net/core/devmem.h
+++ b/net/core/devmem.h
@@ -27,7 +27,7 @@ struct net_devmem_dmabuf_binding {
 	 * dereferenced.
 	 */
 	void *vdev;
-	/* Protect dev */
+	/* Protect dev, attachment and sgt */
 	struct mutex lock;
 
 	/* The user holds a ref (via the netlink API) for as long as they want
@@ -38,7 +38,9 @@ struct net_devmem_dmabuf_binding {
 	 *
 	 * The binding undos itself and unmaps the underlying dmabuf once all
 	 * those refs are dropped and the binding is no longer desired or in
-	 * use.
+	 * use. RX bindings are unmapped earlier, once they are no longer
+	 * installed on any queue. TX bindings are unmapped earlier if their
+	 * device is unregistered.
 	 *
 	 * net_devmem_get_net_iov() on dmabuf net_iovs will increment this
 	 * reference, making sure that the binding remains alive until all the
@@ -91,6 +93,7 @@ net_devmem_bind_dmabuf(struct net_device *dev, void *vdev,
 		       struct netlink_ext_ack *extack);
 struct net_devmem_dmabuf_binding *net_devmem_lookup_dmabuf(u32 id);
 void net_devmem_unbind_dmabuf(struct net_devmem_dmabuf_binding *binding);
+void net_devmem_dev_unregister(struct net_device *dev);
 int net_devmem_bind_dmabuf_to_queue(struct net_device *dev, u32 rxq_idx,
 				    struct net_devmem_dmabuf_binding *binding,
 				    struct netlink_ext_ack *extack);
@@ -178,6 +181,10 @@ net_devmem_unbind_dmabuf(struct net_devmem_dmabuf_binding *binding)
 {
 }
 
+static inline void net_devmem_dev_unregister(struct net_device *dev)
+{
+}
+
 static inline int
 net_devmem_bind_dmabuf_to_queue(struct net_device *dev, u32 rxq_idx,
 				struct net_devmem_dmabuf_binding *binding,
diff --git a/net/core/netdev-genl.c b/net/core/netdev-genl.c
index 690c27f63d26..993c368ecde8 100644
--- a/net/core/netdev-genl.c
+++ b/net/core/netdev-genl.c
@@ -1500,6 +1500,7 @@ static int netdev_genl_netdevice_event(struct notifier_block *nb,
 		break;
 	case NETDEV_UNREGISTER:
 		netdev_lock(netdev);
+		net_devmem_dev_unregister(netdev);
 		netdev_genl_dev_notify(netdev, NETDEV_CMD_DEV_DEL_NTF);
 		netdev_unlock(netdev);
 		break;
diff --git a/net/core/netdev_rx_queue.c b/net/core/netdev_rx_queue.c
index 00a7011eb4d5..c66347a2f82a 100644
--- a/net/core/netdev_rx_queue.c
+++ b/net/core/netdev_rx_queue.c
@@ -275,8 +275,11 @@ int netif_mp_open_rxq(struct net_device *dev, unsigned int rxq_idx,
 	return ret;
 }
 
-static void __netif_mp_close_rxq(struct net_device *dev, unsigned int rxq_idx,
-				 const struct pp_memory_provider_params *old_p)
+/* Returns 0 once the queue no longer uses @old_p, or an error if the old
+ * queue may still be running with it.
+ */
+static int __netif_mp_close_rxq(struct net_device *dev, unsigned int rxq_idx,
+				const struct pp_memory_provider_params *old_p)
 {
 	struct netdev_queue_config qcfg[2];
 	struct netdev_rx_queue *rxq;
@@ -289,35 +292,41 @@ static void __netif_mp_close_rxq(struct net_device *dev, unsigned int rxq_idx,
 	 */
 	if (dev->reg_state > NETREG_REGISTERED &&
 	    !rxq->mp_params.mp_ops)
-		return;
+		return 0;
 
 	if (WARN_ON_ONCE(rxq->mp_params.mp_ops != old_p->mp_ops ||
 			 rxq->mp_params.mp_priv != old_p->mp_priv))
-		return;
+		return -EINVAL;
 
 	netdev_queue_config(dev, rxq_idx, &qcfg[0]);
 	memset(&rxq->mp_params, 0, sizeof(rxq->mp_params));
 	netdev_queue_config(dev, rxq_idx, &qcfg[1]);
 
 	err = netdev_rx_queue_reconfig(dev, rxq_idx, &qcfg[0], &qcfg[1]);
-	WARN_ON(err && err != -ENETDOWN);
+	if (err == -ENETDOWN)
+		return 0;
+	WARN_ON(err);
+	return err;
 }
 
-void netif_mp_close_rxq(struct net_device *dev, unsigned int rxq_idx,
-			const struct pp_memory_provider_params *old_p)
+int netif_mp_close_rxq(struct net_device *dev, unsigned int rxq_idx,
+		       const struct pp_memory_provider_params *old_p)
 {
+	int ret;
+
 	if (WARN_ON_ONCE(rxq_idx >= dev->real_num_rx_queues))
-		return;
+		return -EINVAL;
 	if (!netif_rxq_is_leased(dev, rxq_idx))
 		return __netif_mp_close_rxq(dev, rxq_idx, old_p);
 
 	if (!__netif_get_rx_queue_lease(&dev, &rxq_idx, NETIF_VIRT_TO_PHYS)) {
 		WARN_ON_ONCE(1);
-		return;
+		return -EINVAL;
 	}
 	netdev_lock(dev);
-	__netif_mp_close_rxq(dev, rxq_idx, old_p);
+	ret = __netif_mp_close_rxq(dev, rxq_idx, old_p);
 	netdev_unlock(dev);
+	return ret;
 }
 
 void __netif_mp_uninstall_rxq(struct netdev_rx_queue *rxq,
