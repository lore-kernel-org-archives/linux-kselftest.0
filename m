Received: from mail-wm1-f45.google.com (mail-wm1-f45.google.com [209.85.128.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3F2172EC090
	for <linux-kselftest@vger.kernel.org>; Thu, 27 Aug 2026 12:35:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787834130; cv=none; b=jPMDkyG0/tFjV167vTCgQ3cWG+2ol1/vh4gEQbwN83kY0U9m2lL5EQuqepj9awZNQDkqn5SIIeVEqKRb3Kfu6NdjW1+CkzrhDZBAmFaGhiUDzVpVAxpC/bHyusEGcIm8ALS+VJ3sMHZPNoi8AoJEkFKz2zUr+3xMOh4JSXljxyw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787834130; c=relaxed/simple;
	bh=bmbiqdOCeZle1t8GhFHFgUaBjsvNdWoT+bkaG6Qn/FA=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=oiAOopEVkgjRXS9Gnb/+nnmX4F8b6UtVXeGYqHI1MFsXc7lM7QjjVZ48SJmr87RaSNW472cdfNIUQkeMhGOMIvy1mrgUTa9P8gaaYJzxfJfQBtluJVozmyFCZoTjC08S+GF7i9Nh3cWgREIOEkM5RV53eP1UQtaD+9olbil3qTM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=resnulli.us; spf=none smtp.mailfrom=resnulli.us; dkim=pass (2048-bit key) header.d=resnulli-us.20251104.gappssmtp.com header.i=@resnulli-us.20251104.gappssmtp.com header.b=HzxUP10U; arc=none smtp.client-ip=209.85.128.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=resnulli.us
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=resnulli.us
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=resnulli-us.20251104.gappssmtp.com header.i=@resnulli-us.20251104.gappssmtp.com header.b="HzxUP10U"
Received: by mail-wm1-f45.google.com with SMTP id 5b1f17b1804b1-495437bb891so7322075e9.1
        for <linux-kselftest@vger.kernel.org>; Thu, 27 Aug 2026 05:35:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=resnulli-us.20251104.gappssmtp.com; s=20251104; t=1787834122; x=1788438922; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=FqMm8FT0UDvKvnU0PABnBSS+wYbc4aE8U5V+uRrPoww=;
        b=HzxUP10U4ZXwOcdfmkfuv5zV+yOdGKiFym6mZv2T3oNwYEnklHASsNatL0EbZKqqWq
         gagrP5NNJulSlGAXD4Tb5rHjHaLJyeaOiSCe3TXrScW4nklUZ49bOS2gKjVqSj3YnE3Z
         mDXdcYwnUXn4wfpzP7q4svINJvOWkDYUkryc7+JkopFkS87CLWtEkaOnV1rYAyJinLnU
         FvX+OYy4anL7SMmqQOlqWxwI3APBJxLKBztVI5wBGbWXPEGHu4sq0oWbOHAV0K3cbIem
         hRoOxoEN83nXbdie/L3T3pjQf6NDAvNSbSSOSwSwCfiDSWutRzQMBZm1l2n28Y5U8OPN
         /+1g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787834122; x=1788438922;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=FqMm8FT0UDvKvnU0PABnBSS+wYbc4aE8U5V+uRrPoww=;
        b=slX6uI458g+XQjR/oUzq8YsG8CuEHpsf9kPUj0bSueOXZbVyiOURdsA+V9f+VYgZaX
         Hzsp8KljMQP7tuMExVK1Nte8OAYwfGEGK7tEWPpXOY6R4KRc3XLa0VORKORk1QJwfAME
         xxxgCpk4FD6jmAYdZsZiEMFBBueVXiXx79rg9QW9YOUlbgZ+5DP/Qa46od0DE2WcBss2
         OEBfG/dhG+LZ0i1ANDoHXZ9XwB6As0S09JNxgNhWdIBewPhuhOJUNmjJVvISpo3R/4x8
         CxZyB9ud/X1/CX5LpWu4TuxeLPmucO13+uk1t4Ag1X2M8TsH5fJgUM7Hoh6ZxDq30Dzb
         W9LA==
X-Forwarded-Encrypted: i=1; AHgh+Rq6efwsCYTn2rdDIf4BqcVYn2iWDGHiu71SOeaZfr6124uXVtgBVZPPDd5GXKdpwqt+jghkrlg0UMJHTNkByuY=@vger.kernel.org
X-Gm-Message-State: AFuF++mh51Ss1gFcnI00IUc3DEO6MzZtg3CKZGh4hJuQuDY/ULqiY7Jc
	nQKP8C1s4jtb+Ly2auXr1bUAffBYl5JBrKDNEbbWwp0vQcVDl34SakdnqRUuIULKLiM=
X-Gm-Gg: AR+sD12tB7SWnDW/NXTjBXbfkyDJ7q0Z9xNKpPCXwn6k02lUWu06CKu4WmYbpOSHIb7
	YgOZCrK30w02Gq83kAYj6cqwjdtk6S2trwtmgU4a3n0XHtwtSiiC+LKPGGFTLoS8JRdi2phhcYo
	E42QrAO9Zzgx4JvfAlUz4Aa6ahlPY5g5/7DpDtqPTOoW2XEsKn8DpdeH1PfVdK/DwG/kYSrYiQS
	0OgNYQYnYU0+k6SB+XklDR5otqu6LiIZ5CFAnO+Y/WVdKH1gdQRmdsuWZ6UR6/xchTbrPWXQ3JD
	anCd+lfIHgPTOTPUX4rKSGP1g6TMMqg6YiSDS/z/en8NRe2y0SNDyvnpCrgf9lRnvrTafuJsmm5
	c10dE1HRVJ2jRKJ2qF7sA5JtptOQG+1SHkFhF0eN56aXFXnH05ezQUf4DbzavWpocF8R7cIxalW
	Ge8t5fEMYGSK72h522vVzpUAEWLZFPurD565YqP2vRoqdxl72biCR8GHimesgbk+Np3qUKeMPI5
	pG8nZhz
X-Received: by 2002:a05:600c:3e8e:b0:499:5f80:83ac with SMTP id 5b1f17b1804b1-49b0dfd7d2cmr84639315e9.7.1787834121595;
        Thu, 27 Aug 2026 05:35:21 -0700 (PDT)
Received: from localhost ([140.209.217.211])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49b4a940aeasm46658765e9.10.2026.08.27.05.35.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 27 Aug 2026 05:35:21 -0700 (PDT)
Date: Thu, 27 Aug 2026 14:35:16 +0200
From: Jiri Pirko <jiri@resnulli.us>
To: Konstantin Sinyuk <ksinyuk@kernel.org>
Cc: dri-devel@lists.freedesktop.org, 
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, Francois Dugast <francois.dugast@intel.com>, 
	David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
	Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
	Jonathan Corbet <corbet@lwn.net>, Shuah Khan <skhan@linuxfoundation.org>, 
	Donald Hunter <donald.hunter@gmail.com>, Jakub Kicinski <kuba@kernel.org>, 
	"David S. Miller" <davem@davemloft.net>, Eric Dumazet <edumazet@google.com>, 
	Paolo Abeni <pabeni@redhat.com>, Simon Horman <horms@kernel.org>, Ilia Levi <ilia.levi@intel.com>, 
	Rodrigo Vivi <rodrigo.vivi@intel.com>, linux-doc@vger.kernel.org, linux-kselftest@vger.kernel.org, 
	netdev@vger.kernel.org, linux-kernel@vger.kernel.org, jhs@mojatatu.com, jgg@nvidia.com
Subject: Re: [RFC PATCH 0/12] drm/fabric: vendor-neutral topology
 infrastructure for scale-up accelerator interconnects
Message-ID: <apAsfOowcG0cTvT8@FV6GYCPJ69>
References: <cover.1787552412.git.ksinyuk@kernel.org>
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <cover.1787552412.git.ksinyuk@kernel.org>

Mon, Aug 24, 2026 at 10:09:28AM +0200, ksinyuk@kernel.org wrote:

[..]

>Example queries using the in-tree YNL tool are:
>
>    $ ./tools/net/ynl/pyynl/cli.py \
>          --spec Documentation/netlink/specs/drm_fabric.yaml \
>          --dump fabric-get
>    $ ./tools/net/ynl/pyynl/cli.py \
>          --spec Documentation/netlink/specs/drm_fabric.yaml \
>          --dump endpoint-get --json '{"fabric-id": <id>}'
>    $ ./tools/net/ynl/pyynl/cli.py \
>          --spec Documentation/netlink/specs/drm_fabric.yaml \
>          --do port-get --json '{"endpoint-id": <id>, "port-index": 0}'

Using generic netlink instead of sysfs for this makes a lot of sense,
but it may be a bit odd to use it outside the networking area.
I've been struggling with the same in another non-networking use-case
as well. I have been building a framework that keeps the benefits of
generic netlink, extends it and is fd-based.
I call it CTLV, here's a link to an early pre-RFC draft:

https://github.com/jpirko/linux_mlxsw/commits/wip_ctlv_pre_rfc_draft1/

What are the benefits over generic netlink:

- No networking in the dependency chain. No netlink sockets,
  no CAP_NET_ADMIN, and no network namespace semantics to reason about
  for a device that has none.

- One character device per registered instance, not one global family.
  Access control is the file: udev rules, ACLs, an fd passed into
  a container. The open mode decides what is allowed - actions need
  write, queries need read - so there is no permission model
  to reinvent per family.

- Events per open file description, not a multicast group.
  Each descriptor has its own subscriptions and queue, and an overflow
  is reported in-band: the next read returns an event-overflow record
  naming the first and last sequence lost and how many.

- Large payloads are referenced, not copied. A blob attribute carries
  a user VA, a memfd and offset, or a dma-buf fd. Nothing big travels
  through the message.

- One YAML specification, everything generated from it: kernel metadata,
  UAPI headers, userspace bindings and the reference documentation.
  Introspectio. is answered out of the same metadata the validator
  enforces, so a device cannot advertise an operation it will refuse.
  A checked-in ABI snapshot makes any wire change a reviewable diff.

- Family inheritance. A family inherits another's operations and fills
  declared extension points. The effective schema is resolved per
  device and the chain is exposed to user. A shared core with
  per-driver extensions is declared once, and both attributes and
  operations can be extended.

- Introspection is per-device and live. The framework answers three
  queries on every device: the family chain, one entry per published
  operation, and any operation's full attribute tree with its bounds
  and limits.

  The answer is what this device accepts right now, including what
  a vendor extension added to an inherited operation and whether an op
  is currently disabled, and op-changed events carry the generation
  ops-dump reports, so a dump can be ordered against a change.
  GETFAMILY and GETPOLICY describe a family statically - there is
  no device in that model to ask.

- Fragmented queries are built in, with a consistency check.
  A continuation carries the generation it started from, and if
  the answer changed underneath it is refused with ESTALE,
  reporting the expected and the current generation instead of
  reassembling a torn reply.

- Attributes are 8-byte aligned. CTLV_ALIGNTO is 8, so
  a 64-bit payload is naturally aligned and there is no per-family
  padding to remember - netlink's 4-byte alignment is why
  nla_put_64bit() needs an explicit NOP pad attribute.

- Cheaper round trip. A one-attribute query measured 2.6x cheaper
  than a genetlink one in the same guest - a debug kernel.

- Async operations using io_uring are planned as a follow-up extension.

The framework owns validation, schema resolution, blob acquisition,
reply serialization and the event queues. All getters and putters
are generated helpers. A family implements semantics only, and
the aim is to make that hard to get wrong.

Would this make sense to use for you?

[..]
