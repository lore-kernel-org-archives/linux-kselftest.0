Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.43
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795110981;
	b=ynHO8MvZ9irltGuW3XiH8IQet7vZSglj9Ll3fWW6lqQCytF+LNReVVDI80x8lYEunJlU
	 0u5rN/aJFqYBa8Rl5l3zQqVAE7y4YsdbbtBFddQ0mQuQ6tCl3Kpkmb8VEDi2UMlVHBcGc
	 5wfOhaDRZvYUiQP6Ub/p90mT0Qd6Y2UXLIfbyUrE739C/H8zzlIYPjgK0DjLDkooEWwfp
	 wuPhgiQ0yUJuSTdiHWVSR/+wx59WSqZNqtgvI9sI8BhTM+jZONkeDFGnVVrKhRyZ6Pm8t
	 EyjhVcKT+VhoziwezqxBsMBJwNIvJ1HlFRP/LuCwFxU4tFuXYz+38RofnrJQAEa4v6g==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795110981;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Message-ID:Date:MIME-Version:User-Agent:Subject:To:Cc:References:
	 Content-Language:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding;
	bh=1zvf1Vt6Wlu8Jafv7/Nxh5FyeaGX2OkkjqPuvdXfMmk=;
	b=v+G7+RPvXJx98YJIk9WZq6ES5OI+ZjfHBKW1S8XkltPikv+/PmmcNCDQVycz94HgTxnc
	 3bAMIt+bmmRB43r3fGWL9yo1VMYI5q5DDektZ+va+eW5BrFlnyGodcGxzZq+Cb7G1n5Os
	 ne+Hul8y3CYqCnK/TYhjZe4C26NvJONqlXnYYH+g6oGQB1pQT+Ii0bHncr057O97mJ3uj
	 bk8kjuGUe1VHwT/It0rKn+3FYKNMUGXAb5Lo0tnHVuRLvBb+7RgcXG0CJ/ZwRO8GPatRK
	 ZJ4jK8OXNuZN5WVZYDWpgITJ4F9XQEQUq85WVRHwPU2AiNf5Yh9J6y/UgrdTcaowH5w==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=Ee9AK2C+;
	arc=none smtp.remote-ip=74.125.82.43
Received: from mail-dl1-f43.google.com (mail-dl1-f43.google.com [74.125.82.43])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C3172606A325
	for <linux-kselftest@vger.kernel.org>; Thu, 19 Nov 2026 17:56:20 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org C3172606A325
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=Ee9AK2C+
Received: by mail-dl1-f43.google.com with SMTP id a92af1059eb24-1b3acec6677so3642998c88.1
        for <linux-kselftest@vger.kernel.org>; Thu, 19 Nov 2026 09:56:20 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795110980; x=1795715780; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=1zvf1Vt6Wlu8Jafv7/Nxh5FyeaGX2OkkjqPuvdXfMmk=;
        b=Ee9AK2C+S3qeJOi6maQz+7AlWazVG+ohhMcXX9mAY6d8njr+vRKJUaxKWZiijoAX6s
         N/AaSlo0a9nSNaB2IaD5fbR7YymAv+sgEfgMqgYviN4llAYi4w+DsGjv3WkCfjXVlQEB
         7Qp1Ua8EhPp8GYHByv9OTUetHNas4MbBGXPj9f5ERkuLvPfAG1DHt2t1rPKLz+ChkoDS
         rvxPNZ6QT1lKDA2O0cLI/7BNB8otlMPK1FLnBuHX3L6AhoRXwuL2JupNKbhTZ5z7Omh8
         gjpGP8fJIdD8p83ByCnvro+uOT7Udzm7f9NjOFBV4xIBA2zr55CPjhMRTQb5sEyzvW+5
         exww==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795110980; x=1795715780;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=1zvf1Vt6Wlu8Jafv7/Nxh5FyeaGX2OkkjqPuvdXfMmk=;
        b=IeykXrKwOPXmXrkcMNiNk8q03x2tFmz0ObaJ6PBC9+bN0drOl2xi935msjHcRpXFoR
         1sbL6AB3jAcz1V+H7dr7JjbqTrcY8/sS7i3OIIy708cD4Q+jcWPyT3sza22aTZnO/Uks
         5Ki6eMl/tH57bQ1k2E2qcKv1X/2QgqNiYvX3ctBkbspeRl2Ml3HHoDPTcxTL7EoFtAo0
         QeRLeZyzDdMrc1u0D0jhyJgQTeAfUESrJOHce3y92KoIk6/A9lGfZtQcE5aDdWgi0yks
         N5AjFQwnocCWbLq3GZcSGUIzrPYyu1bniB/vDwaD0mFMOccUh9hOyQp4gooLNk0o2kYK
         F8GQ==
