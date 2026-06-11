Received: from mail-qt1-f169.google.com (mail-qt1-f169.google.com [209.85.160.169])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DBDD1376BE8
	for <linux-kselftest@vger.kernel.org>; Thu, 11 Jun 2026 10:22:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.160.169
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781173363; cv=pass; b=d0TR2QDaH7hmygCCoIwq4QVlS3jr1ZcL2bbs97GaHZoeqNIEzxdpwVO3rM7iL2xvG+KUXICdhvY/7HSmpoBjTzwcM0oeDERYO78uv9s74MmnvoDtihLCmOjzEjkH4ttBwXVPHujZpo6Nw+2eBCDDEvVFcWnyYU9CB6hAssVi2u4=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781173363; c=relaxed/simple;
	bh=9rd5ao9UX+dRdCRfac+Al0jz3HeZixBGrRexHervq2A=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=oK7jSPGyvO3Deg00v7rzaDUJNqAMcWgN6vlTw9GNUNEHVf+8LkUsAKe/iQvCy1X/+4/iW5Zo8KvMkVpvkt0eyBAoSKcyP99VY/k470ioNXRN/h+37tCDzSSNcliaRkc68uK/zTAnyLEOdduH7FtduFwKcSuBbD2V0zZoiuVZqeM=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=szeredi.hu; spf=pass smtp.mailfrom=szeredi.hu; dkim=pass (1024-bit key) header.d=szeredi.hu header.i=@szeredi.hu header.b=OTF8zohF; arc=pass smtp.client-ip=209.85.160.169
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=szeredi.hu
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=szeredi.hu
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=szeredi.hu header.i=@szeredi.hu header.b="OTF8zohF"
Received: by mail-qt1-f169.google.com with SMTP id d75a77b69052e-51776b4de37so61300261cf.1
        for <linux-kselftest@vger.kernel.org>; Thu, 11 Jun 2026 03:22:41 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1781173361; cv=none;
        d=google.com; s=arc-20240605;
        b=Az2FIplBS7573L9tVuX7KeTjRmfDI7qGVPKYlcF9RRYn+OTguWw7ufbcMi6S0ci0fa
         5CXMgTrmwgtGaUpXkG/wDQizNUlEz4yHniEVyu+Mb2ISwdANyFELgmDRcDztNp8L7oeZ
         VYCbEc2blS8Kk4EXwrii4eQyScBZDCQp7Aonv1GPueKvqg1RfgM5tf02W9BNUjecSKC7
         T7SRaJvLYhAjIcRI1z7lPNS9M5VCxrxFQbGTQgq4/K+3ZZfZleb48dIwExlDUuZkHHzd
         82s4HhGcCrcyILHVKDhvcu0W8nroxoCUrYNX4XAELMytMERBmHau5ybwUODhEtjUmq+c
         hYRQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=ZdX0Q5Dj/m/HuXrzpkAdoJ/jZuUveaL90+L63Y1EBAI=;
        fh=G0QaIPXUFWMfcM0cTesBljzZzvsY4UyfElXlmhwSNUk=;
        b=hnc4IoF5uyici6cu/oJ2tkZS0kzAVdSRiIUtXNotO15okNgSOKrGBFQeAys2cdIggw
         NYZ+bz0kVOIiORIPiwmrFm/lXhD36fGkmug6zRsQ5/2BuOCJ9zOW/T6z0SZEj5Ysp8NL
         2l8cDuDo7vliwkjsrMYPz4wl3FLd/2lby3Hb7ye6O5xqr3CSb4NJERtBcqmCFi5gGlYU
         vaRMSmfoZ1W18x56ozl02V0l4ajjopY+Tii54g769QiwLq0/lUg9gNW07/gfmFG0BON1
         n8SXQoaHWFZVEXknWLaq+Kqx/x3yW604kdxUVPB3V9QUxTk605296l+qQyl6Wz7zmEjL
         ztoA==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=szeredi.hu; s=google; t=1781173361; x=1781778161; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=ZdX0Q5Dj/m/HuXrzpkAdoJ/jZuUveaL90+L63Y1EBAI=;
        b=OTF8zohFsJVlZr6ws2Abv0gTeJmK0zD7MmfaID1jzVc/USrBTCewyyhj9GT4vtpY4O
         ms7AwaPUfikslTgpPiVC2X4ryQ50/H2jLhsJT3Qli/YtcvctDl9pGrXN6zQf2mjXUVbo
         Am7v6zhUFq5ZbahxSMvpaBA/ObD1f4kwGdXkM=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781173361; x=1781778161;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ZdX0Q5Dj/m/HuXrzpkAdoJ/jZuUveaL90+L63Y1EBAI=;
        b=JYxcFfaF/qyqKHs41827vOITSlL1K55eZ/dVt3kfmkrrCTxj5zXHkouOqsbG78kkIt
         2f7vUFHda7TiGTT7PrIhJw6tZyDbOe7AS6ogGv0ORecu+Vm/JD9mzfbZTob0UzrHUWbf
         aVdmXi1r+XvGOmBPEx5REhav/LGZhqTbRzJhl9PdnVzW2VdQcv5+lBxaelLSPE4uc0Eu
         +ksw3qGIuzO+YyEz+/Y8XwFU11QcyscLBe9ceq/VS3ctavoqTZhwVGqpRcvN7JLIuU8B
         olPMXsUCs0fhiT/OGlO1RcJ7mRlA04J0jFPn+Ginoxd3ERHqL+PrUsLMQlkO2j7sTq0A
         xa6w==
