Received: from out-170.mta0.migadu.com (out-170.mta0.migadu.com [91.218.175.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5E4731A3164
	for <linux-kselftest@vger.kernel.org>; Wed, 11 Mar 2026 01:58:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=91.218.175.170
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773194288; cv=none; b=OgBtlRpiaoOIFN2kikVKHLRSZf4GIW1VYnKUokfNS+bJf222RiSb2iae1seeEv4cwsveBrHVDuSupQU8/WPK/xv7sRu7tqV47iObVGtSKH6O1N2zNQEa6YDKQ47ixJxpyg4JhziA7UmNVp/1uQ4giiakjZmf89vunC4cbxAnIFs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773194288; c=relaxed/simple;
	bh=JMfa1B+audu66qnk+xX41IEO8i/8VaO1+MLN7haejrU=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=R0LoV74IEHvO+lYehNjrqevlnp5pNLsgNBCoTc9pU2/uCu2cCKHTv9NRsCO8OeELkeFzG1B8fm4p5kEIvBySNUfqrNDI2tLHOT6Bc8iBM5XVMFRq7pLf3B9jt5wmmGZLVhbpgnvsvx4ZWqmNarwMU9jpEqtVH0+7e65PaUPQwjk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev; spf=pass smtp.mailfrom=linux.dev; dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b=vmrl8RUu; arc=none smtp.client-ip=91.218.175.170
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b="vmrl8RUu"
Message-ID: <5700c718-d10e-4b23-adfc-c14ee1930b18@linux.dev>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.dev; s=key1;
	t=1773194284;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=Bsndf7VI0hICz2YhwbWZPyxqs4wH7whyFv5rpvSke9g=;
	b=vmrl8RUu34aIPjgC3tJvs5WNod5qAzqdPx4y7iHnSS6PNIbnDVx5gCLzJ6+3r3fTD73eRd
	fRGv9rLzNX+zRk+wkdygKAFrLSVrK6wz8vXJTcij+oIILjZdhfDlp5Yphegdwq4ujEdFWr
	Xjrg11iinvrIkiKCgtMijCNrrKHgdHg=
Date: Tue, 10 Mar 2026 18:58:00 -0700
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Subject: Re: [PATCH v5 1/4] RDMA/nldev: Add dellink function pointer
To: Leon Romanovsky <leon@kernel.org>, Zhu Yanjun <yanjun.zhu@linux.dev>
Cc: jgg@ziepe.ca, zyjzyj2000@gmail.com, shuah@kernel.org,
 linux-rdma@vger.kernel.org, linux-kselftest@vger.kernel.org,
 dsahern@kernel.org
References: <20260310020519.101415-1-yanjun.zhu@linux.dev>
 <20260310020519.101415-2-yanjun.zhu@linux.dev>
 <20260310190140.GL12611@unreal>
Content-Language: en-US
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
From: "Yanjun.Zhu" <yanjun.zhu@linux.dev>
In-Reply-To: <20260310190140.GL12611@unreal>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Migadu-Flow: FLOW_OUT

On 3/10/26 12:01 PM, Leon Romanovsky wrote:
> It is an RXE‑specific description, but you are adding code to the general
> nldev path. Please clarify that this behavior applies only to RXE, and
> include examples showing when and how it is invoked. In particular, explain
> how the socket is cleaned up if delink is not called.

Hi, Leon

You are correct that this logic should be driver-specific. I will add an 
explicit check for RDMA_DRIVER_RXE in the nldev path to ensure this 
behavior is strictly scoped to RXE and does not impact other drivers 
(like iWARP).

This function path is primarily invoked when a user executes the 
administrative command: rdma link delete <dev>.

Regarding socket cleanup: RXE does not rely solely on this path for 
resource management. It monitors the underlying net_device state via a 
registered netdev_notifier. Even if delink is not explicitly called 
(e.g., if the parent interface is removed or the driver is forcefully 
unloaded), the rxe_net_event callback ensures that the transport sockets 
are forcibly closed and all allocated resources are released when the 
parent net_device is destroyed.

The code diff is as below:

--- a/drivers/infiniband/core/nldev.c
+++ b/drivers/infiniband/core/nldev.c
@@ -1824,6 +1824,12 @@ static int nldev_dellink(struct sk_buff *skb, 
struct nlmsghdr *nlh,
                 return -EINVAL;
         }

+       if (device->link_ops && device->ops.driver_id == RDMA_DRIVER_RXE) {
+               err = device->link_ops->dellink(device);
+               if (err)
+                       return err;
+       }
+
         ib_unregister_device_and_put(device);
         return 0;
  }

Zhu Yanjun


