Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C051135C6B9
	for <linux-kselftest@vger.kernel.org>; Thu,  1 Oct 2026 11:45:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790855153; cv=none; b=FdWfdOLrhAgzv7+nDJgATZEZXJZyNQ4L9ljrZFlkw7DWhud8+iOvnHqrRJzpTY0CbJFP7IijXdHE7Py8gem9V5PkfyhzanmPZo5Tu5CmN1b/LTfixUFr3B8pHFwgAnx/6L7LnooTJTkD6EkC4UWofq8nO8Q0uIib+ePO3s1Ox18=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790855153; c=relaxed/simple;
	bh=BFT937ZpdM34J9PwVju7/yLS28Bo5/2Q+X4eLCQB59c=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=REDU3XOGJLgxKalC6DYqrozA2DThyCRkN/cASC65HNM9PjV1v4aup44In0I0RlLDNIfDpAOMrVfexaZe/awFU+46yF8Il0zHFgztg6uNi/NwQUhcl4EtB4F0sOzI08j98oLo+m/0xQy/YqEl8yD7+5eQs1ertPOyyoVyGgqFFeM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=ImStY7tK; dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.b=jUkmMJLL; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="ImStY7tK";
	dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.b="jUkmMJLL"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1790855139;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=DXvxeQkPqG5Nev8eHBMp9agYe789sbTvcF7+Hpom1i4=;
	b=ImStY7tK+v2OSMjxemHyEBM/0UTI36Qya1sF1tX3BkuHL8t5RzYzjEP7D4IrN3t/k2paVI
	CRgrC07F15A30dvHjRlCxKOLx03WWtu8LKp33gCVlBiOHcQsS7Jq+rgTtaoz/F60dyc9Ts
	rjkQJ6Tk6qFx8v18eTl79eG+iaZwB54=