X-Forwarded-Encrypted: i=1; AL+hErGqeYmPxjSUvsuMljcTd3QFYcfCNS/GpOchNgCapYEkqysvEA98PgICPtBJ9A9mLkeAhj9772BGGD4b9li4hbE=@vger.kernel.org
X-Gm-Message-State: APuU4Z+yb86vYrpmghZeFpAjNwTD90OGRlzvnX6673HU6FTPaanCKLmM
	IbTvUBy6UlE5jctL70FyyvP37bMpU1zz14FmsfqkdHdECf7o4MSf7tdS
X-Gm-Gg: AYBFou1xnuVZRb5fWKAFzIx4h+n71t4qkpR7DmkZsWtI4JT/9tUUCCAhHdf5dhFlqpy
	G2VzFq/6LAVxMkzBFVfgsj2wvBxFV3jrcuw/2WqPUfGzjwe1gZG/SUsPXZw3srGppg6rBVrd6Sv
	gA/N+b6ZRAEZ10CRuJ7LIj1rRhfcQcSyJwyoezIP9C2uF3gw/Qf3vJgAYGshnvUSJ05UUKBx3l3
	gcbNvf+7wEo6Fq3LiJduNB9dM16YGMnbqOsfyXb/RDgOZ/Tm8NoFuEpDpRBEi6Hp5Vw9lp/u3pK
	ylw6G2gCNbYxpglQ2Emwa233q54sYc29Sq40V9JQ7t4nwV8OOMDV2RRp9vxkHrsqzkmKg+R0bEd
	iXpPRX2x1Z4fZ5YnawXkT5uIs7XqBH5zlWp6zSPjR/34fAUebKzmJOD2CNn58KoJ1Qbb8q7VYmR
	5WoS4jP4FA+/LwFt8eM0AqoEoGtLIcZDrItaS07xMdCb3AcnXIZS/JXGreqCpA261liMvZXuGq+
	ZYDQ3Wx6nh8PGxqSetB7iyR0XrycuM7A0PXW2iGKAY3s9y6INEBUVS+bdZfc/dryzwLlb9DXic7
	nfmwajGai5Rp4D0F+sqp6SkpMu4ePdeQax42t0qNOZkN9yCNhYJAMjvOe/fcPeX0KG64zw1LVuz
	hGhxgstbOu3gsZ6++
X-Received: by 2002:a05:7022:b909:b0:1b4:f3af:355e with SMTP id a92af1059eb24-1b5568a660emr304415c88.13.1795110979829;
        Thu, 19 Nov 2026 09:56:19 -0800 (PST)
Received: from ?IPV6:2a03:83e0:1151:15:c24:4ad9:f660:1904? ([2620:10d:c090:500::7:3ffc])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-1b5567ffa8csm670954c88.7.2026.11.19.09.56.18
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 19 Nov 2026 09:56:19 -0800 (PST)
Message-ID: <e2f61cf2-f5d1-4509-aad8-ef7db1dde81c@gmail.com>
Date: Thu, 19 Nov 2026 09:56:17 -0800
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Post: <mailto:linux-kselftest@vger.kernel.org>
List-Help: <mailto:linux-kselftest+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kselftest+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH net v2 1/5] eth: fbnic: wait on the correct queues in
 fbnic_queue_stop()
