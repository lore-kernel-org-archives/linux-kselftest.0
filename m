Received: from mail-dl1-f74.google.com (mail-dl1-f74.google.com [74.125.82.74])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C26F723ED5B
	for <linux-kselftest@vger.kernel.org>; Mon, 29 Jun 2026 19:20:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.82.74
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782760836; cv=none; b=J1AfW3fKvT0KiKtc1tBAfqmMqJD6CqmO0iHu6VeVAo/lu3rfU9ypJJOAZgrLNAub3BgX0vcwJ0qP644Lcwgm1XFmdsW9OCcWPdhscf6EYH+0xjntAYy310HCzwm7Xa8a9juwOojR6sXbLRoqpOp1vFjOSi6ShfJ5eZXsISOYCA4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782760836; c=relaxed/simple;
	bh=AksPqJm8AdB8z1GseHv2j/6UI9KT3j821AcEjIKRZf0=;
	h=Date:Mime-Version:Message-ID:Subject:From:To:Cc:Content-Type; b=nXubU/ClKt8Ly9Itk2i77a/zmtru/gMgnynqTuI3Tnaccp6eEGj/xi390g20N0IEjL5bE+Q9/2geialq7/Gam04jQk3lUeFfGxxDAV0axZ2WxmCUGg8QqIoI9zV2+P9r4meaclq2xpl/9GMoYf67UjO7pN2WoktzIzO4QM9343E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--tanshuhao.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=R9BrGp9K; arc=none smtp.client-ip=74.125.82.74
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--tanshuhao.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="R9BrGp9K"
Received: by mail-dl1-f74.google.com with SMTP id a92af1059eb24-1384427c3efso11701988c88.0
        for <linux-kselftest@vger.kernel.org>; Mon, 29 Jun 2026 12:20:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1782760834; x=1783365634; darn=vger.kernel.org;
        h=cc:to:from:subject:message-id:mime-version:date:from:to:cc:subject
         :date:message-id:reply-to;
        bh=tuVF3Ubxy2bUmwCTppAH3J3uuqug40elm+qvkif8OCQ=;
        b=R9BrGp9KZNZTcwu+pZFC/+ubQCHAL8u19fS90sISGqNFHb3GhtwlHvgA7TTs2t8IlC
         j/cl4uIlbugJR7cKPUdyMJ0mqkihE2IwqAlkZzGTHGOXnuUGWhSCeEWoj5Dohbcp6wM3
         l/eC/NGv7talln9Zu6JXDtMEYLnVTxDn08/uMnOt1bFstRsVgkrz+mZWp1YGTIoXTbDY
         yQ4G0+qycmFLOYFKaQCyB3wU+QGMhqaP3/fCtlmq2kTfWAPXPdDZ5EeNUxLlCcf2ENrn
         VxEUKCegT5dKXyWLIU9vfDPfq4EQLyj7LS0RkYj6XlEvRXT2VGn63wqh+nwWhE5YL8aP
         Z82Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782760834; x=1783365634;
        h=cc:to:from:subject:message-id:mime-version:date:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=tuVF3Ubxy2bUmwCTppAH3J3uuqug40elm+qvkif8OCQ=;
        b=Y0jBnKCEQgdlDDjtHYw+Og3A64yrlwDc81wi/XJnN+4/F246wWybY8QFGX+BP1sZgM
         Gf6oB3Tv5n9ewxFpyXOQO32t7QL5oRm0419Jba8/ponIzlaTkEH5TTq8EDWouGTMYfq/
         g90+8ZtWmxxX0QC8hdkN2C9GoAPjVGsJs4e0W2gtb61Kq09g1Is6Hw0sSMw8Kbi40aTH
         CJ6rGQvaXh6qPKBRlIU84JlWsf2fxMUSxEDZq30udxAlr9AJnxtmCiO29vclmI2of8Cc
         igQEGjutO6r92/2lFEt/4xL/y4jHaZAiSoYUH/rzuAoFXcRUJ2GU6Q0kleBPbhM42cgm
         Is5w==
X-Forwarded-Encrypted: i=1; AFNElJ/mwHBa35iH03eE5xtEtTQbrxE1EF76hxolw6PTcXALQLGgVc7uHD/R3HoV0OmYYFQyK01tsHFo7DQAqI8JByI=@vger.kernel.org
X-Gm-Message-State: AOJu0YxanLFf1KKsRt1wBC8Vo45yJSHPIfDZZD+CTfiyDPVquwO8kPLm
	sWlsEY3kyUXP47b38g6ijS9C60xeX2BqWwhX96PuORvt6fL8spMNxl1EEyYkvIBM6XJ4oE95uFw
	i05aFpUlYwVEEqoJKjA==