Received: from mail-ej1-f69.google.com (mail-ej1-f69.google.com
 [209.85.218.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-68-a7jSkdVOOb2OiuTCVj3fJg-1; Thu, 01 Oct 2026 07:45:38 -0400
X-MC-Unique: a7jSkdVOOb2OiuTCVj3fJg-1
X-Mimecast-MFC-AGG-ID: a7jSkdVOOb2OiuTCVj3fJg_1790855137
Received: by mail-ej1-f69.google.com with SMTP id a640c23a62f3a-c2d93b92937so454082866b.1
        for <linux-kselftest@vger.kernel.org>; Thu, 01 Oct 2026 04:45:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=redhat.com; s=google; t=1790855137; x=1791459937; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=DXvxeQkPqG5Nev8eHBMp9agYe789sbTvcF7+Hpom1i4=;
        b=jUkmMJLLZeXuK16avpTiQ/AjbPTH3Uy1b2Ktw9r89fJLK/UwqXa4fOzi5jfg/Y5AaJ
         pGFtlj1sIozRlsLoUfZtCdOp02GrnDBE9TZJA+FcxYRcl1g8I8zlGl6X+0lWJZMs0pt1
         /668agDxL/itpACEh/nbk1SBWg+P1HLL10QQQZq+6VlKEKMbBqIw+rK5FvsnTjwPFiOe
         klL9quBJRxagZYjXKK9PbRvCEhbxZoYpAwlvLyPUQM3pk98LQv9cj8r+LyljrZAuhLhI
         Mz1NsbAfzKO5f7J1FpCWAMbl+BvGSNC310XVkc+Tow+btyoMhkXjD0Yu/QSNW3b4vZbV
         K16A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790855137; x=1791459937;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=DXvxeQkPqG5Nev8eHBMp9agYe789sbTvcF7+Hpom1i4=;
        b=2ItAGAQ8r244ZhhDbHqPAVTVMa2ruINAXMGs8NCMkVYE93cm27E76y7fXn60h7A+0T
         9XwJ/8Zr0vZwkKekTRSCcriZjkAUI6eLP9FnG1+LSasxw/ICYSGlRB1xw1YiOcUt0eDM
         HY7rsNObEzLRDaVH7Ju3IOqp3wJoMV2R8ysUg4amth+qewF33ktgTpSjYs1XDJZX1kG8
         1SjRMb6MwHEIxaQY8rhxfZERSPjDS4nBBeNNjI5ktW1FEvtRA8d7He7SBHcSyYSM8uA3
         DqdAvLU+iI92baIOweexwKOvOQQFZDfAZExGNCaSIrjrh2bPeu9OBKb4XsixXkJHPXsZ
         nkcw==
X-Forwarded-Encrypted: i=1; AKwUvBxT5aeN1iYkmdK7FiDzHOGqtpOz2cfLLnGjkyssV9J/IGrJWUSFh6UgNqDepbis8Oja9f4wy5NC9yoK7GDT1IY=@vger.kernel.org
X-Gm-Message-State: AFuF++mbgAKhldSju25sIVoO0THwBt/WQDGh3W7QRUbxwiQ0W2A2mn8Z
	Zfwd8VtiQOjh23x5RXqzeFDgxPSZc7MfUjK/FsH8+G1AF6wt1kDLqq4C8u/JijrD02CaYZJsrZO
	phM/jlZi8UgCEXY8nK36DjFT76zLBiwpyGjquPfbA7aj4LHfRQAQHWCKaTwuY7q2fdWcpfQ==
X-Gm-Gg: AYBFou01UxFrmt6LIcBzUzbZUIPykBDimA5lcopSSls+bFLJaiM/gKBZVr3ZnIq3NN0
	zzz12J+5aH6OdhvPKvnSsoxiPVrdJ1NXrvM4TaAgGBV5vFSOlqp65Zgzu9nMM04xK/ipi5UflxT
	iFBmJr+MyO1V0JbtXNWM4XGzzAFYDR+DF+zd+O0OVwfxCWBVjepBxuyywAe96yz0/78Qw7nWby8
	OnIJQPugpHvtsisz3iE7vsYcYzO1wVvnxcl6mYLoZxJV25lNuFdGnsAV3Un8LhBxhnw24SdCYdd
	QNnyyj1nY+1G0Tt1d0FSnrS9bDFlg0Qr1vTKxsiHmeHKKYxXtchrYsiMMQheZH9Tnxak4MVcKd3
	bl0emR9fofVj083yMqlV17ScwG83wuW6SuZuJJO6fFNzSpvIQ/+RSZzOz8dHuS8RnWwkpbAKCGQ
	==
X-Received: by 2002:a17:906:478e:b0:c25:2a78:15ed with SMTP id a640c23a62f3a-c2e2376115emr403163566b.6.1790855136808;
        Thu, 01 Oct 2026 04:45:36 -0700 (PDT)
X-Received: by 2002:a17:906:478e:b0:c25:2a78:15ed with SMTP id a640c23a62f3a-c2e2376115emr403159266b.6.1790855136230;
        Thu, 01 Oct 2026 04:45:36 -0700 (PDT)
Received: from [192.168.188.234] (ip232-47-231-195.pool-bba.aruba.it. [195.231.47.232])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c2e31dd955bsm139895666b.70.2026.10.01.04.45.35
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 01 Oct 2026 04:45:35 -0700 (PDT)
Message-ID: <7913b40f-f7d2-41ec-acb2-1edc7f2b833c@redhat.com>
Date: Thu, 1 Oct 2026 13:45:34 +0200
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH net-next v3 0/6] vxlan: vnifilter: bound a single request
 and account per-VNI memory
To: Ali Firas <alishmery18@gmail.com>, netdev@vger.kernel.org,
 idosch@nvidia.com
Cc: kuba@kernel.org, davem@davemloft.net, edumazet@google.com,
 andrew+netdev@lunn.ch, horms@kernel.org, razor@blackwall.org,
 roopa@nvidia.com, shuah@kernel.org, linux-kselftest@vger.kernel.org,
 linux-kernel@vger.kernel.org
References: <20260927215209.2581830-1-alishmery18@gmail.com>
Content-Language: en-US
From: Paolo Abeni <pabeni@redhat.com>
In-Reply-To: <20260927215209.2581830-1-alishmery18@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 9/27/26 23:52, Ali Firas wrote:
> The VNI filter interface accepts a START/END range with no bound on
> either endpoint and no bound on how many VNIs one message may ask for,
> and the memory it allocates per VNI is not charged to the caller's
> cgroup.
> 
> Since v2, Jakub asked that the VXLAN_VNIFILTER_ENTRY nest be linked to
> its policy with NLA_POLICY_NESTED() as patch 1:
> 
>    https://lore.kernel.org/netdev/20260921150904.65a704eb@kernel.org/
> 
> Patch 1 does that. Without it the entry attributes were validated only
> as each entry was dispatched, so a multi-entry message whose later
> entry was invalid had the earlier entries applied and notified before
> the message was rejected. With the nest linked the whole message is
> validated up front and a bad entry rejects the message as a unit and
> installs nothing.
> 
> Patches 2 and 3 bound a single request: patch 2 range-validates both
> endpoints to the 24-bit VNI space, and patch 3 caps the number of VNIs
> one request may add or delete, summed over its entries, at 4096. Both
> add and delete walk the span one VNI at a time under rtnl_lock, so both
> are bounded; that walk is the cost, not the memory.
> 
> Patch 4 clamps the dump. vxlan_vnifilter_dump_dev() coalesces a
> contiguous run with no bound, so a device populated by several requests
> could dump a single entry that patch 3 then refuses on replay. Patch 4
> clamps the merged run to the same limit, so dump output is always
> re-enterable; the selftest installs more than the limit, dumps it, and
> replays what the dump reported.
> 
> Patch 5 charges the per-VNI node and its per-CPU stats block to the
> cgroup of the task that created the VNI, so the memory a device grows one
> VNI at a time is accounted the way the device's own queues, ethtool
> state and NAPI config already are (commit c948f51c1654 ("memcg: enable
> accounting for net_device and Tx/Rx queues")).
> 
> Patch 6 adds the selftests.
> 
> The cap is symmetric, applied to add and delete alike, which is what
> Ido asked for when he agreed to a 4k limit. Patch 4 is what makes that
> safe: because the dump is clamped to the same constant, the kernel never
> reports a contiguous run that its own input path would reject, so a
> device holding more than 4096 VNIs can still be torn down by replaying
> what "bridge vni show" reports. Device teardown itself
> (vxlan_vnigroup_uninit()) is not a netlink message and is not subject to
> the cap.
> 
> uAPI changes, all of them:
> 
>    - a VNI at or above 2^24, previously accepted and stored (and
>      truncated on the wire), is now rejected with -ERANGE;
>    - a single request asking to add or delete more than 4096 VNIs, summed
>      over its entries, is now rejected with -EINVAL -- "bridge vni add
>      dev X vni 1-10000" used to be accepted;
>    - a request rejected by the entry policy, aimed at a missing or
>      non-vnifilter device, now returns that policy error rather than
>      -ENODEV or -EOPNOTSUPP, because the nest is validated before the
>      device is resolved (patch 1);
>    - "bridge vni show" now splits a contiguous run longer than the limit
>      into several entries instead of one (patch 4); the set of VNIs it
>      reports is unchanged.
> 
> This is a policy and hardening change, not a fix for a crash or
> corruption; it targets net-next and should not be backported.
> 
> One pre-existing semantic is worth review: an entry that carries only
> END and no START is treated as the range [0, END], so a lone END near
> the top of the space is a whole-space request that the cap now rejects;
> whether END-without-START should mean that is left as an open question.
> 
> Not addressed here:
> 
>    - vxlan_vni_add_del() still leaves the earlier VNIs of a range
>      installed if an allocation fails partway through it; with the cap
>      that is now bounded to fewer than 4096 VNIs. A fix needs a
>      transaction and overlaps a separate rollback change, so it is left
>      out.
>    - a lone VNI 0 dumps as a START-only entry the input path refuses
>      ("vni start nor end found"), and a stats dump carries per-entry
>      stats the input path refuses; both predate this series and are
>      unrelated to the limit.

Sashiko complain WRT partial accounting of patch 5/6 looks legit.

Also it would make sense to reword a bit the commit message of patch 1 and
2 to reflect the above.

/P

