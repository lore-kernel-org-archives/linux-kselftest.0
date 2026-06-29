Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5A4E13E7BB1
	for <linux-kselftest@vger.kernel.org>; Mon, 29 Jun 2026 15:11:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782745888; cv=none; b=g67kihk7oYKtFspllzgq7oNKTE1RmR+uZucXJ6cw2w3sVRmOIqhFapkK5L0UCPQbvCgXiGiBuQVlyt2oipST66fQbDXZjE5sCPeRtRc/cULJB+TE6Ypc6Gic3VSEr92wuqRPHSKwT33k5GtnYf0Gnac5dnirTZQ/4wzjb5rSvHA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782745888; c=relaxed/simple;
	bh=kwaiQeiaucp2MfWzIUzd2lPMc574qsl6ASwsK3f6icc=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:Message-ID:
	 MIME-Version:Content-Type; b=TXjuLvRtJR9qchwySfoVl9YD4Tj+gLhxCEl9d7trDJ/cVpuRLFQFTHqA2CIt4q9dfTJx36kBDns1ov/GegsGKt2bLhVYW2454YtJdAxwDgRBL1a0erK8usUuaJ/P0aToSfi9pHPWPdUkEr+s4THPUMHhEPddu2rllvs5JYBdjRg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=hQVzeuex; dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.b=fmWbW2qm; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="hQVzeuex";
	dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.b="fmWbW2qm"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1782745886;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=Vx2gFMGxt4RZNuZum2PFhzOqoj2Qwg57W9rcXYdQKuQ=;
	b=hQVzeuexKUy7qTYbhoTW+Ui2bsi8/DaGNVfUL6k3CGrw+IgfIhWcgaMJ0uxaRfO4jhz36A
	kPAR35Eb/KHqd5igGF8FisHnFlOiFG96cZpCkJB/qtXOyCX156dCUdTclQZNaV4DQuoEl7
	49SHkQqxqIooadth+e6DCr7oqKwSBOg=
