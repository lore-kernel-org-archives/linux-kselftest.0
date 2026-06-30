Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7602B3E8347
	for <linux-kselftest@vger.kernel.org>; Tue, 30 Jun 2026 10:00:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782813649; cv=none; b=eXsUDnmDJ6+gFQvbJqNnD9db63h0vZsmG7O4boTT6LsBVEtnO0gQSsQaS2MP0UNA94dBU+NvZrEd/AExzuHIO9H2/enybT07wVMsbZvh7FeheggDCT6ZT0sS671+F59LPIq5glretcW4RxUKx1JX7oFGtVzljn/d89I7ZouBGj4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782813649; c=relaxed/simple;
	bh=ekEo5LipZXYEpZ0QMIrZZq+nxmDsIJiQlfi8Av3DFSk=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:Message-ID:
	 MIME-Version:Content-Type; b=ER040e76WBS9yonpzgya97NPCM34h5V/Hw6Xpt1I2TTI8dDuKFzizpbFyu4htJ3ywtBmY/ja2XzJdrU/Ufo7zrRddWSvqGlMowLBY1dcsZrwkSw2kzd1n7BIfR/+RDhfwhviQR/LGVN7Y86JyJjuSD8F4yf8VaoVUvtMmKCSgms=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=eC/cqAsc; dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.b=P7u9WppL; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="eC/cqAsc";
	dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.b="P7u9WppL"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1782813647;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=tefDvr2JHzbWEvM4BvoT6FRVVef0ZkWyx7gPNMbvFYo=;
	b=eC/cqAscQePQlMf/xlYzTn7uTRg7EetoGDKMCSP8ZBom3HyPY2UMDp1iqk66kvCXAO/v1V
	k3atPUSmTz08OAatfQ1klM7hBJy4LE4R0pHFdTNm9tcVJ3G3YJjxZmeNDZgOE5E2LMkSgy
	/Ue8hxIvvga3Bo8OO/OCWu/NPbO8ztA=