X-Received: from dldyq21-n2.prod.google.com ([2002:a05:701b:4555:20b0:139:a5e6:cf73])
 (user=tanshuhao job=prod-delivery.src-stubby-dispatcher) by
 2002:a05:7022:923:b0:137:e532:f53f with SMTP id a92af1059eb24-13b2a1c32b0mr389067c88.34.1782760833527;
 Mon, 29 Jun 2026 12:20:33 -0700 (PDT)
Date: Mon, 29 Jun 2026 12:20:25 -0700
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
X-Mailer: git-send-email 2.55.0.rc0.799.gd6f94ed593-goog
Message-ID: <20260629192029.4013794-1-tanshuhao@google.com>
Subject: [PATCH net-next v1 0/2] Reuse threaded NAPI kthread across napi_del()/napi_add().
From: Shuhao Tan <tanshuhao@google.com>
To: "David S . Miller" <davem@davemloft.net>, Eric Dumazet <edumazet@google.com>, 
	Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, Simon Horman <horms@kernel.org>, 
	Andrew Lunn <andrew+netdev@lunn.ch>, Shuah Khan <shuah@kernel.org>
Cc: Shuhao Tan <tanshuhao@google.com>, Mina Almasry <almasrymina@google.com>, 
	Samiullah Khawaja <skhawaja@google.com>, Kuniyuki Iwashima <kuniyu@google.com>, netdev@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-kselftest@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

Currently the lifetime of the kthread of a threaded NAPI is tied to
the napi_struct. netif_napi_del() stops the kthread when it destroys
the NAPI struct.

This patch series reuses the same kthread (thus preserving all of its
attributes) across napi_del/napi_add. The kthread is parked between
napi_del and napi_add. This series now ties the lifetime of the
kthread to net_device instead of napi_struct.

The usual workflow for threaded NAPI will be "enable threaded" ->
"configure the kthread". Driver reset (that can be caused by a NIC
configuration change or link flap) often destroys the configuration
and causes a usability issue. This series aims to improve on this.

There is a downside of this approach: If a device reduces number of
queues while its NAPIs are threaded. The kthread associated with
removed queues will not be stopped. Since the mapping between the
index passed to napi_add_config() and NAPI is an implementation
detail of individual drivers, it is not straightfoward to perform
a garbage collection and stop kthreads that are no longer associated
with a queue. The kthread still shows up in /proc, but should not
consume CPU cycles since it is now parked.

There was a discussion
https://lore.kernel.org/CAAywjhR0TPKZ-xzqjSP709OVmZWUisDNv2CVc_VxgOrXRtop+g@mail.gmail.com/
around what to do with the kthread between napi_disable/napi_enable.
It seems that there was an intention to keep user configuration for
the kthread across NIC configuration change. This patch series extends
the effort to cover more NIC configuration changes. Roughly tracing
through the call hierarchy of napi_del reveals that at least the
following drivers will not preserve the user configurations:
- idpf: idpf_set_channels(), idpf_set_ringparam()
- mlx4: mlx4_en_set_ringparam(), mlx4_en_set_rxfh(),
  mlx4_en_setchannels()
- bnx2: bnx2_set_ringparam(), bnx2_set_channels(), bnx2_change_mtu()
- gve: gve_set_channels(), gve_set_ringparam()
- ena2: ena_set_ringparam(), ena_set_channels()
- fbnic: fbnic_set_ringparam()
- (non exhaustive)

These drivers destroy and recreate queues during configuration
changes. If a NAPI was threaded before destruction, during the
creation, a new kthread will be spawned for the NAPI.

Some drivers do not have this problem, e.g. netdevsim. But these
drivers and the drivers mentioned above will still lose kthread
during link flap (ndo_stop/ndo_open).

Because the kthreads before and after these configuration changes are
different, all the attributes associated with the kthread are lost.
These include CPU mask, priority, scheduler policy, etc.. If the
threaded state is preserved for a NAPI, it makes sense to want to
preserve the attributes of the thread as well.

---
Changes since RFC v1: https://lore.kernel.org/netdev/20260612173644.380972-1-tanshuhao@google.com/
  - Refactor to get rid of RCU usage
  - Treat napi_config as a mirror during the lifetime of napi

Link: https://lore.kernel.org/netdev/20260612173644.380972-1-tanshuhao@google.com/
Link: https://lore.kernel.org/CAAywjhR0TPKZ-xzqjSP709OVmZWUisDNv2CVc_VxgOrXRtop+g@mail.gmail.com/

Shuhao Tan (2):
  net: Save kthread of threaded NAPI in napi_config and restore it when
    trying to create a new kthread.
  selftests: net: Add kthread preserving test in napi_threaded and
    busy_poll_test

 include/linux/netdevice.h                     |  12 ++
 net/core/dev.c                                | 106 ++++++++++++++----
 .../selftests/drivers/net/napi_threaded.py    |  41 ++++++-
 tools/testing/selftests/net/busy_poll_test.sh |  24 ++++
 4 files changed, 163 insertions(+), 20 deletions(-)

-- 
2.55.0.rc0.799.gd6f94ed593-goog