Received: from mail-ed1-f71.google.com (mail-ed1-f71.google.com
 [209.85.208.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-684-KC6O854EOeSWYEsjdEmNww-1; Mon, 29 Jun 2026 11:11:23 -0400
X-MC-Unique: KC6O854EOeSWYEsjdEmNww-1
X-Mimecast-MFC-AGG-ID: KC6O854EOeSWYEsjdEmNww_1782745882
Received: by mail-ed1-f71.google.com with SMTP id 4fb4d7f45d1cf-695f710d929so2610941a12.2
        for <linux-kselftest@vger.kernel.org>; Mon, 29 Jun 2026 08:11:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=redhat.com; s=google; t=1782745882; x=1783350682; darn=vger.kernel.org;
        h=mime-version:message-id:date:references:in-reply-to:subject:cc:to
         :from:from:to:cc:subject:date:message-id:reply-to;
        bh=Vx2gFMGxt4RZNuZum2PFhzOqoj2Qwg57W9rcXYdQKuQ=;
        b=fmWbW2qmY+wuyXZUAjxj+eVFCXxyOHCKAV+g0+A/zw66IC83GUqwlVq7JhRNjiGPhZ
         7u01ztZ+06WmPsIPyBdmq57FURBeXLojLnT/86t1A0Vfh9EMyVMCv3JP5sWf+mdczlrs
         1srCCHSWG+3Dpn3D8+l4Pv+/igi3s58Fg/4jUP/taU454btkq/hWzV5hO7T8IMKavC9d
         AmpTEEP4FDV27zD/tVaW8ElRl0moijDU2gghNWmG1bJnBtP9ROxldqe/e1/mHE/V5KaP
         F/iApMdQRRi8pF6ianKVGbk5lH46NJnwEE3gt9eIAXpNek9ZL5td5GzIscvy1m42JtGr
         BUrQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782745882; x=1783350682;
        h=mime-version:message-id:date:references:in-reply-to:subject:cc:to
         :from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Vx2gFMGxt4RZNuZum2PFhzOqoj2Qwg57W9rcXYdQKuQ=;
        b=D2Zh6iKfBpK3rBBSPzFcbVu2O65MtjAolTPirA7KNUYmVFxXlodJxi8UFyhG3AiZpx
         WbG7yVpDrCsa9BUOidKAgwR/K/b1e8ZDtwuCe1V4eQ8xK6FBtn+Co+62BGr3tUwHsuTO
         UUxJAcWXjrTfx8IsoYRMumd3Nsqplczn9PpLF6lY7CNnQsisexFLpkLK/X2c3uoLDLd5
         Lb7e6VZ8xdFxO4GBso260UEF2K+b7p5tiU4WK5ahp0ba0J/73S+AU9sqwUcEUo5nVu0G
         qNi72BN+2X1HxIpK6Rp7OAonom9W63L1FhxKzrUAHc5mFFs/bGvZsVDj+YDSDE6rvoPM
         f2CA==
X-Forwarded-Encrypted: i=1; AHgh+Roqo6TtsiIv3gi7tu4jHSEb45vE0wI8ery3tbSILxSJQZVwq/J0AgOQelZ4v0lg9q9VR6kVGixn0oYTWdqWeJY=@vger.kernel.org
X-Gm-Message-State: AOJu0YxphqOIWuoBlHh2m/WX7AvzCcgxsfT3ODSgAw2QbQ3cc5wrekZZ
	uDlhzW2e3VsD97LL4uB2+XbIR2NXvHI/gGIlrhOhNNojqj6gJNSCd+J8HuP7/G0KEonoL/DsDU7
	mgE3OMurNK6ACFA1hCLyKGksQH6gm4Nw5a9kRIY4ZOwhmrd15zJAyRyumcmt9U2aj/7nYYA==
X-Gm-Gg: AfdE7cnrmoD1l9vjAUcapeE5wXd8vLudt8q7Wo3HmvgLhJp4Eq6tPSXm0GGBahL4De9
	LdTnHIDlcZSwWLGmDpWiDTEtpQp8nl5fXeKpI/I3mh8xMJaaLSS0B3NBUGR1DuojIvJUthZ8K9i
	lDgsZYmiHcNWR3J8m17lvwNXyhm0Wx+jbJyYqRq9QmcbHGfb+tojGQo53HoflmniBC1CwDn83mW
	zVXhvNRj3hBZcMiyptDl44QAfnUWSVR9FNFgg5NQI+Ml0mtKNrxWvKTnaGiuoRcud1Z//I/s8AU
	APL907Gb4IVS3qOw1M4lxv/Dma9dQ4p4lASNpMqGj2sZzrRuJmuJeuyU/+jzxkH1ejxBeQqMdYb
	jZFSZGbI4C9RLyweXpAVnveRMFr6E54jDeaY=
X-Received: by 2002:a05:6402:34c6:b0:697:dc26:340c with SMTP id 4fb4d7f45d1cf-69810a74f3dmr6670259a12.12.1782745881804;
        Mon, 29 Jun 2026 08:11:21 -0700 (PDT)
X-Received: by 2002:a05:6402:34c6:b0:697:dc26:340c with SMTP id 4fb4d7f45d1cf-69810a74f3dmr6670232a12.12.1782745881369;
        Mon, 29 Jun 2026 08:11:21 -0700 (PDT)
Received: from alrua-x1.borgediget.toke.dk ([45.145.92.2])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-69847322ef9sm3693279a12.5.2026.06.29.08.11.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 29 Jun 2026 08:11:20 -0700 (PDT)
Received: by alrua-x1.borgediget.toke.dk (Postfix, from userid 1000)
	id E3E7780A269; Mon, 29 Jun 2026 17:11:19 +0200 (CEST)
From: Toke =?utf-8?Q?H=C3=B8iland-J=C3=B8rgensen?= <toke@redhat.com>
To: Avinash Duduskar <avinash.duduskar@gmail.com>, ast@kernel.org,
 daniel@iogearbox.net, andrii@kernel.org
Cc: eddyz87@gmail.com, memxor@gmail.com, martin.lau@linux.dev,
 song@kernel.org, yonghong.song@linux.dev, jolsa@kernel.org,
 emil@etsalapatis.com, john.fastabend@gmail.com, sdf@fomichev.me,
 davem@davemloft.net, edumazet@google.com, kuba@kernel.org,
 pabeni@redhat.com, horms@kernel.org, shuah@kernel.org, hawk@kernel.org,
 yatsenko@meta.com, leon.hwang@linux.dev, kpsingh@kernel.org,
 a.s.protopopov@gmail.com, ameryhung@gmail.com, rongtao@cestc.cn,
 eyal.birger@gmail.com, bpf@vger.kernel.org, netdev@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-kselftest@vger.kernel.org,
 dsahern@kernel.org
Subject: Re: [PATCH bpf-next v5 1/3] bpf: Add BPF_FIB_LOOKUP_VLAN flag to
 bpf_fib_lookup() helper
In-Reply-To: <20260624115442.4112419-1-avinash.duduskar@gmail.com>
References: <20260624030530.3342884-1-avinash.duduskar@gmail.com>
 <20260624030530.3342884-2-avinash.duduskar@gmail.com>
 <87pl1gcmgf.fsf@toke.dk>
 <20260624115442.4112419-1-avinash.duduskar@gmail.com>
X-Clacks-Overhead: GNU Terry Pratchett
Date: Mon, 29 Jun 2026 17:11:19 +0200
Message-ID: <87pl19bcvc.fsf@toke.dk>
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain

Avinash Duduskar <avinash.duduskar@gmail.com> writes:

>> > +	if (flags & BPF_FIB_LOOKUP_VLAN)
>> > +		return -EINVAL;
>> > +
>>
>> This is fine, but we should probably reject the input flag as well in
>> the next patch (for symmetry).
>
> I dug into this and I don't think the two are symmetric. The egress
> reject is right for exactly the reason you gave: in tc you can redirect
> to the VLAN device directly, so reducing the egress to the physical
> parent is only needed for XDP. But that is a transmit argument, and
> VLAN_INPUT never touches the egress or redirect side. It only sets the
> lookup's ingress (flowi_iif), which picks the iif policy rule and the VRF
> table, and there is no XDP-only constraint there for the symmetry to
> mirror.
>
> tc also has a real user for it. In __netif_receive_skb_core() the tcx
> ingress hook runs before vlan_do_receive() demuxes the frame, so a clsact
> program on the physical port sees a tagged frame with skb->dev still the
> physical device and the tag in skb->vlan_tci. That is exactly the
> physical-ifindex-plus-tag input VLAN_INPUT takes, and it wants the
> subinterface-scoped answer. The 2/3 selftest already runs the VLAN_INPUT
> cases on the tc path, including the VRF-table-selection ones, and they
> pass, so this isn't a theoretical tc path.
>
> So I would keep VLAN_INPUT allowed on both. If you would rather hold a
> uniform "both VLAN flags are XDP-only" line under the same
> restrict-now-relax-later rule as the TBID and OUTPUT combos, I will add
> the reject, but unlike the egress case it removes a working tc path
> rather than one tc cannot use. Happy either way, just let me know.

Hmm, OK, I'm fine with keeping it available for TC then.

-Toke

