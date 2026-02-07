Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 61F2E1D9346;
	Sat,  7 Feb 2026 04:32:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770438732; cv=none; b=dBvxWUUFhy3ISkpp9fLIT5QXIcLf3zSlJYi30EQuxdb5q/Od9TXSIaHGWKWgFd21IYPzAglhIp2JmnZbYQJlnmiB1BzyUMMhX9eSwSICYXiN9gJ9kVrZ7/jeIgBcwm0t78+ySd4U01KADBo0C08scFftxqKqAANjfixPDY2uDgE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770438732; c=relaxed/simple;
	bh=qGVCSV2IfW5Vg2/Uq3T47VtFpJpS3z9wY7+EumtLnWk=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=mFso9lvR38VcRTra5QpGelmyHPci9XfbVno09wPE/Ak4LDqNGMSQ23wULK7Ztmnyqiivu/5+otlCFPFb2eGbvjvGUNafoJ2ZFsRftX7yjO3qcPQvrNWv6VohozLXy0tGZ1URDiqQM4qYoQE3S/fjTNxtFNxGbTo5PSCdN/l2qJg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=L1qmUMAM; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="L1qmUMAM"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 1FD02C116D0;
	Sat,  7 Feb 2026 04:32:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1770438731;
	bh=qGVCSV2IfW5Vg2/Uq3T47VtFpJpS3z9wY7+EumtLnWk=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=L1qmUMAM2b1uanE6MHbCFZ4tqKXIrmcRMYPfjxk6k7C8fM5JhlnwRAQl6Bsj3o2vg
	 2XkwJg49l4ftg5LJ6q/lxRdXoFvvKtzSzP/PPgs8bF0TbVD1EY32iy8Qi2ibQa9O1s
	 3ktsA2SECpor74v4qESTUK4CuS0BeN+OApUgTanh0ar1Xvb34cJTnEYZx2od8+OOBH
	 j9m8moA8JcsefyU9I+ZTxX07dPDBHF2o36JRUGp8PBlen04nz2df15593+x3FL+R4O
	 +7cGEnf+OFc/k7TCGZ8I3hCIIhGMzDSLKyZNj5D+W7F4/mhA8gjMu+89buO52XxIKR
	 S579wMcz1oQsw==
From: Jakub Kicinski <kuba@kernel.org>
To: daniel.zahka@gmail.com
Cc: Jakub Kicinski <kuba@kernel.org>,
	linux-kselftest@vger.kernel.org,
	tariqt@nvidia.com,
	shuah@kernel.org,
	borisp@nvidia.com,
	leon@kernel.org,
	davem@davemloft.net,
	horms@kernel.org,
	andrew+netdev@lunn.ch,
	netdev@vger.kernel.org,
	saeedm@nvidia.com,
	edumazet@google.com,
	willemdebruijn.kernel@gmail.com,
	donald.hunter@gmail.com,
	pabeni@redhat.com,
	mbloch@nvidia.com
Subject: Re: [net-next,1/9] psp: support rx rekey operation
Date: Fri,  6 Feb 2026 20:32:09 -0800
Message-ID: <20260207043209.4129667-1-kuba@kernel.org>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260204-psp-v1-1-5f034e2dfa36@gmail.com>
References: <20260204-psp-v1-1-5f034e2dfa36@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

This is an AI-generated review of your patch. The human sending this
email has considered the AI review valid, or at least plausible.

For local reproduction steps see https://netdev-ai.bots.linux.dev/ai-local.html
---
psp: support rx rekey operation

This patch adds support for rx-assoc netlink operation on an already keyed
socket, enabling rx rekey by splicing a new psp_assoc object with newly
generated rx state and reused tx state.

> diff --git a/net/psp/psp_sock.c b/net/psp/psp_sock.c
> index f785672b7df6..3a8abd023f99 100644
> --- a/net/psp/psp_sock.c
> +++ b/net/psp/psp_sock.c

[ ... ]

> @@ -129,30 +130,42 @@ void psp_sk_assoc_free(struct sock *sk)
>  	psp_assoc_put(pas);
>  }
>
> -int psp_sock_assoc_set_rx(struct sock *sk, struct psp_assoc *pas,
> -			  struct psp_key_parsed *key,
> -			  struct netlink_ext_ack *extack)
> +static void psp_sock_rx_rekey(struct psp_assoc *pas, struct psp_assoc *prev)
>  {
> -	int err;
> +	lockdep_assert_held(&pas->psd->lock);
> +
> +	pas->peer_tx = prev->peer_tx;
> +	pas->upgrade_seq = prev->upgrade_seq;
> +
> +	/* steal refcount from sk->psp_assoc */
> +	pas->prev = prev;
> +
> +	memcpy(&pas->tx, &prev->tx, sizeof(pas->tx));
> +	memcpy(pas->drv_data, prev->drv_data, pas->psd->caps->assoc_drv_spc);

Is there a check that prev->psd == pas->psd before this memcpy?

The psp_assoc_device_get_locked() pre_doit handler obtains the PSP device from
the socket's current destination route via psp_dev_get_for_sock(), but this
may differ from the device used when the existing association (prev) was
created if the route changed.

The memcpy copies pas->psd->caps->assoc_drv_spc bytes from prev->drv_data, but
if prev->psd has a smaller assoc_drv_spc, this could read beyond the bounds of
prev->drv_data.

For comparison, psp_sock_assoc_set_tx() has explicit device validation:

    if (pas->psd != psd)
        NL_SET_ERR_MSG(extack, "Rx key from different device");

Should psp_sock_rx_rekey() have a similar check?

> +	prev->tx_moved = true;
