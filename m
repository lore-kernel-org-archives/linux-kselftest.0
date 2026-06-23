Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 17C713D523F
	for <linux-kselftest@vger.kernel.org>; Tue, 23 Jun 2026 12:00:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782216053; cv=none; b=jf5mQ1HGE2J0qeqsduMXOYahkwIi6zeRGh1CmjW9MXdhlhzFdYJpr64YUPvYtYN8auM92624yypkGP7njR4Blist4u1rJEDzrWU9YoD2dfTOQNcGSLxMblpejQztUVJbFCi7bdUGB5t+92Vb5ewokaTayeOY5tlQhTPRZ7FBq3c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782216053; c=relaxed/simple;
	bh=fD1ssBHumg0Z/KRB6UvyA2t+hWd2u9qcEbBZhmVSYkE=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:Message-ID:
	 MIME-Version:Content-Type; b=PCuJOju0/7ujd2jpextOsTG1JCvi5pRBV74VHkFId3NJq0e216UQWuZ94RVYEzPzEDvZ60vibFl1ups6/E236FLIp9THr0QiSeutdhJZBoJKD8rC8OXih23QAXXr6C5KUP9Hy59V4DS9yfPcmWQDUWcncKJCp9n/n/n+RhD3wpA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=h7AEYe7U; dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.b=hXNkHfPw; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="h7AEYe7U";
	dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.b="hXNkHfPw"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1782216051;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=fD1ssBHumg0Z/KRB6UvyA2t+hWd2u9qcEbBZhmVSYkE=;
	b=h7AEYe7Udgvqqa80+rOwiPsORBtVDPSaLIeMgy7mSskTzQWGy5xFnB4kUQspDWeJHuh+er
	VcJfr7xWHwU2RJuobmQOz1BjU+qIJMS718qymXaPamTFeLBniXpzQP0mne9rMpH5oGdTB5
	J/j4yOk377cznwUp6kPQ5qdwiwlwT7I=
