Received: from mail-ot1-f42.google.com (mail-ot1-f42.google.com [209.85.210.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CA4DA396591
	for <linux-kselftest@vger.kernel.org>; Fri,  4 Sep 2026 23:34:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788564888; cv=none; b=KoFzILMFtjiVLKIga+Xsf67K/NlYaJtzcthuxP4AVZO4xu+n80MEWXf7wfb6lh+1I17kp/yI9yg6MIZoLRU4UOD0FPWY8csRdB6PMd92EkNpww4XoE7MzSEkpA5EfhTBYyuihOt/qjhIDkxKC6Onw+tt7oA4K7qe8V+ZVvflBIA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788564888; c=relaxed/simple;
	bh=r0x4jtoyOirev9HbRKuirTBymyiPd//aXlUsHHUnCTE=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Ul2FeS7/lV83Ljy2VqLKL5eTb6mB9R9YSdFByG+J/Wc2Pa/VMMIrTqhNxy262K5ZB0ylm5Yw3USGhxsB42IWbfWbGwpFinwsinuwLsrhxfRKNC1nAr++BMic05FdoNstDNCe3dfgxueeTepHBZxFXenkVaeiNjok4v9bxSKQdWw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=iSbXQZ5v; arc=none smtp.client-ip=209.85.210.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="iSbXQZ5v"
Received: by mail-ot1-f42.google.com with SMTP id 46e09a7af769-7f0167e59a3so1322056a34.0
        for <linux-kselftest@vger.kernel.org>; Fri, 04 Sep 2026 16:34:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788564886; x=1789169686; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=8B4nzzUWRN6o9d6GsYuC/J9UneHD//bbKjLvbzC8OEk=;
        b=iSbXQZ5vJ2BGLE1yQE0n4ZSODQUMgj64IEtq2JDwKMOQ/mBmA0QkSaY6wGJDCh7fcp
         j72E9yzCTsBirDRdK2tPbyLRC6aDm3AnhYKr0lpBTcmoQ7YajiBn/7ThSfR5ZQTtuLFl
         kURN472c/wn1FuqpcRC1+xT59FUaWUQ1tYGmNGqFaK9Spx7QAHCekqVF/LOH1fq2tY2H
         l3j1WQXOKZBgEkUgTR66t9CurWPO6fWuCNfjj/+O3rDZn2eZIWilDGL0oYRlmweXL9py
         L4gECkvNyGoePk4Cm4l5kXyJtRgiQ8FO31H/Bm/ANpKlu9iJ2zax6NQlQEba8kvIIWqz
         JI5g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788564886; x=1789169686;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=8B4nzzUWRN6o9d6GsYuC/J9UneHD//bbKjLvbzC8OEk=;
        b=mrjpI+03biP137GGff2dvzX6AxUlr4Q9xftouiSSRBIc5gMBKYF6LkyYhU9SuhbaqF
         PA9+LPPY8RVZhf89vS/hRAUT8u+5yo1SqvdCk4goXCsSsT57aaA5dV7jKk/k7qikwNuH
         6l5YU01FcyuXIZP02eHA0/ilywxtyVsd2hZgWZAmqNk66N2hZ9A1Y3FXvUV0T5se3s9c
         uzDa8mhj2gA2w5jO01bd1lRfT8PoLQvIryY+iOeXZ7qWVLdcRdJBYXVZDi3MjSpab5E9
         i8R/xWGZ3guLbw+BQicmidIF/XlKgF6X4Vw4nxdfNdn5xa0yAljjMKKtizrRgo5TFgDM
         1dbQ==
X-Forwarded-Encrypted: i=1; AKwUvBwBnTkaKNQD6DZ2sos1rAp7MwYTU/N8RHKo+ybh7/Su5xFq4PB4kgJBxdNDrTPzbpbKjW7hRFK3N1X2kXDOEIE=@vger.kernel.org
X-Gm-Message-State: AFuF++kEHqFztQGngZTOhKncVQOq62/N5A9kD/VQdYxUv9zsnQ/wnFKM
	pUPGRX07G9tW3OAB6uxAd7NksTgUquIqbl6qadywq++JmnorkH3BeCmJFgAa97nK
X-Gm-Gg: AYBFou1XaVa872niYKwOb+q9mSV3cS9IyqXwOztu4yNct1Eu3R/PIAp+9ZIwic5T4Ni
	8d7riVKoYfFnhkiERBe8pwLeWzQFIj4gVvXYZGIQeeRxzV8aGrbJ1iko27IVz9YidF4Gc6vazk2
	yV2uDSKnFPQDhYQmOiykpkeRNV+GxIMH1BvlJPSrJwKkdGXotlnylBYPsTAYJsCTr+eJWDH5bzu
	nEKusjaF5IskZM4ABorXCcVm2i22BsPSuFOF0pU5cW4uwkojW3GLD1p7WkbOxJ2EIVj4YN9m0Yb
	CR9xpt/lmDYLoxiHbHkOH08yhfsyVzTFlhrUgZu2rGPSJro6qpPTv41v0Wp6H/L0SgTGp5Z1vpf
	J5l0x72AnJU6ANMpOGAHRCARYTohMzEJ7SMhsKUPNrW5FkVo5B6DqGDeWmMm67Wt4F2c1xln4No
	CQYzqU+J+R4s+nYRzh6Lwo84n+tRG1XAWGYUAY1Xgia1Vjkc8C+kHB2d5nHc2t7ErAPGzOG59qi
	m9j2wMGLw==
X-Received: by 2002:a05:6820:160b:b0:6b3:f762:4d95 with SMTP id 006d021491bc7-6b6faee2821mr6395663eaf.7.1788564885608;
        Fri, 04 Sep 2026 16:34:45 -0700 (PDT)
Received: from devvm29614.prn0.facebook.com ([2a03:2880:ff:70::])
        by smtp.gmail.com with ESMTPSA id 586e51a60fabf-47554935751sm3537590fac.11.2026.09.04.16.34.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 04 Sep 2026 16:34:44 -0700 (PDT)
Date: Fri, 4 Sep 2026 16:34:40 -0700
From: Bobby Eshleman <bobbyeshleman@gmail.com>
To: Jakub Kicinski <kuba@kernel.org>
Cc: davem@davemloft.net, netdev@vger.kernel.org, edumazet@google.com,
	pabeni@redhat.com, andrew+netdev@lunn.ch, horms@kernel.org,
	shuah@kernel.org, cjubran@nvidia.com, cratiu@nvidia.com,
	noren@nvidia.com, willemb@google.com, petrm@nvidia.com,
	linux-kselftest@vger.kernel.org
Subject: Re: [PATCH net-next] selftests: net: add ctl_file_write() helper
Message-ID: <aptVkE6fRuj7f3bl@devvm29614.prn0.facebook.com>
References: <20260904174134.3789400-1-kuba@kernel.org>
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260904174134.3789400-1-kuba@kernel.org>

On Fri, Sep 04, 2026 at 10:41:34AM -0700, Jakub Kicinski wrote:
> Setting a sysctl or a sysfs attribute for the duration of a test and
> putting the old value back has been open coded multiple times.
> 
> We generally avoid creating library helpers but this one is very
> common, and the defer is a little tricky as using the same function
> for defer as the initial write leads to an infinite loop (not that
> I would ever make such mistake!)
> 
> Some of the conversions are not identical, but arguably ctl_file_write()
> semantics are more correct.
> 
> Signed-off-by: Jakub Kicinski <kuba@kernel.org>
> ---
> CC: shuah@kernel.org
> CC: cjubran@nvidia.com
> CC: cratiu@nvidia.com
> CC: noren@nvidia.com
> CC: willemb@google.com
> CC: petrm@nvidia.com
> CC: linux-kselftest@vger.kernel.org
> ---
>  tools/testing/selftests/drivers/net/gro.py    | 17 +++---------
>  .../drivers/net/hw/devlink_rate_tc_bw.py      |  5 ++--
>  tools/testing/selftests/drivers/net/hw/irq.py | 11 ++------
>  .../drivers/net/hw/lib/py/__init__.py         |  4 +--
>  .../selftests/drivers/net/hw/toeplitz.py      | 10 +++----
>  .../selftests/drivers/net/lib/py/__init__.py  |  4 +--
>  .../selftests/drivers/net/ring_reconfig.py    | 26 ++++---------------
>  .../testing/selftests/net/lib/py/__init__.py  |  4 +--
>  tools/testing/selftests/net/lib/py/utils.py   | 22 ++++++++++++++++
>  9 files changed, 44 insertions(+), 59 deletions(-)
> 
> diff --git a/tools/testing/selftests/drivers/net/gro.py b/tools/testing/selftests/drivers/net/gro.py
> index 6ab8c97880d1..e0b21703cc3c 100755
> --- a/tools/testing/selftests/drivers/net/gro.py
> +++ b/tools/testing/selftests/drivers/net/gro.py
> @@ -42,7 +42,7 @@ import re
>  from lib.py import ksft_run, ksft_exit, ksft_pr
>  from lib.py import NetDrvEpEnv, KsftFailEx, KsftXfailEx
>  from lib.py import NetdevFamily, EthtoolFamily
> -from lib.py import bkg, cmd, defer, ethtool, ip
> +from lib.py import bkg, cmd, ctl_file_write, defer, ethtool, ip
>  from lib.py import ksft_variants, KsftNamedVariant
>  
>  
> @@ -79,17 +79,6 @@ GRO_DPORT = 8000
>      return getattr(cfg, attr)
>  
>  
> -def _write_defer_restore(cfg, path, val, defer_undo=False):
> -    with open(path, "r", encoding="utf-8") as fp:
> -        orig_val = fp.read().strip()
> -        if str(val) == orig_val:
> -            return
> -    with open(path, "w", encoding="utf-8") as fp:
> -        fp.write(val)
> -    if defer_undo:
> -        defer(_write_defer_restore, cfg, path, orig_val)
> -
> -
>  def _set_mtu_restore(dev, mtu, host):
>      if dev['mtu'] < mtu:
>          ip(f"link set dev {dev['ifname']} mtu {mtu}", host=host)
> @@ -244,8 +233,8 @@ def _run_gro_bin(cfg, test_name, protocol=None, num_flows=None,
>          flush_path = f"/sys/class/net/{cfg.ifname}/gro_flush_timeout"
>          irq_path = f"/sys/class/net/{cfg.ifname}/napi_defer_hard_irqs"
>  
> -        _write_defer_restore(cfg, flush_path, "200000", defer_undo=True)
> -        _write_defer_restore(cfg, irq_path, "10", defer_undo=True)
> +        ctl_file_write(flush_path, "200000")
> +        ctl_file_write(irq_path, "10")
>  
>          _set_ethtool_feat(cfg.ifname, cfg.feat,
>                            {"generic-receive-offload": True,
> diff --git a/tools/testing/selftests/drivers/net/hw/devlink_rate_tc_bw.py b/tools/testing/selftests/drivers/net/hw/devlink_rate_tc_bw.py
> index 4e4faa9275bb..38d712755257 100755
> --- a/tools/testing/selftests/drivers/net/hw/devlink_rate_tc_bw.py
> +++ b/tools/testing/selftests/drivers/net/hw/devlink_rate_tc_bw.py
> @@ -63,7 +63,7 @@ from lib.py import ksft_pr, ksft_run, ksft_exit
>  from lib.py import KsftSkipEx, KsftFailEx, KsftXfailEx
>  from lib.py import NetDrvEpEnv, DevlinkFamily
>  from lib.py import NlError
> -from lib.py import cmd, defer, ethtool, ip
> +from lib.py import cmd, ctl_file_write, defer, ethtool, ip
>  from lib.py import Iperf3Runner
>  
>  
> @@ -113,8 +113,7 @@ from lib.py import Iperf3Runner
>      except Exception as exc:
>          raise KsftSkipEx(f"Failed to enable switchdev mode on {cfg.pci}") from exc
>      try:
> -        cmd(f"echo 1 > /sys/class/net/{cfg.ifname}/device/sriov_numvfs", shell=True)
> -        defer(cmd, f"echo 0 > /sys/class/net/{cfg.ifname}/device/sriov_numvfs", shell=True)
> +        ctl_file_write(f"/sys/class/net/{cfg.ifname}/device/sriov_numvfs", 1)
>      except Exception as exc:
>          raise KsftSkipEx(f"Failed to enable SR-IOV on {cfg.ifname}") from exc
>  
> diff --git a/tools/testing/selftests/drivers/net/hw/irq.py b/tools/testing/selftests/drivers/net/hw/irq.py
> index 0699d6a8b4e2..3d1c56b51054 100755
> --- a/tools/testing/selftests/drivers/net/hw/irq.py
> +++ b/tools/testing/selftests/drivers/net/hw/irq.py
> @@ -7,7 +7,7 @@ from lib.py import KsftSkipEx
>  from lib.py import ksft_disruptive
>  from lib.py import EthtoolFamily, NetdevFamily
>  from lib.py import NetDrvEnv
> -from lib.py import cmd, ip, defer
> +from lib.py import cmd, ctl_file_write, ip
>  
>  
>  def read_affinity(irq) -> str:
> @@ -15,12 +15,6 @@ from lib.py import cmd, ip, defer
>          return fp.read().lstrip("0,").strip()
>  
>  
> -def write_affinity(irq, what) -> str:
> -    if what != read_affinity(irq):
> -        with open(f'/proc/irq/{irq}/smp_affinity', 'w') as fp:
> -            fp.write(what)
> -
> -
>  def check_irqs_reported(cfg) -> None:
>      """ Check that device reports IRQs for NAPI instances """
>      napis = cfg.netnl.napi_get({"ifindex": cfg.ifindex}, dump=True)
> @@ -41,8 +35,7 @@ from lib.py import cmd, ip, defer
>      old = read_affinity(n['irq'])
>      # pick an affinity that's not the current one
>      new = "3" if old != "3" else "5"
> -    write_affinity(n['irq'], new)
> -    defer(write_affinity, n['irq'], old)
> +    ctl_file_write(f"/proc/irq/{n['irq']}/smp_affinity", new)

This one might miss the ctl_file_write's "old == str(val)" case, where
old is still prepended with zeroes (e.g., 0000,0000,0003)?

The rest LGTM.

Best,
Bobby
