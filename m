Received: from mail-yw1-f180.google.com (mail-yw1-f180.google.com [209.85.128.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2580A26B777
	for <linux-kselftest@vger.kernel.org>; Thu,  9 Apr 2026 19:10:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.180
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775761813; cv=none; b=CtYkrlXliE7lFTF5pVo0DLJpmcNCBwyBcIkxPO0ZIYQbNQz9NXookSncUQ5NJEqarBg0ArXXDWjXsmypM+IlP2lYFqprCpu7EdaEhaHDEgtk1yXsp7qsNjEhHe5/0ryvQeLjiX3+jcAsT5Tdair5rj6Oi/ZirKhWzLnCElp6xCM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775761813; c=relaxed/simple;
	bh=n14zN3KADu4543DLvdmzoPnsMLU7ZRDnLP/oBDxar2U=;
	h=Date:From:To:Cc:Message-ID:In-Reply-To:References:Subject:
	 Mime-Version:Content-Type; b=Ykk2xet4/QtYBX31HR+vLiugD53LLa+RDhK/dz5kFc/CFpTkJLxb3LwpS53cRNR2z1p1T4Eqs3PJkRccsgBjjtX2q5vW5Y4vlMrA8txDDw7h3C1aCHi7dtyetZfI57RwQo1iGVBRNOqikZnQlFurYiuwE5aqT/aCSlGtT2+YXHs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=ncGZEAeX; arc=none smtp.client-ip=209.85.128.180
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="ncGZEAeX"
Received: by mail-yw1-f180.google.com with SMTP id 00721157ae682-7986e0553bdso13859017b3.2
        for <linux-kselftest@vger.kernel.org>; Thu, 09 Apr 2026 12:10:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1775761811; x=1776366611; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:subject:references
         :in-reply-to:message-id:cc:to:from:date:from:to:cc:subject:date
         :message-id:reply-to;
        bh=QprOZSDxTj82+CvyS6RGWMHqEGdQWY+21dIbE8xcXa0=;
        b=ncGZEAeXVZPXa8rGX/kwTl/7GQlA/GjBlVcM7kf91AuVXj3iZHJb2gjgcDAKetH/WG
         ZXsbBNqy3Q+N/AFN4J8STqpFBSAFxV8fwwDGYYaonDxaFNvjBlhcZpR2LM86xR0xenB1
         WbHtH5AJcswbNYH11HhivHOkCxCoTcj6kd7jJqzBD7bSSWqGBs2y9T7R/3hSJkoZKOzV
         4KxbbFhzWk+Kxoh9VwMIYgUborxDESSa57brx9i3csX10m3N4t0hmcemjoFq8oZmw48k
         fpLqEkkgr2QVORl0dYHGO6dmfmY0dCJfEkYs53CSD3iRHKX9O+F1gV/OkCKN9agkuyGB
         Rt3A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775761811; x=1776366611;
        h=content-transfer-encoding:mime-version:subject:references
         :in-reply-to:message-id:cc:to:from:date:x-gm-gg:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=QprOZSDxTj82+CvyS6RGWMHqEGdQWY+21dIbE8xcXa0=;
        b=rr1xScK08xtvSPIOfqHqYQ/xhbT9ZhwqMXTQq7t7XmtmQ7ocIPVIWOdVu7YxXzOZnP
         qewtwQGK/KnwKs11jRV+XMGA4ZTLelbYUOyKYeCnMdp0KDskW+FrBBmM0URCQuEC3oxA
         hfL7Lo9SLJqeElvQTSIuDkhVqINteP9uZqww3WdKupmo1l5Pf4yW7z9yk4PAt76y190n
         usL7ruUNr0IazRTCkRGQhQmm2EJGOSB1+sG61wukHr3+VsXMDWNhfLDEJ8HmaDaMt3qx
         8J0avNaE61Ae6ZkYQOCRD72RgyQOXYEfNy93+SF9SvZKEa0iOIJ3TbdlQWwzL1jDGGuP
         7JRA==
X-Forwarded-Encrypted: i=1; AJvYcCXbX4GoGN4foO3PxdXXqvF4V4SG0/1J2Z3KEUAYc3AJ3ABZ2oXi0MeGvIgWT8Z+T3KNjy3pZj7YQHIpwsn1IEc=@vger.kernel.org
X-Gm-Message-State: AOJu0YxlvNaCcEEc9DyEl8IA7GR+Y4W34yn4iHlAMzq39Dh+sxD2QJ4d
	qqK6aGrDTbAP0Lhrq5EFgdrG4hv/TZdE4gmthrZsT+8A8yX8/HRxPV+V
X-Gm-Gg: AeBDiet2fxteTVWphuUE/digiJIBRD/H1WdIqCq4Vmq1ItbusqzkX3RxXxm+C00vckR
	zBUZRIqCXx3OXbIMtxv2Sgw1FQBoCT4SIZSAtDanYLpYbhFH90fHrC8JZKGsWGYY6N6A5scGBWA
	y66lCaHJpz40On2UhAmkM3hI0DOxkucOBAgckHpceWmaJDNniBQcQ1CVf5uJc2pjLDS6Q9z2vPd
	TpKWHz803tMPj54dispuMqId3J9E8OxRndtmYZTzwoS3jCjmZAUyLn+MVVnlu5mICM2fq5XyYCo
	NAOpwjG5uPe+ee+gtub5tuEzTwiDBHYZFQo1YzXdG7PTX//hLuNGPktY0rpl3ZxyfEjoo80r7ox
	4wE75RxS9NC/NbvRpH3mtdDDphjiT8fssppZPu5W+iv0Z+jaHhqYgCsDPseAVJAFBZYX4wZsYLI
	h7DPdlwUJCrsrr3N/0mbJH117KNtIHy0D+fiMzqimY6qL8cqTpP3gApjZUaD+KpL57W1kq9BhIM
	g7/
X-Received: by 2002:a05:690c:1a:b0:79c:c51c:7f57 with SMTP id 00721157ae682-7af71479a21mr1697637b3.27.1775761811124;
        Thu, 09 Apr 2026 12:10:11 -0700 (PDT)
Received: from gmail.com (172.165.85.34.bc.googleusercontent.com. [34.85.165.172])
        by smtp.gmail.com with ESMTPSA id 00721157ae682-7af3fa0618fsm2881137b3.37.2026.04.09.12.10.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 09 Apr 2026 12:10:10 -0700 (PDT)
Date: Thu, 09 Apr 2026 15:10:10 -0400
From: Willem de Bruijn <willemdebruijn.kernel@gmail.com>
To: Willem de Bruijn <willemdebruijn.kernel@gmail.com>, 
 netdev@vger.kernel.org
Cc: davem@davemloft.net, 
 kuba@kernel.org, 
 edumazet@google.com, 
 pabeni@redhat.com, 
 horms@kernel.org, 
 linux-kselftest@vger.kernel.org, 
 shuah@kernel.org, 
 Willem de Bruijn <willemb@google.com>
Message-ID: <willemdebruijn.kernel.b23e27d8b455@gmail.com>
In-Reply-To: <20260409164238.661091-1-willemdebruijn.kernel@gmail.com>
References: <20260409164238.661091-1-willemdebruijn.kernel@gmail.com>
Subject: Re: [PATCH net-next v4] selftests/net: convert so_txtime to drv-net
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
Content-Type: text/plain;
 charset=utf-8
Content-Transfer-Encoding: 7bit

Willem de Bruijn wrote:
> From: Willem de Bruijn <willemb@google.com>
> 
> In preparation for extending to pacing hardware offload, convert the
> so_txtime.sh test to a drv-net test that can be run against netdevsim
> and real hardware.
> 
> Also update so_txtime.c to not exit on first failure, but run to
> completion and report exit code there. This helps with debugging
> unexpected results, especially when processing multiple packets,
> as in the "reverse_order" testcase.
> 
> Signed-off-by: Willem de Bruijn <willemb@google.com>

> +def main() -> None:
> +    """Boilerplate ksft main."""
> +    with NetDrvEpEnv(__file__) as cfg:
> +        # Record original root qdisc
> +        cmd_obj = cmd((f"tc -j qdisc show dev {cfg.ifname} root"))
> +        qdisc_root = json.loads(cmd_obj.stdout)[0].get("kind", None)
> +
> +        ksft_run([test_so_txtime_mono, test_so_txtime_etf], args=(cfg,))
> +
> +        # Restore original root qdisc. If mq, populate with default_qdisc nodes
> +        if (qdisc_root):

I evidently couldn't resist a touch up after running through pylint.

Unnecessary parentheses. Only a warn. But I can resubmit irrespective
of other concerns.

Again, could add a tc helper (in a separate patch) to hide some of the
open coded ugliness too.

> +            cmd(f"tc qdisc replace dev {cfg.ifname} root {qdisc_root}")
> +    ksft_exit()
