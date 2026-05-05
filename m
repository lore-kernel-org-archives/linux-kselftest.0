Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7F8AE426EC8
	for <linux-kselftest@vger.kernel.org>; Tue,  5 May 2026 13:25:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777987512; cv=none; b=MmjB+qTV0tACuy518thk01C2f1CNWFT3cI68HNU67R2Ccr4DJnFQ7TPoVTsdEWlGiOHTRUcf4PuVF6bc6TXkiUKcBgoSL2ysOECKc/66z2WgLjkk/TA9ON3VQEGXGbzPrNkwyjEfiaQ2XpNvBnLY9qM/yXDlA497Gt5VGG+mkUQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777987512; c=relaxed/simple;
	bh=jjZLXZ3VotsREl0DsXpKQ2oakkN57MTZvYPzwH0Ls2k=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=c7qpkgOQCAAEM9wp7eW45aQrUGcXg7TR0cFf/aMbQCvr3BzNsyvtzFzKRstBuEMbFVKx7e74rziMr2aJgA0hA76MHZiBl0EsPKlOxyRoqjwVY9lcZ7QhQ8hX45WOInfaqRIgknMGOC8hUlpUJKOngcel/3oi4M0XWFQ3IyaIKoQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=F/rQKfw4; dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.b=RSbAZWNK; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="F/rQKfw4";
	dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.b="RSbAZWNK"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1777987510;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=NP4rX7b9FZY0fbLuEXjv0M/HU/D303qx0QGgZMGR6PY=;
	b=F/rQKfw44ND0UxQx4zU36JjWTX2WGK54KXd4A4bqIp5FoffPtt3lW0Eaq25SnZCCTEBb7N
	7a++H+y3H30vR+/cjFPmXQ87O/L4HnRM/kZvERp8pM1s+cFeeY2Xs1YouNz8WXcL7fvjqE
	TrGxeY3UaSvyY+isg+TxUhTlfmHfSw0=