Received: from mail-ej1-f72.google.com (mail-ej1-f72.google.com
 [209.85.218.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-663-Uyyshkm-NDGOjowrSljksA-1; Tue, 30 Jun 2026 06:00:46 -0400
X-MC-Unique: Uyyshkm-NDGOjowrSljksA-1
X-Mimecast-MFC-AGG-ID: Uyyshkm-NDGOjowrSljksA_1782813645
Received: by mail-ej1-f72.google.com with SMTP id a640c23a62f3a-c1273e18eebso164667866b.1
        for <linux-kselftest@vger.kernel.org>; Tue, 30 Jun 2026 03:00:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=redhat.com; s=google; t=1782813645; x=1783418445; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:references
         :in-reply-to:subject:cc:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=tefDvr2JHzbWEvM4BvoT6FRVVef0ZkWyx7gPNMbvFYo=;
        b=P7u9WppLkBb4rrfp1yN1yKpbuOHGh+y21mkW1u9yK6WEUwxyH6iZ7JpeOXX0WFCK0X
         xExGz0i+2LytbXcYM36Xc8kHJGwvT7R6WocbdeIcS4d0qh9zxiG70urYz4UiWQy/wc5F
         dKkYSjAli4QSqJz7VXDyJ++zqRYo9Be1YNcQ7wfPpLfjmEE99MalBp4HG3GDFUCfais1
         tl/PCbKKiucEmlgKK+BGKCtng4BbTdEdfN+LpLGgOtTzZeuozveQjicRs1ILN02zU/uv
         uQBq3Pa55qDYdDcUuS3oc4Sg0Le/qIkMRgAeIRg3WDiG6Zqe1oG92qoL++SpiakSOU+P
         vmFA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782813645; x=1783418445;
        h=content-transfer-encoding:mime-version:message-id:date:references
         :in-reply-to:subject:cc:to:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=tefDvr2JHzbWEvM4BvoT6FRVVef0ZkWyx7gPNMbvFYo=;
        b=HidRcjZJKPGFYw32AlkmhXVYzpNe2DJ4FHiprXaqBYC+oLWY3uxQRM8DuG+WvRUHf3
         3vUzOJ1EGqO7FsqAXDgGCUdmqVZ3poLljRZ2p1Z/+ojQ7aapGqXGYjkIqJ6N48zaWKRf
         t3Om+97hPXdllQ3eYn2IodgY8x1nvwcTcyrGxxu+M9iCBabt0tu0o9Y+6Z896/tDI2yN
         ypWmRZ8bknlMIPqggnFj/x85krvrijWpW/GSWKMig4jAPWb27+TrF7gUlXe1PRzTW6ty
         Zg/NW22F6WsQQYx4A93wVB0qXfE8hGl/56ZoOOKxQUbMIuWAY3awLhdFLH+ZrgcpHM2j
         b0tg==
X-Forwarded-Encrypted: i=1; AHgh+RrieLYIVUafDcMxPG7x4S5FQBZwSz9KvITGXGw3rMRurk7xR8v2Dg+IID2PJYfUIgUA0TTV4Z9PQjh6UQpg1jQ=@vger.kernel.org
X-Gm-Message-State: AOJu0YxBKxyfgt6qCIwT5fpxK3VkesxgZHE3yCBgzbmXk9iUSm6b+ooD
	EhSPBDPL2F91cv7nKZv2v00rHDpRZyYDDL1XwrinvV96mVVv88Ze3YRC27UCotISxm10V71R1e3
	tNJKVdAHN91MoG5k+305j1h1k6kyirF9Es5ybXcmBsUsehoIHWZpxt5PuN2CvYQyTEOs+aw==
X-Gm-Gg: AfdE7cm1AbJ915KVMKa31zb79T7bDOAV3HTS/3UYrvVxyPONldxuqpdqrvCkkOsgciK
	dkF9fHJwkKO/Lrc31xHNtIyL38n+YnJW/20j9+r7SEpqXka0pDpfLsWWJvhmjDPdwHkL5PUuNxP
	kefNYKvdAh+aQF3SFlZtt5M/rqCfyzOvmQJeu7c96O/lpm709X0e2f+LujE1LKIHoYTzvMnKQhP
	RXgB+flfq8K3qNkKAhvYiUVVGTOleWebgac9S4xiVrcG3UNgem9pKrej5RxuTdqKnIns6XgqCso
	A7NdcpnnIOXS+Z4aLmomDDgX5LOFDBR9I3nf+dLWifses1qjF+4QHXwJGNRlDqcL98YdSpcgZbg
	kG+ped92nHo+qNG50TmKkpcCkugtcUMlYBSs=
X-Received: by 2002:a17:907:97d2:b0:c07:fcdd:7043 with SMTP id a640c23a62f3a-c1287168408mr137279066b.16.1782813644584;
        Tue, 30 Jun 2026 03:00:44 -0700 (PDT)
X-Received: by 2002:a17:907:97d2:b0:c07:fcdd:7043 with SMTP id a640c23a62f3a-c1287168408mr137275166b.16.1782813644021;
        Tue, 30 Jun 2026 03:00:44 -0700 (PDT)
Received: from alrua-x1.borgediget.toke.dk ([45.145.92.2])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c1288d1abbdsm98502166b.9.2026.06.30.03.00.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 30 Jun 2026 03:00:43 -0700 (PDT)
Received: by alrua-x1.borgediget.toke.dk (Postfix, from userid 1000)
	id A672D80A53A; Tue, 30 Jun 2026 12:00:42 +0200 (CEST)
From: Toke =?utf-8?Q?H=C3=B8iland-J=C3=B8rgensen?= <toke@redhat.com>
To: David Ahern <dsahern@kernel.org>, Avinash Duduskar
 <avinash.duduskar@gmail.com>, ast@kernel.org, daniel@iogearbox.net,
 andrii@kernel.org
Cc: eddyz87@gmail.com, memxor@gmail.com, martin.lau@linux.dev,
 song@kernel.org, yonghong.song@linux.dev, jolsa@kernel.org,
 emil@etsalapatis.com, john.fastabend@gmail.com, sdf@fomichev.me,
 davem@davemloft.net, edumazet@google.com, kuba@kernel.org,
 pabeni@redhat.com, horms@kernel.org, shuah@kernel.org, hawk@kernel.org,
 yatsenko@meta.com, leon.hwang@linux.dev, kpsingh@kernel.org,
 a.s.protopopov@gmail.com, ameryhung@gmail.com, rongtao@cestc.cn,
 eyal.birger@gmail.com, bpf@vger.kernel.org, netdev@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-kselftest@vger.kernel.org
Subject: Re: [PATCH bpf-next v5 1/3] bpf: Add BPF_FIB_LOOKUP_VLAN flag to
 bpf_fib_lookup() helper
In-Reply-To: <2ffa32dd-5c88-488a-aa23-deef13465eb9@kernel.org>
References: <20260624030530.3342884-1-avinash.duduskar@gmail.com>
 <20260624030530.3342884-2-avinash.duduskar@gmail.com>
 <d820adf6-4a33-45e9-9cfa-17f11a37c9e8@kernel.org> <87se65bd04.fsf@toke.dk>
 <2ffa32dd-5c88-488a-aa23-deef13465eb9@kernel.org>
X-Clacks-Overhead: GNU Terry Pratchett
Date: Tue, 30 Jun 2026 12:00:42 +0200
Message-ID: <87echobb5h.fsf@toke.dk>
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable

David Ahern <dsahern@kernel.org> writes:

> On 6/29/26 9:08 AM, Toke H=C3=B8iland-J=C3=B8rgensen wrote:
>> David Ahern <dsahern@kernel.org> writes:
>>=20
>>> On 6/23/26 9:05 PM, Avinash Duduskar wrote:
>>>> diff --git a/include/uapi/linux/bpf.h b/include/uapi/linux/bpf.h
>>>> index 89b36de5fdbb..e00f0392e728 100644
>>>> --- a/include/uapi/linux/bpf.h
>>>> +++ b/include/uapi/linux/bpf.h
>>>> @@ -3532,6 +3532,29 @@ union bpf_attr {
>>>>   *			Use the mark present in *params*->mark for the fib lookup.
>>>>   *			This option should not be used with BPF_FIB_LOOKUP_DIRECT,
>>>>   *			as it only has meaning for full lookups.
>>>> + *		**BPF_FIB_LOOKUP_VLAN**
>>>
>>> This flag should not be needed. Patches for vlan support were never
>>> submitted (I have them in some old branch). Since the vlan params are
>>> initialized to 0, no new flag should be needed. Besides, these are
>>> output parameters.
>>=20
>> There's no enforcement from the kernel side of the parameters being
>> zero, though? So we do need the flag for feature detection; unless we
>> expect applications to do that out of band? But then we'd need a
>> mechanism to do that which could be... the presence of the flag in the
>> ENUM (and thus in BTF)? :)
>>=20
>
> This is output direction - return from the fib lookup.

Ah, right, silly me.

> It does not make sense to require a flag to get lookup output. vlan
> proto of 0 is not valid, so it is a clear indication that the vlan
> output parameters were not set during the lookup.

Okay, so we could just unconditionally set the VLAN fields, but if we
start rewriting the ifindex that would be a change of the existing
behaviour that could break existing applications, no?

Specifically, if an XDP application has a table of the interfaces it
forwards between, today they'd get a VLAN interface ifindex, which would
not be in that table, and the application would return XDP_PASS. Whereas
if we change the ifindex and populate the VLAN tag, suddenly the
interface would be in the table, but because the application doesn't
read the returned VLAN tag, it will end up sending packets out without
tagging them, leading to broken forwarding.

So if we don't want the flag, we'd need some other mechanism to resolve
the parent ifindex, AFAICT? Maybe a xdp_get_parent_ifindex() kfunc, say?
That could also be made generic for other stacked interface types, I
suppose.

WDYT?

-Toke

