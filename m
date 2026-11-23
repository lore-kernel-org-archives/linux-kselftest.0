Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795409964;
	b=Ve1pHfGAECFARTfP55+Ht92n8oWwm69zqjlIinBEGqPB1XGJzrz9lpQ10TbvOBL9/4gx
	 q6vQFCKIYRSy+FZsgXFlSO1Oys4Hg7jTVSaDGyU2cMQdosfPTmejbu08OWcFFlObdeed2
	 Ic/Y54LHvT0xzXMChNaBjMVT1RlUJvpJhB6Kt8AmkxIWDa6g5pLdtMI9yC7s939sHg+I+
	 uqWlXjhtYIhG3JVim11NEOP9WFCswtXuIaHKjBmE7xqXuj5RQckjWA37S70OymrYUZvwX
	 tAsh61JBwb93u341oO59vbCqyLc6lER1hVJLOKTH6n64Gp75j+MKUvGuHQn9llAEucw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795409964;
	h=Received:DKIM-Signature:Subject:From:To:Cc:Date:Message-ID:
	 In-Reply-To:References:X-sashiko-severity:Content-Type:
	 Content-Transfer-Encoding:MIME-Version;
	bh=KeB2HYL85s/Mu7yCSeBrdMNizv+fbYqDFnOtgJjrFg0=;
	b=5cBUVdpuwm/1jm8lgQRqD8RHN6qhnrZ6z87W4YNqVGeRdsTE6yV3xNpHH3qcdpmq7XUA
	 kTjQwz3EHHJtW3j7jdBXGi51bkZQ0x9tJTtaa7S0hbkpxgQ6QCLHv/gnPOc4yjg31N0sH
	 msGvk/1XNr7ztfdJWYHQA6bkXvPDoZm7jKXnIJR7IK1IJ/5XwdP6ZB8xfpr1xyOgV88h8
	 PkOiBxhn46F/lO2TqBKVJCgPU33JdataKoTtdydHCknma6CWwJHu3+jikGDjjqQ0oWsjT
	 dNYHkrdW2nH9L/lebA52L6qRnwpWlpgcicBXQ1Zt0m65+XCF0WDcDjn+aidhtC94KXg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=keLiDn7f;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B5265606A31A;
	Mon, 23 Nov 2026 04:59:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=keLiDn7f
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 644321F000CF;
	Mon, 23 Nov 2026 04:59:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795409964;
	bh=KeB2HYL85s/Mu7yCSeBrdMNizv+fbYqDFnOtgJjrFg0=;
	h=Subject:From:To:Cc:Date:In-Reply-To:References;
	b=keLiDn7f0BCwH6BK0OwuPO4BTcdZESYCANM3/8si6lYOmemEhY3o11NljGgYNDfA8
	 v4ACW5fgLV1zmcZYWKic1zkrMoomPfNFY6vB1zFYy7Q6Xoj0ro3IuxD3vLoOE4J6YE
	 gEx/0mz2XE/ndlHmUZ4XssW/TSCAtnDdkWT2UJYmFIQe7QtMfYVQ0d3y5ne1mV37kD
	 NlBkPyerXfNZ1LG4Aedn7sN3/R8bim4qiuWEQ9Q/j+8GNGRpr1+txOEUH6S4jwVYNG
	 ata6yzlnqqhB6wd2yJSSLddab4Z7n7awYUwsh50cZvzzZREX4OkwruigmwQYbIlgot
	 J3AtIR7tPN+fg==
Subject: Re: [PATCH net-next v4 3/7] net: guard memory provider RX queue open
 and close on unregister
From: netdev-bot+sashiko@kernel.org
To: almasrymina@google.com
Cc: netdev@vger.kernel.org, davem@davemloft.net, edumazet@kernel.org,
 kuba@kernel.org, pabeni@redhat.com, horms@kernel.org, shuah@kernel.org,
 linux-kselftest@vger.kernel.org, bestswngs@gmail.com, daniel@iogearbox.net,
 razor@blackwall.org, dw@davidwei.uk, sdf.kernel@gmail.com,
 bobbyeshleman@meta.com, dtatulea@nvidia.com
Date: Mon, 23 Nov 2026 04:59:22 +0000
Message-ID: <179540996293.3135.6100605132431454773@kernel.org>
In-Reply-To: <20261120045918.1239746-4-almasrymina@google.com>
References: <20261120045918.1239746-4-almasrymina@google.com>
X-sashiko-severity: Low
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Post: <mailto:linux-kselftest@vger.kernel.org>
List-Help: <mailto:linux-kselftest+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kselftest+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0

Thank you for your contribution! Sashiko AI review found more severe
issue(s) in other patches of this series. This mail is only an FYI, in case
you want to address the nit picks below when you respin.

Low priority / nit picks for your consideration:

- [Low] The commit message has no Fixes: tag, even though the patch
  changes behaviour in existing lease-redirect code.

--

net: guard memory provider RX queue open and close on unregister

This patch adds a netif_lease_valid() helper that checks netif_is_alive()
under netdev_lock(). netif_mp_open_rxq() now uses it to reject opening a
memory provider on a leased physical device that is unregistering.
netif_mp_close_rxq() and netif_rxq_cleanup_unlease() now use it to clear
mp_params instead of reconfiguring a dying physical queue.

> These issues were discovered during AI code review (Sashiko) of the
> earlier non-leased devmem unregister series and confirmed by code
> inspection (not observed in production or reproduced on real hardware).
> Tested with the nl_netdev.py selftest on netdevsim added in this series.
>
> Suggested-by: Stanislav Fomichev <sdf@fomichev.me>
> Signed-off-by: Mina Almasry <almasrymina@google.com>

[Severity: Low]
Should this commit carry a Fixes: tag?

The patch changes how existing lease redirection code behaves in
net/core/netdev_rx_queue.c. Both states it closes can be reached on
current kernels.

In netif_mp_open_rxq(), a memory provider can be installed on a physical
device that is already NETREG_UNREGISTERING, when the call comes through
a leasee that is still registered.

In netif_rxq_cleanup_unlease() and netif_mp_close_rxq(),
netdev_rx_queue_reconfig() can be called on a dying physical device. For
example:

unregister_netdevice_many_notify()
  dev_memory_provider_uninstall()
  call_netdevice_notifiers(NETDEV_UNREGISTER)
    netkit_notifier()
      netkit_check_lease_unregister()
        unregister_netdevice_many()   /* on the leasee */
          ...
            netif_rxq_cleanup_unlease()
              __netif_mp_close_rxq()   /* reconfigures phys queue */

Here is where this code came from:

  5602ad61ebee ("net: Proxy netif_mp_{open,close}_rxq for leased queues")
      added the lease-redirected open/close paths and
      netif_rxq_cleanup_unlease()

  581d28606cdd ("net: remove the netif_get_rx_queue_lease_locked() helpers")
      added the direct netdev_lock(dev) on the physical device

  37314c9dbe95 ("net: Stop leased rxq before uninstalling its memory provider")
      gave netif_rxq_cleanup_unlease() its current form, with the
      mp_params snapshot

Would something like this be appropriate?

  Fixes: 5602ad61ebee ("net: Proxy netif_mp_{open,close}_rxq for leased queues")

Without a Fixes: tag, stable and backport tooling may skip this for
kernels that already ship queue leasing.

-- 
Sashiko AI review · https://netdev-ai.bots.linux.dev/sashiko/#/patchset/20261120045918.1239746-1-almasrymina%40google.com