Received: from mail-wr1-f69.google.com (mail-wr1-f69.google.com
 [209.85.221.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-331-YS4Wi9gUP7WhS0Uwrj2c7g-1; Tue, 23 Jun 2026 08:00:49 -0400
X-MC-Unique: YS4Wi9gUP7WhS0Uwrj2c7g-1
X-Mimecast-MFC-AGG-ID: YS4Wi9gUP7WhS0Uwrj2c7g_1782216048
Received: by mail-wr1-f69.google.com with SMTP id ffacd0b85a97d-46ab0ea1f72so630440f8f.3
        for <linux-kselftest@vger.kernel.org>; Tue, 23 Jun 2026 05:00:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=redhat.com; s=google; t=1782216048; x=1782820848; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:references
         :in-reply-to:subject:cc:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=fD1ssBHumg0Z/KRB6UvyA2t+hWd2u9qcEbBZhmVSYkE=;
        b=hXNkHfPwhev9JdbxkV+JsG0fBqn29LCm85K+2kUKCzPyiHNmyzalmI+PKnN+k4Qbw8
         1wXIguD623gYcPhe+UScZ7jvJD8wMC4kvrMVvJYvhM+LFnn2uNvgml7EmSK7IrmhfRVF
         iR5XRaxn/nhCmwZg6CfduMgAk/nYI0PD6hcTdro4F3qvrZC1RrEoF58jz6Dkqb4cwxLR
         4tc7ELQZmXYVp81ZaRaDGgZQ4bfAlQG9If9YGZH6dz2NXxLl6c2r+FhTTkadOl4bU5gG
         eFdJNvPFBePuOEuNKpVwSRb2hIbdnIxHDzVrl7ullygc9A3DDsqy9wcCcTtsdRppnUNz
         cBnw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782216048; x=1782820848;
        h=content-transfer-encoding:mime-version:message-id:date:references
         :in-reply-to:subject:cc:to:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=fD1ssBHumg0Z/KRB6UvyA2t+hWd2u9qcEbBZhmVSYkE=;
        b=hrwZ2P7uG+s0ABwJrWDOkYNmpvLKvMwrEk4XMTiZSp8jMFAqUaGBcVA6RBd2OrP2vs
         VYMzq02VPEes78QkMAGachfOVAyDtVasRSe0QOSF95tvoR8LykHi2EPlOVbpX1iPm8/6
         TEI06v5FGWMixiGhhBX3QwaOE50EPMffY4RT7iB8JgyxkhliQ4dzCRVFp28NhOUVOSzW
         ON9Djk1+YWMiOqdmICHxnJ7ZZgUl+Kf7XOaB1TCFSHOT/Wn5+OiVLNtZviaCmAHLU7hC
         bRQ+h6GNcl2VKb3uGhT4q6YhhxdSIiM+5SVCynMMsNvV5OtvchXhgbdNZ+mOtH0GL3uP
         7rcg==
X-Forwarded-Encrypted: i=1; AFNElJ9esljESOHNer95RJmRl+WZhIqfWKPowdCW0+DszVNrQ54T2YvCci32WN0aIvjknoH8A/3AwYHxSxFNYp+tFow=@vger.kernel.org
X-Gm-Message-State: AOJu0Yxt4gZ5YB5ZJkybFp3Y8qy2QJz6t6q/j2zopLaC+zGHD+Q1HG6Q
	CA/8PeLbroTNRXmTfDlpLAXEyMLAXM68CKmetLcvHTYxzvwjDNpMhPdd/71NWYCqeVEqDl/FjKi
	k3xxMmF3xrWwcW7ekfDTvxgC9K/EoVcsCCbCAc/qlmXajpzC2GRsKBm5yb8Z7CoJ+zCW//w==
X-Gm-Gg: AfdE7cllQdAfPqdbzVTHHzI4M5ivmYVSy17STsPSYYVoscMFSc4L3smvhIBLGH5qvAJ
	oT6gSYVMFQxFkvM9sX/Xa/1LFVcZH5cX5GX4gzzvwxbFcan/l/sp8Rzcj7SQ7EgRMUy9yQXpDkP
	ef4Ndn6GXrnCnKs+Kq+lp+6dxGtyngwkl5044rlU7FMtbU84rgRZMiBuAzKRBqWX/6po17Vaf5W
	CnYQcv8pItbTdefXT1NpOHhw4m//pHV2rRoskfzC0ZQzKS83ln3Z5OHAgGwaEWwP950s+yJiMhy
	VzazDNkeCjMOE/p5MUyAiTMixUuLgUXH/WnjtTalRiLImctOymo6X+Gdjx1v5zWqOeCl3j8y0I7
	hZWB5xAQkTwfu0JuUZQLx46aURXcmEkHVCbk=
X-Received: by 2002:a7b:cb56:0:b0:490:b65f:8b1 with SMTP id 5b1f17b1804b1-49240e22ed1mr202516405e9.5.1782216047225;
        Tue, 23 Jun 2026 05:00:47 -0700 (PDT)
X-Received: by 2002:a7b:cb56:0:b0:490:b65f:8b1 with SMTP id 5b1f17b1804b1-49240e22ed1mr202515915e9.5.1782216046755;
        Tue, 23 Jun 2026 05:00:46 -0700 (PDT)
Received: from alrua-x1.borgediget.toke.dk ([45.145.92.2])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4924944fb71sm273200945e9.14.2026.06.23.05.00.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 23 Jun 2026 05:00:45 -0700 (PDT)
Received: by alrua-x1.borgediget.toke.dk (Postfix, from userid 1000)
	id 5BC60808C88; Tue, 23 Jun 2026 14:00:44 +0200 (CEST)
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
Subject: Re: [PATCH bpf-next v4 2/3] bpf: Add BPF_FIB_LOOKUP_VLAN_INPUT flag
 to bpf_fib_lookup() helper
In-Reply-To: <20260623025147.1001664-3-avinash.duduskar@gmail.com>
References: <20260623025147.1001664-1-avinash.duduskar@gmail.com>
 <20260623025147.1001664-3-avinash.duduskar@gmail.com>
X-Clacks-Overhead: GNU Terry Pratchett
Date: Tue, 23 Jun 2026 14:00:44 +0200
Message-ID: <874iiteaab.fsf@toke.dk>
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable

Avinash Duduskar <avinash.duduskar@gmail.com> writes:

> BPF_FIB_LOOKUP_VLAN resolves a VLAN egress. The reverse is also
> useful: an XDP program receiving a VLAN-tagged frame on a physical
> device wants the lookup to behave as if the packet had arrived on the
> corresponding VLAN subinterface, so iif-based policy routing and VRF
> table selection use the right ingress.
>
> Add BPF_FIB_LOOKUP_VLAN_INPUT. When set, params->h_vlan_proto and
> params->h_vlan_TCI are read as an input VLAN tag and the matching VLAN
> device of params->ifindex is resolved with __vlan_find_dev_deep_rcu().
> The device must be up and in the same network namespace as
> params->ifindex (a VLAN device can be moved to another netns while
> registered on its parent; receive would deliver into that other
> namespace, which a lookup here cannot represent). If params->ifindex
> is itself a VLAN device, its inner (QinQ) subinterface is matched.
> For a bond or team, a tag on a port matches no device and returns
> NOT_FWDED; pass the master's ifindex.
> The lookup then runs with the resolved device as the ingress;
> params->ifindex itself is not modified on the input side. When the
> resolved device is enslaved to a VRF, both the full lookup (via the
> l3mdev rule) and BPF_FIB_LOOKUP_DIRECT (via l3mdev_fib_table_rcu())
> select the VRF's table from the resolved ingress. That follows from
> feeding the resolved device to the flow as the ingress
> (fl4.flowi4_iif =3D dev->ifindex), which is what makes l3mdev resolve
> the VRF master from the subinterface rather than from
> params->ifindex.
>
> The two failure classes get different treatment on purpose. A
> h_vlan_proto other than 802.1Q/802.1ad is API misuse and returns
> -EINVAL, since it would otherwise reach the WARN in vlan_proto_idx()
> with a program-controlled value. An unmatched VID, a device that is
> down, or one in another namespace is a data outcome and returns
> BPF_FIB_LKUP_RET_NOT_FWDED, matching the DIRECT path when
> fib_get_table() finds no table and mirroring real ingress, where the
> receive path drops such frames. A VID of 0 (a priority tag) is looked
> up literally and normally fails the same way; receive instead
> processes such frames untagged, so callers should not set the flag for
> priority tags. Proceeding on the physical device for any of these
> would be fail-open for the policy-routing cases above.
>
> The h_vlan fields share a union with tbid, so the flag cannot be
> combined with BPF_FIB_LOOKUP_TBID. It describes ingress, so it also
> cannot be combined with BPF_FIB_LOOKUP_OUTPUT. Both combinations
> return -EINVAL; restricting now keeps a later relaxation backward
> compatible. Combining with BPF_FIB_LOOKUP_VLAN is allowed: the tag is
> consumed on the ingress side and the egress tag is written on
> success.
>
> Under !CONFIG_VLAN_8021Q the __vlan_find_dev_deep_rcu() stub returns
> NULL, so every lookup with the flag returns NOT_FWDED, which is
> correct since no VLAN device can exist.
>
> Suggested-by: Toke H=C3=B8iland-J=C3=B8rgensen <toke@redhat.com>
> Signed-off-by: Avinash Duduskar <avinash.duduskar@gmail.com>

Reviewed-by: Toke H=C3=B8iland-J=C3=B8rgensen <toke@redhat.com>