X-Forwarded-Encrypted: i=1; AFNElJ/TCLkI3Ya46HGyYZLRf1T6gg8eJJCpBQ+1MDtGFJ/lanWYRMvcPEF7GW9Qh9fWukGLLxlh8ffghJI+JQv+7G4=@vger.kernel.org
X-Gm-Message-State: AOJu0YxXp19FzNYdFL+/Hoh0RzNvWyM4SA+SjzuOLZ0Cfjp1gYR09wK5
	MRI+DaVLPfH/ea6DtgZ98K9/c4G2ilY6hVk0vEn6bqmlphIIYsWgvsxEUORUerXf25S+nvkjlA6
	nMgr7idu5jtEbT63NS/sE1irkO7Hm5cTdRgpOfn3Vni4DpICjwNyUfmE=
X-Gm-Gg: Acq92OHqQwY8grA4wEU7O3lzmtV7Xknj+3Y6KATddcQ99D+nTaq0PMAmZ0KBQQ/nJuQ
	S6DnKhTmXwVTeB2UpAh/SPvW41d/qMEZB1TZc94XlLPGwLgjYzElRoFmrA49G1PCUyMSkuHRL9w
	Nzww9JU9eDFKxPcz3QsDhZT6iVsmUDmbioz2P2aCPqMYX+hr7eyHVf2CYk4U2MDeAdTy6mJCSjy
	hcVWbCG7CA2qZlUQU4aA4f0u9Rajzt5ImSNgdXaI58WMJRzv0peQnL3NRTCc0xzsb4x0rP2Q6p1
	yNmDWbxZuVxVVE+i6weye12UsGOE50bQt+bW9+l9kULVc3q3WWE=
X-Received: by 2002:ac8:7d55:0:b0:517:8aed:1498 with SMTP id
 d75a77b69052e-517edd196demr32813551cf.16.1781173360617; Thu, 11 Jun 2026
 03:22:40 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260408-wip-cuse-leak-fix-v1-0-1c028d575e97@redhat.com> <20260408-wip-cuse-leak-fix-v1-1-1c028d575e97@redhat.com>
In-Reply-To: <20260408-wip-cuse-leak-fix-v1-1-1c028d575e97@redhat.com>
From: Miklos Szeredi <miklos@szeredi.hu>
Date: Thu, 11 Jun 2026 12:22:29 +0200
X-Gm-Features: AVVi8CdMAm9XTPu_tz3eNH4Gr6oH6gYH_KlQ1VbfnPRDcGzO9UeXR4dc-afKowg
Message-ID: <CAJfpegtWTNEDcDds5X_jsXc_wKWtuW5oZqXQnrTrzW0rw8fa7Q@mail.gmail.com>
Subject: Re: [PATCH 1/2] fuse: fix device node leak in cuse_process_init_reply()
To: aruiz@redhat.com
Cc: Shuah Khan <shuah@kernel.org>, linux-fsdevel@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-kselftest@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

On Wed, 8 Apr 2026 at 17:23, Alberto Ruiz via B4 Relay
<devnull+aruiz.redhat.com@kernel.org> wrote:
>
> From: Alberto Ruiz <aruiz@redhat.com>
>
> If device_add() succeeds during CUSE initialization but a subsequent
> step (cdev_alloc() or cdev_add()) fails, the error path calls
> put_device() without first calling device_del().  This leaks the
> devtmpfs entry created by device_add(), leaving a stale /dev/<name>
> node that persists until reboot.
>
> Since the cuse_conn is never linked into cuse_conntbl on the failure
> path, cuse_channel_release() sees cc->dev == NULL and skips
> device_unregister(), so no other code path cleans up the node.
>
> This has several consequences:
>
>  - The device name is permanently poisoned: any subsequent attempt to
>    create a CUSE device with the same name hits the stale sysfs entry,
>    device_add() fails, and the new device is aborted.
>
>  - The collision manifests as ENODEV returned to userspace with no
>    dmesg diagnostic, making it very difficult to debug.
>
>  - The failure is self-perpetuating: once a name is leaked, all future
>    attempts with that name fail identically.
>
> Fix this by introducing an err_dev label that calls device_del() to
> undo device_add() before falling through to err_unlock.  The existing
> err_unlock path from a device_add() failure correctly skips device_del()
> since the device was never added.
>
> Signed-off-by: Alberto Ruiz <aruiz@redhat.com>

Applied, thanks.

Miklos