To: netdev-bot+sashiko@kernel.org
Cc: davem@davemloft.net, alexanderduyck@fb.com, kuba@kernel.org,
 kernel-team@meta.com, andrew+netdev@lunn.ch, edumazet@kernel.org,
 pabeni@redhat.com, shuah@kernel.org, hmohsin@meta.com,
 mike.marciniszyn@gmail.com, sdf@fomichev.me, bobbyeshleman@meta.com,
 bjorn@kernel.org, leitao@debian.org, horms@kernel.org,
 almasrymina@google.com, vadim.fedorenko@linux.dev, daskald@meta.com,
 netdev@vger.kernel.org, linux-kselftest@vger.kernel.org
References: <20261117215416.1901246-2-dimitri.daskalakis1@gmail.com>
 <179508206173.3136.15402623456535892800@kernel.org>
Content-Language: en-US
From: Dimitri Daskalakis <dimitri.daskalakis1@gmail.com>
In-Reply-To: <179508206173.3136.15402623456535892800@kernel.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit



On 11/19/26 1:54 AM, netdev-bot+sashiko@kernel.org wrote:
> Thank you for your contribution! Sashiko AI review found 1 potential
> issue(s) to consider.
> 
> Critical: 0 · High: 0 (1) · Medium: 1 · Low: 0
> 
> If you believe none of the issues are legitimate, please reply to each
> issue of Medium severity or higher and explain why the AI is wrong.
> If any of them are legitimate and you plan to respin, please let patchwork
> know by including "pw-bot: cr" as a separate line at the end of your reply
> (one such reply per series is enough).
> 
> - [Medium] After this patch, fbnic_queue_stop() passes
>   nv->qt[t].cmpl.q_idx to fbnic_wait_queue_idle().
> 
> Pre-existing issues:
> - [High] This problem wasn't introduced by this patch, but
>   fbnic_queue_stop() stops the vector's netdev Tx queues with a bare…
> 
> --
> 
> eth: fbnic: wait on the correct queues in fbnic_queue_stop()
> 
> This patch sets q_idx on Tx completion rings. fbnic_queue_stop() now
> passes cmpl.q_idx to fbnic_wait_queue_idle(), so Rx queues no longer
> wait on queue 0. It also skips stop and wake of Tx rings that are
> marked FBNIC_RING_F_DISABLED.
> 
>> diff --git a/drivers/net/ethernet/meta/fbnic/fbnic_txrx.c b/drivers/net/ethernet/meta/fbnic/fbnic_txrx.c
>> index 07d4b2e923627..5efed21e59329 100644
>> --- a/drivers/net/ethernet/meta/fbnic/fbnic_txrx.c
>> +++ b/drivers/net/ethernet/meta/fbnic/fbnic_txrx.c
> 
> [ ... ]
> 
>> @@ -3089,13 +3092,16 @@ static int fbnic_queue_stop(struct net_device *dev, void *qmem, int idx)
>>  	napi_disable_locked(&nv->napi);
>>  	fbnic_nv_irq_disable(nv);
>>  
>> -	for (i = 0; i < nv->txt_count; i++)
>> +	for (i = 0; i < nv->txt_count; i++) {
>> +		if (nv->qt[i].sub0.flags & FBNIC_RING_F_DISABLED)
>> +			continue;
>>  		netif_stop_subqueue(dev, nv->qt[i].sub0.q_idx);
>> +	}
>>  	fbnic_nv_disable(fbn, nv);
> 
> [Severity: High]
> This isn't a bug introduced by this patch, but does anything here wait
> for an fbnic_xmit_frame() call that is already running on another CPU?
> 
> netif_stop_subqueue() only sets __QUEUE_STATE_DRV_XOFF. Nothing calls
> __netif_tx_lock() or synchronize_net() before fbnic_nv_disable(),
> fbnic_wait_queue_idle() and fbnic_nv_flush() run. Only the full-down
> path in fbnic_pci.c uses netif_tx_disable().
> 
> A sender may pass the netif_xmit_frozen_or_stopped() check before the
> bit is set. It can then still be inside fbnic_tx_map(), writing
> tx_buf[], ring->tail and the BQL state, and ringing the doorbell.
> 
> Suppose it sets ring->tail after fbnic_nv_flush() has run:
> 
> fbnic_nv_flush()
>     fbnic_clean_twq0(nv, 0, &qt->sub0, true, qt->sub0.tail);
>     ...
>     netdev_tx_reset_queue(tx_queue);
> 
> Is the skb and its DMA mapping then leaked once __fbnic_nv_restart()
> re-enables the ring and fbnic_enable_twq0() resets head/tail to 0? BQL
> would also keep in-flight bytes that never complete, and that can
> stall the Tx queue.
> 
> Now suppose the sender is delayed until after fbnic_enable_twq0() has
> done this:
> 
> 	twq->tail = 0;
> 	twq->head = 0;
> 
> It would then write a stale ring->tail and ring the doorbell, and the
> hardware would fetch old descriptors whose buffers are already
> unmapped. Could those completions make fbnic_clean_twq0() read a NULL
> ring->tx_buf[] entry and dereference FBNIC_XMIT_CB(skb)->desc_count on
> it?
> 
> To hit this, a queue restart (netdev bind-rx devmem, io_uring zcrx) has
> to run on an Rx queue whose NAPI vector also serves a combined Tx queue,
> while another CPU is sending on that Tx queue.
> 
>>  
>>  	for (t = 0; t < nv->txt_count + nv->rxt_count; t++) {
>>  		err = fbnic_wait_queue_idle(fbn, t >= nv->txt_count,
>> -					    nv->qt[t].sub0.q_idx);
>> +					    nv->qt[t].cmpl.q_idx);
> 