Received: from mail-wm1-f72.google.com (mail-wm1-f72.google.com
 [209.85.128.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-365-ybxufkdxM820RUwoj5EsgA-1; Tue, 05 May 2026 09:25:09 -0400
X-MC-Unique: ybxufkdxM820RUwoj5EsgA-1
X-Mimecast-MFC-AGG-ID: ybxufkdxM820RUwoj5EsgA_1777987508
Received: by mail-wm1-f72.google.com with SMTP id 5b1f17b1804b1-488d8deb75fso44644605e9.3
        for <linux-kselftest@vger.kernel.org>; Tue, 05 May 2026 06:25:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=redhat.com; s=google; t=1777987508; x=1778592308; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=NP4rX7b9FZY0fbLuEXjv0M/HU/D303qx0QGgZMGR6PY=;
        b=RSbAZWNKOBtk1YZfL2WtNVTZ5LEzuj/UPWoewmvx11gZ+L+IvudxwavgNIgnsFPgf4
         lLFoJeDtBic3Qy81NlU3/mVEEYrsM+RfcPF1tUUWgW0HdMyVspLdQWGDpPu0/CtJFHr3
         h7V0jgDr8uhOxwKrgxatkId2EKz5eMmshuH1NDFcZD+p63i1gLydhdbzjQtVlKkpc5dS
         RO2aShSCW/ANHQtIecEmGo2NFFCRI0S7WaT/1jhGQNFEfDO6OopMrzvl7a+52tQY+iyO
         cqzaz09TbTcAzvFkIgoEayXeBMZCBj4GW3Nt87sF0cS+6Xi9trzBOsjDd7abXp5OpERa
         bp5g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777987508; x=1778592308;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=NP4rX7b9FZY0fbLuEXjv0M/HU/D303qx0QGgZMGR6PY=;
        b=ZSauxgpaCCqqkkzE116uXK/EtlnywcXDsf362gF7ywf2emsUsw5CINbjAcQ7dhQwg3
         rs0cLryEgSL5TEESR4P3iiOUDAFqIJONrFklzFlmi6uLMvNSr0/HVy2xQVDkLfPQjcwo
         XrO2LcMC34G+8sQJbTvkVvB0jk/tqd9ofqp5Q/iFNxQZIoN1ipClIHbxaIO+mllj4tjU
         auAYWrhC9QSDXdy42LGqHC84KSXznrrzgLCaGTKIpwkzcDHaFkqg/xolQA7aZpSY9ObU
         33E7LDr351FqxnT9lcxwmX+xbjniTHksNX7OuxgpEhFJC5W5PKR+EFv8q5Ku5OcEefGP
         GkEw==
X-Forwarded-Encrypted: i=1; AFNElJ9SOEfoc7Cat8jC1CcHE1aSyOYftxmpL1NkSykVXXXxzqhJtC+wj2HvKUkCpLhvBsgt/zA2wrqVsWFdtxt6qhM=@vger.kernel.org
X-Gm-Message-State: AOJu0YyldRaLOIqpaOs3LAAvTDjT66RbwI6bDuhzfDl59H4bL3/5T5La
	UhrTIMkKJYKY1bhqteiXAB01bioq2Xi/HnsQSKz9cfVekJSSWTVUIolpxwbsZJ7d+UC/3Omjkbz
	WVZ3h1iVQTvjAJ1WI87m2VTu6CGxMh7kejU4nNnHv0Y9qRYTiVzSWI4kRJ5LQG1ilPM4blQ==
X-Gm-Gg: AeBDiesS3UwjIS3X1RBThJY/45DmgyKLvSRfT9N4XA+w09wOfY7/FPEqnxRSrxUPcb/
	OFSYiOI2VHnYuB3cvIrVSvK5hj0c2XPngZ4DRoU8t1EC6cw21hUzMbAnAw+HpO/fz9DZGirBDKR
	CN6zi90CFTinYvAWSBbbEhpkooML7KtpN990VW08sDR6wqUZw/fJKUTTBk9yz/yOvAaNdmYK494
	rTdJxJHZUdHFfARTo4Lli9Ta2mLVN4LPFhbx8YgKiPMGOiaCE1BivKSK+f2r3IfT9b4UjXvulE6
	/TTRxd3YqDvzMY8L2HPKlQ+3mbxcH+ijtQDB+P9AdwIgZzEGA2Sv8ZsLAbkcdvyYnb6F1jgpoX6
	CreqfsrYku1tMSkHAdWQYPY1Y3WdJ1wE/WcjRMdN1OegxGGb6rd6+tFLfwtmhpqs+DrI=
X-Received: by 2002:a05:600c:4f47:b0:488:b8bc:6a32 with SMTP id 5b1f17b1804b1-48a988be27dmr259135665e9.23.1777987507830;
        Tue, 05 May 2026 06:25:07 -0700 (PDT)
X-Received: by 2002:a05:600c:4f47:b0:488:b8bc:6a32 with SMTP id 5b1f17b1804b1-48a988be27dmr259134965e9.23.1777987507268;
        Tue, 05 May 2026 06:25:07 -0700 (PDT)
Received: from [192.168.88.32] ([212.105.155.47])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-48a82308d77sm464849375e9.14.2026.05.05.06.25.05
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 05 May 2026 06:25:06 -0700 (PDT)
Message-ID: <0f5da49c-7ed6-4547-9f89-bb3c3d62c3c3@redhat.com>
Date: Tue, 5 May 2026 15:25:05 +0200
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH net v2 2/2] selftests: openvswitch: add tests for tunnel
 vport refcounting
To: Ilya Maximets <i.maximets@ovn.org>, netdev@vger.kernel.org
Cc: Aaron Conole <aconole@redhat.com>, Eelco Chaudron <echaudro@redhat.com>,
 "David S. Miller" <davem@davemloft.net>, Eric Dumazet <edumazet@google.com>,
 Jakub Kicinski <kuba@kernel.org>, Simon Horman <horms@kernel.org>,
 Shuah Khan <shuah@kernel.org>, Yuan Tan <tanyuan98@outlook.com>,
 Yang Yang <n05ec@lzu.edu.cn>, dev@openvswitch.org,
 linux-kernel@vger.kernel.org, linux-kselftest@vger.kernel.org
References: <20260430233848.440994-1-i.maximets@ovn.org>
 <20260430233848.440994-3-i.maximets@ovn.org>
Content-Language: en-US
From: Paolo Abeni <pabeni@redhat.com>
In-Reply-To: <20260430233848.440994-3-i.maximets@ovn.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 5/1/26 1:38 AM, Ilya Maximets wrote:
> @@ -830,6 +831,42 @@ test_tunnel_metadata() {
>  	return 0
>  }
>  
> +test_tunnel_refcount() {
> +	sbxname="test_tunnel_refcount"
> +	sbx_add "${sbxname}" || return 1
> +
> +	ovs_sbx "${sbxname}" ip netns add trefns || return 1
> +	on_exit "ovs_sbx ${sbxname} ip netns del trefns"
> +
> +	for tun_type in gre vxlan geneve; do
> +		info "testing ${tun_type} tunnel vport refcount"
> +
> +		ovs_sbx "${sbxname}" ip netns exec trefns \
> +			python3 $ovs_base/ovs-dpctl.py \
> +			add-dp dp-${tun_type} || return 1
> +
> +		ovs_sbx "${sbxname}" ip netns exec trefns \
> +			python3 $ovs_base/ovs-dpctl.py \
> +			add-if --no-lwt -t ${tun_type} \
> +			dp-${tun_type} ovs-${tun_type}0 || return 1
> +
> +		ovs_wait ip -netns trefns link show \
> +			ovs-${tun_type}0 >/dev/null 2>&1 || return 1
> +
> +		info "deleting dp - may hang if reference counting is broken"
> +		ovs_sbx "${sbxname}" ip netns exec trefns \
> +			python3 $ovs_base/ovs-dpctl.py \
> +			del-dp dp-${tun_type} &
> +
> +		dev_removed() {
> +			! ip -netns trefns link show "$1" >/dev/null 2>&1
> +		}
> +		ovs_wait dev_removed dp-${tun_type} || return 1
> +		ovs_wait dev_removed ovs-${tun_type}0 || return 1

FTR, here sashiko laments that if the reference counting is broken and
the del-dp process hangs, this could leave the background del-dp python
process running indefinitely.

I guess that if reference counting is broken inside the kernel, very
likely an host/VM reboot is needed, and the above does not matter.

/P