This finding looks legit. I'd prefer to submit a fix for this separately,
and I can try to repro on HW in the meantime.

> [Severity: Medium]
> On an Rx-only vector the Tx triad has sub0 disabled and carries only the
> XDP TWQ1 ring, so this call becomes fbnic_wait_queue_idle(fbn, false,
> txq_idx). Does fbnic_wait_queue_idle() actually cover TWQ1 of that
> queue?
> 
> It builds a single bit from the queue index and tests that bit in all
> four Tx idle arrays:
> 
> fbnic_wait_queue_idle() {
>     ...
> 	off = idx / 32;
> 	mask = BIT(idx % 32);
>     ...
> }
> 
> The TWQ, TQS and TDE idle arrays are twice as wide as the TCQ one:
> 
> #define FBNIC_QM_TWQ_IDLE_CNT			8
> #define FBNIC_QM_TCQ_IDLE_CNT			4
> #define FBNIC_QM_TQS_IDLE_CNT			8
> #define FBNIC_QM_TDE_IDLE_CNT			8
> 
> There are 128 queues with two work queues each (TWQ0 and TWQ1), so this
> looks like one bit per TWQ. fbnic_wait_all_queues_idle() reads all 8
> registers, but fbnic_wait_queue_idle() only reads registers 0 to 3.
> 
> If bit idx maps to TWQ0, it is always idle here, because TWQ0 is
> FBNIC_RING_F_DISABLED on this triad. The TWQ1 ring that carries XDP_TX
> traffic would then never be polled.
> 
> Next, fbnic_queue_stop() calls fbnic_nv_flush(), which runs
> fbnic_clean_twq1() and unmaps the XDP buffers. Could the hardware still
> be fetching TWQ1 descriptors at that point?
> 
> The bit layout isn't documented in-tree, so the answer depends on the
> hardware. The commit message gives "fbnic_wait_queue_idle(tx, 39)" as
> the wait on the vector's XDP Tx queue. Is that wait enough to cover
> TWQ1?
> 
>>  		if (err)
>>  			goto err_restart;
>>  	}
> 

This also looks legit, and I can submit a fix in a subsequent series.

